unit IQMS.WebVcl.AppDef;

{ Example:
=============================================================================================
AppDef1 := TIQWebAppDef.Create('Quote', 'Injection');

For Functions:
--------------
   A := AppDef1.Execute( 'Func_X', [NUL] ).AsInteger;                  // no params, return integer
   B := AppDef1.Execute( 'Func_Y', [ Table1ID.asFloat ] ).AsFloat;     // some params, return float

For Procedures:
---------------
1) AppDef1.Execute( 'Proc_X', [NULL] );
   AppDef1.Execute( 'Proc_Y', [ Table1ID.asFloat ] );

2) If procedure returns something in passed parameter:
   AppDef1.Execute( 'Proc_X',  [ Table1ID.asFloat ] ).ParamByName('v_myparam').asFloat

   or
   AppDef1.Execute( 'Proc_X',  [ Table1ID.asFloat ] ).Params[ 0 ].asFloat;

   in case of index 0 (as above) it's the same as calling
   AppDef1.Execute( 'Proc_X',  [ Table1ID.asFloat ] ).asFloat;
========================================================================================

DataStructure:  TStringList with Objects.

object_name  (= proc/func name)     object_name  (= proc/func name)     object_name  (= proc/func name)
-------------------------------     ------------------------------      -------------------------------
    package_name                        package_name                        package_name
    argument_name                       argument_name                       argument_name
    position                            position                            position
    in_out                              in_out                              in_out
    data_type                           data_type                           data_type

Example:
LBSK                    LBSK                    MyProcedure                  MyProcedure
-----------------       -----------------       ----------------             --------------
   'appdef_quote'          'appdef_quote'          'appdef_quote_injection'     'appdef_quote_injection
   '            '          'v_quote_id'            'v_my_param1'                'v_my_param2
   0                       1                       1                            2
   'OUT'                   'IN'                    'IN'                         'IN'
   'NUMBER'                'NUMBER'                'VARCHAR2'                   'VARCHAR2'
}

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Vcl.DBCtrls, System.SyncObjs, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Stan.Param, FireDAC.Phys,
  FireDAC.Phys.Intf, FireDAC.DatS, FireDAC.DApt, FireDAC.DApt.Intf,
  FireDAC.UI.Intf;

const
  INJECTION = 'INJECTION';

type
  TNotifyMfgTypeChange = procedure( Sender:TObject ) of object;
  TNotifySetMfgType = procedure( Sender:TObject; var Value: string ) of object;

type
  TIQWebAppDef = class( TComponent )
    private
      FStable     : Boolean;
      FDataLink   : TFieldDataLink;
      FAppCode    : string;
      FMfgType    : string;
      FStoredProc : TFDStoredProc;
      FProcsList  : TStringList;
      CurrRecIndex: Integer;
      FAfterMfgTypeChanged:TNotifyMfgTypeChange;
      FBeforeMfgTypeChanged:TNotifyMfgTypeChange;
      FOnSetMfgType: TNotifySetMfgType;
      FLookUpMfgType: string;

      function GetDataField:string;
      procedure SetDataField( AValue:string );
      function GetDataSource : TDataSource;
      procedure SetDataSource( AValue:TDataSource );
      procedure DataChange( Sender: TObject );

      function GetAsFloat: Double;
      function GetAsString:string;
      function GetAsInteger:Integer;
      function GetAsDateTime:TDateTime;

      procedure SetAppCode( AValue:string );
      procedure SetMfgType( AValue:string );
      function GetParamByIndex( I:Integer ): TFDParam;
      function GetPackageProcedureName:string;
      function GetOraParamName:string;
      function GetOraParamType:TParamType;
      function GetOraFieldType:TFieldType;

      procedure AssignProcList;
      function GetFirstRecIndex( const AProcName: string ):Integer;
      function GetNextRecIndex( CurrentIndex : Integer ):Integer;
      procedure DeleteProcList;
      function GetPackageName: string;
      function GetProcedureName: string;

    protected
      property PackageProcedureName:string read GetPackageProcedureName;
      property OraParamName: string read GetOraParamName;
      property OraParamType: TParamType read GetOraParamType;
      property OraFieldType:TFieldType read GetOraFieldType;
      property PackageName:string read GetPackageName;
      property ProcedureName:string read GetProcedureName;
                                      
    public
      constructor Create( AOwner:TComponent ); override;
      destructor Destroy; override;
      function Execute( const AProcName : string; Args : array of const ):TIQWebAppDef;
      function ParamByName(const Value: string): TFDParam;
      procedure Refresh;

      property AsFloat   : Double read GetAsFloat;
      property AsString  : string read GetAsString;
      property AsInteger : Integer read GetAsInteger;
      property AsDateTime: TDateTime read GetAsDateTime;
      property Params[ I:Integer ]:TFDParam read GetParamByIndex;
      property Stable:Boolean read FStable;
      property MfgType   : string read FMfgType write SetMfgType;
      property LookupMfgType: string read FLookupMfgType;
      property OnSetMfgType: TNotifySetMfgType read FOnSetMfgType write FOnSetMfgType;

    published
      property AppCode   : string read FAppCode  write SetAppCode ;
      property DataField : string read GetDataField write SetDataField;
      property DataSource: TDataSource read GetDataSource write SetDataSource;
      property AfterMfgTypeChanged: TNotifyMfgTypeChange read FAfterMfgTypeChanged write FAfterMfgTypeChanged;
      property BeforeMfgTypeChanged: TNotifyMfgTypeChange read FBeforeMfgTypeChanged write FBeforeMfgTypeChanged;
  end;


implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils,
  IQMS.Common.MfgShare,
  Variants,
  IQMS.WebVcl.ResourceStrings;

type
  TProcCargo = class
    package_name : string;
    argument_name: string;
    position     : string;
    in_out       : string;
    data_type    : string;
    constructor Create( const Apackage_name,Aargument_name,Aposition,Ain_out,Adata_type: string );
  end;


{ TProcCargo }

constructor TProcCargo.Create( const Apackage_name,Aargument_name,Aposition,Ain_out,Adata_type: string );
begin
  package_name := Apackage_name ;
  if Aargument_name = '*' then
     argument_name := ''
  else
     argument_name := Aargument_name;
  position     := Aposition     ;
  in_out       := Ain_out       ;
  data_type    := Adata_type    ;
end;

{ TIQWebAppDef }

constructor TIQWebAppDef.Create( AOwner:TComponent );
begin
  inherited;
  FAppCode := '';
  FMfgType := '';
  FLookUpMfgType := '';
  FStoredProc := TFDStoredProc.Create( self );
//  with FStoredProc do
//  begin
//    Connection := db_dm.FDConnection;
//    // ParamBindMode := pbByNumber;
//  end;
  FProcsList := TStringList.Create;
  FDataLink := TFieldDataLink.Create;
end;

destructor TIQWebAppDef.Destroy;
begin
  FDataLink.OnDataChange := NIL;
  FDataLink.Free;
  if Assigned( FStoredProc ) then
     FStoredProc.Free;
  DeleteProcList;
  FProcsList.Free;
  inherited;
end;

procedure TIQWebAppDef.DeleteProcList;
var
  I:Integer;
begin
  if Assigned( FProcsList ) then with FProcsList do
  begin
    for I := Count - 1 downto 0 do Objects[ I ].Free;
    Clear;
  end;
end;

procedure TIQWebAppDef.AssignProcList;
var
  AGenericPackageName : string;
  AStandardPackageName: string;
  AActualPackageName  : string;
begin
  AGenericPackageName := '';
  AStandardPackageName := '*';
  AActualPackageName  := '';

  // default
  AGenericPackageName := Format('APPDEF_%s', [ AppCode ]);  // APPDEF_BOM

  // for user defined mfgtype check to see if standard_mfgtype is assigned and use it
  AStandardPackageName := Format('APPDEF_%s_%s', [ AppCode, FLookUpMfgType ]); // APPDEF_BOM_ASSY1

  // the actual package name if one should be defined
  AActualPackageName := Format('APPDEF_%s_%s', [ AppCode, FMfgType ]); // APPDEF_BOM_LIKE_ASSY1

  // delete the list
  DeleteProcList;

  // populate the list
  if (FAppCode <> '') and (FLookUpMfgType <> '') then
  with TFDQuery.Create(self) do
  try
    ConnectionName := 'IQFD';
    SQL.Add(        'select substr(package_name, 2) as package_name,                                          ');
    SQL.Add(        '       object_name,                                                                      ');
    SQL.Add(        '       argument_name,                                                                    ');
    SQL.Add(        '       position,                                                                         ');
    SQL.Add(        '       in_out,                                                                           ');
    SQL.Add(        '       data_type                                                                         ');
    SQL.Add(        '  from                                                                                   ');
    SQL.Add(        '      (select max( decode(package_name,                                                  ');
    SQL.Add(Format( '                   ''%s'', ''1'',                                                        ', [ AGenericPackageName  ]));  // 'APPDEF_BOM'
    SQL.Add(Format( '                   ''%s'', ''2'',                                                        ', [ AStandardPackageName ]));  // 'APPDEF_BOM_ASSY1'
    SQL.Add(Format( '                   ''%s'', ''3'', ''0'') || package_name) as package_name,               ', [ FixStr(AActualPackageName) ]));  // 'APPDEF_BOM_LIKE_ASSY1'
    SQL.Add(        '                   object_name,                                                          ');
    SQL.Add(        '                   NVL(argument_name,''*'') as argument_name,                            ');
    SQL.Add(        '                   position,                                                             ');
    SQL.Add(        '                   in_out,                                                               ');
    SQL.Add(        '                   data_type                                                             ');
    SQL.Add(        '              from all_arguments                                                         ');
    SQL.Add(        '             where owner = ''IQMS''                                                      ');
    SQL.Add(Format( '               and (package_name = ''%s''                                                ', [ AGenericPackageName ])); // APPDEF_BOM
    SQL.Add(        '                    OR                                                                   ');
    SQL.Add(Format( '                    package_name = ''%s''                                                ', [ AStandardPackageName])); // 'APPDEF_BOM_ASSY1'
    SQL.Add(        '                    OR                                                                   ');
    SQL.Add(Format( '                    package_name = ''%s'')                                               ', [ FixStr(AActualPackageName) ])); // 'APPDEF_BOM_LIKE_ASSY1'
    SQL.Add(        '             group by                                                                    ');
    SQL.Add(        '                   NVL(argument_name,''*''), object_name, position, in_out, data_type ) x');
    SQL.Add(        ' order by object_name, position                                                          ');
    Open;

    while not Eof do with FProcsList do
    begin
      AddObject( Fields[ 1 ].asString, TProcCargo.Create( Fields[ 0 ].asString,       //  package_name
                                                          Fields[ 2 ].asString,       //  argument_name
                                                          Fields[ 3 ].asString,       //  position
                                                          Fields[ 4 ].asString,       //  in_out
                                                          Fields[ 5 ].asString ));    //  data_type
      Next;
    end;

  finally
    Free;
  end;
end;

function TIQWebAppDef.Execute( const AProcName: string; Args : array of const ):TIQWebAppDef;
var
  I:Integer;
  P:TFDParam;
begin
  DataChange( self );

  if (FAppCode <> '') and (FLookUpMfgType <> '') then
  try
    CurrRecIndex := GetFirstRecIndex( AProcName );  {Find first entry in the list of procedures with the name = AProcName}
    with FStoredProc do
    begin
       ConnectionName := 'IQFD';
       Close;
       Params.Clear;
       FStoredProc.StoredProcName := '';
       FStoredProc.PackageName := '';

       FStoredProc.PackageName := self.PackageName;
       FStoredProc.StoredProcName := self.ProcedureName;

       Prepare;
       
       I := 0;
       while CurrRecIndex > -1 do
       begin
         P := nil;
         if Params.FindParam( OraParamName )<> nil then
            P := ParamByName( OraParamName );
                 
         if (OraParamName <> 'Result') and (I <= High( Args )) then with Args[ i ] do
         begin
           if Assigned(P) and (P.ParamType <> ptOutput) then
           case VType of
             vtInteger      : with P do Value    := VInteger;
             vtInt64        : with P do Value    := vtInt64;
             vtExtended     : with P do Value    := VExtended^;
             vtCurrency     : with P do Value    := VCurrency^;
             vtAnsiString   : with P do AsString := string(VAnsiString);
             vtUnicodeString: with P do AsString := string(VUnicodeString);
             vtWideString   : with P do AsString := string(VUnicodeString);
             vtChar         : with P do AsString := string(VChar);
           end;           
           Inc(I);
         end;

         CurrRecIndex := GetNextRecIndex( CurrRecIndex );
       end;
       
       ExecProc;
    end
  except on E:Exception do
    begin
       IQError(Format('Failed to AppDef: %s'+#13#13+'AppCode = %s, MfgType = %s, ProcName = %s', [E.Message, AppCode, MfgType, AProcName ]));
       ABORT;
    end;
//    raise E;
  end;

  Result := self;  {allows this:  Execute( 'Func_X', [ 1, 2 ] ).AsFloat }
end;

{Find first entry in the list of procedures with the name = AProcName}
function TIQWebAppDef.GetFirstRecIndex( const AProcName: string ):Integer;
begin
  Result := FProcsList.IndexOf( UpperCase( AProcName ));
  if Result = -1 then
    raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000001 {'Procedure not found.'} );
end;

function TIQWebAppDef.GetNextRecIndex( CurrentIndex : Integer ):Integer;
begin
  Result := CurrentIndex + 1;
  if Result > FProcsList.Count - 1 then
     Result := -1
  else
     if FProcsList[ Result ] <> FProcsList[ CurrentIndex ] then
        Result := -1;
end;


function TIQWebAppDef.GetOraParamName:string;
begin
  with FProcsList.Objects[ CurrRecIndex ] as TProcCargo do
    Result := argument_name;
  if Result = '' then
     Result := 'Result';
end;

function TIQWebAppDef.GetOraParamType:TParamType;
begin
  with FProcsList.Objects[ CurrRecIndex ] as TProcCargo do
  if in_out = 'IN' then
     Result := ptInput
  else if in_out = 'IN/OUT' then
     Result := ptInputOutput
  else if GetOraParamName = 'Result' then
     Result := ptResult
  else
     Result := ptOutput;
end;

function TIQWebAppDef.GetOraFieldType:TFieldType;
begin
  with FProcsList.Objects[ CurrRecIndex ] as TProcCargo do
  if data_type = 'NUMBER' then
     Result := ftFloat
  else if data_type = 'FLOAT' then
     Result := ftFloat
  else if data_type = 'VARCHAR2' then
     Result := ftString
  else if data_type = 'CHAR' then
     Result := ftString
  else if data_type = 'DATE' then
     Result := ftDateTime
  else
     Result := ftFloat;
end;

function TIQWebAppDef.GetPackageName: string;
begin
  Result := (FProcsList.Objects[ CurrRecIndex ] as TProcCargo).package_name;
end;

function TIQWebAppDef.GetPackageProcedureName:string;
begin
  //Result := Format( '%s.%s', [ (FProcsList.Objects[ CurrRecIndex ] as TProcCargo).package_name,
  //                             FProcsList[ CurrRecIndex ]  ]); // 'QUOTE_INJECTION.LBSK'

  Result := Format( '%s.%s', [ PackageName, ProcedureName ]); // 'QUOTE_INJECTION.LBSK'
end;

procedure TIQWebAppDef.SetAppCode( AValue:string );
begin
  if FAppCode <> AValue then
  begin
    FAppCode := UpperCase( AValue );
    AssignProcList;
  end;
end;

procedure TIQWebAppDef.SetMfgType( AValue:string );
begin
  if AValue = '' then
     AValue := INJECTION
  else
     AValue := UpperCase( AValue );

  if FMfgType <> AValue then
  begin
    if Assigned(FBeforeMfgTypeChanged) then
       FBeforeMfgTypeChanged( self );

    // used for display or reference outside the object. This is the true mfgtype right from the database
    FMfgType := AValue;
    // this is what we use to get to the correct AppDef package. normally as above but in case such as user defined mfgtype we need to revert to GENERIC.
    FLookUpMfgType := Lookup_MfgType( AValue );

    if Assigned(FOnSetMfgType) then
       FOnSetMfgType( self, FLookUpMfgType );  // 04-10-2008 provide a chance to examine the value being assigned and adjust it. See comment above inre to user define mfgtype

    AssignProcList;

    if Assigned(FAfterMfgTypeChanged) then
       FAfterMfgTypeChanged( self );
  end;
end;

function TIQWebAppDef.GetParamByIndex( I:Integer ): TFDParam;
begin
  with FStoredProc do
    Result := Params[ I ];
end;

function TIQWebAppDef.GetProcedureName: string;
begin
  Result := FProcsList[ CurrRecIndex ]
end;

function TIQWebAppDef.ParamByName(const Value: string): TFDParam;
begin
  with FStoredProc do
    Result := ParamByName( Value );
end;

function TIQWebAppDef.GetAsFloat:Double;
begin
  with FStoredProc do
    Result := Params[ 0 ].asFloat
end;

function TIQWebAppDef.GetAsString:string;
begin
  with FStoredProc do
    Result := Params[ 0 ].asString;
end;

function TIQWebAppDef.GetAsInteger:Integer;
begin
  with FStoredProc do
    Result := Params[ 0 ].asInteger
end;

function TIQWebAppDef.GetAsDateTime:TDateTime;
begin
  with FStoredProc do
    Result := Params[ 0 ].asDateTime
end;

function TIQWebAppDef.GetDataField:string;
begin
  if Assigned(FDataLink) then
    Result := FDataLink.FieldName
  else
    Result := '';
end;

procedure TIQWebAppDef.SetDataField( AValue:string );
begin
  FDataLink.FieldName := AValue;
end;

function TIQWebAppDef.GetDataSource : TDataSource;
begin
  if Assigned(FDataLink) then
    Result := FDataLink.DataSource
  else
    Result := nil;
end;

procedure TIQWebAppDef.SetDataSource( AValue:TDataSource );
begin
  FDataLink.DataSource := AValue;
end;

procedure TIQWebAppDef.DataChange( Sender: TObject );
begin
  if Assigned(DataSource) and (DataField <> '') then
     MfgType := DataSource.DataSet.FieldByName( DataField ).asString;   // FDataLink.Field.asString;
end;

procedure TIQWebAppDef.Refresh;
begin
  if Assigned(DataSource) and (DataField <> '') then
     MfgType := DataSource.DataSet.FieldByName( DataField ).asString;
end;

end.

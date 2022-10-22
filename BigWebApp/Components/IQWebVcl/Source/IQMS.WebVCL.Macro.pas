unit IQMS.WebVcl.Macro;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DB,
  IQMS.WebVcl.Time,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys;

type
  TIQWebSqlMacro = class(TComponent)
  private
    { Private declarations }
    FSQLTable: TFileName;
    FPRMTable: TFileName;
    FSQLFieldName: String;
    FSqlStat :String;
    FTEMP_TS_ID :Real;
    procedure SetSQLTableName(const Value: TFileName);
    procedure SetPRMTableName(const Value: TFileName);
    procedure SetSQLFieldName(const Value: String);
    procedure SetTEMP_TS_ID(const Value: Real);
    function  LocateDataSet( AFormName, ComponentName: string ) : TDataSet;
  protected
    { Protected declarations }
  public
    { Public declarations }
     constructor Create( AOwner:TComponent ); override;
     function GetSqlString(AID:Real; DB:String = 'IQFD'):String;
     function GetSqlValue(ADebug:Boolean; AIqTiming:TIQWebTiming; AID:Real; ASql:String = ''; DB:String = 'IQFD'):String;
  published
    { Published declarations }
    property TEMP_TS_ID:Real read FTEMP_TS_ID write SetTEMP_TS_ID;
    property SQLTable: TFileName read FSQLTable write SetSQLTableName;
    property PRMTable: TFileName read FPRMTable write SetPRMTableName;
    property SQLFieldName: String read FSQLFieldName write SetSqlFieldName;
  end;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.StringUtils,
  IQMS.WebVcl.ResourceStrings,
  IQMS.Common.DataConst;

constructor TIQWebSqlMacro.Create( AOwner:TComponent );
begin
  inherited Create( AOwner );
end;

procedure TIQWebSqlMacro.SetSQLTableName(const Value: TFileName);
begin
  if csReading in ComponentState then
    FSQLTable := Value
  else if (FSQLTable <> Value) then
    FSQLTable := Value;
end;

procedure TIQWebSqlMacro.SetPRMTableName(const Value: TFileName);
begin
  if csReading in ComponentState then
    FPRMTable := Value
  else if (FPRMTable <> Value) then
    FPRMTable := Value;
end;

procedure TIQWebSqlMacro.SetSQLFieldName(const Value: String);
begin
  FSQLFieldName := Value;
end;

procedure TIQWebSqlMacro.SetTEMP_TS_ID(const Value: Real);
begin
  FTEMP_TS_ID := Value;
end;


function TIQWebSqlMacro.GetSqlString(AID:Real; DB:String = 'IQFD'):String;
begin
  with TFDTable.Create(self) do
  try
    ConnectionName :=  cnstFDConnectionName;  // IQMS.Common.DataConst
    TableName := FSQLTable;
    Open;
    if Locate('ID', AID, [])
      then Result := FieldByName(FSQLFieldName).asString
    else raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000147 {'Could not locate SQL statement'});
  finally
    Free;
  end;
  FSqlStat := Result;
end;

function TIQWebSqlMacro.GetSqlValue(ADebug:Boolean; AIqTiming:TIQWebTiming; AID:Real; ASql:String = ''; DB:String = 'IQFD'):String;
var
  MainQry:TFDQuery;
  DS:TDataSet;
  AFormName, ADataSet, AParamName, ADataSetFieldName, AToken_Code, AUniqueCode:String;
  ASqlText:String;
  ACount:Integer;
  I:Integer;
  AQry :TFDQuery;
  AParam:String;
begin
  Result := '';
  try
    try
      MainQry := TFDQuery.Create(nil);
      MainQry.ConnectionName :=  cnstFDConnectionName;
      
      if ASql <> '' then
        MainQry.Sql.Add(ASql)
      else
        MainQry.Sql.Add(FSqlStat);

      ASqlText := MainQry.Sql.Text;
      AQry := TFDQuery.Create(nil);
      with AQry do
      try
        AQry.ConnectionName :=  cnstFDConnectionName;
        Sql.Add(IQFormat('select * from %s where %s_id = %f order by seq',
                        [FPRMTable, FSQLTable, AID]));
        Open;

        if (MainQry.ParamCount > 0) then
        begin
          if Eof then
             raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000148 {'No parameter records defined in Segment Params Table.'});

          while not eof do
          begin
            AFormName := FieldByName('FORM_NAME').asString;
            ADataSet  := FieldByName('PARAM_DATASET').asString;
            AParamName := FieldByName('PARAM_NAME').asString;
            ADataSetFieldName := FieldByName('DATASET_FIELD_NAME').asString;
            if FSQLTable = 'SEGMENT_TOKENS' then
            begin
               AToken_Code := SelectValueFmtAsString('select s.token_code || '' ('' || m.seq || '')'' ' +
               ' from segment_tokens s, master_segments m where s.id = %f and s.master_segments_id = m.id', [AId], DB);

               AUniqueCode := SelectValueFmtAsString('select s.id || '' '' || m.transaction_set_unique_id || '' '' || s.token_code || '' ('' || m.seq || '')'' ' +
               ' from segment_tokens s, master_segments m where s.id = %f and s.master_segments_id = m.id', [AId], DB);
            end;

            DS := LocateDataSet( FieldByName('FORM_NAME').asString, FieldByName('PARAM_DATASET').asString );

            with MainQry.ParamByName(FieldByName('PARAM_NAME').asString) do
            begin
              DataType:= DS.FieldByName(FieldByName('DATASET_FIELD_NAME').asString).DataType;
                AsString := DS.FieldByName(FieldByName('DATASET_FIELD_NAME').asString).asString;
            end;

            if (UpperCase(ADataSet) = 'TBLTEMPTS') and (UpperCase(ADataSetFieldName) = 'ID') then
              with MainQry.ParamByName(FieldByName('PARAM_NAME').asString) do
                AsString := FloatToStr(FTEMP_TS_ID);

            if Copy(UpperCase(TrimLeft(MainQry.Sql.Text)), 1, 6) <> 'SELECT' then
            begin
              if MainQry.ParamByName(FieldByName('PARAM_NAME').asString).asString = '' then
                AParam := 'null'
              else
                AParam := MainQry.ParamByName(FieldByName('PARAM_NAME').asString).asString;
              MainQry.Sql.Text := StrTran(MainQry.Sql.Text,
                                          ':' + FieldByName('PARAM_NAME').asString,
                                          AParam);
            end;

            Next;
          end;
        end;
      finally
        Free;
      end;

      MainQry.Sql.Text := TrimLeft(MainQry.Sql.Text);
      ExecuteCommand('begin edi_misc.arr_clear; end;', DB);

      ExecuteCommand('begin EDI.V_EDI_String ::= ''''; end;', DB);

      if ADebug then
        AIqTiming.Start(AUniqueCode);

      if Copy(UpperCase(MainQry.Sql.Text), 1, 6) = 'SELECT' then
      begin
        MainQry.Open;
        Result := MainQry.Fields[0].asString;
      end
      else
      begin
        ExecuteCommand(MainQry.Sql.Text, DB);
        Result := SelectValueAsString('select EDI.EDI_String from dual', DB);
      end;


      if ADebug then
        AIqTiming.Stop(AUniqueCode);

      if Trim(Result) = 'USE_ARRAY' then
      begin
        Result := '';
        ACount := Trunc(SelectValue('select edi_misc.arr_count from dual', DB));
        for I := 1 to ACount do
          Result := Result + SelectValueFmtAsString('select edi_misc.arr_get(%d) from dual', [I], DB);
      end;

    except on e:exception do
      begin
        {'Error %s'#13 +
         'Token Code          %s'#13 +
         'Form Name           %s'#13 +
         'DataSet             %s'#13 +
         'Parameter           %s'#13 +
         'Data Set Field Name %s'#13 +
         'SQL : %s'#13}
        raise Exception.Create(Format( IQMS.WebVcl.ResourceStrings.cTXT0000149,
                                      [e.message, AToken_Code, AFormName, ADataSet, AParamName,
                                       ADataSetFieldName, ASqlText]));
      end;
    end;

  finally
    MainQry.Free;
  end;
end;


function TIQWebSqlMacro.LocateDataSet( AFormName, ComponentName: string ) : TDataSet;
begin
  try
    Result:= Owner.FindComponent( ComponentName ) as TDataSet;
    if Result <> nil then
        EXIT;
    Result:= nil;
  finally
    if (Result <> nil) and (not (Result.State in [dsBrowse]))
      then Result.Open;
  end;

end;

end.

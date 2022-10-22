unit GLCreAcc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule;

type
  TCreateAccGroup = ( agCancel, agError, agOK );

function CreateAccountGroupsView:TCreateAccGroup;

type
  TCreateAccGroups = class
  private
    TblGLAccDef : TFDTable;
    DB          : TFDCustomConnection;
    procedure CheckEscape;
    procedure LoginAsIQMS;
    procedure OpenGLAccDef;
    procedure CheckHardCodedGroups;
    procedure SetIndexToSEQ;
    procedure CreateView;
    procedure CheckSynonym;
    procedure CheckGLRole;
    procedure CheckGLGrant;
    procedure CompileObjects;
  public
    ExecResult : TCreateAccGroup;
    function Execute:TCreateAccGroup;
    constructor Create;
    destructor Destroy; override;
end;

implementation

uses
  //WEBCONVERT IQGetPwd,
  IQMS.Common.DataLib;

const
//  GLDATABASENAME = 'IQ_GL';
  GLDATABASENAME = 'IQ';

function CreateAccountGroupsView:TCreateAccGroup;
begin
  with TCreateAccGroups.Create do
  try
    Result:= Execute;
  finally
    Free;
    Screen.Cursor:= crDefault;
  end;
end;

constructor TCreateAccGroups.Create;
begin
  inherited;
  ExecResult := agCancel;
  TblGLAccDef := TFDTable.Create(Application);
  DB := TFDConnection.Create(Application);
end;

destructor TCreateAccGroups.Destroy;
begin
  TblGLAccDef.Free;
  DB.Free;
  inherited;
end;

function TCreateAccGroups.Execute:TCreateAccGroup;
begin
  try
    try
//      CheckEscape;
//      LoginAsIQMS;
      OpenGLAccDef;
      CheckHardCodedGroups;
      SetIndexToSEQ;
      CreateView;
      CheckSynonym;
      CheckGLrole;
      CheckGLgrant;
      ExecResult:= agOK;
    except
      on E:EAbort do
         ExecResult:= agCancel;
      on E:Exception do
      begin
         ExecResult:= agError;
         Application.ShowException( E );
      end;
    end;
  finally
    Result:= ExecResult;
  end;
end;

procedure TCreateAccGroups.CheckEscape;
begin
  if MessageDlg('You are about to establish/change your GL Account Number groups structure.' + #13#13 +
                //'Note that system password will be required in order to proceed with GL Account Number structure change.' + #13#13 +
                'Are you sure you wish to continue?', mtWarning, [mbYes, mbNo], 0) = mrNo then
     System.SysUtils.ABORT;
end;

procedure TCreateAccGroups.LoginAsIQMS;
var
  APassword:string;
begin
//  WEBCONVERT
//  if not GetIQSysPassword( APassword ) then {IQShare: IQGetPwd}
//     System.SysUtils.ABORT;

  with DB do
  begin
    Connected := false;
    Params.Clear;            
    Params.Add('DriverID=Ora');
    Params.Add(Format('Database=%s',['IQORA']));
    Params.Add(Format('User_Name=%s', ['IQMS']));
    Params.Add(Format('Password=%s', [APassword]));
    LoginPrompt := False;
    Connected := True;



  
//    Connected   := FALSE;
//    AliasName   := 'IQWin95';
//    Connection := MainModule.FDConnection;
//    Params.Values[szUSERNAME]:= 'IQMS';
//    Params.Values[szPASSWORD]:= APassword;
//    LoginPrompt:= FALSE;
//    Connected:= TRUE;
  end;
end;

procedure TCreateAccGroups.OpenGLAccDef;
begin
  with TblGLAccDef do
  begin
    Connection := DB;
//    DataBaseName:= GLDATABASENAME;
    IndexFieldNames:= 'GROUP_NAME';
    TableName:= 'GLACCT_DEF';
    Open;
  end;
end;

procedure TCreateAccGroups.CheckHardCodedGroups;
begin
  with TblGLAccDef do
    if not FindKey(['ACCOUNT']) or not FindKey(['DIVISION']) or not FindKey(['DEPARTMENT']) then
       raise Exception.Create('Missing ACCOUNT, DIVISION or DEPARTMENT group(s). Review GL Account Number structure');
end;

procedure TCreateAccGroups.SetIndexToSEQ;
begin
  with TblGLAccDef do
  begin
    Close;
    IndexFieldNames:= 'SEQ';
    Open;
  end;
end;

procedure TCreateAccGroups.CreateView;
var
  cName  : string;
  nStart : Integer;
  nLength: Integer;
  AList:TStringList;
  I:integer;
begin
  AList := TStringList.Create;
  AList.Add('~');
  AList.Add('`');
  AList.Add('!');
  AList.Add('@');
  AList.Add('#');
  AList.Add('$');
  AList.Add('%');
  AList.Add('^');
  AList.Add('&');
  AList.Add('*');
  AList.Add('(');
  AList.Add(')');
  AList.Add('-');
  AList.Add('+');
  AList.Add('=');
  AList.Add(':');
  AList.Add(';');
  AList.Add('<');
  AList.Add('>');
  AList.Add(',');
  AList.Add('.');
  AList.Add('/');
  AList.Add('?');
  AList.Add('''');
  AList.Add('{');
  AList.Add('}');
  AList.Add('|');
  AList.Add('"');
  AList.Add('[');
  AList.Add(']');

  with TFDQuery.Create(Application) do
  try
    Connection := DB;
//    DataBaseName:= GLDATABASENAME;
    SQL.Add('create or replace view v_glacct as' );
    SQL.Add('select a.id,'                       );
    SQL.Add('a.eplant_id,'                       );
    SQL.Add('a.acct,'                            );
    SQL.Add('a.descrip,'                         );
    SQL.Add('s.descrip as type,'                 );
    SQL.Add('a.gl_subacct_type_id,'              );
    SQL.Add('a.corvu_acct_type,'              );
    SQL.Add('a.majortype'                        );

    TblGLAccDef.First;
    while not TblGLAccDef.Eof do
    begin
      cName  := TblGLAccDef.FieldByName('group_name').asString;
      nStart := TblGLAccDef.FieldByName('group_start').asInteger;
      nLength:= TblGLAccDef.FieldByName('group_length').asInteger;

      for I := 0 to AList.Count - 1 do
      begin
      if Pos(AList[I], cName) <> 0 then
        raise exception.Create(Format('Invalid character in %s column name.', [cName]));
      end;



      if (nStart > 0) and (nLength > 0) then
         SQL.Add( Format( ', substr( acct, %d, %d ) as %s', [ nStart, nLength, cName ] ))
      else
         SQL.Add( Format( ', '' '' as %s', [ cName ] ));

      TblGLAccDef.Next;
    end;
    SQL.Add( 'from GLACCT a, GLSUB_ACCT_TYPE s where s.id = a.gl_subacct_type_id' );
    ExecSQL;
    ExecuteCommand('begin stat_account_view.IQ_Build_view_v_stat_accts; end;');
    CompileObjects;
  finally
    AList.Free;
    Free;
  end;
end;

procedure TCreateAccGroups.CheckSynonym;
begin
  with TFDQuery.Create(Application) do
  try
    Connection := DB;
  
//    DataBaseName:= GLDATABASENAME;
    SQL.Add('select 1 from all_synonyms where synonym_name = ''V_GLACCT'' ');
    Open;
    if not (Eof and Bof) then
       EXIT;
    {Not Found - Create Synonym}
    Close;
    SQL.Clear;
    SQL.Add(' create public synonym v_glacct for iqms.v_glacct' );
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TCreateAccGroups.CheckGLRole;
begin
  with TFDQuery.Create(Application) do
  try
    Connection := DB;
  
//    DataBaseName:= GLDATABASENAME;
    SQL.Add('select 1 from dba_roles where role = ''IQACCT'' ');
    Open;
    if not (Eof and Bof) then
       EXIT;
    {Not Found - Create Synonym}
    Close;
    SQL.Clear;
    SQL.Add('create role IQACCT identified by donthaveacowman' );
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TCreateAccGroups.CheckGLGrant;
begin
  with TFDQuery.Create(Application) do
  try
    Connection := DB;
  
//    DataBaseName:= GLDATABASENAME;
    SQL.Add('select 1 from dba_tab_privs a');
    SQL.Add('where a.grantor = ''IQMS'' and a.grantee = ''IQACCT'' and table_name = ''V_GLACCT'' and privilege = ''SELECT''');
    Open;
    if not (Eof and Bof) then
       EXIT;
    {Not Found - Create Synonym}
    Close;
    SQL.Clear;
    SQL.Add('grant select on V_GLACCT to IQACCT' );
    ExecSQL;
  finally
    Free;
  end;
end;

procedure TCreateAccGroups.CompileObjects;
var
  AQry1, AQry2    :TFDQuery;
  APrevCount      :Integer;
  AUnableToResolve:Boolean;
  S               : string;
begin
  try
    AQry1:= TFDQuery.Create(nil);
    AQry1.Connection := DB;
    
//    AQry1.DataBaseName:= 'IQ';
    AQry1.SQL.Add(       'select object_name, object_type' );
    AQry1.SQL.Add(       '  from  all_objects' );
    AQry1.SQL.Add(Format(' where owner = ''%s'' ', [ 'IQMS' ]));
    AQry1.SQL.Add(       '   and object_type in ( ''PROCEDURE'', ''FUNCTION'', ''VIEW'', ''PACKAGE'', ''PACKAGE BODY'', ''TRIGGER'' )' );
    AQry1.SQL.Add(       '   and status = ''INVALID'' ');

    AQry2:= TFDQuery.Create(nil);
    AQry2.Connection := DB;
    
//    AQry2.DataBaseName:= 'IQ';

    APrevCount:= 0;
    AUnableToResolve:= FALSE;

    repeat
      Application.ProcessMessages;
      Reopen(AQry1);

      while not AQry1.Eof do
      begin
        AQry2.Close;
        AQry2.SQL.Clear;

//        StatusBar1.SimpleText:= Format('Compiling %s', [ AQry1.FieldByName('object_name').asString ]);
        Application.ProcessMessages;

        if AQry1.FieldByName('object_type').asString = 'PACKAGE BODY' then
           AQry2.SQL.Add( Format('alter package %s compile body', [ AQry1.FieldByName('object_name').asString ] ))
        else
           AQry2.SQL.Add( Format('alter %s %s compile', [ AQry1.FieldByName('object_type').asString, AQry1.FieldByName('object_name').asString ] ));

        AQry2.ExecSQL;

        AQry1.Next;
      end;

      if (APrevCount > 0) and ( APrevCount = AQry1.RecordCount ) then
         AUnableToResolve:= TRUE;

      APrevCount:= AQry1.RecordCount;
    until (AQry1.RecordCount = 0) or (AUnableToResolve);

//    StatusBar1.SimpleText:= '';

    if AUnableToResolve then
       raise Exception.Create('Unable to resolve dependencies.');

  finally
//    Reopen(Query1);
    AQry1.Free;
    AQry2.Free;
  end;
end;


end.


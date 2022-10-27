unit UsersDM;

interface

uses
  SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmUsers = class(TDataModule)
    dsUsers: TDataSource;
    tblUsers: TFDTable;
    tblUsersUsername: TStringField;
    tblUsersPassword: TStringField;
    tblUsersAdmin: TBooleanField;
    ActionList1: TActionList;
    actToggleAdmin: TAction;
    procedure actToggleAdminExecute(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure tblUsersBeforePost(DataSet: TDataSet);
  private
  public
    { Public declarations }
  end;

function dmUsers: TdmUsers;

implementation

{$R *.dfm}

uses
  uniGUIDialogs,
  UniGUIVars, uniGUIMainModule, MainModule;

function dmUsers: TdmUsers;
begin
  Result := TdmUsers(UniMainModule.GetModuleInstance(TdmUsers));
end;

procedure TdmUsers.DataModuleCreate(Sender: TObject);
begin
  tblUsers.Open;
end;

procedure TdmUsers.DataModuleDestroy(Sender: TObject);
begin
  tblUsers.Close;
end;

procedure TdmUsers.actToggleAdminExecute(Sender: TObject);
begin
  if tblUsers.State <> dsBrowse then
    ShowMessage('Commit any pending udpate before requesting admin status changes!')
  else
  begin
    tblUsers.Edit;
    tblUsersAdmin.Value := tblUsersAdmin.IsNull or not tblUsersAdmin.Value;
    tblUsers.Post;
  end;
end;

procedure TdmUsers.tblUsersBeforePost(DataSet: TDataSet);
var
  AdminQty : integer;
  oldValue : boolean;
  newValue : boolean;
begin
  AdminQty := tblUsers.Connection.ExecSQLScalar('SELECT count(*) FROM Users WHERE Admin = 1');

  oldValue := not tblUsersAdmin.IsNull or tblUsersAdmin.CurValue;
  newValue := tblUsersAdmin.IsNull or tblUsersAdmin.NewValue;

  if (oldValue and not newValue) and (AdminQty = 1) then
  begin
    ShowMessage('You need at least one admin account!');
    tblUsers.Cancel;
  end
end;

initialization
  RegisterModuleClass(TdmUsers);

end.

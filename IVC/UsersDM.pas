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
    procedure SetPassword(const aPassword: string);
  end;

function dmUsers: TdmUsers;

implementation

{$R *.dfm}

uses
  Variants,
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

procedure TdmUsers.SetPassword(const aPassword: string);
begin
  if aPassword = '' then
    ShowMessage('Type the new password first!')
  else if tblUsersUsername.AsString = '' then
    ShowMessage('Select or enter a user before setting its password!')
  else
  begin
    if tblUsers.State = dsBrowse then
      tblUsers.Edit;
    tblUsersPassword.AsString := HashPassword(tblUsersUsername.AsString, aPassword);
    tblUsers.Post;
  end;
end;

procedure TdmUsers.tblUsersBeforePost(DataSet: TDataSet);
var
  AdminQty : integer;
  oldValue : boolean;
  newValue : boolean;
begin
  // The stored verifier is salted with the username, so a rename needs a new password
  if (tblUsers.State = dsEdit) and
     (tblUsersUsername.AsString <> VarToStr(tblUsersUsername.OldValue)) and
     (tblUsersPassword.AsString = VarToStr(tblUsersPassword.OldValue)) then
  begin
    ShowMessage('Set a new password when renaming a user!');
    Abort;
  end;

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

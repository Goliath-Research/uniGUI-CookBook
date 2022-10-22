unit IQMS.WebVcl.SecRoleUsers;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.GridBase,
  Data.DB,
  DBCtrls,
  FireDAC.Comp.DataSet,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.Jump, Vcl.Menus, uniMainMenu,
  FireDAC.Comp.Client, IQUniGrid, uniGUIFrame, uniDBNavigator, Vcl.Controls,
  uniGUIBaseClasses, uniGUIClasses, uniPanel,  uniGUITypes, uniGUIAbstractClasses,
  uniGUIForm, uniGUIApplication;


type
  TFrmSecRoleUsers = class(TFrmIQGridBase)
    Query1USER_NAME: TStringField;
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
    FRoleName: string;
  public
    { Public declarations }
    class procedure DoShowModal( ARoleName: string );
  end;

var
  FrmSecRoleUsers: TFrmSecRoleUsers;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

{ TFrmSecRoleUsers }

class procedure TFrmSecRoleUsers.DoShowModal( ARoleName: string );
var
  frm : TFrmSecRoleUsers;
begin
  frm := TFrmSecRoleUsers.Create(uniGUIApplication.UniApplication);

  frm.FRoleName := ARoleName;
  frm.Caption   := Format('Assigned Users [%s]', [ ARoleName ]);

  //frm.PopupParent:= AOwner as TUniForm;

  frm.ShowModal;
end;


procedure TFrmSecRoleUsers.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbRefresh then
  begin
    Reopen(Query1);
    ABORT;
  end;
end;


procedure TFrmSecRoleUsers.Query1BeforeOpen(DataSet: TDataSet);
begin
  inherited;
  AssignQueryParamValue(DataSet, 'role_name', FRoleName);
end;

end.

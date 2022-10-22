unit IQMS.WebVcl.SecGroupUsers;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.GridBase, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  IQMS.WebVcl.Jump, Vcl.Menus, uniMainMenu, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, IQUniGrid, uniGUIFrame, uniDBNavigator, Vcl.Controls,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, IQMS.WebVcl.HPick;

type
  TTFrmSecGroupUsers = class(TFrmIQGridBase)
    Query1USER_NAME: TStringField;
    procedure Query1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FGroup_ID: Real;
    procedure SetGroup_ID(const AGroup_ID: Real);
  public
    { Public declarations }
    class procedure DoShowModal(  AGroup_ID: Real );
    property Group_ID:Real read FGroup_ID write SetGroup_ID;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

{ TTFrmSecGroupUsers }

class procedure TTFrmSecGroupUsers.DoShowModal(AGroup_ID: Real);
begin
  with self.Create(uniGUIApplication.UniApplication) do
  begin
    Group_ID:=AGroup_ID;
    ShowModal;
  end;
end;

procedure TTFrmSecGroupUsers.Query1BeforeOpen(DataSet: TDataSet);
begin
  inherited;
  AssignQueryParamValue(DataSet, 'group_id', FGroup_ID);
end;

procedure TTFrmSecGroupUsers.SetGroup_ID(const AGroup_ID: Real);
begin
  FGroup_ID := AGroup_ID;
  Caption:= Format('Assigned Users [%s]', [ SelectValueByID('group_name', 's_group', AGroup_ID)]);
end;

end.

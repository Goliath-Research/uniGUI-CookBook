unit IQMS.WebVcl.SecRoleGroups;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  DBCtrls,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmSecRoleGroups = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    wwDBGrid1: TIQUniGridControl;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure Query1UpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FRoleName: string;
  public
    { Public declarations }
    //constructor Create( AOwner: TComponent; ARoleName: string );
    class procedure DoShowModal( ARoleName: string );
  end;

var
  FrmSecRoleGroups: TFrmSecRoleGroups;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmSecRoleGroups }
class procedure TFrmSecRoleGroups.DoShowModal( ARoleName: string );
var
  frm : TFrmSecRoleGroups;
begin
  frm := TFrmSecRoleGroups.Create(uniGUIApplication.UniApplication);
  frm.FRoleName   := ARoleName;

  //frm.PopupParent := AOwner as TUniForm;

  IQSetTablesActive(TRUE, frm);

  frm.ShowModal;
end;

procedure TFrmSecRoleGroups.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [ self, wwDBGrid1 ]);
end;

procedure TFrmSecRoleGroups.Query1BeforeOpen(DataSet: TDataSet);
begin
  inherited;
  AssignQueryParamValue(DataSet, 'role_name', FRoleName);
end;

procedure TFrmSecRoleGroups.Query1UpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  IQRegFormWrite(self, [ self, wwDBGrid1 ]);
  AAction := eaApplied;
end;

procedure TFrmSecRoleGroups.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbRefresh then
  begin
    Reopen(Query1);
    ABORT;
  end;
end;

end.

unit crm_contactmethod;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  crmlist,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  uniGUIApplication,
  Datasnap.DBClient,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.UI.Intf,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, uniDBNavigator,
  Vcl.Controls, uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  { TFrmCRMMethodOfContact }
  TFrmCRMMethodOfContact = class(TFrmCRMList)
    SrcContactMethod: TDataSource;
    QryContactMethod: TFDQuery;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    QryContactMethodUpdateSQL: TFDUpdateSQL;
    QryContactMethodID: TBCDField;
    QryContactMethodNAME: TStringField;
    QryContactMethodDESCRIPTION: TStringField;
    QryContactMethodTYPE: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryContactMethodNewRecord(DataSet: TDataSet);
    procedure Help1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoContactMethodList;

implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure DoContactMethodList;
begin
  TFrmCRMMethodOfContact.Create(uniGUIApplication.UniApplication).ShowModal;
end;

procedure TFrmCRMMethodOfContact.FormCreate(Sender: TObject);
begin
  inherited;
  QryContactMethod.Open;
  IQRegFormRead(self, [self]);
end;

procedure TFrmCRMMethodOfContact.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
  if QryContactMethod.State in [dsEdit, dsInsert] then
    QryContactMethod.Post;
  QryContactMethod.Close;
  inherited; // Frees form
end;

procedure TFrmCRMMethodOfContact.Help1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(IQMS.Common.HelpHook.iqchmIQCRM, IQMS.Common.HelpHook.iqhtmIQCRM);
  // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(self.HelpContext);
end;

procedure TFrmCRMMethodOfContact.QryContactMethodNewRecord(DataSet: TDataSet);
begin
  inherited;
  AssignID(QryContactMethod, 'crm_contact_method');
end;

end.

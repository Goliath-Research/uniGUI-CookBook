unit crm_event_type;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  crmlist,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.UI.Intf,
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, uniDBNavigator,
  Vcl.Controls, uniGUIBaseClasses, uniGUIClasses, uniPanel,uniGUIApplication;

type
  { TFrmCRMEventTypes }
  TFrmCRMEventTypes = class(TFrmCRMList)
    SrcCRMEventType: TDataSource;
    QryCRMEventType: TFDQuery;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    QryCRMEventTypeUpdateSQL1: TFDUpdateSQL;
    QryCRMEventTypeID: TBCDField;
    QryCRMEventTypeNAME: TStringField;
    QryCRMEventTypeDESCRIP: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryCRMEventTypeNewRecord(DataSet: TDataSet);
    procedure Help1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoEventTypes;
function DoEventTypesEx: Boolean;

implementation

{$R *.DFM}


uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure DoEventTypes;
begin
  TFrmCRMEventTypes.Create(uniGUIApplication.UniApplication).Show;
end;

function DoEventTypesEx: Boolean;
begin
  Result := False;
  TFrmCRMEventTypes.Create(uniGUIApplication.UniApplication).ShowModal;

  Result := True;
end;

procedure TFrmCRMEventTypes.FormCreate(Sender: TObject);
begin
  inherited;
  IQRegFormRead(Self, [Self]);
  QryCRMEventType.Open;
end;

procedure TFrmCRMEventTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite(Self, [Self]);
  inherited;
end;

procedure TFrmCRMEventTypes.Help1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(IQMS.Common.HelpHook.iqchmIQCRM, IQMS.Common.HelpHook.iqhtmIQCRM);
  // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmCRMEventTypes.QryCRMEventTypeNewRecord(DataSet: TDataSet);
begin
  AssignID(QryCRMEventType, 'crm_contact_method');
end;

end.

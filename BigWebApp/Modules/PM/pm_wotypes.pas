unit PM_wotypes;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.UI.Intf,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  System.Classes,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  { TFrmPMWOTypes }
  TFrmPMWOTypes = class(TUniForm)
    PnlCarrier: TUniPanel;
    PnlGrid: TUniPanel;
    SrcTypes: TDataSource;
    Grid: TIQUniGridControl;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    QryTypes: TFDQuery;
    QryTypesID: TBCDField;
    QryTypesNAME: TStringField;
    QryTypesDESCRIPTION: TStringField;
    FDUpdateSQL1: TFDUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Help1Click(Sender: TObject);
    procedure QryTypesNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoWOTypes;

implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure DoWOTypes;
var
  LFrmPMWOTypes : TFrmPMWOTypes;
begin
  LFrmPMWOTypes := TFrmPMWOTypes.Create(UniGUIApplication.UniApplication);
  LFrmPMWOTypes.Show;
end;

procedure TFrmPMWOTypes.FormCreate(Sender: TObject);
begin
  QryTypes.Open;
end;

procedure TFrmPMWOTypes.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, Grid]);
end;

procedure TFrmPMWOTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TForm' and 'TFrmPMWOTypes'
  RestoreForm(Self);  }
  IQRegFormWrite(Self, [Self, Grid]);
end;

procedure TFrmPMWOTypes.Help1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmPMWOTypes.QryTypesNewRecord(DataSet: TDataSet);
begin
  QryTypesID.AsLargeInt := GetNextID('PMWO_TYPE'); // iqlib
end;

end.

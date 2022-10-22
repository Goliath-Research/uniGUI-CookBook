unit shipman_history;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  dm_shipman,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmShipManHistory = class(TUniForm)
    PnlCarrier: TUniPanel;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    GridHistory: TIQUniGridControl;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQAbout1: TIQWebAbout;
    PnlDetailCarrier: TUniPanel;
    Panel3: TUniPanel;
    pcDetail: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    Panel4: TUniPanel;
    GridDetail: TIQUniGridControl;
    Panel5: TUniPanel;
    sbtnToggleHeaderView: TUniSpeedButton;
    SpeedButton1: TUniSpeedButton;
    Search1: TUniMenuItem;
    N1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    procedure Close1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure sbtnToggleHeaderViewClick(Sender: TObject);
    procedure Search1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DM: TShipMan_DM;
    constructor Create(AOwner: TComponent);
  end;

  procedure DoShippingHistory(AOwner: TComponent);

var
  FrmShipManHistory: TFrmShipManHistory;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib;

procedure DoShippingHistory(AOwner: TComponent);
begin
  TFrmShipManHistory.Create(AOwner).Show;
end;

{ TFrmShipManHistory }

constructor TFrmShipManHistory.Create(AOwner: TComponent);
begin
  DM := TShipMan_DM.Create(Self);
  inherited Create(AOwner);
  DM.Name := '';

  IQMS.Common.Controls.AdjustPageControlToParent(pcDetail);

  ReOpen(DM.QryHistory);
  ReOpen(DM.QryHistoryDetail);


end;

procedure TFrmShipManHistory.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmShipManHistory.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmShipManHistory.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmShipManHistory.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmShipManHistory.sbtnToggleHeaderViewClick(Sender: TObject);
begin
  IQMS.Common.Controls.TogglePageControl(pcDetail);
end;

procedure TFrmShipManHistory.Search1Click(Sender: TObject);
begin
  //
end;

end.

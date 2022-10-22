unit dng_history;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Data.DB,
  IQMS.WebVcl.Search,
  MaskUtils,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmDNHistory = class(TUniForm)
    PnlMain: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    PnlArcusto: TUniPanel;
    PnlDetail: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLetterCaption: TUniPanel;
    lblLetters: TUniLabel;
    SrcHist: TDataSource;
    SrcHistDtl: TDataSource;
    QryHistDtl: TFDQuery;
    PnlArcustoDisplay: TUniPanel;
    QryHistDtlID: TBCDField;
    QryHistDtlDUNNING_HIST_ID: TBCDField;
    QryHistDtlDUNNING_LETTER_ID: TBCDField;
    QryHistDtlDUNNING_SEQ: TBCDField;
    QryHistDtlDUNNING_RPT: TStringField;
    QryHistDtlSENT_DATE: TDateTimeField;
    QryHistDtlSENT_BY: TStringField;
    GridHist: TIQUniGridControl;
    PnlHistDtl: TUniPanel;
    Panel4: TUniPanel;
    Label2: TUniLabel;
    Panel2: TUniPanel;
    GridHistDtl: TIQUniGridControl;
    QryHist: TFDQuery;
    QryHistID: TBCDField;
    QryHistARCUSTO_ID: TBCDField;
    QryHistARINVOICE_ID: TBCDField;
    QryHistDUNNING_GROUP_ID: TBCDField;
    QryHistDESCRIP: TStringField;
    QryHistCUSTNO: TStringField;
    QryHistCOMPANY: TStringField;
    QryHistARCUSTO_ADDR1: TStringField;
    QryHistARCUSTO_ADDR2: TStringField;
    QryHistARCUSTO_ADDR3: TStringField;
    QryHistARCUSTO_CITY: TStringField;
    QryHistARCUSTO_STATE: TStringField;
    QryHistARCUSTO_ZIP: TStringField;
    QryHistARCUSTO_COUNTRY: TStringField;
    QryHistUSE_USA_MASK: TStringField;
    QryHistBILL_TO_ATTN: TStringField;
    QryHistBILL_TO_CONTACT: TStringField;
    QryHistBILL_TO_ADDR1: TStringField;
    QryHistBILL_TO_ADDR2: TStringField;
    QryHistBILL_TO_ADDR3: TStringField;
    QryHistBILL_TO_CITY: TStringField;
    QryHistBILL_TO_STATE: TStringField;
    QryHistBILL_TO_ZIP: TStringField;
    QryHistBILL_TO_COUNTRY: TStringField;
    QryHistCREATED: TDateTimeField;
    QryHistCREATED_BY: TStringField;
    QryHistCHANGED: TDateTimeField;
    QryHistCHANGED_BY: TStringField;
    QryHistINVOICE_NO: TStringField;
    QryHistINVOICE_DATE: TDateTimeField;
    PHist: TUniPopupMenu;
    JumptoInvoice1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    QryHistACTUAL_SEQ: TBCDField;
    SR: TIQWebSecurityRegister;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
      { TODO -oMugdha -cWEBIQ : Dependency on TGridDrawState
    procedure DoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);    }
    procedure JumptoInvoice1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    FARInvoiceID: Real;
    FArcustoID: Real;
    procedure SetArcustoID(const Value: Real);
    procedure SetARInvoiceID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
 //   constructor Create(AArcustoID: Real;AARInvoiceID: Real);
    property  ArcustoID: Real write SetArcustoID;
    property ARInvoiceID: Real write SetARInvoiceID;
  end;

procedure DoDunningHistory(AArcustoID: Real = 0;AARInvoiceID: Real = 0);

implementation

{$R *.DFM}


uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  { TODO -oMugdha -cWEBIQ : Dependency on iview
  iview; }

procedure DoDunningHistory(AArcustoID: Real = 0; AARInvoiceID: Real = 0);
var
  LFrmDNHistory : TFrmDNHistory;
begin
 // TFrmDNHistory.Create(AOwner, AArcustoID, AARInvoiceID).Show;
  LFrmDNHistory := TFrmDNHistory.Create(uniGUIApplication.UniApplication);
end;

procedure TFrmDNHistory.UniFormCreate(Sender: TObject);
begin
{ TODO -oMugdha -cWEBIQ : Incompatible types: 'TForm' and 'TFrmDNHistory'
CenterForm(Self);   }
  ReOpen(QryHist);
  ReOpen(QryHistDtl);
end;
//
//constructor TFrmDNHistory.Create(AOwner: TComponent; AArcustoID, AARInvoiceID: Real);
//begin
//  inherited Create(AOwner);
//
//
//end;

procedure TFrmDNHistory.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, GridHist, GridHistDtl]);
end;

procedure TFrmDNHistory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQRegFormWrite(Self, [Self, GridHist, GridHistDtl]);
end;

{ TODO -oMugdha -cWEBIQ : Dependency on TGridDrawState
procedure TFrmDNHistory.DoCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if Highlight then
    Exit;
  // if Field.ReadOnly then
  ABrush.Color := clBtnFace;
end;
 }
procedure TFrmDNHistory.JumptoInvoice1Click(Sender: TObject);
begin
  if (QryHistARINVOICE_ID.AsLargeInt > 0) then
  { TODO -oMugdha -cWEBIQ : Undeclared identifier: 'DoJumpToInvoice'
    DoJumpToInvoice(Application, QryHistARINVOICE_ID.AsLargeInt);} // iview
end;

procedure TFrmDNHistory.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDNHistory.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmDNHistory.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmDNHistory.SetArcustoID(const Value: Real);
begin
  FArcustoID := Value;
end;

procedure TFrmDNHistory.SetARInvoiceID(const Value: Real);
begin
  FARInvoiceID := Value;
end;



procedure TFrmDNHistory.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

end.

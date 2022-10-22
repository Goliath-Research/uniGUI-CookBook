unit cc_trans_detail;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
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
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniPageControl, Vcl.StdCtrls, Vcl.ComCtrls, IQUniGrid, uniGUIFrame;

type
  { TFrmCCTransDetails }
  TFrmCCTransDetails = class(TUniForm)
    SrcResponse: TDataSource;
    QryResponse: TFDQuery;
    QryResponseDISPLAYNAME: TStringField;
    QryResponseVALUE: TStringField;
    PnlMain: TUniPanel;
    pcMain: TUniPageControl;
    TabResponse: TUniTabSheet;
    TabAggregate: TUniTabSheet;
    SrcTransaction: TDataSource;
    QryTransaction: TFDQuery;
    GridResponse: TIQUniGridControl;
    cmbGridResponseExpand: TUniEdit;
    rtfAggregate: TRichEdit;
    QryTransactionID: TBCDField;
    QryTransactionRESPONSE_DATA: TMemoField;
    PAggregate: TUniPopupMenu;
    WrapText1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DoBeforeOpen(DataSet: TDataSet);
    procedure cmbGridResponseExpandCustomDlg(Sender: TObject);
    procedure QryTransactionAfterOpen(DataSet: TDataSet);
    procedure WrapText1Click(Sender: TObject);
    procedure PAggregatePopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FCreditCardTransID: Int64;
    procedure SetCreditCardTransID(const Value: Int64);
  public
    { Public declarations }
    property CreditCardTransID: Int64 read FCreditCardTransID
      write SetCreditCardTransID;
  end;

procedure DoTransactionDetails(ACreditCardTransID: Int64);

implementation

{$R *.dfm}


uses
  IQMS.Common.EditMemoStr,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  cc_encrypt;

procedure DoTransactionDetails(ACreditCardTransID: Int64);
var
  LFrmCCTransDetails : TFrmCCTransDetails;
begin
  LFrmCCTransDetails := TFrmCCTransDetails.Create(UniGUIApplication.UniApplication);
  with LFrmCCTransDetails do
  begin
    CreditCardTransID := ACreditCardTransID;
    ShowModal;
  end;
end;

{ TFrmCCTransDetails }

procedure TFrmCCTransDetails.FormShow(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
  TabAggregate.TabVisible := SecurityManager.IsUserDBA and
    (UpperCase(SecurityManager.UserName) = 'IQMS');
  IQMS.Common.RegFrm.IQRegFormRead(Self,[Self]);
end;

procedure TFrmCCTransDetails.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self,[Self]);
end;

procedure TFrmCCTransDetails.SetCreditCardTransID(const Value: Int64);
begin
  FCreditCardTransID := Value;
  IQSetTablesActive(True, Self);
end;

procedure TFrmCCTransDetails.DoBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FCreditCardTransID);
end;

procedure TFrmCCTransDetails.cmbGridResponseExpandCustomDlg(Sender: TObject);
begin
  IQMS.Common.EditMemoStr.DoViewMemoStr(QryResponseVALUE.AsString,
    QryResponseDISPLAYNAME.AsString);
end;

procedure TFrmCCTransDetails.QryTransactionAfterOpen(DataSet: TDataSet);
begin
  rtfAggregate.Text := QryTransactionRESPONSE_DATA.AsString;
end;

procedure TFrmCCTransDetails.PAggregatePopup(Sender: TObject);
begin
  WrapText1.Checked := rtfAggregate.WordWrap;
end;

procedure TFrmCCTransDetails.WrapText1Click(Sender: TObject);
begin
  rtfAggregate.WordWrap := not rtfAggregate.WordWrap;
  if rtfAggregate.WordWrap then
    rtfAggregate.ScrollBars := ssVertical
  else
    rtfAggregate.ScrollBars := ssBoth;
end;

end.

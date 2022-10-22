unit cc_pickcard;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Buttons,
  cc_types,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, IQUniGrid, uniGUIFrame;

type
  TFrmCCPickCard = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlGrid: TUniPanel;
    PnlButtonsInner: TUniPanel;
    SrcData: TDataSource;
    QryData: TFDQuery;
    QryDataACCTNO: TStringField;
    QryDataNAME_ON: TStringField;
    QryDataEXP_MMYY: TStringField;
    QryDataIS_DEFAULT: TStringField;
    QryDataADDR1: TStringField;
    QryDataZIP: TStringField;
    QryDataCREDIT_CARD_DESCRIP: TStringField;
    QryDataDecryptedAcct: TStringField;
    QryDataDecryptedName: TStringField;
    QryDataDycryptedExp: TStringField;
    QryDataCITY: TStringField;
    QryDataSTATE: TStringField;
    QryDataCOUNTRY: TStringField;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    QryDataID: TBCDField;
    QryDataCardTypeDisplay: TStringField;
    QryDataDecryptedMaskedAcct: TStringField;
    Grid: TIQUniGridControl;
    Panel1: TUniPanel;
    lblSearch: TUniLabel;
    btnSearch: TUniBitBtn;
    edtSearch: TUniEdit;
    QryDataLastFour: TStringField;
    QryDataIS_TOKEN: TStringField;
    QryDataGATEWAY: TBCDField;
    QryDataGATEWAY_DESCRIP: TStringField;
    procedure QryDataBeforeOpen(DataSet: TDataSet);
    procedure QryDataCalcFields(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FArcustoID: Int64;
    FCreditCardAccountID: Int64;
    procedure SetACreditCardAccountID(const Value: Int64);
    procedure SetArcustoID(const Value: Int64);
  public
    { Public declarations }
    property ArcustoID : Int64 read FArcustoID write SetArcustoID;
    property CreditCardAccountID : Int64 write SetACreditCardAccountID;

  end;

function SelectCreditCard(AAArcustoID,ACreditCardAccountID: Int64; var AID: Int64): Boolean;
function SelectCreditCardEx(AArcustoID,ACreditCardAccountID: Int64; var ACreditCardRec: TCreditCardRec): Boolean;

implementation

{$R *.dfm}


uses
  cc_share,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.Common.StringUtils,
  cc_encrypt;

function SelectCreditCard(AAArcustoID,ACreditCardAccountID: Int64; var AID: Int64): Boolean;
var
  LFrmCCPickCard : TFrmCCPickCard;
begin
  // 08/11/2010 Initialize
  AID := 0;

  LFrmCCPickCard := TFrmCCPickCard.Create(UniGUIApplication.UniApplication);
  with LFrmCCPickCard do
  begin
    ArcustoID := AAArcustoID;
    CreditCardAccountID := ACreditCardAccountID;
    Result := ShowModal = mrOk;
    if Result then
      AID := QryDataID.AsLargeInt;
  end;
end;

function SelectCreditCardEx(AArcustoID,ACreditCardAccountID: Int64; var ACreditCardRec: TCreditCardRec): Boolean;
var
  LFrmCCPickCard : TFrmCCPickCard;
begin
  if not Assigned(ACreditCardRec) then
  begin
    Result := False;
    Exit;
  end;

  // 08/11/2010 Clear rec.
  cc_types.ClearCreditCardRec(ACreditCardRec);

  LFrmCCPickCard := TFrmCCPickCard.Create(UniGUIApplication.UniApplication);
  with LFrmCCPickCard do
  begin
    ArcustoID := AArcustoID;
    CreditCardAccountID := ACreditCardAccountID;
    Result := ShowModal = mrOk;
    if Result then
      ACreditCardRec.AssignFromCreditCardID(QryDataID.AsLargeInt);
  end;
end;

procedure TFrmCCPickCard.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, Grid]);
end;

procedure TFrmCCPickCard.FormShow(Sender: TObject);
begin
  // 06/20/2012 Update the package encryption keys so that
  // we can see data.
  cc_encrypt.ResetPackage;
  ReOpen(QryData);
  IQMS.Common.Screen.ApplySystemFont(Self);
  // 09/06/2012 Adjust control for font change
  edtSearch.Left := lblSearch.Left + lblSearch.Width + 8;
  btnSearch.Left := edtSearch.Left + edtSearch.Width + 8;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, Grid]);
end;

procedure TFrmCCPickCard.QryDataBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', FArcustoID);
  AssignQueryParamValue(DataSet, 'CREDIT_CARD_ACCOUNT_ID',
    FCreditCardAccountID);
end;

procedure TFrmCCPickCard.QryDataCalcFields(DataSet: TDataSet);
begin
  QryDataCardTypeDisplay.AsString := cc_types.GetCardTypeDisplayName
    (QryDataCREDIT_CARD_DESCRIP.AsString);
  QryDataDecryptedAcct.AsString := QryDataACCTNO.AsString;
  QryDataDecryptedMaskedAcct.AsString := cc_share.GetMaskedAccount
    (QryDataDecryptedAcct.AsString);
  QryDataDecryptedName.AsString := QryDataNAME_ON.AsString;
  QryDataDycryptedExp.AsString := QryDataEXP_MMYY.AsString;
  QryDataLastFour.AsString := IQMS.Common.StringUtils.RightStr
    (QryDataDecryptedAcct.AsString, 4);
end;

procedure TFrmCCPickCard.SetACreditCardAccountID(const Value: Int64);
begin
  FCreditCardAccountID := Value;
end;

procedure TFrmCCPickCard.SetArcustoID(const Value: Int64);
begin
  FArcustoID := Value;
end;

procedure TFrmCCPickCard.GridDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmCCPickCard.btnSearchClick(Sender: TObject);
var
  AID: Real;
  ASuccess: Boolean;
begin
  ASuccess := False;
  try
    AID := QryDataID.AsFloat;
    QryData.DisableControls;
    with QryData do
      begin
        First;
        while not EOF do
          begin
            if CompareText(QryDataLastFour.AsString, edtSearch.Text) = 0 then
              begin
                ASuccess := True;
                BREAK;
              end;
            Next;
          end;
      end;

    if not ASuccess then
      QryData.Locate('ID', AID, []);

  finally
    QryData.EnableControls;
  end;
end;

end.

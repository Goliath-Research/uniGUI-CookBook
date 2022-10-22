unit crmquotemisc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.FloatSpinner,
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
  uniPanel,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniComboBox, uniDBComboBox;

type
  { TMiscItemInfo }
  TMiscItemInfo = packed record
    Description: string;
    Quantity: Real;
    UnitPrice: Real;
    UOM: string;
  end;

type
  { TFrmCRMQuoteMisc }
  TFrmCRMQuoteMisc = class(TUniForm)
    PnlClient: TUniPanel;
    PnlBottom: TUniPanel;
    PnlButtons: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlLeft: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    edtQty: TIQWebFloatSpinner;
    edtUnitPrice: TIQWebFloatSpinner;
    SrcMisc: TDataSource;
    QryMisc: TFDQuery;
    cmbDescrip: TUniDBLookupComboBox;
    QryMiscSOURCE_DISPLAY: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  strict private
    { Private declarations }
    function GetDescription: string;
    function GetPrice: Real;
    function GetQuantity: Real;
    procedure SetDescription(const Value: string);
    procedure SetPrice(const Value: Real);
    procedure SetQuantity(const Value: Real);
    procedure SetControlFormatMasks;
  public
    { Public declarations }
    property Description: string read GetDescription write SetDescription;
    property Quantity: Real read GetQuantity write SetQuantity;
    property Price: Real read GetPrice write SetPrice;
  end;

function AddMiscCRMQuoteItem(
  var MiscItemInfo: TMiscItemInfo): Boolean;

procedure PrepareMiscItemInfo(var MiscItemInfo: TMiscItemInfo);

implementation

{$R *.DFM}

uses
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure PrepareMiscItemInfo(var MiscItemInfo: TMiscItemInfo);
begin
  // Initialize the record object
  ZeroMemory(@MiscItemInfo, SizeOf(TMiscItemInfo));
end;

function AddMiscCRMQuoteItem(
  var MiscItemInfo: TMiscItemInfo): Boolean;
var
  FrmCRMQuoteMisc: TFrmCRMQuoteMisc;
begin
  FrmCRMQuoteMisc := TFrmCRMQuoteMisc.Create(uniGUIApplication.UniApplication);
  with FrmCRMQuoteMisc do
  begin
    try
      // Update screen in case user is changing existing data
      Description := MiscItemInfo.Description;
      Quantity := MiscItemInfo.Quantity;
      Price := MiscItemInfo.UnitPrice;

      Result := ShowModal = mrOk;

      if Result then
      begin
        MiscItemInfo.Description := Description;
        MiscItemInfo.Quantity := Quantity;
        MiscItemInfo.UnitPrice := Price;
        MiscItemInfo.UOM := crm_rscstr.cTXT0001306; // Each
      end;
    finally
      //Release;
    end;
  end;
end;

{ TFrmCRMQuoteMisc }

procedure TFrmCRMQuoteMisc.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] crmquotemisc.pas(143): E2010 Incompatible types: 'TForm' and 'TFrmCRMQuoteMisc'}
  //IQMS.Common.Controls.CenterForm(Self, True);
  ReOpen(QryMisc);
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlLeft]);
  SetControlFormatMasks;
end;

procedure TFrmCRMQuoteMisc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlLeft]);
end;

procedure TFrmCRMQuoteMisc.btnOkClick(Sender: TObject);
begin
  // Validation
  if Trim(cmbDescrip.Text) = '' then
    // crm_rscstr.cTXT0001236 =
    // 'A description is required.'
    raise Exception.Create(crm_rscstr.cTXT0001236);
  // If we get here, all is well
  ModalResult := mrOk;
end;

procedure TFrmCRMQuoteMisc.SetControlFormatMasks;
var
  AUseThousandSeparator: Boolean;
begin
  // 08/22/2006 Set format if necessary
  AUseThousandSeparator := UseThousandSeparator;
  // Integer
  edtQty.DisplayFormat := GetFloatFormatMask(AUseThousandSeparator, 0, False);
  if AUseThousandSeparator then
    edtUnitPrice.DisplayFormat := '#,##0.00####'
  else
    edtUnitPrice.DisplayFormat := '###0.00####'
    // GetFloatFormatMask(AUseThousandSeparator,
    // 6, True);
end;

{$REGION 'Property methods'}

function TFrmCRMQuoteMisc.GetDescription: string;
begin
  Result := Trim(cmbDescrip.Text);
end;

procedure TFrmCRMQuoteMisc.SetDescription(const Value: string);
begin
  cmbDescrip.Text := Trim(Value);
end;

function TFrmCRMQuoteMisc.GetPrice: Real;
begin
  Result := edtUnitPrice.Position;
end;

procedure TFrmCRMQuoteMisc.SetPrice(const Value: Real);
begin
  edtUnitPrice.Position := Value;
end;

function TFrmCRMQuoteMisc.GetQuantity: Real;
begin
  Result := edtQty.Position;
end;

procedure TFrmCRMQuoteMisc.SetQuantity(const Value: Real);
begin
  edtQty.Position := Value;
end;

{$ENDREGION 'Property methods'}

end.

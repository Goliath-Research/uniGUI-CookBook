unit crmquote_svclbr;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  crmquotemisc,
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
  Data.DB,
  FireDAC.Comp.Client,
  Vcl.Buttons,
  IQMS.WebVcl.FloatSpinner,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniButton, uniBitBtn, uniDBLookupComboBox, uniSplitter,
  Vcl.Forms, uniPanel,
  uniGUIApplication;

type
  TFrmCRMQuoteServiceLabor = class(TFrmCRMQuoteMisc)
    lblUOM: TUniLabel;
    cmbUOM: TUniDBComboBox;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function AddServiceLaborCRMQuoteItem(var MiscItemInfo: TMiscItemInfo): Boolean;



implementation

{$R *.dfm}


uses
  crm_rscstr,
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils;

function AddServiceLaborCRMQuoteItem(var MiscItemInfo: TMiscItemInfo): Boolean;
var
  FrmCRMQuoteServiceLabor: TFrmCRMQuoteServiceLabor;
begin
  FrmCRMQuoteServiceLabor := TFrmCRMQuoteServiceLabor.Create(uniGUIApplication.UniApplication);
  with FrmCRMQuoteServiceLabor do
  begin
    try
      // Update screen in case user is changing existing data
      cmbDescrip.Text := MiscItemInfo.Description;
      edtQty.Position := MiscItemInfo.Quantity;
      edtUnitPrice.Position := MiscItemInfo.UnitPrice;
      { TODO -oSanketG -cWebConvert : Need to find alternative for Value in TUniDBComboBox}
      //cmbUOM.Value := MiscItemInfo.UOM;
      if cmbUOM.ItemIndex = - 1 then
        cmbUOM.ItemIndex := 0;
      Result := ShowModal = mrOk;
      if Result then
      begin
        MiscItemInfo.Description := FixStr(cmbDescrip.Text);
        MiscItemInfo.Quantity := edtQty.Position;
        MiscItemInfo.UnitPrice := edtUnitPrice.Position;
        { TODO -oSanketG -cWebConvert : Need to find alternative for Value in TUniDBComboBox}
        //MiscItemInfo.UOM := cmbUOM.Value;
      end;
    finally
      //Release;
    end;
  end;
end;

procedure TFrmCRMQuoteServiceLabor.btnOkClick(Sender: TObject);
begin
  if (cmbUOM.ItemIndex = - 1) or (cmbUOM.Text = '') then
  begin
    IQError(crm_rscstr.cTXT0000191); // 'Please select a UOM.'
    ModalResult := mrNone;
  end;

  inherited;

end;

end.

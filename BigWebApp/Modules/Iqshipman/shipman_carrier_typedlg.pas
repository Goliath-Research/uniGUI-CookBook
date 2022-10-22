unit shipman_carrier_typedlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
//  shipman_common,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMultiItem,
  uniComboBox,
  uniButton,
  uniBitBtn;



type
  TCarrierType = (ctUnknown, ctUPS, ctFedExGround, ctFedExExpress, ctUSPS, ctFedExSmartPost, ctWebService);  //Delete When shipman_common used

  TFrmShipManCarrierTypeDlg = class(TUniForm)
    PnlMain: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLabels: TUniPanel;
    lblAccount1: TUniLabel;
    PnlEditBoxes: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    cmbCarrierType: TUniComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function DoSelectCarrierType(var ACarrierType: TCarrierType): Boolean;

implementation

{$R *.dfm}

function DoSelectCarrierType(var ACarrierType: TCarrierType): Boolean;
var
  AIndex: Integer;
  FrmShipManCarrierTypeDlg : TFrmShipManCarrierTypeDlg;
begin
  FrmShipManCarrierTypeDlg := TFrmShipManCarrierTypeDlg.Create(UniApplication);
  with FrmShipManCarrierTypeDlg do
  begin
      AIndex := Ord(ACarrierType) - 1;
      if (AIndex >= 0) and (AIndex < cmbCarrierType.Items.Count) then
        cmbCarrierType.ItemIndex := AIndex;
     Result := ShowModal = mrOk;
     if Result then
        ACarrierType := TCarrierType(cmbCarrierType.ItemIndex + 1);
  end;
end;

end.

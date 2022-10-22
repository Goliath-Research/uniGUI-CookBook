unit po_sel_price_update;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type

  TPOPriceUpdateMode = (POpumNone, POpumThisItem, POpumThisPO, POpumThisItemAllPos, POpumAllItemsAllPOs);

  TPOPriceUpdateParam = record
    Arinvt_ID: Real;
    UpdateMode: TPOPriceUpdateMode;
  end;

  TFrmPOSelectPriceUpdate = class(TUniForm)
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel2: TUniPanel;
    GroupBox1: TUniGroupBox;
    rbtnThisItem: TUniRadioButton;
    rbtnThisPO: TUniRadioButton;
    rbtnThisItemAllPOs: TUniRadioButton;
    rbtnAllItemsAllPos: TUniRadioButton;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal(var AParam: TPOPriceUpdateParam): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm;
{ TODO -oLema : Dependent on IQSecIns }
// IQSecIns;

procedure TFrmPOSelectPriceUpdate.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

class function TFrmPOSelectPriceUpdate.DoShowModal(var AParam: TPOPriceUpdateParam): Boolean;
var
  frm: TFrmPOSelectPriceUpdate;
begin

  frm := TFrmPOSelectPriceUpdate.Create(uniGUIApplication.UniApplication);
  Result := (frm.ShowModal = mrOK);
  if Result then
  begin
    if frm.rbtnThisItem.Checked then
      AParam.UpdateMode := POpumThisItem
    else if frm.rbtnThisPO.Checked then
      AParam.UpdateMode := POpumThisPO
    else if frm.rbtnThisItemAllPOs.Checked then
      AParam.UpdateMode := POpumThisItemAllPos
    else if frm.rbtnAllItemsAllPos.Checked then
      AParam.UpdateMode := POpumAllItemsAllPOs;
  end;

end;

procedure TFrmPOSelectPriceUpdate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmPOSelectPriceUpdate.FormShow(Sender: TObject);
begin
  // EnsureSecurityInspectorOnTopOf( self );
end;

end.

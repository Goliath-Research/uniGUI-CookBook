unit oe_sel_price_update;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniRadioButton,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TPriceUpdateMode = (pumNone, pumThisItem, pumThisOrder, pumThisItemAllOrders, pumAllItemsAllOrders);

  TPriceUpdateParam = record
    Arinvt_ID: Real;
    UpdateMode: TPriceUpdateMode;
    IncludeUninvoiced: Boolean;
  end;

  TFrmOESelectPriceUpdate = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    GroupBox1: TUniGroupBox;
    rbtnThisItem: TUniRadioButton;
    rbtnThisOrder: TUniRadioButton;
    rbtnThisItemAllOrders: TUniRadioButton;
    rbtnAllItemsAllOrders: TUniRadioButton;
    chkIncludeUninvoicedThisItemAllOrders: TUniCheckBox;
    chkIncludeUninvoicedAlltemsAllOrders: TUniCheckBox;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EnableControls(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal(var AParam: TPriceUpdateParam): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm;
  { TODO -oLema : Dependent on IQSecIns }
// IQSecIns;

{ TFrmOESelectPriceUpdate }

procedure TFrmOESelectPriceUpdate.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

class function TFrmOESelectPriceUpdate.DoShowModal(var AParam: TPriceUpdateParam): Boolean;
var
  frm: TFrmOESelectPriceUpdate;
begin
  frm := TFrmOESelectPriceUpdate.Create(uniGUIApplication.UniApplication);

  with frm do
  begin
    Result := ShowModal = mrOK;
    if Result then
    begin
      if rbtnThisItem.Checked then
        AParam.UpdateMode := pumThisItem

      else if rbtnThisOrder.Checked then
        AParam.UpdateMode := pumThisOrder

      else if rbtnThisItemAllOrders.Checked then
      begin
        AParam.UpdateMode := pumThisItemAllOrders;
        AParam.IncludeUninvoiced := chkIncludeUninvoicedThisItemAllOrders.Checked;
      end

      else if rbtnAllItemsAllOrders.Checked then
      begin
        AParam.UpdateMode := pumAllItemsAllOrders;
        AParam.IncludeUninvoiced := chkIncludeUninvoicedAlltemsAllOrders.Checked;
      end;
    end;

  end;

end;

procedure TFrmOESelectPriceUpdate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmOESelectPriceUpdate.EnableControls(Sender: TObject);
begin
  chkIncludeUninvoicedThisItemAllOrders.Enabled := rbtnThisItemAllOrders.Checked;
  if not chkIncludeUninvoicedThisItemAllOrders.Enabled then
    chkIncludeUninvoicedThisItemAllOrders.Checked := FALSE;

  chkIncludeUninvoicedAlltemsAllOrders.Enabled := rbtnAllItemsAllOrders.Checked;
  if not chkIncludeUninvoicedAlltemsAllOrders.Enabled then
    chkIncludeUninvoicedAlltemsAllOrders.Checked := FALSE;
end;

procedure TFrmOESelectPriceUpdate.FormShow(Sender: TObject);
begin
  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf(self);
end;

end.

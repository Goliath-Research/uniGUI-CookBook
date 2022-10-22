unit ExpMileageCalc;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton;

type
  TFrmMileageCalc = class(TUniForm)
    Label1: TUniLabel;
    EditRate: TUniEdit;
    Label2: TUniLabel;
    EditQty: TUniEdit;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnCancel: TUniButton;
    BtnOk: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    FQty:Real;
    FRate:Real;
    function getQty: Real;
    procedure setQty(const Value: Real);
    function getRate: Real;
    procedure setRate(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    class function DoMileageCalculator(var AQty:Real; var ARate:Real):boolean;

    property Qty  : Real read getQty  write setQty;
    property Rate : Real read getRate write setRate;

  end;


implementation
{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  exp_rscstr;


class function TFrmMileageCalc.DoMileageCalculator(var AQty:Real; var ARate:Real):boolean;
var
   frm : TFrmMileageCalc;
begin
  frm      := TFrmMileageCalc.Create(uniGUIApplication.UniApplication);
  frm.Qty  := AQty;
  frm.Rate := ARate;
  Result   := frm.ShowModal = mrOK;

  if Result then
  begin
    AQty  := frm.Qty;
    ARate := frm.Rate;
  end;

end;

procedure TFrmMileageCalc.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IqRegFormWrite(self, [self]);
end;

function TFrmMileageCalc.getQty: Real;
begin
  Result := StrToFloat(EditQty.text);
end;

function TFrmMileageCalc.getRate: Real;
begin
  Result := StrToFloat(EditRate.Text);
end;

procedure TFrmMileageCalc.setQty(const Value: Real);
begin
   EditQty.Text := FloatToStr(Value);
end;

procedure TFrmMileageCalc.setRate(const Value: Real);
begin
  EditRate.Text := FloatToStr(Value);
end;

procedure TFrmMileageCalc.UniFormCreate(Sender: TObject);
begin
  IqRegFormRead(self, [self]);
end;

procedure TFrmMileageCalc.BtnOkClick(Sender: TObject);
begin
  if EditRate.text = '' then
    raise Exception.Create(exp_rscstr.cTXT0000009);

  try
    FRate := StrToFloat(EditRate.text)
  except
    raise Exception.Create(exp_rscstr.cTXT0000009);
  end;

  if EditQty.text = '' then
    raise Exception.Create(exp_rscstr.cTXT0000010);

  try
    FQty := StrToFloat(EditQty.text)
  except
    raise Exception.Create(exp_rscstr.cTXT0000010);
  end;
  ModalResult := mrOk;
end;

procedure TFrmMileageCalc.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

end.

unit IqLMPurc;

interface

uses
  Winapi.Windows,
  IQMS.PrintLabels.LMBase,
  Mask,
  MainModule,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UserDefinedLabel,
  Vcl.Forms,
  Vcl.Controls,
  IQMS.WebVcl.UDComboBox,
  Vcl.Buttons,
  System.Classes, uniMainMenu, uniSplitter, uniScrollBox, IQUniGrid,
  uniGUIFrame, uniDBNavigator, uniComboBox, uniDBComboBox, uniDateTimePicker,
  uniDBDateTimePicker, uniMultiItem, uniDBLookupComboBox, uniGUIClasses,
  uniEdit, uniBitBtn, uniSpeedButton, uniLabel, uniPageControl, uniButton,
  uniGUIBaseClasses, uniPanel;

type
  TFrmLM_Purch = class(TFrmLM_Base)
    procedure DefineLabelText1Click(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  protected
    procedure PopulateAkaItemno;override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLM_Purch: TFrmLM_Purch;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.PrintLabels.LabelMatrix;
{$R *.DFM}

procedure TFrmLM_Purch.BtnOkClick(Sender: TObject);
begin
  CheckMandatoryLotNo;  // IQMS.PrintLabels.LMBase.pas
  inherited;
end;

procedure TFrmLM_Purch.DefineLabelText1Click(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmLM_Purch.PopulateAkaItemno;
var
  AkaItemno:String;
begin
  inherited;
  if EdAkaItemno.Text = '' then
  begin
    AkaItemno := SelectValueFmtAsString('select vend_itemno from ARINVT_VENDORS where vendor_id = %f and arinvt_id = %f', [TIQWebLMBase(self.Owner).Vendor_ID, TIQWebLMBase(self.Owner).Arinvt_ID]);
    EdAkaItemno.Readonly := false;
    EdAkaItemno.Text := AkaItemno;
    EdAkaItemno.Readonly := true;
  end;
end;


end.


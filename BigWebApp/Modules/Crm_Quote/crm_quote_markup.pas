unit crm_quote_markup;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  IQMS.CRM.SalesQuote.MarkupConst,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmCRMMarkupOptionsDlg = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    PnlValueCarrier: TUniPanel;
    Splitter1: TUniSplitter;
    PnlValueLeft: TUniPanel;
    PnlValueClient: TUniPanel;
    lblRate: TUniLabel;
    edtValue: TUniEdit;
    lblPct: TUniLabel;
    btnClear: TUniButton;
    rgOption2: TUniGroupBox;
    rbPercentage: TUniRadioButton;
    rbFlatMarkup: TUniRadioButton;
    chkCompounded: TUniCheckBox;
    PnlCheckBoxOptions: TUniPanel;
    chkApplyToAll: TUniCheckBox;
    procedure rgOptionClick(Sender: TObject);
    procedure edtValueExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FClearAllValues: Boolean;
    FCanApplyToAllSalesChoices: Boolean;
    procedure SetControls;
    function GetOption: TMarkupOptionType;
    function GetValue: Real;
    procedure SetValue(const SelectedValue: Real);
    procedure Validate;
    function GetCompounded: Boolean;
    procedure SetCompounded(const SelectedValue: Boolean);
    procedure SetOption(const SelectedValue: TMarkupOptionType);
    procedure SetCanApplyToAllSalesChoices(const Value: Boolean);
    function GetApplyToAll: Boolean;
    procedure SetApplyToAll(const Value: Boolean);
  public
    { Public declarations }
    class function DoShowModal(
      const ACanApplyToAllSalesChoices: Boolean;
      var AOptions: TMarkupOptions): Boolean;

    procedure GetOptions(var AOptions: TMarkupOptions);
    procedure SetOptions(AOptions: TMarkupOptions);

    property SelectedOption: TMarkupOptionType read GetOption write SetOption;
    property SelectedValue: Real read GetValue write SetValue;
    property PercentageCompounded: Boolean read GetCompounded write SetCompounded;
    property ApplyToAll: Boolean read GetApplyToAll write SetApplyToAll;
    property ClearAllValues: Boolean read FClearAllValues;
    property CanApplyToAllSalesChoices: Boolean read FCanApplyToAllSalesChoices write SetCanApplyToAllSalesChoices;
  end;

//  function GetMarkupOptions(const AOwner: TComponent;
//   var AOption: Integer; var AValue: Real; var ACompounded: Boolean;
//   var AClearValue: Boolean): Boolean;

//  function GetMarkupOptions(
//    const AOwner: TComponent;
//    var AOptions: TMarkupOptions): Boolean;



implementation

{$R *.dfm}

uses
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  Math,
  StrUtils;

//function GetMarkupOptions(const AOwner: TComponent;
// var AOption: Integer; var AValue: Real; var ACompounded: Boolean;
// var AClearValue: Boolean): Boolean;
{function GetMarkupOptions(
  const AOwner: TComponent;
  var AOptions: TMarkupOptions): Boolean;
begin
  with TFrmCRMMarkupOptionsDlg.Create(AOwner, AOptions) do
  try
//    SelectedOption := AOption;
//    SelectedValue := AValue;
//    PercentageCompounded := ACompounded;
//    SetControls;
    Result := ShowModal = mrOk;
    if Result then
    begin
      GetOptions(AOptions);
    end;
//       begin
//         AOption := SelectedOption;
//         AValue := SelectedValue;
//         ACompounded := PercentageCompounded;
//         AClearValue := FClearAllValues;
//       end;
  finally
    Release;
  end;
end; }

{ TFrmCRMMarkupOptionsDlg }

class function TFrmCRMMarkupOptionsDlg.DoShowModal(
  const ACanApplyToAllSalesChoices: Boolean; var AOptions: TMarkupOptions): Boolean;
var
  FrmCRMMarkupOptionsDlg: TFrmCRMMarkupOptionsDlg;
begin
  FrmCRMMarkupOptionsDlg := Self.Create(uniGUIApplication.UniApplication);
  with FrmCRMMarkupOptionsDlg do
  begin
    try
      SetOptions(AOptions);
      CanApplyToAllSalesChoices := ACanApplyToAllSalesChoices;
      Result := ShowModal = mrOk;
      if Result then
      begin
        GetOptions(AOptions);
      end;
    finally
      //Release;
    end;
  end;
end;

procedure TFrmCRMMarkupOptionsDlg.FormShow(Sender: TObject);
begin
  SetControls;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, chkApplyToAll]);
  Self.BringToFront;
end;

procedure TFrmCRMMarkupOptionsDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, chkApplyToAll]);
end;

procedure TFrmCRMMarkupOptionsDlg.rgOptionClick(Sender: TObject);
begin
  Application.ProcessMessages;
  SetControls;
end;

procedure TFrmCRMMarkupOptionsDlg.SetControls;
begin
  case SelectedOption of
   TMarkupOptionType.PercentageMarkup: begin
        // crm_rscstr.cTXT0001949 = 'Markup Percentage';
        lblRate.Caption := crm_rscstr.cTXT0001949;
      end;
   TMarkupOptionType.FlatMarkup: begin
        // crm_rscstr.cTXT0001950 = 'Flat Markup Amount';
        lblRate.Caption := crm_rscstr.cTXT0001950;
      end;
  end;
  lblPct.Visible := SelectedOption = TMarkupOptionType.PercentageMarkup;
  IQMS.Common.Controls.IQEnableControl(chkCompounded, SelectedOption = TMarkupOptionType.PercentageMarkup);
  PnlValueLeft.Width := (lblRate.Left + lblRate.Width + 16);
end;

procedure TFrmCRMMarkupOptionsDlg.edtValueExit(Sender: TObject);
begin
   FormatEditTextAsFloat(edtValue);
end;

function TFrmCRMMarkupOptionsDlg.GetCompounded: Boolean;
begin
  if FClearAllValues then
    Exit(False);

  if SelectedOption = TMarkupOptionType.PercentageMarkup then
    Result := chkCompounded.Checked
  else
    Result := False;
end;

procedure TFrmCRMMarkupOptionsDlg.SetCanApplyToAllSalesChoices(const Value: Boolean);
begin
  FCanApplyToAllSalesChoices := Value;
  chkApplyToAll.Visible := Value;
end;

procedure TFrmCRMMarkupOptionsDlg.SetCompounded(const SelectedValue: Boolean);
begin
  chkCompounded.Checked := SelectedValue;
end;

function TFrmCRMMarkupOptionsDlg.GetOption: TMarkupOptionType;
begin
  if FClearAllValues then
    Exit(TMarkupOptionType.PercentageMarkup);

  if rbFlatMarkup.Checked then
    Result := TMarkupOptionType.FlatMarkup
  else
    Result := TMarkupOptionType.PercentageMarkup;
end;

procedure TFrmCRMMarkupOptionsDlg.SetOption(const SelectedValue: TMarkupOptionType);
begin
  case SelectedValue of
   TMarkupOptionType.PercentageMarkup: rbPercentage.Checked := True;
   TMarkupOptionType.FlatMarkup: rbFlatMarkup.Checked := True;
  end;
end;

procedure TFrmCRMMarkupOptionsDlg.GetOptions(var AOptions: TMarkupOptions);
begin
  AOptions.ClearAllValues := ClearAllValues;
  AOptions.MarkupOptionType := SelectedOption;
  AOptions.MarkupValue := SelectedValue;
  AOptions.PercentageCompounded := PercentageCompounded;
  AOptions.ApplyToAll := ApplyToAll;

  // If the value is zero, then just treat it as a clear
  if AOptions.MarkupValue = 0 then
  begin
    AOptions.ClearAllValues := True;
  end;

end;

procedure TFrmCRMMarkupOptionsDlg.SetOptions(AOptions: TMarkupOptions);
begin
  SelectedOption := AOptions.MarkupOptionType;
  SelectedValue := AOptions.MarkupValue;
  PercentageCompounded := AOptions.PercentageCompounded;
end;

function TFrmCRMMarkupOptionsDlg.GetValue: Real;
begin
  if FClearAllValues then
    Exit(0);

  Result := IQMS.Common.Numbers.StoF(edtValue.Text);
end;

procedure TFrmCRMMarkupOptionsDlg.SetValue(const SelectedValue: Real);
begin
//  if (SelectedValue > 0) then
    edtValue.Text := FloatToStr(SelectedValue);
//  else
//    edtValue.Clear;
end;

function TFrmCRMMarkupOptionsDlg.GetApplyToAll: Boolean;
begin
  if not FCanApplyToAllSalesChoices then
    Exit(False);
  Result := chkApplyToAll.Checked;
end;

procedure TFrmCRMMarkupOptionsDlg.SetApplyToAll(const Value: Boolean);
begin
  chkApplyToAll.Checked := Value;
end;

procedure TFrmCRMMarkupOptionsDlg.Validate;
var
   r: Real;
begin
  if Trim(edtValue.Text) = '' then
    // crm_rscstr.cTXT0001915 = 'Please enter a value';
    raise Exception.Create(crm_rscstr.cTXT0001915);
  if not IQMS.Common.Numbers.IsStringValidFloat(edtValue.Text, r) then
    // crm_rscstr.cTXT0001951 = 'Invalid number';
    raise Exception.Create(crm_rscstr.cTXT0001951 );
end;

procedure TFrmCRMMarkupOptionsDlg.btnOkClick(Sender: TObject);
begin
  Validate;
  ModalResult := mrOk;
end;

procedure TFrmCRMMarkupOptionsDlg.btnClearClick(Sender: TObject);
begin
  FClearAllValues := True;
  ModalResult := mrOk;
end;

end.

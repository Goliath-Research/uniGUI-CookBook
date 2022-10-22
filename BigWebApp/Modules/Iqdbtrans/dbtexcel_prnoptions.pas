unit dbtexcel_prnoptions;

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
  ExtCtrls,
  StdCtrls,
  IQMS.WebVcl.FloatSpinner,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniImage;

type
  { Excel enumerated types }
  TExcelOrientation = (xloPortrait, xloLandscape);
  TExcelScaling = (xlscNone, xlscFitSheetOnePage, xlscFitColumnsOnePage,
    xlscFitRowsOnePage);

  { TExcelPrintOptions }
  TExcelPrintOptions = class(TComponent)
  private
    { Private declarations }
    FOrientation: TExcelOrientation;
    FScaling: TExcelScaling;
    FLeftMargin: Double;
    FHeaderMargin: Double;
    FBottomMargin: Double;
    FFooterMargin: Double;
    FTopMargin: Double;
    FRightMargin: Double;
    FSendToPrinter: Boolean;
    FShowDialog: Boolean;
    procedure SetBottomMargin(const Value: Double);
    procedure SetFooterMargin(const Value: Double);
    procedure SetHeaderMargin(const Value: Double);
    procedure SetLeftMargin(const Value: Double);
    procedure SetRightMargin(const Value: Double);
    procedure SetTopMargin(const Value: Double);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);
    procedure Reset;
    procedure LoadFromXML(const XML: TStringList);
    procedure SaveToXML(XML: TStringList);
    procedure SaveToRegistry(const AKey: string);
    procedure LoadFromRegistry(const AKey: string);
    procedure CopyFrom(AOptions: TExcelPrintOptions);
    function InchesToPoints(const AInches: Double): Double;
    procedure ApplyNormalMargins;
    procedure ApplyWideMargins;
    procedure ApplyNarrowMargins;
    property Orientation: TExcelOrientation read FOrientation
      write FOrientation;
    property Scaling: TExcelScaling read FScaling write FScaling;
    // Margins in "inches"
    property LeftMargin: Double read FLeftMargin write SetLeftMargin;
    property RightMargin: Double read FRightMargin write SetRightMargin;
    property TopMargin: Double read FTopMargin write SetTopMargin;
    property BottomMargin: Double read FBottomMargin write SetBottomMargin;
    property HeaderMargin: Double read FHeaderMargin write SetHeaderMargin;
    property FooterMargin: Double read FFooterMargin write SetFooterMargin;
    property SendToPrinter: Boolean read FSendToPrinter write FSendToPrinter;
    property ShowDialog: Boolean read FShowDialog write FShowDialog;
  end;

  { TFrmDbtExcelPrintOptions }
  TFrmDbtExcelPrintOptions = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlTop01: TUniPanel;
    PnlTop01Left01: TUniPanel;
    PnlTop01Client01: TUniPanel;
    lblOrientation: TUniLabel;
    lblScaling: TUniLabel;
    cmbOrientation: TUniComboBox;
    cmbScaling: TUniComboBox;
    PnlMarginsInner: TUniPanel;
    GroupBox1: TUniGroupBox;
    PnlMarginClient03: TUniPanel;
    PnlMarginLeft01: TUniPanel;
    PnlMarginClient01: TUniPanel;
    spinLeftMargin: TIQWebFloatSpinner;
    lblLeftMargin: TUniLabel;
    lblRightMargin: TUniLabel;
    lblTopMargin: TUniLabel;
    lblBottomMargin: TUniLabel;
    spinRightMargin: TIQWebFloatSpinner;
    spinTopMargin: TIQWebFloatSpinner;
    spinBottomMargin: TIQWebFloatSpinner;
    PnlCheckboxes: TUniPanel;
    chkSendToPrinter: TUniCheckBox;
    PnlMarginClient04: TUniPanel;
    PnlMarginLeft02: TUniPanel;
    PnlMarginClient02: TUniPanel;
    lblHeaderMargin: TUniLabel;
    lblFooterMargin: TUniLabel;
    spinHeaderMargin: TIQWebFloatSpinner;
    spinFooterMargin: TIQWebFloatSpinner;
    Panel4: TUniPanel;
    PnlPreview: TUniPanel;
    imgPortraitPreview: TUniImage;
    imgLandscapePreview: TUniImage;
    imgScalingNone: TUniImage;
    imgScalingFitAll: TUniImage;
    imgScalingFitColumns: TUniImage;
    imgScalingFitRows: TUniImage;
    btnNormalMargins: TUniButton;
    btnWideMargins: TUniButton;
    btnNarrowMargins: TUniButton;
    PnlMargins: TUniPanel;
    btnReset: TUniButton;
    chkDoNotShowAgain: TUniCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure DoComboBoxChange(Sender: TObject);
    procedure btnNormalMarginsClick(Sender: TObject);
    procedure btnWideMarginsClick(Sender: TObject);
    procedure btnNarrowMarginsClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetControls;
    procedure GetOptions(var AOptions: TExcelPrintOptions);
    procedure SetOptions(const AOptions: TExcelPrintOptions);
    procedure LoadOrientationComboBox;
    procedure LoadScalingComboBox;
    function GetCheckBoxVisible: Boolean;
    procedure SetCheckBoxVisible(const Value: Boolean);
  public
    { Public declarations }
    class function DoShowModal(var AOptions: TExcelPrintOptions;
      ADialogCheckBoxVisible: Boolean): Boolean;
    property DialogCheckBoxVisible: Boolean read GetCheckBoxVisible
      write SetCheckBoxVisible;
  end;



implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  Math;

const
  ExcelPointsInOneInch: Integer = 72;

  ExcelOrientationDescription: array [TExcelOrientation] of String =
    ('Portrait', 'Landscape');

  ExcelScalingDescription: array [TExcelScaling] of String = ('No Scaling',
    'Fit Sheet on One Page', 'Fit All Columns on One Page',
    'Fit All Rows on One Page');

{$REGION 'TExcelPrintOptions'}
  { TExcelPrintOptions }

constructor TExcelPrintOptions.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Reset;
end;

procedure TExcelPrintOptions.Reset;
begin
  Orientation := xloLandscape;
  Scaling := xlscNone;
  ApplyNormalMargins;
  SendToPrinter := False;
  ShowDialog := True;
end;

procedure TExcelPrintOptions.LoadFromXML(const XML: TStringList);
// ---------------------------------------------------------------------------
  function _GetTagValue(ATag: String): String;
  var
    iStart, iEnd: Integer;
  begin
    // Gets the value for a particular tag

    Result := ''; // initial
    iStart := 0; // initial
    iEnd := 0; // initial

    iStart := Pos(Format('<%s>', [ATag]), XML.Text);
    if iStart = 0 then
      Exit;
    iStart := +iStart + Length(Format('<%s>', [ATag]));
    iEnd := Pos(Format('</%s>', [ATag]), XML.Text);
    Result := Trim(Copy(XML.Text, iStart, iEnd - iStart));
  end;
// ---------------------------------------------------------------------------
  procedure _FillValueString(const ATag: String; var AValueToFill: String);
  begin
    AValueToFill := _GetTagValue(ATag);
  end;
// ---------------------------------------------------------------------------
  procedure _FillValueFloat(const ATag: String; var AValueToFill: Real;
    ADefault: Real);
  var
    S: String;
    N: Real;
  begin
    N := ADefault;
    S := _GetTagValue(ATag);
    if not IQMS.Common.Numbers.IsStringValidFloat(S, N) then
      N := ADefault;
    AValueToFill := N; // real value
  end;
// ---------------------------------------------------------------------------
  procedure _FillValueByte(const ATag: String; var AValueToFill: Byte;
    ADefault: Byte);
  var
    S: String;
    i: Integer;
  begin
    AValueToFill := ADefault;
    i := 0;
    S := _GetTagValue(ATag);
    if not IQMS.Common.Numbers.IsStringValidInteger(S, i) then
      i := ADefault;
    if i in [0 .. 255] then
      AValueToFill := i
    else
      AValueToFill := ADefault;
  end;
// ---------------------------------------------------------------------------
{ procedure _FillValueDateTime(const ATag: String; var AValueToFill: TDateTime);
  var
  S: String;
  N: Real;
  begin
  N := 0;
  S := _GetTagValue(ATag);
  if not IQMS.Common.Numbers.IsStringValidFloat(S, N) then
  N := 0;
  AValueToFill := N; // real value
  end; }
// ---------------------------------------------------------------------------
  procedure _FillValueBoolean(const ATag: String; var AValueToFill: Boolean;
    ADefault: Boolean);
  var
    S: String;
    N: Real;
  begin
    N := 0;
    S := _GetTagValue(ATag);
    if S = '' then
      AValueToFill := ADefault
    else
      AValueToFill := (S = 'Y') or (S = '1'); // 09/21/2006
  end;

// ---------------------------------------------------------------------------
var
  ATempByte: Byte;
  ATempDouble: Real;
begin
  if Assigned(XML) and (XML.Count > 0) then
    begin
      Reset;
      // Orientation
      _FillValueByte('Orientation', ATempByte, Ord(Orientation));
      if (ATempByte >= Ord( Low(TExcelOrientation))) and
        (ATempByte <= Ord( High(TExcelOrientation))) then
        Orientation := TExcelOrientation(ATempByte);

      // Scaling
      _FillValueByte('Scaling', ATempByte, Ord(Scaling));
      if (ATempByte >= Ord( Low(TExcelScaling))) and
        (ATempByte <= Ord( High(TExcelScaling))) then
        Scaling := TExcelScaling(ATempByte);

      // Margins
      _FillValueFloat('LeftMargin', ATempDouble, LeftMargin);
      LeftMargin := ATempDouble;

      _FillValueFloat('RightMargin', ATempDouble, RightMargin);
      RightMargin := ATempDouble;

      _FillValueFloat('TopMargin', ATempDouble, TopMargin);
      TopMargin := ATempDouble;

      _FillValueFloat('BottomMargin', ATempDouble, BottomMargin);
      BottomMargin := ATempDouble;

      _FillValueFloat('HeaderMargin', ATempDouble, HeaderMargin);
      HeaderMargin := ATempDouble;

      _FillValueFloat('FooterMargin', ATempDouble, FooterMargin);
      FooterMargin := ATempDouble;

      _FillValueBoolean('SendToPrinter', FSendToPrinter, SendToPrinter);
      _FillValueBoolean('ShowDialog', FShowDialog, ShowDialog);
    end;
end;

procedure TExcelPrintOptions.SaveToXML(XML: TStringList);
begin
  if Assigned(XML) then
    begin
      XML.Clear;
      XML.Add('<?xml version="1.0"?>');
      XML.Add('<!DOCTYPE TExcelPrintOptions>');
      XML.Add('<Options>');
      XML.Add(Format('<Orientation>%d</Orientation>', [Ord(Orientation)]));
      XML.Add(Format('<Scaling>%d</Scaling>', [Ord(Scaling)]));
      XML.Add(Format('<LeftMargin>%.2f</LeftMargin>', [LeftMargin]));
      XML.Add(Format('<RightMargin>%.2f</RightMargin>', [RightMargin]));
      XML.Add(Format('<TopMargin>%.2f</TopMargin>', [TopMargin]));
      XML.Add(Format('<BottomMargin>%.2f</BottomMargin>', [BottomMargin]));
      XML.Add(Format('<HeaderMargin>%.2f</HeaderMargin>', [HeaderMargin]));
      XML.Add(Format('<FooterMargin>%.2f</FooterMargin>', [FooterMargin]));
      XML.Add(Format('<SendToPrinter>%d</SendToPrinter>',
        [Integer(SendToPrinter)]));
      XML.Add(Format('<ShowDialog>%d</ShowDialog>', [Integer(ShowDialog)]));
      XML.Add('</Options>');
    end;
end;

procedure TExcelPrintOptions.LoadFromRegistry(const AKey: string);
var
  AValue: string;
  AXML: TStringList;
  AForm: TUniForm;
begin
  if Owner <> nil then
    begin
      AXML := TStringList.Create;
      try
        AForm := IQMS.Common.Controls.GetOwnerForm(Self);
        if IQMS.Common.RegFrm.IQRegStringScalarRead(AForm, AKey, AValue, True) then
          begin
            AXML.Text := AValue;
            LoadFromXML(AXML);
          end;
      finally
        if Assigned(AXML) then
          FreeAndNil(AXML);
      end;
    end;
end;

procedure TExcelPrintOptions.SaveToRegistry(const AKey: string);
var
  AXML: TStringList;
  AForm: TUniForm;
begin
  if Owner <> nil then
    begin
      AXML := TStringList.Create;
      try
        SaveToXML(AXML);
        AForm := IQMS.Common.Controls.GetOwnerForm(Self);
        IQMS.Common.RegFrm.IQRegStringScalarWrite(AForm, AKey, AXML.Text, True);
      finally
        if Assigned(AXML) then
          FreeAndNil(AXML);
      end;
    end;
end;

procedure TExcelPrintOptions.SetBottomMargin(const Value: Double);
begin
  FBottomMargin := IQMS.Common.Numbers.IQRoundEx(Math.Max(Value, 0.2), 2);
end;

procedure TExcelPrintOptions.SetFooterMargin(const Value: Double);
begin
  FFooterMargin := IQMS.Common.Numbers.IQRoundEx(Math.Max(Value, 0.2), 2);
end;

procedure TExcelPrintOptions.SetHeaderMargin(const Value: Double);
begin
  FHeaderMargin := IQMS.Common.Numbers.IQRoundEx(Math.Max(Value, 0.2), 2);
end;

procedure TExcelPrintOptions.SetLeftMargin(const Value: Double);
begin
  FLeftMargin := IQMS.Common.Numbers.IQRoundEx(Math.Max(Value, 0.2), 2);
end;

procedure TExcelPrintOptions.SetRightMargin(const Value: Double);
begin
  FRightMargin := IQMS.Common.Numbers.IQRoundEx(Math.Max(Value, 0.2), 2);
end;

procedure TExcelPrintOptions.SetTopMargin(const Value: Double);
begin
  FTopMargin := IQMS.Common.Numbers.IQRoundEx(Math.Max(Value, 0.2), 2);
end;

procedure TExcelPrintOptions.ApplyNarrowMargins;
begin
  // Margins in "inches"
  LeftMargin := 0.25;
  RightMargin := 0.25;
  TopMargin := 0.75;
  BottomMargin := 0.75;
  HeaderMargin := 0.3;
  FooterMargin := 0.3;
end;

procedure TExcelPrintOptions.ApplyNormalMargins;
begin
  // Margins in "inches"
  LeftMargin := 0.7;
  RightMargin := 0.7;
  TopMargin := 0.75;
  BottomMargin := 0.75;
  HeaderMargin := 0.3;
  FooterMargin := 0.3;
end;

procedure TExcelPrintOptions.ApplyWideMargins;
begin
  // Margins in "inches"
  LeftMargin := 1;
  RightMargin := 1;
  TopMargin := 1;
  BottomMargin := 1;
  HeaderMargin := 0.5;
  FooterMargin := 0.5;
end;

procedure TExcelPrintOptions.CopyFrom(AOptions: TExcelPrintOptions);
var
  AXML: TStringList;
begin
  if Assigned(AOptions) then
    begin
      AXML := TStringList.Create;
      try
        AOptions.SaveToXML(AXML);
        Self.LoadFromXML(AXML);
      finally
        if Assigned(AXML) then
          FreeAndNil(AXML);
      end;
    end;
end;

function TExcelPrintOptions.InchesToPoints(const AInches: Double): Double;
begin
  Result := ExcelPointsInOneInch * AInches;
end;

{$ENDREGION 'TExcelPrintOptions'}

{$REGION 'TFrmDbtExcelPrintOptions'}

{ TFrmDbtExcelPrintOptions }

class function TFrmDbtExcelPrintOptions.DoShowModal(var AOptions: TExcelPrintOptions; ADialogCheckBoxVisible: Boolean): Boolean;
var
  FrmDbtExcelPrintOptions: TFrmDbtExcelPrintOptions;
begin
  FrmDbtExcelPrintOptions := TFrmDbtExcelPrintOptions.Create(uniGUIApplication.UniApplication);
  with FrmDbtExcelPrintOptions do
  begin
    try
      SetOptions(AOptions);
      DialogCheckBoxVisible := ADialogCheckBoxVisible;
      Result := ShowModal = mrOk;
      if Result then
        GetOptions(AOptions);
    finally
      //Release;
    end;
  end;
end;

procedure TFrmDbtExcelPrintOptions.FormCreate(Sender: TObject);
var
  w: Integer;
begin
  { TODO -oSanketG -cWebConvert : Need to revisit ,
  [dcc32 Error] dbtexcel_prnoptions.pas(503): E2010 Incompatible types: 'TForm' and 'TFrmDbtExcelPrintOptions'}
  //IQMS.Common.Controls.CenterForm(Self, True);
  IQMS.Common.Screen.ApplySystemFont(Self);
  LoadOrientationComboBox;
  LoadScalingComboBox;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlTop01Client01);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCheckboxes);
  // Resize label panesl
  w := Math.MaxIntValue([lblOrientation.Width, lblScaling.Width]) + 8;
  PnlTop01Left01.Width := Math.Max(75, w);
  w := Math.MaxIntValue([lblLeftMargin.Width, lblRightMargin.Width,
    lblTopMargin.Width, lblBottomMargin.Width, lblHeaderMargin.Width,
    lblFooterMargin.Width]) + 8;
  w := Math.Max(75, w);
  PnlMarginLeft01.Width := w;
  PnlMarginLeft02.Width := w;
  PnlMarginClient03.Width := w + 78;
  SetControls;
end;

procedure TFrmDbtExcelPrintOptions.LoadOrientationComboBox;
var
  o: TExcelOrientation;
begin
  try
    cmbOrientation.Items.BeginUpdate;
    cmbOrientation.Items.Clear;
    for o := Low(TExcelOrientation) to High(TExcelOrientation) do
      cmbOrientation.Items.Add(ExcelOrientationDescription[o]);
  finally
    cmbOrientation.Items.EndUpdate;
  end;
end;

procedure TFrmDbtExcelPrintOptions.LoadScalingComboBox;
var
  o: TExcelScaling;
begin
  try
    cmbScaling.Items.BeginUpdate;
    cmbScaling.Items.Clear;
    for o := Low(TExcelScaling) to High(TExcelScaling) do
      cmbScaling.Items.Add(ExcelScalingDescription[o]);
  finally
    cmbScaling.Items.EndUpdate;
  end;
end;

procedure TFrmDbtExcelPrintOptions.GetOptions(var AOptions: TExcelPrintOptions);
var
  i: Integer;
begin
  i := IQMS.Common.Numbers.iIIf(cmbOrientation.ItemIndex = -1, 0,
    cmbOrientation.ItemIndex);
  AOptions.Orientation := TExcelOrientation(i);
  i := IQMS.Common.Numbers.iIIf(cmbScaling.ItemIndex = -1, 0, cmbScaling.ItemIndex);
  AOptions.Scaling := TExcelScaling(i);
  AOptions.LeftMargin := spinLeftMargin.Position;
  AOptions.RightMargin := spinRightMargin.Position;
  AOptions.TopMargin := spinTopMargin.Position;
  AOptions.BottomMargin := spinBottomMargin.Position;
  AOptions.HeaderMargin := spinHeaderMargin.Position;
  AOptions.FooterMargin := spinFooterMargin.Position;
  AOptions.SendToPrinter := chkSendToPrinter.Checked;
  AOptions.ShowDialog := not chkDoNotShowAgain.Checked;
end;

procedure TFrmDbtExcelPrintOptions.SetOptions(
  const AOptions: TExcelPrintOptions);
begin
  cmbOrientation.ItemIndex := Ord(AOptions.Orientation);
  cmbScaling.ItemIndex := Ord(AOptions.Scaling);
  spinLeftMargin.Position := AOptions.LeftMargin;
  spinRightMargin.Position := AOptions.RightMargin;
  spinTopMargin.Position := AOptions.TopMargin;
  spinBottomMargin.Position := AOptions.BottomMargin;
  spinHeaderMargin.Position := AOptions.HeaderMargin;
  spinFooterMargin.Position := AOptions.FooterMargin;
  chkSendToPrinter.Checked := AOptions.SendToPrinter;
  chkDoNotShowAgain.Checked := not AOptions.ShowDialog;
  SetControls;
end;

function TFrmDbtExcelPrintOptions.GetCheckBoxVisible: Boolean;
begin
  Result := chkDoNotShowAgain.Visible;
end;

procedure TFrmDbtExcelPrintOptions.SetCheckBoxVisible(const Value: Boolean);
begin
  chkDoNotShowAgain.Visible := Value;
end;

procedure TFrmDbtExcelPrintOptions.SetControls;
// Set the run time position
  procedure _SetRuntimePos(AImage: TUniImage; AComboBox: TUniComboBox;
    AIndex: Integer);
  begin
    AImage.Left := 8;
    AImage.Top := AComboBox.Top;
    AImage.Visible := AComboBox.ItemIndex = AIndex;
  end;

begin
  // Orientation preview
  _SetRuntimePos(imgPortraitPreview, cmbOrientation, 0);
  _SetRuntimePos(imgLandscapePreview, cmbOrientation, 1);
  // Scaling preview
  _SetRuntimePos(imgScalingNone, cmbScaling, 0);
  _SetRuntimePos(imgScalingFitAll, cmbScaling, 1);
  _SetRuntimePos(imgScalingFitColumns, cmbScaling, 2);
  _SetRuntimePos(imgScalingFitRows, cmbScaling, 3);
end;

procedure TFrmDbtExcelPrintOptions.btnNarrowMarginsClick(Sender: TObject);
var
  AOptions: TExcelPrintOptions;
begin
  AOptions := TExcelPrintOptions.Create(nil);
  try
    GetOptions(AOptions);
    AOptions.ApplyNarrowMargins;
    SetOptions(AOptions);
  finally
    if Assigned(AOptions) then
      FreeAndNil(AOptions);
  end;
end;

procedure TFrmDbtExcelPrintOptions.btnNormalMarginsClick(Sender: TObject);
var
  AOptions: TExcelPrintOptions;
begin
  AOptions := TExcelPrintOptions.Create(nil);
  try
    GetOptions(AOptions);
    AOptions.ApplyNormalMargins;
    SetOptions(AOptions);
  finally
    if Assigned(AOptions) then
      FreeAndNil(AOptions);
  end;
end;

procedure TFrmDbtExcelPrintOptions.btnResetClick(Sender: TObject);
var
  AOptions: TExcelPrintOptions;
begin
  AOptions := TExcelPrintOptions.Create(nil);
  try
    // Apply default options
    SetOptions(AOptions);
  finally
    FreeAndNil(AOptions);
  end;
end;

procedure TFrmDbtExcelPrintOptions.btnWideMarginsClick(Sender: TObject);
var
  AOptions: TExcelPrintOptions;
begin
  AOptions := TExcelPrintOptions.Create(nil);
  try
    GetOptions(AOptions);
    AOptions.ApplyWideMargins;
    SetOptions(AOptions);
  finally
    if Assigned(AOptions) then
      FreeAndNil(AOptions);
  end;
end;

procedure TFrmDbtExcelPrintOptions.DoComboBoxChange(Sender: TObject);
begin
  SetControls;
end;

{$ENDREGION 'TFrmDbtExcelPrintOptions'}

end.

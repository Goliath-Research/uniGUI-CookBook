unit cc_trans_analyzer;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellApi,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  cc_types,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  dm_cc,
  Vcl.wwdblook,
  IQMS.WebVcl.About,
  IQMS.WebVcl.CaptionPanel,
  FireDAC.UI.Intf,
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
  uniSpeedButton,
  uniRadioButton,
  uniMemo,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl, uniMainMenu, uniDBComboBox, Vcl.StdCtrls, Vcl.ComCtrls,
  uniImage;

type
  TFrmCCTransAnalyzer = class(TUniForm)
    PnlRequest: TUniPanel;
    memInput: TUniMemo;
    PnlToolbarRequest: TUniPanel;
    PnlToolbarCaptionRequest: TUniPanel;
    lblCaptionLabelRequest: TUniLabel;
    PnlToolbarInnerRequest: TUniPanel;
    sbtnOpen: TUniSpeedButton;
    sbtnClear: TUniSpeedButton;
    PnlInput: TUniPanel;
    Splitter1: TUniSplitter;
    PnlResults: TUniPanel;
    PnlToolbarCaptionResults: TUniPanel;
    lblCaptionLabelResults: TUniLabel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    ClearRequest1: TUniMenuItem;
    ClearResults1: TUniMenuItem;
    N1: TUniMenuItem;
    OpenDataFile1: TUniMenuItem;
    Actions1: TUniMenuItem;
    N2: TUniMenuItem;
    PnlOptions: TUniPanel;
    QryAccount: TFDQuery;
    QryAccountID: TBCDField;
    QryAccountDESCRIPTION: TStringField;
    QryAccountGATEWAY: TBCDField;
    QryAccountEPLANT_ID: TBCDField;
    QryAccountIS_DEFAULT: TStringField;
    QryAccountARCHIVED: TStringField;
    QryAccountMERCHANT_NAME: TStringField;
    QryAccountGATEWAY_DESCRIP: TStringField;
    SrcAccount: TDataSource;
    Analyze1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PnlClient01: TUniPanel;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    lblMerchantAccount: TUniLabel;
    lblTransactionType: TUniLabel;
    Label1: TUniLabel;
    cmbMerchantAccount: TUniDBLookupComboBox;
    cmbTransactionType: TUniComboBox;
    rbResponse: TUniRadioButton;
    rbRequest: TUniRadioButton;
    Panel1: TUniPanel;
    btnAnalyzeRequest: TUniButton;
    PageControl1: TUniPageControl;
    TabDisplay: TUniTabSheet;
    TabLog: TUniTabSheet;
    memResults: TUniMemo;
    PnlDisplayOuterClient: TUniPanel;
    PnlDisplay: TUniPanel;
    PnlImage: TUniPanel;
    imgResponse: TUniImage;
    CaptionPanel1: TIQWebCaptionPanel;
    sbtnExpandRequest: TUniSpeedButton;
    rtfStatus: TRichEdit;
    OpenDialog1: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Exit1Click(Sender: TObject);
    procedure OpenDataFile1Click(Sender: TObject);
    procedure ClearRequest1Click(Sender: TObject);
    procedure ClearResults1Click(Sender: TObject);
    procedure Analyze1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure sbtnExpandRequestClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    DM: TCC_DM;
    procedure WMDROPFILES(var Msg: TMessage); message WM_DROPFILES;
    function FindControlAtPos(AScreenPos: TPoint): TControl;
    function FindSubcontrolAtPos(AControl: TControl; AScreenPos,
      AClientPos: TPoint): TControl;
    function ActiveMemo: TUniMemo;
    procedure CheckGetGatewayOption(var AGateway: TCreditCardGateway);
    procedure CheckGetCreditCardAccountID(var ACreditCardAccountID: Int64);
    procedure CheckGetTransactionType(var ATransactionType: TTransactionType);
    procedure LoadTransactionTypeComboBox;
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  cc_epayment,
  cc_share,
  IQMS.Common.EditMemoStr,
  IQMS.Common.Controls,
  IQMS.Common.InfoBox,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  System.StrUtils,
  IQMS.Common.XML;


class procedure TFrmCCTransAnalyzer.DoShow;
var
  LFrmCCTransAnalyzer : TFrmCCTransAnalyzer;
begin
  LFrmCCTransAnalyzer := TFrmCCTransAnalyzer.Create(UniGUIApplication.UniApplication);
  LFrmCCTransAnalyzer.Show;
end;

procedure TFrmCCTransAnalyzer.FormShow(Sender: TObject);
var
  AAccountID: Integer;
begin
  DM.Name := '';
  memInput.Lines.Clear;
  memResults.Lines.Clear;
  ReOpen(QryAccount);
  LoadTransactionTypeComboBox;
  DragAcceptFiles(Handle, True);

  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
  IQMS.Common.Controls.AutoSizeCheckBoxes(PnlClient02);

  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, rbRequest, rbResponse]);
  if IQMS.Common.RegFrm.IQRegIntegerScalarRead(Self, 'Merchant Account ID',
    AAccountID) then
    begin
      QryAccount.Locate('ID', AAccountID, []);
      { TODO : Undeclared identifier: 'Value' }
      //cmbMerchantAccount.Value := IntToStr(AAccountID);
      cmbMerchantAccount.Text := QryAccountDESCRIPTION.AsString;
    end;
end;

procedure TFrmCCTransAnalyzer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, rbRequest, rbResponse]);
  IQMS.Common.RegFrm.IQRegIntegerScalarWrite(Self, 'Merchant Account ID',
    QryAccountID.AsInteger);
end;

procedure TFrmCCTransAnalyzer.LoadTransactionTypeComboBox;
var
  o: TTransactionType;
begin
  cmbTransactionType.Items.Clear;
  for o := Low(TTransactionType) to High(TTransactionType) do
    cmbTransactionType.Items.Add(cc_types.TransactionTypeStr[o]);
  cmbTransactionType.ItemIndex := 0;
end;

procedure TFrmCCTransAnalyzer.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCCTransAnalyzer.OpenDataFile1Click(Sender: TObject);
begin
{ TODO : TOpenDialog not converted yet }
  {with OpenDialog1 do
    if Execute then
      memInput.Lines.LoadFromFile(FileName); }
end;

procedure TFrmCCTransAnalyzer.sbtnExpandRequestClick(Sender: TObject);
var
  ARequest: string;
  sl: TStringList;
  S: string;
  x: Integer;
begin
  ARequest := memInput.Text;
  // XML
  try
    S := Copy(ARequest, 1, 100);
    if (Pos('<xml', S) > 0) or (Pos('<?xml', S) > 0) then
      begin
        if Pos('>&<', S) > 0 then
          S := StringReplace(ARequest, '>&<', '>'#13'<',
            [rfReplaceAll, rfIgnoreCase])
        else
          S := ARequest;

        sl := TStringList.Create;
        try
          IQMS.Common.XML.FormatXML(S, sl);
          IQMS.Common.XML.ViewXML(Self, sl.Text);
        finally
          sl.Free;
        end;
        Exit;
      end;
  except
    IQMS.Common.EditMemoStr.DoViewMemoStr(ARequest, lblCaptionLabelRequest.Caption);
    Exit;
  end;

  // Name/value pairs
  try
    S := Copy(ARequest, 1, 100);
    x := Pos('=', S);
    if (x > 0) and (PosEx('&', S, x) > x) then
      begin
        S := StringReplace(ARequest, '&', #13,
          [rfReplaceAll, rfIgnoreCase]);
        sl := TStringList.Create;
        try
          sl.Text := S;
          DoShowInfoBox(sl, lblCaptionLabelRequest.Caption);
        finally
          sl.Free;
        end;
        Exit;
      end;
  except
    IQMS.Common.EditMemoStr.DoViewMemoStr(ARequest, lblCaptionLabelRequest.Caption);
    Exit;
  end;

  // Default
  IQMS.Common.EditMemoStr.DoViewMemoStr(ARequest, lblCaptionLabelRequest.Caption);end;

procedure TFrmCCTransAnalyzer.UniFormCreate(Sender: TObject);
begin
  DM := TCC_DM.Create(UniGUIApplication.UniApplication);
end;

procedure TFrmCCTransAnalyzer.ClearRequest1Click(Sender: TObject);
begin
  memInput.Lines.Clear;
end;

procedure TFrmCCTransAnalyzer.ClearResults1Click(Sender: TObject);
begin
  memResults.Lines.Clear;
end;

procedure TFrmCCTransAnalyzer.FormDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

function TFrmCCTransAnalyzer.FindSubcontrolAtPos(AControl: TControl;
  AScreenPos, AClientPos: TPoint): TControl;
var
  i: Integer;
  C: TControl;
begin
  Result := nil;
  C := AControl;
  if (C = nil) or not C.Visible or not TRect.Create(C.Left, C.Top,
    C.Left + C.Width, C.Top + C.Height).Contains(AClientPos) then
    Exit;
  Result := AControl;
  if AControl is TWinControl then
    for i := 0 to TWinControl(AControl).ControlCount - 1 do
      begin
        C := FindSubcontrolAtPos(TWinControl(AControl).Controls[i], AScreenPos,
          AControl.ScreenToClient(AScreenPos));
        if C <> nil then
          Result := C;
      end;
end;

procedure TFrmCCTransAnalyzer.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

function TFrmCCTransAnalyzer.ActiveMemo: TUniMemo;
var
  APoint: TPoint;
  AControl: TControl;
begin
  Result := nil;
  GetCursorPos(APoint);
  AControl := FindControlAtPos(APoint);
  if (AControl <> nil) and (AControl is TUniMemo) then
    Result := TUniMemo(AControl);
end;

function TFrmCCTransAnalyzer.FindControlAtPos(AScreenPos: TPoint): TControl;
var
  i: Integer;
  f, m: TUniForm;
  p: TPoint;
  r: TRect;
begin
  Result := nil;
  { TODO :  'TUniForm' and 'TForm' }
  (*for i := Screen.FormCount - 1 downto 0 do
    begin
      f := Screen.Forms[i];
      if f.Visible and (f.Parent = nil) and (f.FormStyle <> fsMDIChild) and
        TRect.Create(f.Left, f.Top, f.Left + f.Width, f.Top + f.Height)
        .Contains(AScreenPos)
      then
        Result := f;
    end;
  Result := FindSubcontrolAtPos(Result, AScreenPos, AScreenPos);
  if (Result is TUniForm) and (TUniForm(Result).ClientHandle <> 0) then
    begin
      Winapi.Windows.GetWindowRect(TUniForm(Result).ClientHandle, r);
      p := TPoint.Create(AScreenPos.X - r.Left, AScreenPos.Y - r.Top);
      m := nil;
      for i := TUniForm(Result).MDIChildCount - 1 downto 0 do
        begin
          f := TUniForm(Result).MDIChildren[i];
          if TRect.Create(f.Left, f.Top, f.Left + f.Width, f.Top + f.Height)
            .Contains(p) then
            m := f;
        end;
      if m <> nil then
        Result := FindSubcontrolAtPos(m, AScreenPos, p);
    end;     *)
end;

procedure TFrmCCTransAnalyzer.WMDROPFILES(var Msg: TMessage);
var
  i, j: Integer;
  ASize: Integer;
  PName: PChar;
  AActiveMemo: TUniMemo;
  AFileName, AExt: string;
begin
  AActiveMemo := Self.ActiveMemo;
  // This method enables drag and drop with the Winapi.Windows Explorer
  if AActiveMemo <> nil then
    try
      inherited;

      j := DragQueryFile(Msg.WParam, $FFFFFFFF, PName, 255);
      for i := 0 to (j - 1) do
        begin
          ASize := DragQueryFile(Msg.WParam, i, nil, 0) + 1;
          PName := StrAlloc(ASize);
          DragQueryFile(Msg.WParam, i, PName, ASize);
          AFileName := StrPas(PName);

          AExt := Trim(UpperCase(ExtractFileExt(AFileName)));
          if AActiveMemo = memInput then
            memInput.Lines.LoadFromFile(AFileName);
          StrDispose(PName);
        end;
      DragFinish(Msg.WParam);
    except
      on E: System.SysUtils.Exception do
        raise System.SysUtils.Exception.CreateFmt('%s [WMDROPFILES()])',
          [E.Message]);
    end;
end;

procedure TFrmCCTransAnalyzer.CheckGetGatewayOption(var AGateway
  : TCreditCardGateway);
var
  AGatewayInt: Integer;
begin
  AGatewayInt := QryAccountGATEWAY.AsInteger;
  if (AGatewayInt = - 1) then
    raise Exception.Create('Please select a credit card gateway.');
  AGateway := cc_types.SupportedGatewayByIndex(AGatewayInt);
  if (AGateway = TCreditCardGateway(0)) then
    raise Exception.Create('Could not resolve gateway.');
end;

procedure TFrmCCTransAnalyzer.CheckGetTransactionType(
  var ATransactionType: TTransactionType);
begin
  if cmbTransactionType.ItemIndex = - 1 then
    raise Exception.Create('Please select a transaction type.');
  ATransactionType := TTransactionType(cmbTransactionType.ItemIndex);
end;

procedure TFrmCCTransAnalyzer.CheckGetCreditCardAccountID
  (var ACreditCardAccountID: Int64);
begin
  if (ACreditCardAccountID = 0) or (cmbMerchantAccount.Text = '') then
    raise Exception.Create('Please select a credit card gateway.');
  ACreditCardAccountID := QryAccountID.AsLargeInt;
end;

procedure TFrmCCTransAnalyzer.Analyze1Click(Sender: TObject);
var
  AGateway: TCreditCardGateway;
  ACreditCardAccountID: Int64;
  AProcessor: TEPaymentProcessor;
  ATransactionType: TTransactionType; // cmbTransactionType
  ARequest, AResult: string;
begin
  memResults.Lines.Clear;
  CheckGetGatewayOption(AGateway);
  CheckGetCreditCardAccountID(ACreditCardAccountID);
  CheckGetTransactionType(ATransactionType);
  ARequest := memInput.Text;

  // Ensure request is correct
  if AGateway = cgwAuthorizeNet then
   ARequest := StringReplace(ARequest, #13, '&', [rfReplaceAll, rfIgnoreCase]);
  AProcessor := cc_share.CreateEPaymentProcessor(Self, ACreditCardAccountID);
  try
    // Request
    if rbRequest.Checked then
      AProcessor.SimulateRequest(ATransactionType, ARequest, AResult)
      // Response
    else
      AProcessor.SimulateResponse(ATransactionType, ARequest, AResult);
    { TODO : SetTransactionDisplay has been commented out for the moment in the dm }
    //DM.SetTransactionDisplay(AProcessor, rtfStatus, imgResponse);

    memResults.Text := AResult;

  finally
    FreeAndNil(AProcessor);
  end;

end;

end.

unit cc_logfrm;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  cc_log,
  cc_logfilter,
  FireDAC.Stan.Intf,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  System.ImageList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniMemo,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniPageControl, uniGUIFrame, IQUniGrid;

type
  TFrmCCLog = class(TUniForm)
    PnlHeader: TUniPanel;
    PnlDetail: TUniPanel;
    Splitter1: TUniSplitter;
    PnlToolbar: TUniPanel;
    SrcData: TDataSource;
    QryData: TFDQuery;
    NavMain: TUniDBNavigator;
    SR: TIQWebSecurityRegister;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    GridHeader: TIQUniGridControl;
    pcDetail: TUniPageControl;
    TabMerchantData: TUniTabSheet;
    TabRequest: TUniTabSheet;
    TabResponse: TUniTabSheet;
    TabDetail: TUniTabSheet;
    memDetails: TUniMemo;
    memRequest: TUniMemo;
    memResponse: TUniMemo;
    memMerchant: TUniMemo;
    QryDataID: TBCDField;
    QryDataCLASS: TBCDField;
    QryDataSOURCE: TBCDField;
    QryDataCREATED: TDateTimeField;
    QryDataCREATEDBY: TStringField;
    QryDataPostingSource: TStringField;
    QryDataEntryClass: TStringField;
    sbtnFilter: TUniSpeedButton;
    Filter1: TUniMenuItem;
    PurgeLogData1: TUniMenuItem;
    N1: TUniMenuItem;
    Options1: TUniMenuItem;
    ViewMerchantData1: TUniMenuItem;
    View1: TUniMenuItem;
    ViewRequestData1: TUniMenuItem;
    ViewResponseData1: TUniMenuItem;
    ImageList1: TUniImageList;
    QryDataImageIndex: TIntegerField;
    QryDataMACHINENAME: TStringField;
    QryDataMACHINEUSERID: TStringField;
    QryDataMACHINEDATETIME: TDateTimeField;
    PRequest: TUniPopupMenu;
    Format1: TUniMenuItem;
    FormatAsXML1: TUniMenuItem;
    N2: TUniMenuItem;
    RequestCopy1: TUniMenuItem;
    RequestSelectAll1: TUniMenuItem;
    N3: TUniMenuItem;
    RequestSavetoFile1: TUniMenuItem;
    PResponse: TUniPopupMenu;
    Format2: TUniMenuItem;
    FormatAsXML2: TUniMenuItem;
    N4: TUniMenuItem;
    ResponseCopy1: TUniMenuItem;
    ResponseSelectAll1: TUniMenuItem;
    N5: TUniMenuItem;
    ResponseSaveToFile1: TUniMenuItem;
    PDetails: TUniPopupMenu;
    DetailsCopy1: TUniMenuItem;
    DetailsSelectAll1: TUniMenuItem;
    N6: TUniMenuItem;
    DetailsSavetoFile1: TUniMenuItem;
    PMerchant: TUniPopupMenu;
    CopyMerchantInformation1: TUniMenuItem;
    SelectAllMerchantInformation1: TUniMenuItem;
    SaveDialog1: TSaveDialog;
    FlattenXML1: TUniMenuItem;
    FlattenXML2: TUniMenuItem;
    Contents1: TUniMenuItem;
    FormatXML1: TUniMenuItem;
    FormatXML2: TUniMenuItem;
    PnlToolbarResponse: TUniPanel;
    Bevel1: TUniPanel;
    sbtnExpandResponse: TUniSpeedButton;
    PnlToolbarRequest: TUniPanel;
    sbtnExpandRequest: TUniSpeedButton;
    Bevel2: TUniPanel;
    SaveRequestandResponseAsArchive1: TUniMenuItem;
    SaveZipDialog: TSaveDialog;
    PHeader: TUniPopupMenu;
    Filter2: TUniMenuItem;
    SaveRequestandResponseasArchive2: TUniMenuItem;
    SendEmailtoIQMS1: TUniMenuItem;
    N7: TUniMenuItem;
    EmailRequestandResponse1: TUniMenuItem;
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SrcDataDataChange(Sender: TObject; Field: TField);
    procedure QryDataCalcFields(DataSet: TDataSet);
    procedure QryDataAfterOpen(DataSet: TDataSet);
    procedure Filter1Click(Sender: TObject);
    procedure PurgeLogData1Click(Sender: TObject);
    procedure QryDataBeforeOpen(DataSet: TDataSet);
    { TODO : TNavigateBtn not yet converted }
    //procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure DoViewMenuClick(Sender: TObject);
    procedure View1Click(Sender: TObject);
    procedure FormatAsXML1Click(Sender: TObject);
    procedure DoCopyText(Sender: TObject);
    procedure DoSelectAll(Sender: TObject);
    procedure DoSaveToFile(Sender: TObject);
    procedure FormatAsXML2Click(Sender: TObject);
    procedure FlattenXML1Click(Sender: TObject);
    procedure FlattenXML2Click(Sender: TObject);
    procedure PMerchantPopup(Sender: TObject);
    procedure CopyMerchantInformation1Click(Sender: TObject);
    procedure SelectAllMerchantInformation1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormatXML1Click(Sender: TObject);
    procedure FormatXML2Click(Sender: TObject);
    procedure sbtnExpandRequestClick(Sender: TObject);
    procedure sbtnExpandResponseClick(Sender: TObject);
    procedure SaveRequestandResponseAsArchive1Click(Sender: TObject);
    procedure SendEmailtoIQMS1Click(Sender: TObject);
    procedure QryDataUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure FormShow(Sender: TObject);
    procedure EmailRequestandResponse1Click(Sender: TObject);
  private
    { Private declarations }
    FLogFilter: TLogFilter;
    FDecrypted_Details, FDecrypted_Request, FDecrypted_Response,
      FDecrypted_Merchant: string;
    procedure RegGetLogFilter;
    procedure RegSetLogFilter;
    procedure PopulateDecryptedData;
    // function FormatAsNameValuePairs(const AText: string): string;
    function FormatAsXML(const AText: string): string;
    function ActiveMemoControl: TUniMemo;
    function FlattenXML(const AText: string): string;
    procedure SaveRequestResponseToArchive(const AFileName: string);
    procedure SaveAllToArchive(const AFileName: string);
    procedure GetMinimalMerchantData(var ALines: TStringList);
    // function FormatXML(const AText: string): string;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


uses
  cc_purgelog,
  cc_rscstr,
  IQMS.Common.EditMemoStr,
  IQMS.Common.EmailUtils,
  IQMS.Common.FileUtils,
  IQMS.Common.HelpHook,
  IQMS.Common.InfoBox,
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  System.StrUtils,
  IQMS.Common.XML,
  cc_encrypt;

procedure TFrmCCLog.FormCreate(Sender: TObject);
var
  b: Boolean;
begin
  // 06/20/2012 Update the package encryption keys so that
  // we can see data.
  cc_encrypt.ResetPackage;
  RegGetLogFilter;
  ReOpen(QryData);
  b := True;
  if IQMS.Common.RegFrm.IQRegBooleanScalarRead(Self, 'View Request Data', b) then
    TabRequest.TabVisible := b;
  b := True;
  if IQMS.Common.RegFrm.IQRegBooleanScalarRead(Self, 'View Response Data', b) then
    TabResponse.TabVisible := b;
  b := True;
  if IQMS.Common.RegFrm.IQRegBooleanScalarRead(Self, 'View Merchant Data', b) then
    TabMerchantData.TabVisible := b;
  pcDetail.ActivePageIndex := 0;
end;

procedure TFrmCCLog.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlHeader]);
end;

procedure TFrmCCLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlHeader]);
  RegSetLogFilter;
  IQMS.Common.RegFrm.IQRegBooleanScalarWrite(Self, 'View Request Data',
    TabRequest.TabVisible);
  IQMS.Common.RegFrm.IQRegBooleanScalarWrite(Self, 'View Response Data',
    TabResponse.TabVisible);
  IQMS.Common.RegFrm.IQRegBooleanScalarWrite(Self, 'View Merchant Data',
    TabMerchantData.TabVisible);
end;

procedure TFrmCCLog.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCCLog.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmCCLog.SrcDataDataChange(Sender: TObject; Field: TField);
begin
  if not Showing then
    Exit;
  PopulateDecryptedData;
end;

procedure TFrmCCLog.PopulateDecryptedData;
// --------------------------------------------------------------------------
  function _Eval(AField: string): string;
  begin
    Result := SelectValueFmtAsString
      ('SELECT iqms.cc_encrypt.get_decrypted_clob(%s) FROM credit_card_log ' +
      'WHERE id = %d', [AField, QryDataID.AsLargeInt]);
  end;
// --------------------------------------------------------------------------

begin
  // 08/31/2009 Removed the CLOB fields because they were causing the
  // "Invalid BLOB Handle in record buffer" errors.
  FDecrypted_Details := _Eval('TEXT');
  FDecrypted_Request := _Eval('REQUESTDATA');
  FDecrypted_Response := _Eval('RESPONSEDATA');
  FDecrypted_Merchant := _Eval('MERCHANTDATA');
  memDetails.Text := FDecrypted_Details;

  memRequest.Text := FDecrypted_Request;
  { TODO : ssVertical undeclared }
  //memRequest.ScrollBars := ssVertical;
  memRequest.WordWrap := True;

  memResponse.Text := FDecrypted_Response;
  { TODO : ssVertical undeclared }
  //memResponse.ScrollBars := ssVertical;
  memResponse.WordWrap := True;

  memMerchant.Text := FDecrypted_Merchant;
end;

procedure TFrmCCLog.QryDataCalcFields(DataSet: TDataSet);
var
  ASource: TLogSource;
  AClass: TLogClass;
begin
  ASource := TLogSource(QryDataSOURCE.AsInteger);
  AClass := TLogClass(QryDataCLASS.AsInteger);
  QryDataPostingSource.AsString := LogSourceStr[ASource];
  QryDataEntryClass.AsString := LogClassStr[AClass];
  QryDataImageIndex.AsInteger := Ord(AClass);
end;

procedure TFrmCCLog.QryDataUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);
begin
  AAction := eaApplied;
end;

procedure TFrmCCLog.QryDataAfterOpen(DataSet: TDataSet);
begin
  PopulateDecryptedData;
end;

procedure TFrmCCLog.Filter1Click(Sender: TObject);
begin
  if GetLogFilter(FLogFilter) then
    RefreshDataSetByID(QryData);
end;

procedure TFrmCCLog.PurgeLogData1Click(Sender: TObject);
begin
  if DoCCPurgeLog then // cc_purgelog.pas
    RefreshDataSetByID(QryData);
end;

procedure TFrmCCLog.QryDataBeforeOpen(DataSet: TDataSet);
var
  i: Integer;
  AClassStr, ASourceStr: string;
begin
  AClassStr := '_';
  for i := 0 to Ord(high(TLogClass)) do
    if (TLogClass(i) in FLogFilter.LogClasses) then
      AClassStr := AClassStr + Format('%d_', [Ord(TLogClass(i))]);
  ASourceStr := '_';
  for i := 0 to Ord(high(TLogSource)) do
    if (TLogSource(i) in FLogFilter.LogSources) then
        ASourceStr := ASourceStr + Format('%d_', [Ord(TLogSource(i))]);

  AssignQueryParamValue(DataSet, 'CLASS_FILTER', AClassStr);
  AssignQueryParamValue(DataSet, 'BY_CLASS_FILTER', Integer(FLogFilter.LogClasses <> []));
  AssignQueryParamValue(DataSet, 'SOURCE_FILTER', ASourceStr);
  AssignQueryParamValue(DataSet, 'BY_SOURCE_FILTER', Integer(FLogFilter.LogSources <> []));
  AssignQueryParamValue(DataSet, 'USER_ID', FLogFilter.UserID);
  AssignQueryParamValue(DataSet, 'BY_USER_ID', Integer(not FLogFilter.UserID.IsEmpty));
  AssignQueryParamValue(DataSet, 'BY_PK_HIDE', Integer(FLogFilter.HideArchived));
end;

procedure TFrmCCLog.RegGetLogFilter;
var
  S: string;
  i, n: Integer;
  b: Boolean;
begin
  // initialization
  n := 0;
  FLogFilter.LogSources := [];
  FLogFilter.LogClasses := [];
  FLogFilter.AllClasses := True;
  if IQMS.Common.RegFrm.IQRegBooleanScalarRead(Self, 'Log Show All Classes', b, True) then
    FLogFilter.AllClasses := b;
  FLogFilter.AllSources := True;
  if IQMS.Common.RegFrm.IQRegBooleanScalarRead(Self, 'Log Show All Sources', b, True) then
    FLogFilter.AllSources := b;
  if IQMS.Common.RegFrm.IQRegStringScalarRead(Self, 'Log Source Filter', S, True) and
    (S > '') then
    begin
      for i := 1 to Length(S) do
        if IQMS.Common.Numbers.IsStringValidInteger(S[i], n) and (n > 0) and
          (n <= Ord(high(TLogSource))) then
          Include(FLogFilter.LogSources, TLogSource(n));
    end;
  if IQMS.Common.RegFrm.IQRegStringScalarRead(Self, 'Log Class Filter', S, True) and
    (S > '') then
    begin
      for i := 1 to Length(S) do
        if IQMS.Common.Numbers.IsStringValidInteger(S[i], n) and (n > 0) and
          (n <= Ord(high(TLogClass))) then
          Include(FLogFilter.LogClasses, TLogClass(n));
    end;
  FLogFilter.HideArchived := True; // default
end;

procedure TFrmCCLog.RegSetLogFilter;
begin
  IQMS.Common.RegFrm.IQRegStringScalarWrite(Self, 'Log Source Filter',
    QryData.ParamByName('SOURCE_FILTER').AsString, True);
  IQMS.Common.RegFrm.IQRegStringScalarWrite(Self, 'Log Class Filter',
    QryData.ParamByName('CLASS_FILTER').AsString, True);
  IQMS.Common.RegFrm.IQRegBooleanScalarWrite(Self, 'Log Show All Classes',
    FLogFilter.AllClasses, True);
  IQMS.Common.RegFrm.IQRegBooleanScalarWrite(Self, 'Log Show All Sources',
    FLogFilter.AllSources, True);
end;

procedure TFrmCCLog.SaveRequestandResponseAsArchive1Click(Sender: TObject);
begin
  // Get the zip file location
  with SaveZipDialog do
    begin
      // Clear the file name or the second time the dialog is displayed
      // it shows the previous path and filename as the file name.
      FileName := '';
      if Execute then
        SaveRequestResponseToArchive(FileName)
      else
        Exit;
    end;
end;

procedure TFrmCCLog.SaveRequestResponseToArchive(const AFileName: string);
var
  ADirectory, ARequestFile, AResponseFile: string;
  sl: TStringList;
begin
  // Get path and file names (strings)
  ADirectory := ExtractFilePath(AFileName);
  ARequestFile := ADirectory + 'Request.xml';
  AResponseFile := ADirectory + 'Response.xml';

  // Generate the zip file
  try
    // Save the request and response to files
    memRequest.Lines.SaveToFile(ARequestFile);
    memResponse.Lines.SaveToFile(AResponseFile);
    // Add the files to the zip file
    sl := TStringList.Create;
    try
      sl.Add(ARequestFile);
      sl.Add(AResponseFile);
      // Creates the zip file
      IQMS.Common.FileUtils.ZipFiles(AFileName, sl);
    finally
      sl.Free;
    end;
  finally
    // Delete the xml files
    DeleteFile(ARequestFile);
    DeleteFile(AResponseFile);
  end;
end;

procedure TFrmCCLog.GetMinimalMerchantData(var ALines: TStringList);
var
  sl: TStringList;
  i: Integer;
begin
  if Assigned(ALines) then
    begin
      sl := TStringList.Create;
      try
        sl.Text := IQMS.Common.StringUtils.StrTran(FDecrypted_Merchant, ';', #13);
        for i := 0 to sl.Count - 1 do
          begin
            if (CompareText(sl.Names[i], 'Gateway') = 0) or
              (CompareText(sl.Names[i], 'TRANSACTION_TYPE') = 0) or
              (CompareText(sl.Names[i], 'CURRENCY_CODE') = 0) or
              (CompareText(sl.Names[i], 'PROCESSING_CLASS') = 0) or
              (CompareText(sl.Names[i], 'PRODUCTION_URL') = 0) or
              (CompareText(sl.Names[i], 'PRODUCTION_PORT') = 0) or
              (CompareText(sl.Names[i], 'TEST_URL') = 0) or
              (CompareText(sl.Names[i], 'TEST_PORT') = 0) or
              (CompareText(sl.Names[i], 'TEST_ACCOUNT') = 0) or
              (CompareText(sl.Names[i], 'TIME_OUT') = 0) or
              (CompareText(sl.Names[i], 'FIREWALL_DETECT') = 0) then
              ALines.Add(sl.Strings[i]);
          end;
      finally
        FreeAndNil(sl);
      end;
    end;
end;

procedure TFrmCCLog.SaveAllToArchive(const AFileName: string);
var
  ADirectory, ARequestFile, AResponseFile, ADetailsFile, AMerchantFile: string;
  sl, AMerchantData: TStringList;
begin
  // Get path and file names (strings)
  ADirectory := ExtractFilePath(AFileName);
  ARequestFile := ADirectory + 'Request.txt';
  AResponseFile := ADirectory + 'Response.txt';
  ADetailsFile := ADirectory + 'Details.txt';
  AMerchantFile := ADirectory + 'Merchant.txt';
  // Generate the zip file
  try
    // Save the request and response to files
    memRequest.Lines.SaveToFile(ARequestFile);
    memResponse.Lines.SaveToFile(AResponseFile);
    memDetails.Lines.SaveToFile(ADetailsFile);

    // Get just the minimal data required.  This excludes
    // sensitive information.
    AMerchantData := TStringList.Create;
    try
      GetMinimalMerchantData(AMerchantData);
      AMerchantData.SaveToFile(AMerchantFile);
    finally
      FreeAndNil(AMerchantData);
    end;

    // Add the files to the zip file
    sl := TStringList.Create;
    try
      sl.Add(ADetailsFile);
      sl.Add(ARequestFile);
      sl.Add(AResponseFile);
      sl.Add(AMerchantFile);
      // Creates the zip file
      IQMS.Common.FileUtils.ZipFiles(AFileName, sl);
    finally
      sl.Free;
    end;
  finally
    // Delete the xml files
    DeleteFile(ARequestFile);
    DeleteFile(AResponseFile);
  end;
end;

procedure TFrmCCLog.sbtnExpandResponseClick(Sender: TObject);
var
  ADlgCaption: string;
  sl: TStringList;
  S: string;
  x: Integer;
begin
  ADlgCaption := TabResponse.Caption;
  // XML
  try
    S := Copy(FDecrypted_Response, 1, 100);
    if (Pos('<xml', S) > 0) or (Pos('<?xml', S) > 0) then
      begin
        if Pos('>&<', S) > 0 then
          S := StringReplace(FDecrypted_Response, '>&<', '>'#13'<',
            [rfReplaceAll, rfIgnoreCase])
        else
          S := FDecrypted_Response;

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
    IQMS.Common.EditMemoStr.DoViewMemoStr(FDecrypted_Response, ADlgCaption);
    Exit;
  end;

  try
    // Name/value pairs
    S := Copy(FDecrypted_Response, 1, 100);
    x := Pos('=', S);
    if (x > 0) and (PosEx('&', S, x) > x) then
      begin
        S := StringReplace(FDecrypted_Response, '&', #13,
          [rfReplaceAll, rfIgnoreCase]);
        sl := TStringList.Create;
        try
          sl.Text := S;
          DoShowInfoBox(sl, ADlgCaption);
        finally
          sl.Free;
        end;
        Exit;
      end;
  except
    IQMS.Common.EditMemoStr.DoViewMemoStr(FDecrypted_Response, ADlgCaption);
    Exit;
  end;

  // Default
  IQMS.Common.EditMemoStr.DoViewMemoStr(FDecrypted_Response, ADlgCaption);
end;

{ TODO : TNavigateBtn not yet converted }
{procedure TFrmCCLog.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
    begin
      RefreshDataSetByID(QryData);
      System.SysUtils.Abort;
    end;
end;  }

procedure TFrmCCLog.View1Click(Sender: TObject);
begin
  ViewRequestData1.Checked := pcDetail.Pages[1].TabVisible;
  ViewResponseData1.Checked := pcDetail.Pages[2].TabVisible;
  ViewMerchantData1.Checked := pcDetail.Pages[3].TabVisible;
end;

procedure TFrmCCLog.DoViewMenuClick(Sender: TObject);
var
  ATag: Integer;
  AVisible: Boolean;
begin
  Application.ProcessMessages;
  if (Sender = nil) then
    Exit;
  ATag := TComponent(Sender).Tag;
  if (ATag in [1 .. 3]) then
    begin
      AVisible := pcDetail.Pages[ATag].TabVisible;
      pcDetail.Pages[ATag].TabVisible := not AVisible;
      if not AVisible then
        pcDetail.ActivePageIndex := 0;
    end;
end;

function TFrmCCLog.ActiveMemoControl: TUniMemo;
begin
  // get component
  case pcDetail.ActivePageIndex of
    0:
      Result := memDetails;
    1:
      Result := memRequest;
    2:
      Result := memResponse;
    3:
      Result := memMerchant;
  else
    Result := nil;
  end;
end;

{ function TFrmCCLog.FormatAsNameValuePairs(const AText: string): string;
  var
  ATemp: string;
  ATags, AResult: TStringList;
  i: Integer;
  function _TagName(const ATag: string): string;
  begin
  Result := ATag;
  Result := IQMS.Common.StringUtils.StrTran(Result, '<', '');
  Result := IQMS.Common.StringUtils.StrTran(Result, '>', '');
  end;

  begin
  ATags := nil;
  AResult := nil;
  // Get as XML first
  ATemp := Trim(IQMS.Common.XML.ParseFromURI(AText));
  try
  ATags := TStringList.Create;
  AResult := TStringList.Create;
  ListTags(ATemp, ATags);
  ATemp := '';
  for i := 0 to ATags.Count - 1 do
  begin
  ATemp := GetXMLTagValue(AText, ATags.Strings[i]);
  AResult.Add(Format('%s: %s', [_TagName(ATags.Strings[i]), ATemp]));
  end;
  Result := AResult.Text;
  finally
  if Assigned(ATags) then
  FreeAndNil(ATags);
  if Assigned(AResult) then
  FreeAndNil(AResult);
  end;
  end; }

function TFrmCCLog.FormatAsXML(const AText: string): string;
begin
  if Trim(AText) = '' then
    Exit;
  Result := IQMS.Common.XML.ParseFromURI(AText);
end;

function TFrmCCLog.FlattenXML(const AText: string): string;
var
  S: string;
  sl1, sl2: TStringList;
  i: Integer;
begin
  if Trim(AText) = '' then
    Exit;
  S := AText;
  S := IQMS.Common.StringUtils.StrTran(S, #10, '');
  S := IQMS.Common.StringUtils.StrTran(S, #13, '');
  S := IQMS.Common.StringUtils.StrTran(S, '>', '>'#13#10);
  S := IQMS.Common.StringUtils.StrTran(S, '</', #13#10'</');
  S := IQMS.Common.StringUtils.StrTran(S, '><', '>'#13#10'<');
  try
    sl1 := TStringList.Create;
    sl2 := TStringList.Create;
    sl1.Text := S;
    for i := 0 to sl1.Count - 1 do
      if Trim(sl1.Strings[i]) > '' then
        sl2.Add(Trim(sl1.Strings[i]));
    Result := sl2.Text;
  finally
    if Assigned(sl1) then
      FreeAndNil(sl1);
    if Assigned(sl2) then
      FreeAndNil(sl2);
  end;
end;

procedure TFrmCCLog.FormatAsXML1Click(Sender: TObject);
begin
  memRequest.Text := FormatAsXML(FDecrypted_Request);
end;

procedure TFrmCCLog.FlattenXML1Click(Sender: TObject);
begin
  memRequest.Text := FlattenXML(FDecrypted_Request);
end;

procedure TFrmCCLog.DoCopyText(Sender: TObject);
var
  o: TUniMemo;
begin
  // get component
  o := ActiveMemoControl;
  // action: copy
  { TODO : CopyToClipboard not declared }
  {if (o <> nil) then
    o.CopyToClipboard;  }
end;

procedure TFrmCCLog.DoSelectAll(Sender: TObject);
var
  o: TUniMemo;
begin
  // get component
  o := ActiveMemoControl;
  // action: copy
  { TODO : CopyToClipboard not declared }
  {if (o <> nil) then
    o.SelectAll;      }
end;

procedure TFrmCCLog.DoSaveToFile(Sender: TObject);
var
  o: TUniMemo;
  AFileName: string;
begin
  // get component
  o := ActiveMemoControl;

  if o = memRequest then
    AFileName := 'Request.xml'
  else if o = memResponse then
    AFileName := 'Response.xml'
  else if o = memDetails then
    AFileName := 'Details.txt'
  else if o = memMerchant then
    AFileName := 'Merchant.txt';
  // action: copy
  if (o <> nil) then
    with SaveDialog1 do
      begin
        FileName := AFileName;
        DefaultExt := ExtractFileExt(AFileName);
        if Execute then
          o.Lines.SaveToFile(FileName);
      end;
end;

procedure TFrmCCLog.FormatAsXML2Click(Sender: TObject);
begin
  memResponse.Text := FormatAsXML(FDecrypted_Response);
end;

(* function TFrmCCLog.FormatXML(const AText: string): string;
  function _padLine(const Count: Integer): string;
  var
  i: Integer;
  begin
  SetLength(Result, Count);
  for i := 1 to Count do
  Result[i] := ' ';
  end;

  var
  s: string;
  PText: PChar;
  ANewLine: string;
  ALevel: Integer;
  sl: TStringList;
  begin
  s := IQMS.Common.XML.XMLDecode(AText);
  PText := PChar(s);
  ANewLine := '';
  ALevel := 0;
  try
  sl := TStringList.Create;
  while PText^ <> #0 do
  begin
  case PText^ of
  '<':
  begin
  if Trim(ANewLine) > '' then
  sl.Add(ANewLine);
  if PChar(PText + 1)^ = '/' then
  begin
  ANewLine := _padLine((ALevel - 1) * 2) + PText^;
  Dec(ALevel);
  end
  else begin
  Inc(ALevel);
  ANewLine := _padLine((ALevel - 1) * 2) + PText^;
  end;
  end;
  '>':
  begin
  ANewLine := ANewLine + PText^;
  if Trim(ANewLine) > '' then
  sl.Add(ANewLine);
  ANewLine := '';
  if PChar(PText + 1)^ = #0 then
  Break;
  if PChar(PText - 1)^ = '/' then
  Dec(ALevel);
  end;
  else
  if ANewLine = '' then
  ANewLine := _padLine(ALevel * 2);
  ANewLine := ANewLine + PText^;
  end;
  Inc(PText);
  end;
  if Trim(ANewLine) > '' then
  sl.Add(ANewLine);
  Result := sl.Text;
  finally
  if Assigned(sl) then
  FreeAndNil(sl);
  end;
  end; *)

procedure TFrmCCLog.FormatXML1Click(Sender: TObject);
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    IQMS.Common.XML.FormatXML(FDecrypted_Request, sl);
    { TODO : ssBoth not declared }
    //memRequest.ScrollBars := ssBoth;
    memRequest.WordWrap := False;
    memRequest.Text := sl.Text;
  finally
    sl.Free;
  end;
end;

procedure TFrmCCLog.FormatXML2Click(Sender: TObject);
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    IQMS.Common.XML.FormatXML(FDecrypted_Response, sl);
    { TODO : ssBoth not declared }
    //memResponse.ScrollBars := ssBoth;
    memResponse.WordWrap := False;
    memResponse.Text := sl.Text;
  finally
    sl.Free;
  end;
end;

procedure TFrmCCLog.FlattenXML2Click(Sender: TObject);
begin
  memResponse.Text := FlattenXML(FDecrypted_Response);
end;

procedure TFrmCCLog.PMerchantPopup(Sender: TObject);
begin
  CopyMerchantInformation1.Enabled := False;
  { CopyMerchantInformation1.Enabled := SecurityManager.IsUserDBA and
    (SecurityManager.UserName = 'IQMS'); }
  SelectAllMerchantInformation1.Enabled := CopyMerchantInformation1.Enabled;
end;

procedure TFrmCCLog.CopyMerchantInformation1Click(Sender: TObject);
begin
  // memMerchant.CopyToClipboard;
end;

procedure TFrmCCLog.SelectAllMerchantInformation1Click(Sender: TObject);
begin
  // memMerchant.SelectAll;
end;

procedure TFrmCCLog.sbtnExpandRequestClick(Sender: TObject);
var
  ADlgCaption: string;
  sl: TStringList;
  S: string;
  x: Integer;
begin
  ADlgCaption := TabRequest.Caption;
  // XML
  try
    S := Copy(FDecrypted_Request, 1, 100);
    if (Pos('<xml', S) > 0) or (Pos('<?xml', S) > 0) then
      begin
        if Pos('>&<', S) > 0 then
          S := StringReplace(FDecrypted_Request, '>&<', '>'#13'<',
            [rfReplaceAll, rfIgnoreCase])
        else
          S := FDecrypted_Request;

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
    IQMS.Common.EditMemoStr.DoViewMemoStr(FDecrypted_Request, ADlgCaption);
    Exit;
  end;

  // Name/value pairs
  try
    S := Copy(FDecrypted_Request, 1, 100);
    x := Pos('=', S);
    if (x > 0) and (PosEx('&', S, x) > x) then
      begin
        S := StringReplace(FDecrypted_Request, '&', #13,
          [rfReplaceAll, rfIgnoreCase]);
        sl := TStringList.Create;
        try
          sl.Text := S;
          DoShowInfoBox(sl, ADlgCaption);
        finally
          sl.Free;
        end;
        Exit;
      end;
  except
    IQMS.Common.EditMemoStr.DoViewMemoStr(FDecrypted_Request, ADlgCaption);
    Exit;
  end;

  // Default
  IQMS.Common.EditMemoStr.DoViewMemoStr(FDecrypted_Request, ADlgCaption);
end;

procedure TFrmCCLog.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile('CC.chm', 'CC.hhp'); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(5670);
end;

procedure TFrmCCLog.SendEmailtoIQMS1Click(Sender: TObject);
var
  AFileName, ASubject: string;
  ABodyText, AAttachments: TStringList;
begin
  ASubject := ''; // empty
  // 04/02/2015
  AFileName := IQMS.Common.Miscellaneous.GetTempFileName('.zip');
  try
    ABodyText := TStringList.Create;
    try
      IQAbout1.GetSupportEmailBodyText(ABodyText);
      SaveAllToArchive(AFileName);
      AAttachments := TStringList.Create;
      try
        AAttachments.Add(AFileName);
        // Display the email
        IQMS.Common.EmailUtils.IQSendMailA('support@iqms.com', ASubject, ABodyText.Text,
          AAttachments, False);
      finally
        FreeAndNil(AAttachments);
      end;
    finally
      FreeAndNil(ABodyText);
    end;
  finally
    DeleteFile(AFileName);
  end;
end;

procedure TFrmCCLog.EmailRequestandResponse1Click(Sender: TObject);
var
  AFileName: string;
  sl: TStringList;
  ACompanyName, ASubject: string;
begin
  ACompanyName := SelectValueFmtAsString(
    'SELECT COALESCE((SELECT company              '#13 +
    '                   FROM eplant               '#13 +
    '                  WHERE id = %d AND          '#13 +
    '                        ROWNUM < 2),         '#13 +
    '                (SELECT company              '#13 +
    '                   FROM iqsys                '#13 +
    '                  WHERE ROWNUM < 2))         '#13 +
    '  FROM DUAL                                  ',
    [SecurityManager.EPlant_ID_AsInteger]);
  // cc_rscstr.cTXT0000769 = 'Transaction Log Files';
  ASubject := cc_rscstr.cTXT0000769;
  if ACompanyName > '' then
    ASubject :=  Format('%s [%s]', [FixStr(cc_rscstr.cTXT0000769),
      FixStr(ACompanyName)]);

  AFileName := IQMS.Common.FileUtils.PathCombineEx(
    [IQMS.Common.Miscellaneous.GetSpecialPath(TSpecialFolder.evTemp), 'Files.zip']);
  try
    SaveRequestResponseToArchive(AFileName);
    sl := TStringList.Create;
    try
      sl.Add(AFileName);
      // cc_rscstr.cTXT0000770 =
      // 'Please find attached the transaction request and response ' +
      // 'files from the log.';
      IQMS.Common.EmailUtils.IQSendMailA(
        '',
        ASubject,
        cc_rscstr.cTXT0000770,
        sl,
        False);
    finally
      sl.Free;
    end;
  finally
    DeleteFile(AFileName);
  end;
end;

end.

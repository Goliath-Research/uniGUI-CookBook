unit shipman_logfrm;

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
  shipman_log,
  shipman_logfilter,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
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
  uniPageControl, IQUniGrid, uniGUIFrame;

type
  TFrmShipManLog = class(TUniForm)
    PnlHeader: TUniPanel;
    PnlDetail: TUniPanel;
    Splitter1: TUniSplitter;
    PnlToolbar: TUniPanel;
    SrcData: TDataSource;
    QryData: TFDQuery;
    SR: TIQWebSecurityRegister;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    pcDetail: TUniPageControl;
    TabRequest: TUniTabSheet;
    TabResponse: TUniTabSheet;
    TabDetail: TUniTabSheet;
    memDetails: TUniMemo;
    memRequest: TUniMemo;
    memResponse: TUniMemo;
    QryDataID: TBCDField;
    QryDataCLASS: TBCDField;
    QryDataTEXT: TMemoField;
    QryDataREQUESTDATA: TMemoField;
    QryDataRESPONSEDATA: TMemoField;
    QryDataCREATED: TDateTimeField;
    QryDataCREATEDBY: TStringField;
    QryDataEntryClass: TStringField;
    sbtnFilter: TUniSpeedButton;
    Filter1: TUniMenuItem;
    PurgeLogData1: TUniMenuItem;
    N1: TUniMenuItem;
    Options1: TUniMenuItem;
    View1: TUniMenuItem;
    ViewRequestData1: TUniMenuItem;
    ViewResponseData1: TUniMenuItem;
    ImageList1: TUniImageList;
    QryDataImageIndex: TIntegerField;
    QryDataCARRIER_TYPE: TBCDField;
    QryDataCarrierTypeStr: TStringField;
    PRequest: TUniPopupMenu;
    Format1: TUniMenuItem;
    FormatAsXML1: TUniMenuItem;
    FormatAsNameValuePairs1: TUniMenuItem;
    PResponse: TUniPopupMenu;
    Format2: TUniMenuItem;
    FormatAsXML2: TUniMenuItem;
    FormatAsNameValuePairs2: TUniMenuItem;
    N2: TUniMenuItem;
    RequestCopy1: TUniMenuItem;
    RequestSelectAll1: TUniMenuItem;
    N3: TUniMenuItem;
    RequestSavetoFile1: TUniMenuItem;
    N4: TUniMenuItem;
    ResponseCopy1: TUniMenuItem;
    ResponseSelectAll1: TUniMenuItem;
    N5: TUniMenuItem;
    ResponseSaveToFile1: TUniMenuItem;
    SaveDialog1: TSaveDialog;
    IQSearch1: TIQUniGridControl;
    Contents1: TUniMenuItem;
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
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure QryDataUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure DoViewMenuClick(Sender: TObject);
    procedure View1Click(Sender: TObject);
    procedure FormatAsXML1Click(Sender: TObject);
    procedure FormatAsNameValuePairs1Click(Sender: TObject);
    procedure FormatAsXML2Click(Sender: TObject);
    procedure FormatAsNameValuePairs2Click(Sender: TObject);
    procedure DoCopyText(Sender: TObject);
    procedure DoSelectAll(Sender: TObject);
    procedure DoSaveToFile(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FLogFilter: TLogFilter;
    procedure RegGetLogFilter;
    procedure RegSetLogFilter;
    procedure PopulateDecryptedData;
    function FormatAsNameValuePairs(const AText: String): String;
    function FormatAsXML(const AText: String): String;
    function ActiveMemoControl: TUniMemo;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  shipman_common,
  shipman_purgelog,
  IQMS.Common.XML,
  IQMS.Common.Boolean;

procedure TFrmShipManLog.FormCreate(Sender: TObject);
var
   i: Integer;
   b: Boolean;
begin
  RegGetLogFilter;
  ReOpen(QryData);

  b := True;
{ TODO -oGPatil -cWebConvert : Could not convert variant of type Null into variant of type OleStr
  if IQMS.Common.RegFrm.IQRegBooleanScalarRead(Self, 'View Request Data', b) then
     TabRequest.TabVisible := b;
  b := True;
  if IQMS.Common.RegFrm.IQRegBooleanScalarRead(Self, 'View Response Data', b) then
     TabResponse.TabVisible := b;
  pcDetail.ActivePageIndex := 0;
 }
  IQRegFormRead(Self,[Self,PnlHeader, IQSearch1]);

end;

procedure TFrmShipManLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RegSetLogFilter;

  IQMS.Common.RegFrm.IQRegBooleanScalarWrite(Self, 'View Request Data',
   TabRequest.TabVisible);
  IQMS.Common.RegFrm.IQRegBooleanScalarWrite(Self, 'View Response Data',
   TabResponse.TabVisible);

  IQRegFormWrite(Self,[]);
end;

procedure TFrmShipManLog.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmShipManLog.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( Self.HelpContext );
end;

procedure TFrmShipManLog.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmShipManLog.SrcDataDataChange(Sender: TObject; Field: TField);
begin
  if not Showing then Exit;
  PopulateDecryptedData;
end;

procedure TFrmShipManLog.PopulateDecryptedData;

   // --------------------------------------------------------------------------
   function _Eval(AField: TField): String;
   begin
     Result := AField.AsString;
   end;
   // --------------------------------------------------------------------------

begin
  memDetails.Text  := _Eval(QryDataTEXT);
  memRequest.Text  := _Eval(QryDataREQUESTDATA);
  memResponse.Text := _Eval(QryDataRESPONSEDATA);
end;

procedure TFrmShipManLog.QryDataCalcFields(DataSet: TDataSet);
var
   AClass: TLogClass;
   o: TCarrierType;
begin
  QryDataImageIndex.AsInteger := 0;

  AClass := TLogClass(QryDataCLASS.AsInteger);

  QryDataEntryClass.AsString := LogClassStr[AClass];
  QryDataImageIndex.AsInteger  := Ord(AClass);
  if (QryDataCARRIER_TYPE.AsInteger in [Ord(Low(o))..Ord(High(o))]) then
     QryDataCarrierTypeStr.AsString := CarrierNames[TCarrierType(QryDataCARRIER_TYPE.AsInteger)];
end;

procedure TFrmShipManLog.QryDataAfterOpen(DataSet: TDataSet);
begin
  PopulateDecryptedData;
end;

procedure TFrmShipManLog.Filter1Click(Sender: TObject);
begin
  if GetLogFilter(Self, FLogFilter) then // shipman_logfilter.pas
     RefreshDataSetByID(QryData);
end;

procedure TFrmShipManLog.PurgeLogData1Click(Sender: TObject);
begin
  if DoShipmanPurgeLog then // shipman_purgelog.pas
     RefreshDataSetByID(QryData);
end;

procedure TFrmShipManLog.QryDataBeforeOpen(DataSet: TDataSet);
var
   i: Integer;
   AClassStr: String;
   cls: TLogClass;
begin

  AClassStr := '_';
  for i := 0 to Ord(High(cls)) do
    if (TLogClass(i) in FLogFilter.LogClasses) then
       AClassStr := AClassStr + Format('%d_',[Ord(TLogClass(i))]);

  with TFDQuery(DataSet) do
  begin
    if Params.FindParam('CLASS_FILTER') = NIL then Exit;
    AssignQueryParamValue(DataSet, 'CLASS_FILTER', AClassStr);
    AssignQueryParamValue(DataSet, 'BY_CLASS_FILTER', INTEGER(FLogFilter.LogClasses <> []));
    AssignQueryParamValue(DataSet, 'USER_ID', FLogFilter.UserID);
    AssignQueryParamValue(DataSet, 'BY_USER_ID', INTEGER(FLogFilter.UserID > ''));
  end;
end;

procedure TFrmShipManLog.RegGetLogFilter;
var
   S: String;
   i, n: Integer;
   cls: TLogClass;
   b: Boolean;
begin
  // initialization
  i := 0;
  n := 0;

  FLogFilter.LogClasses := [];

  FLogFilter.AllClasses := True;

{ TODO -oGPatil -cWebConvert : Could not convert variant of type Null into variant of type OleStr
  if IQMS.Common.RegFrm.IQRegBooleanScalarRead(Self, 'Log Show All Classes', b) then
     FLogFilter.AllClasses := b;

  if IQMS.Common.RegFrm.IQRegStringScalarRead(Self, 'Log Class Filter', S) and (S > '') then
     begin
       for i := 1 to Length(S) do
        if IQMS.Common.Numbers.IsStringValidInteger(S[i],n) and
           (n > 0) and (n <= Ord(High(cls))) then
           Include(FLogFilter.LogClasses, TLogClass(n));
     end;
 }
end;

procedure TFrmShipManLog.RegSetLogFilter;
begin
  IQMS.Common.RegFrm.IQRegStringScalarWrite(Self, 'Log Class Filter', QryData.ParamByName('CLASS_FILTER').AsString);
  IQMS.Common.RegFrm.IQRegBooleanScalarWrite(Self, 'Log Show All Classes', FLogFilter.AllClasses);
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmShipManLog.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
 if Button = nbRefresh then
    begin
      RefreshDataSetByID(QryData);
      System.SysUtils.Abort;
    end;
end;  }

procedure TFrmShipManLog.QryDataUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  AAction := eaApplied;
end;

procedure TFrmShipManLog.View1Click(Sender: TObject);
begin
  ViewRequestData1.Checked  := pcDetail.Pages[1].TabVisible;
  ViewResponseData1.Checked := pcDetail.Pages[2].TabVisible;
end;

procedure TFrmShipManLog.DoViewMenuClick(Sender: TObject);
var
   ATag: Integer;
   AVisible: Boolean;
begin
  // Initialization
  ATag := 0;

  Application.ProcessMessages;

  with TComponent(Sender) do
   ATag := Tag;

  if (ATag in [1..2]) then
     begin
       AVisible := pcDetail.Pages[ATag].TabVisible;
       pcDetail.Pages[ATag].TabVisible := not AVisible;
       if not AVisible then
          pcDetail.ActivePageIndex := 0;
     end;
end;

procedure TFrmShipManLog.FormatAsXML1Click(Sender: TObject);
begin
  memRequest.Text := FormatAsXML(QryDataREQUESTDATA.AsString);
end;

procedure TFrmShipManLog.FormatAsNameValuePairs1Click(Sender: TObject);
begin
  memRequest.Text := FormatAsNameValuePairs(QryDataREQUESTDATA.AsString);
end;

procedure TFrmShipManLog.FormatAsXML2Click(Sender: TObject);
begin
  memResponse.Text := FormatAsXML(QryDataRESPONSEDATA.AsString);
end;

procedure TFrmShipManLog.FormatAsNameValuePairs2Click(Sender: TObject);
begin
  memResponse.Text := FormatAsNameValuePairs(QryDataRESPONSEDATA.AsString);
end;

function TFrmShipManLog.FormatAsXML(const AText: String): String;
var
   S: String;
begin

   if Trim(AText) = '' then
      Exit;

   Result := IQMS.Common.XML.ParseFromURI(AText);

   //Result := LnChk(Result);
   S := Result;
   S := IQMS.Common.StringUtils.StrTran(S, #10,'');
   S := IQMS.Common.StringUtils.StrTran(S, #13,'');
   S := IQMS.Common.StringUtils.StrTran(S, '<', #13#10 + '<');
   S := IQMS.Common.StringUtils.StrTran(S, #13#10'</', '</');
   S := IQMS.Common.StringUtils.StrTran(S, '><', '>'#13#10'<');
   Result := S;

end;

procedure TFrmShipManLog.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmShipman{CHM}, iqhtmShipman{HTM} );  {IQMS.Common.HelpHook.pas}
end;

function TFrmShipManLog.FormatAsNameValuePairs(const AText: String): String;
var
   ATemp: String;
   ATags, AResult: TStringList;
   i: Integer;
   function _TagName(const ATag: String): String;
   begin
     Result := ATag;
     Result := IQMS.Common.StringUtils.StrTran(Result, '<', '');
     Result := IQMS.Common.StringUtils.StrTran(Result, '>', '');
   end;
begin
   ATags := NIL;
   AResult := NIL;

   // Get as XML first
   ATemp := IQMS.Common.XML.ParseFromURI(AText);

   try
      ATags := TStringList.Create;
      AResult := TStringList.Create;
      ListTags(ATemp, ATags);
      ATemp := '';
      for i := 0 to ATags.Count - 1 do
        begin
          ATemp := GetXMLTagValue(ATemp, ATags.Strings[i]);
          AResult.Add(Format('%s: %s',[_TagName(ATags.Strings[i]), ATemp]));
        end;

      Result := AResult.Text;

   finally
      if Assigned(ATags) then FreeAndNil(ATags);
      if Assigned(AResult) then FreeAndNil(AResult);
   end;
end;

function TFrmShipManLog.ActiveMemoControl: TUniMemo;
begin
  // get component
  case pcDetail.ActivePageIndex of
   0: Result := memDetails;
   1: Result := memRequest;
   2: Result := memResponse;
  else Result := NIL;
  end;
end;

procedure TFrmShipManLog.DoCopyText(Sender: TObject);
var
   o: TUniMemo;
begin
  // get component
  o := ActiveMemoControl;

{ TODO -oGPatil -cWebConvert : TUniMemo does not contain CopyToClipboard
  // action: copy
  if (o <> NIL) then
     o.CopyToClipboard; }
end;

procedure TFrmShipManLog.DoSelectAll(Sender: TObject);
var
   o: TUniMemo;
begin
  // get component
  o := ActiveMemoControl;

{ TODO -oGPatil -cWebConvert : TUniMemo does not contain SelectAll
  // action: copy
  if (o <> NIL) then
     o.SelectAll;    }
end;

procedure TFrmShipManLog.DoSaveToFile(Sender: TObject);
var
   o: TUniMemo;
begin
  // get component
  o := ActiveMemoControl;

  // action: copy
  if (o <> NIL) then
     with SaveDialog1 do
      if Execute then
         o.Lines.SaveToFile(FileName);
end;

end.

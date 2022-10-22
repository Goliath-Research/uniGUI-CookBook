unit crm_activity_summary;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  crm_types,
  Vcl.Menus,
  DM_CRMIMG,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Vcl.Graphics,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniDBText,
  uniPanel,
  uniSplitter,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, uniImage;

type
  TFrmCRMActivitySummaryBrief = class(TUniForm)
    PnlClient: TUniPanel;
    PnlTop: TUniPanel;
    SrcData: TDataSource;
    QryData: TFDQuery;
    QryDataSTARTDATE: TDateTimeField;
    QryDataFINISHDATE: TDateTimeField;
    QryDataPRINCIPLE_SOURCE_DISP: TStringField;
    QryDataASSIGNEDTO_DISPLAY: TStringField;
    QryDataTYPE: TBCDField;
    QryDataACTIVITY_TYPE_NAME: TStringField;
    QryDataACTIVITY_TYPE_DESCRIPTION: TStringField;
    QryDataREGARDING: TStringField;
    QryDataPRIORITY_INTEGER: TFMTBCDField;
    QryDataSUBJECT: TStringField;
    QryDataLOCATION: TStringField;
    QryDataLABEL_COLOR: TBCDField;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    lblStartDate: TUniLabel;
    lblFinishDate: TUniLabel;
    lblSubject: TUniLabel;
    lblLocation: TUniLabel;
    QryDataStartDateStr: TStringField;
    QryDataFinishDateStr: TStringField;
    dbeStartDate: TUniDBText;
    dbeFinishDate: TUniDBText;
    dbeSubject: TUniDBText;
    memRegarding: TUniDBMemo;
    lblPrinciple: TUniLabel;
    dbePrinciple: TUniDBText;
    dbeLocation: TUniDBText;
    lblAssignedTo: TUniLabel;
    dbeAssignedTo: TUniDBText;
    PnlType: TUniPanel;
    imgCall: TUniImage;
    PMain: TUniPopupMenu;
    Close1: TUniMenuItem;
    CopySummarytoClipboard1: TUniMenuItem;
    ViewFullSummaryHTML1: TUniMenuItem;
    N1: TUniMenuItem;
    QryDataID: TBCDField;
    imgTask: TUniImage;
    imgMeeting: TUniImage;
    imgNote: TUniImage;
    imgSupport: TUniImage;
    procedure QryDataCalcFields(DataSet: TDataSet);
    procedure QryDataBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Close1Click(Sender: TObject);
    procedure CopySummarytoClipboard1Click(Sender: TObject);
    procedure ViewFullSummaryHTML1Click(Sender: TObject);
    procedure PMainPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    DMIMG: TCRMIMG_DM;
    FCRMActivityID: Real;
    FActivityType: TActivityType;
    procedure Refresh;
    procedure SetCaption;
    procedure LoadImage;
    procedure SetACRMActivityID(const rACRMActivityID:real);
  public
    { Public declarations }
    property rACRMActivityID: Real read FCRMActivityID write SetACRMActivityID;
  end;

procedure ShowBriefActivitySummary(ACRMActivityID: Real);


implementation

{$R *.dfm}


uses
  crm_strings,
  crmsuprtsumhtml,
  IQMS.Common.Controls,
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  crm_rscstr;

procedure ShowBriefActivitySummary(ACRMActivityID: Real);
begin
  with TFrmCRMActivitySummaryBrief.Create(uniGUIApplication.UniApplication) do
    begin
      rACRMActivityID := ACRMActivityID;
      ShowModal;
    end;
end;

{ TFrmCRMActivitySummaryBrief }


procedure TFrmCRMActivitySummaryBrief.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlLeft01]);
end;

procedure TFrmCRMActivitySummaryBrief.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlLeft01]);
end;

procedure TFrmCRMActivitySummaryBrief.Refresh;
var
  ATypes: TActivityType;
begin
  ReOpen(QryData);
  FActivityType := atNone; // initial
  if (QryDataTYPE.AsInteger in [Ord(Low(ATypes)) .. Ord(High(ATypes))]) then
    FActivityType := TActivityType(QryDataTYPE.AsInteger); // see crm_types.pas
  LoadImage;
  SetCaption;
end;

procedure TFrmCRMActivitySummaryBrief.QryDataCalcFields(DataSet: TDataSet);
begin
  QryDataStartDateStr.AsString := FormatDateTime('dddddd tt',
    QryDataSTARTDATE.AsDateTime);
  QryDataFinishDateStr.AsString := FormatDateTime('dddddd tt',
    QryDataFINISHDATE.AsDateTime);
end;

procedure TFrmCRMActivitySummaryBrief.QryDataBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', FCRMActivityID);
end;

procedure TFrmCRMActivitySummaryBrief.SetACRMActivityID(const rACRMActivityID: real);
begin

  DMIMG := TCRMIMG_DM.Create(uniGUIApplication.UniApplication);
  DMIMG.Name := '';
  FCRMActivityID:=rACRMActivityID;
  Refresh;
end;

procedure TFrmCRMActivitySummaryBrief.SetCaption;
var
  ATypeStr: String;
begin
  ATypeStr := crm_strings.GetTypeString(QryDataTYPE.AsInteger);
  // cTXT0000348 = '%s Summary'; // Call Summary
  // Caption := Format(crm_rscstr.cTXT0000348 {'%s Summary'}, [ATypeStr]);
  Caption := ATypeStr;
end;

procedure TFrmCRMActivitySummaryBrief.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      Key := 0;
      Close; // close form
    end;
end;

procedure TFrmCRMActivitySummaryBrief.LoadImage;
  procedure _setImage(AImage: TUniImage; AVisible: Boolean);
  begin
    AImage.Left := 8;
    AImage.Top := 8;
    AImage.Visible := AVisible;
  end;

begin
  try
    // 02/01/2013 This doesn't load transparency
    // DMIMG.AssignActivityImage(imgType, Ord(FActivityType) - 1);
    _setImage(imgCall, FActivityType = atCall);
    _setImage(imgTask, FActivityType = atTask);
    _setImage(imgMeeting, FActivityType = atMeeting);
    _setImage(imgSupport, FActivityType = atSupport);
    _setImage(imgNote, FActivityType = atNote);
  except
    on E: Exception do
      IQError(E.Message);
  end;
end;

procedure TFrmCRMActivitySummaryBrief.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCRMActivitySummaryBrief.CopySummarytoClipboard1Click(
  Sender: TObject);
var
  ALines: TStringList;
begin
  ALines := NIL;
  try
    ALines := TStringList.Create;
    ALines.Add(Format('%s:  %s', [lblStartDate.Caption,
      QryDataStartDateStr.AsString]));
    ALines.Add(Format('%s:  %s', [lblFinishDate.Caption,
      QryDataFinishDateStr.AsString]));
    ALines.Add(Format('%s:  %s', [lblSubject.Caption,
      QryDataSUBJECT.AsString]));
    ALines.Add(Format('%s:  %s', [lblLocation.Caption,
      QryDataLOCATION.AsString]));
    ALines.Add(Format('%s:  %s', [lblPrinciple.Caption,
      QryDataPRINCIPLE_SOURCE_DISP.AsString]));
    ALines.Add(Format('%s:  %s', [lblAssignedTo.Caption,
      QryDataASSIGNEDTO_DISPLAY.AsString]));
    ALines.Add(crm_rscstr.cTXT0001559); // 'Regarding:  '
    ALines.Add(QryDataREGARDING.AsString);
    IQMS.Common.StringUtils.CopyStrToClipbrd(ALines.Text);
  finally
    if Assigned(ALines) then
      ALines.Free;
  end;
end;

procedure TFrmCRMActivitySummaryBrief.ViewFullSummaryHTML1Click(
  Sender: TObject);
begin
  // View Support Issue Summary
  if (FActivityType = atSupport) and
    not crmsuprtsumhtml.ShowSupportSummaryHTML(FCRMActivityID) then
  // crmsuprtsumhtml
    IQError(crm_rscstr.cTXT0000147 { 'Cannot show summary.' } );

end;

procedure TFrmCRMActivitySummaryBrief.PMainPopup(Sender: TObject);
begin
  ViewFullSummaryHTML1.Visible := FActivityType = atSupport;
end;

end.

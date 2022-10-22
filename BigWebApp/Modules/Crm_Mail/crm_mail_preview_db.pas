unit crm_mail_preview_db;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  crm_mail_preview,
  MainModule,
  Data.DB,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  Vcl.Menus,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmCRMMassMailPreviewDB = class(TUniForm)
    PnlToolbar: TUniPanel;
    NavMain: TUniDBNavigator;
    PnlPreview: TUniPanel;
    SrcData: TDataSource;
    QryData: TFDQuery;
    QryDataID: TBCDField;
    QryDataSEQ: TBCDField;
    QryDataSUBJECT: TStringField;
    QryDataMESSAGE_FORMAT: TStringField;
    QryDataSENDER_NAME: TStringField;
    QryDataSENDER_ADDRESS: TStringField;
    QryDataRECIPIENT_ADDRESS: TStringField;
    PnlList: TUniPanel;
    IQSearch1: TIQUniGridControl;
    PnlSideBar: TUniPanel;
    bvSideBar1: TUniPanel;
    PnlExpandPane: TUniPanel;
    sbtnExpandPane: TUniSpeedButton;
    QryDataPRINCIPLE_FIRST_NAME: TStringField;
    QryDataPRINCIPLE_LAST_NAME: TStringField;
    QryDataPRINCIPLE_COMPANY: TStringField;
    PnlCloseList: TUniPanel;
    PnlCollapseStatistics: TUniPanel;
    sbtnCollapsePane: TUniSpeedButton;
    Splitter1: TUniSplitter;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    procedure QryDataAfterScroll(DataSet: TDataSet);
    procedure QryDataBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnExpandPaneClick(Sender: TObject);
    procedure sbtnCollapsePaneClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FPreview: TFrmCRMMassMailPreview;
    FCRMMailingID: Int64;
    FTransaction: TFDTransaction;
    FSavedListWidth: Integer;
    procedure CheckPreviewLoaded;
    procedure LoadPreviewForCurrentRecord;
    function ConnectionName: string;
    procedure ExpandListPane(const AExpanded: Boolean);
  public
    { Public declarations }
    class procedure DoShowModal(ACRMMailingID: Int64; ATransaction: TFDTransaction);
    property CRMMailingID: Int64 read FCRMMailingID write FCRMMailingID;
    property Transaction: TFDTransaction read FTransaction write FTransaction;
  end;



implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.Common.DataLib;

{$R *.dfm}

{ TFrmCRMMassMailPreviewDB }
class procedure TFrmCRMMassMailPreviewDB.DoShowModal(ACRMMailingID: Int64; ATransaction: TFDTransaction);
var
  FrmCRMMassMailPreviewDB: TFrmCRMMassMailPreviewDB;
begin
  FrmCRMMassMailPreviewDB := TFrmCRMMassMailPreviewDB.Create(uniGUIApplication.uniApplication);
  FrmCRMMassMailPreviewDB.CRMMailingID := ACRMMailingID;
  FrmCRMMassMailPreviewDB.FTransaction := ATransaction;
  FrmCRMMassMailPreviewDB.ShowModal;
end;

procedure TFrmCRMMassMailPreviewDB.UniFormCreate(Sender: TObject);
begin
  IQMS.Common.Screen.ApplySystemFont(Self);
  // if QryData.Active then
  // QryData.Close;
  // QryData.ConnectionName := Self.ConnectionName;
  // QryData.Transaction := ATransaction;
  // QryData.Open;
end;

procedure TFrmCRMMassMailPreviewDB.FormShow(Sender: TObject);
begin
  try
    if QryData.Active then
      QryData.Close;
    QryData.ConnectionName := Self.ConnectionName;
    if Assigned(FTransaction) then
      QryData.Transaction := FTransaction;
    QryData.Open;

    IQMS.Common.RegFrm.IQRegFormRead(Self, [Self, PnlList]);
    FSavedListWidth := PnlList.Width;
    ExpandListPane(False);
    if not Assigned(FPreview) then
      LoadPreviewForCurrentRecord;
  except
    on E: Exception do
      begin
        //PostMessage(Handle, WM_COMMAND, Exit1.Command, 0);
        raise;
      end;
  end;
end;

procedure TFrmCRMMassMailPreviewDB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self, PnlList]);
end;

function TFrmCRMMassMailPreviewDB.ConnectionName: string;
begin
  if Assigned(FTransaction) then
    Result := FTransaction.Connection.ConnectionName
  else
    Result := UniMainModule.FDConnection1.ConnectionName;
end;

procedure TFrmCRMMassMailPreviewDB.CheckPreviewLoaded;
begin
  if not Assigned(FPreview) then
    begin
      FPreview := TFrmCRMMassMailPreview.Create( uniGUIApplication.uniApplication);
      FPreview.PnlCarrier.Parent := Self.PnlPreview;
      FPreview.PnlCarrier.Align := alClient;
    end;
end;

procedure TFrmCRMMassMailPreviewDB.LoadPreviewForCurrentRecord;
begin
  if not Showing then
    Exit;
  CheckPreviewLoaded;
  ExecuteCommandFmt(
    'BEGIN iqcrm_massmail.update_recip_body_text(%d); END;',
    [QryDataID.AsLargeInt],
    ConnectionName,
    FTransaction);
  FPreview.From := QryDataSENDER_NAME.AsString;
  FPreview.Recipient := QryDataRECIPIENT_ADDRESS.AsString;
  FPreview.Subject := QryDataSUBJECT.AsString;
  FPreview.ContentType := QryDataMESSAGE_FORMAT.AsString;
  FPreview.BodyText := SelectValueFmtAsString(
    'SELECT message_text FROM crm_mailing_recipient WHERE id = %d',
    [QryDataID.AsLargeInt],
    ConnectionName,
    FTransaction);
end;

procedure TFrmCRMMassMailPreviewDB.QryDataAfterScroll(DataSet: TDataSet);
begin
  LoadPreviewForCurrentRecord;
end;

procedure TFrmCRMMassMailPreviewDB.QryDataBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(QryData, 'CRM_MAILING_ID', CRMMailingID);
end;

procedure TFrmCRMMassMailPreviewDB.sbtnCollapsePaneClick(Sender: TObject);
begin
  ExpandListPane(False);
end;

procedure TFrmCRMMassMailPreviewDB.sbtnExpandPaneClick(Sender: TObject);
begin
  ExpandListPane(True);
end;

procedure TFrmCRMMassMailPreviewDB.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCRMMassMailPreviewDB.ExpandListPane(const AExpanded: Boolean);
var
  ABarWidth: Integer;
begin
  // Let the button click finish
  Application.ProcessMessages;

  // Get the side bar width
  ABarWidth := PnlSideBar.Width;

  // Hide
  if not AExpanded then
    try
      if PnlList.Width > 25 then
        FSavedListWidth := PnlList.Width;
      PnlPreview.Align := alNone;
      IQSearch1.Visible := False;
      PnlList.Width := ABarWidth;
      PnlSideBar.Visible := True;
      PnlCloseList.Visible := False;
      Splitter1.Visible := False;
    finally
      PnlPreview.Align := alClient;
    end
    // Show
  else
    try
      PnlPreview.Align := alNone;
      PnlSideBar.Visible := False;
      if FSavedListWidth = 25 then
        FSavedListWidth := 220;
      PnlList.Width := FSavedListWidth;
      IQSearch1.Visible := True;
      PnlCloseList.Visible := True;
      Splitter1.Visible := True;
      Splitter1.Left := PnlList.Width + 1;
    finally
      PnlPreview.Align := alClient;
    end;
end;

end.

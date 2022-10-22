unit disposvr_dblog;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniPageControl;

type
  TFrmDispoServerDBLog = class(TUniForm)
    PnlToolbar: TUniPanel;
    PnlMain: TUniPanel;
    NavMain: TUniDBNavigator;
    pcMain: TUniPageControl;
    TabTable: TUniTabSheet;
    TabForm: TUniTabSheet;
    sbtnSearch: TUniSpeedButton;
    sbtnToggleTableForm: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Search1: TUniMenuItem;
    N1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SrcDispoSvrLog: TDataSource;
    TblDispoSvrLog: TFDQuery;
    TblDispoSvrLogID: TBCDField;
    TblDispoSvrLogCREATED: TDateTimeField;
    TblDispoSvrLogCREATEDBY: TStringField;
    TblDispoSvrLogLOGMESSAGE: TStringField;
    TblDispoSvrLogXMLTEXT: TMemoField;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    memMessageText: TUniDBMemo;
    memXMLText: TUniDBMemo;
    cmbEntryDate: TUniDBDateTimePicker;
    dbeAddedBy: TUniDBEdit;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Grid: TIQUniGridControl;
    SR: TIQWebSecurityRegister;
    PurgeRecords1: TUniMenuItem;
    PkDispoSvrLog: TIQWebHPick;
    PkDispoSvrLogID: TBCDField;
    PkDispoSvrLogCREATED: TDateTimeField;
    PkDispoSvrLogCREATEDBY: TStringField;
    PkDispoSvrLogLOGMESSAGE: TStringField;
    SaveXMLtoFile1: TUniMenuItem;
    N2: TUniMenuItem;
    SaveXMLDialog: TSaveDialog;
    Bevel2: TUniPanel;
    sbtnSaveXMLToFile: TUniSpeedButton;
    PMain: TUniPopupMenu;
    SaveXMLtoFile2: TUniMenuItem;
    PXML: TUniPopupMenu;
    SavetoFile1: TUniMenuItem;
    ZoomXML2: TUniMenuItem;
    ZoomXML1: TUniMenuItem;
    sbtnZoomXML: TUniSpeedButton;
    Contents1: TUniMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Search1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure sbtnToggleTableFormClick(Sender: TObject);
    procedure PurgeRecords1Click(Sender: TObject);
    procedure SaveXMLtoFile1Click(Sender: TObject);
    procedure ZoomXML1Click(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure SaveXMLToFile(const AFileName: String);
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoDispositionServerDBLog;

var
  FrmDispoServerDBLog: TFrmDispoServerDBLog;

implementation

{$R *.dfm}


uses
  disposvr_purgerange,
  disposvr_rscstr,
  IQMS.Common.EditMemoStr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg;

procedure DoDispositionServerDBLog;
begin
  if not TableExists('DISPOSVRLOG') then
    raise Exception.Create
      ('The required table (DISPOSVRLOG) does not exist.  Cannot continue.');

  TFrmDispoServerDBLog.Create(Application).Show;
end;

{ TFrmDispoServerDBLog }

procedure TFrmDispoServerDBLog.FormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.CenterForm(Self);
  IQMS.Common.Controls.AdjustPageControlToParent(pcMain);

  if not TblDispoSvrLog.Active then
    TblDispoSvrLog.Open;
  TblDispoSvrLog.Last; // last record

  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
  IQMS.Common.Controls.ResizeNavBar(NavMain);
end;

procedure TFrmDispoServerDBLog.FormShow(Sender: TObject);
begin
  //
end;

procedure TFrmDispoServerDBLog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmDispoServerDBLog.Search1Click(Sender: TObject);
var
  AID: Real;
begin
  with PkDispoSvrLog do
    if Execute then
      begin
        AID := GetValue('ID');
        TblDispoSvrLog.Locate('ID', AID, []);
      end
    else
      System.SysUtils.Abort;
end;

procedure TFrmDispoServerDBLog.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmDispoServerDBLog.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmDispoServerDBLog.sbtnToggleTableFormClick(Sender: TObject);
begin
  IQMS.Common.Controls.TogglePageControl(pcMain);
end;

procedure TFrmDispoServerDBLog.PurgeRecords1Click(Sender: TObject);
var
  AOption: TDispSvrPurgeOption;
  AStartDate, AEndDate: TDateTime;
  hMsg: TPanelMesg;
begin
  // Initial
  hMsg := NIL;

  // Get purge options
  if disposvr_purgerange.GetDispoSvrPurgeRange(Self, AOption,
    AStartDate, AEndDate) then
    try
      hMsg := hPleaseWait
        (disposvr_rscstr.cTXT0000078 { 'Purging log records.  Please wait.' } );
      TblDispoSvrLog.DisableControls;
      case AOption of
        dspBefore:
          begin
            ExecuteCommandParam
              ('delete from disposvrlog where trunc(created) <= trunc(:START_DATE)',
              ['START_DATE;DATE'], [AStartDate]); // pas
          end;
        dspAfter:
          begin
            ExecuteCommandParam
              ('delete from disposvrlog where trunc(created) >= trunc(:START_DATE)',
              ['START_DATE;DATE'], [AStartDate]); // pas
          end;
        dspRange:
          begin
            if Trunc(AStartDate) = Trunc(AEndDate) then
              ExecuteCommandParam
                ('delete from disposvrlog where trunc(created) = trunc(:START_DATE)',
                ['START_DATE;DATE'], [AStartDate]) // pas
            else
              ExecuteCommandParam
                ('delete from disposvrlog where trunc(created) between trunc(:START_DATE) and trunc(:END_DATE)',
                ['START_DATE;DATE', 'END_DATE;DATE'], [AStartDate, AEndDate]);
            // pas
          end;
      end; // end case
      TblDispoSvrLog.Refresh;
    finally
      if Assigned(hMsg) then
        FreeAndNil(hMsg);
      TblDispoSvrLog.EnableControls;
    end;
end;

procedure TFrmDispoServerDBLog.SaveXMLtoFile1Click(Sender: TObject);
begin
  if TblDispoSvrLogXMLTEXT.IsNull then
    raise Exception.Create
      (disposvr_rscstr.cTXT0000079 { 'There is no XML to save.' } );

  with SaveXMLDialog do
    if Execute then
      SaveXMLToFile(FileName);
end;

procedure TFrmDispoServerDBLog.SaveXMLToFile(const AFileName: String);
var
  ALines: TStringList;
begin

  if TblDispoSvrLogXMLTEXT.IsNull then
    Exit;

  // Initial
  ALines := NIL;

  if FileExists(AFileName) then
    DeleteFile(AFileName);
  try
    ALines := TStringList.Create;
    ALines.Text := TblDispoSvrLogXMLTEXT.AsString;
    ALines.SaveToFile(AFileName);
  finally
    if Assigned(ALines) then
      ALines.Free;
  end;
end;

procedure TFrmDispoServerDBLog.ZoomXML1Click(Sender: TObject);
var
  S: String;
begin
  if TblDispoSvrLogXMLTEXT.IsNull then
    Exit;
  S := TblDispoSvrLogXMLTEXT.AsString;

  DoViewMemoStr(Self, S, disposvr_rscstr.cTXT0000080 { 'View XML Text' } );
end;

procedure TFrmDispoServerDBLog.GridDblClick(Sender: TObject);
begin
  if Grid.GetActiveField = TblDispoSvrLogXMLTEXT then
    try
      ZoomXML1Click(Sender);
    finally
      System.SysUtils.Abort;
    end;
end;

procedure TFrmDispoServerDBLog.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmDispoServerDBLog.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmSETUP { CHM } , iqhtmSETUPch4 { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

end.

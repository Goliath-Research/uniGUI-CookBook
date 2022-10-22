unit Frlpost;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.Common.PanelMsg,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmUnpostedBatches = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    IQSearch1: TIQUniGridControl;
    SrcGlBatchId: TDataSource;
    QryGlBatchId: TFDQuery;
    SBSave: TUniSpeedButton;
    N1: TUniMenuItem;
    Postselectedbatches1: TUniMenuItem;
    QryGlBatchIdID: TBCDField;
    QryGlBatchIdSOURCE: TStringField;
    QryGlBatchIdBATCHNUMBER: TBCDField;
    QryGlBatchIdGLPERIODS_ID: TBCDField;
    QryGlBatchIdTABLENAME: TStringField;
    QryGlBatchIdBATCH_DATE: TDateTimeField;
    QryGlBatchIdUSERID: TStringField;
    QryGlBatchIdTIME_STAMP: TDateTimeField;
    QryGlBatchIdSTART_DATE: TDateTimeField;
    QryGlBatchIdEND_DATE: TDateTimeField;
    QryGlBatchIdSYSTEM_DATE: TDateTimeField;
    QryGlBatchIdPERIOD: TBCDField;
    IQAbout1: TIQWebAbout;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SBSaveClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    HMsg:TPanelMesg;
  public
    { Public declarations }
  end;

procedure DoShowUnpostedBatches;

implementation
{$R *.DFM}
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Locks,
  FrlShare;

procedure DoShowUnpostedBatches;
var
  LFrmUnpostedBatches : TFrmUnpostedBatches;
begin
  LFrmUnpostedBatches := TFrmUnpostedBatches.Create(UniGUIApplication.UniApplication);
  LFrmUnpostedBatches.Show;
end;

procedure TFrmUnpostedBatches.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmUnpostedBatches.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmUnpostedBatches.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmUnpostedBatches.SBSaveClick(Sender: TObject);
var
  i:Integer;
  IQFrlLockHandle: string;
begin
  if IqSearch1.DbGrid.datasource.dataset.Eof and IqSearch1.DbGrid.datasource.dataset.Bof then Exit;
  if not IqConfirmYN('Do you wish to post the selected batches to the FRx tables?') then Exit;
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain SelectedList
  if (IqSearch1.DbGrid.SelectedList.Count = 0) then
    IqSearch1.DBGrid.SelectRecord;
  if not DB_DataModule.AcquireIQLock( IQFrlLockHandle, IQMS_FRL, IQLOCK_EXCLUSIVE ) then
  begin
    IQWarning('c_glacct_ybb_all_periods_cumm table is currently in use. Please try again later.');
    EXIT;
  end;
end; }
(* TODO -oGPatil -cWebConvert : TUniDBGrid does not contain SelectedList

  try
    HMsg:= hPleaseWait( 'please wait...' );
    Populate_c_glacct_ybb_all_periods_cumm; {in FrlShare.pas}
    ExecuteCommand('begin FRX_UPDATE.Checkup; end;');
//    ExecuteCommand('begin FRX_UPDATE.Check_frl_seg_desc; end;');

    with IqSearch1.DbGrid, IqSearch1.DbGrid.datasource.dataset do
    for i:= 0 to SelectedList.Count - 1 do
    begin
      GotoBookmark(SelectedList.items[i]);
      HMsg.Mesg:= Format('Posting Batch %s...', [FieldByName('BATCHNUMBER').asString]);
      ExecuteCommandFmt('begin FRX_UPDATE.Process_New_GlBatchId(%f); end;', [FieldByName('ID').asFloat]);
    end;
    IqSearch1.DbGrid.UnSelectAll;
    QryGlBatchId.Close;
    QryGlBatchId.Open;
  finally
    DB_DataModule.IQUnLock( IQFrlLockHandle );
    HMsg.Free;
  end; *)
end;

procedure TFrmUnpostedBatches.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
  IQSetTablesActive( true, self );
end;

end.

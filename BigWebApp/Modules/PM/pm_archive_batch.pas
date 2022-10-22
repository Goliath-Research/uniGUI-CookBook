unit pm_archive_batch;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Search,
  IQMS.Common.UserMessages,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Error,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  { TFrmPMArchiveBatch }
  TFrmPMArchiveBatch = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    PnlCarrier: TUniPanel;
    IQSearch1: TIQUniGridControl;
    SrcData: TDataSource;
    QryData: TFDQuery;
    QryDataID: TBCDField;
    QryDataWO_DATE: TDateTimeField;
    QryDataUSERID: TStringField;
    QryDataDEPARTMENT: TStringField;
    QryDataSTATUS: TStringField;
    QryDataPRIORITY: TStringField;
    QryDataWO_TYPE: TStringField;
    QryDataSTART_DATE: TDateTimeField;
    QryDataEND_DATE: TDateTimeField;
    QryDataCLASS: TStringField;
    QryDataEPLANT_ID: TBCDField;
    QryDataEPLANT_NAME: TStringField;
    QryDataREQUESTED_BY: TStringField;
    QryDataCUSER1: TStringField;
    QryDataCUSER2: TStringField;
    QryDataCUSER3: TStringField;
    QryDataCUSER4: TStringField;
    QryDataCUSER5: TStringField;
    QryDataCUSER6: TStringField;
    QryDataCUSER7: TStringField;
    QryDataCUSER8: TStringField;
    QryDataCUSER9: TStringField;
    QryDataCUSER10: TStringField;
    QryDataNUSER1: TFMTBCDField;
    QryDataNUSER2: TFMTBCDField;
    QryDataNUSER3: TFMTBCDField;
    QryDataNUSER4: TFMTBCDField;
    QryDataNUSER5: TFMTBCDField;
    PMain: TUniPopupMenu;
    JumpToWorkOrder1: TUniMenuItem;
    Contents1: TUniMenuItem;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure JumpToWorkOrder1Click(Sender: TObject);
    procedure PMainPopup(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Contents1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Validate;
    //procedure ProcessMarked;
    procedure ArchiveRecord(AID: Int64);
    procedure FindRefreshPMWOForm;
  public
    { Public declarations }
    FDoNotCloseOnExit: Boolean;
  end;

procedure DoBatchArchive;


implementation

{$R *.dfm}


uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg,
  pm_rscstr;
  { TODO -ohphadke : Dependency
  pm_wo; }

procedure DoBatchArchive;
Var
  LFrmPMArchiveBatch : TFrmPMArchiveBatch;
begin
  LFrmPMArchiveBatch := TFrmPMArchiveBatch.create(UniGUIApplication.UniApplication);
   LFrmPMArchiveBatch.ShowModal;
end;

{ TFrmPMArchiveBatch }


procedure TFrmPMArchiveBatch.FormShow(Sender: TObject);
begin
  IqRegFormRead(Self, [Self]);
end;

procedure TFrmPMArchiveBatch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IqRegFormWrite(Self, [Self]);
end;

procedure TFrmPMArchiveBatch.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPMArchiveBatch.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmPMArchiveBatch.JumpToWorkOrder1Click(Sender: TObject);
begin
  //if QryDataID.AsLargeInt > 0 then
    //DoJumpToPMWO(Application, QryDataID.AsLargeInt);
end;

procedure TFrmPMArchiveBatch.PMainPopup(Sender: TObject);
begin
  JumpToWorkOrder1.Enabled := (QryDataID.AsLargeInt > 0);
end;

procedure TFrmPMArchiveBatch.btnOKClick(Sender: TObject);
begin
  Validate;
  { 'About to archive %d MRO work orders. ' +
    'Are you sure you want to continue?' }
  if not IQConfirmYN(Format(pm_rscstr.cTXT0000308,
    [IQSearch1.DBGrid.SelectedRows.Count])) then
    Exit;
  //ProcessMarked;
  FindRefreshPMWOForm;
  if not FDoNotCloseOnExit then
    Close
  else
    RefreshDataSetByID(QryData);
end;

procedure TFrmPMArchiveBatch.Validate;
begin
  if (IQSearch1.DBGrid.SelectedRows.Count = 0) then
    // 'Please select one or more Work Orders to archive.'
    raise Exception.Create(pm_rscstr.cTXT0000307);
end;

{ TODO -ohphadke : Refactor
procedure TFrmPMArchiveBatch.ProcessMarked;
var
  I, J: Integer;
  hMsg: TPanelMesg;
  AMsg: String;
  ACompressing: Boolean;
begin
  // with IQSearch1 do
  hMsg := hPleaseWait('');
  try

    IQSearch1.DataSet.DisableControls;
    try
      try
        for I := 0 to IQSearch1.wwDBGrid.SelectedList.Count - 1 do
          begin
            IQSearch1.DataSet.GotoBookmark
              (IQSearch1.wwDBGrid.SelectedList.Items[I]);
            // 'Archiving MRO work order # %s'
            hMsg.Mesg := Format(pm_rscstr.cTXT0000309,
              [QryData.FieldByName('id').AsString]);
            ArchiveRecord(IQSearch1.DataSet.FieldByName('id').AsLargeInt);
          end;

      except
        on E: Exception do
          begin
            IQSearch1.wwDBGrid.UnselectAll;
            ReOpen(QryData);

            AMsg := E.Message;
            if E is EFDDBEngineException then
              with E as EFDDBEngineException do
                begin
                  ACompressing := False;
                  for J := 0 to ErrorCount - 1 do
                    if Errors[J].ErrorCode = 1502 then
                      ACompressing := true;

                  if ACompressing then
                    { 'Failed to Archive MRO work order # %s'#13 +
                      'System is currently busy compressing a table ' +
                      'and rebuilding associated indexes.  Please ' +
                      'wait and try again later.'#13#13 +
                      '%s' }
                    {AMsg := Format(pm_rscstr.cTXT0000310,
                      [QryData.FieldByName('id').AsString,
                      E.Message])
                  else
                    // 'Failed to Archive MRO work order # %s'#13#13'%s'
                    AMsg := Format(pm_rscstr.cTXT0000311,
                      [QryData.FieldByName('id').AsString, E.Message]);
                end;
            if AMsg <> '' then
              IQWarning(AMsg);

            FindRefreshPMWOForm;
            Close;
          end;
      end;
    finally
      IQSearch1.DataSet.EnableControls;
    end;
  finally
    hMsg.Free;
  end;
end;   }

procedure TFrmPMArchiveBatch.UniFormCreate(Sender: TObject);
begin
  FDoNotCloseOnExit := False;
  inherited;
  ReOpen(QryData);
end;

procedure TFrmPMArchiveBatch.ArchiveRecord(AID: Int64);
begin
  // Note:  All detail items for each of the MRO WO records has already
  // been closed.  We do not archive Work Orders with open items.
  ExecuteCommandFmt(
    'UPDATE pmwo              '#13 +
    '   SET archived = ''Y''  '#13 +
    ' WHERE id = %d           ',
    [AID]);
end;

procedure TFrmPMArchiveBatch.FindRefreshPMWOForm;
var
  I: Integer;
begin
  for I := Screen.FormCount - 1 downto 0 do
//    if CompareText(Screen.Forms[I].ClassName, 'TFrmPMWo') = 0 then
//      PostMessage(Screen.Forms[I].Handle, iq_RefreshDataSets, 1, 0);
end;

procedure TFrmPMArchiveBatch.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext)
end;

end.

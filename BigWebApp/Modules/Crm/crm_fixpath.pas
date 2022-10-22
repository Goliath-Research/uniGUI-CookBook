unit crm_fixpath;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  MaskUtils,
  Vcl.Buttons,
  Vcl.FileCtrl,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.Common.ProgressDialog,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  iqms.common.DataConst,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniMainMenu, IQMS.WebVcl.MultimediaSounds;

type
  TAttachmentPath = (
    apExtDocs, // External Documents
    apIQCRM_Activities, // CRM Activity and Support Issue Attachments
    apIQCRM_ActivityDescrip, // Set file description to equal file name
    apIQCRM_AnswerBk, // CRM Answer Book Attachments
    apIQCRM_AnswerBkDescrip, // Set file description to equal file name
    apInvImages, // Inventory Image Files
    apIQCRM_Shortcuts // CRM Shortcuts
    );

  TAttachmentPaths = set of TAttachmentPath;

  TFrmIQFixPath = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnExecute: TUniBitBtn;
    btnClose: TUniBitBtn;
    Panel7: TUniPanel;
    GroupBox1: TUniGroupBox;
    Panel9: TUniPanel;
    GroupBox2: TUniGroupBox;
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Panel4: TUniPanel;
    Bevel1: TUniPanel;
    PnlCheckboxes: TUniPanel;
    chkAutoClose: TUniCheckBox;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Actions1: TUniMenuItem;
    Execute1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel8: TUniPanel;
    sbtnBrowseOriginal: TUniSpeedButton;
    sbtnBrowseNew: TUniSpeedButton;
    PnlPathEdit: TUniPanel;
    edtOldPath: TUniEdit;
    edtNewPath: TUniEdit;
    chkExtDocs: TUniCheckBox;
    chkIQCRM_Activities: TUniCheckBox;
    chkIQCRM_ActivityDescrip: TUniCheckBox;
    chkIQCRM_AnswerBk: TUniCheckBox;
    chkIQCRM_AnswerBkDescrip: TUniCheckBox;
    chkInvImages: TUniCheckBox;
    chkCRMShortcuts: TUniCheckBox;
    IQWebSound1: TIQWebSound;
    procedure btnCloseClick(Sender: TObject);
    procedure DoExecuteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnBrowseOriginalClick(Sender: TObject);
    procedure sbtnBrowseNewClick(Sender: TObject);
    procedure OptionCheckClick(Sender: TObject);
    procedure DoCancelBtnClick(Sender: TObject);
  private
    { Private declarations }
    AttachmentPaths: TAttachmentPaths; // Which tables should be updated?
    ProgressDlg: TIQWebProgressDialog;
    FAbort: Boolean;
    procedure SetCaption;
    function ValidateSettings: Boolean;
    // a matter of form: ensure settings have been applied
    function ApplySettings: Boolean; // plug in text that needs to be displayed
    procedure SaveSettings;
    procedure UpdateAttachmentPaths;
    procedure ProcessExec; // wrapper to begin updating the paths
    procedure ProcessByDataSet(const AOldPath, ANewPath, ATableName,
      AFieldName: String);
    procedure SetControls;
    function RegFormPath: String;

    procedure InitProgressDlg;
    procedure StepProgressDlg;
    function CheckProcessAborted: Boolean;

  public
    { Public declarations }
  end;

procedure DoFixPath;

const
  cBasePath = '\Software\IQMS\IQWin32\'; // HKEY_CURRENT_USER


implementation

{$R *.DFM}


uses
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.Directory,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.Registry,
  IQMS.Common.StringUtils,
  IQMS.Common.panelmsg;

procedure DoFixPath;
begin
  TFrmIQFixPath.Create(UniApplication).Show;
end;

{ TFrmIQFixPath }

procedure TFrmIQFixPath.FormCreate(Sender: TObject);
begin
  try
    ProgressDlg := NIL;
    SetCaption;
    ApplySettings;
    // if not SecurityManager.IsUserDBA then
    // raise Exception.Create('Access denied.  DBA rights are required.');

  except
    on E: Exception do
      begin
        IQWebSound1.Beep;
        IQError(E.Message);
        Close;
      end;
  end;
end;

procedure TFrmIQFixPath.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlPathEdit);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlCheckboxes);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlButtons);
  SetControls;
end;

procedure TFrmIQFixPath.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveSettings;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmIQFixPath.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmIQFixPath.ProcessExec;
var
  AOldPath, ANewPath: String;
  hMsg: TPanelMesg;
begin
  // Main wrapper for updating file paths
  // By this time we should already have applied settings and done
  // whatever validation is necessary.

  hMsg := NIL;

  // Get old/new path, adjusted with final slash
  AOldPath := System.SysUtils.IncludeTrailingPathDelimiter(edtOldPath.Text);
  ANewPath := System.SysUtils.IncludeTrailingPathDelimiter(edtNewPath.Text);
  UpdateAttachmentPaths;

  // Validation
  if (Trim(AOldPath) = '') or (Trim(ANewPath) = '') or
    (AttachmentPaths = []) then
    Exit;

  if not IQConfirmYN('Update attachment paths now?') then
    Exit;

  // reset
  FAbort := FALSE;

  try
    // hMsg := hPleaseWait('Updating.  Please wait.');
    InitProgressDlg;

    btnClose.Enabled := FALSE;
    btnExecute.Enabled := FALSE;

    // External documents
    if apExtDocs in AttachmentPaths then
      begin
        ProcessByDataSet(AOldPath, ANewPath, 'DOC_LIBRARY', 'PATH');
        ProcessByDataSet(AOldPath, ANewPath, 'DOC_REVISION', 'FILENAME');
      end;

    // CRM attachments
    if apIQCRM_Activities in AttachmentPaths then
      begin
        ProcessByDataSet(AOldPath, ANewPath, 'CRM_ACTIVITY',
          'HYPERLINKADDRESS');
        ProcessByDataSet(AOldPath, ANewPath, 'CRM_EVENTS_ATTACHMENT',
          'HYPERLINKADDRESS');

        // Do we make sure the description matches the file name?
        if apIQCRM_ActivityDescrip in AttachmentPaths then
          begin
            ExecuteCommand
              ('update crm_activity set hyperlink = hyperlinkaddress');
            ExecuteCommand
              ('update crm_events_attachment set hyperlink = hyperlinkaddress');
          end;
      end;

    // CRM Answer Book attachments
    if apIQCRM_AnswerBk in AttachmentPaths then
      begin
        ProcessByDataSet(AOldPath, ANewPath, 'CRM_KNOWLEDGE_FILE', 'FILENAME');
        // Do we make sure the description matches the file name
        if apIQCRM_AnswerBkDescrip in AttachmentPaths then
          ExecuteCommand('update crm_knowledge_file set descrip = filename');
      end;

    // Inventory image file name
    if apInvImages in AttachmentPaths then
      ProcessByDataSet(AOldPath, ANewPath, 'ARINVT', 'IMAGE_FILENAME');

    // CRM Shortcuts
    if apIQCRM_Shortcuts in AttachmentPaths then
      begin
        ProcessByDataSet(AOldPath, ANewPath, 'CRM_SHORTCUTS',
          'HYPERLINKADDRESS');
        // Additionally, we fix the display text, in case the literal path
        // has been used.
        ProcessByDataSet(AOldPath, ANewPath, 'CRM_SHORTCUTS', 'HYPERLINK');
      end;

  finally
    btnClose.Enabled := TRUE;
    btnExecute.Enabled := TRUE;
    // if (hMsg<>NIL) and Assigned(hMsg) then FreeAndNil(hMsg);
    if (ProgressDlg <> NIL) and Assigned(ProgressDlg) then
      FreeAndNil(ProgressDlg);
  end;

  if not chkAutoClose.Checked then
    IQInformation('Done.')
  else
    Close;
end;

procedure TFrmIQFixPath.ProcessByDataSet(const AOldPath, ANewPath, ATableName,
  AFieldName: String);
var
  ASQL, AOldFileName, ANewFileName, AFileStub: String;
  ACount, ALength: Integer;
begin

  if (Trim(ATableName) = '') or (Trim(AFieldName) = '') then
    Exit;
  ALength := Length(AOldPath);

  if Assigned(ProgressDlg) then
    begin
      ACount := Trunc(SelectValueFmtAsFloat
        ('select count(*) from %s where trim(%s) > '' ''',
        [ATableName, AFieldName]));
      ProgressDlg.Status1 := Format('Updating paths (table, %s)', [ATableName]);
      ProgressDlg.MaxProgress := ACount;
      ProgressDlg.ProgressBar.Position := 0;
    end;

  with TFDQuery.Create(NIL) do
    try
      ConnectionName := cnstFDConnectionName;

      SQL.Add(Format('select id, %s from %s where trim(%s) > '' '' order by id',
        [AFieldName, ATableName, AFieldName]));
      Open;
      while not EOF do
        begin
          // Check to see if user clicked Cancel button
          if CheckProcessAborted then
            BREAK;

          AOldFileName := FieldByName(AFieldName).AsString;
          if UpperCase(Copy(AOldFileName, 0, ALength)) = UpperCase(AOldPath)
          then
            begin
              AFileStub := Copy(AOldFileName, ALength + 1, 256);
              ANewFileName := FixStr(ANewPath + AFileStub);
              ASQL := Format('update %s '#13 +
                'set %s = :%s '#13 +
                'where id = %.0f',
                [ATableName, AFieldName, UpperCase(AFieldName),
                FieldByName('ID').AsFloat]);
              ExecuteCommandParam(ASQL,
                [UpperCase(AFieldName)],
                [ANewFileName]);
              { ExecuteCommandFmt('update %s ' +
                'set %s = ''%s'' ' +
                'where id = %.0f',
                [ATableName, AFieldName, ANewFileName, FieldByName('ID').AsFloat] ); }
              StepProgressDlg;
              Invalidate;
            end;

          Next;
        end;
    finally
      Free;
    end;
end;

procedure TFrmIQFixPath.DoExecuteClick(Sender: TObject);
begin
  ProcessExec;
end;

function TFrmIQFixPath.ValidateSettings: Boolean;
begin
  // Validation
  if (Trim(edtOldPath.Text) = '') then
    raise Exception.Create('Application Error:  Unspecified original path.');

  if (Trim(edtNewPath.Text) = '') then
    raise Exception.Create('Application Error:  Unspecified new path.');

  if AttachmentPaths = [] then
    raise Exception.Create('Application Error:  Unspecified options.');

  if not DirectoryExists(Trim(edtNewPath.Text)) then
    IQWarning(Format
      ('The new path, %s, could not be found.  Processes will continue.',
      [Trim(edtNewPath.Text)]));

  Result := TRUE;

end;

function TFrmIQFixPath.RegFormPath: String;
begin
  Result := cBasePath + ExtractFileName(Application.ExeName);
end;

function TFrmIQFixPath.ApplySettings: Boolean;
var
  AFormPath: String;
begin
  AFormPath := RegFormPath;
  edtOldPath.Text := LoadStrFromCurrentUserRegistry(AFormPath, 'Old Path');
  edtNewPath.Text := LoadStrFromCurrentUserRegistry(AFormPath, 'New Path');
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self,
    chkExtDocs,
    chkIQCRM_Activities,
    chkIQCRM_ActivityDescrip,
    chkIQCRM_AnswerBk,
    chkIQCRM_AnswerBkDescrip,
    chkInvImages,
    chkCRMShortcuts,
    chkAutoClose]);
  // Fill form controls with values, based on the settings
  (*
    Result := ValidateSettings;


    memDisplay.Clear; // clear default display

    // Path text
    edtOldPath.Text := GetDirectoryName(iqfixpath_lib.AOriginalPath);
    edtNewPath.Text := GetDirectoryName(iqfixpath_lib.ANewPath);

    // Update display based on the options that have been set.
    // This is just cosmetic.
    if apExtDocs                in AttachmentPaths then memDisplay.Lines.Add('External Documents');
    if apIQCRM_Activities       in AttachmentPaths then memDisplay.Lines.Add('CRM Activity and Support Issue Attachments');
    if apIQCRM_ActivityDescrip  in AttachmentPaths then memDisplay.Lines.Add('Set file description to equal file name');
    if apIQCRM_AnswerBk         in AttachmentPaths then memDisplay.Lines.Add('CRM Answer Book Attachments');
    if apIQCRM_AnswerBkDescrip  in AttachmentPaths then memDisplay.Lines.Add('Set file description to equal file name');
    if apInvImages              in AttachmentPaths then memDisplay.Lines.Add('Inventory Image Files');
  *)
end;

procedure TFrmIQFixPath.SaveSettings;
var
  AFormPath: String;
begin
  AFormPath := RegFormPath;
  SaveStrToCurrentUserRegistry(AFormPath, 'Old Path', edtOldPath.Text);
  SaveStrToCurrentUserRegistry(AFormPath, 'New Path', edtNewPath.Text);
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self,
    chkExtDocs,
    chkIQCRM_Activities,
    chkIQCRM_ActivityDescrip,
    chkIQCRM_AnswerBk,
    chkIQCRM_AnswerBkDescrip,
    chkInvImages,
    chkCRMShortcuts,
    chkAutoClose]);
end;

procedure TFrmIQFixPath.SetCaption;
var
  S: String;
begin
  // NOTE:  This should only be called once at startup
  S := Self.Caption;
  Caption := Format('%s [%s]', [S, IQMS.Common.Miscellaneous.IQGetServerName]);
end;

procedure TFrmIQFixPath.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmIQFixPath.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmIQFixPath.sbtnBrowseOriginalClick(Sender: TObject);
var
  ADir: String;
begin
  ADir := edtOldPath.Text;
  if DirBrowse(ADir) then // Iqdir.pas
    edtOldPath.Text := System.SysUtils.IncludeTrailingPathDelimiter(ADir);
end;

procedure TFrmIQFixPath.sbtnBrowseNewClick(Sender: TObject);
var
  ADir: String;
begin
  ADir := edtNewPath.Text;
  if DirBrowse(ADir) then // Iqdir.pas
    edtNewPath.Text := System.SysUtils.IncludeTrailingPathDelimiter(ADir);
  // iqfile
end;

procedure TFrmIQFixPath.UpdateAttachmentPaths;
// ---------------------------------------------------------------------------
  procedure _Eval(ACheckBox: TUniCheckBox; AAttachmentPath: TAttachmentPath);
  begin
    if ACheckBox.Checked then
      AttachmentPaths := AttachmentPaths + [AAttachmentPath];
  end;
// ---------------------------------------------------------------------------

// var
// i: Integer;
begin
  AttachmentPaths := [];
  { for i := 0 to lstOptions.Count - 1 do
    if lstOptions.Checked[i] then
    AttachmentPaths := AttachmentPaths + [TAttachmentPath(i)]; }

  _Eval(chkExtDocs, apExtDocs);
  _Eval(chkIQCRM_Activities, apIQCRM_Activities);
  _Eval(chkIQCRM_ActivityDescrip, apIQCRM_ActivityDescrip);
  _Eval(chkIQCRM_AnswerBk, apIQCRM_AnswerBk);
  _Eval(chkIQCRM_AnswerBkDescrip, apIQCRM_AnswerBkDescrip);
  _Eval(chkInvImages, apInvImages);
  _Eval(chkCRMShortcuts, apIQCRM_Shortcuts);

end;

procedure TFrmIQFixPath.OptionCheckClick(Sender: TObject);
begin
  UpdateAttachmentPaths;
  SetControls;
end;

procedure TFrmIQFixPath.SetControls;
begin
  IQEnableControl(chkIQCRM_ActivityDescrip, chkIQCRM_Activities.Checked);
  IQEnableControl(chkIQCRM_AnswerBkDescrip, chkIQCRM_AnswerBk.Checked);
  IQEnableControl([Execute1, btnExecute], AttachmentPaths <> []);
end;

procedure TFrmIQFixPath.InitProgressDlg;
begin
  if Assigned(ProgressDlg) then
    Exit;

  // create and initialize the progress dialog
  ProgressDlg := TIQWebProgressDialog.Create(NIL); // IQMS.Common.ProgressDialog.pas
  with ProgressDlg do
    begin
      MinProgress := 0;
      MaxProgress := 100;
      Caption := 'Fix Path';
      Execute;
      CancelBtn.OnClick := DoCancelBtnClick;
      Status1 := 'Initializing...';
      Status2 := '';
    end;
end;

procedure TFrmIQFixPath.StepProgressDlg;
begin
  if Assigned(ProgressDlg) then
    ProgressDlg.StepProgress;
end;

procedure TFrmIQFixPath.DoCancelBtnClick(Sender: TObject);
begin
  FAbort := TRUE;
end;

function TFrmIQFixPath.CheckProcessAborted: Boolean;
begin

  Result := FAbort;

  if FAbort then
    try
      if Assigned(ProgressDlg) then
        ProgressDlg.Hide;
      Result := IQConfirmYN(crm_rscstr.cTXT0001532 { 'Abort operation?' } );
      if not Result then
        FAbort := FALSE; // reset; user changed mind
    finally
      if not Result and Assigned(ProgressDlg) then
        ProgressDlg.Show;
    end;
end;

end.

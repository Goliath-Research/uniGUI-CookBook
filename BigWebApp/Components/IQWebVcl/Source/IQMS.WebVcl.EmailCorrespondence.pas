unit IQMS.WebVcl.EmailCorrespondence;

{$I Compilers_.inc}

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ActiveX, Winapi.ShlObj,
  System.Classes, System.SysUtils, System.Variants, System.Win.ComObj,
  uniGUIClasses, uniGUIFrame,
  Data.DB, Data.SqlExpr, Vcl.Buttons, Vcl.Clipbrd, Vcl.Controls, Vcl.DBCtrls,
  Vcl.DBGrids, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Forms, Vcl.Graphics, Vcl.Grids,
  Vcl.Menus, Vcl.StdCtrls,
//  Vcl.Wwdatsrc, Vcl.Wwdbgrid, Vcl.Wwdbigrd, Vcl.wwMemo,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.DApt,
  FireDAC.DApt.Intf, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.Stan.Async,
  FireDAC.Stan.Error, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,
//  db_dm,
//  DMComps,
  IQMS.WebVcl.DocumentsCoordinator,
  IQMS.WebVcl.Search;

type
  { TIQWebEMailCorrespondence }
  TIQWebEMailCorrespondence = class(TUniFrame)
  private const
    { Private constants }
    CLIENT_KIND_OUTLOOK = 0;
    CLIENT_KIND_OUTLOOK_EXPRESS = 1;
    CLIENT_KIND_LOTUSNOTES = 2; // added 04/02/2009 (Byron)

    { Outlook email message streams. }
    STORAGE_SUBJECT: PWideChar = '__substg1.0_0037001F';
    STORAGE_SUBJECT_ORIGINAL: PWideChar = '__substg1.0_0070001F';
    STORAGE_SUBJECT_ORIGINAL2: PWideChar = '__substg1.0_0E1D001F';
    STORAGE_RECIPIENT_NAME: PWideChar = '__substg1.0_0E04001F';
    STORAGE_SENDER_NAME: PWideChar = '__substg1.0_0C1A001F';
    STORAGE_SENDER_NAME2: PWideChar = '__substg1.0_0042001F';
    STORAGE_SENDER_EMAIL: PWideChar = '__substg1.0_5D01001F';
    STORAGE_COPY_RECIPIENT: PWideChar = '__substg1.0_0E03001F';

    // Provides a string list, detailed summary of the e-mail.
    STORAGE_EMAIL_HEADER: PWideChar = '__substg1.0_007D001F';

    STORAGE_BODYTEXT_2000: PWideChar = '__substg1.0_1000001E';
    STORAGE_BODYTEXT_2003: PWideChar = '__substg1.0_1000001F';
    STORAGE_BODYTEXT_2003_ALT1: PWideChar = '__substg1.0_37010102';
    STORAGE_BODYTEXT_2003_ALT2: PWideChar = '__substg1.0_80050102';
    STORAGE_BODYTEXT_HTML: PWideChar = '__substg1.0_1013001E';

    { Outlook email message substorage streams. }
    SUBSTORAGE_FILE_NAME: PWideChar = '__substg1.0_3001001F';
    SUBSTORAGE_FILE_NAME_SHORT: PWideChar = '__substg1.0_3704001F';
    SUBSTORAGE_FILE_EXT: PWideChar = '__substg1.0_3703001F';
    // Returns: 'image001.jpg','image002.jpg', etc.
    SUBSTORAGE_FILE_NAME_EMBEDDED: PWideChar = '__substg1.0_3707001F';
    // Returns:  'image/jpeg','image/png', etc. If none is provided, then
    // the file is a true attachment, and not embedded.
    SUBSTORAGE_CONTENT_TYPE: PWideChar = '__substg1.0_370E001F';
    // Returns:  ''image001.jpg@01CD2DC1.CE678040',
    // 'image002.jpg@01CD2DC1.CE678040'.  If none is provided, then
    // the file is a true attachment, and not embedded.
    SUBSTORAGE_CONTENT_ID: PWideChar = '__substg1.0_3712001F';

    // Clipboard format names for internet messages
    FORMAT_OUTLOOK_ATHENA = 'Athena Mail Messages';
    FORMAT_OUTLOOK_EXPRESS = 'Outlook Express Messages';
    FORMAT_FILE_GROUP_DESCRIPTOR = 'FileGroupDescriptor';
    // FORMAT_FILE_GROUP_DESCRIPTORW = 'FileGroupDescriptorW';
    FORMAT_FILE_CONTENTS = 'FileContents';
    FORMAT_LOTUSNOTES_V7 = 'Notes Private Data'; // old
    FORMAT_LOTUSNOTES_V85 =
      'com.ibm.rcp.csiviews.util.DocumentSummaryTransfer';
    FORMAT_FILENAME = 'FileName';
    FORMAT_RTF = 'Rich Text Format';
    FORMAT_URL = 'UniformResourceLocator';

    // Lotus Note data formats
    // FORMAT_LOTUSNOTES_PRIVATE_DATA = 'Notes Private Data';
    // FORMAT_LOTUSNOTES_PRIVATE_LINK = 'Notes Private Link';
    // FORMAT_LOTUSNOTES_LINK_SOURCE_DESCRIPTOR = 'Link Source Descriptor';
    FORMAT_LOTUSNOTES_LINK_SOURCE = 'Link Source';
    FORMAT_LOTUSNOTES_XML_DATA = 'XMLData';

    cnstStandardVisiBtns: TNavButtonSet = [nbFirst, nbPrior, nbNext, nbLast,
      nbDelete, nbPost, nbCancel, nbRefresh];
    cnstReadOnlyVisiBtns: TNavButtonSet = [nbFirst, nbPrior, nbNext, nbLast,
      nbRefresh];
  private
    { Private declarations }
    FActive: Boolean;
    FSource: string;
    FMasterFields: string;
    FEmailCorrespondence_ID: Real;
    FMasterID: Real;

//    FPnlTop: TPanel;
//    FPnlGrid: TPanel;
//    FPopUp: TPopUpMenu;
//    FSBtnViewEmail: TSpeedButton;

    FIQSearch: TIQWebSearch;
//    FDMTextTarget: TDMTextTarget;

    FDUpdateSQL_EMailCorr: TFDUpdateSQL;
    FQryEmailCorr: TFDQuery;
    FSrcEmailCorr: TDataSource;

    FOnNewRecord: TDataSetNotifyEvent;
    FBeforeInsert: TDataSetNotifyEvent;
    FBeforeDelete: TDataSetNotifyEvent;
    FAttachedDocumentsCoordinator: TIQAttachedDocumentsCoordinator;

    // For backward compatibility
    FDataBaseName: string;
    FReadOnly: Boolean;

    { Component events }
    procedure Notification(AComponent: TComponent; Operation: TOperation);
    procedure EmailCorrDataChange(Sender: TObject; Field: TField);
    procedure DoNewRecord(DataSet: TDataSet);
    procedure DoBeforeInsert(DataSet: TDataSet);
    procedure BeforeDeleteEmailCorrespondence(DataSet: TDataSet);
    procedure DoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DoDMTextTargetDrop(Sender: TObject; Acceptor: TWinControl;
      const DropText: string; X, Y: Integer);
    procedure LaunchViewEmailClick(Sender: TObject);
    procedure CheckLaunchViewEmailClick(Sender: TObject);
    procedure DispatchNavButtonClicked(Sender: TObject; Button: TNavigateBtn);
    procedure IQSearchEmailCorrespondenceCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);

    { Dataset methods }
    procedure AssignQuery;
    procedure CreateTFields;
    procedure AssignColumns;
    procedure SetTablesActive(AValue: Boolean);
    function CheckConnected: Boolean;

    { Property methods }
    function GetMasterSource: TDataSource;
    procedure SetMasterSource(AValue: TDataSource);
    procedure SetSource(const Value: string);
    function GetActive: Boolean;
    procedure SetActive(AValue: Boolean);
    function GetSource_ID: Real;
    procedure SetSource_ID(const Value: Real);
    procedure SetIsReadOnly(const Value: Boolean);
    function GetMasterField: TField;

    { Helper methods }
    /// <summary> Generate a temporary file name with the given extension.
    /// </summary>
    procedure AssignTempFileName(var AFileName: string; AExt: string);
    /// <summary> Display the stored email. </summary>
    procedure LaunchEmailFromBlob(AID: Real; AKind: Real);
    /// <summary> Get the TDateTime value for the given string and email
    /// client "kind".  The string is parsed according to expected formats
    /// for the given client. </summary>
    function GetReceivedDate(ADateStr: string; AKind: Real): TDateTime;
    /// <summary> Remove HTML tags from the string passed as a variable.
    /// This method is used to remove HTML tags from body text. </summary>
    function StripTagsFrom(const AString: string): string;
    /// <summary> Get the default file extension for the given email
    /// client "kind".  For example:  .msg or .eml.
    /// </summary>
    function KindToEmailFileExt(AKind: Real): string;

    { Process Drop:  Outlook }
    procedure DoProcessOutlook;
    procedure Outlook_ProcessMsgText(ALines: TStringList;
      var ABodyText: string);
    /// <summary>Read one property from an IStorage.  This is a helper
    /// method, used for reading Outlook email data.</summary>
    function Outlook_ReadStorageProperty(AStorage: IStorage;
      AProperty: PWideChar): string;
    /// <summary> Process an Outlook .MSG file.  If the file is a valid,
    /// it will be added to the dataset.
    /// </summary>
    procedure Outlook_ProcessMsgFile(AFileName: string);
    /// <summary>Open and parse an Outlook .MSG file.</summary>
    function Outlook_ExtractMsgFileData(AFileName: string;
      var ASender, ARecipient,
      ASubject, ABodyText: string; var ASentDate: TDateTime;
      var AHeaders: TStringList; var AAttachmentCount: Integer): Boolean;
    /// <summary> Parse an Outlook email header. </summary>
    procedure Outlook_ParseHeader(const AHeader: TStringList; var AFrom, ATo,
      ASubject: string; var ADate: TDateTime);
    /// <summary> Get the Outlook email attachment count from an IStorage.</summary>
    function Outlook_AttachmentCount(AMsgIStorage: IStorage;
      var AAttachmentCount: Integer): Boolean;
    /// <summary> Get the body text contained in the storage. </summary>
    function Outlook_ExtractBodyText(AMsgIStorage: IStorage;
      var ABodyText: string): Boolean;

    function ConvertUnicodeFileToAnsi(const AFileName: String): Boolean;

    { Process Drop:  Outlook Express }
    procedure DoProcessOutlookExpress;
//    procedure OutlookExpress_ProcessMsgText(ADropObjDetails
//      : TStringList; ATempMsgFileName: string; var ABodyText: string);

    { Process Drop:  Lotus Notes }
//    procedure DoProcessLotusNotes;

    { Process Drop:  Files }
//    procedure DoProcessFile;

    { Blob and body text }
    /// <summary> Update the current EMail Correspondence record with
    /// the provided data. </summary>
    procedure SaveMailMessage(AList: TStringList; AKind: Real; ABody: string;
      AAttachmentCount: Integer);
    /// <summary> Save file binary contents into the blob field. </summary>
    procedure LoadFileIntoBlob(AID: Real; AFileName: string);
    /// <summary> Save file binary contents into the blob field. </summary>
//    procedure LoadFileIntoBlobEx(AID: Real; AFileName: string);
    /// <summary> Update the body text and attachment count for the
    /// provided record id. </summary>
//    procedure UpdateBodyText(AID: Real; ABodyText: string; AAttachmentCount: Integer);

  protected
    { Protected declarations }
    procedure Loaded; override;
    procedure AdjustScreen;
  public
    { Public declarations }
    property AttachedDocumentsCoordinator: TIQAttachedDocumentsCoordinator
      read FAttachedDocumentsCoordinator write FAttachedDocumentsCoordinator;

    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;

    /// <summary> Refresh the target acceptor handle. </summary>
    procedure RefreshTarget;

    /// <summary> Refresh the dataset. </summary>
    procedure Refresh;

    /// <summary>Returns true if documents have been attached.</summary>
    function HasDocuments: Boolean;

    /// <summary> Get or set component read-only state. </summary>
    property IsReadOnly: Boolean read FReadOnly write SetIsReadOnly stored True;

  published
    { Published declarations }
    // Obsolete:
    // Preserved for backward compatibility; set stored to False for new forms.
    property DataBaseName: string read FDataBaseName write FDataBaseName stored False;

    property Active: Boolean read GetActive write SetActive stored False;
    property Align;
    property BevelOuter;
    property BevelInner;
//    property BorderStyle;
    property Ctl3D;
    property Enabled;
    property Font;
    property MasterFields: string read FMasterFields write FMasterFields
      stored True;
    { normally "ID". This is what we use in "where source_id = :ID ..." }
    property MasterSource: TDataSource read GetMasterSource
      write SetMasterSource;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Source: string read FSource write SetSource;
    property Source_ID: Real read GetSource_ID write SetSource_ID;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnEnter;
    property OnExit;
    property OnResize;
    property OnNewRecord: TDataSetNotifyEvent read FOnNewRecord
      write FOnNewRecord;
    property BeforeInsert: TDataSetNotifyEvent read FBeforeInsert
      write FBeforeInsert;
    property BeforeDelete: TDataSetNotifyEvent read FBeforeDelete
      write FBeforeDelete;
    property IQSearch: TIQWebSearch read FIQSearch;
  end;

implementation

{$R *.dfm}

uses
  DateUtils,
  StrUtils,
//  dbtdbexp,
//  DMUtil,
//  EditMemoStr,
//  IQMS.Common.CheckPoint,
  IQMS.Common.Controls,
//  vcl_share,
//  XML,
//  IQDateTimeDlg,
//  iqerrdlg,
//  IQFile,
//  IQMesg,
//  IQMisc,
//  iqprogressdlg,
//  IQRegFrm,
//  IQString,
//  LotusNotes,
  IQMS.Common.Dates,
  IQMS.WebVcl.ResourceStrings,
  IQMS.WebVcl.DocumentsExternal,
  IQMS.Common.DataLib,
  IQMS.Common.NLS;

procedure dbg(s: string);
begin
  // TFrmCheckPointList.add( FileNameNoExt(application.ExeName) + ' '+ s);
end;

function dbg_lines(const ALinesIn: TStringList): string;
//var
//  i: Integer;
//  sl: TStringList;
begin
  Result := '';
  { if not Assigned(ALinesIn) or (ALinesIn.Count = 0) then
    Exit;
    try
    sl := TStringList.Create;
    for i := 0 to ALinesIn.Count - 1 do
    sl.Add(Format('[%d] %s',[i+1, ALinesIn.Strings[i]]));
    Result := sl.Text;
    finally
    FreeAndNil(sl);
    end; }
end;

{ TIQWebEMailCorrespondence }

{$REGION 'Constructor and destructor'}


constructor TIQWebEMailCorrespondence.Create(AComponent: TComponent);
begin
  inherited;
  Height := 160;
  Width := 400;
  Caption := '';
  BevelOuter := bvNone;
  FActive := False;
  FMasterFields := 'ID';
  FMasterID := 0;

  FDUpdateSQL_EMailCorr := TFDUpdateSQL.Create(Self);

  dbg(Format('TIQWebEMailCorrespondence.Create() entry [Owner = %s]',
    [AComponent.Name]));
  { EmailCorrespondence Query and TDataSource }
  FQryEmailCorr := TFDQuery.Create(Self);
  with FQryEmailCorr do
    begin
      Name := 'QryEmailCorr';
      IndexesActive := False;
      IndexFieldNames := 'ID';
      // Connection := db_dm.FDConnection;
      UpdateOptions.AssignedValues := [uvUpdateChngFields, uvUpdateMode,
        uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired,
        uvCheckReadOnly, uvCheckUpdatable];
      UpdateOptions.RefreshMode := rmManual;
      UpdateOptions.CheckRequired := False;
      UpdateOptions.CheckReadOnly := False;
      UpdateOptions.CheckUpdatable := False;
      UpdateOptions.UpdateTableName := 'EMAIL_CORRESPONDENCE';
      UpdateOptions.KeyFields := 'ID';
      UpdateObject := FDUpdateSQL_EMailCorr;
      // CachedUpdates := True;
      OnNewRecord := DoNewRecord;
      // OnUpdateRecord := UpdateEmailCorrespondence;
      // AfterPost := AfterPostEmailCorrespondence;
      // AfterDelete := AfterPostEmailCorrespondence;
      BeforeDelete := BeforeDeleteEmailCorrespondence;
      BeforeInsert := DoBeforeInsert;
    end;

  FSrcEmailCorr := TDataSource.Create(Self);
  with FSrcEmailCorr do
    begin
      DataSet := FQryEmailCorr;
      OnDataChange := EmailCorrDataChange;
    end;

  { Panels }
//  FPnlTop := TPanel.Create(Self);
//  with FPnlTop do
//    begin
//      Parent := Self;
//      name := 'pnlTop';
//      Height := 27;
//      Align := alTop;
//      Caption := '';
//      BevelOuter := bvLowered;
//      BevelInner := bvNone;
//      ParentBackground := False; // 04/09/2009 (Byron)
//      Tag := 1999; // 04/09/2009 (Byron)
//    end;

//  FPnlGrid := TPanel.Create(Self);
//  with FPnlGrid do
//    begin
//      Parent := Self;
//      name := 'pnlGrid';
//      Align := alClient;
//      Caption := '';
//      BevelOuter := bvLowered;
//      BevelInner := bvNone;
//    end;
//
//  { PopUpMenu }
//  FPopUp := TPopUpMenu.Create(Self);
//  with FPopUp do
//    name := 'PopUpMenuEmailCorr';
//
//  FPopUp.Items.Add(TMenuItem.Create(Self));
//  with FPopUp.Items[FPopUp.Items.Count - 1] do
//    begin
//      Caption := IQMS.WebVcl.ResourceStrings.cTXT0000329; { 'View email' }
//      OnClick := LaunchViewEmailClick;
//    end;
//
//  { ViewEmail speedbtn }
//  FSBtnViewEmail := TSpeedButton.Create(Self);
//  with FSBtnViewEmail do
//    begin
//      Parent := FPnlTop;
//      name := 'ViewEmail';
//      Width := 25;
//      Height := 25;
//      Top := 1;
//      Left := 1;
//      Flat := True;
//      Hint := IQMS.WebVcl.ResourceStrings.cTXT0000329; { 'View email' }
//      ShowHint := True;
//      OnClick := LaunchViewEmailClick;
//      Glyph.LoadFromResourceName(HInstance, 'EMAIL1');
//      NumGlyphs := 2;
//    end;

//  FIQSearch := TIQWebSearch.Create(Self);
//  with FIQSearch do
//    begin
//      Parent := FPnlGrid;
//      Align := alClient;
//      name := 'IQSearchEmailCorr';
//      DataSource := FSrcEmailCorr;
////      Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines,
////        dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit,
////        dgProportionalColResize];
//      DBNavVisible := True;
//      // DBNavWidth := 180;
//      OnDblClick := CheckLaunchViewEmailClick;
//      PopupMenu := FPopUp;
//      UseTFields := False;
//      DBNav.VisibleButtons := cnstStandardVisiBtns;
//      DBNav.BeforeAction := DispatchNavButtonClicked;
////      wwDBGrid.OnCalcCellColors := IQSearchEmailCorrespondenceCalcCellColors;
////      wwDBGrid.KeyOptions := [dgAllowDelete];
////      wwDBGrid.MemoAttributes := [mSizeable, mGridShow];
////      wwDBGrid.EditControlOptions :=
////        [ecoSearchOwnerForm, ecoDisableDateTimePicker];
//      DefaultSearchField := 'received_date';
//      OnKeyDown := DoKeyDown;
//    end;

  { DropMaster component }
//  FDMTextTarget := TDMTextTarget.Create(Self);
//  with FDMTextTarget do
//    begin
//      Name := 'dropTextTarget';
//      // AcceptorControl:= self; Assign in Loaded
//      AcceptTextFormats := [dtfCustom];
//      AcceptFiles := True;
//      with CustomFormats do
//        begin
//          OverrideDropEffects[deMove] := deCopy; // Don't allow moves
//          Add(FORMAT_OUTLOOK_ATHENA);
//          Add(FORMAT_OUTLOOK_EXPRESS);
//          Add(FORMAT_FILE_GROUP_DESCRIPTOR);
//          Add(FORMAT_LOTUSNOTES_V7); // For Lotus Notes
//          Add(FORMAT_LOTUSNOTES_V85); // For Lotus Notes
//          // Add(FORMAT_URL); // URLs from Internet Explorer
//          AddObject(FORMAT_FILE_CONTENTS, TObject(TYMED_ISTREAM));
//        end;
//      OnDrop := DoDMTextTargetDrop;
//    end;

  dbg('TIQWebEMailCorrespondence.Create() exit.');

end;

destructor TIQWebEMailCorrespondence.Destroy;
begin
  FIQSearch.WriteGrid;
  inherited Destroy;
end;

{$ENDREGION 'Constructor and destructor'}

{$REGION 'Component events'}


procedure TIQWebEMailCorrespondence.Loaded;
begin
  inherited Loaded;

  if CheckConnected then
    try
      // Set datasets active
      SetTablesActive(Active);
      // Assign the acceptor control.  Note:  This will not work if the
      // owner form is an embedded child form.  The owner form would need
      // to call, RefreshTarget, explicitely.
//      FDMTextTarget.AcceptorControl := Self;
      RefreshTarget;
    except
      if csDesigning in ComponentState then
        Application.HandleException(Self)
      else
        raise;
    end;

  AdjustScreen;
end;

procedure TIQWebEMailCorrespondence.AdjustScreen;
begin
//  if FPnlTop = nil then
//    Exit;
//
//  FPnlTop.Height   := 27;
//
//  FSBtnViewEmail.Left    := 1;
//  FSBtnViewEmail.Height  := 25;
//  FSBtnViewEmail.Width   := 25;
end;

procedure TIQWebEMailCorrespondence.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent is TIQAttachedDocumentsCoordinator)
    and (FAttachedDocumentsCoordinator = AComponent) then
    FAttachedDocumentsCoordinator := nil;
end;

procedure TIQWebEMailCorrespondence.EmailCorrDataChange(Sender: TObject;
  Field: TField);
begin
  if Assigned(FQryEmailCorr) and (FQryEmailCorr.State <> dsInactive) then
    begin
      if Assigned(FAttachedDocumentsCoordinator) then
        FAttachedDocumentsCoordinator.UpdateDocumentsExistsIndicator(Self,
          not (FQryEmailCorr.Bof and FQryEmailCorr.Eof));
    end;

  // 02/04/2011 enable/disable the button
//  FSBtnViewEmail.Enabled := not (FQryEmailCorr.Eof and FQryEmailCorr.Bof) and
//    (FQryEmailCorr.FieldByName('ID').AsFloat > 0);
end;

procedure TIQWebEMailCorrespondence.DoNewRecord(DataSet: TDataSet);
begin
  if Assigned(OnNewRecord) then
    OnNewRecord(DataSet);

  if (Source > '') and (Source_ID > 0) then
    begin
      DataSet.FieldByName('source').AsString := Source;
      DataSet.FieldByName('source_id').AsFloat := Source_ID;
      DataSet.FieldByName('id').AsFloat := GetNextID('email_correspondence');
    end;
end;

procedure TIQWebEMailCorrespondence.DoBeforeInsert(DataSet: TDataSet);
begin
  if Assigned(FBeforeInsert) then
    FBeforeInsert(DataSet);
end;

procedure TIQWebEMailCorrespondence.BeforeDeleteEmailCorrespondence
  (DataSet: TDataSet);
begin
  FEmailCorrespondence_ID := FQryEmailCorr.FieldByName('id').AsFloat;

  if Assigned(FBeforeDelete) then
    FBeforeDelete(DataSet);
end;

procedure TIQWebEMailCorrespondence.DoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var
//  AFileList: TStringList;
//  AHandleData: AnsiString;
//  i: Integer;
//  AFileName: string;
//  hPrg: TProgressDialog; // in isprogressdlg.pas
begin
  // Initialize
//  hPrg := nil;
//  // Paste an email file
//  if (ssCtrl in Shift) and (Key = Ord('V')) and
//    (FIQSearch.wwDBGrid.GetActiveField <> FQryEmailCorr.FieldByName('COMMENT1'))
//  then
//    begin
//      Key := 0;
//      ClipBoard.Open;
//      try
//        AHandleData := GetHandleDataToString(ClipBoard.GetAsHandle(CF_HDROP));
//        AFileList := FileListFromHDROP(AHandleData);
//        try
//          // Now we have the file list.  We could paste these, or make shortcuts.
//          // Here we just put the names into a listbox.
//          if Assigned(AFileList) and (AFileList.Count > 0) then
//            try
//              Key := 0;
//              // Create the progress dialog
//              if AFileList.Count > 3 then
//                begin
//                  // IQMS.WebVcl.ResourceStrings.cTXT0000391 = 'Adding files to Email Correspondence ...';
//                  hPrg := hProgressDlg(Self, AFileList.Count,
//                    IQMS.WebVcl.ResourceStrings.cTXT0000391);
//                  Application.ProcessMessages;
//                end;
//              for i := 0 to AFileList.Count - 1 do
//                begin
//                  // If progress is displayed, check if the user clicked the
//                  // Cancel button.
//                  if Assigned(hPrg) and hPrg.CheckProgressAborted then
//                    Break;
//                  AFileName := AFileList[i];
//                  if FileExists(AFileName) and
//                    (CompareText(ExtractFileExt(AFileName), '.msg') = 0) then
//                    Outlook_ProcessMsgFile(AFileName);
//                  // Step the progress bar
//                  if Assigned(hPrg) then
//                    begin
//                      hPrg.Position := i + 1;
//                      Application.ProcessMessages;
//                    end;
//                end;
//              // Final display value
//              if Assigned(hPrg) then
//                begin
//                  hPrg.Position := hPrg.MaxProgress;
//                  Application.ProcessMessages;
//                end;
//            finally
//              if Assigned(hPrg) then
//                FreeAndNil(hPrg);
//            end;
//        finally
//          if Assigned(AFileList) then
//            AFileList.Free;
//        end;
//      finally
//        ClipBoard.Close;
//      end;
//    end;
end;

procedure TIQWebEMailCorrespondence.DoDMTextTargetDrop(Sender: TObject;
  Acceptor: TWinControl; const DropText: string; X, Y: Integer);
begin
//  dbg('DoDMTextTargetDrop() method entry.');
//
//  // 08/03/2010 Check security.  If this is read-only, exit.
//  // Note:  Do not call System.SysUtils.Abort, since that will generate
//  // an drag-drop error.  (Byron).
//  if IsReadOnly then
//    Exit;
//
//  // 08/03/2010 Save master dataset changes before posting record.
//  // Changed by Byron.
//  // Requested by Susan.
//  // E-Mail Subject:  RE: Gages/Devices - automatically save Calibration upon entry PRD - CRM # 448486
//  // E-Mail Date: 07/20/2010 1:04 PM
//  if Assigned(MasterSource) and Assigned(MasterSource.DataSet) and
//    (MasterSource.DataSet.State in [dsEdit, dsInsert]) then
//    MasterSource.DataSet.Post;
//
//  try
//    { Handle a drop of one or more e-mail Winapi.Messages }
//    if FDMTextTarget.DataObjectHasFormat(FORMAT_OUTLOOK_ATHENA) or
//      FDMTextTarget.DataObjectHasFormat(FORMAT_OUTLOOK_EXPRESS) then
//      begin
//        dbg('DoDMTextTargetDrop(), DoProcessOutlookExpress.');
//        DoProcessOutlookExpress;
//      end
//
//    else if FDMTextTarget.DataObjectHasFormat(FORMAT_FILE_GROUP_DESCRIPTOR) then
//      begin
//        dbg('DoDMTextTargetDrop(), DataObjectHasFormat(FORMAT_FILE_GROUP_DESCRIPTOR).');
//        { Global override for tymed - reset automatically by calls to DataObjectHasFormat and DataObjectGetFormat }
//        DataObjectTymed := TYMED_ISTREAM;
//        { Do we have FileContents?  Do the call first, so we're guaranteed that it won't be short-circuited, so that the global tymed and lindex get reset properly. }
//        if FDMTextTarget.DataObjectHasFormat(FORMAT_FILE_CONTENTS) then
//          DoProcessOutlook;
//      end
//
//    else if FDMTextTarget.DataObjectHasFormat(FORMAT_LOTUSNOTES_V7) or
//      FDMTextTarget.DataObjectHasFormat(FORMAT_LOTUSNOTES_V85) then
//      begin
//        dbg('DoDMTextTargetDrop(), DataObjectHasFormat(sLotusNotesMessage_vX).');
//        { Global override for tymed - reset automatically by calls to DataObjectHasFormat and DataObjectGetFormat }
//        DataObjectTymed := TYMED_ISTREAM;
//        { Do we have FileContents?  Do the call first, so we're guaranteed that it won't be short-circuited, so that the global tymed and lindex get reset properly. }
//        if FDMTextTarget.DataObjectHasFormat(FORMAT_LOTUSNOTES_LINK_SOURCE) or
//          FDMTextTarget.DataObjectHasFormat(FORMAT_LOTUSNOTES_XML_DATA) then
//          DoProcessLotusNotes;
//      end
//
//    else if FDMTextTarget.DataObjectHasFormat(FORMAT_FILENAME) then
//      begin
//        // A file was dragged
//        // DataObjectTymed := TYMED_ISTREAM;
//        DoProcessFile;
//      end;
//
//    dbg('DoDMTextTargetDrop() method exit.');
//
//  except
//    on E: Exception do
//      begin
//        IQError(E.Message);
//        System.SysUtils.Abort;
//      end;
//  end
end;

procedure TIQWebEMailCorrespondence.LaunchViewEmailClick(Sender: TObject);
begin
  with FQryEmailCorr do
    if not (Bof and Eof) then
      LaunchEmailFromBlob(FieldByName('ID').AsLargeInt,
        FieldByName('KIND').AsInteger);
end;

procedure TIQWebEMailCorrespondence.CheckLaunchViewEmailClick(Sender: TObject);
begin
//  with FIQSearch.wwDBGrid, FQryEmailCorr do
//    if not (Bof and Eof) then
//      begin
//        if (GetActiveField <> FieldByName('COMMENT1')) then
//          LaunchEmailFromBlob(FieldByName('ID').AsLargeInt,
//            FieldByName('KIND').AsInteger);
//      end
//    else
//      System.SysUtils.Abort;
end;


procedure TIQWebEMailCorrespondence.DispatchNavButtonClicked(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
  // IQMS.WebVcl.ResourceStrings.cTXT0000504 = 'Delete Email Correspondence record?';
  IQCheckDelete(Sender, Button, IQMS.WebVcl.ResourceStrings.cTXT0000504);
end;

procedure TIQWebEMailCorrespondence.IQSearchEmailCorrespondenceCalcCellColors
  (Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean;
  AFont: TFont; ABrush: TBrush);
begin
  if Highlight then
    Exit;

  if Field <> FQryEmailCorr.FieldByName('comment1') then
    ABrush.Color := $00DEDEDE; // clBtnFace;
end;

{$ENDREGION 'Component events'}

{$REGION 'Public methods'}


procedure TIQWebEMailCorrespondence.RefreshTarget;
//var
//  AControl: TWinControl;
begin
  // 05/05/2009 This method added (Byron).  We need a way to refresh
  // the drop target particularly if this component is on
  // an embedded, child form.  If the owner form is embedded,
  // then the handle gets lost.

//  dbg('RefreshTarget method entry.');
//  // Check component
//  if not Assigned(FDMTextTarget) then
//    Exit;
//  // Re-assign acceptor control
//  AControl := FDMTextTarget.AcceptorControl;
//  FDMTextTarget.AcceptorControl := nil;
//  FDMTextTarget.AcceptorControl := AControl;
//  dbg('RefreshTarget method exit.');
end;

procedure TIQWebEMailCorrespondence.Refresh;
begin
  RefreshDataSetByID(FQryEmailCorr);
end;

function TIQWebEMailCorrespondence.HasDocuments: Boolean;
begin
  Result := not (FQryEmailCorr.Bof and FQryEmailCorr.Eof);
end;

{$ENDREGION 'Public methods'}

{$REGION 'Dataset methods'}


procedure TIQWebEMailCorrespondence.AssignQuery;
var
  AParamName: string;
  AField: TField;
begin
  AParamName := MasterFields;
  if AParamName = '' then
    AParamName := 'ID';
  AField := GetMasterField;

//  if (FQryEmailCorr.Connection = nil) and
//    Assigned(db_dm.DB_DataModule) and
//    (db_dm.FDConnection <> nil) then
//    FQryEmailCorr.Connection := db_dm.FDConnection;

  with FQryEmailCorr do
    begin
      Close;
      while FieldCount > 0 do
        Fields[0].Free;

      SQL.Clear;
      SQL.Add('SELECT id,                  ');
      SQL.Add('       source,              ');
      SQL.Add('       source_id,           ');
      SQL.Add('       received_date,       ');
      SQL.Add('       received_from,       ');
      SQL.Add('       subject,             ');
      SQL.Add('       comment1,            ');
      SQL.Add('       kind,                ');
      SQL.Add('       mesg_blob,           ');
      SQL.Add('       body_text            ');
      SQL.Add('  FROM email_correspondence ');

      SQL.Add(Format(' WHERE source = ''%s''      ', [Source]));
      { Ex: "source_id = :ID" }
      SQL.Add(Format('   AND source_id = :%s', [AParamName]));

      if Assigned(AField) then
        ParamByName(AParamName).DataType := AField.DataType
      else
        ParamByName(AParamName).DataType := ftBCD;

      { FieldDefs }
      CreateTFields;
    end; { with FDocsLink }

  FDUpdateSQL_EMailCorr.Connection := FQryEmailCorr.Connection;
  with FDUpdateSQL_EMailCorr do
    begin
      // Insert SQL
      InsertSQL.Clear;
      InsertSQL.Add('INSERT INTO email_correspondence(id,');
      InsertSQL.Add('                                 source,');
      InsertSQL.Add('                                 source_id,');
      InsertSQL.Add('                                 received_date,');
      InsertSQL.Add('                                 received_from,');
      InsertSQL.Add('                                 subject,');
      InsertSQL.Add('                                 comment1,');
      InsertSQL.Add('                                 mesg_blob,');
      InsertSQL.Add('                                 kind,');
      InsertSQL.Add('                                 body_text)');
      InsertSQL.Add('    VALUES (:NEW_ID,');
      InsertSQL.Add('            :NEW_SOURCE,');
      InsertSQL.Add('            :NEW_SOURCE_ID,');
      InsertSQL.Add('            :NEW_RECEIVED_DATE,');
      InsertSQL.Add('            :NEW_RECEIVED_FROM,');
      InsertSQL.Add('            :NEW_SUBJECT,');
      InsertSQL.Add('            :NEW_COMMENT1,');
      InsertSQL.Add('            :NEW_MESG_BLOB,');
      InsertSQL.Add('            :NEW_KIND,');
      InsertSQL.Add('            :NEW_BODY_TEXT)');

      // Modify SQL
      ModifySQL.Clear;
      ModifySQL.Add('UPDATE email_correspondence');
      ModifySQL.Add('   SET source = :NEW_SOURCE,');
      ModifySQL.Add('       source_id = :NEW_SOURCE_ID,');
      ModifySQL.Add('       received_date = :NEW_RECEIVED_DATE,');
      ModifySQL.Add('       received_from = :NEW_RECEIVED_FROM,');
      ModifySQL.Add('       subject = :NEW_SUBJECT,');
      ModifySQL.Add('       comment1 = :NEW_COMMENT1,');
      ModifySQL.Add('       mesg_blob = :NEW_MESG_BLOB,');
      ModifySQL.Add('       kind = :NEW_KIND,');
      ModifySQL.Add('       body_text = :NEW_BODY_TEXT');
      ModifySQL.Add(' WHERE id = :OLD_ID');

      // Delete SQL
      DeleteSQL.Clear;
      DeleteSQL.Add('DELETE FROM email_correspondence');
      DeleteSQL.Add('      WHERE id = :OLD_ID');

      // Fetch Row SQL
      FetchRowSQL.Clear;
      FetchRowSQL.Add('SELECT id,');
      FetchRowSQL.Add('       source,');
      FetchRowSQL.Add('       source_id,');
      FetchRowSQL.Add('       received_date,');
      FetchRowSQL.Add('       received_from,');
      FetchRowSQL.Add('       subject,');
      FetchRowSQL.Add('       comment1,');
      FetchRowSQL.Add('       mesg_blob,');
      FetchRowSQL.Add('       kind,');
      FetchRowSQL.Add('       body_text,');
      FetchRowSQL.Add('       attachment_count');
      FetchRowSQL.Add('  FROM email_correspondence');
      FetchRowSQL.Add(' WHERE id = :ID');
    end;

end;

procedure TIQWebEMailCorrespondence.CreateTFields;
var
  i: Integer;

  procedure assign_field_properties(AFieldName, ADisplayLabel: string;
    AVisible, AReadOnly: Boolean; ARequired: Boolean = False);
  var
    AField: TField;
  begin
    AField := FQryEmailCorr.FindField(AFieldName);
    if AField <> nil then
      begin
        AField.DisplayLabel := ADisplayLabel;
        AField.Visible := AVisible;
        if not (AField.DataType in [ftBlob, ftGraphic, ftParadoxOle, ftDBaseOle,
          ftOraBlob, ftOraClob]) then
          AField.Origin := AFieldName
        else
          AField.Origin := '';
        AField.ReadOnly := AReadOnly;
        AField.Required := ARequired;
      end;
  end;

begin
  FQryEmailCorr.FieldDefs.Update;

  { Physical fields }
  for i := 0 to FQryEmailCorr.FieldDefs.Count - 1 do
    FQryEmailCorr.FieldDefs[i].CreateField(FQryEmailCorr);

  assign_field_properties('id', 'id', False, False);
  assign_field_properties('source', 'source', False, False);
  assign_field_properties('source_id', 'source_id', False, False);
  assign_field_properties('received_date', 'Received', True, True);
  assign_field_properties('received_from', 'From', True, True);
  assign_field_properties('subject', 'Subject', True, True);
  assign_field_properties('comment1', 'Comment', True, False);
  assign_field_properties('kind', 'kind', False, False);
  assign_field_properties('mesg_blob', 'mesg_blob', False, False);
  assign_field_properties('body_text', 'body_text', False, False);

  AssignColumns;
end;

procedure TIQWebEMailCorrespondence.AssignColumns;
begin
//  with FIQSearch.wwDBGrid do
//    begin
//      Selected.Clear;
//      Selected.Add('received_date'#9'20'#9'Received'#9#9);
//      Selected.Add('received_from'#9'20'#9'From'#9#9);
//      Selected.Add('subject'#9'50'#9'Subject'#9#9);
//      Selected.Add('comment1'#9'30'#9'Comment'#9#9);
//      ApplySelected;
//    end;
end;

procedure TIQWebEMailCorrespondence.SetTablesActive(AValue: Boolean);
var
  ACursor: Integer;
begin
  // 05/05/2009 Check connection before setting active (Byron)
  if not CheckConnected then
    Exit;

  if (Source > '') then
    try
      try
        ACursor := Screen.Cursors[crSQLWait];
        Screen.Cursors[crSQLWait] := Screen.Cursors[crArrow];
        AssignQuery; { assign query, fields, columns }
        if AValue then
          begin
            FQryEmailCorr.Open;
            FIQSearch.ReadGrid;
          end
        else if FQryEmailCorr.Active then
          begin
            FIQSearch.WriteGrid;
            FQryEmailCorr.Close;
          end;
      finally
        Screen.Cursor := crArrow;
        Screen.Cursors[crSQLWait] := ACursor;
      end;
    except
      ShowMessage(Exception(ExceptObject).Message + #13 +
        FQryEmailCorr.SQL.Text);
      FQryEmailCorr.Active := False;
    end;
end;

function TIQWebEMailCorrespondence.CheckConnected: Boolean;
begin
  Result := False;

  // 10/25/2013 Added ComponentState check (Byron)
//  Result := not (csLoading in ComponentState) and
//    Assigned(db_dm.DB_DataModule) and
//    (db_dm.DB_DataModule.FDConnection1 <> nil) and
//    db_dm.FDConnection.Connected and
//    Assigned(FQryEmailCorr) and
//    Assigned(FQryEmailCorr.DataSource) and
//    Assigned(FQryEmailCorr.DataSource.DataSet) and
//    iqmisc.EnsureConnectionExists;
end;

{$ENDREGION 'Dataset methods'}

{$REGION 'Property methods'}


function TIQWebEMailCorrespondence.GetMasterSource: TDataSource;
begin
  Result := FQryEmailCorr.DataSource;
end;

procedure TIQWebEMailCorrespondence.SetMasterSource(AValue: TDataSource);
begin
  FQryEmailCorr.DataSource := AValue;
  // Assign the acceptor control.  Note:  This will not work if the
  // owner form is an embedded child form.  The owner form would need
  // to call, RefreshTarget, explicitely.
//  FDMTextTarget.AcceptorControl := Self;
  RefreshTarget;
end;

procedure TIQWebEMailCorrespondence.SetSource(const Value: string);
begin
  FSource := Trim(UpperCase(Value));
end;

function TIQWebEMailCorrespondence.GetActive: Boolean;
begin
  Result := FActive;
end;

procedure TIQWebEMailCorrespondence.SetActive(AValue: Boolean);
begin
  // 05/05/2009 Do not set active if not connected (Byron)
  if not CheckConnected then
    Exit;

  // 09/27/2013 If requested Active = True, and the dataset is
  // already active, then exit early.  It is unnecessary to
  // refresh.
  if AValue = FQryEmailCorr.Active then
    Exit;

  SetTablesActive(AValue);
  if (csLoading in ComponentState) then
    FActive := AValue
  else
    FActive := FQryEmailCorr.Active;

  // 05/05/2009 After refreshing data, also ensure the drop target is
  // correct.  This eliminates the need for the calling form to check
  // this, and reduces it to a single step.  We do not check FActive
  // in case the control was Active at design-time.
  RefreshTarget;
end;

function TIQWebEMailCorrespondence.GetSource_ID: Real;
begin
  if Assigned(MasterSource) and Assigned(MasterSource.DataSet) and
    (MasterFields <> '') then
    Result := MasterSource.DataSet.FieldByName(MasterFields).AsFloat
  else
    Result := FMasterID;
end;

procedure TIQWebEMailCorrespondence.SetSource_ID(const Value: Real);
begin
  // 01/06/2010 This method added so that the source/source_id could be
  // set manually without connecting a datasource to this component.
  // The calling form can set all properties except MasterSource, and
  // then set the Source_ID in an event (such as TDataChangeEvent).
  // This is required when working with DBExpress source datasets.

  // If the master source is assigned, then assume we have a datasource
  // connected; we don't need to set the source ID value, since it comes
  // from the datasource.
  if Assigned(MasterSource) and Assigned(MasterSource.DataSet) and
    (MasterFields > '') then
    Exit;

  // Set the private variable which will be referenced in GetSource_ID.
  FMasterID := Value;

  // Apply the value to the dataset parameter, and then refresh the data.
  if (FQryEmailCorr.Params.FindParam(MasterFields) <> nil) then
    begin
      FQryEmailCorr.ParamByName(MasterFields).Value := Trunc(Value);
      Refresh;
    end;
end;

procedure TIQWebEMailCorrespondence.SetIsReadOnly(const Value: Boolean);
var
  ACurVal: Boolean;
begin
  // 08/03/2010 IsReadOnly property added (Byron).
  ACurVal := FReadOnly;

  if ACurVal <> Value then
    begin
      FReadOnly := Value;
      FQryEmailCorr.UpdateOptions.ReadOnly := Value;
    end;

  if not Value then
    FIQSearch.DBNav.VisibleButtons := cnstStandardVisiBtns
  else
    FIQSearch.DBNav.VisibleButtons := cnstReadOnlyVisiBtns;

//  IQMS.Common.Controls.AutoSizeNavBar(FIQSearch.DBNav);

end;

function TIQWebEMailCorrespondence.GetMasterField: TField;
begin
  if Assigned(MasterSource) and
    Assigned(MasterSource.DataSet) and
    (MasterFields > '') then
    Result := MasterSource.DataSet.FindField(MasterFields);
end;

{$ENDREGION 'Property methods'}

{$REGION 'Helper methods (parsing, etc.)'}


function TIQWebEMailCorrespondence.KindToEmailFileExt(AKind: Real): string;
begin
  if AKind = CLIENT_KIND_OUTLOOK_EXPRESS then
    Result := '.eml'
  else
    Result := '.msg';
end;

procedure TIQWebEMailCorrespondence.LaunchEmailFromBlob(AID: Real; AKind: Real);
var
  ATempMsgFileName: string;
  AQuery: TFDQuery;
  AMemoryStream: TMemoryStream;
//  URL: string;
begin
  if (Trunc(AID) = 0) then
    System.SysUtils.Abort;

  dbg('LaunchEmailFromBlob method entry');
  { For Lotus Notes, get the URL from the Body Text }
  if AKind = CLIENT_KIND_LOTUSNOTES then
    begin
      dbg('LaunchEmailFromBlob, AKind = CLIENT_KIND_LOTUSNOTES');
      ATempMsgFileName := FQryEmailCorr.FieldByName('BODY_TEXT').AsString;
    end
  else
    // Extract Blob to file
    begin
      dbg('LaunchEmailFromBlob, AMemoryStream:= TMemoryStream.Create');
      AMemoryStream := TMemoryStream.Create;
      try
        // Create and configure the SQL Connection for multiple transactions.
        // Create and configure the query
        AQuery := TFDQuery.Create(nil);
        try
//          AQuery.Connection := db_dm.FDConnection;
          AQuery.SQL.Add('SELECT mesg_blob');
          AQuery.SQL.Add('  FROM email_correspondence');
          AQuery.SQL.Add(' WHERE id = :ID');
          AQuery.Params.ParamByName('ID').Value := Trunc(AID);
          AQuery.Open;

          { unique temp file name }
          dbg('LaunchEmailFromBlob, AssignTempFileName()');
          AssignTempFileName(ATempMsgFileName, KindToEmailFileExt(AKind));
          { Save contents to the temp file name }
          dbg('LaunchEmailFromBlob, SaveToFile()');
          TBlobField(AQuery.FieldByName('MESG_BLOB'))
            .SaveToFile(ATempMsgFileName);
        finally
          FreeAndNil(AQuery);
        end;
      finally
        FreeAndNil(AMemoryStream);
      end;
    end;

  { launch email }
  // 04/09/2009 Remmed by Byron.  IQShellExecute() does not work with Lotus
  // Notes URL's.  Changed call to iqmisc.ExecuteProgram() which
  // works with all e-mail clients.
  // IQShellExecute( ATempMsgFileName );  {IQMS.WebVcl.DocumentsExternal.pas}
//  dbg('LaunchEmailFromBlob, ExecuteProgram()');
//  IQMisc.ExecuteProgram(ATempMsgFileName);
//
//  dbg('LaunchEmailFromBlob, Application.ProcessMessages');
//  Application.ProcessMessages;
//
//  dbg('LaunchEmailFromBlob, DeleteFilesOlderThan()');
//  DeleteFilesOlderThan(IncludeTrailingPathDelimiter(IQGetLocalHomePath) +
//    'Temp\*.*', 1); { iqfile.pas }
//  dbg('LaunchEmailFromBlob method exit.');
end;

procedure TIQWebEMailCorrespondence.AssignTempFileName(var AFileName: string;
  AExt: string { extension includes the dot } );
//var
//  AFolder: string;
begin
//  dbg('AssignTempFileName method entry.');
//  AFolder := IncludeTrailingPathDelimiter(IQGetLocalHomePath) + 'Temp';
//  IQAssert(ForceDirectories(AFolder),
//    Format('Unable to create temp directory %s', [AFolder]));
//  AFileName := IncludeTrailingPathDelimiter(AFolder) +
//    ChangeFileExt(GetRandomName, AExt);
//  dbg(Format('AssignTempFileName, AFileName := %s', [AFileName]));
//  dbg('AssignTempFileName method exit.');
end;

function TIQWebEMailCorrespondence.StripTagsFrom(const AString: string): string;

  function _StripEnclosedBy(const bString: string; const ATag: string): string;
  // Strip all material enclosed by (and including) <Tag>...</Tag>
  var
    AOpenPos, AClosePos: Integer;
    ATagUpper: string;
  begin
    Result := bString;
    ATagUpper := UpperCase(ATag);
    // First, remove <Tag></Tag> tags  and everything between
    AOpenPos := AnsiPos('<' + ATagUpper, UpperCase(Result));
    while (AOpenPos <> 0) do
      begin
        AClosePos := AnsiPos('</' + ATagUpper, UpperCase(Result));
        if (AClosePos <> 0) then
          System.Delete(Result, AOpenPos, AClosePos - AOpenPos +
            Length(ATagUpper) + 3)
          // Delete the </Tag>
        else
          System.Delete(Result, AOpenPos, Length(Result) - AOpenPos + 1);
        // Malformed (no </Tag>)
        AOpenPos := AnsiPos('<' + ATagUpper + '>', UpperCase(Result));
      end; // while
  end;

var
  J, k: Integer;
  inTag, onlySpaces: Boolean;
  s: string;
begin
  dbg('StripTagsFrom() method entry.');
  Result := '';
  s := AString;

  // Kill everything enclosed in either <script></script> or <head></head>
  s := _StripEnclosedBy(s, 'script');
  s := _StripEnclosedBy(s, 'head');

  // Then, remove all other tags, LEAVING enclosed material
  inTag := False;
  for J := 1 to Length(s) do // Iterate
    begin
      // Figure out if we're inside a HTML tag
      if (s[J] = '<') then
        inTag := True;
      if inTag and (s[J] = '>') then
        begin
          inTag := False;
          // Tag is ended.  Skip to next iteration so we don't pick up '>'
          Continue;
        end;

      // If not in a tag, we do a straight copy
      if not inTag then
        Result := Result + s[J];
    end; // for

  // Finally, remove all multiple cr/lf combinations, i.e.
  // all lines that either a) are empty or b) contain only spaces
  with TStringList.Create do
    try
      Text := Result; // Shove our string into the list
      for J := Count downto 1 do // Iterate
        begin
          // Delete any empty ones
          if (Strings[J - 1] = '') then
            Delete(J - 1)
          else
            begin
              // Look for lines that have only spaces
              onlySpaces := True;
              for k := 1 to Length(Strings[J - 1]) do // Iterate
                begin
                  onlySpaces := onlySpaces and (Strings[J - 1][k] = ' ');
                  // Don't finish the loop if we found a non-space!
                  if not onlySpaces then
                    Break;
                end; // for
              if onlySpaces then
                Delete(J - 1);
            end;
        end; // for
      // Put the list back onto the string.
      Result := Text;
    finally
      Free; // the string list
    end; // with

  dbg('StripTagsFrom() method exit.');

end;

function TIQWebEMailCorrespondence.GetReceivedDate(ADateStr: string; AKind: Real)
  : TDateTime;
var
  AErrorMsg: string;
  AVerifyDateWithPrompt: Boolean;

  function _GetLeadingDayInStr(ADateStr: string;
    var ADate: TDateTime): string;
  var
    i: Integer;
    s: string;
  begin
    for i := 1 to 7 do
      begin
        s := Trim(Copy(ADateStr, 1, Length(FormatDateTime('ddd', ADate))));

        if CompareText(FormatDateTime('ddd', ADate), s) = 0 then
          begin
            Result := FormatDateTime('ddd', ADate);
            Exit;
          end;
        ADate := ADate - 1;
      end;
    Result := '';
  end;

  function _RemoveLeadingDay(ADateString: string; var ADay: string): string;
  var
    ADayName, ASystemDay: string;
    i: Integer;
  begin
    Result := Trim(ADateString);
    ADayName := Trim(UpperCase(Copy(ADateString, 1, 3)));
    if (Length(ADayName) = 0) then
      Exit;

    for i := 1 to 7 do
      begin
        ASystemDay := FormatSettings.ShortDayNames[i];
        if (UpperCase(ASystemDay) = ADayName) then
          begin
            ADay := ASystemDay;
            Result := Trim(Copy(ADateString, 4, Length(ADateString) - 3));
            Break;
          end;
      end;
  end;

{ Outlook }
  function _ProcessOutlookDate: TDateTime;
  var
    // s: string;
    ADateValue, ATempDate: TDateTime;
    ASuccess: Boolean;
    ADateSeparator: string;
    ATimeSeparator: string;
    ADayAbbr: string;
    ADateString: string;
    AHasDayStr: Boolean;
    ADateType: Byte;
    ADoW: Integer;
  begin
    { Outlook sends date in the following formats:
      A) Today                                      :     5:17am
      B) Yesterday                                  : Sun 6:28pm
      C) From 2 or more days ago including last week: Fri 9/8
      D) Two weeks ago and more                     : 8/28/2006
      E) 2002 Outlook                               : Fri 10/13/2006 3:02 PM
    }

    // Initialize variables
    ADateValue := Now();
    AVerifyDateWithPrompt := False;
    ASuccess := False;
    // Get cultural information
    ADateSeparator := FormatSettings.DateSeparator;
    ATimeSeparator := FormatSettings.TimeSeparator;

    // 05/23/2012 As a first attempt, try to convert it right away.
    // If we can't convert it, then we have options.
    IQMS.Common.Dates.IQTryStrToDateTime(ADateStr, Result);
    if Result > 1 then
      Exit
    else
      Result := IQMS.Common.Dates.MinValue;

    // Fix up the date string
    ADateString := _RemoveLeadingDay(ADateStr, { var } ADayAbbr);
    AHasDayStr := Length(ADayAbbr) > 0;

    // Determine what kind of date we are dealing with
    ADateType := 0;

    if ((Pos(ADateSeparator, ADateString) = 0) and
      (Pos(ATimeSeparator, ADateString) > 0) and not AHasDayStr) then
      ADateType := 1 // DayType.Today;
    else if ((Pos(ADateSeparator, ADateString) = 0) and
      (Pos(ATimeSeparator, ADateString) > 0) and AHasDayStr) then
      ADateType := 2 // DayType.Yesterday;
    else if ((Pos(ADateSeparator, ADateString) > 0) and
      (Pos(ATimeSeparator, ADateString) = 0) and AHasDayStr) then
      ADateType := 3 // DayType.SeveralDays;
    else if ((Pos(ADateSeparator, ADateString) > 0) and
      (Pos(ATimeSeparator, ADateString) = 0) and not AHasDayStr) then
      ADateType := 4 // DayType.SeveralWeeks;
    else if ((Pos(ADateSeparator, ADateString) > 0) and
      (Pos(ATimeSeparator, ADateString) > 0) and AHasDayStr) then
      ADateType := 5; // DayType.Complete;

    case (ADateType) of
      0:
        AVerifyDateWithPrompt := True;
      // Today:
      1:
        begin
          ADateValue := Now();
          ASuccess := System.SysUtils.TryStrToDateTime(ADateString,
            { out } ATempDate);
          if ASuccess then
            System.SysUtils.ReplaceTime(ADateValue, ATempDate);
        end;
      // Yesterday:
      2:
        begin
          ADateValue := Now();
          ASuccess := System.SysUtils.TryStrToDateTime(ADateString,
            { out } ATempDate);
          if ASuccess then
            System.SysUtils.ReplaceTime(ADateValue, ATempDate);
          ADateValue := ADateValue - 1; // subtract 1 day
        end;
      // Several Days
      3:
        begin
          if (GetDayOfWeek(ADayAbbr, { var } ADoW)) and
            (IQMS.Common.Dates.PriorDayOfWeek(ADoW, ADateValue)) then
            ASuccess := System.SysUtils.TryStrToDateTime(ADateString,
              ADateValue)
          else
            ASuccess := System.SysUtils.TryStrToDateTime(ADateString,
              ADateValue);
          AVerifyDateWithPrompt := True;
        end;
      // Several Weeks
      4:
        ASuccess := System.SysUtils.TryStrToDateTime(ADateString,
          { out } ADateValue);
      // Complete Date
      5:
        ASuccess := System.SysUtils.TryStrToDateTime(ADateString,
          { out } ADateValue);
    else
      begin
        ASuccess := System.SysUtils.TryStrToDateTime(ADateString,
          { out } ADateValue);
        if (not ASuccess) then
          ADateValue := Now();
        AVerifyDateWithPrompt := True;
      end;
    end;

    if not AVerifyDateWithPrompt then
      AVerifyDateWithPrompt := System.DateUtils.TimeOf(ADateValue) = 0;

    AVerifyDateWithPrompt := AVerifyDateWithPrompt or not ASuccess;
    Result := ADateValue;
  end;

{ Outlook Express }
  function _ProcessOutlookExpressDate: TDateTime;
  var
    ADate: TDateTime;
    i: Integer;
    ADay, AMonth, AYear: Word;
    AText, ATime: string;
  begin
    { Outlook sends received date in the following formats: Mon, 11 Sep 2006 13:44:23-0400 }
    ADate := Date;
    AText := _GetLeadingDayInStr(ADateStr, ADate);
    { convert "Mon, 11 Sep 2006 13:44:23-0400" to "11 Sep 2006 13:44:23-0400" }
    if AText > '' then
      ADateStr := Trim(Copy(ADateStr, Length(AText) + 2, 255));
    // note "2" to get rid of ","

    AText := ADateStr;

    { ADay }
    i := Pos(' ', AText);
    ADay := StrToInt(Copy(AText, 1, i - 1));
    AText := Copy(AText, i + 1, 255);

    { AMonth }
    i := Pos(' ', AText);
    AMonth := IQMonthStrToMonth(Copy(AText, 1, i - 1));
    AText := Copy(AText, i + 1, 255);

    { AYear }
    i := Pos(' ', AText);
    AYear := StrToInt(Copy(AText, 1, i - 1));
    AText := Copy(AText, i + 1, 255);

    { time }
    ATime := Copy(AText, 1, 8);

    Result := EncodeDate(AYear, AMonth, ADay) + StrToTime(ATime);
  end;

  function _ProcessLotusNotesDate: TDateTime;
  var
    ADateTime: TDateTime;
  begin
    ADateTime := Date();
    if (ADateStr > '') then
      try
        ADateTime := StrToDate(ADateStr);
      except
        // 2016.07.19: the code below does nothing, the value is replaced by the last line in the method
        // Result := 0; // this will force user to select a date
      end
    else
      AVerifyDateWithPrompt := True;
    Result := ADateTime;
  end;

  function _PromptForDate(const ADefaultDate: TDateTime): TDateTime;
  begin
    Result := ADefaultDate;
    if Trunc(Result) = 0 then
      Result := Date();
//    repeat
//      try
//        if IQDateTimeDlg.DoDateTimeDialog(TForm(Self.Owner), Result,
//          'Received Date') then
//          Break
//        else
//          begin
//            Result := Date();
//            Break;
//          end
//      except
//        IQError('Invalid date specified.');
//      end;
//    until False;
  end;

begin
  dbg('GetReceivedDate() method entry.');

  // Initialize variable
  AVerifyDateWithPrompt := False;

  try
    if AKind = CLIENT_KIND_OUTLOOK then
      Result := _ProcessOutlookDate

    else if AKind = CLIENT_KIND_OUTLOOK_EXPRESS then
      Result := _ProcessOutlookExpressDate

      // 04/09/2009 Added support for Lotus Notes
    else if AKind = CLIENT_KIND_LOTUSNOTES then
      Result := _ProcessLotusNotesDate

    else
      Result := 0;

    if Result = 0 then
      System.SysUtils.Abort;

    // 01/04/2010 If we need to verify the date because the year or some other
    // element was missing, then do so here.
    if AVerifyDateWithPrompt then
      Result := _PromptForDate(Result);

  except
    on E: Exception do
      begin
        // IQMS.WebVcl.ResourceStrings.cTXT0000503 =
        // 'Unable to extract ''Received'' date from ''%s''';
        AErrorMsg := Format(IQMS.WebVcl.ResourceStrings.cTXT0000503,
          [ADateStr]);
        if not (E is EAbort) then
          AErrorMsg := AErrorMsg + #13#13 + E.Message;
//        IQWarning(AErrorMsg);
        Result := _PromptForDate(Date());
      end;
  end;
  dbg('GetReceivedDate() method exit.');
end;

{$ENDREGION 'Helper methods (parsing, etc.)'}

{$REGION 'Outlook'}


function TIQWebEMailCorrespondence.Outlook_ReadStorageProperty(AStorage: IStorage;
  AProperty: PWideChar): string;
const
  c_buffer_size = 30000; // size of chunk to read each time
var
  AIStream: IStream;
{$IFDEF DELPHI_10_UP}
  ALargeInt: UInt64;
{$ELSE}
  ALargeInt: Int64;
{$ENDIF}
  AMemoryStream: TMemoryStream;
  ABuffer: array [0 .. c_buffer_size - 1] of Byte;
  ABytesRead: LongInt;
  ATempStr: string;
begin
  Result := '';
  dbg('DoProcessOutlook, Outlook_ReadStorageProperty() entry, Property=' +
    AProperty);
  try
    if Assigned(AStorage) and
      (AStorage.OpenStream(AProperty, nil, STGM_SHARE_EXCLUSIVE or STGM_READ, 0,
      AIStream) = S_OK) then
      begin
        // Create a memory stream, and set the stream pointer
        // to the beginning
        AMemoryStream := TMemoryStream.Create;
        try
//          AIStream.Seek(0, STREAM_SEEK_SET, ALargeInt);
          // Read the IStream into the memory stream
          repeat
            AIStream.Read(@ABuffer, c_buffer_size, @ABytesRead);
            AMemoryStream.write(ABuffer, ABytesRead);
          until (ABytesRead < c_buffer_size);
          // Convert memory stream to string
          SetString(ATempStr, PChar(AMemoryStream.Memory),
            AMemoryStream.Size div SizeOf(Char));
          // Return the trimmed string.  The temp string may contain null
          // characters at the end; we want to remove them.
          Result := Trim(ATempStr);
        finally
          if Assigned(AMemoryStream) then
            FreeAndNil(AMemoryStream);
        end;
      end;
  except
    on E: Exception do
      dbg('DoProcessOutlook, Outlook_ReadStorageProperty(), error = ' +
        E.Message);
  end;
  dbg('DoProcessOutlook, Outlook_ReadStorageProperty() exit.');
end;

procedure TIQWebEMailCorrespondence.Outlook_ParseHeader(const AHeader: TStringList;
  var AFrom, ATo, ASubject: string; var ADate: TDateTime);
const
  c_from_tag: string = 'From: ';
  c_to_tag: string = 'To: ';
  c_subject_tag: string = 'Subject: ';
  c_date_tag: string = 'Date: ';
var
  ALineText, ADateText: string;
  i, X: Integer;
begin
  dbg('_ProcessHeader(), method entry.');
  AFrom := '';
  ATo := '';
  ASubject := '';
  ADate := IQMS.Common.Dates.MinValue;

  if Assigned(AHeader) then
    begin
      for i := 0 to AHeader.Count - 1 do
        begin
          // Get the line of text
          ALineText := AHeader.Strings[i];
          // If it is empty, just continue
          if ALineText.Trim.IsEmpty then
            Continue;

          // AAltFrom, AAltTo, AAltSubject, AAltDate: string;

          // Parse "From:"
          if LeftStr(ALineText, Length(c_from_tag)) = c_from_tag then
            AFrom := Trim(Copy(ALineText, Length(c_from_tag),
              Length(ALineText)));

          // Parse "To:"
          if LeftStr(ALineText, Length(c_to_tag)) = c_to_tag then
            ATo := Trim(Copy(ALineText, Length(c_to_tag),
              Length(ALineText)));

          // Parse "Subject:"
          if LeftStr(ALineText, Length(c_subject_tag))
            = c_subject_tag then
            ASubject := Trim(Copy(ALineText, Length(c_subject_tag),
              Length(ALineText)));

          // Parse "Date:"
          if LeftStr(ALineText, Length(c_date_tag)) = c_date_tag then
            begin
              X := Pos('-', ALineText);
              if X <= Length(c_date_tag) then
                X := Length(ALineText)
              else
                X := X - Length(c_date_tag);
              ADateText := Trim(Copy(ALineText, Length(c_date_tag), X));
              if not IQMS.Common.Dates.IQTryStrToDateTime(ADateText, ADate) then
                ADate := GetReceivedDate(ADateText, CLIENT_KIND_OUTLOOK);
            end;
        end;
    end;
  dbg('_ProcessHeader(), method exit.');
end;

function TIQWebEMailCorrespondence.Outlook_AttachmentCount(AMsgIStorage: IStorage;
  var AAttachmentCount: Integer): Boolean;
var
  i: Integer;
  W_Name: string;
  AHResult: HRESULT;
  localIStorage: IStorage;
  localIStream: IStream;
begin
  AHResult := 0;

  // NOTE:  There is no way to know whether the attachment is just
  // an embedded image, or is a true attachment, as we understand it.
  // So, we return the total count of all "included files".
  dbg('Outlook_AttachmentCount(), method entry.');
  AAttachmentCount := 0;
  i := 0;
  Result := False;

  if not Assigned(AMsgIStorage) then
    begin
      dbg('Outlook_AttachmentCount(), AMsgIStorage is Unassigned.  Method exit.');
      Exit;
    end;

  repeat
    try
      // Form the storage name for attachment with index
      W_Name := Format('__attach_version1.0_#%s',
        [System.SysUtils.IntToHex(i, 8)]);

      // Now attempt to open that storage
      AHResult := AMsgIStorage.OpenStorage(PWideChar(W_Name), nil,
        STGM_READ or STGM_SHARE_EXCLUSIVE, nil, 0, localIStorage);
      // Increment the index counter
      Inc(i);

      // If it mattered, by incrementing here in the code, we would
      // keep track of the "contains files" count.  This is the
      // number of files the e-mail contains, both attachments and
      // embedded files. Keep this code, in case this is requested.
      // if Succeeded(AHResult) then
      // Inc(AAttachmentCount);

      // To determine the true attachment count, we must evaluate for
      // Content ID (CID). An embedded attachment would have a Content ID,
      // but a true attachment would not.
      if SUCCEEDED(AHResult) and Assigned(localIStorage) and
        not (localIStorage.OpenStream(SUBSTORAGE_CONTENT_ID, nil,
        STGM_SHARE_EXCLUSIVE or STGM_READ, 0, localIStream) = S_OK) then
        begin
          // If there is no text in the buffer, then increment the count
          // because this is a true attachment.
          Inc(AAttachmentCount);
        end;

    except
      on E: Exception do
        begin
          dbg('Outlook_AttachmentCount(), Error: ' + E.Message);
          Break;
        end;
    end;
  until FAILED(AHResult);
  dbg(Format('Outlook_AttachmentCount(), Outlook_AttachmentCount = %d',
    [AAttachmentCount]));
  Result := AAttachmentCount > 0;
  dbg('Outlook_AttachmentCount(), method exit.');
end;

function TIQWebEMailCorrespondence.Outlook_ExtractBodyText(AMsgIStorage: IStorage;
  var ABodyText: string): Boolean;
var
  AHResult: HRESULT;
  sl: TStringList;
  AIStream: IStream;
  ATempBodyTextFileName: string;
begin
  dbg('DoProcessOutlook, Begin body text retrieval.');

  // Initialize
  Result := False;
  AIStream := nil;

  // Validate
  if not Assigned(AMsgIStorage) then
    Exit;

  // Assign a temporary file name that will hold the body text.
  // We do this because we will save the stream to the file,
  // and then grab the body text from it.
  AssignTempFileName(ATempBodyTextFileName, '.txt');

  // Outlook 2000
  AHResult := AMsgIStorage.OpenStream(PWideChar(STORAGE_BODYTEXT_2000), nil,
    STGM_READ or STGM_SHARE_EXCLUSIVE, 0, AIStream);
  Result := SUCCEEDED(AHResult);

  // Outlook 2003 - Attempt 1
  if not Result then
    begin
      AHResult := AMsgIStorage.OpenStream(PWideChar(STORAGE_BODYTEXT_2003),
        nil, STGM_READ or STGM_SHARE_EXCLUSIVE, 0, AIStream);
      Result := SUCCEEDED(AHResult);
    end;

  // Outlook 2003 - Attempt 2
  if not Result then
    begin
      AHResult := AMsgIStorage.OpenStream
        (PWideChar(STORAGE_BODYTEXT_2003_ALT1), nil,
        STGM_READ or STGM_SHARE_EXCLUSIVE, 0, AIStream);
      Result := SUCCEEDED(AHResult);
    end;

  // Outlook 2003 - Attempt 3
  if not Result then
    begin
      AHResult := AMsgIStorage.OpenStream
        (PWideChar(STORAGE_BODYTEXT_2003_ALT2), nil,
        STGM_READ or STGM_SHARE_EXCLUSIVE, 0, AIStream);
      Result := SUCCEEDED(AHResult);
    end;

  // HTML
  if not Result then
    begin
      AHResult := AMsgIStorage.OpenStream(PWideChar(STORAGE_BODYTEXT_HTML),
        nil, STGM_READ or STGM_SHARE_EXCLUSIVE, 0, AIStream);
      Result := SUCCEEDED(AHResult);
    end;

  if Result then
    try
      sl := TStringList.Create;
      try
        dbg('DoProcessOutlook, SaveIStreamToFile(anIstream, ATempMsgFileName)');
        // Put the IStream contents on the file
//        SaveIStreamToFile(AIStream, ATempBodyTextFileName);
        // If it's UNICODE, try to get the ANSI text
        dbg('DoProcessOutlook, ConvertUnicodeFileToAnsi(ATempMsgFileName)');
        ConvertUnicodeFileToAnsi(ATempBodyTextFileName);
        // Load it into a string list
        dbg('DoProcessOutlook, sl.LoadFromFile(ATempMsgFileName)');
        sl.LoadFromFile(ATempBodyTextFileName);
        dbg('DoProcessOutlook, Outlook_ProcessMsgText(sl, ABodyText)');
        Outlook_ProcessMsgText(sl, { var } ABodyText);
      finally
        if Assigned(sl) then
          FreeAndNil(sl);
      end;
    finally
      // Last thing, delete the temporary file
      DeleteFile(ATempBodyTextFileName);
    end;
  if not Result then
    dbg('DoProcessOutlook, End body text retrieval with no success.')
  else
    dbg('DoProcessOutlook, End body text retrieval with success.');
end;

procedure TIQWebEMailCorrespondence.DoProcessOutlook;
var
  AListEmailDetailsRaw, ADropObjDetails, AOutlookHeaders, ALines: TStringList;
  AContents, ABodyText, ATempStr: string;
  AAttachmentCount, AEmailCount, AErrorCount, ACurrentIndex, J: Integer;
  // Contains the file name for the binary .msg file
  ABinaryMsgFileName: string;
  // Contains the IStorage for the dropped message
  AMsgIStorage: IStorage;

  // Alternate values taken from the e-mail header.
  // These may be empty if the header could not be read,
  // but they are available if the other methods return
  // an empty string.
  AAltFrom, AAltTo, AAltSubject, AAltDate: string;
  AAltDateTime: TDateTime;
//  hPrg: TProgressDialog; // in isprogressdlg.pas

  function _ProcessHeader: Boolean;
  var
    APropertyText, ALineText: string;
    sl: TStringList;
    i, X: Integer;
  begin
    dbg('_ProcessHeader(), method entry.');
    Result := False;
    AAltFrom := '';
    AAltTo := '';
    AAltSubject := '';
    AAltDate := '';
    AAltDateTime := IQMS.Common.Dates.MinValue;

    if not Assigned(AMsgIStorage) then
      begin
        dbg('_ProcessHeader(), AMsgIStorage is Unassigned.  Method exit.');
        Exit;
      end;

    APropertyText := Outlook_ReadStorageProperty(AMsgIStorage,
      STORAGE_EMAIL_HEADER);
    if APropertyText.Trim.IsEmpty then
      Exit;
    sl := TStringList.Create;
    try
      sl.Text := APropertyText;
      Outlook_ParseHeader(sl, AAltFrom, AAltTo, AAltSubject, AAltDateTime);
    finally
      if Assigned(sl) then
        FreeAndNil(sl);
    end;
    dbg('_ProcessHeader(), method exit.');
  end;

begin
  dbg('DoProcessOutlook method entry');
  // Initialization
  AEmailCount := 0;
  AErrorCount := 0;
  AListEmailDetailsRaw := nil;
  ADropObjDetails := nil;
  AOutlookHeaders := nil;
  ALines := nil;
  // ASuccess := False;
  AAttachmentCount := 0;

  // Get object contents as text
  dbg('DoProcessOutlook, FDMTextTarget.DataObjectGetFormat(FORMAT_FILE_GROUP_DESCRIPTOR)');
//  AContents := FDMTextTarget.DataObjectGetFormat(FORMAT_FILE_GROUP_DESCRIPTOR);
  // How many fgd's in the returned data?  That's a DWORD at the head of
  // the string-encoded data
  dbg('DoProcessOutlook, DecodeDWORDFromString(AContents)');
//  AEmailCount := DecodeDWORDFromString(AContents);

  dbg('DoProcessOutlook, Create TStringList objects.');

  AListEmailDetailsRaw := TStringList.Create;
  try
    ADropObjDetails := TStringList.Create;
    try
      ALines := TStringList.Create;
      try
        AOutlookHeaders := TStringList.Create;
        try
          // headers in raw format
          dbg('DoProcessOutlook, DataObjectHasFormat(IntToStr(CF_TEXT))');
//          if FDMTextTarget.DataObjectHasFormat(IntToStr(CF_TEXT)) then
//            AListEmailDetailsRaw.Text := FDMTextTarget.DataObjectGetFormat
//              (IntToStr(CF_TEXT));

          // Figure out the current headers displayed in Outlook.  Outlook only
          // supplies, in a drop, the headers that are actually displayed.
          // Also, the user may have dragged them into unusual orders.
          // Here we'll get the header names and orders as currently displayed, and
          // use them below to decide which header is in which position.

          // 04/24/2009 Changed call from TokenizeRaw() to iqstring method below.
          // This allows us to control how the string list object is created,
          // used, and destroyed.  And it returns a more accurate result, since
          // if an e-mail has a blank Subject line, we will still return a
          // blank string and allow it to be added to the table.
          dbg('DoProcessOutlook, Tokenize headers');
//          if AListEmailDetailsRaw.Count > 0 then
//            TokenizeStrict(AListEmailDetailsRaw[0], [#9],
//              AOutlookHeaders);

          // Append = so we can use names/values string list functions
          dbg(Format('DoProcessOutlook, OutlookHeaders.Count = %d',
            [AOutlookHeaders.Count]));
          for J := 1 to AOutlookHeaders.Count do
            AOutlookHeaders[J - 1] := AOutlookHeaders[J - 1] + '=';
          if AOutlookHeaders.Count > 0 then
            dbg(Format('DoProcessOutlook, OutlookHeaders lines [%d]:'#13#10'%s',
              [AOutlookHeaders.Count, dbg_lines(AOutlookHeaders)]));

//          if AEmailCount > 3 then
//            // IQMS.WebVcl.ResourceStrings.cTXT0000391 = 'Adding files to Email Correspondence ...';
//            hPrg := hProgressDlg(Self, AEmailCount, IQMS.WebVcl.ResourceStrings.cTXT0000391);
//          try
//            // Process all of the files being dragged
//            for J := 1 to AEmailCount do
//              begin
//                // If progress is displayed, check if the user clicked the
//                // Cancel button.
//                if Assigned(hPrg) and hPrg.CheckProgressAborted then
//                  Break;
//                // Its content is on an IStorage/IStream, at lindex j-1 global
//                // overrides for lindex and tymed
//                DataObjectLindex := J - 1;
//                DataObjectTymed := TYMED_ISTORAGE;
//                dbg('DoProcessOutlook, FDMTextTarget.DataObjectGetFormat(FORMAT_FILE_CONTENTS)');
//                AContents := FDMTextTarget.DataObjectGetFormat
//                  (FORMAT_FILE_CONTENTS);
//
//                dbg(Format('DoProcessOutlook, Contents found = %s',
//                  [BoolToStr((AContents > ''), True)]));
//                // Watch out for nothing at that index...
//                if (AContents <> '') then
//                  begin
//                    // Get the IStorage
//                    dbg('DoProcessOutlook, DecodeDWORDFromString(AContents)');
//                    DWORD(AMsgIStorage) := DecodeDWORDFromString(AContents);
//
//                    // Binary file contained in BLOB:
//                    // Create MSG file - can be double-clicked to start up Outlook
//                    // editing that message.
//                    AssignTempFileName(ABinaryMsgFileName, '.msg');
//                    dbg(Format('DoProcessOutlook, SaveIStorageToFile( ' +
//                      'AMsgIStorage, ABinaryMsgFileName ).  ABinaryMsgFileName = %s',
//                      [ABinaryMsgFileName]));
//                    SaveIStorageToFile(AMsgIStorage, ABinaryMsgFileName);
//                    dbg('DoProcessOutlook, _ProcessHeader.');
//                    _ProcessHeader;
//                    // Retrieve email details From, Subject, Received, Size
//                    ADropObjDetails.Clear;
//                    dbg(Format
//                      ('DoProcessOutlook, AListEmailDetailsRaw.Count = %d, j = %d',
//                      [AListEmailDetailsRaw.Count, J]));
//                    if (AListEmailDetailsRaw.Count > J) then
//                      begin
//                        // 04/24/2009 Changed call to iqstring method to allow use to
//                        // create string list and evaluate it for index.  And we parse
//                        // using the "strict" method because we want to allow empty
//                        // strings.
//                        dbg('DoProcessOutlook, TokenizeStrict(AListEmailDetailsRaw[ J ], [#9], ALines)');
//                        TokenizeStrict(AListEmailDetailsRaw[J], [#9],
//                          ALines);
//                        dbg(Format
//                          ('DoProcessOutlook, Tokenized lines [%d]:'#13#10'%s',
//                          [ALines.Count, dbg_lines(ALines)]));
//
//                        // 04/24/2009 Added conditional.  Evaluate for line count.
//                        // The line counts must match or we cannot compare lists.
//                        // When adding to ADropObjDetails below, we now
//                        // also evaluate the AList to avoid a "List index out of bounds"
//                        // error.
//                        dbg(Format('DoProcessOutlook, Lines=%d, Headers=%d',
//                          [ALines.Count, AOutlookHeaders.Count]));
//                        if (ALines.Count > 0) then
//                          begin
//                            // To (Recipient)
//                            dbg('DoProcessOutlook, AOutlookHeaders.IndexOfName(To)');
//                            ACurrentIndex := AOutlookHeaders.IndexOfName('To');
//                            if (ACurrentIndex >= 0) and
//                              (ACurrentIndex <= ALines.Count - 1) then
//                              ADropObjDetails.Insert(0,
//                                'To=' + ALines.Strings[ACurrentIndex])
//                            else
//                              begin
//                                ATempStr := Outlook_ReadStorageProperty
//                                  (AMsgIStorage,
//                                  STORAGE_RECIPIENT_NAME);
//                                if IQString.IsEmpty(ATempStr) and
//                                  not IQString.IsEmpty(AAltTo) then
//                                  ATempStr := AAltTo;
//                                if not IQString.IsEmpty(ATempStr) then
//                                  ADropObjDetails.Insert(0, 'To=' +
//                                    ATempStr);
//                              end;
//
//                            // Subject
//                            dbg('DoProcessOutlook, AOutlookHeaders.IndexOfName(Subject)');
//                            ACurrentIndex := AOutlookHeaders.IndexOfName
//                              ('Subject');
//                            if (ACurrentIndex >= 0) and
//                              (ACurrentIndex <= ALines.Count - 1) then
//                              ADropObjDetails.Insert(0,
//                                'Subject=' + ALines.Strings[ACurrentIndex])
//                            else
//                              begin
//                                ATempStr := Outlook_ReadStorageProperty
//                                  (AMsgIStorage,
//                                  STORAGE_SUBJECT);
//                                if IQString.IsEmpty(ATempStr) then
//                                  ATempStr := Outlook_ReadStorageProperty
//                                    (AMsgIStorage,
//                                    STORAGE_SUBJECT_ORIGINAL);
//                                if IQString.IsEmpty(ATempStr) then
//                                  ATempStr := Outlook_ReadStorageProperty
//                                    (AMsgIStorage,
//                                    STORAGE_SUBJECT_ORIGINAL2);
//                                if IQString.IsEmpty(ATempStr) and
//                                  not IQString.IsEmpty(AAltSubject) then
//                                  ATempStr := AAltSubject;
//                                if not IQString.IsEmpty(ATempStr) then
//                                  ADropObjDetails.Insert(0,
//                                    'Subject=' + ATempStr);
//                              end;
//
//                            // Size
//                            dbg('DoProcessOutlook, AOutlookHeaders.IndexOfName(Size)');
//                            ACurrentIndex :=
//                              AOutlookHeaders.IndexOfName('Size');
//                            if (ACurrentIndex >= 0) and
//                              (ACurrentIndex <= ALines.Count - 1) then
//                              ADropObjDetails.Insert(0,
//                                'Size=' + ALines.Strings[ACurrentIndex]);
//
//                            // Date Received
//                            dbg('DoProcessOutlook, AOutlookHeaders.IndexOfName(Received)');
//                            ACurrentIndex := AOutlookHeaders.IndexOfName
//                              ('Received');
//                            if (ACurrentIndex >= 0) and
//                              (ACurrentIndex <= ALines.Count - 1) then
//                              begin
//                                if AAltDateTime > 1 then
//                                  ADropObjDetails.Insert(0,
//                                    'Date=' + FormatDateTime('ddddd tt',
//                                    AAltDateTime))
//                                else
//                                  ADropObjDetails.Insert(0,
//                                    'Date=' + ALines.Strings[ACurrentIndex]);
//                              end
//                            else if AAltDateTime > 1 then
//                              ADropObjDetails.Insert(0,
//                                'Date=' + FormatDateTime('ddddd tt',
//                                AAltDateTime));
//
//                            // From (Sender)
//                            dbg('DoProcessOutlook, AOutlookHeaders.IndexOfName(From)');
//                            ACurrentIndex :=
//                              AOutlookHeaders.IndexOfName('From');
//                            if (ACurrentIndex >= 0) and
//                              (ACurrentIndex <= ALines.Count - 1) then
//                              ADropObjDetails.Insert(0,
//                                'From=' + ALines.Strings[ACurrentIndex])
//                            else
//                              begin
//                                ATempStr := Outlook_ReadStorageProperty
//                                  (AMsgIStorage,
//                                  STORAGE_SENDER_NAME);
//                                if IQString.IsEmpty(ATempStr) then
//                                  ATempStr := Outlook_ReadStorageProperty
//                                    (AMsgIStorage,
//                                    STORAGE_SENDER_NAME2);
//                                if IQString.IsEmpty(ATempStr) then
//                                  ATempStr := Outlook_ReadStorageProperty
//                                    (AMsgIStorage,
//                                    STORAGE_SENDER_EMAIL);
//                                if IQString.IsEmpty(ATempStr) and
//                                  not IQString.IsEmpty(AAltFrom) then
//                                  ATempStr := AAltFrom;
//                                if not IQString.IsEmpty(ATempStr) then
//                                  ADropObjDetails.Insert(0,
//                                    'From=' + ATempStr);
//                              end;
//
//                            // Message File Name
//                            dbg('DoProcessOutlook, AOutlookHeaders.IndexOfName(EMailMsgFile)');
//                            ADropObjDetails.Insert(0,
//                              'EMailMsgFile=' + ABinaryMsgFileName);
//                          end;
//
//                        if ADropObjDetails.Count > 0 then
//                          dbg(Format
//                            ('DoProcessOutlook, ADropObjDetails lines [%d]:'#13#10'%s',
//                            [ADropObjDetails.Count,
//                            dbg_lines(ADropObjDetails)]));
//
//                        // Clear (reset) the list
//                        ALines.Clear;
//
//                        // Save the mail message
//                        dbg(Format
//                          ('DoProcessOutlook, ADropObjDetails.Count [%d]',
//                          [ADropObjDetails.Count]));
//                        if ADropObjDetails.Count > 0 then
//                          begin
//                            dbg('DoProcessOutlook, SaveMailMessage()');
//                            Outlook_ExtractBodyText(AMsgIStorage,
//                              { var } ABodyText);
//                            Outlook_AttachmentCount(AMsgIStorage,
//                              AAttachmentCount);
//                            SaveMailMessage(ADropObjDetails,
//                              CLIENT_KIND_OUTLOOK, ABodyText, AAttachmentCount);
//                            dbg('DoProcessOutlook, Done saving mail message.');
//                          end
//                        else
//                          begin
//                            // 04/24/2009 Since we cannot save the message, increment the
//                            // error count.
//                            Inc(AErrorCount);
//                            dbg('DoProcessOutlook, No details retrieved.');
//                          end;
//                      end;
//                  end;
//                // Step the progress bar
//                if Assigned(hPrg) then
//                  begin
//                    hPrg.StepProgress;
//                    Application.ProcessMessages;
//                  end;
//              end; // Process all of the files being dragged
//            // Final display value
//            if Assigned(hPrg) then
//              begin
//                hPrg.Position := hPrg.MaxProgress;
//                Application.ProcessMessages;
//              end;
//          finally
//            if Assigned(hPrg) then
//              FreeAndNil(hPrg);
//          end;
        finally
          if Assigned(AOutlookHeaders) then
            FreeAndNil(AOutlookHeaders);
        end;
      finally
        if Assigned(ALines) then
          FreeAndNil(ALines);
      end;
    finally
      if Assigned(ADropObjDetails) then
        FreeAndNil(ADropObjDetails);
    end;
  finally
    dbg('DoProcessOutlook, Finalization.');
    if Assigned(AListEmailDetailsRaw) then
      FreeAndNil(AListEmailDetailsRaw);
  end;

  // 04/24/2009 Inform user that x number of e-mails could not be added
  if AErrorCount > 0 then
    begin
      dbg(Format('DoProcessOutlook, Error Count=%d', [AErrorCount]));
//      IQInformation
//        (Format('Encountered errors.  %d mail item(s) could not be added.',
//        [AErrorCount]));
    end;

  dbg('DoProcessOutlook method exit');

end;

procedure TIQWebEMailCorrespondence.Outlook_ProcessMsgFile(AFileName: string);
var
  AHeaders: TStringList;
  AHandleData: AnsiString;
  i, AAttachmentCount: Integer;
  ABinaryMsgFileName, ASender, ARecipient, ASubject,
    ABodyText: string;
  ASentDate: TDateTime;
begin
  if FileExists(AFileName) and
    (CompareText(ExtractFileExt(AFileName), '.msg') = 0) then
    begin
      AHeaders := TStringList.Create;
      try
        if Outlook_ExtractMsgFileData(AFileName, { var } ASender, ARecipient,
          ASubject, ABodyText, ASentDate, AHeaders,
          AAttachmentCount) then
          begin
            AssignTempFileName(ABinaryMsgFileName, '.msg');
            DeleteFile(ABinaryMsgFileName);
            CopyFile(PWideChar(AFileName),
              PWideChar(ABinaryMsgFileName), False);
            AHeaders.Insert(0, 'EMailMsgFile=' + ABinaryMsgFileName);
            SaveMailMessage(AHeaders, CLIENT_KIND_OUTLOOK, ABodyText,
              AAttachmentCount);
          end;
      finally
        FreeAndNil(AHeaders);
      end;
    end;
end;

function TIQWebEMailCorrespondence.Outlook_ExtractMsgFileData(AFileName: string;
  var ASender, ARecipient, ASubject, ABodyText: string;
  var ASentDate: TDateTime; var AHeaders: TStringList;
  var AAttachmentCount: Integer): Boolean;
const
  StgFlags = STGM_READ or STGM_SHARE_EXCLUSIVE;
var
  AMsgStorage: IStorage;
  AHeaderLines: TStringList;
  i: Integer;
  ALine, AName, AValue, ADateStr: string;
begin

  // Set default result
  Result := False;
  ASender := '';
  ARecipient := '';
  ASubject := '';
  ABodyText := '';
  ADateStr := '';
  ASentDate := Date;
  AAttachmentCount := 0;

  // Open storage file
  if (StgOpenStorage(PWideChar(WideString(AFileName)), nil, StgFlags, nil, 0,
    AMsgStorage) = S_OK) then
    try
      AHeaderLines := TStringList.Create;
      try
        AHeaderLines.Text := Outlook_ReadStorageProperty(AMsgStorage,
          STORAGE_EMAIL_HEADER);
        Outlook_ParseHeader(AHeaderLines, { var } ASender, ARecipient, ASubject,
          ASentDate);
      finally
        AHeaderLines.Free;
      end;

      ASender := Outlook_ReadStorageProperty(AMsgStorage, STORAGE_SENDER_NAME);
      if ASender = '' then
        ASender := Outlook_ReadStorageProperty(AMsgStorage,
          STORAGE_SENDER_NAME2);
      if ASender = '' then
        ASender := Outlook_ReadStorageProperty(AMsgStorage,
          STORAGE_SENDER_EMAIL);

      ARecipient := Outlook_ReadStorageProperty(AMsgStorage,
        STORAGE_RECIPIENT_NAME);

      ASubject := Outlook_ReadStorageProperty(AMsgStorage, STORAGE_SUBJECT);
      if ASubject = '' then
        ASubject := Outlook_ReadStorageProperty(AMsgStorage,
          STORAGE_SUBJECT_ORIGINAL);
      if ASubject = '' then
        ASubject := Outlook_ReadStorageProperty(AMsgStorage,
          STORAGE_SUBJECT_ORIGINAL2);

      AHeaders.Add('From=' + ASender);
      AHeaders.Add('To=' + ARecipient);
      AHeaders.Add('Subject=' + ASubject);
      AHeaders.Add('Date=' + FormatDateTime('ddddd tt', ASentDate));

      Outlook_AttachmentCount(AMsgStorage, AAttachmentCount);

      Outlook_ExtractBodyText(AMsgStorage, { var } ABodyText);

      Result := True;
    finally
      // Release the storage interface
      AMsgStorage := nil;
    end;
end;

procedure TIQWebEMailCorrespondence.Outlook_ProcessMsgText(ALines: TStringList;
  var ABodyText: string);
var
  J: Integer;
  ASpacerIndex, ATmpIndex: Integer;
begin
  dbg('Outlook_ProcessMsgText method entry.');
  // Initialization
  ATmpIndex := 0;
  ASpacerIndex := 0;

  // Validation
  dbg(Format('Outlook_ProcessMsgText, Assigned(ALines) = %s',
    [BoolToStr(Assigned(ALines), True)]));
  if not Assigned(ALines) then
    Exit;

  // Assign body text from lines
  dbg('Outlook_ProcessMsgText, ABodyText := ALines.Text');
  ABodyText := ALines.Text;

  // If the body is HTML, do a simple-minded "remove tags" process
  // We could alternatively use a HTML viewer such as the Internet
  // Explorer control.
  // Only look at the first part of the 'COntent-Type' string (neglecting the
  // charset section)
  dbg('Outlook_ProcessMsgText, AnsiCompareText()');
  if AnsiCompareText(Copy(ALines.Values['Content-Type'], 1, 10),
    'text/html;') = 0 then
    ABodyText := StripTagsFrom(ABodyText); // See below
  dbg('Outlook_ProcessMsgText method exit.');

end;

{$ENDREGION 'Outlook'}

{$REGION 'Outlook Express'}


procedure TIQWebEMailCorrespondence.DoProcessOutlookExpress;
//var
//  s: string;
//  AEmailCount: Integer;
//  ATempMsgFileName: string;
//  // AFileDescriptor          : TFileDescriptor;
//  J: Integer;
//  ADropObjDetails: TStringList;
//  anIStream: IStream;
//  ABodyText: string;
begin
//  dbg('DoProcessOutlookExpress() method entry.');
  // Get the file group descriptor as there may be multiple Winapi.Messages.
//  s := FDMTextTarget.DataObjectGetFormat(FORMAT_FILE_GROUP_DESCRIPTOR);

  // How many fgd's in the returned data?  That's a DWORD at the head of the string-encoded data
//  dbg('DoProcessOutlookExpress(), DecodeDWORDFromString()');
//  AEmailCount := DecodeDWORDFromString(s);

//  try
//    ADropObjDetails := TStringList.Create;
//    // Process all of the files being dragged
//    for J := 1 to AEmailCount do
//      begin
//        // Get the j'th file descriptor.  It starts after the initial DWORD and has the length of a TFileDescriptor.
//        // System.Move(s[SizeOf(DWORD)+1+(j-1)*SizeOf(TFileDescriptor)], AFileDescriptor,  SizeOf(TFileDescriptor));
//
//        // Its content is on an IStream, at lindex j-1 global overrides for lindex and tymed
////        DataObjectLindex := J - 1;
////        DataObjectTymed := TYMED_ISTREAM;
////        dbg('DoProcessOutlookExpress(), DataObjectGetFormat(FORMAT_FILE_CONTENTS)');
////        s := FDMTextTarget.DataObjectGetFormat(FORMAT_FILE_CONTENTS);
//
//        // Watch out for nothing at that index...
//        if (s <> '') then
//          begin
//            // Get the IStream
//            dbg('DoProcessOutlookExpress(), DWORD(anIStream) := DecodeDWORDFromString(S)');
//            DWORD(anIStream) := DecodeDWORDFromString(s);
//
//            // Binary file contained in BLOB:
//            // Create MSG file - can be double-clicked to start up Outlook editing that message.
//            dbg('DoProcessOutlookExpress(), AssignTempFileName()');
//            AssignTempFileName(ATempMsgFileName,
//              KindToEmailFileExt(CLIENT_KIND_OUTLOOK_EXPRESS));
//            dbg('DoProcessOutlookExpress(), SaveIStreamToFile(anIStream, ATempMsgFileName)');
//            SaveIStreamToFile(anIStream, ATempMsgFileName);
//
//            // Process the message to get it into the table
//            dbg('DoProcessOutlookExpress(), OutlookExpress_ProcessMsgText()');
//            OutlookExpress_ProcessMsgText(ADropObjDetails,
//              ATempMsgFileName, ABodyText);
//
//            if ADropObjDetails.Count > 0 then
//              begin
//                dbg('DoProcessOutlookExpress(), SaveMailMessage()');
//                SaveMailMessage(ADropObjDetails, CLIENT_KIND_OUTLOOK_EXPRESS,
//                  ABodyText, 0);
//              end;
//
//          end;
//      end;
//  finally
//    if Assigned(ADropObjDetails) then
//      FreeAndNil(ADropObjDetails);
//    dbg('DoProcessOutlookExpress() method exit.');
//  end;
end;

//procedure TIQWebEMailCorrespondence.OutlookExpress_ProcessMsgText
//  (ADropObjDetails: TStringList; ATempMsgFileName: string;
//  var ABodyText: string);
//var
//  ASpacerIndex: Integer;
//  J: Integer;
//  APos: Integer;
//  s: string;
//begin
//  dbg('OutlookExpress_ProcessMsgText() method entry.');
//  // Reload into the string list. If you want to process any attachments they can be decoded here since the message will be listed as multi-part MIME, etc.
//  ADropObjDetails.Clear;
//  ADropObjDetails.LoadFromFile(ATempMsgFileName);
//
//  // The headers end with 2 cr/lf's. That'll give a single blank string in the string list at that index.  Find it.
//  ASpacerIndex := ADropObjDetails.IndexOf('');
////  IQAssert(ASpacerIndex > - 1, 'Unable to find header info in the email message');
//
//  // Everything beyond that is the message body.
//  ABodyText := ADropObjDetails[ASpacerIndex + 1];
//  for J := ASpacerIndex + 2 to ADropObjDetails.Count - 1 do // Iterate
//    ABodyText := ABodyText + #13#10 + ADropObjDetails[J];
//
//  // erase the body and the spacer from the string list
//  for J := ADropObjDetails.Count - 1 downto ASpacerIndex do
//    ADropObjDetails.Delete(J);
//
//  // Everything that's left in the string list is header material.
//  for J := 0 to ASpacerIndex - 1 do
//    begin
//      // All headers are in the form "Header: value".  Change all ': ' to = so we can use the names/values functionality of the string list
//      APos := Pos(': ', ADropObjDetails[J]);
//      if (APos <> 0) then
//        begin
//          s := ADropObjDetails[J];
//          System.Delete(s, APos, 1);
//          s[APos] := '=';
//          ADropObjDetails[J] := s;
//        end;
//    end;
//
//  if AnsiCompareText(Copy(ADropObjDetails.Values['Content-Type'], 1,
//    10), 'text/html;') = 0 then
//    ABodyText := StripTagsFrom(ABodyText); // See below
//
//  if ADropObjDetails.Count > 0 then
//    ADropObjDetails.Insert(0, 'EMailMsgFile=' + ATempMsgFileName);
//  dbg('OutlookExpress_ProcessMsgText() method exit.');
//end;

{$ENDREGION 'Outlook Express'}

{$REGION 'LotusNotes'}


//procedure TIQWebEMailCorrespondence.DoProcessLotusNotes;
//var
//  AListEmailDetailsRaw: TStringList;
//  ADropObjDetails: TStringList;
//  sl: TStringList;
//  s: string;
//  i, J: Integer;
//  tmp, AURL, ASubject, ATo, AFrom: string;
//  AMemoryStream: TMemoryStream;
//  AStringArray: TArray<string>;
//  ARecipients: TStringList;
//begin
//  dbg('DoProcessLotusNotes() method entry.');
//  ADropObjDetails := nil;
//  tmp := '';
//  AURL := '';
//  ASubject := '';
//  ATo := '';
//  AFrom := '';

  // Get the URL and subject
//  if FDMTextTarget.DataObjectHasFormat(FORMAT_LOTUSNOTES_XML_DATA) then
//    begin
//      tmp := FDMTextTarget.DataObjectGetFormat(FORMAT_LOTUSNOTES_XML_DATA);
//      tmp := StringReplace(tmp, ''#$A'', '', [rfReplaceAll, rfIgnoreCase]);
//      AURL := Trim(xml.GetXMLTagValue(tmp, 'feed\entry\id\'));
//      ASubject := Trim(xml.GetXMLTagValue(tmp, 'feed\entry\title\'));
//    end;
//
//  // if we failed to get the URL, then attempt to get it from the CF_TEXT
//  if IQString.IsEmpty(AURL) and FDMTextTarget.DataObjectHasFormat
//    (IntToStr(CF_TEXT)) then
//    begin
//      AURL := Trim(FDMTextTarget.DataObjectGetFormat(IntToStr(CF_TEXT)));
//      if not (LeftStr(LowerCase(AURL), Length('notes://')) = 'notes://') then
//        AURL := '';
//    end;
//
//  // Recipient list.  We don't save the To list, but we get the
//  // From (sender) name this way.
//  if FDMTextTarget.DataObjectHasFormat('NAMELIST') then
//    try
//      ARecipients := TStringList.Create;
//      tmp := Trim(FDMTextTarget.DataObjectGetFormat('NAMELIST'));
//      AStringArray := IQString.SplitStrToArray(tmp, [#0]);
//      for i := 0 to Length(AStringArray) - 1 do
//        begin
//          if Length(AStringArray[i]) > 1 then
//            Continue;
//          if Length(AStringArray[i]) = 0 then
//            begin
//              s := s + #13;
//              Continue;
//            end;
//          s := s + AStringArray[i];
//        end;
//      ARecipients.Duplicates := dupIgnore;
//      ARecipients.Text := s;
//      IQString.RemoveEmptyStrings(ARecipients);
//      // The first recipient will be the sender
//      if IQString.IsEmpty(AFrom) and (ARecipients.Count > 0) then
//        AFrom := ARecipients.Strings[0];
//      s := IQString.StringListToStr(ARecipients, ';');
//      tmp := IQString.AlphaNumeric(s, [' ', ',', ';']);
//      if not IQString.IsEmpty(tmp) then
//        ATo := tmp;
//    finally
//      if Assigned(ARecipients) then
//        FreeAndNil(ARecipients);
//    end;
//
//  // This was a test - not successfull.
//  // The URL for some reason could not be found
//  // by accessing the instance of LotusNotes.
//  { if not iqstring.IsEmpty(AURL) then
//    try
//    sl := TStringList.Create;
//    LotusNotes.CheckLotusNotesObjectCreated;
//    LotusNotes.IBMLotusNotes.FindEMail(AURL, sl);
//    sl.SaveToFile('C:\Users\byron\Desktop\mytest.txt');
//    finally
//    if Assigned(sl) then
//    FreeAndNil(sl);
//    end; }
//
//  // Check the URL before attempting to save because without
//  // a URL, there's no point.  The URL and the subject (maybe)
//  // are the only things we get from Lotus Notes.
//  if not IQString.IsEmpty(AURL) then
//    begin
//      ADropObjDetails := TStringList.Create;
//      try
//        // We may or may not get a subject line, but at least
//        // we try...
//        ADropObjDetails.Add('Subject=' + ASubject);
//        // We never get a "From" with Lotus Notes
//        ADropObjDetails.Add(Format('From=%s', [AFrom]));
//        // And we do not have a message file
//        ADropObjDetails.Add('EMailMsgFile=');
//        // And we don't get an e-mail date, so we just pass
//        // the current date
//        ADropObjDetails.Add
//          (Format('Date=%s', [FormatDateTime('ddddd', Date)]));
//        // We pass a hard-coded, default size of 10 because the only thing
//        // we are saving is a URL anyway.
//        ADropObjDetails.Add('Size=10');
//        dbg('DoProcessLotusNotes(), SaveMailMessage().');
//        // Save the URL as our text; this is what gets executed.
//        SaveMailMessage(ADropObjDetails, CLIENT_KIND_LOTUSNOTES, AURL, 0);
//      finally
//        if Assigned(ADropObjDetails) then
//          FreeAndNil(ADropObjDetails);
//        dbg('DoProcessLotusNotes() method exit.');
//      end;
//    end;
//end;

{$ENDREGION 'LotusNotes'}

{$REGION 'Files'}


//procedure TIQWebEMailCorrespondence.DoProcessFile;
//var
//  i: Integer;
//  AFileName, AExt: string;
//  s: string;
//  ACount: Integer;
//  hPrg: TProgressDialog; // in isprogressdlg.pas
//begin
  // Must initialize to nil
//  hPrg := nil;
//  // Get the count of email files that were dropped
//  ACount := FDMTextTarget.DroppedLines.Count;
//  // Create the progress dialog
//  if ACount > 3 then
//    // IQMS.WebVcl.ResourceStrings.cTXT0000391 = 'Adding files to Email Correspondence ...';
//    hPrg := hProgressDlg(Self, ACount, IQMS.WebVcl.ResourceStrings.cTXT0000391);
//  try
//    // Loop the list of files
//    for i := 0 to ACount - 1 do
//      begin
//        // If progress is displayed, check if the user clicked the
//        // Cancel button.
//        if Assigned(hPrg) and hPrg.CheckProgressAborted then
//          Break;
//        AFileName := Trim(FDMTextTarget.DroppedLines.Strings[i]);
//        if FileExists(AFileName) then
//          begin
//            AExt := ExtractFileExt(AFileName);
//            if CompareText(AExt, '.msg') = 0 then
//              Outlook_ProcessMsgFile(AFileName);
//          end;
//        // Step the progress bar
//        if Assigned(hPrg) then
//          begin
//            hPrg.Position := i + 1;
//            Application.ProcessMessages;
//          end;
//      end;
//    // Final display value
//    if Assigned(hPrg) then
//      begin
//        hPrg.Position := hPrg.MaxProgress;
//        Application.ProcessMessages;
//      end;
//  finally
//    if Assigned(hPrg) then
//      FreeAndNil(hPrg);
//  end;
//end;

{$ENDREGION 'Files'}

{$REGION 'Blob and body text'}

{$WARNINGS OFF}
// This code gives warnings for "comparing signed and unsigned types" as well
// as "suspicious typecast of String to PWideChar".  We are doing this stuff
// deliberately, so we turn off the warnings for just this function.
function TIQWebEMailCorrespondence.ConvertUnicodeFileToAnsi(
  const AFileName: String): Boolean;
// We have a file that may be multi-char.  Convert it in place to single-char.
// Return true if we did a conversion, and vice versa.
var
   AFileStream: TFileStream;
   AString: AnsiString;
   AWideString: widestring;
   ALength: integer;
begin
  Result := False;  // Fall-through value

  AFileStream := TFileStream.Create(AFileName, fmOpenRead);
  try
    // Read the entire file onto the ansistring AString
    AFileStream.Seek(0, soFromEnd);
    ALength := AFileStream.Position;
    AFileStream.Seek(0, soFromBeginning);
    SetLength(AString, ALength);
    if ALength > 0 then
      begin
        AFileStream.ReadBuffer(AString[1], ALength);
        // Is there a #0 other than at the end of the file?  If so, convert from widechar.
        if Strlen(PAnsiChar(AString)) <> ALength then
        begin
          AWideString := PWideChar(AString);
          AString := AWideString;
          SetLength(AString, StrLen(PAnsiChar(AString)));
          Result := true;
        end;
      end;
  finally
    AFileStream.Free;
  end;

  // If we had to convert, delete the original file and write out the converted value.
  if Result then
  begin
    DeleteFile(aFileName);

    AFileStream := TFileStream.Create(AFileName, fmCreate);
    try
       AFileStream.Seek(0, soFromBeginning);
       AFileStream.Write(AString[1], length(AString));
    finally
       AFileStream.Free;
    end;
  end;
end;

{$WARNINGS ON}

procedure TIQWebEMailCorrespondence.SaveMailMessage(AList: TStringList;
  AKind: Real; ABody: string; AAttachmentCount: Integer);
var
  AReceivedFrom: string;
  ASubject: string;
  AReceivedDate: TDateTime;
  AFileName: string;
  ASize: string;
  AID: Real;
begin
  dbg('SaveMailMessage() method entry.');

  if not Assigned(AList) then
    Exit;

  dbg(Format('SaveMailMessage(), AList.Count = %d.', [AList.Count]));
  if AList.Count = 0 then
    Exit;

  // 04/09/2009 If no parent record, then exit early (Byron)
  dbg(Format('SaveMailMessage(), Source_ID = %.0f', [Source_ID]));
  if Source_ID = 0 then
    Exit;

  AReceivedFrom := AList.Values['From'];
  ASubject := AList.Values['Subject'];
  AFileName := AList.Values['EMailMsgFile'];
  AReceivedDate := GetReceivedDate(AList.Values['Date'], AKind);
  ASize := AList.Values['Size'];
  dbg(Format('SaveMailMessage(), AReceivedFrom = %s', [AReceivedFrom]));
  dbg(Format('SaveMailMessage(), ASubject      = %s', [ASubject]));
  dbg(Format('SaveMailMessage(), AFileName     = %s', [AFileName]));
  dbg(Format('SaveMailMessage(), AReceivedDate = %s',
    [FormatDateTime('dddddd tt', AReceivedDate)]));
  dbg(Format('SaveMailMessage(), ASize         = %s', [ASize]));

  // IQAssert( IQGetFileSize( AFileName )/1024 <= 1000, 'Email file exceeds 1MB limit' );

  FIQSearch.StoreWWFilter;
  FIQSearch.ClearWWFilter;
  try
    FQryEmailCorr.DisableControls;

    dbg('SaveMailMessage(), FQryEmailCorr.Append.');
    FQryEmailCorr.Append;
    AID := FQryEmailCorr.FieldByName('ID').AsFloat;

    FQryEmailCorr.FieldByName('RECEIVED_DATE').ReadOnly := False;
    try
      if AReceivedDate > 0 then
        FQryEmailCorr.FieldByName('RECEIVED_DATE').AsDateTime := AReceivedDate;
    finally
      FQryEmailCorr.FieldByName('RECEIVED_DATE').ReadOnly := True;
    end;

    FQryEmailCorr.FieldByName('RECEIVED_FROM').ReadOnly := False;
    try
      FQryEmailCorr.FieldByName('RECEIVED_FROM').AsString := AReceivedFrom;
    finally
      FQryEmailCorr.FieldByName('RECEIVED_FROM').ReadOnly := True;
    end;

    FQryEmailCorr.FieldByName('SUBJECT').ReadOnly := False;
    try
      FQryEmailCorr.FieldByName('SUBJECT').AsString := ASubject;
    finally
      FQryEmailCorr.FieldByName('SUBJECT').ReadOnly := True;
    end;

    FQryEmailCorr.FieldByName('KIND').AsFloat := AKind;

    dbg('SaveMailMessage(), FQryEmailCorr.Post.');
    FQryEmailCorr.Post;

    dbg(Format('SaveMailMessage(), AFileName = %s [Exists=%s]',
      [AFileName, BoolToStr(FileExists(AFileName), True)]));
    if (AFileName > '') and FileExists(AFileName) then
      begin
        dbg('SaveMailMessage(), LoadFileIntoBlob()');
        LoadFileIntoBlob(FQryEmailCorr.FieldByName('ID').AsFloat, AFileName);
      end;
    dbg('SaveMailMessage(), UpdateBodyText()');
//    UpdateBodyText(FQryEmailCorr.FieldByName('ID').AsFloat, ABody,
//      AAttachmentCount);
    dbg('SaveMailMessage(), RefreshDataSetByID()');
    RefreshDataSetByID(FQryEmailCorr);
    dbg(Format('SaveMailMessage(), DeleteFile(%s)', [AFileName]));
    DeleteFile(AFileName);
    dbg('SaveMailMessage() method exit.');
  finally
    FIQSearch.RestoreWWFilter;
    FQryEmailCorr.EnableControls;
  end;

//  if not FQryEmailCorr.Locate('id', AID, []) then
//    IQConfirm(Format
//      (IQMS.WebVcl.ResourceStrings.
//      cTXT0000405 { 'Unable to find appended email with the subject line ''%s'' - check your filter settings.' } ,
//      [ASubject]));
end;

procedure TIQWebEMailCorrespondence.LoadFileIntoBlob(AID: Real; AFileName: string);
var
  AStream: TMemoryStream;
  ASQLConnection: TSQLConnection;
  AQuery: TSQLQuery;
  ATransDesc: TTransactionDesc;
begin
//  dbg('LoadFileIntoBlob() method entry.');
//
//  AStream := TMemoryStream.Create;
//  try
//    AStream.LoadFromFile(AFileName);
//    // Create and configure the SQL Connection for multiple transactions.
//    ASQLConnection := TSQLConnection.Create(nil);
//    try
//      try
//        dbtdbexp.DBX_ConfigureSQLConnection(ASQLConnection);
//        ATransDesc.TransactionID := 1;
//        ATransDesc.IsolationLevel := xilREADCOMMITTED;
//        ASQLConnection.StartTransaction(ATransDesc);
//        ASQLConnection.Connected := True;
//      except
//        on E: Exception do
//          begin
//            dbg(Format('LoadFileIntoBlob(), Configure DBExpress Error: %s.',
//              [E.Message]));
//            raise;
//          end;
//      end;
//
//      // Create and configure the query
//      AQuery := TSQLQuery.Create(nil);
//      try
//        AQuery.SQLConnection := ASQLConnection;
//
//        // Add the SQL text which includes syntax for updating the BLOB field.
//        AQuery.SQL.Add('UPDATE email_correspondence');
//        AQuery.SQL.Add('   SET mesg_blob = EMPTY_BLOB()');
//        AQuery.SQL.Add(' WHERE id = :ID');
//        AQuery.SQL.Add('RETURNING mesg_blob INTO :MESG_BLOB');
//
//        // Populate parameters
//        AQuery.Params.ParamByName('ID').AsBCD := Trunc(AID);
//        AQuery.Params.ParamByName('MESG_BLOB').LoadFromStream(AStream,
//          ftOraBlob);
//        try
//          // Execute the SQL
//          AQuery.ExecSQL();
//
//          // Commit the transaction
//          ASQLConnection.Commit(ATransDesc);
//
//        except
//          on E: Exception do
//            begin
//              dbg(Format('LoadFileIntoBlob(), Error: %s.', [E.Message]));
//              raise;
//            end;
//        end;
//
//      finally
//        if Assigned(AQuery) then
//          FreeAndNil(AQuery);
//      end;
//    finally
//      // Rollback transaction if required.
//      if ASQLConnection.InTransaction then
//        ASQLConnection.Rollback(ATransDesc);
//      if Assigned(ASQLConnection) then
//        FreeAndNil(ASQLConnection);
//    end;
//  finally
//    if Assigned(AStream) then
//      FreeAndNil(AStream);
//    dbg('LoadFileIntoBlob() method exit.');
//  end;
end;

//procedure TIQWebEMailCorrespondence.LoadFileIntoBlobEx(AID: Real;
//  AFileName: string);
//begin
//  dbg('LoadFileIntoBlob() method entry.');
//  try
//    db_dm.FDConnection.StartTransaction;
//    // Create and configure the query
//    with TFDCommand.Create(nil) do
//      try
//        Connection := db_dm.FDConnection;
//        // Add the SQL text which includes syntax for updating the BLOB field.
//        CommandText.Add('UPDATE email_correspondence');
//        CommandText.Add('   SET mesg_blob = EMPTY_BLOB()');
//        CommandText.Add(' WHERE id = :ID');
//        CommandText.Add('RETURNING mesg_blob INTO :MESG_BLOB');
//
//        // Populate parameters
//        Params.ParamByName('ID').DataType := ftLargeInt;
//        Params.ParamByName('ID').Value := Trunc(AID);
//        Params.ParamByName('MESG_BLOB').DataType := ftOraBlob;
//        Params.ParamByName('MESG_BLOB').ParamType := ptInput;
//        Params.ParamByName('MESG_BLOB')
//          .LoadFromStream(TFileStream.Create(AFileName, fmOpenRead), ftOraBlob);
//        try
//          Execute;
//          db_dm.FDConnection.Commit;
//        except
//          on E: Exception do
//            begin
//              db_dm.FDConnection.Rollback;
//              dbg(Format('LoadFileIntoBlob(), Error: %s.', [E.Message]));
//              raise;
//            end;
//        end;
//      finally
//        Free;
//      end;
//  finally
//    dbg('LoadFileIntoBlob() method exit.');
//    if db_dm.FDConnection.InTransaction then
//      db_dm.FDConnection.Rollback;
//  end;
//end;

//procedure TIQWebEMailCorrespondence.UpdateBodyText(AID: Real; ABodyText: string;
//  AAttachmentCount: Integer);
//begin
//  dbg('UpdateBodyText() method entry.');
//  dbg(Format('UpdateBodyText(), Body text exists = %s.',
//    [BoolToStr((ABodyText > ''), True)]));
//  try
//    with TFDCommand.Create(nil) do
//      try
//        Connection := db_dm.FDConnection;
//        CommandText.Add('UPDATE email_correspondence');
//        CommandText.Add('   SET body_text = :CLOB_PARAM,');
//        CommandText.Add('       attachment_count = :ATTACHMENT_COUNT');
//        CommandText.Add(' WHERE id = :ID');
//        Params.ParamByName('CLOB_PARAM').DataType := ftOraClob;
//        Params.ParamByName('CLOB_PARAM').Value := ABodyText;
//        Params.ParamByName('ATTACHMENT_COUNT').DataType := ftInteger;
//        Params.ParamByName('ATTACHMENT_COUNT').Value := AAttachmentCount;
//        Params.ParamByName('ID').DataType := ftLargeInt;
//        Params.ParamByName('ID').Value := AID;
//        Execute;
//      finally
//        Free;
//      end;
//  except
//    on E: Exception do
//      // 'Encountered error saving email body text.'
//      iqerrdlg.ShowIQErrorMessage(IQMS.WebVcl.ResourceStrings.cTXT0000402, E.Message, '');
//  end;
//
//  dbg('UpdateBodyText() method exit.');
//end;

{$ENDREGION 'Blob and body text'}

end.

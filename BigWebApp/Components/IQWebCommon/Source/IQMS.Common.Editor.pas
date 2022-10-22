unit IQMS.Common.editor;

{ Example:
  Editor(DataSource1, Table1.FieldByName( 'DOC_BLOB' ) as TBlobField );

  To display contents of a blob field in RichEdit:
  RTF.Lines.Assign( Table1.FieldByName( 'DOC_BLOB' ));
}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Winapi.Messages,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  IQMS.Common.BMP,
  IQMS.WebVcl.About,
  IQMS.Common.JumpConstants,
  Vcl.ExtDlgs,
  IQMS.WebVcl.Blob,
//  Winapi.RichEdit,
//  wwriched,
  Data.SqlExpr,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniHTMLMemo,
  uniImage,
  uniColorButton,
  Vcl.ComCtrls,
  uniMemo,
  uniDBMemo,
  uniSpinEdit;

type
  TDocType = (dcRTF, dcImage);
  TCharacterFormat = (CFM_Superscript, CFM_Subscript, CFM_Normal);

  TFrmIQWebEditor = class(TUniForm)
    MainMenu: TUniMainMenu;
    FileNew1: TUniMenuItem;
    FileOpen1: TUniMenuItem;
    FileSave1: TUniMenuItem;
    FileSaveAs1: TUniMenuItem;
    FilePrint1: TUniMenuItem;
    FileClose1: TUniMenuItem;
    EditUndo1: TUniMenuItem;
    EditCut1: TUniMenuItem;
    EditCopy1: TUniMenuItem;
    EditPaste1: TUniMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    SpeedBar: TUniPanel;
    FontDialog1: TFontDialog;
    N5: TUniMenuItem;
    FormatFont1: TUniMenuItem;
    StatusBar: TUniStatusBar;
    EditSelectAll1: TUniMenuItem;
    HelpMenu: TUniMenuItem;
    InsertFile1: TUniMenuItem;
    FindDialog1: TFindDialog;
    Format1: TUniMenuItem;
    EditFind1: TUniMenuItem;
    EditReplace1: TUniMenuItem;
    ReplaceDialog1: TReplaceDialog;
    IQAbout1: TIQWebAbout;
    About1: TUniMenuItem;
    FormatStretchImage1: TUniMenuItem;
    PImage: TUniPopupMenu;
    OpenFile1: TUniMenuItem;
    Save1: TUniMenuItem;
    Print1: TUniMenuItem;
    N3: TUniMenuItem;
    FormatStretchImage2: TUniMenuItem;
    PRTF: TUniPopupMenu;
    OpenFile2: TUniMenuItem;
    Save2: TUniMenuItem;
    Print2: TUniMenuItem;
    N6: TUniMenuItem;
    Insert1: TUniMenuItem;
    SaveAndClose1: TUniMenuItem;
    Tools1: TUniMenuItem;
    ToolsWordCount1: TUniMenuItem;
    N4: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    ChangeCase1: TUniMenuItem;
    UpperCase1: TUniMenuItem;
    LowerCase1: TUniMenuItem;
    ProperCase1: TUniMenuItem;
    PnlRTF: TUniPanel;
    PnlRTFInner: TUniPanel;
    RTF: TUniDBHTMLMemo;
    PnlRulerFrame: TUniPanel;
    Bevel1: TUniPanel;
    Ruler: TUniPanel;
    RightInd: TUniImage;
    FirstInd: TUniImage;
    LeftInd: TUniImage;
    Shape1: TUniPanel;
    Bevel2: TUniPanel;
    Buffer1: TUniPanel;
    Buffer2: TUniPanel;
    Bevel3: TUniPanel;
    FormatBold1: TUniMenuItem;
    FormatItalic1: TUniMenuItem;
    FormatUnderline1: TUniMenuItem;
    AlignLeft1: TUniMenuItem;
    N9: TUniMenuItem;
    AlignCenter1: TUniMenuItem;
    AlignRight1: TUniMenuItem;
    PnlToolbarFormat: TUniPanel;
    cmbFontName: TUniComboBox;
    edtFontSize: TUniSpinEdit;
    sbtnBold: TUniSpeedButton;
    sbtnItalic: TUniSpeedButton;
    sbtnUnderline: TUniSpeedButton;
    sbtnLeftAlign: TUniSpeedButton;
    sbtnCenterAlign: TUniSpeedButton;
    sbtnRightAlign: TUniSpeedButton;
    sbtnBullets: TUniSpeedButton;
    PnlIndentButtons: TUniPanel;
    sbtnDecreaseIndent: TUniSpeedButton;
    sbtnIncreaseIndent: TUniSpeedButton;
    Bevel4: TUniPanel;
    ClearFormatting1: TUniMenuItem;
    N10: TUniMenuItem;
    Bevel7: TUniPanel;
    Bevel8: TUniPanel;
    Bevel9: TUniPanel;
    EditRedo1: TUniMenuItem;
    N11: TUniMenuItem;
    FormatBullets1: TUniMenuItem;
    N7: TUniMenuItem;
    Bevel10: TUniPanel;
    PFontColor: TUniPopupMenu;
    FontColorMoreColors1: TUniMenuItem;
    FontColorBlack1: TUniMenuItem;
    FontColorMaroon1: TUniMenuItem;
    FontColorGreen1: TUniMenuItem;
    FontColorOlive1: TUniMenuItem;
    FontColorNavy1: TUniMenuItem;
    FontColorPurple1: TUniMenuItem;
    FontColorTeal1: TUniMenuItem;
    FontColorGray1: TUniMenuItem;
    FontColorSilver1: TUniMenuItem;
    FontColorRed1: TUniMenuItem;
    FontColorLime1: TUniMenuItem;
    FontColorYellow1: TUniMenuItem;
    FontColorBlue1: TUniMenuItem;
    FontColorFuchsia1: TUniMenuItem;
    FontColorAqua1: TUniMenuItem;
    FontColorWhite1: TUniMenuItem;
    ImageListColor: TUniImageList;
    File1: TUniMenuItem;
    Edit1: TUniMenuItem;
    PnlToolbarStandard: TUniPanel;
    sbtnFileNew: TUniSpeedButton;
    sbtnOpen: TUniSpeedButton;
    sbtnSave: TUniSpeedButton;
    sbtnPrint: TUniSpeedButton;
    Bevel5: TUniPanel;
    PnlEditUndo: TUniPanel;
    sbtnUndo: TUniSpeedButton;
    sbtnRedo: TUniSpeedButton;
    Bevel6: TUniPanel;
    PnlEditCopy: TUniPanel;
    sbtnCut: TUniSpeedButton;
    sbtnCopy: TUniSpeedButton;
    sbtnPaste: TUniSpeedButton;
    sbtnFind: TUniSpeedButton;
    sbtnReplace: TUniSpeedButton;
    PnlToolbarSpelling: TUniPanel;
    Bevel11: TUniPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    PnlImage: TUniPanel;
    InsertPicture1: TUniMenuItem;
    sbImage: TUniScrollBox;
    Image1: TUniImage;
    FormatCenterImage1: TUniMenuItem;
    PHighlight: TUniPopupMenu;
    HighlightBlack1: TUniMenuItem;
    HighlightMaroon1: TUniMenuItem;
    HighlightGreen1: TUniMenuItem;
    HighlightOlive1: TUniMenuItem;
    HighlightNavy1: TUniMenuItem;
    HighlightPurple1: TUniMenuItem;
    HighlightTeal1: TUniMenuItem;
    HighlightGray1: TUniMenuItem;
    HighlightSilver1: TUniMenuItem;
    HighlightRed1: TUniMenuItem;
    HighlightLime1: TUniMenuItem;
    HighlightYellow1: TUniMenuItem;
    HighlightBlue1: TUniMenuItem;
    HighlightFuchsia1: TUniMenuItem;
    HighlightAqua1: TUniMenuItem;
    HighlightWhite1: TUniMenuItem;
    RemoveHighlighting1: TUniMenuItem;
    N8: TUniMenuItem;
    N13: TUniMenuItem;
    sbtnHighlight: TUniSpeedButton;
    sbtnFontColor: TUniSpeedButton;
    sbtnFormatCharFormat: TUniSpeedButton;
    PCharFormat: TUniPopupMenu;
    Normal1: TUniMenuItem;
    Superscript1: TUniMenuItem;
    Subscript1: TUniMenuItem;
    Bevel12: TUniPanel;
    Bevel13: TUniPanel;
    pnlToolbarImage: TUniPanel;
    sbtnStretchImage: TUniSpeedButton;
    sbtnInsertPicture: TUniSpeedButton;
    sbtnCenterImage: TUniSpeedButton;
    Bevel14: TUniPanel;
    sbtnCheckSpelling: TUniSpeedButton;
    miCheckSpelling: TUniMenuItem;
    ColorDialog1: TUniColorButton;

    procedure SelectionChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileNew(Sender: TObject);
    procedure FileOpen(Sender: TObject);
    procedure FileSave(Sender: TObject);
    procedure FileSaveAs(Sender: TObject);
    procedure FilePrint(Sender: TObject);
    procedure FileExit(Sender: TObject);
    procedure EditUndo(Sender: TObject);
    procedure EditCut(Sender: TObject);
    procedure EditCopy(Sender: TObject);
    procedure EditPaste(Sender: TObject);
    procedure HelpContents(Sender: TObject);
    procedure HelpSearch(Sender: TObject);
    procedure HelpHowToUse(Sender: TObject);
    procedure SelectFont(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure edtFontSizeChange(Sender: TObject);
    procedure AlignButtonClick(Sender: TObject);
    procedure cmbFontNameChange(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure sbtnBulletsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RulerItemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RulerItemMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RightIndMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    function GetDataSet: TDataSet;
    procedure SetDataField(AField: TBlobField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditSelectAll1Click(Sender: TObject);
    procedure InsertFile1Click(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure EditFind1Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure sbtnFindClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormatStretchImage1Click(Sender: TObject);
    procedure PImagePopup(Sender: TObject);
    procedure SaveAndClose1Click(Sender: TObject);
    procedure StatusBarResize(Sender: TObject);
    procedure RTFChange(Sender: TObject);
    procedure ToolsWordCount1Click(Sender: TObject);
    procedure RTFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditReplace1Click(Sender: TObject);
    procedure ReplaceDialog1Replace(Sender: TObject);
    procedure ReplaceDialog1Show(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure UpperCase1Click(Sender: TObject);
    procedure LowerCase1Click(Sender: TObject);
    procedure ProperCase1Click(Sender: TObject);
    procedure sbtnDecreaseIndentClick(Sender: TObject);
    procedure sbtnIncreaseIndentClick(Sender: TObject);
    //procedure PnlRulerFrameResize(Sender: TObject);
    procedure FormatBold1Click(Sender: TObject);
    procedure FormatItalic1Click(Sender: TObject);
    procedure FormatUnderline1Click(Sender: TObject);
    procedure ClearFormatting1Click(Sender: TObject);
    procedure EditRedo1Click(Sender: TObject);
    procedure FontColorMenuClick(Sender: TObject);
    procedure DoInsertPicture(Sender: TObject);
    procedure FormatCenterImage1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure HighlightColorClick(Sender: TObject);
    procedure sbtnHighlightClick(Sender: TObject);
    procedure sbtnFontColorClick(Sender: TObject);
    procedure sbtnFormatCharFormatClick(Sender: TObject);
    procedure DoCharFormatClick(Sender: TObject);
    procedure miCheckSpellingClick(Sender: TObject);

    private

      FDataField: TBlobField;
      FSaveHint: TNotifyEvent;

      FSearchStartPos: Integer;
      FSearchOptions: TSearchTypes;
      FSearchLast: string;

      FFileName: string;
      FUpdating: Boolean;
      FDragOfs: Integer;
      FDragging: Boolean;

      procedure DoOnShowHint(var HintStr: string; var CanShow: Boolean;
        var HintInfo: THintInfo);

      procedure SetControls;

      function CurrText: TTextAttributes;
      procedure GetFontNames;
      procedure SetFileName(const FileName: string);
      procedure CheckFileSave;
      procedure SetupRuler;
      procedure SetEditRect;
      procedure ResetSearch;
      procedure CheckImage;
      procedure ClearFormatting;
      procedure ExpandImageArea(AExpand: Boolean);

      procedure EnableImage;
      procedure EnableRichEdit;
      procedure EnableControlsFor(ADocType: TDocType);

      procedure IQAfterShowMessage(var Msg: TMessage);
        message iq_AfterShowMessage;

      procedure SetStatus(S: string; APanel: Integer);
      function GetWordCount: Integer;
      procedure SetColLineStatus;
      procedure SetModifiedStatus(const AModified: Boolean);
      procedure SetCharacterCountStatus;

      function RTFCanRedo: Boolean;
      procedure HighlightSelText(AColor: TColor);

      procedure SetCharFormat(ACharacterFormat: TCharacterFormat);
      function GetCharFormat: TCharacterFormat;

      procedure AssignEditorContent;
      procedure SaveImageToBlobField;
      procedure SaveMemoToBlobField;
      function DefaultFontName(var ASize: Integer): string;

    public
      FModified: Boolean;
      FIsImage: Boolean;
      ImageModified: Boolean;
      FFormActive: Boolean; // used in resize events
      destructor Destroy; override;
      property DataField: TBlobField read FDataField write SetDataField;
      property DataSet: TDataSet read GetDataSet;
      property WordCount: Integer read GetWordCount;
  end;

var
  FrmIQEditor: TFrmIQWebEditor;

procedure Editor(DataSource: TDataSource; BlobField: TBlobField);

implementation

uses
  IQMS.Common.InfoBox,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  IQMS.Common.SpellChecker,
  IQMS.Common.DataConst;

const
  RulerAdj = 4 / 3;
  GutterWid = 2;

{$R *.DFM}

procedure Editor(DataSource: TDataSource; BlobField: TBlobField);
var frm : TFrmIQWebEditor;
begin
  frm := TFrmIQWebEditor.Create(uniGUIApplication.UniApplication);
  frm.DataField := BlobField;
  frm.FIsImage := FieldIsImage(BlobField);
  frm.ShowModal;
end;

{ TFrmIQWebEditor }

destructor TFrmIQWebEditor.Destroy;
begin
  FDataField := nil; // dereference
  inherited Destroy;
end;

procedure TFrmIQWebEditor.FormCreate(Sender: TObject);
begin
  FFormActive := FALSE;
  FModified := FALSE;

//  CenterForm(Self); // IQMS.Common.Controls.pas; default position
  IQRegFormRead(Self, [Self]);

  OpenDialog.InitialDir := IQMS.Common.Miscellaneous.IQGetImagesPath;
  if OpenDialog.InitialDir = '' then
    OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  SetFileName(IQMS.Common.ResStrings.cTXT0000107 { 'Edit Document' } );
  GetFontNames;
  SetupRuler;
  ResetSearch;
  Image1.Stretch := FALSE;
  ImageModified := FALSE;
  RTF.Font.Name := IQMS.Common.Screen.SystemFontName;
  RTF.Font.Size := 10;
end;

procedure TFrmIQWebEditor.FormResize(Sender: TObject);
begin
  SetEditRect;
  Update;
end;

procedure TFrmIQWebEditor.FormPaint(Sender: TObject);
begin
  SetEditRect;
end;

procedure TFrmIQWebEditor.FormShow(Sender: TObject);
begin
  FFormActive := TRUE;
  CheckImage;
  PostMessage(Handle, iq_AfterShowMessage, 0, 0);
  StatusBarResize(nil);
  FModified := FALSE;
  //RTF.Modified := FALSE;
//  PnlRulerFrameResize(nil);
  SetModifiedStatus(FALSE);
end;

procedure TFrmIQWebEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.OnShowHint := nil;
  FFormActive := FALSE;
  IQRegFormWrite(Self, [Self]);
  Action := caFree;
end;

procedure TFrmIQWebEditor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  AResult: TModalResult;
begin
  try
    if (( not FIsImage) and FModified) or (FIsImage and ImageModified) then
      begin
        // 'Save your changes?'
        AResult := MessageDlg(IQMS.Common.ResStrings.cTXT0000108, mtConfirmation,
          mbYesNoCancel);
        if AResult = mrYes then
          FileSave(Sender)
        else if AResult = mrCancel then
          CanClose := FALSE;
      end;
  except
    CanClose := FALSE;
  end;
end;

procedure TFrmIQWebEditor.FormActivate(Sender: TObject);
begin
    Application.OnShowHint := DoOnShowHint;
end;

function TFrmIQWebEditor.GetDataSet: TDataSet;
begin
  result := DataField.DataSet;
end;

procedure TFrmIQWebEditor.IQAfterShowMessage(var Msg: TMessage);
begin
  { Mar-12-2002 }
  if not FIsImage then
    RTF.SetFocus;

  AssignEditorContent;

  SelectionChange(nil);

  if edtFontSize.Value = 0 then
    edtFontSize.Value := 8;
end;

procedure TFrmIQWebEditor.SetDataField(AField: TBlobField);
begin
  FDataField := AField;
  { code from here is transfered to new procedure AssignEditorContent that is called now on aftershow }
end;

procedure TFrmIQWebEditor.AssignEditorContent;
var
  AMemoryStream: TMemoryStream;
  ARTFString: AnsiString;
begin
  with DataSet do
    begin
      if FIsImage then
        begin
          AMemoryStream := TMemoryStream.Create;
          try
            if TIQWebBlob.GetBlob('DOC_BLOB', // column name
              'IQ_DOCS', // table name
              FieldByName('ID').asFloat, AMemoryStream) then
              Image1.Picture.Bitmap.LoadFromStream(AMemoryStream);
          finally
            if Assigned(AMemoryStream) then
              FreeAndNil(AMemoryStream);
          end;
        end
      else
        // 03/22/2012 Do not assign RTF text by assigning the
        // dataset field: RTF.Lines.Assign(FDataField). Doing so causes
        // an anomoly in the text.
        try
          AMemoryStream := TMemoryStream.Create;
          if TIQWebBlob.GetBlob('DOC_BLOB', // column name
            'IQ_DOCS', // table name
            FieldByName('ID').asFloat, AMemoryStream) then
            RTF.Lines.LoadFromStream(AMemoryStream);
        finally
          if Assigned(AMemoryStream) then
            FreeAndNil(AMemoryStream);
        end;
      // 'Document'
      SetFileName(IQMS.Common.ResStrings.cTXT0000109);
      RTF.ReadOnly := FALSE;
//      RTF.Modified := FALSE;
      ImageModified := FALSE;
    end;
end;

procedure TFrmIQWebEditor.SelectionChange(Sender: TObject);
begin
  SetControls;
  SetColLineStatus;
  SetCharacterCountStatus;
end;

function TFrmIQWebEditor.CurrText: TTextAttributes;
begin
//  if RTF.SelLength > 0 then
//    result := RTF.SelAttributes
//  else
//    result := RTF.DefAttributes;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  result := 1;
end;

procedure TFrmIQWebEditor.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(cmbFontName.Items));
  ReleaseDC(0, DC);
  cmbFontName.Sorted := TRUE;
end;

procedure TFrmIQWebEditor.SetFileName(const FileName: string);
begin
  FFileName := FileName;
  Caption := Format('%s - %s', [ExtractFileName(FileName), Application.Title]);
end;

procedure TFrmIQWebEditor.CheckFileSave;
var
  SaveResp: Integer;
begin
//  if not RTF.Modified then
//    Exit;
  SaveResp := MessageDlg
    (Format(IQMS.Common.ResStrings.cTXT0000110 { 'Save changes to %s?' } , [FFileName]),
    mtConfirmation, mbYesNoCancel);
  case SaveResp of
    idYes:
      FileSave(Self);
    idNo: { Nothing }
      ;
    idCancel:
      Abort;
  end;
end;

procedure TFrmIQWebEditor.SetupRuler;
var
  S: string;
  i: Integer;
begin
  SetLength(S, 201);
  i := 1;
  while i < 200 do
    begin
      S[i] := #9;
      S[i + 1] := '|';
      Inc(i, 2);
    end;
  Ruler.Caption := S;
end;

procedure TFrmIQWebEditor.SetEditRect;
var
  R: TRect;
  AFontName: TFontName;
  ASize: Integer;
begin
  with RTF do
    begin
      R := Rect(GutterWid, 0, ClientWidth - GutterWid, ClientHeight);
      SendMessage(Handle, EM_SETRECT, 0, Longint(@R));
    end;
end;

{ Event Handlers }

procedure TFrmIQWebEditor.FileNew(Sender: TObject);
begin
  // 'Clear current document?'
  if IQMS.Common.Dialogs.IQConfirmYN(IQMS.Common.ResStrings.cTXT0000111) then
    begin
      if FIsImage then
        begin
          FIsImage := FALSE;
          RTF.Lines.Clear;
          CheckImage;
        end
      else
        RTF.Lines.Clear;
    end;
end;

procedure TFrmIQWebEditor.FileOpen(Sender: TObject);
begin
  // 'Overwrite current document?'
  if IQMS.Common.Dialogs.IQConfirmYN(IQMS.Common.ResStrings.cTXT0000112) then
    if OpenDialog.Execute then
      begin
        FIsImage := FileIsImage(OpenDialog.FileName); { in IQBMP }
        CheckImage;
        if FIsImage then
          begin
            Image1.Picture.Bitmap.LoadFromFile(OpenDialog.FileName);
            ImageModified := TRUE;
          end
        else
          begin
            ClearFormatting;
            RTF.Lines.LoadFromFile(OpenDialog.FileName);
            SetFileName(OpenDialog.FileName);
            RTF.SetFocus;
            RTF.ReadOnly := ofReadOnly in OpenDialog.Options;
          end;
      end;
end;

procedure TFrmIQWebEditor.SaveImageToBlobField;
var
  AMemoryStream: TMemoryStream;
  AID: Real;
begin
  // Get the ID value
  AID := 0;
  if Assigned(DataSet) and (DataSet.FindField('ID') <> nil) then
    AID := DataSet.FieldByName('ID').AsInteger;

  if AID > 0 then
    try
      AMemoryStream := TMemoryStream.Create;
      try
        Image1.Picture.Bitmap.SaveToStream(AMemoryStream);

        with DataSet do
         TIQWebBlob.SaveBlob('doc_blob', 'iq_docs', AID, AMemoryStream);
      finally
        if Assigned(AMemoryStream) then
          FreeAndNil(AMemoryStream);
      end;
    except
      on E: Exception do
        begin
          // 'Encountered error attempting to save the document:'
          IQMS.Common.Dialogs.IQError(IQMS.Common.ResStrings.cTXT0000411 + #13 + E.Message);
          System.SysUtils.Abort;
        end;
    end;
end;

procedure TFrmIQWebEditor.SaveMemoToBlobField;
var
  AStream: TMemoryStream;
  AQuery: TSQLQuery;
  AID: LargeInt;
  ARTFString: AnsiString;
begin
  // Get the ID value
  AID := 0;
  if Assigned(DataSet) and (DataSet.FindField('ID') <> nil) then
    AID := DataSet.FieldByName('ID').AsLargeInt;

  if AID > 0 then
    try
      AStream := TMemoryStream.Create;
      try
        RTF.Lines.SaveToStream(AStream);
        AStream.Position := 0;
        with TFDQuery.Create(nil) do
          try
            ConnectionName := cnstFDConnectionName;
            SQL.Text := 'update iq_docs set doc_blob = :blob where id = :id';
            ParamByName('blob').DataType := ftBlob;
            ParamByName('id').DataType := ftFmtBCD;
            ParamByName('blob').LoadFromStream(AStream, ftBlob);
            ParamByName('id').AsLargeInt := AID;
            ExecSQL;
          finally
            Free;
          end;
      finally
        if Assigned(AStream) then
          FreeAndNil(AStream);
      end;
    except
      on E: Exception do
        begin
          // 'Encountered error attempting to save the document:'
          IQMS.Common.Dialogs.IQError(IQMS.Common.ResStrings.cTXT0000411 + #13 + E.Message);
          System.SysUtils.Abort;
        end;
    end;
end;

procedure TFrmIQWebEditor.FileSave(Sender: TObject);
// var
// BlobStream: TFDBlobStream;
begin
  with DataSet as TFDTable do
    try
      if CompareText(TableName, 'IQ_DOCS') <> 0 then
        raise Exception.Create(Format('%s - Invalid table', [TableName]));

      if FIsImage then
        SaveImageToBlobField
      else
        SaveMemoToBlobField;

      Refresh; // do this to prevent the record conflict error

      //RTF.Modified := FALSE;
      ImageModified := FALSE;

      FModified := FALSE;
      SetModifiedStatus(FModified);

    except
      if (State in [dsEdit, dsInsert]) then
        Cancel;
      raise;
    end
end;

procedure TFrmIQWebEditor.FileSaveAs(Sender: TObject);
begin
  if SaveDialog.Execute then
    begin
      if FileExists(SaveDialog.FileName) then
        // 'Do you wish to overwrite %s?'
        if MessageDlg(Format(IQMS.Common.ResStrings.cTXT0000114, [SaveDialog.FileName]),
          mtConfirmation, mbYesNoCancel) <> idYes then
          Exit;
      if FIsImage then
        Image1.Picture.Bitmap.SaveToFile(SaveDialog.FileName)
      else
        RTF.Lines.SaveToFile(SaveDialog.FileName);
      SetFileName(SaveDialog.FileName);
      FModified := FALSE;
      SetModifiedStatus(FModified);

    end;
end;

procedure TFrmIQWebEditor.FilePrint(Sender: TObject);
var
  Line: Integer;
  PrintText: TextFile;
begin
//  if PrintDialog.Execute then
//    begin
//      if FIsImage then
//        PrintImage(Image1.Picture.Bitmap, FFileName) // in IQBMP
//      else
//        begin
//          RTF.PrintJobName := FFileName;
//          RTF.Print(FFileName);
//        end;
//    end;
end;

procedure TFrmIQWebEditor.FileExit(Sender: TObject);
begin
  Close;
end;

procedure TFrmIQWebEditor.EditUndo(Sender: TObject);
begin
  with RTF do
    if HandleAllocated then
      SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TFrmIQWebEditor.EditRedo1Click(Sender: TObject);
begin
//  with RTF do
//    if HandleAllocated then
//      SendMessage(Handle, EM_REDO, 0, 0);
end;

procedure TFrmIQWebEditor.EditCut(Sender: TObject);
begin
//  RTF.CutToClipboard;
end;

procedure TFrmIQWebEditor.EditCopy(Sender: TObject);
begin
//  RTF.CopyToClipboard;
end;

procedure TFrmIQWebEditor.EditPaste(Sender: TObject);
var
  ATempRTF: TRichEdit;
begin
  // we do this to prevent insert bad characters
  try
    ATempRTF := TRichEdit.Create(Self);
    try
      ATempRTF.Parent := Self;
      ATempRTF.Visible := FALSE;
      ATempRTF.PasteFromClipboard;



      // ** This doesn't work ** //
      // Although ATempRTF may contain the formatted text,
      // now copy it to RTF through streaming.  Any problems should
      // be caught in the process.
      // iqrtf.CopyRTFToRTF(ATempRTF, RTF);

      // I'm hoping to catch any problems by using ATempRTF,
      // and error out before I get here
//      RTF.PasteFromClipboard;

    finally
      if Assigned(ATempRTF) then
        FreeAndNil(ATempRTF);
    end;
  except
    on E: Exception do
      IQError('Cannot paste text.  Invalid format.');
  end;
end;

procedure TFrmIQWebEditor.HelpContents(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TFrmIQWebEditor.HelpSearch(Sender: TObject);
const
  EmptyString: PChar = '';
begin
  Application.HelpCommand(HELP_PARTIALKEY, Longint(EmptyString));
end;

procedure TFrmIQWebEditor.HelpHowToUse(Sender: TObject);
begin
  Application.HelpCommand(HELP_HELPONHELP, 0);
end;

procedure TFrmIQWebEditor.SelectFont(Sender: TObject);
begin
//  FontDialog1.Font.Assign(RTF.SelAttributes);
//  if FontDialog1.Execute then
//    CurrText.Assign(FontDialog1.Font);
//  RTF.SetFocus;
end;

procedure TFrmIQWebEditor.BoldButtonClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  if sbtnBold.Down then
    CurrText.Style := CurrText.Style + [fsBold]
  else
    CurrText.Style := CurrText.Style - [fsBold];
end;

procedure TFrmIQWebEditor.ItalicButtonClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  if sbtnItalic.Down then
    CurrText.Style := CurrText.Style + [fsItalic]
  else
    CurrText.Style := CurrText.Style - [fsItalic];
end;

procedure TFrmIQWebEditor.edtFontSizeChange(Sender: TObject);
begin
//  if FUpdating then
//    Exit;
//  CurrText.Size := udFontSize.Position;
//  RTF.Modified := TRUE;
end;

procedure TFrmIQWebEditor.AlignButtonClick(Sender: TObject);
begin
//  if FUpdating then
//    Exit;
//  RTF.Paragraph.Alignment := TAlignment(TControl(Sender).Tag - 100);
end;

procedure TFrmIQWebEditor.cmbFontNameChange(Sender: TObject);
begin
  if FUpdating then
    Exit;
  CurrText.Name := cmbFontName.Items[cmbFontName.ItemIndex];
//  RTF.Modified := TRUE;
  RTF.SetFocus;
  cmbFontName.Text := CurrText.Name;
end;

procedure TFrmIQWebEditor.UnderlineButtonClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
  if sbtnUnderline.Down then
    CurrText.Style := CurrText.Style + [fsUnderline]
  else
    CurrText.Style := CurrText.Style - [fsUnderline];
end;

procedure TFrmIQWebEditor.sbtnBulletsClick(Sender: TObject);
begin
  if FUpdating then
    Exit;
//  RTF.Paragraph.Numbering := TNumberingStyle(sbtnBullets.Down);
end;

{ Ruler Indent Dragging }

procedure TFrmIQWebEditor.RulerItemMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragOfs := (TUniImage(Sender).Width div 2);
  TUniImage(Sender).Left := TUniImage(Sender).Left + X - FDragOfs;
  FDragging := TRUE;
end;

procedure TFrmIQWebEditor.RulerItemMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if FDragging then
    TUniImage(Sender).Left := TUniImage(Sender).Left + X - FDragOfs
end;

procedure TFrmIQWebEditor.FirstIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := FALSE;
//  RTF.Paragraph.FirstIndent := Trunc((FirstInd.Left + FDragOfs - GutterWid) /
//    RulerAdj);
  LeftIndMouseUp(Sender, Button, Shift, X, Y);
  Update;
end;

procedure TFrmIQWebEditor.LeftIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := FALSE;
//  RTF.Paragraph.LeftIndent := Trunc((LeftInd.Left + FDragOfs - GutterWid) /
//    RulerAdj) - RTF.Paragraph.FirstIndent;
  SelectionChange(Sender);
  Update;
end;

procedure TFrmIQWebEditor.RightIndMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := FALSE;
//  RTF.Paragraph.RightIndent :=
//    Trunc((Ruler.ClientWidth - RightInd.Left + FDragOfs - 2) / RulerAdj) - 2 *
//    GutterWid;
  SelectionChange(Sender);
  Update;
end;

procedure TFrmIQWebEditor.EditSelectAll1Click(Sender: TObject);
begin
//  RTF.SelectAll;
end;

procedure TFrmIQWebEditor.InsertFile1Click(Sender: TObject);

  procedure _insert_file( AFileName: string );
  var
    AStream: TStream;
  begin
    AStream:= TFileStream.Create( AFileName, fmOpenRead or fmShareDenyWrite );
    try
//      RTF.PutRTFSelection( AStream );
    finally
      AStream.Free;
    end;
  end;

begin
  with OpenDialog do
    if Execute then
      begin
        if FileIsImage(OpenDialog.FileName) then
          begin
            // 'Cannot insert a bitmap file into an open text document.'#13 +
            // 'Use Open File instead.'
            IQWarning(IQMS.Common.ResStrings.cTXT0000115);
            Exit;
          end;

          _insert_file( OpenDialog.FileName );
      end;
end;

procedure TFrmIQWebEditor.PrintButtonClick(Sender: TObject);
begin
//  RTF.Print(FFileName);
end;

procedure TFrmIQWebEditor.EditFind1Click(Sender: TObject);
begin
  ResetSearch;
//  with RTF do
//    if SelLength > 0 then
//      FindDialog1.FindText := Copy(Text, SelStart + 1, SelLength);
//
//  FindDialog1.Execute;
end;

procedure TFrmIQWebEditor.EditReplace1Click(Sender: TObject);
begin
//  ReplaceDialog1.FindText := RTF.SelText;
//  ReplaceDialog1.Execute;
end;

procedure TFrmIQWebEditor.ResetSearch;
begin
  FSearchStartPos := 0;
  FSearchOptions := [];
  FSearchLast := '';
end;

procedure TFrmIQWebEditor.FindDialog1Find(Sender: TObject);
var
  i: Integer;
  Options: TSearchTypes;
  S: string;
begin
//  S := FindDialog1.FindText;
//
//  Options := [];
//  if frMatchCase in FindDialog1.Options then
//    Options := Options + [stMatchCase];
//
//  if frWholeWord in FindDialog1.Options then
//    Options := Options + [stWholeWord];
//
//  if (FSearchOptions <> Options) or (FSearchLast <> FindDialog1.FindText) then
//    ResetSearch;

//  with RTF do
//    i := FindText(S, FSearchStartPos, GetTextLen - FSearchStartPos, Options);

  with RTF do
    if i > 0 then
      begin
        RTF.SetFocus;
//        RTF.SelStart := i;
//        RTF.SelLength := Length(S);
      end
    else
      // '"%s" not found.'
      IQMS.Common.Dialogs.IQInformation(Format(IQMS.Common.ResStrings.cTXT0000116, [S]));

//  if i > 0 then
//    FSearchStartPos := i + Length(FindDialog1.FindText);
//  FSearchOptions := Options;
//  FSearchLast := FindDialog1.FindText;
end;

procedure TFrmIQWebEditor.sbtnFindClick(Sender: TObject);
var
  S: string;
begin
//  if RTF.SelLength > 0 then
//    S := Copy(RTF.Text, RTF.SelStart + 1, RTF.SelLength);

//  if Length(FindDialog1.FindText) = 0 then
//    EditFind1Click(Sender)
//
//  else if FSearchLast <> S then
//    begin
//      FindDialog1.FindText := S;
//      FindDialog1Find(Sender);
//    end
//  else
//    begin
//      Inc(FSearchStartPos);
//      FindDialog1Find(Sender);
//    end;
end;

procedure TFrmIQWebEditor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TFrmIQWebEditor.CheckImage;
begin
  if FIsImage then
    EnableImage
  else
    EnableRichEdit;
end;

procedure TFrmIQWebEditor.EnableRichEdit;
begin
  EnableControlsFor(dcRTF);
end;

procedure TFrmIQWebEditor.EnableImage;
begin
  EnableControlsFor(dcImage);
end;

procedure TFrmIQWebEditor.EnableControlsFor(ADocType: TDocType);
var
  i: Integer;
begin

  PnlRTF.Visible := ADocType = dcRTF; // show the editor
  PnlImage.Visible := ADocType = dcImage; // show the image

  // Toolbars and Vcl.Menus
  PnlToolbarFormat.Visible := PnlRTF.Visible;
  InsertFile1.Enabled := PnlRTF.Visible;
  InsertPicture1.Enabled := PnlImage.Visible;

  PnlEditUndo.Visible := PnlRTF.Visible;
  PnlEditCopy.Visible := PnlRTF.Visible;
  pnlToolbarImage.Visible := PnlImage.Visible;

  for i := 0 to MainMenu.Items.Count - 1 do
    if MainMenu.Items[i].Tag > 100 then
      MainMenu.Items[i].Enabled := PnlRTF.Visible;

  FormatStretchImage1.Enabled := PnlImage.Visible;
end;

procedure TFrmIQWebEditor.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmIQWebEditor.ExpandImageArea(AExpand: Boolean);
begin
  // Adjust the image area for stretch, center or ... not

  if AExpand then
    begin
      Image1.Align := alClient;
      Image1.AutoSize := TRUE;
    end
  else
    begin
      Image1.Align := alNone;
      Image1.Top := 0;
      Image1.Left := 0;
      Image1.AutoSize := TRUE;
    end;
end;

procedure TFrmIQWebEditor.FormatStretchImage1Click(Sender: TObject);
var
  b: Boolean;
begin
  b := not Image1.Stretch;

  // Set the stretch property
  Image1.Stretch := b;

  // Now adjust the image
  ExpandImageArea(Image1.Stretch or Image1.Center);
end;

procedure TFrmIQWebEditor.FormatCenterImage1Click(Sender: TObject);
var
  b: Boolean;
begin
  b := not Image1.Center;

  // Set the center property
  Image1.Center := b;

  // Now adjust the image
  ExpandImageArea(Image1.Stretch or Image1.Center);
end;

procedure TFrmIQWebEditor.PImagePopup(Sender: TObject);
begin
  FormatStretchImage2.Checked := Image1.Stretch;
end;

procedure TFrmIQWebEditor.SaveAndClose1Click(Sender: TObject);
begin
  FileSave(nil);
  Close;
end;

procedure TFrmIQWebEditor.SetStatus(S: string; APanel: Integer);
begin
  StatusBar.Panels[APanel].Text := S;
  StatusBar.Update;
end;

procedure TFrmIQWebEditor.StatusBarResize(Sender: TObject);
begin
  { if FFormActive = FALSE then
    Exit;
    StatusBar.Panels[0].Width := StatusBar.ClientWidth -
    (StatusBar.Panels[1].Width + StatusBar.Panels[2].Width + StatusBar.Panels
    [3].Width); }
end;

procedure TFrmIQWebEditor.RTFChange(Sender: TObject);
begin
  FModified := TRUE;
  SetModifiedStatus(FModified);
end;

function TFrmIQWebEditor.GetWordCount: Integer;
var
  AList: TStringList;
begin
  try
    AList := TStringList.Create;
    AList.CommaText := RTF.Text;
    result := AList.Count;
  finally
    if Assigned(AList) then
      FreeAndNil(AList);
  end;
end;

procedure TFrmIQWebEditor.ToolsWordCount1Click(Sender: TObject);
begin
  IQInformation(IQFormat(IQMS.Common.ResStrings.cTXT0000119 { 'Word Count: %d' } ,
    [WordCount]));
end;

procedure TFrmIQWebEditor.RTFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // IQInformation( IntToStr( Key ));
  if (ssCtrl in Shift) and (Key = VK_RETURN) then
    begin
      Key := 0;
      SaveAndClose1Click(nil);
    end;
  if (Key = VK_ESCAPE) then
    begin
      Key := 0;
      FileExit(nil);
    end;
  // Increase font
  if (ssCtrl in Shift) and (Key = 221) then
    begin
      if FUpdating then
        Exit;
      Key := 0;
//      with RTF do
//        if SelText > '' then
//          begin
//            CurrText.Size := CurrText.Size + 1;
//            udFontSize.Position := CurrText.Size;
//            Modified := TRUE;
//          end;
    end;
  // Decrease font
  if (ssCtrl in Shift) and (Key = 219) then
    begin
      if FUpdating then
        Exit;
      Key := 0;
      with RTF do
//        if SelText > '' then
//          begin
//            CurrText.Size := CurrText.Size - 1;
//            udFontSize.Position := CurrText.Size;
//            Modified := TRUE;
//          end;
    end;

  // Insert Date
  if (Key = VK_F5) then
    begin
      if FUpdating then
        Exit;
      Key := 0;
//      RTF.SelText := FormatDateTime('t ddddd', Now());
    end;

  SetControls;
  SetColLineStatus;
  SetCharacterCountStatus;
end;

procedure TFrmIQWebEditor.SetCharacterCountStatus;
var
  ATotalCount, ASelStart: Integer;
begin
  ATotalCount := Length(RTF.Text);
//  ASelStart := RTF.SelStart;
  SetStatus(Format('Character Count: %d [%d]', [ATotalCount, ASelStart]), 0);
end;

procedure TFrmIQWebEditor.SetColLineStatus;
var
  ALine, ACol: string;
begin
  Application.ProcessMessages;
//  ALine := PadR(IQFormat('Ln %d', [RTF.CaretPos.Y + 1]), 10);
//  // IQString, IQMS.Common.Strings,  IQNLS
//  ACol := PadR(IQFormat('Col %d', [RTF.CaretPos.X + 1]), 10); // IQString, IQMS.Common.Strings, IQNLS

  SetStatus(Format('%s%s', [ALine, ACol]), 1);
end;

procedure TFrmIQWebEditor.SetModifiedStatus(const AModified: Boolean);
begin
  if not AModified then
    SetStatus('', 1)
  else
    // 'Modified'
    SetStatus(IQMS.Common.ResStrings.cTXT0000047, 2);
end;

procedure TFrmIQWebEditor.ReplaceDialog1Replace(Sender: TObject);

var
  ASelPos, ACount: Integer;
  ASource: string;
  AMatchCase: Boolean;
  ASearchTypes: TSearchTypes;
  AFindText: string;
begin
  begin
    if ReplaceDialog1.Execute then
      begin
        AFindText := ReplaceDialog1.FindText;
        // Originally added for debugging text issues:
        // AFindText := System.SysUtils.StringReplace(AFindText, '^t', #9, [rfReplaceAll, rfIgnoreCase]);
        // AFindText := System.SysUtils.StringReplace(AFindText, '^p', #13, [rfReplaceAll, rfIgnoreCase]);
        // AFindText := System.SysUtils.StringReplace(AFindText, '^w', #32, [rfReplaceAll, rfIgnoreCase]);
        // AFindText := System.SysUtils.StringReplace(AFindText, '^^', '^', [rfReplaceAll, rfIgnoreCase]);

        if (frMatchCase in ReplaceDialog1.Options) then
          ASearchTypes := [stMatchCase];
        if (frWholeWord in ReplaceDialog1.Options) then
          ASearchTypes := ASearchTypes + [stWholeWord];
        if frReplace in ReplaceDialog1.Options then
          begin
//            ASelPos := RTF.FindText(AFindText, RTF.SelStart, RTF.GetTextLen,
//              ASearchTypes);
//            if ASelPos > - 1 then
//              begin
//                RTF.SelStart := ASelPos;
//                RTF.SelLength := Length(AFindText);
//                RTF.SelText := ReplaceDialog1.ReplaceText;
//              end;
          end
        else if frReplaceAll in ReplaceDialog1.Options then
          begin
//            RTF.SelStart := 0;
            ACount := 0;
            ASelPos := 1;
            while ASelPos > 0 do
              begin
                // ASelPos := Pos( FindText, RTF.Lines.Text );
//                ASelPos := RTF.FindText(AFindText, RTF.SelStart, RTF.GetTextLen,
//                  ASearchTypes);
//                if ASelPos > - 1 then
//                  begin
//                    RTF.SelStart := ASelPos;
//                    RTF.SelLength := Length(AFindText);
//                    RTF.SelText := ReplaceDialog1.ReplaceText;
//                    if ASelPos > 0 then
//                      Inc(ACount);
//                  end;
//                if RTF.SelStart = RTF.GetTextLen then
//                  BREAK;
              end;
            // 'IQEditor has completed its search of the document and has made %d replacements.'
            IQInformation(IQFormat(IQMS.Common.ResStrings.cTXT0000120, [ACount]));
          end;
      end;
  end;
end;

procedure TFrmIQWebEditor.ReplaceDialog1Show(Sender: TObject);
begin
//  ReplaceDialog1.FindText := RTF.SelText;
end;

procedure TFrmIQWebEditor.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmIQWebEditor.UpperCase1Click(Sender: TObject);
begin
//  RTF.SelText := UpperCase(RTF.SelText);
end;

procedure TFrmIQWebEditor.LowerCase1Click(Sender: TObject);
begin
 // RTF.SelText := LowerCase(RTF.SelText);
end;

procedure TFrmIQWebEditor.ProperCase1Click(Sender: TObject);
begin
 // RTF.SelText := ProperCase(RTF.SelText);
end;

procedure TFrmIQWebEditor.sbtnDecreaseIndentClick(Sender: TObject);
begin
//  if RTF.Paragraph.FirstIndent > 0 then
//    begin
//      RTF.Paragraph.FirstIndent := RTF.Paragraph.FirstIndent - 30;
//      // GetTextWidthPixels( Ruler.Font, Repl( #30, 12 ), Self );
//      SelectionChange(Sender);
//    end;
end;

procedure TFrmIQWebEditor.sbtnIncreaseIndentClick(Sender: TObject);
begin
//  RTF.Paragraph.FirstIndent := RTF.Paragraph.FirstIndent + 30;
//  // GetTextWidthPixels( Ruler.Font, Repl( #30, 12 ), Self );
  SelectionChange(Sender);
end;

//procedure TFrmIQWebEditor.PnlRulerFrameResize(Sender: TObject);
//begin
//  if FFormActive = FALSE then
//    Exit;
//  Buffer2.Left := (PnlRulerFrame.ClientWidth - Buffer2.Width) + 1;
//  Update;
//end;

procedure TFrmIQWebEditor.FormatBold1Click(Sender: TObject);
begin
  if FUpdating then
    Exit;
  sbtnBold.Down := not sbtnBold.Down;
  BoldButtonClick(Sender);
end;

procedure TFrmIQWebEditor.FormatItalic1Click(Sender: TObject);
begin
  if FUpdating then
    Exit;
  sbtnItalic.Down := not sbtnItalic.Down;
  ItalicButtonClick(Sender);
end;

procedure TFrmIQWebEditor.FormatUnderline1Click(Sender: TObject);
begin
  if FUpdating then
    Exit;
  sbtnUnderline.Down := not sbtnUnderline.Down;
  UnderlineButtonClick(Sender);
end;

function TFrmIQWebEditor.DefaultFontName(var ASize: Integer): string;
const
  FONT_NAME_CALIBRI: string = 'Calibri';
  FONT_NAME_TAHOMA: string = 'Tahoma';
  FONT_NAME_ARIAL: string = 'Arial';
  FONT_NAME_TIMES_NEW_ROMAN: string = 'Times New Roman';
  FONT_NAME_DEFAULT: string = 'Courier New';
begin
  ASize := 10;

  if Screen.Fonts.IndexOf(FONT_NAME_CALIBRI) > - 1 then
    begin
      result := FONT_NAME_CALIBRI;
      ASize := 11;
    end
  else if Screen.Fonts.IndexOf(FONT_NAME_TIMES_NEW_ROMAN) > - 1 then
    begin
      result := FONT_NAME_TIMES_NEW_ROMAN;
      ASize := 12;
    end
  else if Screen.Fonts.IndexOf(FONT_NAME_ARIAL) > - 1 then
    begin
      result := FONT_NAME_ARIAL;
    end
  else if Screen.Fonts.IndexOf(FONT_NAME_TAHOMA) > - 1 then
    begin
      result := FONT_NAME_TAHOMA;
    end
  else
    result := FONT_NAME_DEFAULT;
end;

procedure TFrmIQWebEditor.ClearFormatting;
var
  ASize: Integer;
begin
  CurrText.Style := [];
  CurrText.Name := DefaultFontName(ASize);
  CurrText.Size := ASize;
  CurrText.Color := clWindowText;
//  RTF.Paragraph.FirstIndent := 0;
//  RTF.Paragraph.LeftIndent := 0;
//  RTF.Paragraph.RightIndent := 0;
end;

procedure TFrmIQWebEditor.ClearFormatting1Click(Sender: TObject);
begin
  if FUpdating then
    Exit;

//  if (RTF.SelLength = 0) and
//    not IQConfirmYN('Clear formatting in entire document?') then
//    Exit;

  ClearFormatting;

end;

procedure TFrmIQWebEditor.SetControls;
begin

  // Left processes finish first
  Application.ProcessMessages;

  with RTF do
    if Visible then
      try
        FUpdating := TRUE;

        // Update paragraph indicators
//        with Paragraph do
//          begin
//            FirstInd.Left := Trunc(FirstIndent * RulerAdj) - 4 + GutterWid;
//            LeftInd.Left := Trunc((LeftIndent + FirstIndent) * RulerAdj) - 4 +
//              GutterWid;
//            RightInd.Left := Ruler.ClientWidth - 6 -
//              Trunc((RightIndent + GutterWid) * RulerAdj);
//
//            // Paragraph alignment
//            case Ord(Alignment) of
//              0:
//                sbtnLeftAlign.Down := TRUE;
//              1:
//                sbtnRightAlign.Down := TRUE;
//              2:
//                sbtnCenterAlign.Down := TRUE;
//            end;
//
//            // Bullets
//            FormatBullets1.Checked := Boolean(Numbering);
//            sbtnBullets.Down := FormatBullets1.Checked
//
//          end;
//
//        // Update Font formating Vcl.Buttons
//        FormatBold1.Checked := fsBold in RTF.SelAttributes.Style;
//        FormatItalic1.Checked := fsItalic in RTF.SelAttributes.Style;
//        FormatUnderline1.Checked := fsUnderline in RTF.SelAttributes.Style;
//
        sbtnBold.Down := FormatBold1.Checked;
        sbtnItalic.Down := FormatItalic1.Checked;
        sbtnUnderline.Down := FormatUnderline1.Checked;

        // Font name and size
        // edtFontSize.Text := IntToStr(RTF.SelAttributes.Size);
//        udFontSize.Position := RTF.SelAttributes.Size;
//        cmbFontName.ItemIndex := cmbFontName.Items.IndexOf
//          (RTF.SelAttributes.Name);

        // Disable controls if RTF is read only
        IQEnableControl([FormatBold1, sbtnBold, FormatItalic1, sbtnItalic,
          FormatUnderline1, sbtnUnderline, edtFontSize, edtFontSize, cmbFontName,
          FormatBullets1, sbtnBullets], not RTF.ReadOnly);

        // Undo and Redo
//        EditUndo1.Enabled := RTF.CanUndo and not RTF.ReadOnly;
        EditRedo1.Enabled := RTFCanRedo and not RTF.ReadOnly;

        sbtnUndo.Enabled := EditUndo1.Enabled;
        sbtnRedo.Enabled := EditRedo1.Enabled;

      finally
        FUpdating := FALSE;
      end;

  if Self.Image1.Visible then
    begin
      sbtnStretchImage.Down := Image1.Stretch;
      sbtnCenterImage.Down := Image1.Center;
    end;

end;

function TFrmIQWebEditor.RTFCanRedo: Boolean;
begin
//  with RTF do
//    result := SendMessage(Handle, EM_CANREDO, 0, 0) <> 0;
end;

procedure TFrmIQWebEditor.FontColorMenuClick(Sender: TObject);
var
  AColor: Longint;
begin
  AColor := 0;
  if not (TComponent(Sender) is TUniMenuItem) then
    Exit;
  with TUniMenuItem(Sender) do
    begin
      AColor := Tag;
    end;
  if AColor = - 1 then
    begin
      with ColorDialog1 do
//        if Execute then
//          CurrText.Color := Color;
    end
  else
    CurrText.Color := AColor;
end;

procedure TFrmIQWebEditor.DoInsertPicture(Sender: TObject);
begin
  with OpenPictureDialog1 do
    if Execute then
      begin
        FIsImage := TRUE;
        CheckImage;
        Image1.Picture.Bitmap.LoadFromFile(OpenPictureDialog1.FileName);
        ImageModified := TRUE;
      end;
end;

procedure TFrmIQWebEditor.DoOnShowHint(var HintStr: string; var CanShow: Boolean;
  var HintInfo: THintInfo);
begin
  with HintInfo do
    if HintControl = sbtnStretchImage then
      begin
        HintStr := sIIf(Image1.Stretch,
          IQMS.Common.ResStrings.cTXT0000117 { 'Shrink Image' } ,
          IQMS.Common.ResStrings.cTXT0000118 { 'Stretch Image' } );
      end;
end;

procedure TFrmIQWebEditor.HighlightSelText(AColor: TColor);
//var
//  Format: CHARFORMAT2;
begin
//  if RTF.SelLength = 0 then
//    Exit;
//  FillChar(Format, SizeOf(Format), 0);
//  with Format do
//    begin
//      cbSize := SizeOf(Format);
//      dwMask := CFM_BACKCOLOR;
//      crBackColor := AColor;
//      RTF.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@Format));
//      RTF.SelLength := 0;
//    end;
end;

procedure TFrmIQWebEditor.HighlightColorClick(Sender: TObject);
var
  AColor: Longint;
begin
  AColor := 0;

  if not (TComponent(Sender) is TUniMenuItem) then
    Exit;
  with TUniMenuItem(Sender) do
    begin
      AColor := Tag;
    end;

  if AColor = - 1 then
    begin
      with ColorDialog1 do
//        if Execute then
//          HighlightSelText(AColor);
    end
  else
    HighlightSelText(AColor);

end;

procedure TFrmIQWebEditor.sbtnHighlightClick(Sender: TObject);
begin
///  IQMS.Common.Controls.PopupMenuFor(sbtnHighlight, PHighlight); // iqctrl
end;

procedure TFrmIQWebEditor.sbtnFontColorClick(Sender: TObject);
begin
//  IQMS.Common.Controls.PopupMenuFor(sbtnFontColor, PFontColor); // iqctrl
end;

procedure TFrmIQWebEditor.SetCharFormat(ACharacterFormat: TCharacterFormat);
//var
  // The CHARFORMAT structure contains information about
  // character formatting in a rich edit control.
//  ACurFormat: TCharFormat;
begin

//  Application.ProcessMessages;

//  if RTF.SelLength = 0 then
//    Exit;

//  FillChar(ACurFormat, SizeOf(ACurFormat), 0);

//  with ACurFormat do
//    begin
//      cbSize := SizeOf(ACurFormat);
//      dwMask := CFM_OFFSET;
//
//      // Character offset, in twips, from the baseline.
//      // If the value of this member is positive,
//      // the character is a superscript;
//      // if it is negative, the character is a subscript.
//      case ACharacterFormat of
//        CFM_Superscript:
//          yOffset := 60;
//        CFM_Subscript:
//          yOffset := - 60;
//        CFM_Normal:
//          yOffset := 0;
//      end;
//    end;
//
//  // The EM_SETCHARFORMAT message sets character formatting in a rich edit control.
//  // SCF_SELECTION: Applies the formatting to the current selection
//  RTF.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@ACurFormat));
//
//  { if ACurFormat.yOffset = 0 then
//    CurrText.Size := CurrText.Size + 2 // restore
//    else
//    CurrText.Size := CurrText.Size - 2; // shrink }

end;

function TFrmIQWebEditor.GetCharFormat: TCharacterFormat;
//var
  // The CHARFORMAT structure contains information about
  // character formatting in a rich edit control.
//  ACurFormat: TCharFormat;
begin
  result := CFM_Normal;

//  if RTF.SelLength = 0 then
//    Exit;
//
//  FillChar(ACurFormat, SizeOf(ACurFormat), 0);
//
//  // SendMessage(RTF.Handle, EM_GETCHARFORMAT, 1, LongInt(@ACurFormat));
//  RTF.Perform(EM_GETCHARFORMAT, SCF_SELECTION, Longint(@ACurFormat));
//  if (ACurFormat.dwMask and CFM_OFFSET) <> 0 then
//    case ACurFormat.yOffset of
//      60:
//        result := CFM_Superscript;
//      - 60:
//        result := CFM_Subscript;
//      0:
//        result := CFM_Normal;
//    else
//      result := CFM_Normal;
//    end
//  else
//    result := CFM_Normal;
end;

procedure TFrmIQWebEditor.sbtnFormatCharFormatClick(Sender: TObject);
begin
//  IQMS.Common.Controls.PopupMenuFor(sbtnFormatCharFormat, PCharFormat);
end;

procedure TFrmIQWebEditor.DoCharFormatClick(Sender: TObject);
var
  ATag: Integer;
begin
  if Sender = nil then
    Exit;
  ATag := TComponent(Sender).Tag;

  case ATag of
    0:
      SetCharFormat(CFM_Normal);
    1:
      SetCharFormat(CFM_Superscript);
    2:
      SetCharFormat(CFM_Subscript);
  end;

end;

procedure TFrmIQWebEditor.miCheckSpellingClick(Sender: TObject);
//var
//  AText: string;
begin
//  AText := RTF.GetRTFText;
//  if CheckSpelling(AText, TRUE { AIsRTFFormat } ) then
//    begin
//      RTF.Clear;
//      RTF.SetRTFText(AText);
//    end;
end;

end.

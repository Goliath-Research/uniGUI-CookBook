unit qc_opendialog;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Winapi.ShellApi,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniRadioButton,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TQCDocUseMethod = ( qcdumNone, qcdumDirectUse, qcdumCopy, qcdumMove );
  TQCReplaceDocMethod = (qcrdmNone, qcrdmDelete, qcrdmKeep );

  TQCDocFileCargo = record
    UseMethod  : TQCDocUseMethod;
    SrcFileName: string;
    TrgFileName: string;
    Revision   : string;
    IsRenamed  : Boolean;
    ReplaceMethod: TQCReplaceDocMethod;
  end;

  TFrmQCDocFileOpenDialog = class(TUniForm)
    gbCurrent: TUniGroupBox;
    Label13: TUniLabel;
    Label14: TUniLabel;
    sbtnRename: TUniSpeedButton;
    edLibPath: TUniEdit;
    edCurrFileName: TUniEdit;
    gbSource: TUniGroupBox;
    Label15: TUniLabel;
    sbtnFind: TUniSpeedButton;
    Label16: TUniLabel;
    edSrcFileName: TUniEdit;
    edTrgFileName: TUniEdit;
    gbMethod: TUniGroupBox;
    rbtnCopy: TUniRadioButton;
    rbtnMove: TUniRadioButton;
    rbtnDirect: TUniRadioButton;
    OpenDialog1: TOpenDialog;
    sbtnScan: TUniSpeedButton;
    chkKeepReplacedDoc: TUniCheckBox;
    SR: TIQWebSecurityRegister;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edSrcFileNameChange(Sender: TObject);
    procedure sbtnFindClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure sbtnRenameClick(Sender: TObject);
    procedure sbtnScanClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FExternal_Doc_ID: Real;
    FDoc_Revision_ID: Real;
    FDoc_Repository_ID: Real;
    FDoc_Library_ID : Real;
    FDefaultExt     : string;
    FUseMethod      : TQCDocUseMethod;
    FDoc_Revision   : string;
    FLibPath        : string;
    FIsRenamed      : Boolean;
    FFileNameWindowProc: TWndMethod;
    procedure FileNameWindowProc(var Msg: TMessage);
    procedure FileNameDrop(var Msg: TWMDROPFILES);
    function GetFullCurrentFileName: string;
    procedure EnableRadioButtonsOnSourceFileNameChange;
    procedure SetLibPath(const Value: string);
    procedure SetExternal_Doc_ID(const Value: Real);
  public
    { Public declarations }
    FIsRepositoryKind: Boolean;
    class function DoShowModal( AExternal_Doc_ID: Real; var ADocFileCargo: TQCDocFileCargo ): Boolean;
    property Doc_Revision: string read FDoc_Revision write FDoc_Revision;
    property LibPath: string read FLibPath write SetLibPath;
    property External_Doc_ID: Real write SetExternal_Doc_ID;
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Numbers,
  IQMS.Common.Miscellaneous,
  IQMS.Qc_Doc.qc_doc_share,
  Variants,
  SI_Dialog,
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSecIns,
  IQMS.Common.Controls;

class function TFrmQCDocFileOpenDialog.DoShowModal( AExternal_Doc_ID: Real; var ADocFileCargo: TQCDocFileCargo ): Boolean;
var
  FrmQCDocFileOpenDialog: TFrmQCDocFileOpenDialog;
begin
  FrmQCDocFileOpenDialog := TFrmQCDocFileOpenDialog.Create( uniGUIApplication.uniApplication );
  with FrmQCDocFileOpenDialog do
  begin
    External_Doc_ID:= AExternal_Doc_ID;
    Result:= ShowModal = mrOK;
    if Result then with ADocFileCargo do
    begin
      UseMethod:= FUseMethod;
      SrcFileName:= edSrcFileName.Text;
      if FIsRepositoryKind then
         TrgFileName:= ExtractFileName(edTrgFileName.Text)
      else
         TrgFileName:= edTrgFileName.Text;
      Revision:= Doc_Revision;
      IsRenamed:= FIsRenamed;

      ReplaceMethod:= qcrdmNone;
      if chkKeepReplacedDoc.Enabled then
      begin
        // keep the original file if chkKeepReplacedDoc.Checked
        // or
        // EIQ-3955 Document Control - Assign File - Error if new and original file name are the same.
        // same file name as the source in case they want to overwrite it with the same file name from other location.
        if chkKeepReplacedDoc.Checked
           or
           IsSameFileNameDifferentFolders( SrcFileName, TrgFileName ) and FileExists(TrgFileName) then
          ReplaceMethod:= qcrdmKeep
        else
          ReplaceMethod:= qcrdmDelete;
      end;
    end;
  end;
end;

procedure TFrmQCDocFileOpenDialog.FormShow(Sender: TObject);
var
  A: Variant;
begin

  IQRegFormRead( self, [ self, chkKeepReplacedDoc ]);
  FFileNameWindowProc := gbSource.WindowProc;
  gbSource.WindowProc := FileNameWindowProc;
  DragAcceptFiles(gbSource.Handle, True);
  ForceForegroundWindowB( self.Handle );     {IQMS.Common.Controls.pas}

    FUseMethod:= qcdumNone;
  {Path and FileName}
  A:= SelectValueArrayFmt( 'select path, default_ext from doc_library where id = %f', [ FDoc_Library_ID ]);
  IQAssert(  VarArrayDimCount( A ) > 0, 'Unable to locate library ID = %s' + FloatToStr(FDoc_Library_ID));

  FLibPath:= A[ 0 ];
  if not FIsRepositoryKind then
     edLibPath.Text:= A[ 0 ]
  else
     edLibPath.Text:= 'Repository';
  FDefaultExt   := A[ 1 ];

  edCurrFileName.Text:=  SelectValueByID('filename', 'doc_revision', FDoc_Revision_ID);

  {Buttons}
  sbtnRename.Enabled:= edCurrFileName.Text > '';
  chkKeepReplacedDoc.Enabled:= (edCurrFileName.Text > '') and not FIsRepositoryKind and SR.Enabled['chkKeepReplacedDoc'];

  {RadioButtons}
  rbtnDirect.Enabled:= (LibPath = '') and not FIsRepositoryKind;
  rbtnCopy.Enabled  := (FIsRepositoryKind or (LibPath > '')) and SR.Enabled['rbtnCopy'];
  rbtnMove.Enabled  := FIsRepositoryKind or (LibPath > '');

  {Default Checked}
  if (LibPath > '') or FIsRepositoryKind then
     rbtnCopy.Checked:= TRUE
  else if not FIsRepositoryKind then
     rbtnDirect.Checked:= TRUE
  { TODO -oSanketG -cWebConvert : Need to revisit , dependent on IQSecIns}
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmQCDocFileOpenDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, chkKeepReplacedDoc ]);
end;

procedure TFrmQCDocFileOpenDialog.edSrcFileNameChange(Sender: TObject);
begin
  EnableRadioButtonsOnSourceFileNameChange;
end;

procedure TFrmQCDocFileOpenDialog.sbtnFindClick(Sender: TObject);
var
  ADefExt: string;
begin
  ADefExt := FDefaultExt;
  if Pos('.', ADefExt) > 0 then
    ADefExt := Copy(FDefaultExt, Pos('.', FDefaultExt) + 1, Length(FDefaultExt));

  with OpenDialog1 do
  begin
    if Filter = '' then
    begin
       if (ADefExt  > '') then
          Filter:= Format('%s files (*.%s)|*.%s|', [ UpperCase(ADefExt ), ADefExt, ADefExt ]);
       Filter:= Filter + 'All files (*.*)|*.*';
    end;

    if Execute then
    begin
      edSrcFileName.Text:= FileName;
      FIsRenamed        := FALSE;
    end
  end;
end;

function TFrmQCDocFileOpenDialog.GetFullCurrentFileName: string;
begin
  if LibPath = '' then
     Result:= edCurrFileName.Text
  else
     Result:= IncludeTrailingBackslash( LibPath ) + ExtractFileName( edCurrFileName.Text );
end;

procedure TFrmQCDocFileOpenDialog.EnableRadioButtonsOnSourceFileNameChange;
begin
  {reflect change in the target file name}
  if FIsRepositoryKind then
     edTrgFileName.Text:= ExtractFileName( edSrcFileName.Text )

  else if LibPath = '' then
     edTrgFileName.Text:= edSrcFileName.Text

  else
     edTrgFileName.Text:= IncludeTrailingBackslash( LibPath ) + ExtractFileName( edSrcFileName.Text );

  {Make Source file name red if does not exist}
  edSrcFileName.Font.Color:= IIf( FileExists(edSrcFileName.Text), clBlack, clRed ) or (FDoc_Repository_ID > 0 {exisitng repository});

  if LibPath = '' then
     EXIT;

  {if this file is in the library path allow to hook it up directly}
  rbtnDirect.Enabled:= IsFileInFolder( edSrcFileName.Text, LibPath );
  if rbtnDirect.Enabled then
     rbtnDirect.Checked:= TRUE;
  if not rbtnDirect.Enabled and rbtnDirect.Checked then
     rbtnCopy.Checked:= TRUE;

  {June-19-2006 if file is in the library directory disable copy and move}
   rbtnCopy.Enabled:= not IsFileInFolder( edSrcFileName.Text, LibPath );
   rbtnMove.Enabled:= not IsFileInFolder( edSrcFileName.Text, LibPath );
end;

procedure TFrmQCDocFileOpenDialog.btnOKClick(Sender: TObject);
begin
  {Validate}
  IQAssert( edTrgFileName.Text > '', 'Source/Target must be entered' );
  IQAssert( (FDoc_Repository_ID > 0) or FileExists(edSrcFileName.Text), 'Source File must exist' );
  if LibPath > '' then
     IQAssert( IsFileInFolder(edTrgFileName.Text, LibPath), 'File must be placed in the library folder');

  {Method used}
  if rbtnDirect.Checked then
     FUseMethod:= qcdumDirectUse
  else if rbtnCopy.Checked then
     FUseMethod:= qcdumCopy
  else if rbtnMove.Checked then
     FUseMethod:= qcdumMove
  else
     FUseMethod:= qcdumNone;  {s/n happen}

  ModalResult:= mrOK;
end;

procedure TFrmQCDocFileOpenDialog.sbtnRenameClick(Sender: TObject);
var
  S: string;
begin
  S:= GetFullCurrentFileName;
  if InputQuery('Rename File', 'Enter New File Name', S) and (S <> '') and not IsSameFiles( S, GetFullCurrentFileName ) then
  begin
    edSrcFileName.Text:= GetFullCurrentFileName;
    edTrgFileName.Text:= S;
    FIsRenamed        := TRUE;

    if (LibPath > '') and IsFileInFolder( edTrgFileName.Text, LibPath ) then
    begin
       rbtnDirect.Enabled:= TRUE;
       rbtnDirect.Checked:= TRUE;
    end;
  end;
end;

procedure TFrmQCDocFileOpenDialog.sbtnScanClick(Sender: TObject);
var
  AParams: TScanParamCargo;
begin
  AParams.Doc_Library_ID:= FDoc_Library_ID;
  AParams.CanChangeLib  := FALSE;
  AParams.FileName      := ExtractFileName( edSrcFileName.Text );  {send just the file name if entered (w/o the path)}

  if TFrmScanImageDialog.DoShowModal(AParams ) then {SI_Dialog.pas}
     edSrcFileName.Text:= AParams.FileName;
end;

procedure TFrmQCDocFileOpenDialog.SetExternal_Doc_ID(const Value: Real);
begin

  {IDs}
  FExternal_Doc_ID := Value;
  FDoc_Library_ID := SelectValueByID('doc_library_id', 'external_doc', FExternal_Doc_ID);
  FDoc_Revision_ID:= SelectValueFmtAsFloat('select id from doc_revision where external_doc_id = %f and NVL(hist, ''N'') = ''N''', [ FExternal_Doc_ID ]);
  FDoc_Revision:= '0.9';
  if FDoc_Revision_ID > 0 then
     FDoc_Revision:= SelectValueByID('revision', 'doc_revision', FDoc_Revision_ID);
  FIsRepositoryKind:= CompareText(SelectValueFmtAsString('select upper(type) from doc_library where id = %f', [ FDoc_Library_ID ]), 'Repository') = 0;
  if FIsRepositoryKind then
     FDoc_Repository_ID:= SelectValueByID('doc_repository_id', 'doc_revision', FDoc_Revision_ID);
end;

procedure TFrmQCDocFileOpenDialog.SetLibPath(const Value: string);
begin
  FLibPath := Value;
end;

procedure TFrmQCDocFileOpenDialog.FileNameWindowProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_DROPFILES then
    FileNameDrop(TWMDROPFILES(Msg))
  else
    FFileNameWindowProc(Msg);
end;

procedure TFrmQCDocFileOpenDialog.FileNameDrop(var Msg: TWMDROPFILES);
const
  c_size: Integer = 255;
var
  i, ACount: Integer;
  PName: PChar;
  AFileName: String;
begin
  // Do not allow if not in edit mode.
  if not edSrcFileName.Visible or not edSrcFileName.Enabled or
    not sbtnFind.Enabled then
    Exit;

  // This method enables drag and drop with the Windows Explorer
  inherited;

  ACount := DragQueryFile(Msg.Drop, $FFFFFFFF, PName, c_size);
  if ACount > 1 then
    raise Exception.Create('Only one file may be added.');

  PName := StrAlloc(c_size);
  DragQueryFile(Msg.Drop, 0, PName, c_size);
  AFileName := StrPas(PName);
  edSrcFileName.Text := AFileName;
  FIsRenamed := FALSE;
  StrDispose(PName);
  DragFinish(Msg.Drop);
end;

end.

unit qc_opendialog_multi;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  DB,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  StdCtrls,
  DBCtrls,
  ExtCtrls,
  IQMS.Common.JumpConstants,
  qc_opendialog,
  Menus,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TQCDocFileCargoObject = class
    SrcFileName: string;
    TrgFileName: string;
    UseMethod  : TQCDocUseMethod;
    Revision   : string;
    constructor Create( ASrcFileName, ATrgFileName: string; AUseMethod  : TQCDocUseMethod; ARevision: string );
  end;


  TFrmQCDocFileOpenDialogMulti = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGridFiles: TIQUniGridControl;
    SrcFiles: TDataSource;
    QryFiles: TFDQuery;
    QryFilesSRC_FILENAME: TStringField;
    QryFilesTRG_FILENAME: TStringField;
    QryFilesUSE_METHOD: TStringField;
    wwDBComboBoxMethod: TUniDBComboBox;
    OpenDialog1: TOpenDialog;
    wwDBComboDlgSrcFileName: TUniEdit;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Shape4: TUniPanel;
    QryFilesREVISION: TStringField;
    PopupMenu1: TUniPopupMenu;
    AssignUseMethodToCopy1: TUniMenuItem;
    AssignUseMethodToMove1: TUniMenuItem;
    Label13: TUniLabel;
    Panel2: TUniPanel;
    edLibPath: TUniEdit;
    AssignUseMethodToDirect1: TUniMenuItem;
    procedure QryFilesUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure QryFilesBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure btnOKClick(Sender: TObject);
    procedure wwDBComboDlgSrcFileNameCustomDlg(Sender: TObject);
    procedure wwDBGridFilesCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure wwDBComboBoxMethodDropDown(Sender: TObject);
    procedure wwDBComboBoxMethodCloseUp(Sender: TUniDBComboBox;
      Select: Boolean);
    procedure QryFilesNewRecord(DataSet: TDataSet);
    procedure AssignUseMethod(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FDoc_Library_ID: Real;
    FLibPath       : string;
    FDefaultExt    : string;
    FLibType: string;
    procedure Validate;
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure AssignFileName(AFileName: string; AIsEditMode: Boolean);
    procedure SetTablesActive;
    function GetFullTrgFileName: string;
    function IsRepositoryKind: Boolean;
    procedure AssignUseMethodTo(AMethod: string);
    procedure SetDoc_Library_ID(const Value: Real);
  public
    { Public declarations }
    class function DoShowModal( ADoc_Library_ID: Real; var AFilesList: TList ): Boolean;
    procedure PopulateFileList(var AFilesList: TList);
    property Doc_Library_ID: Real write SetDoc_Library_ID;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Qc_Doc.qc_doc_share,
  IQMS.Common.Controls;


{ TQCDocFileCargoObject }

constructor TQCDocFileCargoObject.Create( ASrcFileName, ATrgFileName: string; AUseMethod  : TQCDocUseMethod; ARevision: string );
begin
  SrcFileName:= ASrcFileName;
  TrgFileName:= ATrgFileName;
  UseMethod  := AUseMethod;
  Revision   := ARevision;
end;


{ TFrmQCDocFileOpenDialogMulti }

class function TFrmQCDocFileOpenDialogMulti.DoShowModal(ADoc_Library_ID: Real; var AFilesList: TList): Boolean;
var
  FrmQCDocFileOpenDialogMulti: TFrmQCDocFileOpenDialogMulti;
begin
  FrmQCDocFileOpenDialogMulti :=  TFrmQCDocFileOpenDialogMulti.Create( uniGUIApplication.uniApplication );
  with FrmQCDocFileOpenDialogMulti do
  begin
    Doc_Library_ID:= ADoc_Library_ID;
    Result:= ShowModal = mrOK;
    if Result then
       PopulateFileList( AFilesList );
  end;
end;


procedure TFrmQCDocFileOpenDialogMulti.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGridFiles ]);
end;

procedure TFrmQCDocFileOpenDialogMulti.SetDoc_Library_ID(const Value: Real);
begin
  FDoc_Library_ID := Value;
end;

procedure TFrmQCDocFileOpenDialogMulti.SetTablesActive;
begin
  IQSetTablesActive( TRUE, self );

  {get rid of the records that are used for design time in Delphi}
  while not (QryFiles.Eof and QryFiles.Bof) do
    QryFiles.Delete;
end;

procedure TFrmQCDocFileOpenDialogMulti.UniFormShow(Sender: TObject);
var
  A: Variant;
begin
  SetTablesActive;
  IQRegFormRead( self, [ self, wwDBGridFiles ]);

  {Path and FileName}
  A:= SelectValueArrayFmt( 'select path, default_ext, type from doc_library where id = %f', [ FDoc_Library_ID ]);
  IQAssert(  VarArrayDimCount( A ) > 0, 'Unable to locate library ID = %s' + FloatToStr(FDoc_Library_ID));

  FLibType:= A[ 2 ];
  if not IsRepositoryKind and (A[ 0 ] <> '') then
     FLibPath:= IncludeTrailingBackslash(A[ 0 ]);
  FDefaultExt:= A[ 1 ];
  if not IsRepositoryKind then
     edLibPath.Text:= FLibPath
  else
     edLibPath.Text:= 'Repository';

  with OpenDialog1 do
  begin
    if Filter = '' then
    begin
       if (FDefaultExt  > '') then
          Filter:= Format('%s files (*.%s)|*.%s|', [ UpperCase(FDefaultExt ), FDefaultExt, FDefaultExt ]);
       Filter:= Filter + 'All files (*.*)|*.*';
    end;
  end;
end;

procedure TFrmQCDocFileOpenDialogMulti.QryFilesUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  AAction := eaApplied;
end;

procedure TFrmQCDocFileOpenDialogMulti.QryFilesBeforePost(DataSet: TDataSet);
begin
  Validate;
end;

procedure TFrmQCDocFileOpenDialogMulti.Validate;
begin
  IQAssert( FileExists( QryFilesSRC_FILENAME.asString ), Format('Source file %s does not exist.', [ QryFilesSRC_FILENAME.asString ]));
end;

procedure TFrmQCDocFileOpenDialogMulti.wwDBComboDlgSrcFileNameCustomDlg(
  Sender: TObject);
begin
  //PostMessage( Handle, iq_Notify, 1, 0);    {IQMS.Common.JumpConstants.pas}
end;

procedure TFrmQCDocFileOpenDialogMulti.DBNavigator1BeforeAction(
  Sender: TObject; Button: TNavigateBtn);
begin
  // if Button = nbRefresh then with TFDQuery(TDBNavigator(Sender).DataSource.DataSet) do
  // begin
  //   if State <> dsBrowse then
  //      Cancel;
  //   RefreshDataSetByID( TFDQuery(TDBNavigator(Sender).DataSource.DataSet));
  //   ABORT;
  // end;

  if Button = nbInsert then with TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet) do
  begin
     //PostMessage( self.Handle, iq_Notify, 0, 0);    {IQMS.Common.JumpConstants.pas}
     ABORT;
  end;
end;

procedure TFrmQCDocFileOpenDialogMulti.IQNotify(var Msg: TMessage);
var
  I: Integer;
begin
  with OpenDialog1 do
  begin
    if Msg.WParam = 0 then
       Options:= Options + [ ofAllowMultiSelect ]
    else
       Options:= Options - [ ofAllowMultiSelect ];

    if Execute then
      for I:= 0 to Files.Count - 1 do
        AssignFileName( Files[ I ], Msg.WParam = 1 );
  end;
end;

procedure TFrmQCDocFileOpenDialogMulti.AssignFileName( AFileName: string; AIsEditMode: Boolean );
begin
  if AIsEditMode then
     QryFiles.Edit
  else
     QryFiles.Append;

  {source file name}
  QryFilesSRC_FILENAME.asString:= AFileName;

  {reflect change in the target file name}
  if IsRepositoryKind then
     QryFilesTRG_FILENAME.asString:= ExtractFileName( AFileName )
  else if FLibPath = '' then
     QryFilesTRG_FILENAME.asString:= AFileName
  else
     QryFilesTRG_FILENAME.asString:= IncludeTrailingBackslash( FLibPath ) + ExtractFileName( AFileName );

  if IsRepositoryKind then
     QryFilesUSE_METHOD.asString:= 'D'
  else
     QryFilesUSE_METHOD.asString:= 'C';

  QryFiles.Post;
end;

function TFrmQCDocFileOpenDialogMulti.GetFullTrgFileName: string;
begin
  if Trim(QryFilesTRG_FILENAME.asString) = '' then
     Result:= ''
  else if FLibPath = '' then
     Result:= QryFilesTRG_FILENAME.asString
  else
     Result:= IncludeTrailingBackslash( FLibPath ) + ExtractFileName( QryFilesTRG_FILENAME.asString );
end;

procedure TFrmQCDocFileOpenDialogMulti.wwDBComboBoxMethodDropDown(Sender: TObject);
begin
  if IsRepositoryKind then with wwDBComboBoxMethod.Items do
  begin
    Clear;
    // Add( 'Direct'#9'D' );
    Add( 'Copy'#9'C' );
    Add( 'Move'#9'M' );
    EXIT;
  end;

  if FLibPath = '' then
     EXIT;

  with wwDBComboBoxMethod.Items do
  begin
    Clear;
    if FileExists( GetFullTrgFileName ) then
       Add( 'Direct'#9'D' );
    Add( 'Copy'#9'C' );
    Add( 'Move'#9'M' );
  end;
end;

procedure TFrmQCDocFileOpenDialogMulti.wwDBComboBoxMethodCloseUp(Sender: TUniDBComboBox; Select: Boolean);
begin
  with wwDBComboBoxMethod.Items do
  begin
    Clear;
    Add( 'Direct'#9'D');
    Add( 'Copy'#9'C'  );
    Add( 'Move'#9'M'  );
  end;
end;

procedure TFrmQCDocFileOpenDialogMulti.wwDBGridFilesCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  if (Field = QryFilesSRC_FILENAME) and (Field.asString > '') and not FileExists( Field.asString ) then
     case Highlight of
       TRUE:
         begin
           ABrush.Color:= clBlack;
           AFont.Color := clRed;
         end;
       FALSE:
         begin
           ABrush.Color:= clRed;
           AFont.Color := clWhite;
         end;
     end;
end;

procedure TFrmQCDocFileOpenDialogMulti.btnOKClick(Sender: TObject);
begin
  // Validate
  IQAssert( not (QryFiles.Eof and QryFiles.Bof), 'No file(s) assigned - unable to continue.' );

  with QryFiles do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      if (QryFilesUSE_METHOD.asString = 'D') and not IsRepositoryKind then
         IQAssert( FileExists( GetFullTrgFileName ), Format('Invalid use of method ''Direct'' is requested for %s, operation aborted.', [ QryFilesSRC_FILENAME.asString ]));
      Next;
    end;
  finally
    EnableControls;
  end;


  ModalResult:= mrOK;
end;

procedure TFrmQCDocFileOpenDialogMulti.PopulateFileList( var AFilesList: TList );

  function StrToQCDocUseMethod( S: string ): TQCDocUseMethod;  {qc_opendialog.pas}
  begin
    if S = 'D' then
       Result:= qcdumDirectUse
    else if S = 'C' then
       Result:= qcdumCopy
    else if S = 'M' then
       Result:= qcdumMove
    else
       Result:= qcdumNone
  end;

begin
  ClearListOfObjects( AFilesList );  {IQMS.Common.Controls.pas}

  with QryFiles do
  try
    DisableControls;
    First;
    while not Eof do
    begin
      AFilesList.Add( TQCDocFileCargoObject.Create( QryFilesSRC_FILENAME.asString,
                                                    QryFilesTRG_FILENAME.asString,
                                                    StrToQCDocUseMethod( QryFilesUSE_METHOD.asString ),
                                                    Trim( QryFilesREVISION.asString )));
      Next;
    end;
  finally
    EnableControls;
  end;
end;




procedure TFrmQCDocFileOpenDialogMulti.QryFilesNewRecord(
  DataSet: TDataSet);
begin
  with DataSet do
    FieldByName('revision').asString:= '0.9';
end;

function TFrmQCDocFileOpenDialogMulti.IsRepositoryKind: Boolean;
begin
  Result:= CompareText( FLibType, 'Repository' ) = 0;
end;

procedure TFrmQCDocFileOpenDialogMulti.PopupMenu1Popup(Sender: TObject);
begin
  AssignUseMethodToCopy1.Enabled  := not IsRepositoryKind;
  AssignUseMethodToMove1.Enabled  := not IsRepositoryKind;
  AssignUseMethodToDirect1.Enabled:= TRUE;
  // AssignUseMethodToDirect1.Enabled:= IsRepositoryKind
  //                                    or
  //                                    (FLibPath = '');
end;

procedure TFrmQCDocFileOpenDialogMulti.AssignUseMethod(Sender: TObject);
var
  AMethod: string;
begin
  if Sender = AssignUseMethodToCopy1 then
     AMethod:= 'C'
  else if Sender = AssignUseMethodToMove1 then
     AMethod:= 'M'
  else if Sender = AssignUseMethodToDirect1 then
     AMethod:= 'D'
  else
     EXIT;

  AssignUseMethodTo( AMethod );
end;

procedure TFrmQCDocFileOpenDialogMulti.AssignUseMethodTo( AMethod: string );
label
  NextRecord;
begin
  QryFiles.First;
  while not QryFiles.Eof do with QryFiles do
  begin
    // special check for Direct
    if (AMethod = 'D') then
       if not ( IsRepositoryKind
                or
                (FLibPath = '')
                or
                (FLibPath > '') and IsFileInFolder( QryFilesTRG_FILENAME.asString, FLibPath )
                                and IsSameFiles( QryFilesTRG_FILENAME.asString, QryFilesSRC_FILENAME.asString )) then
        goto NextRecord;

    Edit;
    QryFilesUSE_METHOD.asString:= AMethod;
    Post;

    NextRecord:
    Next;
  end;

  QryFiles.First;
end;

end.


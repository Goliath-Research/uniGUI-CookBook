unit qc_doc_CompFilesSetup;

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
  StdCtrls,
  Grids,
  DBGrids,
  Menus,
  DBCtrls,
  DB,
  Wwdbigrd,
  Wwdbgrid,
  ExtCtrls,
  wwcheckbox,
  IQMS.WebVcl.CaptionPanel,
  Buttons,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniGUIFrame, IQUniGrid;

type
  TFrmFileCmprSetup = class(TUniForm)
    edFile1: TUniEdit;
    edFile2: TUniEdit;
    btnCompare: TUniButton;
    GroupBox2: TUniGroupBox;
    OpenDialog1: TOpenDialog;
    Label2: TUniLabel;
    Label3: TUniLabel;
    srcDoc_Compare: TDataSource;
    tblDoc_Compare: TFDTable;
    tblDoc_CompareID: TBCDField;
    tblDoc_CompareFILE_EXT: TStringField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    tblDoc_CompareCOMMAND: TStringField;
    sbtnSelectFileName1: TUniSpeedButton;
    sbtnSelectFileName2: TUniSpeedButton;
    CaptionPanel1: TIQWebCaptionPanel;
    wwDBGrid1: TIQUniGridControl;
    wwDBComboBox1: TUniDBComboBox;
    OpenDialog2: TOpenDialog;
    popmGrid: TUniPopupMenu;
    FindExecutable1: TUniMenuItem;
    procedure btnTestCompareClick(Sender: TObject);
    procedure btnSelectFileName1Click(Sender: TObject);
    procedure btnSelectFileName2Click(Sender: TObject);
    procedure tblDoc_CompareBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure wwDBComboBox1DropDown(Sender: TObject);
    procedure FindExecutable1Click(Sender: TObject);
    procedure wwDBGrid1ColEnter(Sender: TObject);
  private
    { Private declarations }
    FUseSelectedCommand:Boolean;

    function GetFileNamePath: String;
    procedure LocateCmdForFileExt(AFile_Ext: String);
    procedure CheckFileCompToolExists;
  public
    { Public declarations }
    procedure CompareFiles(AFileName1, AFileName2: String);
  end;

  procedure FrmFileCmprSetupShowModal;

implementation

{$R *.dfm}

uses
  Clipbrd,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Web.MicrosoftWord.Utils,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg;


procedure FrmFileCmprSetupShowModal;
var
  LFrmFileCmprSetup : TFrmFileCmprSetup;
begin
  LFrmFileCmprSetup := TFrmFileCmprSetup.Create(UniGUIApplication.UniApplication);
  with LFrmFileCmprSetup do
  begin
    ShowModal;
  end;
end;

procedure TFrmFileCmprSetup.LocateCmdForFileExt( AFile_Ext: String );
var
  AExt:string;
begin
  AExt:= RightStr( AFile_Ext, Length(AFile_Ext) - Pos('.', AFile_Ext) );

  with tblDoc_Compare do
  begin
    First;
    if not Locate('FILE_EXT', AExt, [loCaseInsensitive]) then
       if not Locate('FILE_EXT', '*', [loCaseInsensitive]) then
         raise Exception.CreateFmt('File type ''%s'' is not setup with a file comparing application.', [AExt]);
  end;
end;

procedure TFrmFileCmprSetup.CheckFileCompToolExists;
begin
  IQAssert( tblDoc_Compare.RecordCount > 0,
      'No file comparison application is setup. Please associate a file extension with an application first.' );
end;

procedure TFrmFileCmprSetup.CompareFiles( AFileName1, AFileName2: String );
var
  ACmd:string;
begin
  IQAssert( FileExists(AFileName1), Format('File - %s - Not Found. Please Select a File.', [AFileName1]) );
  IQAssert( FileExists(AFileName2), Format('File - %s - Not Found. Please Select a File.', [AFileName2]) );
  CheckFileCompToolExists;

  {In FileComp Setup window we use the record they have selected in wwGrid instead of trying to locate a match}
  if not FUseSelectedCommand then
    LocateCmdForFileExt( ExtractFileExt(AFileName1) );

  ACmd:= tblDoc_Compare.FieldByName('COMMAND').asString;

  Screen.Cursor:= crHourGlass;
  try
    if (ACmd = 'Use Internal Comparison') and
      IQMS.Web.MicrosoftWord.Utils.IsMicrosoftWordInstalled then
      IQMS.Web.MicrosoftWord.Utils.CompareMSWordDocuments( AFileName2 {original file}, AFileName1{ revision} )  // 01-09-2013 AA
    else
      begin
        IQAssert( Pos('%FileName1%', ACmd) > 0, 'Unable to locate ''%FileName1%'' in cmd Line Syntax');
        ACmd:= StringReplace(ACmd, '%FileName1%', AFileName1, [rfReplaceAll]);

        IQAssert( Pos('%FileName2%', ACmd) > 0, 'Unable to locate ''%FileName2%'' in cmd Line Syntax');
        ACmd:= StringReplace(ACmd, '%FileName2%', AFileName2, [rfReplaceAll]);

        try
          // Launch Comparison App
          ExecuteProgramExB(ACmd, false); {IQMS.Common.Miscellaneous.pas}

        except on e: Exception do
          ShowMessage( Format('Error Executing File Comparison Program. '#13'%s'#13'%s', [ACmd, e.Message]) );
        end;
      end;

  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TFrmFileCmprSetup.btnTestCompareClick(Sender: TObject);
begin
  CheckFileCompToolExists;
  FUseSelectedCommand:= true;
  try
    CompareFiles(edFile1.Text, edFile2.Text);
  finally
    FUseSelectedCommand:= false;
  end;
end;

function TFrmFileCmprSetup.GetFileNamePath: String;
var
  AFileExt:String;
begin
  with OpenDialog1 do
  begin
    AFileExt:= tblDOC_COMPARE.FieldByName('FILE_EXT').AsString;
    Filter  := Format('*.%s|*.%s', [AFileExt, AFileExt]);
    if Execute then
      Result:= OpenDialog1.FileName;
  end;
end;

procedure TFrmFileCmprSetup.btnSelectFileName1Click(Sender: TObject);
var
  FileName: string;
begin
  CheckFileCompToolExists;
  FileName:= GetFileNamePath;
  if Length( FileName ) > 0 then
    edFile1.Text:= FileName;
end;

procedure TFrmFileCmprSetup.btnSelectFileName2Click(Sender: TObject);
var
  FileName: string;
begin
  CheckFileCompToolExists;
  FileName:= GetFileNamePath;
  if Length( FileName ) > 0 then
    edFile2.Text:= FileName;
end;

{-------------------------------------------------------------------------------}

procedure TFrmFileCmprSetup.tblDoc_CompareBeforePost(DataSet: TDataSet);
begin
  tblDoc_CompareFILE_EXT.Value:= StrAfterDot(Trim(tblDoc_CompareFILE_EXT.asString));
  IQAssignIDBeforePost(DataSet);  {pas}
end;

procedure TFrmFileCmprSetup.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self ); {pas}
end;

procedure TFrmFileCmprSetup.wwDBComboBox1DropDown(Sender: TObject);
begin
  wwDBComboBox1.Items.Clear;
  if CompareText( tblDoc_CompareFILE_EXT.asString, 'DOC') = 0 then
  begin
     wwDBComboBox1.Items.Clear;
     wwDBComboBox1.Items.Add( 'Use Internal Comparison'        );
     wwDBComboBox1.Items.Add( '"" "%FileName1%" "%FileName2%"' );
  end
  else
    wwDBComboBox1.Items.Text:= '"" "%FileName1%" "%FileName2%"';
end;

procedure TFrmFileCmprSetup.FindExecutable1Click(Sender: TObject);
begin
  with OpenDialog2 do
    if Execute then
    begin
      Clipboard.AsText:= FileName;
      IQConfirm('The executable name including path has been placed in your clipboard.'#13'Use Ctrl-V to paste it anywhere you wish inside ''Command Line Execution Syntax'' column.');
    end;
end;

procedure TFrmFileCmprSetup.wwDBGrid1ColEnter(Sender: TObject);
begin
{ TODO : grid doesn't have the property SelectedField }
 { with wwDBGrid1 do
    if (SelectedField = tblDoc_CompareCOMMAND) and (Length(SelectedField.Text) = 0) then
      wwDBComboBox1.DropDown;  }
end;

end.

unit OraDirectorySetup;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
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
  uniMemo,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniPageControl, Vcl.Controls;

type
  TFrmOraDirectorySetup = class(TUniForm)
    PC: TUniPageControl;
    TabSet: TUniTabSheet;
    Panel7: TUniPanel;
    Splitter2: TUniSplitter;
    Panel9: TUniPanel;
    sbtnUNCDir: TUniSpeedButton;
    edUNCPath: TUniEdit;
    Panel10: TUniPanel;
    Panel11: TUniPanel;
    Splitter3: TUniSplitter;
    Panel12: TUniPanel;
    edLocalPath: TUniEdit;
    Panel13: TUniPanel;
    Memo1: TUniMemo;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    sbtnLocalDir: TUniSpeedButton;
    procedure sbtnUNCDirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure sbtnLocalDirClick(Sender: TObject);
  private
    FLocalDirColumnName: String;
    FUNCDirColumnName: String;
    function GetLocalDir: String;
    function GetUNCDir: String;
    procedure SetLocalDir(const Value: String);
    procedure SetUNCDir(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    class procedure Execute(  AUNCDirColumnName, ALocalDirColumnName:String);
    property UNCDirColumnName:String read FUNCDirColumnName write FUNCDirColumnName;
    property LocalDirColumnName:String read FLocalDirColumnName write FLocalDirColumnName;
    property UNCDir:String read GetUNCDir;
    property LocalDir:String read GetLocalDir;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Directory ,
  IQMS.Common.DataLib;

class procedure TFrmOraDirectorySetup.Execute(  AUNCDirColumnName, ALocalDirColumnName: String);
begin
  with self.Create(uniGUIApplication.UniApplication) do
  begin
    UNCDirColumnName  := AUNCDirColumnName;
    LocalDirColumnName:= ALocalDirColumnName;

    ShowModal;
  end;
end;

procedure TFrmOraDirectorySetup.sbtnUNCDirClick(Sender: TObject);
var
  ADir:String;
begin
  ADir:= edUNCPath.Text;
  if DirBrowse( ADir, 'Dir. UNC Path' ) then
    edUNCPath.Text:= ADir;
end;

procedure TFrmOraDirectorySetup.sbtnLocalDirClick(Sender: TObject);
var
  ADir:String;
begin
  ADir:= edLocalPath.Text;
  if DirBrowse( ADir, 'Dir. Local Path' ) then
    edLocalPath.Text:= ADir;
end;

function TFrmOraDirectorySetup.GetLocalDir: String;
begin
  Result:= SelectValueAsString('select ' + LocalDirColumnName + ' from iqsys2 where rownum < 2')
end;

function TFrmOraDirectorySetup.GetUNCDir: String;
begin
  Result:= SelectValueAsString('select ' + UNCDirColumnName + ' from iqsys2 where rownum < 2');
end;

procedure TFrmOraDirectorySetup.SetLocalDir(const Value: String);
begin
  ExecuteCommandFmt('update iqsys2 set ' + LocalDirColumnName + '  = ''%s''', [Value]);
end;

procedure TFrmOraDirectorySetup.SetUNCDir(const Value: String);
begin
  ExecuteCommandFmt('update iqsys2 set ' + UNCDirColumnName + '  = ''%s''', [Value]);
end;


procedure TFrmOraDirectorySetup.FormShow(Sender: TObject);
begin
  edUNCPath.Text  := UNCDir;
  edLocalPath.Text:= LocalDir;
end;

procedure TFrmOraDirectorySetup.btnOKClick(Sender: TObject);
begin
  SetLocalDir( edLocalPath.Text );
  SetUNCDir( edUNCPath.Text );
end;



end.

unit rmng_NewRelPath;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit;

type
  TFrmNewRelPath = class(TUniForm)
    Label1: TUniLabel;
    Edit1: TUniEdit;
    sbtnBrowse: TUniSpeedButton;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure sbtnBrowseClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    procedure CallBack(Sender: TComponent; AResult: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

function AssignNewRelPath( var APath: string ): Boolean;
  

implementation

{$R *.DFM}

uses
//  IQDir,
  MainModule,
  FileCtrl;

function AssignNewRelPath( var APath: string ): Boolean;
var
  aFrmNewRelPath : TFrmNewRelPath;
begin
  aFrmNewRelPath := UniMainModule.GetFormInstance(TFrmNewRelPath) as TFrmNewRelPath;
  with aFrmNewRelPath do
  begin
    Edit1.Text:= APath;
    Result:= (ShowModal = mrOk);
    if Result then
       APath:= Edit1.Text;
  end;
end;

procedure TFrmNewRelPath.CallBack(Sender: TComponent; AResult: Integer);
begin
  if AResult=mrYes then
   begin
     if not CreateDir( Edit1.Text ) then
            raise Exception.CreateFmt( 'Cannot create %s', [ Edit1.Text ])
        else
          ModalResult:= mrOK;
   end
   else
     ModalResult:= mrOK;
end;

procedure TFrmNewRelPath.sbtnBrowseClick(Sender: TObject);
var
  ADirectory: string;
begin
//  if DirBrowse( ADirectory, 'Select Directory for New Releases' ) then
//     Edit1.Text:= ADirectory;
end;

procedure TFrmNewRelPath.btnOKClick(Sender: TObject);
begin
  Edit1.Text:= Trim( Edit1.Text );
  if DirectoryExists( Edit1.Text ) then
     ModalResult:= mrOK
  else
   MessageDlg( Format('Directory ''%s'' is not found'#10#13'Would you like to create it now?' , [ Edit1.Text ]), mtWarning,[ mbYes, mbNo], callback)

end;

end.

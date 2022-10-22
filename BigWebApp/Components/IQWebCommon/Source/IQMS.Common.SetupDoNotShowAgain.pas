unit IQMS.Common.SetupDoNotShowAgain;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  IQMS.WebVcl.HeaderCheckListBox,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmSetupDoNotShowAgain = class(TUniForm)
    HeaderCheckListBox1: TIQWebHeaderCheckListBox;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
     FKeyNames: TStringList;
     procedure LoadKeyNames;
     function GetFormPath: string;
     procedure LoadValues;
     procedure SaveValues;
  protected
      { Protected declarations }
     property FormPath: string read GetFormPath;
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

procedure DoFrmSetupDoNotShowAgain;

var
  FrmSetupDoNotShowAgain: TFrmSetupDoNotShowAgain;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.Registry,
  IQMS.Common.Numbers,
  IQMS.Common.HelpHook;

procedure DoFrmSetupDoNotShowAgain;
begin
  TFrmSetupDoNotShowAgain.DoShowModal;
end;

procedure TFrmSetupDoNotShowAgain.FormCreate(Sender: TObject);
begin
  FKeyNames:= TStringList.Create;
  LoadKeyNames;
  LoadValues;
end;

class procedure TFrmSetupDoNotShowAgain.DoShowModal;
begin
  self.Create( uniGUIApplication.UniApplication ).ShowModal;
end;

procedure TFrmSetupDoNotShowAgain.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmSetupDoNotShowAgain.FormDestroy(Sender: TObject);
begin
  if Assigned(FKeyNames) then
    FKeyNames.Free;
end;

function TFrmSetupDoNotShowAgain.GetFormPath: string;
begin
 Result := IQMS.Common.RegFrm.GetDialogCheckBoxPath('');
end;

procedure TFrmSetupDoNotShowAgain.LoadKeyNames;
begin
  FKeyNames.Clear;
  with TIQWebRegistry.Create do
  try
    RootKey := HKEY_CURRENT_USER;
    if not OpenKey( FormPath, FALSE) then
       EXIT;
    GetKeyNames( FKeyNames );
  finally
    Free;
  end;
end;

procedure TFrmSetupDoNotShowAgain.LoadValues;
var
  I, j      : Integer;
  AMsg      : string;
  ADoNotShow: Integer;
begin
  with TIQWebRegistry.Create do
  try
    RootKey := HKEY_CURRENT_USER;

    for I:= 0 to FKeyNames.Count - 1 do
    begin
      AMsg    := '';
      ADoNotShow:= 0;

      if OpenKey( Format('%s\%s\Msg', [ FormPath, FKeyNames[ I ] ]),  FALSE ) then
         AMsg:= ReadString ( 'ScalarValue' );
      if OpenKey( Format('%s\%s\CheckBox', [ FormPath, FKeyNames[ I ] ]),  FALSE ) then
         ADoNotShow:= ReadInteger( 'Checked' );

      J:= HeaderCheckListBox1.Items.Add( Format('^%s^%s', [ FKeyNames[ I ], AMsg ]));
      HeaderCheckListBox1.Checked[ J ]:= not(ADoNotShow = 1);
    end;
  finally
    Free;
  end;
end;

procedure TFrmSetupDoNotShowAgain.btnOKClick(Sender: TObject);
begin
  SaveValues;
  Close;
end;

procedure TFrmSetupDoNotShowAgain.SaveValues;
var
  I: Integer;
begin
  with TIQWebRegistry.Create do
  try
    RootKey := HKEY_CURRENT_USER;
    for I:= 0 to FKeyNames.Count - 1 do
      if OpenKey( Format('%s\%s\CheckBox', [ FormPath, FKeyNames[ I ] ]),  FALSE ) then
         WriteInteger( 'Checked',  iIIf( HeaderCheckListBox1.Checked[ I ], 0, 1 ));
  finally
    Free;
  end;
end;


end.

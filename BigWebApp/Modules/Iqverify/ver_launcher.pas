unit ver_launcher;

interface

uses
  Vcl.Forms,
  Vcl.Buttons,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniGUIBaseClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton, System.Classes, Vcl.Controls;

type
  TFrmVerLauncher = class(TUniForm)
    sbtnIQVerify: TUniSpeedButton;
    procedure sbtnIQVerifyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmVerLauncher: TFrmVerLauncher;

implementation

{$R *.DFM}

uses
  ver_main_wiz;

procedure TFrmVerLauncher.sbtnIQVerifyClick(Sender: TObject);
begin
     //CheckDBModuleCreated; // DB_DM.pas
     TFrmVerMainWizard.DoEditIQVerify(1);
end;

end.

unit pra_launcher;

interface

uses
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, System.Classes, Vcl.Controls;

type
  TFrmPRALauncher = class(TUniForm)
    sbtnIQPRA: TUniSpeedButton;
    procedure sbtnIQPRAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPRALauncher: TFrmPRALauncher;

implementation

{$R *.DFM}

uses
  pra_main;

procedure TFrmPRALauncher.sbtnIQPRAClick(Sender: TObject);
begin
     CheckDBModuleCreated; // db_dm
     //DoPRA;
end;

end.

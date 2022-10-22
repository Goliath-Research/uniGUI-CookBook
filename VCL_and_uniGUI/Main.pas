unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniLabel,
  uniButton, unimMenu, uniMainMenu, Vcl.Menus;

type
  TMainForm = class(TUniForm)
    UniLabel1: TUniLabel;
    UniButton1: TUniButton;
    UnimMenu1: TUnimMenu;
    MainMenu1: TMainMenu;
    UniMainMenu1: TUniMainMenu;
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, Services;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
var
  txt : string;
begin
  txt := UniLabel1.Text;
  if GetOrModifySomeText(txt) then
    UniLabel1.Text := txt;
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  RegisterEverything;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
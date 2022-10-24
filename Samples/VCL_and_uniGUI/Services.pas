unit Services;

interface

  procedure RegisterEverything;
  function GetOrModifySomeText(var aText : string) : boolean;

implementation

uses
  System.SysUtils,
  Spring.Services,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIForm,
  Spring.Container,
  MainModule,
  Registration,
  _MyFormIntf;

procedure RegisterEverything;
begin
  RegisterForms;
end;

function GetOrModifySomeText(var aText : string) : boolean;
var
  MyForm: IMyForm;
begin
  MyForm := UniMainModule.Container.Resolve<IMyForm>;

  MyForm.SomeText := aText;

  Result := TUniForm(MyForm).ShowModal = mrOk;

  if Result then
    aText := MyForm.SomeText;
end;

end.

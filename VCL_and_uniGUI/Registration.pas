unit Registration;

interface

{$IFDEF UseVCL}
  procedure RegisterForms;
{$ELSE}
  procedure RegisterForms;
{$ENDIF}

implementation

uses
  Spring.Container,
{$IFDEF UseVCL}
  _MyFormVCL
{$ELSE}
  uniGUIApplication,
  MainModule,
  _MyFormIntf,
  _MyFormWeb
{$ENDIF}
  ;

{$IFDEF UseVCL}
procedure RegisterForms;
begin
  GlobalContainer.
    RegisterType<TMyFormVCL>.
    Implements<IMyForm>.
    AsTransient;

  GlobalContainer.Build;
end;
{$ELSE}
procedure RegisterForms;
begin
  uniMainModule.Container.
    RegisterType<TMyFormWeb>.
    Implements<IMyForm>.
    InjectConstructor([uniGUIApplication.UniApplication]).
    AsTransient;

  GlobalContainer.Build;
end;
{$ENDIF}

end.

unit IQWeb.Session.Registration;

interface

procedure RegSessionWeb;

implementation

uses
  Spring.Services,
  ServerModule,
  MainModule,
  uniGUIForm,
  uniGUIFrame,
  IQWeb.Server.Resources,
  IQWeb.Server.Registration,
//  IQWeb.Session.FrameworkServices,
  IQWeb.Session.RegServices;

procedure RegisterModules;
var
  FormDef : TFormDef;
begin
  for FormDef in uniServerModule.ServerRegistration.FormDefs.Values do
  begin
//    if FormDef.ModuleClass.InheritsFrom(TUniForm) or FormDef.ModuleClass.InheritsFrom(TUniFrame) then
//      UniMainModule.UserIQRegVar.RegisterModule(FormDef.ModuleClass, FormDef.Singleton);
  end;
end;

procedure RegSessionWeb;
begin
//  UniMainModule.UserIQRegVar := ServiceLocator.GetService<IIQSessionRegistration>;
//  UniMainModule.UserIQModel  := ServiceLocator.GetService<IIQFrameworkServices>;

  RegisterModules;

//  UniMainModule.UserContainer.Build;
end;

end.

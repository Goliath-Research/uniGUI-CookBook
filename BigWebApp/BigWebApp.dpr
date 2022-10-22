{$ifndef UNIGUI_VCL}
library
{$else}
program
{$endif}
   BigWebApp;

uses
  {$ifdef EUREKALOG7}
  EMemLeaks,
  {$endif }
  uniGUIISAPI,
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  LoginFrm in 'LoginFrm.pas' {UniLoginForm1: TUniLoginForm},
  IQWeb.Server.DataServices in 'Interfaces\IQWeb.Server.DataServices.pas',
  IQWeb.Session.RegServices in 'Interfaces\IQWeb.Session.RegServices.pas',
  IQWeb.Session.FrameworkServices in 'Interfaces\IQWeb.Session.FrameworkServices.pas',
  IQWeb.Session.ConnectionServices in 'Interfaces\IQWeb.Session.ConnectionServices.pas',
  IQWeb.Server.Resources in 'Registration\IQWeb.Server.Resources.pas',
  IQWeb.Server.Registration in 'Registration\IQWeb.Server.Registration.pas',
  IQWeb.Session.Registration in 'Registration\IQWeb.Session.Registration.pas',
  IQWeb.Server.DataServices.FireDAC in 'Implementations\IQWeb.Server.DataServices.FireDAC.pas',
  IQWeb.Session.FrameworkServices.FireDAC in 'Implementations\IQWeb.Session.FrameworkServices.FireDAC.pas',
  IQWeb.Session.RegServices.Default in 'Implementations\IQWeb.Session.RegServices.Default.pas',
  IQCore.Interfaces in 'FrameWork\IQCore.Interfaces.pas',
  IQCore.Obj in 'FrameWork\IQCore.Obj.pas',
  IQCore.Form in 'FrameWork\IQCore.Form.pas',
  IQCore.DataModule in 'FrameWork\IQCore.DataModule.pas',
  IQCore.Widget in 'FrameWork\IQCore.Widget.pas',
  IQCore.DataSet in 'FrameWork\IQCore.DataSet.pas',
  IQCore.Field in 'FrameWork\IQCore.Field.pas',
  IQCore.PickDataSet in 'FrameWork\IQCore.PickDataSet.pas',
  IQCore.PickList in 'FrameWork\IQCore.PickList.pas',
  IQCore.PickList.Item in 'FrameWork\IQCore.PickList.Item.pas',
  IQCore.PickTree in 'FrameWork\IQCore.PickTree.pas',
  IQCore.PickTree.Node in 'FrameWork\IQCore.PickTree.Node.pas',
  IQCore.Module in 'Framework\IQCore.Module.pas',
  IQCore.DM in 'FrameWork\IQCore.DM.pas' {IQCore_DM: TDataModule},
  PickListAdmin in 'Components\IQDialogs\PickListAdmin.pas' {PickListAdminForm: TUniForm},
  PickListAdmin.DM in 'Components\IQDialogs\PickListAdmin.DM.pas' {dmPickListAdmin: TDataModule},
  PickTreeAdmin in 'Components\IQDialogs\PickTreeAdmin.pas' {PickTreeAdminForm: TUniForm},
  PickTreeAdmin.DM in 'Components\IQDialogs\PickTreeAdmin.DM.pas' {dmPickTreeAdmin: TDataModule},
  ModulesAdmin in 'Components\IQDialogs\ModulesAdmin.pas' {ModulesAdminForm: TUniForm},
  ModulesAdmin.DM in 'Components\IQDialogs\ModulesAdmin.DM.pas' {dmModulesAdmin: TDataModule},
  FormsAdmin in 'Components\IQDialogs\FormsAdmin.pas' {FormsAdminForm: TUniForm},
  DataSetAdmin in 'Components\IQDialogs\DataSetAdmin.pas' {DataSetAdminForm: TUniForm},
  DataSetAdmin.DM in 'Components\IQDialogs\DataSetAdmin.DM.pas' {dmDataSetAdmin: TDataModule},
  ShipViaMaintenance in 'modules\ShipViaMaintenance\ShipViaMaintenance.pas' {UniShipViaMaintenance: TUniFrame},
  ShipViaMaintenance_DM in 'DataAccessLayer\ShipViaMaintenance\ShipViaMaintenance_DM.pas' {SVM_DM: TDataModule},
  IQMS.Common.Encrypt in 'Libraries\IQMS.Common.Encrypt.pas',
  IQMS.Common.Login in 'Libraries\IQMS.Common.Login.pas',
  IQMS.Common.StandardExceptions in 'Libraries\IQMS.Common.StandardExceptions.pas',
  IQMS.Common.Params in 'Libraries\IQMS.Common.Params.pas' {dummy place holder},
  Cap_MainDataModule in 'DataAccessLayer\Capacity\Cap_MainDataModule.Pas' {Cap_Main_DM: TDataModule},
  PromptModule in 'PromptModule.pas' {PromptModuleForm: TUniForm},
  LoadPromptModule in 'LoadPromptModule.pas' {LoadPromptForm: TUniForm},
  FrameWrapperFrm in 'FrameWrapperFrm.pas' {FrmFrameWrapper: TUniForm},
  TestReg in 'TestReg.pas',
  TestRegForms in 'TestRegForms.pas' {TestRegisteredForms: TUniForm},
  _dLoginForm in '_dLoginForm.pas' {dLoginForm: TUniLoginForm};

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;
{$else}
begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;
{$endif}
end.

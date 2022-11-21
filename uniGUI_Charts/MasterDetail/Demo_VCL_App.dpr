program Demo_VCL_App;

uses
  Vcl.Forms,
  Demo_VCL in 'Demo_VCL.pas' {DemoVCL},
  Demo_VCL_DataModule in 'Demo_VCL_DataModule.pas' {dmDemoVCL: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDemoVCL, DemoVCL);
  Application.CreateForm(TdmDemoVCL, dmDemoVCL);
  Application.Run;
end.

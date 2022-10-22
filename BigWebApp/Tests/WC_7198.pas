unit WC_7198;

interface

implementation

uses
  TestReg,
  System.Variants,
  iqsys_ccsettings,
  UniGUIApplication;

procedure TestConstructor;
var
  LFrm: TFrmCCSettings;
begin
  LFrm:= TFrmCCSettings.Create(UniGUIApplication.UniApplication);
  try
    LFrm.EPlantID := 1;
    LFrm.Show;
  finally
    //Free;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-7198', 'Iqsys ', 'FrmCCSettings', 'Create', TestConstructor);
end.

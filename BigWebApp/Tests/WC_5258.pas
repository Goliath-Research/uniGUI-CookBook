unit WC_5258;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  AssyGroup_Sandbox;

procedure TestDoShow;
begin
  TFrmAssyGroupSandbox.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-5258', 'AssyTrack', 'FrmAssyGroupSandbox', 'DoShow', TestDoShow);
end.

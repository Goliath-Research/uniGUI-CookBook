unit WC_7274;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  tl_project_types;

procedure TestTFrmTLProjectTypes;
begin
  TFrmTLProjectTypes.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-7274', 'Iqtool', 'tl_project_types', 'DoShow', TestTFrmTLProjectTypes);

end.

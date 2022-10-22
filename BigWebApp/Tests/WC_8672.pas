unit WC_8672;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TaDescr;

procedure TestTFrmTaDescrip;
begin
  DoTaPrepDescriptions;
end;

initialization
  TTestRepo.RegisterTest('WC-8672', 'Ta', 'TaDescr', 'DoTaPrepDescriptions', TestTFrmTaDescrip);
end.

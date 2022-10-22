unit WC_6415;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  RebateParam;

procedure TestRebateParam;
begin
  DoRebateParams;
end;

initialization

  TTestRepo.RegisterTest('WC-6415', 'IqRebate', 'FrmRebateParam', 'DoRebateParams', TestRebateParam);

end.

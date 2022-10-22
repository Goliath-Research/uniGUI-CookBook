unit WC_9010;

interface

implementation

uses
  TestReg,
  wo_firm_alloc,
  System.SysUtils;

procedure Test1;
begin
  TFrmWo_Firm_Alloc.DoShowModal(1);
end;

initialization

  TTestRepo.RegisterTest('WC_9010', 'Wrkorder', 'wo_firm_alloc', 'DoShowModal', Test1);

end.

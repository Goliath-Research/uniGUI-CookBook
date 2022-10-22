unit WC_5412;

interface

implementation

uses
  TestReg,
  MatXcpWO;

procedure Test1;
begin
  DoShowWorkorderMaterialExceptions(56995);
end;

initialization

TTestRepo.RegisterTest('WC-5412', 'Capacity', 'MatXcpWO', 'DoShowWorkorderMaterialExceptions', Test1, 1);

end.

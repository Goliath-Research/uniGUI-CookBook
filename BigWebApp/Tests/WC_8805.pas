unit WC_8805;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  TranAdjQtyOut;

procedure Test1;
begin
  DoShowModal(1,2);
end;

initialization

  TTestRepo.RegisterTest('WC-8805', 'Trans', 'TranAdjQtyOut', 'DoShowModal', Test1);

end.

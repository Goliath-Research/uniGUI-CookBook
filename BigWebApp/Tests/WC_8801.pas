unit WC_8801;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  TranAdjQtyIn;

procedure Test1;
begin
  TFrmTranAdjQtyIn.DoShowModal(1,2);
end;

initialization

  TTestRepo.RegisterTest('WC-8801', 'Trans', 'TranAdjQtyIn', 'DoShowModal', Test1);

end.

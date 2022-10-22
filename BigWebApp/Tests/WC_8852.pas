unit WC_8852;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  trans_enforce_lot_fifo;

procedure Test1;
var
 t:TEnforceLotFifo;
begin
  t:=TEnforceLotFifo.Create(2);
  t.Arinvt_ID:=1;
  TFrmTransEnforceLotFIFO.DoShowModal(t);
end;

initialization

  TTestRepo.RegisterTest('WC-8852', 'Trans', 'trans_enforce_lot_fifo', 'DoShowModal', Test1);

end.

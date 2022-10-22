unit WC_8490;

interface

implementation

uses
  TestReg,
  System.Variants,
  SchdPmeqmt;

procedure Test1;
begin
  TFrmSchdPmeqmt.DoShowModal( 44836 );
end;

initialization

  TTestRepo.RegisterTest('WC-8490', 'Sched', 'FrmSchdPmeqmt', 'DoShowModal', Test1);
end.

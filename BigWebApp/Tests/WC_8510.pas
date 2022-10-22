unit WC_8510;

interface

implementation

uses
  TestReg,
  System.Variants,
  schd_rt_info;

procedure Test1;
begin
  TFrmSchedRTInfo.DoShowModal( 3594 );
end;

initialization

  TTestRepo.RegisterTest('WC-8510', 'Sched ', 'FrmSchedRTInfo', 'DoShowModal', Test1);
end.

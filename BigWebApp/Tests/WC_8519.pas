unit WC_8519;

interface

implementation

uses
  TestReg,
  System.Variants,
  wo_conf_del_sched;

procedure Test1;
begin
  TFrmWOConfDelSched.DoShowModal( 122929 );
end;

initialization

  TTestRepo.RegisterTest('WC-8519', 'Sched', 'FrmWOConfDelSched', 'DoShowModal', Test1);
end.

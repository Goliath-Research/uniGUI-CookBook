unit WC_9008;

interface

implementation

uses
  TestReg,
  System.Variants,
  wo_conf_del;

procedure Test1;
begin
  TFrmWOConfDel.DoShowModal( 122929 );
end;

initialization

  TTestRepo.RegisterTest('WC-9008', 'Wrkorder', 'FrmWOConfDel', 'DoShowModal', Test1);
end.

unit WC_7961;

interface

implementation

uses
  TestReg,
  System.Variants,
  Downtime;

procedure Test1;

begin
  DoEditRTDownTime( 483198, 29169, 27-04-16, 1, nil );
end;

initialization

  TTestRepo.RegisterTest('WC-7961', 'Prod', 'FrmDown', 'DoEditRTDownTime', Test1);
end.

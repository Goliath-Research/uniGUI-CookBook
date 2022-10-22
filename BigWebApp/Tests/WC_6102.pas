unit WC_6102;

interface

implementation

uses
  TestReg,
  System.Variants,
  AvDtlREQ;

procedure Test1;
var
  AReference : TFrmFGAvailDetailReq;
begin
  DoCreate( 54673, 5/4/2002 );
end;

initialization

  TTestRepo.RegisterTest('WC-6102', 'Fgavail', 'FrmFGAvailDetailReq', 'DoCreate', Test1);
end.

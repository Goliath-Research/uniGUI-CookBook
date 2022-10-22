unit WC_7967;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  ProdAdd;

procedure Test1;
var
  myParams: TManualProdParams;
begin
  with myParams do
  begin
    ProdDate := Date;
    Shift    := 1;
    MfgCell  := '1';
  end;
  if DoAppendManualProd(nil,myParams) then
    Showmessage(myParams.Custno) else
    Showmessage('Cancelled');

end;

initialization

  TTestRepo.RegisterTest('WC-7967', 'Prod', 'ProdAdd', 'DoAppendManualProd', Test1, 1);

end.

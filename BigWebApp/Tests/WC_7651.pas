unit WC_7651;

interface

implementation

uses
  TestReg,
  SysUtils,
  DB,
  uniGUIDialogs,
  PR941tax;

procedure Test1;
var
  Src: TDataSource;
begin
  src:=TDataSource.Create(nil);
  src.Name:='Src17a';
  DoDisc941DetailTaxes(src);
end;

initialization

  TTestRepo.RegisterTest('WC-7651', 'Payroll', 'PR941tax', 'DoDisc941DetailTaxes', Test1, 1);

end.

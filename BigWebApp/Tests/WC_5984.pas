unit WC_5984;

interface

implementation

uses
  TestReg,
  Dsp_Cust,
  System.SysUtils,
  uniGUIApplication;

procedure Test1;
var
  Form: TFrmDispoCust;
begin
  Form := TFrmDispoCust.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-5984', 'Dispo', 'Dsp_Cust', 'FormCreate', Test1);
end.

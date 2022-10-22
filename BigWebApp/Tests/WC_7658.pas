unit WC_7658;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  PRGLdate;

procedure TestDoGetGLPrepostDate;
var
    aDate:TDateTime;
begin
  DoGetGLPrepostDate(aDate);
end;

initialization

  TTestRepo.RegisterTest('WC-7658', 'Payroll', 'PRGLdate', 'DoGetGLPrepostDate', TestDoGetGLPrepostDate);

end.

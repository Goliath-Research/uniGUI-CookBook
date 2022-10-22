unit WC_6328;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  VMI_Consume_SN_Hist;

procedure Test1;
begin
  TFrmConsumeVMI_SN_Hist.DoShow(838969);
end;

initialization

  TTestRepo.RegisterTest('WC-6328', 'Inv', 'VMI_Consume_SN_Hist', 'DoShow', Test1);

end.

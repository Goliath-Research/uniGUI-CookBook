unit WC_8207;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  q_batch_compare;

procedure Test1;
begin
  TFrmQ_Batch_Compare.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8207', 'Quote', 'q_batch_compare', 'DoShowModal', Test1, 1);

end.

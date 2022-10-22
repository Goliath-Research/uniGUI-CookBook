unit WC_8208;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  q_batch_print;

procedure Test1;
begin
  TFrmQ_Batch_Print.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8208', 'Quote', 'q_batch_print', 'DoShowModal', Test1, 1);

end.

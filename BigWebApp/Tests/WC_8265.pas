unit WC_8265;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  Rec_Labels;

procedure Test;
begin
  TFrmRecLabels.DoShowModal(593,TRUE);
end;

initialization

  TTestRepo.RegisterTest('WC-8265', 'Receive', 'Rec_Labels', 'DoShowModal', Test);

end.

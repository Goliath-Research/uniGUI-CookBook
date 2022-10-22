unit WC_8557;

interface

implementation

uses
  TestReg,
  sd_linked_labels;

procedure Test1;
begin
  TFrmSdLinkedLabels.DoShowModal(187242);
end;

initialization

  TTestRepo.RegisterTest('WC-8557', 'Shopdata', 'sd_linked_labels', 'DoShowModal', Test1);
end.

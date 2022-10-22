unit WC_6650;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  EdiEdit;

procedure Test;
begin
  DoShowEdiEdit(5);
end;

initialization

  TTestRepo.RegisterTest('WC-6650', 'Iqedi', 'EdiEdit', 'DoShowEdiEdit', Test);

end.

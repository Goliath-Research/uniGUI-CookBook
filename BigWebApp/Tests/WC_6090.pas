unit WC_6090;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FAB_Para;

procedure Test1;
begin
  TFrmFAB_Parameters.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-6090', 'Fabtrack', 'FAB_Para', 'DoShowModal', Test1, 1);

end.

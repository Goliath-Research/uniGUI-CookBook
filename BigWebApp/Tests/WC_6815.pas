unit WC_6815;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  M_Viewer_Setup;

procedure Test1;
begin
  TFrmM_ViewerSetup.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-6815', 'Iqmeter', 'M_Viewer_Setup', 'DoShowModal', Test1);
end.

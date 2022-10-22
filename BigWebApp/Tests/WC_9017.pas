unit WC_9017;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  wo_rework_dlg;

procedure Test1;
var
 Form: TFrmReworkDlg;
begin
   Form := TFrmReworkDlg.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-9017', 'Wrkorder', 'wo_rework_dlg', 'create', Test1);
end.

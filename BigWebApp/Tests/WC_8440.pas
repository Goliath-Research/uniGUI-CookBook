unit WC_8440;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  sal_comm_detail_dlg;

procedure Test1;
begin
  TFrmSalesCommDetailDlg.DoShowModal(5);
end;

initialization

  TTestRepo.RegisterTest('WC-8440', 'Salesmen', 'sal_comm_detail_dlg', 'DoShowModal', Test1);

end.

unit WC_8853;

interface

implementation

uses
  TestReg,
  SysUtils,
  MainModule,
  IQMS.Common.translotexpdatedlg;

procedure Test1;
begin
  TFrmTransLotExpDateDlg.DoShowModal(1,'2');
end;

initialization

  TTestRepo.RegisterTest('WC-8853', 'Trans', 'trans_lot_exp_date_dlg', 'DoShowModal', Test1);

end.

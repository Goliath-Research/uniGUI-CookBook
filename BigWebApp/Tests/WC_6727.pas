unit WC_6727;

interface

implementation

uses
  TestReg,
  fore_qk_data_entry;

procedure Test1;
var
  Fore_Head_ID: Real;
  Arinvt_ID:Real;
begin
  Fore_Head_ID := 20;
  Arinvt_ID := 148910 ;
  TFrmForeQuickDataEntry.DoShowModal(Fore_Head_ID, Arinvt_ID);
end;

initialization

  TTestRepo.RegisterTest('WC_6727', 'Iqforecast', 'fore_qk_data_entry', 'DoShowModal', Test1);

end.

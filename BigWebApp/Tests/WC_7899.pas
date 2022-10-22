unit WC_7899;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Prn_Tck_RF;

procedure Test1;
begin
  DoPrintPS_Ticket_ShippingLabel_Silent('1', '2', 'Label', 1, 0);
end;

initialization

  TTestRepo.RegisterTest('WC-7899', 'Print_Dialogs', 'Prn_Tck_RF', 'DoPrintPS_Ticket_ShippingLabel_Silent', Test1, 1);

end.

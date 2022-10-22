unit WC_7877;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Prn_CoC;

procedure Test1;
begin
 DoPrint_COC('test1','test2',False);
end;

initialization

  TTestRepo.RegisterTest('WC-7877', 'Print_Dialogs', 'Prn_CoC', 'DoPrint_COC', Test1, 1);

end.

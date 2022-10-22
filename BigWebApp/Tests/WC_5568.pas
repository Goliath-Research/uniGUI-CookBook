unit WC_5568;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniguiapplication,
  cc_sequences;

procedure Test1;
begin
  TFrmCCSequences.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-5568', 'Creditcard', 'cc_sequences', 'DoShow', Test1);

end.

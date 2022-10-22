unit WC_7817;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  POChkInv;

procedure TestCheckPODetail_Inv;
begin
  CheckPODetail_Inv( 6627, 147330, 19, 0 );
end;

initialization

  TTestRepo.RegisterTest('WC-7817', 'Po', 'POChkInv', 'CheckPODetail_Inv', TestCheckPODetail_Inv);

end.

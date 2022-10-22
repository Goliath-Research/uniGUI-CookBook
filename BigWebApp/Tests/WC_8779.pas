unit WC_8779;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  SearchLot;

procedure Test1;
var
    AIncludeArchived: Boolean;
    ArinvtId:real;
    ALotNo:String;
begin
   AIncludeArchived := True;
   ArinvtId := 147789;
   ALotNo := 'TEST';
   SearchForlot(AIncludeArchived,ArinvtId,ALotNo);
end;

initialization

  TTestRepo.RegisterTest('WC-8779', 'Tracking', 'SearchLot', 'SearchForlot', Test1);

end.

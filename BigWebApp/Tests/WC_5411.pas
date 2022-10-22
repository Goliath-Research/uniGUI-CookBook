unit WC_5411;

interface

implementation

uses
  TestReg,
  System.Variants,
  MReqFltr;

procedure Test1;
var
  AClass:string;
  AFrom, ATo: TDateTime;
  ADivision_ID, ABuyer_Code_ID: Real;
begin
  AClass := 'Injection';
  AFrom := 2-3-1997;
  ATo:= 4-2-2016;
  ADivision_ID := 54324;
  ABuyer_Code_ID := 32412;
  DoInvClassFilterMatReq( AClass, AFrom, ATo, ADivision_ID, ABuyer_Code_ID );
end;

initialization

  TTestRepo.RegisterTest('WC-5411', 'Capacity', 'FrmOutOfBal', 'DoShowModalDialogCheckBox', Test1);
end.

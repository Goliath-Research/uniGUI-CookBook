unit WC_5869;

interface

implementation

uses
  TestReg,
  System.Variants,
  DistCtr,
  DM_Cust;

procedure Test1;
var
  DM : TCust_DM;
begin
  try
    DM := TCust_DM.create(nil);
    DoDistStr( DM.SrcDistCtr );
  finally
    DM.free;
  end;

end;

initialization

  TTestRepo.RegisterTest('WC-5869', 'Customer', 'FrmDistCtr', 'DoDistStr', Test1);
end.

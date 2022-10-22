unit WC_5882;

interface

implementation

uses
  TestReg,
  System.Variants,
  Ship_To_Vmi,
  DM_Cust;

procedure Test1;
var
  dm : TCust_DM;
begin
  try
    dm := TCust_DM.Create(nil);
    TFrmShip_To_VMI.ShowModeless( dm.SrcShip_To);
  finally
    dm.free;
  end;

end;

procedure Test2;
var
  dm : TCust_DM;
begin
  try
    dm := TCust_DM.Create(nil);
    TFrmShip_To_VMI.ShowModal( dm.SrcShip_To);
  finally
    dm.free;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-5882', 'Customer', 'FrmShip_To_VMI', 'ShowModeless', Test1, 1);
  TTestRepo.RegisterTest('WC-5882', 'Customer', 'FrmShip_To_VMI', 'ShowModal', Test2, 2);
end.

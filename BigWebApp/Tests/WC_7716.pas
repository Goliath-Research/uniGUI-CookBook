unit WC_7716;

interface

implementation

uses
  TestReg,
  System.Variants,
  plm_edit_item,
  plm_share;

procedure Test1;
var
  APLM_Param_Record: TPLM_Param_Record;
begin
  APLM_Param_Record.Parent_ID  :=  12321;
  APLM_Param_Record.ItemNo     := 'test';
  APLM_Param_Record.Descrip    := 'test';
  APLM_Param_Record.Rev        := 'test';
  APLM_Param_Record.Kind       := 3452;
  APLM_Param_Record.MfgType    := 'test';
  APLM_Param_Record.FClass     := 'test';
  APLM_Param_Record.Is_Prim_Mat:= 'test';

  TFrmEditPlmItem.DoShowModal( APLM_Param_Record, 'Test' )
end;

initialization

  TTestRepo.RegisterTest('WC-7716', 'Plm ', 'FrmEditPlmItem', 'DoShowModal', Test1);
end.

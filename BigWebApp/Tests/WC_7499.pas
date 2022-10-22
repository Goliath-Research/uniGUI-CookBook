unit WC_7499;

interface

implementation

uses
  MainModule,
  TestReg,
  oe_po_detail_outsource,
  uniGUIApplication;

procedure Test1;
begin
  TFrmOE_PO_Detail_Outsource.DoShow(27241);
end;

procedure Test2;
begin
  TFrmOE_PO_Detail_Outsource.DoShow('ORD_DETAIL',274241);
end;

initialization

  TTestRepo.RegisterTest('WC-7499', 'Oe', 'oe_po_detail_outsource', 'DoShow', Test1,1);
  TTestRepo.RegisterTest('WC-7499', 'Oe', 'oe_po_detail_outsource', 'DoShow', Test2,2);

end.

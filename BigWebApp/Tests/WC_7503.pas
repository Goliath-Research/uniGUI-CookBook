unit WC_7503;

interface

implementation

uses
  TestReg,
  System.Variants,
  oe_quick_ship_locs,
  oe_quick_locs_filter;

procedure Test1;
var
  AFilter: TDisplayFilter;
begin
  AFilter.exclude_vmi := true;
  AFilter.exclude_non_conform := true;
  AFilter.exclude_non_allocate := false;
  AFilter.exclude_in_transit := true;
  AFilter.exclude_hard_alloc := false;
  AFilter.exclude_make_to_order := true;
  AFilter.exclude_expired := true;
  TFrmOeQuickLocsFilter.DoShowModal(AFilter);
end;

initialization

  TTestRepo.RegisterTest('WC-7503', 'Oe ', 'FrmOeQuickLocsFilter', 'DoShowModalDialogCheckBox', Test1);
end.

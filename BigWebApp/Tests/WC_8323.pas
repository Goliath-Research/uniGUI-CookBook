unit WC_8323;

interface

implementation

uses
  TestReg,
  System.Sysutils,
  System.Variants,
  UniGUIApplication,
  RTDwnQry;

procedure TestCreate;
var
  LFrm: TRTDwnQryEntry;
begin
  LFrm:= TRTDwnQryEntry.Create(UniGUIApplication.UniApplication);
  LFrm.CurrentShift:= 4;
  LFrm.CurrentProdDate:= now;
  LFrm.Show;
end;

initialization

  TTestRepo.RegisterTest('WC-8323', 'RT', 'RTDwnQryEntry', 'Create', TestCreate);
end.

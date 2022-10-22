unit WC_5262;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  AssyTrack_BOM_Details;

procedure Test1;
begin
  TFrmAssyTrack_BomDetails.DoShowModal(52536,52433,162745,147536);
end;

initialization

  TTestRepo.RegisterTest('WC_5262', 'AssyTrack', 'AssyTrack_BOM_Details', 'DoShowModal', Test1);
end.

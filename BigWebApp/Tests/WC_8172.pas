unit WC_8172;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  Q_WrkSht_Thermo;

procedure Test1;
var AWeight, AVol, APartLength, APartWidth, AToolLength, AToolWidth, AUpCount,
  ASpaceTrimLength, ASpaceTrimWidth, ASpaceEdgeLength, ASpaceEdgeWidth: Real;
begin
  AWeight := 56;
  AVol := 45;
  APartLength := 25;
  APartWidth := 456;
  AToolLength := 57;
  AToolWidth := 78;
  AUpCount := 489;
  ASpaceTrimLength := 89;
  ASpaceTrimWidth := 577;
  ASpaceEdgeLength := 576;
  ASpaceEdgeWidth := 45;
  TFrmWeightWorkSheetThermo.DoShowModal(205,145,145,AWeight, AVol, APartLength, APartWidth, AToolLength, AToolWidth, AUpCount,
  ASpaceTrimLength, ASpaceTrimWidth, ASpaceEdgeLength, ASpaceEdgeWidth);
end;

initialization

TTestRepo.RegisterTest('WC-8172', 'Quote', 'Q_WrkSht_Thermo', 'DoShowModal', Test1);

end.

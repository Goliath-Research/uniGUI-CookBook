unit WC_5387;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  bom_wrksht_thermo;

procedure TestDoShowModal;
var
 AArinvt_ID_Mat, APartno_ID: Real;
 AWeight, AVol, APartLength, APartWidth, AToolLength, AToolWidth, AUpCount: Real;
 ASpaceTrimLength, ASpaceTrimWidth, ASpaceEdgeLength, ASpaceEdgeWidth: Real;
begin
  AArinvt_ID_Mat := 2314;
  APartno_ID := 2314;
  AWeight:= 2314;
  AVol:= 2314;
  APartLength := 2314;
  APartWidth:= 2314;
  AToolLength:= 2314;
  AToolWidth:= 2314;
  AUpCount:= 2314;
  ASpaceTrimLength:= 2314;
  ASpaceTrimWidth:= 2314;
  ASpaceEdgeLength:= 2314;
  ASpaceEdgeWidth:= 2314;
  TFrmBOMWeightWorkSheetThermo.DoShowModal(3421, 4563, AWeight, AVol, APartLength, APartWidth, AToolLength, AToolWidth, AUpCount,
                                ASpaceTrimLength, ASpaceTrimWidth, ASpaceEdgeLength, ASpaceEdgeWidth)
end;

initialization

  TTestRepo.RegisterTest('WC-5387', 'Bom', 'bom_wrksht_thermo', 'DoShowModal', TestDoShowModal);

end.

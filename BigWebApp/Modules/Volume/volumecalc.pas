unit volumecalc;

interface

uses
  System.Math;

function Rec_Solid(AQuantity, ALength, AWidth, ADiameter: Real): Real;
function Rec_Base(AQuantity, ALength, AWidth, ADiameter,  AThickness: Real): Real;
function Rec_Through(AQuantity, ALength, AWidth, ADiameter, ALength2,  AWidth2: Real): Real;
function Rec_OpenEnded(AQuantity, ALength, AWidth, ADiameter, ALength2,  AWidth2: Real): Real;
function Cyl_Solid(AQuantity, ARadius, ALength: Real): Real;
function Cyl_Base(AQuantity, ARadius, ALength, AThickness: Real): Real;
function Cyl_Through(AQuantity, ARadius, ALength, AThickness: Real): Real;
function Cone_Solid(AQuantity, ARadius, ALength: Real): Real;
function Cone_Hollow(AQuantity, ARadius, ALength, AThickness: Real): Real;
function Cone_Partial(AQuantity, ADiameter1, ADiameter2, AHeight: Real): Real;
function Sphere(AQuantity, ARadius: Real): Real;
function Sphere_Hollow(AQuantity, ARadius, AThickness: Real): Real;
function Sphere_Section(AQuantity, ARadius, AHeight: Real): Real;
function Pyramid_Solid(AQuantity, ALength, AWidth, AHeight: Real): Real;
function Torus(AQuantity, AWidth, ARadius: Real): Real;

{ Formulas:
  Rectangle = l x w x d
  Cyclinder = (pi)(r2)h
  Cone = (1/3)(pi)(r2)h
  Pyramid = 1/3(area of base)h
  Sphere = 4/3(pi)(r3)

  Where:
  l = length
  w = width
  d = depth
  pi = 3.1416
  r = radius  **we may consider asking diameter
}

implementation

function Rec_Solid(AQuantity, ALength, AWidth, ADiameter: Real): Real;
begin
  Result := (ALength * AWidth * ADiameter) * AQuantity;
end;

function Rec_Base(AQuantity, ALength, AWidth, ADiameter,
  AThickness: Real): Real;
var
  ATempThickness: Real;
begin
  ATempThickness := AThickness * 2;
  Result := ((ALength * AWidth * ADiameter) - ((ALength - ATempThickness) *
    (AWidth - ATempThickness) * (ADiameter - AThickness))) * AQuantity;
end;

function Rec_Through(AQuantity, ALength, AWidth, ADiameter, ALength2,
  AWidth2: Real): Real;
begin
  Result := ((ALength * AWidth * ADiameter) - (ALength2 * AWidth2 * ADiameter))
    * AQuantity;
end;

function Rec_OpenEnded(AQuantity, ALength, AWidth, ADiameter, ALength2,
  AWidth2: Real): Real;
begin
  Result := ((ALength * AWidth * ADiameter) - (ALength2 * AWidth2 * ADiameter))
    * AQuantity;
end;

function Cyl_Solid(AQuantity, ARadius, ALength: Real): Real;
begin
  Result := ((Sqr(ARadius * 2) * 0.785) * ALength) * AQuantity;
end;

function Cyl_Base(AQuantity, ARadius, ALength, AThickness: Real): Real;
var
  AOutsideDiameter: Real; // Outside Cylinder
  AInsideDiameter: Real; // Inside Cylinder
begin
  { Subtract the volume of the smaller cylinder from
    the larger.  What remains is the total volume
    used.  Multiply that by quantity. }
  AOutsideDiameter := (Sqr(ARadius * 2) * 0.785) * ALength;
  AInsideDiameter := (Sqr((ARadius - AThickness) * 2) * 0.785) *
    (ALength - AThickness);
  Result := (AOutsideDiameter - AInsideDiameter) * AQuantity;
end;

function Cyl_Through(AQuantity, ARadius, ALength, AThickness: Real): Real;
var
  AOutsideDiameter: Real; // Outside Cylinder
  AInsideDiameter: Real; // Inside Cylinder
begin
  { Subtract the volume of the smaller cylinder from
    the larger.  What remains is the total volume
    used.  Multiply that by quantity. }
  AOutsideDiameter := (Sqr(ARadius * 2) * 0.785) * ALength;
  AInsideDiameter := (Sqr((ARadius - AThickness) * 2) * 0.785) * ALength;
  Result := (AOutsideDiameter - AInsideDiameter) * AQuantity;
end;

function Cone_Solid(AQuantity, ARadius, ALength: Real): Real;
var
  ABaseArea: Real; // Base area
begin
  ABaseArea := Sqr(ARadius * 2) * 0.785;
  // Area of the base (Same formula as area of a circle)
  Result := ((ABaseArea * 0.333333) * ALength) * AQuantity;
  // Volume of the cone by quantity
end;

function Cone_Hollow(AQuantity, ARadius, ALength, AThickness: Real): Real;
var
  AOutsideVol, // Volume of larger cone
  AInsideVol, // Volume of smaller cone
  ABaseArea1, // Base area of larger cone
  ABaseArea2: Real; // Base area of smaller cone
begin
  ABaseArea1 := Sqr(ARadius * 2) * 0.785;
  // Area of the base (Same formula as area of a circle)
  ABaseArea2 := Sqr((ARadius - AThickness) * 2) * 0.785;
  AOutsideVol := ((ABaseArea1 * 0.333333) * ALength);
  // Total volume of larger cone
  AInsideVol := ((ABaseArea2 * 0.333333) * ALength);
  // Total volume of smaller cone
  Result := (AOutsideVol - AInsideVol) * AQuantity;
  // Difference between two volumes, by quantity
end;

function Cone_Partial(AQuantity, ADiameter1, ADiameter2, AHeight: Real): Real;
var
  AValue1, AValue2, AValue3: Real;
begin
  // Retrieve volume of a partial cone, or conic.  A partial cone is a conical
  // shape without the characteristic point of a cone.
  // The formula is Cone_Partial := 0.2618H(ADiameter2^2 + D1D2 + ADiameter1^2 ) * AQuantity;
  // I have separated it here to ensure that the correct sequence is calculated.
  AValue1 := 0.2618 * AHeight;
  AValue2 := Sqr(ADiameter2) + (ADiameter1 * ADiameter2) + Sqr(ADiameter1);
  AValue3 := AValue1 * AValue2;
  Result := AValue3 * AQuantity;
end;

function Sphere(AQuantity, ARadius: Real): Real;
begin
  // volume of a sphere, by quantity
  Result := (Power(ARadius * 2, 3) * 0.524) * AQuantity;
end;

function Sphere_Hollow(AQuantity, ARadius, AThickness: Real): Real;
var
  ADiameter1, ADiameter2, AOuterVol, AInnerVol: Real; // Diameter
begin
  ADiameter1 := ARadius * 2; // Diameter of larger sphere
  ADiameter2 := (ARadius - AThickness) * 2; // Diameter of smaller sphere
  AOuterVol := Power(ADiameter1, 3) * 0.524; // volume of larger sphere
  AInnerVol := Power(ADiameter2, 3) * 0.524; // volume of larger sphere
  Result := (AOuterVol - AInnerVol) * AQuantity;
end;

function Sphere_Section(AQuantity, ARadius, AHeight: Real): Real;
var
  ADiameter, APart, ASphereVol: Real;
begin
  ADiameter := ARadius * 2; // Diameter of sphere
  ASphereVol := Power(ADiameter, 3) * 0.524; // volume of sphere
  APart := (1 / ADiameter) * AHeight;
  Result := (ASphereVol / APart) * AQuantity;
end;

function Pyramid_Solid(AQuantity, ALength, AWidth, AHeight: Real): Real;
begin
  Result := (((ALength * AWidth) * 0.333333) * AHeight) * AQuantity;
  // 1/3(area of base)(height)
end;

function Torus(AQuantity, AWidth, ARadius: Real): Real;
begin
  // Inner diameter or width, and radius
  // Result := (((Sqr(pi)/2) * AWidth) * Sqr(ARadius)) * AQuantity;

  // 2 * pi2 R * r2
  Result := (2 * Sqr(pi)) * (AWidth * Sqr(ARadius)) * AQuantity;
end;

end.

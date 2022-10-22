unit WC_7036;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  shipman_common,
  shipman_packagingdlg;

procedure Test;
var
  ct:TCarrierType;
  APackageCode, APackageDescription: String;
begin
  ct:=ctUPS;

  if DoSelectPackaging(ct,'AServiceCode', APackageCode, APackageDescription) then
   ShowMessage(APackageCode);
end;

initialization
  TTestRepo.RegisterTest('WC-7036', 'Iqshipman',  'shipman_packagingdlg', 'DoSelectPackaging', Test);
end.

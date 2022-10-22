unit WC_8922;

interface

implementation

uses
  System.SysUtils,
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  main_vol;

procedure TestGetVolumeFormWorkSheet;
var
  LVol: Real;
begin
  if GetVolumeFormWorkSheet(LVol, 1234) then
    ShowMessage(FloatToStr(LVol));
end;

procedure TestGetVolumeFormWorkSheetEx;
var
  LVol: Real;
  LNum: Integer;
begin
  if GetVolumeFormWorkSheetEx(LVol, 1234, LNum) then
    ShowMessage('Volume' + FloatToStr(LVol) + ' UomIndex: ' + IntToStr(LNum));
end;

initialization

TTestRepo.RegisterTest('WC-8922', 'Volume', 'FrmVolume',
  'GetVolumeFormWorkSheet', TestGetVolumeFormWorkSheet, 1);

TTestRepo.RegisterTest('WC-8922', 'Volume', 'FrmVolume',
  'GetVolumeFormWorkSheetEx', TestGetVolumeFormWorkSheetEx, 2);

end.

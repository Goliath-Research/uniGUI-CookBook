unit WC_7737;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TypInfo,
  pm_types,
  PM_WO_SD_Filter;

procedure Test1;
var
  tmp: TPMWOFilterType;
begin
  if GetPM_WO_SD_Filter(tmp) then
    showMessage( GetEnumName(TypeInfo(TPMWOFilterType), Ord(tmp)) ) else
    showMessage('Cancelled');
end;

initialization

  TTestRepo.RegisterTest('WC-7737', 'Pm', 'PM_WO_SD_Filter', 'GetPM_WO_SD_Filter', Test1, 1);

end.

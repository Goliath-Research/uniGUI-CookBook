unit WC_7803;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  TypInfo,
  pm_select_equp;

procedure Test1;
var
  tmp: TAddMROTaskSelection;
begin
  if DoSelectEquipment(44622, 3736, tmp) then
    showMessage( GetEnumName(TypeInfo(TAddMROTaskOption), Ord(tmp.Option)) ) else
    showMessage('Cancelled');
end;

initialization

  TTestRepo.RegisterTest('WC-7803', 'Pm', 'pm_select_equp', 'DoSelectEquipment', Test1, 1);

end.

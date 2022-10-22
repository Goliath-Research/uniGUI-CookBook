unit WC_8275;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  _CountryListForm;

procedure Test1;
begin
  TCountryListForm.DoShow;
end;

procedure Test2;
begin
  TCountryListForm.DoShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-8275', 'Regional', '_CountryListForm', 'DoShow', Test1, 1);
  TTestRepo.RegisterTest('WC-8275', 'Regional', '_CountryListForm', 'DoShowModal', Test2, 2);

end.

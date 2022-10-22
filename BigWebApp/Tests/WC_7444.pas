unit WC_7444;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  uniGuiForm,
  uniGUIApplication,
  OEAutoMark;

procedure TestGetOEAutoMark;
var
  dateTime:TDateTime;
  aChechked:boolean;
begin
  GetOEAutoMark(dateTime,aChechked);
end;

initialization

  TTestRepo.RegisterTest('WC-7444', 'Oe', 'OEAutoMark', 'GetOEAutoMark', TestGetOEAutoMark);

end.

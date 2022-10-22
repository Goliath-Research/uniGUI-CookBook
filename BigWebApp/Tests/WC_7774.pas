unit WC_7774;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  System.Classes,
  pm_add_sched;

procedure TestTFrmPMAddSched;
var
  AList : TStringList;
  AStartDate: TDateTime;
begin
  AList := TStringList.Create;
  AList.Add('TEST');
  AList.Add('ID');
  AStartDate := 15/04/2015;
  TFrmPMAddSched.DoShowModal(AList,AStartDate)
end;

initialization

  TTestRepo.RegisterTest('WC-7774', 'PM', 'pm_add_sched', 'DoShowModal', TestTFrmPMAddSched);

end.

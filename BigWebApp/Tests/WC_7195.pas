unit WC_7195;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  eplant_profile;

procedure Test;
begin
  TFrmEPlantProfile.DoShowModal('REPORTS','test');
end;

initialization

  TTestRepo.RegisterTest('WC-7195', 'Iqsys', 'eplant_profile', 'DoShowModal', Test);

end.

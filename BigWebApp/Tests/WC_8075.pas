unit WC_8075;

interface

implementation

uses
  TestReg,
  System.Classes,
  uniGUIDialogs,
  qc_doc_pref;

type
 PrefCargo = record
    Mode: Integer;         {0-Mine, 1-All, 2-Other Team Member}
    Team_Member_ID: Real;  {other team member}
    SortDocsNumerically: Boolean;
  end;

procedure Test;
var
  PrefCargo : TQCDocPrefCargo;
begin
  PrefCargo.Mode := 0;
  PrefCargo.Team_Member_ID  := 5;
  PrefCargo.SortDocsNumerically := True;
  TFrmQCDocPreferences.DoShowModal(64,PrefCargo);
end;

initialization

  TTestRepo.RegisterTest('WC-8075', 'Qc_Doc', 'qc_doc_pref', 'DoShowModal', Test);

end.

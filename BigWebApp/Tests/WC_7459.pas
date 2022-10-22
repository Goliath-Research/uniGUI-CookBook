unit WC_7459;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  OeRel_Dlg;

procedure Test1;
var ARelInputCargo: TRelInputCargo;
begin
  ARelInputCargo.Count     := 34;
    ARelInputCargo.Qty_Per   := 324;
    ARelInputCargo.Start_Date:= 25/4/2015;
    ARelInputCargo.LeadDays  := 145;
    ARelInputCargo.Interval  := 256;
    ARelInputCargo.Overwrite := True;
    ARelInputCargo.UseBlanket:= True;
    ARelInputCargo.AllItems  := True;
    ARelInputCargo.Forecast  := True;
  DoReleasesDialog(ARelInputCargo);
end;

initialization

  TTestRepo.RegisterTest('WC-7459', 'OE', 'OeRel_Dlg', 'DoReleasesDialog', Test1);
end.

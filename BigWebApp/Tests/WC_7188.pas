unit WC_7188;

interface

implementation

uses
  TestReg,
  uniGUIApplication,
  Repdef_Cat,
  FireDAC.Comp.Client,
  MainModule,
  Data.DB;

procedure Test1;
begin
  TFrmRepDef_Cat.DoShowModal;
end;

procedure Test2;
begin
  TFrmRepDef_Cat.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC_7188', 'Iqsys', 'Repdef_Cat', 'DoShow', Test1,1);
  TTestRepo.RegisterTest('WC_7188', 'Iqsys', 'Repdef_Cat', 'DoShowModal', Test2,2);
end.

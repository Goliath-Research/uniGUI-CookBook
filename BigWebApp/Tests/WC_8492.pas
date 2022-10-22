unit WC_8492;

interface

implementation

uses
  TestReg,
  System.Variants,
  System.Classes,
  SchdSameToolJobs;

procedure Test1;
var
  AList: TStringList;
begin
  AList:= TStringList.Create;
  AList.Add('test');
  CheckLoadSameToolAdjoiningJobs( AList, 1234, 342311, 11);
end;

initialization

  TTestRepo.RegisterTest('WC-8492', 'Sched', 'FrmSchedSameToolJobs', 'CheckLoadSameToolAdjoiningJobs', Test1);
end.

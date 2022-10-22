unit WC_7299;

interface

implementation

uses
  TestReg,
  VWrkCntr_Pk,
  System.Classes;

procedure Test1;
var
  List:TStringList;
begin
  List:= TStringList.create();
  TFrmWorkCenterPkList.Execute(List);
end;

initialization

  TTestRepo.RegisterTest('WC-7299', 'Iqvoice', 'VWrkCntr_Pk', 'Execute', Test1);

end.

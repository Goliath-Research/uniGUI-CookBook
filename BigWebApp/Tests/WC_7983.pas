unit WC_7983;

interface

implementation

uses
  TestReg,
  TAEmpAlc;

procedure Test1;
var
  Day_Part_ID :Real;
  PR_Emp_Id: Real;
begin
  Day_Part_ID := 194407;
  PR_Emp_Id:= 259;
  DoTAEmployeeLaborAllocation(Day_Part_ID, PR_Emp_Id);
end;

initialization

  TTestRepo.RegisterTest('WC-7983', 'Prod', 'TAEmpAlc', 'DoTAEmployeeLaborAllocation', Test1);

end.

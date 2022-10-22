unit WC_7962;

interface

implementation

uses
  DB,
  TestReg,
  Emp_Aloc
  //,UserInputParameters
  ;

procedure Test1;
var
  Day_Part_ID: Real;
  //LPrms: TInputParameters;
begin
  {LPrms := UserInputParameters.GetParamValue(['Day Part ID'], [ftFloat],
    [194407], 'Employee Labor Allocation');}
  try
    Day_Part_ID := 194407;//LPrms.ValueByName['Day Part ID'];
    DoEmployeeLaborAllocation(Day_Part_ID);
  finally
    //LPrms.Free;
  end;
end;

initialization

TTestRepo.RegisterTest('WC-7962', 'Prod', 'Emp_Aloc',
  'DoEmployeeLaborAllocation', Test1);

end.

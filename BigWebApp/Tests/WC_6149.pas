unit WC_6149;

interface

implementation

uses
  TestReg,
  System.Variants,
  Budgsel,
  System.Classes;

procedure Test1;
var
  Criteria : TBudgetCriteria;
  AList : TStringList;
  AListName: TStringList;
begin

  Criteria.FiscalYearID     := 0;
  Criteria.AccountType      := 'Test';
  Criteria.UserDefinedTypeID:= 0;
  Criteria.Account          := 'Test';
  Criteria.Department       := 'Test';
  Criteria.Division         := 'Test';

  AList := TStringList.Create;
  AList.Add('AList test1');
  AList.Add('AList test2');

  AListName:= TStringList.Create;
  AListName.Add('AListName test1');
  AListName.Add('AListName test2');

  GetBudgetSelectionCriteria( Criteria , AList, AListName );
end;

initialization

  TTestRepo.RegisterTest('WC-6149', 'Gl', 'Budgsel', 'GetBudgetSelectionCriteria', Test1);
end.

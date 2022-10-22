unit WC_5886;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FireDAC.Comp.Client,
  MainModule,
  Terms;

procedure Test1;
var
  DataSet : TFdTable;
begin
  DataSet := TFdTable.Create(nil);
  try
      DataSet.Connection := UniMainModule.FDconnection1;
      DataSet.TableName := 'TERMS';
      DataSet.Open;
      DoTermsQry(DataSet);
  finally
      DataSet.close;
  end;
end;

procedure Test2;
var
  DataSet : TFdTable;
begin
  DataSet := TFdTable.Create(nil);
  try
      DataSet.Connection := UniMainModule.FDconnection1;
      DataSet.TableName := 'TERMS';
      DataSet.Open;
      DoTermsQry(DataSet);
  finally
      DataSet.close;
  end;
end;

initialization
  TTestRepo.RegisterTest('WC-5886', 'Customer', 'Terms', 'DoTermsQry', Test1, 1);
  TTestRepo.RegisterTest('WC-5886', 'Customer', 'Terms', 'DoTerms', Test2, 2);

end.

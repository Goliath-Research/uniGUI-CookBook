unit WC_5646;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  MainModule,
  crm_fieldchooser, FireDAC.Comp.Client, System.Classes;

procedure TestDoShow;
var
    DataSet : TFdTable;
    ASelected: TStringList;
begin
  DataSet := TFdTable.Create(nil);
  ASelected:= TStringList.Create;
  try
      DataSet.Connection := UniMainModule.FDconnection1;
      DataSet.TableName := 'FOB';
      DataSet.Open;
      DoFieldChooser(DataSet,ASelected);
      ASelected.SaveToFile('c:\temp\hahaha.txt');
  finally
      DataSet.free;
      ASelected.Free;
  end;
end;


initialization

  TTestRepo.RegisterTest('WC-5646', 'Crm', 'crm_fieldchooser', 'DoFieldChooser', TestDoShow);

end.

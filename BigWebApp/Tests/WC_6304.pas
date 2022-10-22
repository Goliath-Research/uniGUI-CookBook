unit WC_6304;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  FireDAC.Comp.Client,
  MainModule,
  OnHand;

procedure Test;
var
  DataSet : TFDTable;
begin
  DataSet := TFDTable.Create(nil);
  DataSet.Connection := UniMainModule.FDConnection1;
  Dataset.TableName := 'PLM_ITEM';
  DataSet.Open;
  DoShowOnHandByPlant(DataSet);
end;

initialization
  TTestRepo.RegisterTest('WC-6304', 'Inv',  'OnHand', 'DoShowOnHandByPlant', Test);
end.

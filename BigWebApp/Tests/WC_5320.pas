unit WC_5320;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Bom_Labor,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.Client,
  MainModule;

var
  AwwQryBomLabor: TFDQuery;

procedure addSQL;
begin
  AwwQryBomLabor := TFDQuery.Create(nil);
  AwwQryBomLabor.Connection := UniMainModule.FDConnection1;
  AwwQryBomLabor.SQL.Text := 'select b.id, b.standard_id, b.emp_level_id, b.operator from bom_labor b where standard_id = 50512 ' ;
  AwwQryBomLabor.Open();
end;

procedure TestDoShow;
var
  AMasterSource: TDataSource ;
begin
  AMasterSource := TDataSource.Create(nil);
  try
    addSQL;
    AMasterSource.DataSet := AwwQryBomLabor;
    TFrmBOM_Labor.DoShow( AMasterSource );
  finally
    AwwQryBomLabor.Free;
  end;
end;

procedure TestDoShowEx;
begin
  try
    addSQL;
    TFrmBOM_Labor.DoShowEx( AwwQryBomLabor );
  finally
    AwwQryBomLabor.Free;
  end;
end;

procedure TestDoShowExA;
begin
  TFrmBOM_Labor.DoShowExA( 50512, false );
end;


initialization
  TTestRepo.RegisterTest('WC-5320', 'Bom',  'Bom_Labor', 'DoShow', TestDoShow, 1);
  TTestRepo.RegisterTest('WC-5320', 'Bom',  'Bom_Labor', 'DoShowEx', TestDoShowEx, 2);
  TTestRepo.RegisterTest('WC-5320', 'Bom',  'Bom_Labor', 'DoShowExA', TestDoShowExA, 3);
end.

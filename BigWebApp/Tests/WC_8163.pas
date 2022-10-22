unit WC_8163;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIApplication,
  uniGUIDialogs,
  Q_QPB,
  FireDAC.Comp.Client,
  IQMS.Common.DataConst,
  Data.DB;

procedure Test1;
var
  ADataset: TFDQuery;
begin
  ADataset := TFDQuery.create(UniApplication);
  try
    ADataset.ConnectionName := cnstFDConnectionName;
    ADataset.SQL.Text := 'select * from QINVT where id = 5';
    ADataset.Open;
    DoQinvtQtyBreaks(ADataset);
  finally
    ADataset.free;
  end;

end;

initialization

TTestRepo.RegisterTest('WC-8163', 'Quote', 'Q_QPB', 'DoQinvtQtyBreaks', Test1, 1);

end.

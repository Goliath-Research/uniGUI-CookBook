unit WC_8305;

interface

implementation

uses
  TestReg,
  DB,
  FireDAC.Comp.Client,
  System.SysUtils,
  DateUtils,
  System.Classes,
  RmaCkArh,
  MainModule;

procedure TestCheckRMABeforeArcive;
var
  LDS1, LDS2, LDS3: TFDTable;
begin
  LDS1:= TFDTable.Create(nil);
  LDS2:= TFDTable.Create(nil);
  LDS3:= TFDTable.Create(nil);
  try
    LDS1.Connection:= UniMainModule.FDConnection1;
    LDS2.Connection:= UniMainModule.FDConnection1;
    LDS3.Connection:= UniMainModule.FDConnection1;

    LDS1.TableName:= 'RMA_DETAIL';
    LDS2.TableName:= 'v_rma_receipts_total';
    LDS3.TableName:= 'v_rma_credits2';

    LDS1.Open;
    LDS2.Open;
    LDS3.Open;

    CheckRMABeforeArcive(1000, LDS1, LDS2, LDS3);
  finally
    LDS1.Free;
    LDS2.Free;
    LDS3.Free;
  end;
end;

initialization

  TTestRepo.RegisterTest('WC-8305', 'RMA', 'FrmRmaCheckArcive', 'CheckRMABeforeArcive', TestCheckRMABeforeArcive);

end.

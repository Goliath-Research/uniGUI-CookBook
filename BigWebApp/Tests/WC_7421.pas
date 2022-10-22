unit WC_7421;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FireDAC.Comp.Client,
  MainModule,
  MCFrmBas;

procedure TestDoShowModal;
var
   MyTable: TFdTable;
   LFrmMCFormBasic : TFrmMCFormBasic ;
begin
  MyTable := TFdTable.create(nil);
  try
    begin
      MyTable.Connection := UniMainModule.FDconnection1;
      MyTable.TableName := 'QOPMAT_QTY_BREAKS';
      MyTable.Open;
      DOMCFormDisplay(47,MyTable,LFrmMCFormBasic);
    end;
  finally
    MyTable.free;
  end;
end;

initialization
  TTestRepo.RegisterTest('WC-7421', 'Multicur', 'MCFrmBas', 'DOMCFormDisplay', TestDoShowModal);
end.

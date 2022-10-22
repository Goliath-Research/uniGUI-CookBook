unit WC_7415;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  FireDAC.Comp.Client,
  MainModule,
  MCQte_b1;

procedure TestDoShowModal1;
var
   MyTable: TFdTable;
begin
  MyTable := TFdTable.create(nil);
  try
    begin
      MyTable.Connection := UniMainModule.FDconnection1;
      MyTable.TableName := 'QOPMAT_QTY_BREAKS';
      MyTable.Open;
      DoMCQUOTE_QTY_BREAKS(203,'QOPMAT_QTY_BREAKS','ID',MyTable);
    end;
  finally
    MyTable.free;
  end;
end;

procedure TestDoShowModal2;
var
   MyTable: TFdTable;
begin
  MyTable := TFdTable.create(nil);
  try
    begin
      MyTable.Connection := UniMainModule.FDconnection1;
      MyTable.TableName := 'QOPMAT_QTY_BREAKS';
      MyTable.Open;
      DoMCQUOTE_QTY_BREAKS(84,'QOPMAT_QTY_BREAKS','ID',MyTable);
    end;
  finally
    MyTable.free;
  end;
end;

procedure TestDoShowModal3;
var
   MyTable: TFdTable;
begin
  MyTable := TFdTable.create(nil);
  try
    begin
      MyTable.Connection := UniMainModule.FDconnection1;
      MyTable.TableName := 'QOPMAT_QTY_BREAKS';
      MyTable.Open;
      DoMCQUOTE_QTY_BREAKS(84,'QOPMAT_QTY_BREAKS','ID',MyTable);
    end;
  finally
    MyTable.free;
  end;
end;

procedure TestDoShowModal4;
var
   MyTable: TFdTable;
begin
  MyTable := TFdTable.create(nil);
  try
    begin
      MyTable.Connection := UniMainModule.FDconnection1;
      MyTable.TableName := 'QOPMAT_QTY_BREAKS';
      MyTable.Open;
      DoMCQUOTE_QTY_BREAKS(84,'QOPMAT_QTY_BREAKS','ID',MyTable);
    end;
  finally
    MyTable.free;
  end;
end;

procedure TestDoShowModal5;
var
   MyTable: TFdTable;
begin
  MyTable := TFdTable.create(nil);
  try
    begin
      MyTable.Connection := UniMainModule.FDconnection1;
      MyTable.TableName := 'QOPMAT_QTY_BREAKS';
      MyTable.Open;
      DoMCQUOTE_QTY_BREAKS(84,'QOPMAT_QTY_BREAKS','ID',MyTable);
    end;
  finally
    MyTable.free;
  end;
end;


initialization
  TTestRepo.RegisterTest('WC-7415', 'Multicur', 'MCQte_b1', 'DoMCQUOTE_QTY_BREAKS', TestDoShowModal1,1);
  TTestRepo.RegisterTest('WC-7415', 'Multicur', 'MCQte_b1', 'DoMCQUOTE_QTY_BREAKS_QINVT', TestDoShowModal2,2);
  TTestRepo.RegisterTest('WC-7415', 'Multicur', 'MCQte_b1', 'DoMCQUOTE_QTY_BREAKS_ARINVT', TestDoShowModal3,3);
  TTestRepo.RegisterTest('WC-7415', 'Multicur', 'MCQte_b1', 'DoMCQUOTE_QTY_BREAKS_ATT', TestDoShowModal4,4);
  TTestRepo.RegisterTest('WC-7415', 'Multicur', 'MCQte_b1', 'DoMCQUOTE_QTY_BREAKS_PL', TestDoShowModal5,5);
end.

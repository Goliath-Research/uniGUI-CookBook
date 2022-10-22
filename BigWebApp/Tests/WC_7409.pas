unit WC_7409;

interface

implementation

uses
  TestReg,
  System.Variants,
  UniGUIApplication,
  MCBREAKS;

procedure TestDoMCBREAKS;
begin
  DoMCBREAKS(1000,//AID: Real;
             'CAR',//ATableName,
             'ID',//AIDField: String;
             nil,//AParentTable: TFDTable;
             'PARENTID',//AParentTableField,
             'TEST'//ABuying: String
             );
end;

initialization

  TTestRepo.RegisterTest('WC-7409', 'Multicur', 'FrmMCBreaks', 'DoMCBREAKS', TestDoMCBREAKS);
end.

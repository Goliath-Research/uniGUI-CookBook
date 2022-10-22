unit WC_5324;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Bom_Uom;

procedure TestGetBOM_UOM;
begin
  if GetBOM_UOM then;
     ShowMessage('Successful!!');
end;

initialization
  TTestRepo.RegisterTest('WC-5324', 'Qc',  'QC_WF_Calendar', 'GetBOM_UOM', TestGetBOM_UOM);
end.

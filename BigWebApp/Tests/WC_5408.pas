unit WC_5408;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Lab_Cap;

procedure TestDoShow;
begin
   TFrmLaborCapacity.DoShow;
end;

initialization
  TTestRepo.RegisterTest('WC-5408', 'Capacity',  'Lab_Cap', 'DoShow', TestDoShow);
end.

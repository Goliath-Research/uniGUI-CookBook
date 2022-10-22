unit WC_5386;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  bom_throughput_map;

procedure TestTFrmBOMThroughputMap;
begin
  TFrmBOMThroughputMap.DoShow(50);
end;

initialization

  TTestRepo.RegisterTest('WC-5386', 'Bom', 'bom_throughput_map', 'DoShow', TestTFrmBOMThroughputMap);

end.

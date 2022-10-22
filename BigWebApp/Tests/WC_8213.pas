unit WC_8213;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  MainModule,
  UniGUIApplication,
  q_throughput_map;

procedure TestTTMatEdit;
begin
  TFrmQuoteThroughputMap.DoShow(5465);;
end;

initialization

  TTestRepo.RegisterTest('WC-8213', 'Quote', 'q_throughput_map', 'DoShow', TestTTMatEdit);

end.

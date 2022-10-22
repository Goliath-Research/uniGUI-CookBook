unit WC_7593;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGUIApplication,
  System.Classes,
  ps_void_pick_labels;

procedure TestTFrmPSVoid_PickLabels;
var
   AList: TStringList;
begin
  AList := TStringList.Create;
  AList.add('TEST');
  AList.Add('IQMS');
  TFrmPSVoid_PickLabels.DoShowModal(AList, 23,564,4658,456);
end;

initialization
  TTestRepo.RegisterTest('WC-7593', 'Packslip',  'ps_void_pick_labels', 'DoShowModal', TestTFrmPSVoid_PickLabels);
end.

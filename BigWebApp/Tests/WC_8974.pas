unit WC_8974;

interface

implementation

uses
  TestReg,
  System.Variants,
  wc_frame_template;

procedure Test1;
begin
  TFrmWorkCenterFrameTemplate.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-8974', 'Workcntr', 'FrmWorkCenterFrameTemplate', 'DoShow', Test1);
end.

unit WC_8508;

interface

implementation

uses
  TestReg,
  System.Variants,
  schd_def_wo_caption;

procedure Test1;
var
  ACaption: string;
begin
  ACaption := 'Tests';
  TFrmSchdDefineWOCaption.DoShowModal( ACaption );
end;

initialization

  TTestRepo.RegisterTest('WC-8508', 'Sched ', 'FrmSchdDefineWOCaption', 'DoShowModal', Test1);
end.

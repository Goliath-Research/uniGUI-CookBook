unit WC_7334;

interface

implementation

uses
  TestReg,
  SysUtils,
  StrUtils,
  uniGUIDialogs,
  wf_gantt;

procedure Testwf_gantt;
var
  LVar: Real;
begin
  TFrmWFGantt.DoShowModal('PR_PAYTYPE_ACCRUED','PR_PAYTYPE_ACCRUED','test',130);
end;

initialization

  TTestRepo.RegisterTest('WC-7334', 'Iqworkflow', 'wf_gantt', 'DoShowModal', Testwf_gantt);

end.

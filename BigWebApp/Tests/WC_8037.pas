unit WC_8037;

interface

implementation

uses
  TestReg,
  System.Variants,
  uniGUIApplication,
  qc_audit_seltype;

procedure Test1;
var
 Form: TFrmQcAuditSelType;
begin
   Form := TFrmQcAuditSelType.create(uniGUIApplication.uniApplication);
end;

initialization

  TTestRepo.RegisterTest('WC-8037', 'Qc_Audit', 'qc_audit_seltype', 'create', Test1);
end.

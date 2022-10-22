unit qc_audit_types;

interface

uses
  Classes;

type
  { TQuestionStatus }
  TQuestionStatus = (qsIncomplete, qcConforms, qcMinorNonConformance,
   qcMajorNonConformance, qsNotApplicable);

implementation

end.

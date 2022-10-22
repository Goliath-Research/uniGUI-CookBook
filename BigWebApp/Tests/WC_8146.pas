unit WC_8146;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  Q_CloneDlg;

procedure Test1;
var
  ANew_Rfq: string;
  ANew_Rev: Real;
  AUDForm, AIntDoc, AExtDoc, ANotes, AAddNotes: Boolean;
begin
  if TFrmQ_CloneDlg.DoShowModal(60, ANew_Rfq, ANew_Rev, AUDForm, AIntDoc, AExtDoc, ANotes, AAddNotes) then
    ShowMessage(
    'ANew_Rfq='  + ANew_Rfq                 + #13#10 +
    'ANew_Rev='  + FloatToStr(ANew_Rev)     + #13#10 +
    'AUDForm='   + BoolToStr(AUDForm, True) + #13#10 +
    'AIntDoc='   + BoolToStr(AIntDoc, True) + #13#10 +
    'AExtDoc='   + BoolToStr(AExtDoc, True) + #13#10 +
    'ANotes='    + BoolToStr(ANotes, True)  + #13#10 +
    'AAddNotes=' + BoolToStr(AAddNotes, True))
  else
    ShowMessage('Cancelled');

end;

initialization

TTestRepo.RegisterTest('WC-8146', 'Quote', 'Q_CloneDlg', 'DoShowModal', Test1);

end.

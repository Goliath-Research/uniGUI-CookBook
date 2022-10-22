unit WC_7416;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGuiApplication,
  MCQte_br;

procedure TestDoShowModal;
var
   LFrmMCGridBasic : TFrmMCGridBasic;
begin
    LFrmMCGridBasic := TFrmMCGridBasic.create(UniGuiApplication.UniApplication);
    LFrmMCGridBasic.ID:=84;
    LFrmMCGridBasic.show;
end;

initialization
  TTestRepo.RegisterTest('WC-7416', 'Multicur', 'MCQte_br', 'TFrmMCGridBasic.create', TestDoShowModal);
end.

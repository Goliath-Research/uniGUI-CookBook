unit WC_7419;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  UniGuiApplication,
  Mcbasic;

procedure TestDoShowModal;
var
   LFrmMCBasic : TFrmMCBasic;
begin
    LFrmMCBasic := TFrmMCBasic.create(UniGuiApplication.UniApplication);
    LFrmMCBasic.ID:=84;
    LFrmMCBasic.show;
end;

initialization
  TTestRepo.RegisterTest('WC-7419', 'Multicur', 'Mcbasic', 'TFrmMCBasic.create', TestDoShowModal);
end.

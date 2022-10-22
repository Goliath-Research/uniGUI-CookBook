unit WC_7233;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  uniGUIApplication,
  Tlconf;

procedure TestTFrmTLLetterParams;
begin
  TFrmToolingConfirm.Create(UniApplication).ShowModal;
end;

initialization

  TTestRepo.RegisterTest('WC-7233', 'Iqtool', 'Tlconf', 'ShowModal', TestTFrmTLLetterParams);

end.

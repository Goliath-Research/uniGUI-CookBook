unit WC_7860;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  po_type;

procedure Test1;
begin
  TFrmPO_Type.DoShow;
end;

initialization

  TTestRepo.RegisterTest('WC-7860', 'Po', 'po_type', 'DoShow', Test1, 1);

end.

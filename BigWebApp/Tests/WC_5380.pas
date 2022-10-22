unit WC_5380;

interface

implementation

uses
  TestReg,
  SysUtils,
  uniGUIDialogs,
  bom_ptoper_depend;

procedure TestTFrmBomPtOperDepend;
begin
  TFrmBomPtOperDepend.DoShowModal(85);
end;

initialization

  TTestRepo.RegisterTest('WC-5380', 'Bom', 'bom_ptoper_depend', 'DoShowModal', TestTFrmBomPtOperDepend);

end.

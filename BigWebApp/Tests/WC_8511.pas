unit WC_8511;

interface

implementation

uses
  TestReg,
  System.Variants,
  schd_snap,
  uniGUIDialogs,
  System.StrUtils,
  Data.DB,
  IQMS.Data.Lib,
  Schd_DM;

procedure Test1;
var
  ADataSource: TDataSource;
  DM : TSchdDM;
begin
  DM := TSchdDM.Create(nil);
  IQSetTablesActive( TRUE, DM );
  try
    ShowMessage(IfThen( TFrmSched_Snap.DoShowModal( DM.SrcWork_Center ), 'Ok', 'Cancel' ));
  finally
    DM.Free;
  end;

end;

initialization

  TTestRepo.RegisterTest('WC-8511', 'Sched ', 'FrmSched_Snap', 'DoShowModal', Test1);
end.

unit WC_8300;

interface

implementation

uses
  TestReg,
  DB,
  FireDAC.Comp.Client,
  System.SysUtils,
  DateUtils,
  System.Classes,
  RMAVArch,
  MainModule;

procedure TestViewArcivedRMAs;
begin
  ViewArcivedRMAs(1000);
end;

initialization

  TTestRepo.RegisterTest('WC-8300', 'RMA', 'FrmViewArchivedRMA', 'ViewArcivedRMAs', TestViewArcivedRMAs);

end.

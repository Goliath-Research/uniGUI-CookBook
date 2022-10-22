unit IQMS.Common.PlantLayoutServer;

interface

type
  IPlantLayoutServer = interface
    ['{663ED922-36A2-42D1-A3F4-EAEABB25EB4E}']
    procedure Show;
    procedure OpenPCMonGaugesDialog(const AWorkCenterID: Int64);
  end;

implementation

end.

unit IQMS.CostSource.Intf;

interface

uses
   Vcl.Menus, Data.DB,uniMainMenu ;

type
  ICostSourceManager = interface
    ['{B4D89197-3E62-4900-9D25-D25AC727538E}']
    procedure RegisterMenu(AMenuItem: TUniMenuItem);
    procedure RegisterDataSource(ADataSource: TDataSource);
    procedure CreateCostSourceMenus;
  end;

implementation

end.

unit Services;

interface

type

  IServices = interface
    ['{CB442F06-D33F-488B-B643-22887D8F499B}']

    procedure EditUsers;
    procedure EditOrders;
    procedure ReportSales(const aPDFUrl : string);
  end;

implementation

end.

unit IQMS.Receive.PrintPalletIntf;

interface

uses
  System.Classes;

type
  IPrintReceivingPallet = interface
    ['{7A508D40-ADE3-4790-A335-4F3578E314A5}']
    procedure PrintPallet(APOReceiptsLabelsPalletID: Int64; AQuantity: Real);
  end;

implementation

end.

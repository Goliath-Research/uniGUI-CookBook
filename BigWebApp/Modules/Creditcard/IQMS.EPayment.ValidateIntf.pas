unit IQMS.EPayment.ValidateIntf;

interface

uses
  cc_types;

type
  IEPaymentValidate = interface
    ['{5B23B646-C082-4A12-A47E-3789A2B34F6C}']
    // Input
    procedure SetCreditCardNumber(const Value: string);
    procedure SetExpDateYear(const Value: Integer);
    procedure SetExpDateMonth(const Value: Integer);
    procedure SetIsToken(const Value: Boolean);
    procedure SetCreditCardType(const Value: TCreditCardType);
    // Execution
    function Validate: Boolean;
    function ValidateCardType: Boolean;
    function ValidateNumberFormat: Boolean;
    function ValidateExpDate: Boolean;
    // Output
    function DefaultCardType: TCreditCardType;
    function GetLastError(var AMsg: string): Integer;
  end;

implementation

end.

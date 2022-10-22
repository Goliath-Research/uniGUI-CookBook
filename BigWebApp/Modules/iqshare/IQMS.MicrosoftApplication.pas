unit IQMS.MicrosoftApplication;

interface

type
  IMicrosoftApplication = interface
    ['{C1F467F1-2CE4-41C7-95F3-F387369B2B28}']
    function Version: Integer;
    function IsInstalled: Boolean;
    function Connect: Boolean;
    procedure Disconnect;
    function IsConnected: Boolean;
    function Application: OLEVariant;
  end;

implementation

end.

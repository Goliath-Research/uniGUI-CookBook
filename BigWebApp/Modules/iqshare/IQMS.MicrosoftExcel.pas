unit IQMS.MicrosoftExcel;

interface

uses
  IQMS.MicrosoftApplication;

type
  IMicrosoftExcel = interface(IMicrosoftApplication)
    ['{587BBC18-FB8C-4252-A128-B6E496D5138A}']
    // In IMicrosoftApplication:
    // function Version: Integer;
    // function IsInstalled: Boolean;
    // function Connect: Boolean;
    // procedure Disconnect;
    // function IsConnected: Boolean;
    // function Application: OLEVariant;
    procedure NewWorkbook;
    procedure OpenWorkbook(const AFileName: string; const AReadOnly: Boolean);
    procedure SaveWorkbook;
    procedure SaveAsWorkbook(const ANewFileName: string);
    procedure CloseWorkbook;
    function ActiveWorkbook: OLEVariant;
    function ActiveSheet: OLEVariant;
  end;

implementation

end.

unit IQMS.Web.MicrosoftWord;

interface

uses
  IQMS.Web.MicrosoftApplication;

type
  IMicrosoftWord = interface(IMicrosoftApplication)
    ['{587BBC18-FB8C-4252-A128-B6E496D5138A}']
    // In IMicrosoftApplication:
    // function Version: Integer;
    // function IsInstalled: Boolean;
    // function Connect: Boolean;
    // procedure Disconnect;
    // function IsConnected: Boolean;
    // function Application: OLEVariant;
    procedure NewDocument;
    procedure OpenDocument(const AFileName: string; const AReadOnly: Boolean);
    procedure SaveDocument;
    procedure SaveAsDocument(const ANewFileName: string);
    procedure CloseDocument;
    function ActiveDocument: OLEVariant;
    function Selection: OLEVariant;
  end;

implementation

end.

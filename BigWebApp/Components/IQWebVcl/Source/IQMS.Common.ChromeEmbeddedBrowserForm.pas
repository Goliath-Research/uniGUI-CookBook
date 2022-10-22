unit IQMS.Common.ChromeEmbeddedBrowserForm;

interface

uses
   System.SysUtils, IQMS.Common.ChromeEmbeddedBrowser,
   IQMS.Common.DotNetInteropServer, IQMS.Common.DotNetInteropInterfacedObject;

type
  TChromeEmbeddedBrowserForm = class(TDNetInteropInterfacedObject, IChromeEmbeddedBrowser)
  public
    constructor Create(ADNetInteropServer: IDNetInteropServer); override;

    class procedure DoShow(
      AURL: string;
      AHelpFileName: string = '';
      AHelpContext: string = '';
      AShowCloseButton: Boolean = False;
      AShowMaximized: Boolean = False); static;

    procedure Show(
      AURL: string;
      AHelpFileName: string = '';
      AHelpContext: string = '';
      AShowCloseButton: Boolean = False;
      AShowMaximized: Boolean = False);

    procedure ShowDialog(
      AURL: string;
      AHelpFileName: string = '';
      AHelpContext: string = '';
      AShowCloseButton: Boolean = False;
      AShowMaximized: Boolean = False);
  end;

implementation

uses
  IQMS.Common.DotNetInterop,
  StrUtils,
  IQMS.WebVcl.SecurityManager;

{ TChromeEmbeddedBrowserForm }

constructor TChromeEmbeddedBrowserForm.Create(ADNetInteropServer: IDNetInteropServer);
begin
  inherited Create(ADNetInteropServer);
  AssignLibrary(
    'ChromeEmbeddedFramework',
    'ChromeEmbeddedFramework.IQInterface',
    'IQInterface');
end;

class procedure TChromeEmbeddedBrowserForm.DoShow(AURL, AHelpFileName, AHelpContext: string;
  AShowCloseButton, AShowMaximized: Boolean);
var
  AChromeEmbeddedBrowserForm: IChromeEmbeddedBrowser;
  ADNetInteropServer: IDNetInteropServer;
begin
  ADNetInteropServer := TDNetInterop.Create;
  AChromeEmbeddedBrowserForm := TChromeEmbeddedBrowserForm.Create(ADNetInteropServer);
  AChromeEmbeddedBrowserForm.ShowDialog(
    AURL,
    AHelpFileName,
    AHelpContext,
    AShowCloseButton,
    AShowMaximized
    );
end;

procedure TChromeEmbeddedBrowserForm.Show(
  AURL,
  AHelpFileName,
  AHelpContext: string;
  AShowCloseButton,
  AShowMaximized: Boolean);
begin
  CreateServerObjects;

  DisableFPUExceptions;
  try
    DNetInteropServer.InvokeActionEx(
      Invoker,
      'Show',
      [AURL,
      AHelpFileName,
      AHelpContext,
      IfThen(AShowCloseButton, 'true', 'false'),
      IfThen(AShowMaximized, 'true', 'false')
      ]);
  finally
    EnableFPUExceptions;
  end;

  FreeServerObjects;
end;

procedure TChromeEmbeddedBrowserForm.ShowDialog(
  AURL,
  AHelpFileName,
  AHelpContext: string;
  AShowCloseButton,
  AShowMaximized: Boolean);
begin
  CreateServerObjects;

  DisableFPUExceptions;
  try
    DNetInteropServer.InvokeActionEx(
      Invoker,
      'ShowDialog',
      [AURL,
      AHelpFileName,
      AHelpContext,
      IfThen(AShowCloseButton, 'true', 'false'),
      IfThen(AShowMaximized, 'true', 'false')
      ]);
  finally
    EnableFPUExceptions;
  end;

  FreeServerObjects;
end;

end.

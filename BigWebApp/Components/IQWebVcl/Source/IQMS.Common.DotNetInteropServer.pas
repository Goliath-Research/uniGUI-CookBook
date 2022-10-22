unit IQMS.Common.DotNetInteropServer;

interface

uses
  IQMS.Common.DotNetCOMInteropConst;

const
  DNetCurrentVersion = '';

type
  IDNetInteropServer = interface
    ['{63DDB4EB-D5BF-4DCA-A304-1779B3A7E596}']

    procedure EnableFPUExceptions(const AEnabled: Boolean; var CW: Word);

    procedure Connect(
      const ADNetDLLName: string;
      const ADNetComType: string;
      var AServer: Variant);

    procedure ConnectFactory(
      const ADNetDLLName: string;
      const ADNetComType: string;
      var AServer: Variant;
      const AHandleFPUExceptions: Boolean = True);

    procedure ConnectInvoker(
      const ADNetFactory: Variant;
      const AInvokerDLL: string;
      const AInvokerComType: string;
      const AInvokerParam: string;
      var ADNetInvoker: Variant;
      AHandleFPUExceptions: Boolean = True);

    procedure InvokeAction(
      const AServer: Variant;
      const AActionName: string);

    procedure InvokeActionEx(
      const AServer: Variant;
      const AActionName: string;
      const AParams: array of Variant);

    function InvokeFunction(
      const AServer: Variant;
      const AActionName: string): Variant;

    function InvokeFunctionEx(
      const AServer: Variant;
      const AActionName: string;
      const AParams: array of Variant): Variant;

    procedure Disconnect(AServer: Variant);
  end;

implementation

end.

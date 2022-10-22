unit Avalara;

interface

uses
  SysUtils,
  Windows,
  Types,
  Classes,
  Variants;

const
  DOTNETDLL = 'IQMS.HttpServices';
  DOTNETGETTAX_COMTYPE = 'IQMS.HttpServices.AvaTax';

 type TIQMSCom = class
  public
    IQMSComFactory: Variant;
    constructor Create(AOwner : TComponent);
    destructor Destroy; override;
 end;

 type TAvalaraGetTax = class
  private
    FIQMSCom : TIQMSCom;
    FCW : Word;

  public
    AvalaraGetTaxInvoker: Variant;
    function Ping(AEplantId: Real): Boolean;
    function GetTax(ASource: String; ASourceID: Real; AFinalize: Boolean = false): Boolean;
    function BatchGetTax(ABatchId: Real; ASource: String = 'ARINVOICE'): Boolean;
    function VoidTax(ASource: String; ASourceID: Real): Boolean;
    function DeleteTax(ASource: String; ASourceID: Real): Boolean;
    constructor Create(AOwner : TComponent);
    destructor Destroy; override;
 end;

function AvalaraEnabled(AEplantId: Real): Boolean;

implementation

uses
  IQMS.Common.DotNetCOMInterOp,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.DotNetCOMInteropConst;
//  IQMS.Common.DNetInteropConst;

function AvalaraEnabled(AEplantId: Real): Boolean;
begin
Result := SelectValueFmtAsString('select iqsys3_settings.get_avalara_enabled(%.0f) from dual', [AEplantID]) = 'Y';
end;

constructor TAvalaraGetTax.Create(AOwner: TComponent);
begin
  DisableFPUExceptions(FCW); //re-enabled in destructor

  FIQMSCom := TIQMSCom.Create (AOwner);
  CreateDNetCOM_Invoker(FIQMSCom.IQMSComFactory, AvalaraGetTaxInvoker, DOTNETDLL, DOTNETGETTAX_COMTYPE, 'GetTaxService');
end;

destructor TAvalaraGetTax.Destroy;
begin
  FIQMSCom.Free;
  FreeDNetObject( AvalaraGetTaxInvoker );
  RestoreFPU( FCW );
  inherited Destroy;
end;


function TAvalaraGetTax.Ping(AEplantId: Real): Boolean;
var
  aParamArray : array of Variant;
  args: Variant;
begin
  //one param for GetTax, so set length to 0
  aParamArray:= VarArrayCreate([0,0], varVariant);
  //Set param in the param array
  aParamArray[0]:= AEplantId;
  //Convert Array to Variant that can be passed thru COM
  args:= CreateParamListAsVariant( aParamArray );

  Result := AvalaraGetTaxInvoker.InvokeFunctionEx('Ping', args);
end;

function TAvalaraGetTax.GetTax(ASource: String; ASourceID: Real;
  AFinalize: Boolean): Boolean;
var
  aParamArray : array of Variant;
  args: Variant;
begin
  //three params for GetTax, so set length to 2
  aParamArray:= VarArrayCreate([0,2], varVariant);
  //Set param in the param array
  aParamArray[0]:= ASource;
  aParamArray[1]:= ASourceID;
  aParamArray[2]:= AFinalize;
  //Convert Array to Variant that can be passed thru COM
  args:= CreateParamListAsVariant( aParamArray );

  Result := AvalaraGetTaxInvoker.InvokeFunctionEx('GetTax', args);
  if not Result then
    raise Exception.Create(AvalaraGetTaxInvoker.InvokeFunction('GetLastError'));
end;

function TAvalaraGetTax.BatchGetTax(ABatchId: Real; ASource: String = 'ARINVOICE'): Boolean;
var
  aParamArray : array of Variant;
  args: Variant;
begin
  //two params for BatchGetTax, so set length to 1
  aParamArray:= VarArrayCreate([0,1], varVariant);
  //Set param in the param array
  aParamArray[0]:= ASource;
  aParamArray[1]:= ABatchId;
  //Convert Array to Variant that can be passed thru COM
  args:= CreateParamListAsVariant( aParamArray );

  Result := AvalaraGetTaxInvoker.InvokeFunctionEx('BatchGetTax', args);
  if not Result then
    raise Exception.Create(
      Format('Encountered errors uploading batch invoices: '#10#13'%s'#10#13'Some invocies may need to be uploaded individually.',
        [AvalaraGetTaxInvoker.InvokeFunction('GetLastError')]));
end;

function TAvalaraGetTax.VoidTax(ASource: String; ASourceID: Real): Boolean;
var
  aParamArray : array of Variant;
  args: Variant;
begin
  //two params for VoidTax, so set length to 1
  aParamArray:= VarArrayCreate([0,1], varVariant);
  //Set param in the param array
  aParamArray[0]:= ASource;
  aParamArray[1]:= ASourceID;
  //Convert Array to Variant that can be passed thru COM
  args:= CreateParamListAsVariant( aParamArray );

  Result := AvalaraGetTaxInvoker.InvokeFunctionEx('VoidTax', args);
  if not Result then
    raise Exception.Create(AvalaraGetTaxInvoker.InvokeFunction('GetLastError'));
end;

function TAvalaraGetTax.DeleteTax(ASource: String; ASourceID: Real): Boolean;
var
  aParamArray : array of Variant;
  args: Variant;
begin
  //two params for DeleteTax, so set length to 1
  aParamArray:= VarArrayCreate([0,1], varVariant);
  //Set param in the param array
  aParamArray[0]:= ASource;
  aParamArray[1]:= ASourceID;
  //Convert Array to Variant that can be passed thru COM
  args:= CreateParamListAsVariant( aParamArray );

  Result := AvalaraGetTaxInvoker.InvokeFunctionEx('DeleteTax', args);
  if not Result then
    raise Exception.Create(AvalaraGetTaxInvoker.InvokeFunction('GetLastError'));
end;

{ IQMSCom }

constructor TIQMSCom.Create(AOwner: TComponent);
begin
      CreateDNetCOM_Factory(IQMSComFactory, DNetFactoryDLL, SecurityManager, false);
end;

destructor TIQMSCom.Destroy;
begin
  FreeDNetObject( IQMSComFactory );
  inherited Destroy;
end;

end.

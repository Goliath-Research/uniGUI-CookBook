unit IQMS.Common.DotNetCOMInterOp;

interface

uses
  (*UG_rem_AMB*)
  IQMS.WebVcl.SecurityManager,
  (*UG_rem_AMB*)
  IQMS.Common.DotNetCOMInteropConst;

//const
//  DNetVersion1_1_4322  = 'v1.1.4322';
//  DNetVersion2_0_50727 = 'v2.0.50727';
//  DNetVersion3_5 = 'v3.5';
//  DNetVersion4_0_30319 = 'v4.0.30319';
//
//  // Generally supportted .Net version
//  DNetCurrentVersion = DNetVersion4_0_30319; //DNetVersion4_0_30319;
//
//  DNetFactoryDLL = 'iqms.com';
//  DNetFactoryCOMType = 'IQMS.COM.Factory.InvokerFactory';

  procedure DisableFPUExceptions( var CW:Word );
  procedure CreateDNetCOM( var DNetObject:Variant;
                           DNetDLLName,
                           DNetComType:String;
                           DNetFrameworkVersion: String = DNetCurrentVersion;
                           AOverrideLocalHomePath:String = '' );

  procedure FreeDNetObject( var DNetObject:Variant );
  procedure RestoreFPU( CW:Word );

  function CreateDNetCOM_Ex( var DNetObject:Variant;
                                 DNetDLLName,
                                 DNetComType:String;
                                 DNetFrameworkVersion:String = DNetCurrentVersion;
                                 AOverrideLocalHomePath:String = '' ): Boolean;
  (*UG_rem_AMB*)
  procedure CreateDNetCOM_Factory( var ADNetFactory     : Variant;
                                   AInvokerDLL      : string;
                                   ASecurityManager : TSecurityManager;
                                   AFreeObjs : boolean = TRUE;
                                   AHandleFPUExceptions : boolean = TRUE;
                                   ADNetFrameworkVersion :string = DNetCurrentVersion;
                                   AOverrideLocalHomePath:string = '');

  procedure CreateDNetCOM_Invoker( ADNetFactory   : Variant; //created in CreateDNetCOM_Factory
                                 var ADNetInvoker : Variant;
                                 AInvokerDLL      : string;
                                 AInvokerComType  : string;
                                 AInvokerParam    : string = '';
                                 AHandleFPUExceptions : boolean = TRUE;
                                 AOverrideLocalHomePath:string = '' );



  procedure FreeDNetObject_Ex( var DNetObject: Variant );
  procedure DisposeAndFreeDNetObject_Ex( var DNetObject: Variant );
  function CreateParamListAsVariant( AParams : array of Variant ) : Variant;


implementation

uses
  System.SysUtils,
  System.Win.ComObj,
  IQMS.Common.DotNetRegister,
  System.Variants,
  Vcl.Forms,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils;


{wrapper}
// Ex. CreateDNetCom( CRDNetVar, 'IQRep', 'DNetRepdef.TFrmDNetRepDef' )
function CreateDNetCOM_Ex( var DNetObject:Variant;
                               DNetDLLName,
                               DNetComType:String;
                               DNetFrameworkVersion:String;
                               AOverrideLocalHomePath:String): Boolean;
begin
  Result:= TRUE;
  if VarIsEmpty( DNetObject ) then
  try
    CreateDNetCOM( DNetObject, DNetDLLName, DNetComType, DNetFrameworkVersion,
      AOverrideLocalHomePath );
  except on E: Exception do
    begin
      Result:= FALSE;
      Application.ShowException(E);
    end;
  end;
end;

{wrapper}
procedure FreeDNetObject_Ex( var DNetObject: Variant );
begin
  if not VarIsEmpty( DNetObject ) then
     FreeDNetObject( DNetObject );
end;

{wrapper}
procedure DisposeAndFreeDNetObject_Ex( var DNetObject: Variant );
begin
  if not VarIsEmpty( DNetObject ) then
  begin
    try
      DNetObject.Dispose;
except
end;

    FreeDNetObject( DNetObject );
  end;

end;

//
// Ex. CreateDNetCom( CRDNetVar, 'IQRep', 'DNetRepdef.TFrmDNetRepDef' )
//
procedure CreateDNetCOM( var DNetObject:Variant;
                             DNetDLLName,
                             DNetComType:String;
                             DNetFrameworkVersion: String;
                             AOverrideLocalHomePath:String);
var
  ATimes: Integer;
begin
  ATimes   := 1;

  repeat
    try
      // Launch. Register first if needed
      DNetObject:= CreateOleObject( DNetComType );
      BREAK;
    except on E: Exception do
      begin
         if ATimes >= 2 then
           raise;
           (*UG_rem_AMB*)
         if not IQRegAssemblyForCom( DNetDLLName, DNetFrameworkVersion,
            AOverrideLocalHomePath ) then
            ABORT;
      end;
    end;

    Inc(ATimes);
  until FALSE;
end;


procedure RestoreFPU( CW:Word );
begin
  // Restore original FPU State. See CheckDisableFPUExceptions
  begin
    Set8087CW( CW );
  end;
end;


procedure DisableFPUExceptions( var CW:Word );
begin
  { If accessing .NET via com call we need to disable FPU exceptions b/c win32 attempts to track
    the address in memory of a .NET object. }
  CW:= Get8087CW; // the current value of the floating-point unit control word.
                  // This control word controls the precision of floating point calculations,
                  // the rounding mode, and whether certain floating-point operations trigger exceptions.
                  // See Intel's processor documentation for details.

  // Disable FPU exceptions
  Set8087CW( $133f );
end;


procedure FreeDNetObject( var DNetObject: Variant );
begin
  varClear( DNetObject );
end;

  (*UG_rem_AMB*)
procedure CreateDNetCOM_Factory( var ADNetFactory     : Variant;
                                     AInvokerDLL      : string;
                                     ASecurityManager : TSecurityManager;
                                     AFreeObjs : boolean = TRUE;
                                     AHandleFPUExceptions : boolean = TRUE;
                                     ADNetFrameworkVersion :string = DNetCurrentVersion;
                                     AOverrideLocalHomePath:string = '' );
var
  CW : Word;
  ATimes : integer;
begin
  if AHandleFPUExceptions then
    DisableFPUExceptions(CW);
  try
    ATimes:= 1;
    repeat
      try
        CreateDNetCOM( ADNETFactory,
                       DNetFactoryDLL,
                       DNetFactoryCOMType );

        if Assigned(ASecurityManager) then
        begin
          ADNetFactory.Authenticate( ASecurityManager.ServerName,
                                     ASecurityManager.UserName,
                                     CharXOR(ASecurityManager.Password),
                                     ASecurityManager.EPlant_ID_AsInteger );
        end
        else raise Exception.Create(
          'Application Error:  Security Manager must be assigned for authentication.');

        BREAK;
      except on E: exception do
        begin
          if ATimes >= 2 then
            raise;
          if ( not IQRegAssemblyForCom( DNetFactoryDLL, DNetCurrentVersion, AOverrideLocalHomePath ) )
          and
             ( not IQRegAssemblyForCom( AInvokerDLL, DNetCurrentVersion, AOverrideLocalHomePath ) ) then
            ABORT;
        end;
      end;
      Inc(ATimes);
    until FALSE;
  finally
    begin
      if AFreeObjs then
        FreeDNetObject( ADNetFactory );

      if AHandleFPUExceptions then
        RestoreFPU(CW);
    end;
  end;
end;


procedure CreateDNetCOM_Invoker( ADNetFactory     : Variant; //created in CreateDNetCOM_Factory
                                 var ADNetInvoker : Variant;
                                 AInvokerDLL      : string;
                                 AInvokerComType  : string;
                                 AInvokerParam    : string = '';
                                 AHandleFPUExceptions : boolean = TRUE;
                                 AOverrideLocalHomePath:string = '' );
var
  CW : Word;
  ATimes : integer;
begin
  if AHandleFPUExceptions then
    DisableFPUExceptions(CW);
  try
    ATimes:= 1;
    repeat
      try
        ADNetInvoker := ADNetFactory.NewInvoker( Format('%s.dll', [AInvokerDLL]), AInvokerComType, AInvokerParam );
        ADNetInvoker.Init;
        BREAK;
      except on E: exception do
        begin
          if ATimes >= 2 then
            raise;
            (*UG_rem_AMB*)
          if ( not IQRegAssemblyForCom( DNetFactoryDLL, DNetCurrentVersion, AOverrideLocalHomePath ) )
          and
             ( not IQRegAssemblyForCom( AInvokerDLL, DNetCurrentVersion, AOverrideLocalHomePath ) ) then
            ABORT;
        end;
      end;
      Inc(ATimes);
    until FALSE;
  finally
    RestoreFPU(CW);
  end;
end;

function CreateParamListAsVariant( AParams : array of Variant ) : Variant;
var
  i : integer;
begin
  //Convert an array of parameters into a single Variant
  //which can be passed through COM. Values need to be assigned
  //to elements of the array before calling this method
  Result:= VarArrayCreate( [ 0, High(AParams) ], varVariant);
  for i:= 0 to High(AParams) do
    Result[i]:= AParams[i];
end;


end.

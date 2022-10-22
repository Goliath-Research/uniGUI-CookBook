unit IQMS.Common.HTTPServicesProxy;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
     IQMS.Common.DotNetCOMInterOp ,IQMS.Common.DotNetInteropConst,IQMS.WebVcl.SecurityManager;

type
  TMSDS_Params = record
    MonActDtlId : Real;
    WebServiceURI         : string;
    WebServiceLoginName   : string;
    WebServicePassword    : string;
    FTPURI         : string;
    FTPLoginName   : string;
    FTPPassword    : string;
    CompanyName    : string;
  end;

function MSDS_Sync( AMSDS_Params: TMSDS_Params ): Boolean;
function SpotRate: Boolean;
function TaxCodes(AMonActDtlId: Real): Boolean;
function HubSpot: Boolean;
function HubSpotUpload: Boolean;
function SalesforceSync: Boolean;

implementation

uses IQMS.Common.StringUtils;

const
  ASSEMBLY_NAME          = 'IQMS.HttpServices';

function MSDS_Sync( AMSDS_Params: TMSDS_Params ): Boolean;
const
  DEREFERNCED_CLASS_NAME = 'IQMS.HttpServices.MSDS';
var
  ADNetObject: Variant;
  CW         : Word;
begin
  DisableFPUExceptions( CW );
  try
    CreateDNetCom( ADNetObject, ASSEMBLY_NAME, DEREFERNCED_CLASS_NAME);
    try
      ADNetObject.MonActDtlId        := AMSDS_Params.MonActDtlId;
      ADNetObject.WebServiceURL      := AMSDS_Params.WebServiceURI;
      ADNetObject.WebServiceUsername := AMSDS_Params.WebServiceLoginName;
      ADNetObject.WebServicePassword := AMSDS_Params.WebServicePassword;
      ADNetObject.FTPURL             := AMSDS_Params.FTPURI;
      ADNetObject.FTPUsername        := AMSDS_Params.FTPLoginName;
      ADNetObject.FTPPassword        := AMSDS_Params.FTPPassword;
      ADNetObject.CompanyName        := AMSDS_Params.CompanyName;

      // Execute
      Result := ADNetObject.ProcessMSDSUpload;
      Result := Result and ADNetObject.ProcessCustomersOrdersUpload;
    finally
     FreeDNetObject( ADNetObject );
    end;
  finally
    RestoreFPU( CW );
  end;
end;

function SpotRate: Boolean;
const
  DEREFERNCED_CLASS_NAME = 'IQMS.HttpServices.Currency';
var
  ADNetObject: Variant;
  CW         : Word;
begin
  DisableFPUExceptions( CW );
  try
    CreateDNetCom( ADNetObject, ASSEMBLY_NAME, DEREFERNCED_CLASS_NAME);
    try
      // Execute
      Result := ADNetObject.GetAllCurrencies;
    finally
     FreeDNetObject( ADNetObject );
    end;
  finally
    RestoreFPU( CW );
  end;
end;

function TaxCodes(AMonActDtlId: Real): Boolean;
const
  DEREFERNCED_CLASS_NAME = 'IQMS.HttpServices.TaxCodes';
var
  aCOMFactory,
  aCOMInvoker : Variant;
  CW         : Word;
begin
  DisableFPUExceptions( CW );
  try
    //create factory
    (*UG_rem_AMB*)
    CreateDNetCOM_Factory( aCOMFactory,
                           DNetFactoryDLL,
                           SecurityManager,
                           FALSE, //freed in this method
                           FALSE  //restore FPU here
                          );

    //create invoker object using COM factory
    CreateDNetCOM_Invoker( aCOMFactory,
                           aCOMInvoker,
                           ASSEMBLY_NAME,
                           DEREFERNCED_CLASS_NAME,
                           DEREFERNCED_CLASS_NAME ); //used as a key, only because it's mandatory param

    try
      // Execute
      aCOMInvoker.SetFieldValue('MonActDtlId', AMonActDtlId);
      Result := aCOMInvoker.InvokeFunction('GetAllTaxCodes');
    finally
      begin
        FreeDNetObject_Ex( aCOMInvoker );
        FreeDNetObject_Ex( aCOMFactory );
      end;
    end;
  finally
    RestoreFPU( CW );
  end;
end;

function HubSpot: Boolean;
const
  IQMSCOM_DLL_NAME = 'IQMS.COM';
  IS_DLL_NAME = 'IQMS.HttpServices';
  IS_CLASS_NAME = 'IQMS.HttpServices.IntegrationServicesSync';
  INSTANCE_NAME = 'HubSpotDownload';
var
  Factory: Variant;
  Invoker: Variant;
begin
  try
        (*UG_rem_AMB*)
    CreateDNetCOM_Factory( Factory, IQMSCOM_DLL_NAME, SecurityManager, FALSE, TRUE );

    try
      CreateDNetCOM_Invoker( Factory, Invoker, IS_DLL_NAME, IS_CLASS_NAME, INSTANCE_NAME );

      Result := Invoker.InvokeFunction('SyncDownHubSpot');
    finally
     FreeDNetObject( Invoker );
    end;
  finally
    FreeDNetObject( Factory );
  end;
end;

function HubSpotUpload: Boolean;
const
  IQMSCOM_DLL_NAME = 'IQMS.COM';
  IS_DLL_NAME = 'IQMS.HttpServices';
  IS_CLASS_NAME = 'IQMS.HttpServices.IntegrationServicesSync';
  INSTANCE_NAME = 'HubSpotUpload';
var
  Factory: Variant;
  Invoker: Variant;
begin
  try
      (*UG_rem_AMB*)
    CreateDNetCOM_Factory( Factory, IQMSCOM_DLL_NAME, SecurityManager, FALSE, TRUE );

    try
      CreateDNetCOM_Invoker( Factory, Invoker, IS_DLL_NAME, IS_CLASS_NAME, INSTANCE_NAME );

      Result := Invoker.InvokeFunction('SyncUpHubSpot');
    finally
     FreeDNetObject( Invoker );
    end;
  finally
    FreeDNetObject( Factory );
  end;
end;

function SalesforceSync: Boolean;
const
  IQMSCOM_DLL_NAME = 'IQMS.COM';
  IS_DLL_NAME = 'IQMS.HttpServices';
  IS_CLASS_NAME = 'IQMS.HttpServices.IntegrationServicesSync';
  INSTANCE_NAME = 'SalesforceSync';
var
  Factory: Variant;
  Invoker: Variant;
begin
  try
        (*UG_rem_AMB*)
    CreateDNetCOM_Factory( Factory, IQMSCOM_DLL_NAME, SecurityManager, FALSE, TRUE );

    try
      CreateDNetCOM_Invoker( Factory, Invoker, IS_DLL_NAME, IS_CLASS_NAME, INSTANCE_NAME );

      Result := Invoker.InvokeFunction('SyncSalesforce');
    finally
     FreeDNetObject( Invoker );
    end;
  finally
    FreeDNetObject( Factory );
  end;
end;

end.





unit IQMS.Common.RequestProxy;

interface

uses Winapi.Windows, IQMS.Common.DotNetCOMInterOp;

type
  THTTPS_Params = record
    URI         : string;
    LoginName   : string;
    Password    : string;
    LoginKey    : string;
    CargoString : string;
  end;

function IQREST_SubmitRequest( AHTTPS_Params: THTTPS_Params ): string;
function IQMakeStrURLSafe( S: string ): string;

implementation

uses IQMS.Common.StringUtils;

const
  ASSEMBLY_NAME          = 'WebRESTService';
  DEREFERNCED_CLASS_NAME = 'WebRESTSrvc.TWebRESTService';

function IQREST_SubmitRequest( AHTTPS_Params: THTTPS_Params ): string;
var
  ADNetObject: Variant;
  CW         : Word;
begin
  DisableFPUExceptions( CW );
  try
    CreateDNetCom( ADNetObject, ASSEMBLY_NAME, DEREFERNCED_CLASS_NAME );
    try
      ADNetObject.WebServiceURI     := AHTTPS_Params.URI;                                          {'https://genet.geappliances.com/ePS/Dispatcher'}
      ADNetObject.LoginKeyForSuccess:= AHTTPS_Params.LoginKey;                                     {'YOU HAVE AN ANCIENT BROWSER'}
      ADNetObject.TimeOutPeriod     := 10000;
      ADNetObject.ContentType       := 'text/html';

      ADNetObject.AddLoginParam( 'REQUEST=SIGNON' );
      ADNetObject.AddLoginParam( 'UID='      + IQMakeStrURLSafe( AHTTPS_Params.LoginName ));       {HttpUtility.UrlEncode( AUID );  // UrlEncode just makes string url safe. i.e. space converts to %20}
      ADNetObject.AddLoginParam( 'PASSWORD=' + IQMakeStrURLSafe( AHTTPS_Params.Password  ));

      // Params to pass for transaction
      ADNetObject.AddSubmitParam( 'REQUEST=XML_ESLIP' );
      ADNetObject.AddSubmitParam( 'xmlString=' + StrTran( AHTTPS_Params.CargoString, '"', '''' ));  {Note: we need to replace double quotes with single quotes to send over web}

      // Execute
      Result:= ADNetObject.DoGetService;
    finally
     FreeDNetObject( ADNetObject );
    end;
  finally
    RestoreFPU( CW );
  end;
end;

function IQMakeStrURLSafe( S: string ): string;
begin
  Result:= StrTran( S, ' ', '%20' );   {IQString.pas}
end;

end.

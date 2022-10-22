unit IQMS.Common.StandardExceptions;

interface

uses
  System.SysUtils;

type
  EIQMSException = class(Exception);
  EIQMSDataException = class(EIQMSException);

  EIQMSInvalidDatasetType = class(EIQMSDataException);

  EIQMSLoginException = class(EIQMSDataException);

  EIQMSDBEngineError = class(EIQMSDataException)
  private
    FNativeError: Integer;
  public
    constructor Create( const Mesg: string; ANativeError: Integer );
    property NativeError: Integer read FNativeError write FNativeError;
  end;

  EIQMSInvalidLogin = class(EIQMSLoginException);

  EIQMSSameUserLoggedIn = class(EIQMSLoginException);

  EIQMSMaxLoginAttemptExceeded = class(EIQMSLoginException);

  EIQMSExpiredTemporaryPassword = class(EIQMSLoginException);

  EIQMSPasswordChangeRequired = class(EIQMSLoginException);


// error messages
const
  INVALID_DATASET_TYPE = 'Invalid dataset type. The system was unable to find a supported dataset type';

implementation

{ EGetValException }

constructor EIQMSDBEngineError.Create(const Mesg: string; ANativeError: Integer);
begin
  inherited Create( Mesg );
  FNativeError:= ANativeError;
end;



end.

unit IQMS.Common.COMShare;

interface
  uses Winapi.Windows;

const
  CODE_BASE = $200;   //recommended codes are from 0x0200 - 0xFFFF

  EXEC_COM_CMD_CHECK_CIRCULAR_REF = 'CHK_CIR_COM_REF';
  EXEC_REDIRECT_THROUGH_IQWIN32 = 'REDIRECT_THRU_IQWIN32';
  EXEC_LAUNCH_SECURITY_INSPECTOR_THROUGH_IQWIN32 = 'SECURITY_INSPECTOR_THRU_IQWIN32';
  EXEC_FREE_LICENSE_PASS = 'FREE_LICENSE_PASS';

  IQINTF_NAME = 'IQShell';

  function ErrorNumberToHResult( ErrorNumber : integer ) : HResult;
  function HResultToErrorNumber( hr : HResult ) : integer;
  function IQGetComputerName: string;

implementation

function ErrorNumberToHResult (ErrorNumber : integer) : HResult;
const
  SEVERITY_ERROR = 1;
  FACILITY_ITF = 4;
begin
  Result := (SEVERITY_ERROR shl 31) or (FACILITY_ITF shl 16) or word (ErrorNumber);
end;

function HResultToErrorNumber (hr : HResult) : integer;
begin
  Result := (hr and $FFFF);
end;

function IQGetComputerName: string;
var
  LocalMachine: array [0..MAX_COMPUTERNAME_LENGTH] of char;
  Size: DWord;
begin
  Size := Sizeof( LocalMachine );
  if GetComputerName( LocalMachine, Size ) then
     Result:= LocalMachine
  else
     Result:= '';
end;

end.

{ On Client side:
-----------------
try
  ...
except
  on E : EOleException do
    ShowMessage ('Error message: ' + E.Message + #13 +
                 'Error number: ' + IntToStr (HResultToErrorNumber (E.ErrorCode) - CODE_BASE) + #13 +
                 'Source: ' + E.Source + #13 +
                 'HelpFile: ' + E.HelpFile + #13 +
                 'HelpContext: ' + IntToStr (E.HelpContext)
                );
end;
}


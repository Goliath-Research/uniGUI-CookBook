unit dbterrorlog;

(* * Error logging *

  This unit may be used externally.
  
*)

interface

uses
  SysUtils,
  IQMS.Common.WriteLogFile;


  // Error Log routines
  procedure ErrorLog_Clear;
  procedure ErrorLog_Add( S: String );
  function ErrorLog_HasErrors: Boolean;
  procedure ErrorLog_Display;
  procedure DoErrorLogPromptCheck;
  function GetErrorLogFileName: String;

var
  FErrorLog: TIQLogFile;
  FErrorCount: Integer;

implementation

uses
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.EditMemoStr,
  IQMS.Common.StringUtils,
  IQMS.Common.NLS,
  IQMS.Common.Numbers;

procedure ErrorLog_Clear;
begin
  if Assigned( FErrorLog ) then FErrorLog.Clear;
  FErrorCount := 0;
end;

procedure ErrorLog_Add( S: String );
begin
  if not Assigned( FErrorLog ) then Exit;

  FErrorLog.Write( Format( '%d.) %s', [FErrorCount + 1, Repl( '=', 50 ) ] ));
  FErrorLog.Write( S );
  FErrorLog.Write( '' );
  Inc( FErrorCount );
end;

function ErrorLog_HasErrors: Boolean;
begin
  Result := FErrorCount > 0;
end;

procedure ErrorLog_Display;
var
   S: String;
begin
  if Assigned( FErrorLog ) then
     FErrorLog.Show;
end;

procedure DoErrorLogPromptCheck;
begin
     if ErrorLog_HasErrors then ErrorLog_Display;
end;

function GetErrorLogFileName: String;
begin
  Result := '';
  if Assigned(FErrorLog) then
     Result := FErrorLog.FileName;
end;

end.

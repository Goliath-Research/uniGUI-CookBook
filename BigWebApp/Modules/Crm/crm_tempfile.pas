unit crm_tempfile;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants;

// These methods return a unique temporary file name
function TempHTMLFile_Support: String;
function TempHTMLFile_ABSearch: String;
function TempHTMLFile_ABTopic: String;

// The methods purge temporary files
procedure PurgeTempHTMLFile_Support;
procedure PurgeTempHTMLFile_ABSearch;
procedure PurgeTempHTMLFile_ABTopic;

// Additional
function TempFileMask: String; // returns a mask that will match all temp files
// for this machine and user

// Used internally.  Do not call directly.
function TempFileOwner: String;

implementation

uses
  IQMS.Common.COMShare,
  IQMS.Common.Dates,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils;

{ -- Begin Core Methods -- }
function TempHTMLFile_Support: String;
var
  AFileName: String;
begin
  // File used for support search results
  AFileName := Format('%s%s001.HTML', [IQGetLocalHomePath, TempFileOwner]);
  Result := AFileName;
end;

function TempHTMLFile_ABSearch: String;
var
  AFileName: String;
begin
  // File used for Answer Book search results
  AFileName := Format('%s%s002.HTML', [IQGetLocalHomePath, TempFileOwner]);
  Result := AFileName;
end;

function TempHTMLFile_ABTopic: String;
var
  AFileName: String;
begin
  // File used for Answer Book topic display
  AFileName := Format('%s%s003.HTML', [IQGetLocalHomePath, TempFileOwner]);
  Result := AFileName;
end;

procedure PurgeTempHTMLFile_Support;
var
  AFileName: String;
begin
  // File used for support search results
  AFileName := Format('%s%s001.HTML', [IQGetLocalHomePath, TempFileOwner]);
  if FileExists(AFileName) then
    DeleteFile(AFileName);
end;

procedure PurgeTempHTMLFile_ABSearch;
var
  AFileName: String;
begin
  // File used for Answer Book search results
  AFileName := Format('%s%s002.HTML', [IQGetLocalHomePath, TempFileOwner]);
  if FileExists(AFileName) then
    DeleteFile(AFileName);
end;

procedure PurgeTempHTMLFile_ABTopic;
var
  AFileName: String;
begin
  // File used for Answer Book topic display
  AFileName := Format('%s%s003.HTML', [IQGetLocalHomePath, TempFileOwner]);
  if FileExists(AFileName) then
    DeleteFile(AFileName);
end;

{ -- End Core Methods -- }

function TempFileMask: String;
begin
  Result := Format('%s~IQ%s*.HTML', [IQGetLocalHomePath,
    LeftStr(IQGetComputerName, 10)]);
end;

{ -- Begin Internal Methods -- }
function TempFileOwner: String;
begin
  Result := Format('~IQ%s%d', [LeftStr(IQGetComputerName, 10),
    Trunc(IQOracleAdjustedDate)]);
end;
{ -- End Internal Methods -- }

end.

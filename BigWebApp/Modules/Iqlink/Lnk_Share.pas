unit Lnk_Share;

interface

uses
  Classes,
  SysUtils;

type
  TConnOrigin = ( coInBound, coOutBound  );
  
  function GetRandomFileName: string;
  procedure AddToLnkLogFile( S: AnsiString );
    
var
  LnkLogFile: string;
    
implementation

uses
  IQMS.Common.Dialogs,
  Forms;

function GetRandomFileName: string;
begin
  Randomize;
  Result:= Format('%s %s.txt', [ FormatDateTime('mm-dd-yy hh.nn.ss', Now), IntToStr( Random( 1000 ))] );
end;  

procedure AddToLnkLogFile( S: AnsiString );
var
  Stream: TStream;
begin
  try
    {Open file stream}
    if not FileExists( LnkLogFile ) then
       Stream:= TFileStream.Create( LnkLogFile, fmCreate )
    else   
       Stream:= TFileStream.Create( LnkLogFile, fmOpenReadWrite );
       
    {Write to a file}   
    try            
      Stream.Seek(0, soFromEnd);
      S:= #13#10+S;
      Stream.WriteBuffer( Pointer(S)^, Length(S) );
    finally
      Stream.Free;
    end;
  except on E: Exception do
    IQError(Format('Unable to write to file %s. Encountered Error: %s', [ LnkLogFile, E.Message ]));
  end;
end;

initialization
  LnkLogFile:= IncludeTrailingBackslash( ExtractFileDir( Application.ExeName )) + 'IQLnkLog.txt';


end.

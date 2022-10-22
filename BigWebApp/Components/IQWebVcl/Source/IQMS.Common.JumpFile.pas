unit IQMS.Common.JumpFile;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

  procedure CreateEIQJumpFile( AFileName: string; AMessageID: Integer; AID: Real );
  function ExtractFromEIQJumpFile( AFileName: string; var AMessageID, AID: Integer ): Boolean;
  procedure CheckInLineParamExecuteJumpingFile;

implementation

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.ResStrings,
  IQMS.WebVcl.Jump;

procedure CreateEIQJumpFile( AFileName: string; AMessageID: Integer; AID: Real );
var
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    AList.Add(Format('MessageID=%d',   [ AMessageID ]));
    AList.Add(Format('TargetID=%.0f',  [ AID ]));
    AList.SaveToFile( AFileName );
  finally
    AList.Free;
  end;
end;


procedure CheckInLineParamExecuteJumpingFile;
var
  I         : Integer;
  AMessageID: Integer;
  AID       : Integer;
begin
  for I:= 1 to ParamCount do
    if (CompareText( ExtractFileExt(ParamStr( I )), '.EIQ' ) = 0) then       {check if jump file was passed}
    begin
       if ExtractFromEIQJumpFile( ParamStr(I), AMessageID, AID ) then
          JumpDirect( AMessageID, AID, FALSE {use sendmessage});  {IQJump.pas}
       BREAK;
    end;
end;


function ExtractFromEIQJumpFile( AFileName: string; var AMessageID, AID: Integer ): Boolean;
var
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    AList.LoadFromFile( AFileName );
    AMessageID:= StrToIntDef( AList.Values[ 'MessageID' ], 0);
    AID       := StrToIntDef( AList.Values[ 'TargetID'  ], 0);
  finally
    AList.Free;
  end;
  Result:= (AMessageID > 0) and (AID <> 0);
end;



end.


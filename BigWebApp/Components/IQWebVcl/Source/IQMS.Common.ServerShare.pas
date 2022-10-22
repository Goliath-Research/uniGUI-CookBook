unit IQMS.Common.ServerShare;

interface
  uses
  Winapi.Windows,
  System.SysUtils,
  FireDAC.Comp.Client;

procedure Com_EnsureDBConnection( APacket: OleVariant; ADatabase: TFDConnection);

implementation

uses
//  IQMS.Common.Login,
  IQMS.Common.ResStrings;

function Com_GetUserName( APacket: OleVariant): string;
begin
  Result:= APacket[ 0 ];
end;

function Com_GetUserPassword( APacket: OleVariant): string;
begin
  Result:= APacket[ 1 ];
end;

procedure Com_EnsureDBConnection( APacket: OleVariant; ADatabase: TFDConnection);
begin
//  if not ADatabase.Connected and not SilentLogOnto( ADatabase, Com_GetUserName( APacket ), Com_GetUserPassword( APacket )) then
//     raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000173 {'User, %s, log in failed.'},
//                               [ Com_GetUserName( APacket ) ]);
end;

end.

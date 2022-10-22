unit IQMS.Common.DotNetRegister;

interface

function IQRegAssemblyForCom( AAssemblyFileName, DNetFrameworkVersion: string; AOverrideLocalHomePath:String = '' ): Boolean;

implementation

uses Vcl.Forms,
     System.SysUtils,
     IQMS.Common.StringUtils,
     FireDAC.Comp.Client,
     FireDAC.Comp.DataSet,
     FireDAC.Stan.Intf,
     FireDAC.Stan.Option,
     FireDAC.Stan.Error,
     FireDAC.Stan.Def,
     FireDAC.Stan.Pool,
     FireDAC.Stan.Async,
     FireDAC.Stan.Param,
     FireDAC.Phys,
     FireDAC.Phys.Intf,
     FireDAC.DatS,
     FireDAC.DApt,
     FireDAC.DApt.Intf,
     FireDAC.UI.Intf,
     IQMS.Common.Miscellaneous,
     IQMS.Common.Console;
     {*UG_rem_AE*}
     //  db_dm;

function IQRegAssemblyForCom( AAssemblyFileName, DNetFrameworkVersion: string; AOverrideLocalHomePath:String = '' ): Boolean;
const
  errStr = 'Unable to register .Net Assembly.  %s could not be found.';
var
  cmd, cRegasmExe, cAssemblyNamePath, APath:String;
begin
  Result:= FALSE;

  {*UG_rem_AE*}
//  if DNetFrameworkVersion = DNetVersion3_5 then
//    DNetFrameworkVersion:= DNetVersion2_0_50727; // no regasm.exe exists in .net 3.5

  // Hoping that Microsft.Net....etc path doesnt change per system.
  {*UG_rem_AE*}
//  cRegasmExe:= Format( '%sMicrosoft.Net\Framework\%s\RegAsm.exe', [ GetSpecialPath( evWindows ), DNetFrameworkVersion ] );

  {*UG_rem_AE*}
//  APath:= IQGetLocalHomePath;
  if AOverrideLocalHomePath <> '' then
    APath:= AOverrideLocalHomePath;

  cAssemblyNamePath:= Format( '%s%s.dll', [ APath, AAssemblyFileName ] );

  if not FileExists( cAssemblyNamePath ) then
    // Unable to register .Net Assembly.  %s could not be found.
    raise Exception.CreateFmt( errStr, [ cAssemblyNamePath, cAssemblyNamePath ]);

  if not FileExists( cRegasmExe ) then
  begin
    // try environment variable instead b/c GetSpecialPath returns wrong path on some systems
    cRegasmExe:= Format( '%sMicrosoft.Net\Framework\%s\RegAsm.exe', [ StrTran(GetEnvironmentVariable('SYSTEMROOT')+'\','\\','\'), DNetFrameworkVersion ] );
    if not FileExists( cRegasmExe ) then
      // Unable to register .Net Assembly.  %s could not be found.
      raise Exception.CreateFmt( errStr, [ cRegasmExe ]);
  end;

  cmd:= Format( '%s /silent /nologo "%s"', [ cRegasmExe, cAssemblyNamePath ] );

  {*UG_rem_AE*}
//  with TProcessConsole.Create( cmd, FALSE ) do
//  begin
//     try
//        while not Finished do
//           Application.ProcessMessages;
//        if not HasErrors then
//           Result:= TRUE;
//     finally Free;
//     end;
//  end;
end;

end.

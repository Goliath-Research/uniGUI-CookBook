unit IQMS.Common.COMExe;

interface

uses Winapi.Windows, Vcl.Forms, System.SysUtils, System.Variants, IQMS.Common.JumpConstants;

type
  TCom_SelfRefCargo = class
    Packet: array of Variant;
    constructor Create( APacket: array of Variant );
  end;

  // Primary method for executing a DCOM server
  // Example:
  //   Com_Exec( 'IQHR', [ Param1, Param2 ])
  function Com_Exec( AServerName: string; APacket: array of Variant ): Integer;

  // Extended method for executing a DCOM server; includes rarely used params.
  function Com_ExecEx( AServerName: string; APacket: array of Variant;
    AOverrideRedirect: Boolean; AFreeLicensePass: Boolean = False ): Integer;

  function Com_Exec_DNET(AAssemblyName, ANamespaceName:string; APacket: array of Variant ):Integer;

  procedure Com_LaunchSecurityInspector( AServerName: string );

implementation

uses
    IQMS.Common.COMServer,
    IQMS.Common.FileUtils,
    IQMS.Common.Dialogs,
    {*UG_rem_AE*}
    IQMS.Common.Miscellaneous,
    IQMS.Common.Checkpoint,
    //IQSecIns,
    IQMS.Common.ResStrings,
    IQMS.Common.StringUtils;

const
    IQINTF_NAME = 'IQShell';

procedure dbg(s:String);
begin
   TFrmCheckPointList.add( FileNameNoExt(application.ExeName) + ' '+ s);
end;

function Com_Exec( AServerName: string; APacket: array of Variant ): Integer;
begin
  // 06/02/2010 Added conditional for "Free Pass".  The "Free Pass" tells
  // the server that we are bypassing licensing.  This was originally added
  // so that users could execute a jump through IQWIN32.EXE without using
  // an additional, IQWIN32 license. (Byron)

  {*UG_rem_AE*}
//  if Assigned(SecurityInspector) then
//    IQInformation(Format( IQMS.Common.ResStrings.cTXT0000082, [ AServerName ]));

  Result := Com_ExecEx(AServerName, // DCOM server (executable name)
                       APacket,     // Variant containing params
                       False,       // Override Redirect
                       AServerName = 'IQWIN32' );
end;

function Com_Exec_DNET(AAssemblyName, ANamespaceName:string; APacket: array of Variant ):Integer;
var
  AServer: TIQComSrv;
  ATgtServerName:String;
begin
  dbg('Com_Exec_DNET '+AAssemblyName);
  Result:= -1;

  AServer:= IQComSrvList.InvokeDNet( AAssemblyName, ANamespaceName );
  try
     // Add the DCOM server; this instantiates the server, filling the
     // result with a useable DCOM variant.
     Result:= IQComSrvList.Add( AServer );

     AServer.Execute( APacket );
  finally
     if Result = -1 then
        FreeAndNil( AServer );
  end;
  dbg('Com_Exec_DNET '+AAssemblyName+' end');
end;

function Com_ExecEx( AServerName: string; APacket: array of Variant;
 AOverrideRedirect, AFreeLicensePass: Boolean ): Integer;
var
  AServer: TIQComSrv;
  ATgtServerName:String;
  ARedirectThroughIQWin32:Boolean;

  function CheckSelfReferenceSendInternalMessage: Boolean;
  var
     ACom_SelfRefCargo: TCom_SelfRefCargo;
  begin
     {are we trying to launch DCOM that is actualy the application we are runing}
     {*UG_rem_AE*}
     Result:= CompareText( StrBeforeDot( ExtractFileName(Application.ExeName)), AServerName ) = 0;
     if not Result then
        EXIT;

     ACom_SelfRefCargo:= TCom_SelfRefCargo.Create( APacket );
     try
       {if message is handled the recepient must assign 1 into the result}
       Result:= SendMessage( Application.MainForm.Handle, iq_DCOM_Internal_Notify_Ex, 0, Integer( ACom_SelfRefCargo )) = 1;
     finally
       ACom_SelfRefCargo.Free;
     end;
  end;

begin
  dbg('Com_ExecEx '+AServerName);
  Result:= -1;
  ATgtServerName:= AServerName;

  if CheckSelfReferenceSendInternalMessage then
     EXIT;

  ARedirectThroughIQWin32:= (UpperCase(AServerName) <> 'IQWIN32')
                            and
                              not AOverrideRedirect
                            and
                              not (UpperCase(FileNameNoExt(Application.ExeName)) = 'IQWIN32');

  if ARedirectThroughIQWin32 then
     ATgtServerName:= 'IQWIN32';

  AServer:= IQComSrvList.Invoke( ATgtServerName, IQINTF_NAME );
  try
     // Add the DCOM server; this instantiates the server, filling the
     // result with a useable DCOM variant.
     Result:= IQComSrvList.Add( AServer );

     // Execute the server differently depending on parameters:
     // 1. Jump is redirected through IQWIN32.EXE
     if ARedirectThroughIQWin32 then
        AServer.ExecuteThruIQWin32( AServerName, APacket )

     // 2. User is logged into database with a "free pass" -- meaning, no
     //    license is used -- and then the jump is executed.
     else if AFreeLicensePass then
        AServer.ExecuteFreePass(AServerName, APacket)

     // 3.  Default execution
     else
        AServer.Execute( APacket );
  finally
     if Result = -1 then
        FreeAndNil( AServer );
  end;
  dbg('Com_ExecEx '+AServerName+' end');
end;

procedure Com_LaunchSecurityInspector( AServerName: string );
var
  AServer:TIQComSrv;
begin
  AServer:= IQComSrvList.Invoke( AServerName, IQINTF_NAME );
  try
    AServer.LaunchSecurityInspector;
  finally
    if IQComSrvList.Add( AServer ) = -1 then
      FreeAndNil( AServer );
  end;
end;


{ TCom_SelfRefCargo }

constructor TCom_SelfRefCargo.Create(APacket: array of Variant);
var
  I: Integer;
begin
  Packet:= VarArrayCreate([0, High(APacket)], varVariant);
  for I:= 0 to High( APacket ) do
    Packet[ I ]:= APacket[ I ];
end;

end.

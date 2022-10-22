unit IQMS.Common.COMServer;

interface

uses
  Vcl.Forms, System.SysUtils, System.Classes, System.Variants, System.Win.ComObj, IQMS.Common.DotNetCOMShared;

type
  TIQInternalServer = class
  private
    FDNetServer:TWebIQDotNetApplication;
    FOleServer:OleVariant;
    FIsDNetServer:Boolean;
    function GetServer_ID: string;
  public
    constructor CreateOleServer(AServerName, AInterfaceName:string);
    constructor CreateDNetServer(AServerName, AInterfaceName:string);
    destructor Destroy; override;

    procedure Execute( APacket:Variant );
    function ExecuteCommand( APacket:Variant ):String;
    procedure LaunchSecurityInspector;
    procedure CloseSecurityInspector;
    function SomeFormVisible:Integer;

    property Server_ID: string read GetServer_ID;
    property DNetServer:TWebIQDotNetApplication read FDNetServer;
    property OleServer:OleVariant read FOleServer;
    property IsDNetServer:Boolean read FIsDNetServer;
  end;

  TIQComSrv = class
  private
    { Private declarations }
    function ExecuteCommand(APacket: array of Variant): String;
    procedure LaunchSecurityInspectorThruIQWin32(AServerName: string);
  public
    { Public declarations }
    ServerName   : string;          {IQTool, IQWin32 etc}
    InterfaceName: string;          {IQShell for now}
    Server       : TIQInternalServer;
    ID           : string;          {Internal ID}
    IsDNet: Boolean; // is .Net
    constructor Create( AServerName, AInterfaceName: string );
    constructor CreateDNet( AAssemblyName, AInterfaceName: string );
    destructor Destroy; override;
    procedure Execute( APacket: array of Variant );
    function IsServerValid: Boolean;
    function HasCircularCOMReference: Boolean;
    function ExecuteThruIQWin32( AServerName:String; APacket: array of Variant ): string;
    function ExecuteFreePass(AServerName:String; APacket: array of Variant ): string;
    procedure LaunchSecurityInspector;
    procedure CloseSecurityInspector;
    function SomeFormVisible: Integer;

  end;

  TIQComSrvList = class
  private
    { Private declarations }
    FList: TList;
    function Get(I: Integer): TIQComSrv;
    procedure Put( I: Integer; AValue: TIQComSrv );
    function GetCount: Integer;
    function GetCountVisible: Integer;
  public
    { Public declarations }
    HidePleaseWaitMessage: Boolean;  {set to TRUE when COM is called from a thread}
    constructor Create;
    destructor Destroy; override;
    function Invoke( AServerName, AInterfaceName: string ): TIQComSrv;
    function InvokeDNet(AServerName, ANamespaceName: string): TIQComSrv;
    function ServerByName( AServerName, AInterfaceName: string ): Integer;
    function Add(AServer: TIQComSrv): Integer;
    function CheckCircularReferences: Boolean;
    procedure Clear;
    procedure CleanGarbage;
    procedure InvokeGarbageCollector( Sender: TObject );
    procedure CloseSecurityInspectors;
    procedure Delete(I: Integer);
    procedure GetServersNames( var AList: TStringList );
    procedure CheckTerminateApplication(Sender: TObject);

    property Count: Integer read GetCount;
    property CountVisible: Integer read GetCountVisible;
    property List[ I: Integer ]:TIQComSrv read Get write Put; default;
  end;

var
  IQComSrvList: TIQComSrvList;

implementation

uses
    IQMS.Common.COMShare,
    IQMS.Common.COMServerShare,
    IQMS.Common.FileUtils,
    IQMS.Common.Dialogs,
    IQMS.Common.ResStrings,
    IQMS.Common.CheckPoint,
    {*UG_rem_AE*}
    IQMS.Common.Miscellaneous,
    //IQSecIns,
    IQMS.Common.PanelMsg;

{ TIQComSrv }


procedure dbg(s:String);
begin
   TFrmCheckPointList.add( FileNameNoExt(application.ExeName) + ' '+ s);
end;


constructor TIQComSrv.Create( AServerName, AInterfaceName: string);
var
  {*UG_rem_AE*}
  hMsg  : TPanelMesg;
  ATimes: Integer;
begin
  ATimes       := 1;
  ServerName   := AServerName;
  InterfaceName:= AInterfaceName;
  {*UG_rem_AE*}
  hMsg         := NIL;
  IsDNet := False;

  if not IQComSrvList.HidePleaseWaitMessage then
     // 'Accessing %s.%s.  Please wait...'
     {*UG_rem_AE*}
     hMsg:= hPleaseWait( Format(IQMS.Common.ResStrings.cTXT0000080, [ AServerName, AInterfaceName ]));
  try
    {Synchronize with master}
    if not IQServerExeUpToDate( AServerName ) then    {IQComSrvShr.pas}
       // 'Unable to synchronize %s with master home directory. Aborting operation...'
       raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000081, [ AServerName ]);

    {Launch. Register first if needed}
    repeat
      try
        Server:= TIQInternalServer.CreateOleServer( AServerName, AInterfaceName );

        BREAK;
      except on E: Exception do
        begin
          if ATimes >= 2 then
             raise;
          if not IQInstallServer( AServerName ) then  {IQComSrvShr.pas}
             ABORT;
        end;
      end;
      Inc(ATimes);
    until FALSE;

    {Assign Server ID}
//     ID:= GetRandomID;         {IQMisc}
//     Server.Server_ID:= ID;
    ID:= Server.Server_ID;       {returns application.handle}
  finally
  {*UG_rem_AE*}
    if Assigned(hMsg) then
       hMsg.Free;
  end;
end;

constructor TIQComSrv.CreateDNet(AAssemblyName, AInterfaceName: string);
var
  {*UG_rem_AE*}
  hMsg  : TPanelMesg;
  ATimes: Integer;
begin
  ATimes       := 1;
  ServerName   := AAssemblyName;
  InterfaceName:= AInterfaceName;
  {*UG_rem_AE*}
  hMsg         := NIL;
  IsDNet := True;

  if not IQComSrvList.HidePleaseWaitMessage then
     // 'Accessing %s.%s.  Please wait...'
     {*UG_rem_AE*}
     hMsg:= hPleaseWait( Format(IQMS.Common.ResStrings.cTXT0000080, [ AAssemblyName, AInterfaceName ]));
  try
    {Launch. Register first if needed}
    Server:= TIQInternalServer.CreateDNetServer(AAssemblyName, AInterfaceName);

    ID:= Server.Server_ID;  {returns application.handle}
  finally
    {*UG_rem_AE*}
    if Assigned(hMsg) then
       FreeAndNil(hMsg);
  end;
end;

destructor TIQComSrv.Destroy;
begin
  dbg( ' TIQComSrv.Destroy' );
  if Assigned(Server)then
  begin
    dbg( ' TIQComSrv.Destroy FreeAndNil' );
    FreeAndNil(Server);
    dbg( ' TIQComSrv.Destroy FreeAndNil after' );
  end;

  inherited Destroy;
end;

procedure TIQComSrv.Execute( APacket: array of Variant );
var
  A: Variant;
  I, AOffSet: Integer;
begin
  // 01/30/2012 If this is a .Net app, then exit early; do not inform user.
  //if not IsDNet and Assigned(SecurityInspector) then
     {'Please note:  The current Security Inspector is going to be closed ' +
      'and %s is going to be assigned its own Security Inspector.' }
//     IQInformation(Format( IQMS.Common.ResourceStrings.cTXT0000082, [ ServerName ]));

  // Creates array and populates default parameters
  A := IQMS.Common.COMServerShare.GetMandatoryArrayEx(High(APacket) + 1, AOffSet, IsDNet);
  if System.Variants.VarArrayDimCount(A) = 0 then
    Exit;

  for I:= 0 to High( APacket ) do
    A[I + AOffSet]:= APacket[ I ];

  {Finally! Show Form}
  Server.Execute( A );

  {Popup Security Inspector if needed}
  {*UG_rem_AE*}
//  if not IsDNet and Assigned(SecurityInspector) then
//    LaunchSecurityInspector;
end;


function TIQComSrv.ExecuteCommand( APacket: array of Variant ):String;
var
  A: Variant;
  I, AOffSet: Integer;
begin
  dbg( 'Executing Command' );
  Result:= '';
  try
    {Prepare parameters}
    dbg( 'Executing Command Filling VarArray' );
    // Creates array and populates default parameters
    A := IQMS.Common.COMServerShare.GetMandatoryArrayEx(High(APacket) + 1, AOffSet, IsDNet);
    if System.Variants.VarArrayDimCount(A) = 0 then
       Exit;

    dbg( 'Executing Command packing VarArray' );
    for I:= 0 to High( APacket ) do
      A[I + AOffSet]:= APacket[ I ];

    dbg( 'Executing Command Server.ExecuteCommand( A )' );
    Result:= Server.ExecuteCommand( A );
  except on E:Exception do
    // 04/02/2009 Added check for EAbort.  Added by Byron.
    {*UG_rem_AE*}
    if not IgnoreCOMRaisedEAbort(E) then
       IQError( E.Message );
  end;
end;


procedure TIQComSrv.LaunchSecurityInspector;
begin
  {*UG_rem_AE*}
//  if Assigned(SecurityInspector) then
//     with SecurityInspector do
//     begin
//       DoFormClose;
//       Release;
//     end;
  if IsServerValid then
     Server.LaunchSecurityInspector;
end;

procedure TIQComSrv.CloseSecurityInspector;
begin
  Server.CloseSecurityInspector;
end;

function TIQComSrv.SomeFormVisible: Integer;
begin
  // IQWin calls IQMps as COM server,
  // then in IQMps user jumps to inventory by calling IQWIN32 as COM server
  // user closes inventory, then closes IQMps, clicking close button activates MPS,
  // which calls InvokeGarbageCollector on IQMPS
  //Result:= 0;                         //
  //if ServerName <> 'IQWIN32' then     //
  // Mar 30, 2009 - cannot do above if statement b/c it will cause iqwin to close if iqwin is not launched standalone or iqwin doesnt already have another DCOM reference
  Result:= Server.SomeFormVisible;
  dbg( Format( 'SomeFormVisible = %d', [ Result ] ) );
end;

function TIQComSrv.IsServerValid: Boolean;
begin
  try
    Result:= (Server.Server_ID = ID);  {See if you can access it}
  except
    Result:= FALSE;
  end;
end;

function TIQComSrv.HasCircularCOMReference: Boolean;
begin
  // Result:= ( 'Y' = ExecuteCommand( [ EXEC_COM_CMD_CHECK_CIRCULAR_REF, FileNameNoExt(ShortToLongFileName(Application.ExeName)) ] ) );
  Result:= ( 'Y' = ExecuteCommand( [ EXEC_COM_CMD_CHECK_CIRCULAR_REF, FileNameNoExt( Application.ExeName )] ));
end;


function TIQComSrv.ExecuteThruIQWin32( AServerName:String; APacket: array of Variant ): string;
var
  ParamArr : array of Variant;
  I,
  ANumArgs :Integer;
begin
//  if Assigned(SecurityInspector) then
//     IQInformation(Format( IQMS.Common.ResourceStrings.cTXT0000082, [ AServerName ]));  {'Please note:  The current Security Inspector is going to be closed and %s is going to be assigned its own Security Inspector.' }

  ParamArr:= VarArrayCreate( [ 0, 2 + High(APacket) ], varVariant );
  ParamArr[ 0 ]:= EXEC_REDIRECT_THROUGH_IQWIN32;
  ParamArr[ 1 ]:= AServerName;
  for I:= 0 to High(APacket) do ParamArr[I + 2]:= APacket[ I ];

  // execute command!
  Result:= ExecuteCommand( ParamArr );

  // check call security inspector
  {*UG_rem_AE*}
//  if Assigned(SecurityInspector) and IsServerValid then
//     LaunchSecurityInspectorThruIQWin32( AServerName );
end;

function TIQComSrv.ExecuteFreePass(AServerName:String; APacket: array of Variant): string;
var
  ParamArr: array of Variant;
  I: Integer;
begin
  // Execute the server without consuming a license. In this method,
  // we ensure that the params we send to the DCOM server include the
  // required "Free Pass" flag.  The exact text is declared in the
  // IQComSrvShr constant.  When the message is received by the DCOM
  // server, it is interpreted, and the user is logged into the
  // database without using an application license.
  // 06/02/2010 This method was added (Byron).


  // If necessary, inform user that the security inspection will switch focus.
  { IQMS.Common.ResourceStrings.cTXT0000082 = 'Please note:  The current Security Inspector
    is going to be closed and %s is going to be assigned its own Security
    Inspector.' }
//  if Assigned(SecurityInspector) then
//    IQInformation(Format( IQMS.Common.ResourceStrings.cTXT0000082, [ AServerName ]));

  // Create a new array, add the "free pass" params, and also the original
  // params sent by the calling method.
  ParamArr:= VarArrayCreate( [ 0, 2 + High(APacket) ], varVariant );
  ParamArr[0]:= IQMS.Common.COMShare.EXEC_FREE_LICENSE_PASS;
  ParamArr[1]:= AServerName;
  for I:= 0 to High(APacket) do ParamArr[I + 2]:= APacket[ I ];

  // Execute command!
  Result:= ExecuteCommand( ParamArr );

  // check call security inspector
  {*UG_rem_AE*}
//  if Assigned(SecurityInspector) and IsServerValid then
//     LaunchSecurityInspectorThruIQWin32( AServerName );
end;

procedure TIQComSrv.LaunchSecurityInspectorThruIQWin32( AServerName: string );
var
  ParamArr : array of Variant;
begin
  {close exisitng}
  {*UG_rem_AE*}
//  if Assigned(SecurityInspector) then with SecurityInspector do
//  begin
//    DoFormClose;
//    Release;
//  end;

  {launch security inspector on called DCOM through IQwin32}
  ParamArr:= VarArrayCreate( [ 0, 2 ], varVariant );
  ParamArr[ 0 ]:= IQMS.Common.COMShare.EXEC_LAUNCH_SECURITY_INSPECTOR_THROUGH_IQWIN32;
  ParamArr[ 1 ]:= AServerName;
  ExecuteCommand( ParamArr );
end;

{ TIQComSrvList }

constructor TIQComSrvList.Create;
var
  s:String;
begin
  s:= 'TIQComSrvList.Create';
  dbg( s );
  try
    try

  inherited;
  FList:= TList.Create;
  HidePleaseWaitMessage:= FALSE;

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

procedure TIQComSrvList.Clear;
var
  s:String;
begin
  s:= 'TIQComSrvList.Clear';
  dbg( s );
  try
    try
      while FList.Count > 0 do
      begin
        s:= 'TIQComSrv( FList[ FList.Count - 1 ] ).Free';
        TIQComSrv( FList[ FList.Count - 1 ] ).Free;
        s:= 'FList.Delete( FList.Count - 1 )';
        FList.Delete( FList.Count - 1 );
      end;
    except on E:Exception do
      begin
        dbg( s + E.Message );
         raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

destructor TIQComSrvList.Destroy;
var
  s:String;
begin
  s:= 'TIQComSrvList.Destroy';
  dbg( s );
  try
    try
      Clear;
      if Assigned(FList) then
        FList.Free;
      inherited;
    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;


function TIQComSrvList.Invoke( AServerName, AInterfaceName: string ): TIQComSrv;
var
  s:String;
  I:Integer;
begin
  s:= 'TIQComSrvList.Invoke';
  dbg( s );
  try
    try

  i:= ServerByName( AServerName, AInterfaceName );
  if i > -1 then
    Result:= Get( i )
  else
    Result:= TIQComSrv.Create( AServerName, AInterfaceName );

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

function TIQComSrvList.InvokeDNet( AServerName, ANamespaceName: string ): TIQComSrv;
var
  s:String;
  I:Integer;
begin
  s:= 'TIQComSrvList.InvokeDNet';
  dbg( s );
  try
    try
      i:= ServerByName( AServerName, ANamespaceName );
      if i > -1 then
        Result:= Get( i )
      else
        Result:= TIQComSrv.CreateDNet( AServerName, ANamespaceName );

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;


function TIQComSrvList.Add( AServer:TIQComSrv ):Integer;
var
  s:String;
begin
  s:= 'TIQComSrvList.Add';
  dbg( s );
  try
    try

  Result:= -1;

  if not Assigned( AServer ) then
    EXIT;

  if not AServer.IsServerValid then
    EXIT;

  Result:= ServerByName( AServer.ServerName, AServer.InterfaceName );
  if Result > -1 then
  begin
    dbg(Format('Found Server in list = %s',[AServer.ServerName]));
    EXIT;
  end;

  if AServer.HasCircularCOMReference then
  begin
    dbg(Format('Server HasCircularCOMReference = %s',[AServer.ServerName]));
    EXIT;
  end;

  Result:= FList.Add( AServer );

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

function TIQComSrvList.CheckCircularReferences:Boolean;
var
  s:String;
  I:Integer;
begin
  s:= 'TIQComSrvList.CheckCircularReferences';
  dbg( s );
  try
    try

  Result:= FALSE;

  for I:= Count - 1 downto 0 do
  begin
    dbg( 'checking circular reference with '+TIQComSrv( FList[ I ] ).ServerName );

    Result:= TIQComSrv( FList[ I ] ).HasCircularCOMReference;
    if Result then
    begin
      dbg(TIQComSrv( FList[ I ] ).ServerName+' has circular reference');
      EXIT;
    end;
  end;

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;


function TIQComSrvList.ServerByName( AServerName, AInterfaceName: string ): Integer;
var
  s:String;
  I:Integer;
begin
  s:= 'TIQComSrvList.ServerByName';
  dbg( s );
  try
    try
      dbg( s + ' Looking for '+AServerName+' '+AInterfaceName);

      for I:= Count - 1 downto 0 do
        with TIQComSrv( FList[ I ] ) do
        begin
          dbg( s + ' comparing to  '+ServerName+' '+InterfaceName);
          if (CompareText(ServerName, AServerName) = 0 ) and (CompareText(InterfaceName, AInterfaceName) = 0) then
          begin
            dbg( s + ' found '+AServerName+' '+AInterfaceName);
            Result:= I;
            EXIT;
          end;
        end;

      Result:= -1;
    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

function TIQComSrvList.Get(I: Integer): TIQComSrv;
var
  s:String;
begin
  s:= 'TIQComSrvList.Get';
  dbg( s );
  try
    try

  Result:= TIQComSrv( FList[ I ] );

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

procedure TIQComSrvList.Put( I: Integer; AValue: TIQComSrv );
var
  s:String;
begin
  s:= 'TIQComSrvList.Put';
  dbg( s );
  try
    try

  FList[ I ]:= AValue;

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

procedure TIQComSrvList.Delete(I: Integer);
var
  s:String;
begin
  s:= 'TIQComSrvList.Delete';
  dbg( s );
  try
    try

   TIQComSrv( FList[ I ]).Free;
   FList.Delete( I );

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

procedure TIQComSrvList.CleanGarbage;
var
  s:String;
    I:Integer;
begin
  s:= 'TIQComSrvList.CleanGarbage';
  dbg( s );
  try
    try

  if Assigned( FList ) then
    for I:= FList.Count - 1 downto 0 do
      if not TIQComSrv( FList[ I ]).IsServerValid then
         Delete( I );

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

procedure TIQComSrvList.InvokeGarbageCollector( Sender: TObject );
var
  s:String;
    I:Integer;
begin
  s:= 'TIQComSrvList.InvokeGarbageCollector';
  dbg( s );
  try
    try
      if Assigned( FList ) then
         for I:= FList.Count - 1 downto 0 do
         begin
           { Jan-30-2002: when EnsureSecurityInspectorOnTopOf was called inside DCOM server
             such as IQPM for a modal form the focus shifted to IQwin32 and that caused
             line below to be executed. See Application.OnActivate in IQAppSet.pas
             Side effect of taking the line below out is that the SecurityInspector of the DCOM
             server (IQPM) will not close when we click on IQWin32. I think we can live with that}
           // TIQComSrv( FList[ I ]).CloseSecurityInspector;
           if TIQComSrv( FList[ I ]).SomeFormVisible = 0 then
              Delete( I );
         end;

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

procedure TIQComSrvList.CloseSecurityInspectors;
var
  s:String;
    I:Integer;
begin
  s:= 'TIQComSrvList.CloseSecurityInspectors';
  dbg( s );
  try
    try

  for I:= Count - 1 downto 0 do
  begin
    TIQComSrv( FList[ I ]).CloseSecurityInspector;
    if TIQComSrv( FList[ I ]).SomeFormVisible = 0 then
       Delete( I );
  end;

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

function TIQComSrvList.GetCount: Integer;
var
  s:String;
    I:Integer;
begin
  s:= 'TIQComSrvList.GetCount';
  dbg( s );
  try
    try

  CleanGarbage;
  Result:= FList.Count;

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

function TIQComSrvList.GetCountVisible: Integer;
var
  s:String;
    I:Integer;
begin
  s:= 'TIQComSrvList.GetCountVisible';
  dbg( s );
  try
    try

  CleanGarbage;
  Result:= 0;
  for I:= Count - 1 downto 0 do
    if TIQComSrv( FList[ I ]).SomeFormVisible > 0 then
       Inc(Result);

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

procedure TIQComSrvList.GetServersNames( var AList: TStringList );
var
  s:String;
    I:Integer;
  procedure CheckAddServerName( AName: string );
  begin
    with AList do if IndexOf( AName ) = -1 then Add( AName );
  end;
begin
  s:= 'TIQComSrvList.GetServersNames';
  dbg( s );
  try
    try

  {Add self - the exe name without ext}
  CheckAddServerName( FileNameNoExt( Application.ExeName ));  {IQFile.pas}

  {Add any children servers. Note: GetCount function first calls CleanGarbage and then returns FList.Count}
  for I:= Count - 1 downto 0 do
    with TIQComSrv( FList[ I ]) do
     if not IsDNet and (SomeFormVisible = 1) then
        CheckAddServerName( ServerName );

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;


procedure TIQComSrvList.CheckTerminateApplication(Sender: TObject);
var
  s:String;
begin
  s:= 'TIQComSrvList.CheckTerminateApplication';
  dbg( s );
  try
    try

  {10-15-2007 SMART_PAGE support - terminate main application if launcher is hidden and the only form remain open}
  {*UG_rem_AE*}
  if SmartPageWantsLauncherHidden() and (Screen.FormCount = 1) and not (Application.MainForm.Visible) and (CountVisible = 0) then {IQMisc.pas}
     Application.MainForm.Close;

  // obsolete as of Feb-01-2008 after we switched to dcom
  // if AppType = atCOM then
  // begin
  //   { Post message and inform iqwin32 to check and terminate upon COM deactivation}
  //   BSMRecipients := BSM_APPLICATIONS;
  //   BroadCastSystemMessage(BSF_IGNORECURRENTTASK or BSF_POSTMESSAGE, @BSMRecipients, IQAppset.IQWin32MessageID, iq_NotifyCOMIsDeactivated, 0);
  // end;

    except on E:Exception do
      begin
        dbg( s + E.Message );
        raise;
      end;
    end;
  finally
    dbg( s + ' End' );
  end;
end;

{ TIQInternalServer }

constructor TIQInternalServer.CreateDNetServer(AServerName,
  AInterfaceName: string);
begin
  inherited Create;
  FIsDNetServer:= true;
  FDNetServer:= TWebIQDotNetApplication.CreateEx(nil, AServerName, AInterfaceName);
  FDNetServer.Connect;
end;

constructor TIQInternalServer.CreateOleServer(AServerName, AInterfaceName:string);
begin
  inherited Create;
  FIsDNetServer:= false;
  FOleServer:= CreateOleObject( Format('%s.%s', [ AServerName, AInterfaceName ])); {Ex: IQTool.IQShell}
end;

destructor TIQInternalServer.Destroy;
begin
  dbg( 'TIQInternalServer.Destroy' );
  if IsDNetServer then
  begin
    dbg( 'check DNetServer.Free' );
    if Assigned(FDnetServer) then
    begin
      dbg( 'DNetServer.Free' );
      FDNetServer.Free;
      FDNetServer:= nil;
      dbg( 'DNetServer.Freed ' );
    end;
    dbg( 'after check DNetServer.Free' );
  end;

  //OleServer takes care of itself
  //VarClear(FOleServer);

  inherited Destroy;
end;

procedure TIQInternalServer.Execute(APacket: Variant);
begin
  if IsDNetServer then
    DNetServer.Server.Execute(APacket)
  else
    FOleServer.Execute(APacket);
end;

function TIQInternalServer.ExecuteCommand(APacket:Variant):String;
begin
  if IsDNetServer then
    Result:= DNetServer.Server.ExecuteCommand(APacket)
  else
    Result:= FOleServer.ExecuteCommand(APacket);
end;

function TIQInternalServer.GetServer_ID:String;
begin
  if IsDNetServer then
    Result:= DNetServer.Server.Server_ID
  else
    Result:= FOleServer.Server_ID;
end;

procedure TIQInternalServer.CloseSecurityInspector;
begin
  if IsDNetServer then
    DNetServer.Server.CloseSecurityInspector
  else
    FOleServer.CloseSecurityInspector;
end;

procedure TIQInternalServer.LaunchSecurityInspector;
begin
  if IsDNetServer then
    DNetServer.Server.LaunchSecurityInspector
  else
    FOleServer.LaunchSecurityInspector;
end;

function TIQInternalServer.SomeFormVisible: Integer;
begin
  if IsDNetServer then
    begin
      Result:= DNetServer.Server.SomeFormVisible;
      dbg('TIQInternalServer.SomeFormVisible DNet '+IntToStr(Result));
    end
  else
    begin
      Result:= FOleServer.SomeFormVisible;
      dbg('TIQInternalServer.SomeFormVisible OleServer '+IntToStr(Result));
    end;
end;

initialization
  IQComSrvList:= TIQComSrvList.Create;

finalization
  dbg( 'finalization' );
  IQComSrvList.Free;
  dbg( 'after IQComSrvList.Free' );

end.




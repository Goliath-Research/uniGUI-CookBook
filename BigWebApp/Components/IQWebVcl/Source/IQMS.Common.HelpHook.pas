unit IQMS.Common.HelpHook;

interface

uses
    Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms, Winapi.ShellAPI, IQMS.Common.Registry,
    Vcl.Controls, Vcl.Menus,IQMS.Common.HHPFiles, UniMainMenu, uniGUIForm;

    // D6OnHelpFix - adding this fiule is causing Runtime error 216 on exiting from delphi. Add to project manually. Aug-28-2006

  { Host Type }
type THostType = (htHHAPI, htHHexe);
  { HH comand line prefix}
type TPrefixType = (ptNone, ptIE3, ptIE4);

  {Global routines available to IQWin32}
  function DoHelp( ACHM, AHTML, Alias: String ) : Boolean;

  {Allows you to use HelpContext properties on form controls to display help
  topics or popups.  Also allows you to use the system help menu '?' to display
  help topics.  Just call DoHelpHook in the OnActivate event of the form.}
  procedure DoHelpHook( aDefaultChmFile, aDefaultHTMLFile, aDefaultContextID: String );

  {Used to display a popup, with the message AMsg.  This does not
  access information HTML Help files}
  function DoHelpPopUp( AControl: TWinControl; AMsg: String;
                        OffsetX, OffsetY: Integer ): Boolean;

  function IQHelpContext(aChmFile: String; aHTMLFile: String; aContextID: DWord; aWinDef: String; aHostType: THostType): Integer;

  function IQHelpContextID(aChmPath: String; aContextId: Integer; aHostType: THostType): Integer;

  function IQCHMFormat(aChmFile, aTopic, aWinDef: String; aPrefixType: TPrefixType): String;
  procedure IQHelpSplitCmdStr(s: String; var aChmFile, aTopic, aWinDef: String);

  procedure IQHelpShowError(err: Integer);

{ THookHelpSystem }
type
  THookHelpSystem = class(TObject)
  private
    mOldHelpEvent : THelpEvent;
    mDefChmFile   : String;
    mDefHTMLFile  : String;
    mDefWinDef    : String;
    mHostType     : THostType;

    HHP_List      : THHP_List;   // mapped help file support 10-26-2009

    hWinHelp: HWND;

    FKnowledgeCenter: Variant;
    FObtainHelpContextOnly: Boolean;
    FObtainHelpContext4Wiki: Integer;

{$IF CompilerVersion >= 26}  // Delphi XE5
    function HelpHook(Command : Word; Data : THelpEventData; Var CallHelp : Boolean) : Boolean;
    {$ELSE}
    function HelpHook(Command : Word; Data : Longint; Var CallHelp : Boolean) : Boolean;
    {$IFEND}

    procedure SetChmFile( const AValue: string );
    function GetHHP_MapFileName: string;
    function GetWikiUrlFromKeyword(ALink: string): string;
    function GetWikiKeyword(AHelpContext: Integer): string;
    function ObtainHelpContextUsing(AContents: TUniMenuItem): Integer;
    procedure DoInvokeMyIQMS(Sender: TObject);
  protected
    function IQHelpDisplayTopic(aChmFile, aTopic, aWinDef: String; aHostType: THostType): Integer;
    function IQHelpTopic(aCHMPath: String; aHostType: THostType): Integer;
    function DoHelp( ACHM, AHTML, Alias: String ) : Boolean;
  public
    constructor Create(aDefChmFile, aDefHTMLFile, aDefWinDef: String; aHostType: THostType);
    constructor CreateOnConsole;
    destructor Destroy; override;
    function HelpContext(aContextId: DWord): Integer;
    function HelpTopic(aTopic: String): Integer;

    function FindSubMenuByCaption( AMenuItem: TUniMenuItem; AMenuCaption: string ): TUniMenuItem;
    procedure CheckAssignExtraLinksTo(Sender: TObject; AHelpMenuItem: TUniMenuItem);
    procedure DoInvokeKnowledgeCenter(Sender: TObject);
    procedure DoInvokeWiki(Sender: TObject); overload;
    procedure DoInvokeWiki( ALink: string ); overload;

    procedure AssignHTMLFile( const aDefChmFile, aDefHTMLFile: string );
    property ChmFile: String read mDefChmFile write SetChmFile;
    property HTMLFile: String read mDefHTMLFile write mDefHTMLFile;
    property WinDef: String read mDefWinDef write mDefWinDef;
    property HostType: THostType read mHostType write mHostType;
    property HHP_MapFileName: string read GetHHP_MapFileName;
  end;

var
  IQHelp : THookHelpSystem;

{ HTML Help Constants }
const
  iqchmMFG          = 'EIQ.chm'; // 06-03-2010 'Mfg.chm';
  iqhtmQUOTE        = 'Quote1.htm';
  iqhtmBOM          = 'Bom2.htm';
  iqhtmSALES_ORDER  = 'Order3.htm';
  iqhtmSHIP         = 'Ship4.htm';
  iqhtmINVENTORY    = 'Invtry5.htm';
  iqhtmWORKORDER    = 'Worder6.htm';
  iqhtmSCHED        = 'Sched7.htm';
  iqhtmRT           = 'Realtm8.htm';
  iqhtmPROD_REP     = 'Preprt9.htm';

  iqhtmPAYROLL_PG   = 'Ch1_pg.htm';
  iqhtmPAYROLL_SI   = 'Ch2_si.htm';
  iqhtmPAYROLL_PL   = 'Ch3_pl.htm';
  iqhtmPAYROLL_TX   = 'Ch4_tax.htm';
  iqhtmPAYROLL_TP   = 'Ch5_typ.htm';
  iqhtmPAYROLL_DE   = 'Ch6_ded.htm';
  iqhtmPAYROLL_MN   = 'Ch7_man.htm';
  iqhtmPAYROLL_TC   = 'Ch8_tc.htm';
  iqhtmPAYROLL_PP   = 'Ch9_ppr.htm';
  iqhtmPAYROLL_RV   = 'Ch10_rev.htm';
  iqhtmPAYROLL_DD   = 'Ch11_dd.htm';

  iqchmPAYROLL      = 'Payroll.chm';
  iqchmACCT         = 'EIQ.chm'; // 06-03-2010 'Acctgman.Chm';
  iqchmCRM          = 'CRM.chm';
  iqhtmCRM          = 'CRM.htm';
  iqchmEIQ          = 'EIQ.chm';
  iqhtmEIQ          = 'EIQ.htm';

  iqhtmSETUP        = 'Setup.htm';
  iqhtmGL           = 'GL.htm';
  iqhtmAR           = 'AR2.htm';
  iqhtmAP           = 'AP.htm';
  iqhtmPO           = 'PO.htm';
  iqhtmLbl          = 'Label.htm';

  iqchmPM           = 'PM.Chm';
  iqhtmPM           = 'PM.htm';
//  iqhtmPM           = 'PM_gn.htm';

  iqchmFA           = 'FA.Chm';
  iqhtmFA           = 'Fixed_as.htm';


  iqchmPLM          = 'PLM.chm';
  iqhtmPLM          = 'PLM.htm';

  iqchmSETUP        = 'EIQ.chm'; // 06-03-2010 'Setup.chm';
  iqhtmSETUPch6     = 'Setupch6.htm';
  iqhtmSETUPch5     = 'Setupch5.htm';
  iqhtmSETUPch4     = 'Setupch4.htm';
  iqhtmSETUPch3     = 'Setupch3.htm';
  iqchmTA           = 'timeattend.chm';
  iqhtmTA           = 'timeandb.htm';
  iqchmTOOLING      = 'Tooling.chm';
  iqhtmTOOLING      = 'Tooling.htm';

  iqhtmCosting6     = 'Costing6.htm';

  iqhtmWorkForce    = 'Workfora.htm';
  iqchmWorkForce    = 'Workforce.chm';

  iqhtmForecast     = 'Forecasa.htm';
  iqchmForecast     = 'Forecast.chm';

  iqhtmQuality      = 'Quality.htm';
  iqchmQuality      = 'Quality.chm';

  iqhtmQC_COQ       = 'Cost of Quality.htm';
  iqchmQC_COQ       = 'Cost of Quality.chm';

  iqhtmIQSPC        = 'spc.htm';//'spc_syst.htm';
  iqchmIQSPC        = 'SPC.chm';

  iqhtmCONFIG       = 'configur.htm';
  iqchmCONFIG       = 'config.chm';

  iqhtmIQCRM        = 'crm.htm';
  iqchmIQCRM        = 'crm.chm';

  iqchmSHOPDATA     = 'shopdata.chm';
  iqhtmSHOPDATA     = 'shop_dat.htm';

  iqchmWHATS_CHANGED= 'WhatsChanged.chm';
  iqhtmWHATS_CHANGED= 'whatscha.htm';

  iqchmFAB          = 'fab.chm';
  iqhtmFAB          = 'fab.htm';

  iqchmJOBSHOP      = 'jobshop.chm';
  iqhtmJOBSHOP      = 'jobshop.htm';

  iqhtmEDI          = 'Edi.htm';
  iqchmEDI          = 'Edi.chm';

  iqhtmIQRF         = 'Iqrf.htm';
  iqchmIQRF         = 'Iqrf.chm';

  iqhtmDHR          = 'DHR.htm';
  iqchmDHR          = 'DHR.chm';

  iqchmASSY1        = 'ASSY1.chm';
  iqhtmASSY1        = 'ASSY1.htm';

  iqchmICT          = 'ICT.chm';
  iqhtmICT          = 'ICT.htm';          // obsolete - for compatability only

  iqchmOSCentral    = 'OS Central.chm';
  iqhtmOSCentral    = 'OS Central.htm';  // does not apply - for compatability

  iqchmExpRep        = 'Exp Rep.chm';
  iqhtmExpRep        = 'Exp Rep.htm';

  iqchmIqAlert        = 'Alert.chm';
  iqhtmIqAlert        = 'Alert.htm';

  iqchmJOBSHOP2     = 'jobshop2.chm';
  iqhtmJOBSHOP2     = 'jobshop2.htm';

  iqchmShipman      = 'Shipping Manager.chm';
  iqhtmShipman      = 'Shipping Manager.htm';  // does not apply - for compatability

  iqchmShipmanFrt   = 'Shipping Manager Freight.chm';
  iqhtmShipmanFrt   = 'Shipping Manager Freight.htm'; // does not apply - for compatability

  iqchmKBSuperMkt   = 'EIQ.chm';  //KanBan
  iqhtmKBSuperMkt   = 'EIQ.htm';

  iqchmPIT_Act      = 'EIQ.chm';  //PIT at Actual
  iqhtmPIT_Act      = 'EIQ.htm';

  iqchmRTPMWC_Setup = 'RT Proc Mon.chm'; //RealTime Process Monitoring
  iqhtmRTPMWC_Setup = 'RT Proc Mon.htm'; {This is obsolete, we make the call from .net}

  iqchmRTPMMfg_Setup = 'RT Proc Mon.chm';
  iqhtmRTPMMfg_Setup = 'RT Proc Mon.htm';

  iqchmRTPM_Monitor  = 'RT Proc Mon.chm';
  iqhtmRTPM_Monitor  = 'RT Proc Mon.htm';

  iqchmICA   = 'EIQ.chm';  //ICA
  iqhtmICA   = 'EIQ.htm';

  iqchmGEN          = 'EIQ.chm'; // General use EIQ help file
  iqhtmGEN          = 'EIQ.htm';

  iqchmTaxReportingTool          = 'Tax Reporting Tool.chm';
  iqhtmTaxReportingTool          = 'Tax Reporting Tool.htm';

  iqchmWMS   = 'Advanced WMS.chm';
  iqhtmWMS   = 'Advanced WMS.htm';

{ See Module initialization }
var
  { 'hhctrl.ocx' version info }
  _hhInstalled: Boolean = FALSE;          //Is Html Help 'hhctrl.ocx' installed
  _hhVerStr: String = '';                 //eg. '4.73.8252.1' or '' if not found
  _hhMajVer: word = 0;                    //eg. 4
  _hhMinVer: word = 0;                    //eg. 73
  _hhBuildNo: word = 0;                   //eg. 8252
  _hhSubBuildNo: word = 0;                //eg. 1
  _hhFriendlyVerStr: String = '';         //eg. '1.2'

  { 'Shdocvw.dll' version info }
  _ieInstalled: Boolean = FALSE;          //Is Internet Explorer Installed
  _ieVerStr: String = '';                 //eg. '5.00.0910.1309'
  _ieFriendlyVerStr: String = '';         //eg. '5'

  { General }
  _RunDir: String = '';                   //applications run directory.

{ Host Apps - Live in the Windows Dir }
const
  HOST_HHEXE = 'HH.EXE';
  HOST_KEYHHEXE = 'KeyHH.EXE';

{ HH comand line prefix}
const
  HH_PREFIX_IE4 = 'ms-its:';             //IE4 and above compatible command line prefix
  HH_PREFIX_IE3 = 'mk:@MSITStore:';      //IE3 and above compatible command line prefix


{ HH Errors }
const
  HH_ERR_AllOK              = 0;
  HH_ERR_HHNotInstalled     = 1;     //Html Help is not installed on this PC
  HH_ERR_KeyHHexeNotFound   = 2;     //KeyHH.EXE was not found in the Windows folder
  HH_ERR_HHexeNotFound      = 3;     //HH.EXE was not found in the Windows folder
  HH_ERR_UnsupportedCall    = 4;     //HH.EXE does not support this command.


{ exports - General functions }

procedure DosToUnix(var filename: String);
function StrPosC(const s: String; const find: String): Integer;
function StrPosI(const s: String; const find: String): Integer;
function StrRepC( var s: String;  const find, repl: String): Integer;
function StrRepI( var s: String;  const find, repl: String): Integer;
procedure StripL(var s: String; c: char);
procedure StripR(var s: String; c: char);
procedure StripLR(var s: String; c: char);
function MkStr(c: Char; count: Integer): String;

function GetWinDir: String;
function GetWinSysDir: String;

function VerCompare(va1, va2, va3, va4, vb1, vb2, vb3, vb4: Word): Integer;
function GetFileVer(aFilename: String; var aV1, aV2, aV3, aV4: word): String;
function GetFileVerStr(aFilename: String): String;
function Check_HH_Version(x1, x2, x3, x4: Integer): Integer;
function Check_IE_Version(x1, x2, x3, x4: Integer): Integer;
function GetHHFriendlyVer: String;
function GetIEFriendlyVer: String;

function ShellExec(aFilename: String; aParams: String): Boolean;
function GetLastErrorStr: String;
function GetRegStr(rootkey: HKEY; const key, dataName: string): string;
procedure PutRegStr(rootkey: HKEY; const key, name, value: string);

resourcestring
  //Error Strings
  vh_HH_ERR_HHNotInstalled          = 'MS Html Help is not installed on this PC.';
  vh_HH_ERR_HHexeNotFound           = 'System file HH.EXE was not found in the Windows folder.';
  vh_HH_ERR_UnsupportedCall         = 'HH.EXE does not support help by context Id';
  vh_HH_ERR_Unknown                 = 'Unknown error returned by IQHelpContext';

  //For GetLastError
  vh_GLE_FileNotFound               = 'File Not Found';
  vh_GLE_PathNotFound               = 'Path Not Found';
  vh_GLE_AccessDenied               = 'Access Denied';
  vh_GLE_InsufficientMemory         = 'Insufficient Memory';
  vh_GLE_MediaIsWriteProtected      = 'Media Is Write Protected';
  vh_GLE_DeviceNotReady             = 'Device Not Ready';
  vh_GLE_FileInUse                  = 'File In Use';
  vh_GLE_DiskFull                   = 'Disk Full';
  vh_GLE_WindowsVersionIncorrect    = 'Windows Version Incorrect';
  vh_GLE_NotAWindowsOrMSDosProgram  = 'Not A Windows Or MSDos Program';
  vh_GLE_CorruptFileOrDisk          = 'Corrupt File Or Disk';
  vh_GLE_CorruptRegistry            = 'Corrupt Registry';
  vh_GLE_GeneralFailure             = 'General Failure';
  vh_GLE_FileNotFoundLoc            = 'The specified help file cannot be accessed ' +
                                      'without a specified HTML location.';


implementation

uses
  IQMS.Common.HtmHelp,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs,
  IQMS.Common.Boolean,
  Winapi.Messages,
  IQMS.Common.DebugHelpContext,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  IQMS.Common.DotNetCOMInterOp,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.Controls;

{---------------------------------------------------------------------]
  Hook Help System

  Delphi allows you to trap all help calls and redirect them
  to your own handler. Thus we get Html Help working under D3/4.

  Technically it should work this way:

    var mHHelp: THookHelpSystem;

    procedure TMainForm.FormCreate(Sender: TObject);
    begin
      //Set CHM file, Window Definition to use if reqired and Mode of operation
      mHHelp := THookHelpSystem.Create(pathToCHM, '', htHHAPI);
      ...

    procedure TMainForm.FormDestroy(Sender: TObject);
    begin
      //Unhook and free
      mHHelp.Free;
      ...

  Show help in the normal way
  o Set "Form.HelpContext := xx" to display page sensitive help via F1 key.
  o Set "Control.HelpContext := xx" to display field sensitive help via F1 and "whats this" help.
  o Call Application.HelpContext(xx) to show help directly from a memu or help button.
  o Make sure that Topic xx, xx is a context ID, is defined in the CHM help file.
  eg. Application.HelpContext(1133)

  To display a topic by topic filename use
  mHHelp.HelpTopic('index.html');

[---------------------------------------------------------------------}

constructor THookHelpSystem.Create(aDefChmFile, aDefHTMLFile, aDefWinDef: String; aHostType: THostType);
begin
  inherited Create;
  ChmFile   := aDefChmFile;
  HTMLFile  := aDefHTMLFile;
  WinDef    := aDefWinDef;
  {Hook in our help}
  mOldHelpEvent := Application.OnHelp;
  Application.OnHelp := HelpHook;

  {10-26-2009 mapped help}
  HHP_List:= THHP_List.Create;
end; { THookHelpSystem.Create }

constructor THookHelpSystem.CreateOnConsole;
begin
  inherited Create;  // 01-11-2012 create the object so reference to IQHelp throught EIQ won't bomb out with AV
  mOldHelpEvent := Application.OnHelp;
  Application.OnHelp := HelpHook;
end;

destructor THookHelpSystem.Destroy;
begin
  if hWinHelp > 0 then
     PostMessage( hWinHelp, WM_QUIT {WM_CLOSE}, 0, 0);

  if Assigned(HHP_List) then FreeAndNil(HHP_List);

  {Unhook our help}
  Application.OnHelp := mOldHelpEvent;

  inherited Destroy;
end; { THookHelpSystem.Destroy }

{ All application help calls to help come here }
{$IF CompilerVersion >= 26}  // Delphi XE5
function THookHelpSystem.HelpHook(Command : Word; Data : THelpEventData; Var CallHelp : Boolean) : Boolean;
{$ELSE}
function THookHelpSystem.HelpHook(Command : Word; Data : Longint; Var CallHelp : Boolean) : Boolean;
{$IFEND}

begin
   if (Command in [Help_Context, Help_ContextPopup]) then
   begin
     CallHelp := FALSE;
     DoHelp( ChmFile, HTMLFile, IntToStr( Data ) );
     //Self.HelpContext( Data );
   end
   else
   begin
     CallHelp := True;
   end;
   result := TRUE;
end; { THookHelpSystem.HelpHook }

procedure THookHelpSystem.AssignHTMLFile( const aDefChmFile, aDefHTMLFile: string );
begin
  if not Assigned(IQHelp) then
     EXIT;
  ChmFile := aDefChmFile;
  HTMLFile:= aDefHTMLFile;
end;

procedure DoHelpHook( aDefaultChmFile, aDefaultHTMLFile, aDefaultContextID: String );
begin
     {Hooks HTMLHelp into the form's main help system so that you can assign
      HelpContext ID's as you would in with a WinHelp system.  To use this
      method, do the following:
      1.  include IQHelpHk in the unit's uses clause.
      2.  In the form's OnActivate event, call this procedure.
          For example:

                 DoHelpHook( iqchmACCT, iqhtmAR, '1024470' );

      3. Assign values to the HelpContext properties of the appropriate
         controls on the form.

      Now you can use the system help button '?' to activate popups and open
      topics.  Pressing the F1 key will have the same results.

     }
     IQHelp := THookHelpSystem.Create( aDefaultChmFile, aDefaultHTMLFile, aDefaultContextID, htHHAPI );
end;

{ Do not call this directly. Instead call Application.HelpContext(xx) and it will call this function }
function THookHelpSystem.HelpContext(aContextId: DWord): Integer;
var
  ATmp: string;
begin
  {Original code:}
  //result := IQHelpContext(mDefChmFile, mDefHTMLFile, aContextId, mDefWinDef, mHostType);
  //IQHelpShowError(result);

  {this is a "simulated call" initiated by ObtainHelpContextUsing() for wiki below to obtain the correct helpcontext id}
  if FObtainHelpContextOnly then
  begin
    FObtainHelpContext4Wiki:= aContextId;
    EXIT;
  end;

  {Code that works:}
  DoHelp( ChmFile, HTMLFile, IntToStr( aContextId ));
end;

{Show a help topic}
function THookHelpSystem.HelpTopic(aTopic: String): Integer;
begin
   result := IQHelpDisplayTopic(ChmFile, aTopic, mDefWinDef, mHostType);
   IQHelpShowError(result);
end;

procedure THookHelpSystem.SetChmFile( const AValue: string );
var
  aroot:String;
begin
  {*UG_rem_AE*}
  mDefChmFile:= IQGetLocalHomePath + AValue;

  // 10-26-2009 mapped help support
  {*UG_rem_AE*}
  HHP_List.CheckAddFile(  HHP_MapFileName );
end;


{ Show Error }
procedure IQHelpShowError(err: Integer);
var s: String;
begin
  case err of
    HH_ERR_AllOK:            s := '';
    HH_ERR_HHNotInstalled:   s := vh_HH_ERR_HHNotInstalled;
    HH_ERR_HHexeNotFound:    s := vh_HH_ERR_HHexeNotFound;
    HH_ERR_UnsupportedCall:  s := vh_HH_ERR_UnsupportedCall;
    else                     s := vh_HH_ERR_Unknown;
  end;
  if s <> '' then
  begin
    IQWarning( s );
  end;
end;


{---------------------------------------------------------------------]
   IQHtmHlp Functions
[---------------------------------------------------------------------}


{ IQHelpDisplayTopic()
  Display a Topic from the CHM file using a Window Definition
    aChmFile: In
      Name of compressed help file to display.
      Generally this should be full path as NT is less forgiving with relative paths.
    aTopic: In
      Path to html file in Chm file.
      Leave blank to display open the Chm at the default page
    aWinDef: In
      Specify a window definition. Leading slash will be added if missing.
      Leave blank to display open the Chm with the default window definition
      Note: not supported by some versions of HH.EXE and KeyHH.EXE
    aHostType: In
      Who will host the HH Window
      - htHHAPI:  This application will host via API calls.
      - htHHexe:   Windows HH.EXE will.
    Returns:
      Possible returns
       0 = All OK
       HH_ERR_HHNotInstalled
       HH_ERR_HHexeNotFound (aHostType = htHHexe)
  Other Info
      - No checking is done on any of the params.
        Caller should first verify that the chmFile exists.
  Example:
      IQHelpDisplayTopic('windows.chm','about_magnify.htm','windefault', htHHAPI);
}

function THookHelpSystem.DoHelp( ACHM, AHTML, Alias: String ) : Boolean;
var
   ALocation : String;
   AContextToHtmFileName: string;
   ATmp: string;
   AWiki: string;
begin
      { The variables provide a varying degree of "drill-down"
       into the help file:

          CHM File    :  The main, compiled HTML Help File.
          HTML File   :  An HTML, or HTM, file within the CHM.
          Alias       :  A "Link" or "Jump" ID within the HTML file.

       The CHM and the HTML variables are required, but the Alias
       can be an empty string. }

     // 10-26-2009 support mapped help
     {*UG_rem_AE*}
     AContextToHtmFileName:= HHP_List.ContextToHtm( HHP_MapFileName, Alias {Context ID});

     {*UG_rem_AE*}
     if ExtractInLineParam( '_SHOW_HELP_CONTEXT_ID_', ATmp ) then    {IQMisc.pas}
     begin
       try
         AWiki:= GetWikiUrlFromKeyword( GetWikiKeyword( StrToInt( Alias )));
       except on E: Exception do
         AWiki:= E.Message;
       end;

       if not TFrmDebugHelpContext.DoShowModal(  Alias, AWiki ) then  //  debug_help_context.pas
          EXIT;
     end;

     if AContextToHtmFileName <> '' then
        ALocation:= AContextToHtmFileName

     else if AHTML = '' then
        begin
             // 'The specified help file cannot be accessed without a specified HTML location.'
             IQError( vh_GLE_FileNotFoundLoc );
             Exit;
        end

     else if Alias = '' then
        ALocation := AHTML

     else
        ALocation := AHTML + '#' + Alias;

     {Since only the name of the CHM file is provided, find the
     path of the Master Home Directory.}

     ACHM := ACHM; {in IQmisc.pas}

     {Open the help file}
     IQHelpDisplayTopic( ACHM, ALocation, '', htHHAPI );
end;

function DoHelpPopUp( AControl: TWinControl; AMsg: String;
                        OffsetX, OffsetY: Integer ): Boolean;
var
   HHP : HH_Popup;
begin
  {Displays a popup message for the specified control.
  Set the position of the popup, relative to the control,
  by supplying the control name, and including an X and Y
  value.

  For example:

          DoHelpPopup( btnPopup, 'Hello', 100, 20 );
  }
   with HHP do begin
      cbStruct          := sizeof( HHP );
      hInstance         := 0;
      idString          := 0;
      pszText           := PChar( AMsg );
      pt.x              := OffsetX;
      pt.y              := OffsetY;

      ClientToScreen( AControl.Handle, pt );
      {clrForeground     := -1;
      clrBackground     := -1;
      rcMargins.Left    := -1;
      rcMargins.Right   := -1;
      rcMargins.Top     := -1;
      rcMargins.Bottom  := -1;}
      pszFont := PChar('MS Sans Serif, 8');
   end;
   HtmlHelp( AControl.Handle, '', HH_Display_Text_Popup, longint(@HHP));

end;

function THookHelpSystem.IQHelpDisplayTopic(aChmFile, aTopic, aWinDef: String; aHostType: THostType): Integer;
var target: String;
begin

  if aHostType = htHHexe then  //Prefix required - use IE3 prefix
    target:= IQCHMFormat(aChmFile, aTopic, aWinDef, ptIE3)
  else                        //No prefix needed
    target:= IQCHMFormat(aChmFile, aTopic, aWinDef, ptNone);

  result:= IQHelpTopic( target, aHostType );
end;

{
   IQHelpTopic()
   Same as above except aCHMPath may be a combination
   chmfile, Topic, WinDef in the form chmfile::/Topic>WinDef
   Note: HH.EXE normally requires a path prefix.
}
function THookHelpSystem.IQHelpTopic(aCHMPath: String; aHostType: THostType): Integer;
var
  appPath: String;
  h: HWND;
begin
  result := HH_ERR_AllOK;  {0}

  { Check HH Installed on this PC }
  if not _hhInstalled then
    result := HH_ERR_HHNotInstalled
  else
  case aHostType of

    //Host Type = This app using HH API
    htHHAPI:
      begin
        {*UG_rem_AE*}
        hWinHelp:= HtmlHelpA(GetDesktopWindow, PAnsiChar(AnsiString(aCHMPath)), HH_DISPLAY_TOPIC, 0);
        if hWinHelp > 0 then
           SetForegroundWindow(hWinHelp);
      end;

    //Host Type = HH.EXE (part of Html Help)
    htHHexe:
      begin
        appPath := GetWinDir + '\' + HOST_HHEXE;
        if not FileExists(appPath) then
          result := HH_ERR_HHexeNotFound
        else
        begin
          { HH.EXE requires a prefix. }
          ShellExec(appPath, aCHMPath);
        end;
      end;
  end; {case}
end;




{ IQHelpContext()
  Displays a help topic based on a mapped topic ID.

  Function documentation is the same as above except replace "aTopic" by...

    aContextID
      Specifies the numeric ID of the topic to display

  returns an additional error
      HH_ERR_UnsupportedCall (THostType = htHHexe)
        since HH.EXE does not support this command line option

  Example:
     IQHelpContext('windows.chm',200,'windefault', htHHAPI);
}
function IQHelpContext(aChmFile: String; aHTMLFile: String; aContextID: DWord; aWinDef: String; aHostType: THostType): Integer;
var target: String;
begin
  target := IQCHMFormat(aChmFile, aHTMLFile, aWinDef, ptNone);
  result := IQHelpContextID( target, aContextID, aHostType );

end;


{
   IQHelpContextID()
   Same as above except aCHMPath may be a combination
   chmfile & WinDef in the form chmfile>WinDef
   Note: HH.EXE does not support context mapped help - use KeyHH.exe instead
}
function IQHelpContextID(aChmPath: String; aContextId: Integer; aHostType: THostType): Integer;
var
   appPath: String;
   h: HWND;
begin
  result := HH_ERR_AllOK;  {0}

  { Check HH Installed on this PC }
  if not _hhInstalled then
    result := HH_ERR_HHNotInstalled
  else
  case aHostType of

    //Host Type = This app using HH API
    htHHAPI:
      begin
        {*UG_rem_AE*}
        h := HtmlHelp(GetDesktopWindow, PChar(aChmPath), HH_HELP_CONTEXT, aContextID);

        if h > 0 then
          SetForegroundWindow(h);
      end;

    //Host Type = HH.EXE (part of Html Help)
    htHHexe:
      begin
        result := HH_ERR_UnsupportedCall;    //HH.EXE cannot do this
      end;

  end; {case}
end;



{
  This creates a command line suitable for use with HH.EXE, KeyHH or HHServer.EXE
    chmFile:
       Name of CHM file. Full or relative path.
    Topic:
       Html filename in Chm. Can be blank.
       Under IE4 this can include a bookmark.
    WinDef:
       Window Definition to use. Can be blank.
    aPrefixType:
       What to prefix string to add
       ptNone - No Prefix added
       ptIE3 - IE3 and above compatible prefix added - 'mk:@MSITStore:'
       ptIE4 - IE4 and above compatible prefix added - 'ms-its:'
  Result examples
    IQCHMFormat('windows.chm', 'about_magnify.htm', 'windefault', ptIE3);
    => 'mk:@MSITStore:windows.chm::/about_magnify.htm>windefault'

    chmFile.chm
    chmFile.chm>WinDef
    Helpfile.chm::/Topic.htm>WinDef
    ms-its:chmFile.chm>WinDef
    mk:@MSITStore:Helpfile.chm::/Topic.htm>WinDef

}
function IQCHMFormat(aChmFile, aTopic, aWinDef: String; aPrefixType: TPrefixType): String;
begin
  StripLR(aChmFile, ' ');   StripLR(aTopic, ' ');   StripLR(aWinDef, ' ');  //no lead trail spaces

  {make chm and topic}
  if aTopic = '' then
    result := aChmFile
  else
  begin
    DosToUnix(aTopic);                    //Topics should always contain '/' unix slashes
    if aTopic[1] <> '/' then              //we want a leading slash
      aTopic := '/' + aTopic;
    result := aTopic;
    if aChmFile <> '' then                //Allow no chmfile so we can format the topic
      result := aChmFile + '::' + result
  end;

  {add win definition}
  if aWinDef <> '' then
    result := result + '>' + aWinDef;

  {add prefix}
  case aPrefixType of
    ptIE3: result := HH_PREFIX_IE3 + result;
    ptIE4: result := HH_PREFIX_IE4 + result;
  end;
end;


{
  Given a string s like
    mk:@MSITStore:aChmFile::aTopic>aWinDef
  eg.
    chmFile.chm
    chmFile.chm>WinDef
    Helpfile.chm::/Topic.htm>WinDef
    ms-its:chmFile.chm>WinDef
    mk:@MSITStore:Helpfile.chm::/Topic.htm>WinDef
  return the components
    aChmFile, aTopic, aWinDef
}
procedure IQHelpSplitCmdStr(s: String; var aChmFile, aTopic, aWinDef: String);
var i: Integer;
begin
   aChmFile := ''; aTopic := ''; aWinDef := '';

   {Get WinDef}
   i := StrPosC(s, '>');
   if i > 0 then
   begin
     aWinDef := Copy(s, i+1, Maxint);
     SetLength(s, i-1);
   end;

   {Get Topic}
   i := StrPosC(s, '::');
   if i > 0 then
   begin
     aTopic := Copy(s, i+2, Maxint);
     SetLength(s, i-1);
     DosToUnix(aTopic);                    //Topics should always contain '/' unix slashes
   end;

   {Get chmFile}
   i := StrPosI(s, 'its:'); //'ms-its:'
   if i > 0 then
     aChmFile := Copy(s, i+length('its:'), Maxint)
   else
   begin
     i := StrPosI(s, 'store:');  //'mk:@MSITStore:'
     if i > 0 then
       aChmFile := Copy(s, i+length('store:'), Maxint)
     else
       aChmFile := s;
   end;

   StripLR(aChmFile, ' ');
   StripLR(aTopic, ' ');
   StripLR(aWinDef, ' ');
end;



{---------------------------------------------------------------------]
   General Functions
[---------------------------------------------------------------------}


{ Sometimes safest to work in Unix / slashes }
procedure DosToUnix(var filename: String);
begin
  repeat until StrRepC(filename, '\', '/') = 0;
end;

{Find pos of sub string in string. Case Sensitive - returns 0 not found or 1..n}
function StrPosC(const s: String; const find: String): Integer;
var p: PChar;
begin
  p := AnsiStrPos( PChar(s) , PChar(find) );   //double byte safe
  if p = NIL then
    result := 0
  else
    result := p - PChar(s) + 1;
end;

{Same as Above only ignores case}
function StrPosI(const s: String; const find: String): Integer;
var s2, find2: String;
begin
  s2 := AnsiUpperCase(s);
  find2 := AnsiUpperCase(find);
  result := StrPosC(s2, find2);
end;


{returns pos where subString replacements was done - 0 = none done - Case Sensitive}
function StrRepC( var s: String;  const find, repl: String): Integer;
begin
  result := StrPosC(s, find);
  if result > 0 then     {found - replace}
  begin
    Delete( s, result, Length(find) );
    Insert( repl, s, result );
  end;
end;

{returns pos where subString replacements was done - 0 = none done - Ignore Sensitive}
function StrRepI( var s: String;  const find, repl: String): Integer;
begin
  result := StrPosI(s, find);
  if result > 0 then     {found - replace}
  begin
    Delete( s, result, Length(find) );
    Insert( repl, s, result );
  end;
end;


{Strip leading chars}
procedure StripL(var s: String; c: char);
begin
  while (s <> '') and (s[1] = c) do
    Delete(s, 1, 1);
end;

{Strip trailing chars}
procedure StripR(var s: String; c: char);
var p: PChar;
begin
  if s <> '' then
  repeat
    p := AnsiLastChar(S);
    if p = c then
      SetLength(s, Length(s)-1)
    else
      break;
  until p = NIL;
end;

{Strip leading and trailing chars}
procedure StripLR(var s: String; c: char);
begin
  StripL(s, c);
  StripR(s, c);
end;

{Make string of chars}
function MkStr(c: Char; count: Integer): String;
var i: Integer;
begin
  result := '';
  for i := 1 to count do
    result := result + c;
end;

{Return Windows Dir}
function GetWinDir: String;
var path: array[0..260] of Char;
begin
  GetWindowsDirectory(path, SizeOf(path));
  result := path;
  StripR(result, '\');  //no trailing slash
end;

{Return Windows System Dir}
function GetWinSysDir: String;
var path: array[0..260] of Char;
begin
  GetSystemDirectory(path, SizeOf(path));
  result := path;
  StripR(result, '\');  //no trailing slash
end;


{
  Get the product version number from a file (exe, dll, ocx etc.)
  Return '' if info not available - eg. file not found
  eg. Returns '7.47.3456.0', aV1=7, aV2=47, aV3=3456 aV4=0
  ie. major.minor.release.build
}
function GetFileVer(aFilename: String; var aV1, aV2, aV3, aV4: word): String;
var  InfoSize: DWORD; Wnd: DWORD; VerBuf: Pointer; VerSize: DWORD; FI: PVSFixedFileInfo;
begin
  result := '';
  aV1 := 0;  aV2 := 0;  aV3 := 0;  aV4 := 0;
  if (aFilename = '') or (not FileExists(aFilename)) then exit;  //don't continue if file not found

  InfoSize := GetFileVersionInfoSize(PChar(aFilename), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfo(PChar(aFilename), Wnd, InfoSize, VerBuf) then
        if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then
        begin
          aV1 := HiWord(FI^.dwFileVersionMS);
          aV2 := LoWord(FI^.dwFileVersionMS);
          aV3 := HiWord(FI^.dwFileVersionLS);
          aV4 := LoWord(FI^.dwFileVersionLS);
          result := IntToStr( HiWord(FI^.dwFileVersionMS) ) + '.' +
                    IntToStr( LoWord(FI^.dwFileVersionMS) ) + '.' +
                    IntToStr( HiWord(FI^.dwFileVersionLS) ) + '.' +
                    IntToStr( LoWord(FI^.dwFileVersionLS) );
        end;
    finally
      FreeMem(VerBuf);
    end;
  end;
end; //GetFileVer


{ Same as above but only returns version string }
function GetFileVerStr(aFilename: String): String;
var aV1, aV2, aV3, aV4: word;
begin
  result := GetFileVer(aFilename, aV1, aV2, aV3, aV4);
end;


{
  Version Compare : returns -1 if Va < Vb, 0 if Va = Vb, 1 if Va > Vb
  eg. VerCompar(1,0,0,1, 1,0,0,2) will return -1
  eg. VerCompar(2,0,0,1, 1,0,6,90) will return 1 because 2.0.0.1 is > 1.0.6.90
}
function VerCompare(va1, va2, va3, va4, vb1, vb2, vb3, vb4: Word): Integer;
begin
  if (va1 = vb1) AND (va2 = vb2) AND (va3 = vb3) AND (va4 = vb4) then
    result := 0
  else if (va1 > vb1)
  or ((va1 = vb1) AND (va2 > vb2))
  or ((va1 = vb1) AND (va2 = vb2) AND (va3 > vb3))
  or ((va1 = vb1) AND (va2 = vb2) AND (va3 = vb3) AND (va4 > vb4)) then
    result := 1
  else
    result := -1;
end;


{ Get Friendly version numbers for HTML Help 'hhctrl.ocx'
    V1.0 is 4.72.7290 - IE4
    V1.1 is 4.72.7323
    V1.1a is 4.72.7325 - Windows98
    V1.1b is 4.72.8164 - MSDN
    V1.2 is 4.73.8252
    V1.21 is 4.73.8412
  return '' if hhctrl.ocx not found. otherwise a version string like '1.2'.
}
function GetHHFriendlyVer: String;
var  v1,v2,v3,v4: Word; fn, s: String;
begin
  {*UG_rem_AE*}
  fn := GetPathToHHCtrlOCX;
  s := GetFileVer(fn, v1,v2,v3,v4);
  if s = '' then
    result := ''
  else
  if VerCompare( v1,v2,v3,v4, 4,73,8252,0) > 0 then
    result := '> 1.21'
  else if VerCompare( v1,v2,v3,v4, 4,73,8412,0) = 0 then
    result := '1.21'
  else if VerCompare( v1,v2,v3,v4, 4,73,8252,0) = 0 then
    result := '1.2'
  else if VerCompare( v1,v2,v3,v4, 4,72,8164,0) >= 0 then
    result := '1.1b'
  else if VerCompare( v1,v2,v3,v4, 4,72,7325,0) >= 0 then
    result := '1.1a'
  else if VerCompare( v1,v2,v3,v4, 4,72,7323,0) >= 0 then
    result := '1.1'
  else if VerCompare( v1,v2,v3,v4, 4,72,7290,0) >= 0 then
    result := '1.0'
  else
    result := '< 1.0';
end;


{
  Check is IE Version x.x.x.x is installed.
  returns
    -1   ... A lesser version of x.x.x.x is installed.
     0   ... x.x.x.x is the version installed
    +1   ... A greater version of x.x.x.x is installed.

  Example
    if Check_IE_Version(4,70,1300,0) < 0 then
      ShowMessage('HtmlHelp requires that you installed IE3.02 or better.');

  The following are the versions of Shdocvw.dll and the browser version that each represents
  <major version>.<minor version>.<build number>.<sub-build number>
   Version          Product
   -----------------------------------------------------------------
   4.40.308         Internet Explorer 1.0 (Plus!)
   4.40.520         Internet Explorer 2.0
   4.70.1155        Internet Explorer 3.0
   4.70.1158        Internet Explorer 3.0 (OSR2)
   4.70.1215        Internet Explorer 3.01
   4.70.1300        Internet Explorer 3.02
   4.71.544         Internet Explorer 4.0 Platform Preview 1.0 (PP1)
   4.71.1008.3      Internet Explorer 4.0 Platform Preview 2.0 (PP2)
   4.71.1712.6      Internet Explorer 4.0
   4.72.2106.8      Internet Explorer 4.01
   4.72.3110.3      Internet Explorer 4.01 Service Pack 1 (SP1)
   5.00.0518.10     Internet Explorer 5 Developer Preview (Beta 1)
   5.00.0910.1309   Internet Explorer 5 Beta (Beta 2)
}
function Check_IE_Version(x1, x2, x3, x4: Integer): Integer;
var  v1,v2,v3,v4: Word; fn: String;
begin
  result := -1;
  fn := GetWinSysDir + '\Shdocvw.dll';
  if GetFileVer(fn, v1,v2,v3,v4) <> '' then
    result := VerCompare(x1,x2,x3,x4, v1,v2,v3,v4);
end;

{ Get Friendly version numbers of IE (see above)
  return '' if Shdocvw.dll not found. otherwise a version string like '1.2'.
}
function GetIEFriendlyVer: String;
var  v1,v2,v3,v4: Word; fn, s: String;
begin
  fn := GetWinSysDir + '\Shdocvw.dll';
  s := GetFileVer(fn, v1,v2,v3,v4);
  if s = '' then
    result := ''
  else
  if VerCompare( v1,v2,v3,v4, 5,00,0910,1309) > 0 then
    result := '> Internet Explorer 5 (Beta 2)'
  else if VerCompare( v1,v2,v3,v4, 5,00,0910,1309) = 0 then
    result := 'Internet Explorer 5 Beta (Beta 2)'
  else if VerCompare( v1,v2,v3,v4, 5,00,0518,10) >= 0 then
    result := 'Internet Explorer 5 Developer Preview (Beta 1)'
  else if VerCompare( v1,v2,v3,v4, 4,72,3110,3) >= 0 then
    result := 'Internet Explorer 4.01 Service Pack 1 (SP1)'
  else if VerCompare( v1,v2,v3,v4, 4,72,2106,8) >= 0 then
    result := 'Internet Explorer 4.01'
  else if VerCompare( v1,v2,v3,v4, 4,71,1712,6) >= 0 then
    result := 'Internet Explorer 4.0'
  else if VerCompare( v1,v2,v3,v4, 4,71,1008,3) >= 0 then
    result := 'Internet Explorer 4.0 Platform Preview 2.0 (PP2)'
  else if VerCompare( v1,v2,v3,v4, 4,71,544,0 ) >= 0 then
    result := 'Internet Explorer 4.0 Platform Preview 1.0 (PP1)'
  else if VerCompare( v1,v2,v3,v4, 4,70,1300,0) >= 0 then
    result := 'Internet Explorer 3.02'
  else if VerCompare( v1,v2,v3,v4, 4,70,1215,0) >= 0 then
    result := 'Internet Explorer 3.01'
  else if VerCompare( v1,v2,v3,v4, 4,70,1158,0) >= 0 then
    result := 'Internet Explorer 3.0 (OSR2)'
  else if VerCompare( v1,v2,v3,v4, 4,70,1155,0) >= 0 then
    result := 'Internet Explorer 3.0'
  else if VerCompare( v1,v2,v3,v4, 4,40,520,0 ) >= 0 then
    result := 'Internet Explorer 2.0'
  else if VerCompare( v1,v2,v3,v4, 4,40,308,0 ) >= 0 then
    result := 'Internet Explorer 1.0 (Plus!)'
  else
    result := '< Internet Explorer 1.0 (Plus!)';
end;


{
  Check is HtmlHelp Version x.x.x.x is installed.
  returns
    -1   ... A lesser version of x.x.x.x is installed.
     0   ... x.x.x.x is the version installed
    +1   ... A greater version of x.x.x.x is installed.

  Example
    if Check_HH_Version(4,73,8252,0) < 0 then
      ShowMessage('HtmlHelp 1.2 or greater is required. Please download a new version.');

  The following are the versions of Shdocvw.dll and the browser version that each represents
  <major version>.<minor version>.<build number>.<sub-build number>
    V1.0 is 4.72.7290 - IE4
    V1.1 is 4.72.7323
    V1.1a is 4.72.7325 - Windows98
    V1.2 is 4.73.8252
}
function Check_HH_Version(x1, x2, x3, x4: Integer): Integer;
var  v1,v2,v3,v4: Word; fn: String;
begin
  result := -1;
  {*UG_rem_AE*}
  fn := GetPathToHHCtrlOCX;
  if GetFileVer(fn, v1,v2,v3,v4) <> '' then
    result := VerCompare(x1,x2,x3,x4, v1,v2,v3,v4);
end;


{
  ShellExec()
  =============================
  Calls Windows shellexecute(h,'open',...)
  eg. Shellexec('mailto:robert.chandler@osi.varian.com', '');
  Returns TRUE if windows reports no errors
}
function ShellExec(aFilename: String; aParams: String): Boolean;
var h: THandle; handle: hWnd;
begin
  {
    Get Handle of parent window
  }
  if (Screen <> NIL) AND (Screen.ActiveForm <> NIL) AND (Screen.ActiveForm.handle <> 0) then
    handle := Screen.ActiveForm.handle
  else
  if Assigned(Application) AND Assigned(Application.Mainform) then
    handle := Application.Mainform.handle
  else
    handle := 0;

  h := ShellExecute(handle, 'open', Pchar(aFilename), Pchar(aParams), NIL, SW_SHOWDEFAULT);
  result := (h > 32);  //success?
end;


{
  Return error description of last error
}
function GetLastErrorStr: String;
var ErrCode: Integer;
begin
  ErrCode := GetlastError;
  case ErrCode of
    ERROR_FILE_NOT_FOUND:   result := vh_GLE_FileNotFound;
    ERROR_PATH_NOT_FOUND:   result := vh_GLE_PathNotFound;
    ERROR_ACCESS_DENIED:          result := vh_GLE_AccessDenied;
    ERROR_NOT_ENOUGH_MEMORY:      result := vh_GLE_InsufficientMemory;
    ERROR_WRITE_PROTECT:          result := vh_GLE_MediaIsWriteProtected;
    ERROR_NOT_READY:              result := vh_GLE_DeviceNotReady;
    ERROR_SHARING_VIOLATION,
    ERROR_LOCK_VIOLATION:         result := vh_GLE_FileInUse;
    ERROR_HANDLE_DISK_FULL,
    ERROR_DISK_FULL:              result := vh_GLE_DiskFull;
    ERROR_OLD_WIN_VERSION:        result := vh_GLE_WindowsVersionIncorrect;
    ERROR_APP_WRONG_OS:           result := vh_GLE_NotAWindowsOrMSDosProgram;
    ERROR_EA_FILE_CORRUPT,
    ERROR_UNRECOGNIZED_VOLUME,
    ERROR_FILE_CORRUPT,
    ERROR_DISK_CORRUPT:           result := vh_GLE_CorruptFileOrDisk;
    ERROR_BADDB,
    ERROR_INTERNAL_DB_CORRUPTION: result := vh_GLE_CorruptRegistry;
  else                            result := vh_GLE_GeneralFailure;
  end; {case}
  result := '[Error:'+IntToStr(ErrCode) + '] ' + result;
end;


{
  Get a value from the registry
  dataName = '' for default value.
  Returns '' if not found
}
function GetRegStr(rootkey: HKEY; const key, dataName: string): string;
var rg: TIQWebRegistry;
begin
  result := '';  //default return
  rg := TIQWebRegistry.Create;
  rg.RootKey :=  rootkey;
  if rg.KeyExists(key) AND rg.OpenKey(key, FALSE) AND rg.ValueExists(dataName) then
  begin
    result := rg.ReadString(dataName);
    rg.CloseKey;
  end;
  rg.Free;
end;

{
  Creates a Key and addes a Value
  An absolute key begins with a backslash (\) and is a subkey of the root key.
}
procedure PutRegStr(rootkey: HKEY; const key, name, value: string);
var rg: TIQWebRegistry;
begin
  rg := TIQWebRegistry.Create;
  rg.RootKey :=  rootkey;
  if rg.OpenKey(key, TRUE {create if not found}) then
  begin
    rg.WriteString(name, value);
    rg.CloseKey;
  end;
  rg.Free;
end;

{ Module initialization }
procedure ModuleInit;
begin
  { get run dir }
  _RunDir := ExtractFilePath(ParamStr(0));
  StripR(_RunDir, '\');

  {get version info of 'hhctrl.ocx' - returns '' and 0s if not found}
  {*UG_rem_AE*}
  _hhVerStr := GetFileVer( GetPathToHHCtrlOCX, _hhMajVer, _hhMinVer, _hhBuildNo, _hhSubBuildNo);
  _hhInstalled := (_hhVerStr <> '');
  _hhFriendlyVerStr := GetHHFriendlyVer;

  {ie info}
  _ieVerStr := GetFileVerStr(GetWinSysDir + '\Shdocvw.dll');
  _ieInstalled := (_ieVerStr <> '');
  _ieFriendlyVerStr := GetIEFriendlyVer;
end;

procedure FreeHelpHookSystem;
begin
  // 10/12/2011 Free the help hook system (Byron)
  if Assigned(IQHelp) then FreeAndNil(IQHelp);
end;

function THookHelpSystem.GetHHP_MapFileName: string;
begin
  Result:= ChangeFileExt( mDefChmFile, '.hhp' );
end;


function DoHelp( ACHM, AHTML, Alias: String ) : Boolean;
begin
  if Assigned(IQHelp) then
     Result:= IQHelp.DoHelp( ACHM, AHTML, Alias );
end;

{------------------------------------------------------------------------------}
function THookHelpSystem.FindSubMenuByCaption( AMenuItem: TUniMenuItem; AMenuCaption: string ): TUniMenuItem;
var
  I:Integer;
  S: string;
begin
  Result := NIL; // initial

  // 07/11/2013 Check
  if (AMenuItem = nil) then
    Exit;

  {*UG_rem_AE*}
  S:= StrTran( AMenuItem.Caption, '&', '');
  if CompareText( S, AMenuCaption ) = 0 then
  begin
    Result:= AMenuItem;
    EXIT;
  end;

  for I:= 0 to AMenuItem.Count - 1 do
  begin
     Result:= FindSubMenuByCaption( AMenuItem.Items[ I ], AMenuCaption );
     if Result <> nil then EXIT;
  end;
end;


procedure THookHelpSystem.CheckAssignExtraLinksTo(Sender: TObject; AHelpMenuItem: TUniMenuItem );
var
  I               : Integer;
  AContents       : TUniMenuItem;
  AKnowledgeCenter: TUniMenuItem;
  AWikiSOP        : TUniMenuItem;
  AMyIQMS         : TUniMenuItem;
  AAbout          : TUniMenuItem;
begin
  AContents       := FindSubMenuByCaption( AHelpMenuItem, IQMS.Common.ResStrings.cTXT0000389 {'Contents'});
  AKnowledgeCenter:= FindSubMenuByCaption( AHelpMenuItem, IQMS.Common.ResStrings.cTXT0000390 {'Knowledge Center'});
  AWikiSOP        := FindSubMenuByCaption( AHelpMenuItem, IQMS.Common.ResStrings.cTXT0000391 {'Wiki/SOP'});
  AMyIQMS         := FindSubMenuByCaption( AHelpMenuItem, IQMS.Common.ResStrings.cTXT0000410 {'MyIQMS'});
  AAbout          := FindSubMenuByCaption( AHelpMenuItem, IQMS.Common.ResStrings.cTXT0000542 {'About'});

  // check create Knowledge Center
  if AKnowledgeCenter = nil then
  begin
     AKnowledgeCenter:= TUniMenuItem.Create( AHelpMenuItem.GetParentMenu );
     AKnowledgeCenter.Caption:= IQMS.Common.ResStrings.cTXT0000390 {'Knowledge Center'};
     AKnowledgeCenter.OnClick:= DoInvokeKnowledgeCenter;
     AHelpMenuItem.Insert( AHelpMenuItem.IndexOf( AContents ) + 1, AKnowledgeCenter );
  end;

  if AWikiSOP = nil then
  begin
     AWikiSOP:= TUniMenuItem.Create( AHelpMenuItem.GetParentMenu );
     AWikiSOP.Caption:= IQMS.Common.ResStrings.cTXT0000391 {'Wiki/SOP'};
     AWikiSOP.OnClick:= DoInvokeWiki;
     AWikiSOP.Tag    := LongInt( Sender as TUniForm );
     AHelpMenuItem.Insert( AHelpMenuItem.IndexOf( AKnowledgeCenter ) + 1, AWikiSOP );
  end;

  if AMyIQMS = nil then
  begin
     AMyIQMS:= TUniMenuItem.Create( AHelpMenuItem.GetParentMenu );
     AMyIQMS.Caption:= IQMS.Common.ResStrings.cTXT0000410 {'MyIQMS'};
     AMyIQMS.OnClick:= DoInvokeMyIQMS;
     AHelpMenuItem.Insert( AHelpMenuItem.IndexOf( AWikiSOP ) + 1, AMyIQMS );
  end;

  if Assigned( AAbout ) then
  begin
    AHelpMenuItem.Delete( AHelpMenuItem.IndexOf( AAbout ) );
    AHelpMenuItem.Insert( AHelpMenuItem.IndexOf( AMyIQMS ) + 1, AAbout );
  end;
end;


procedure THookHelpSystem.DoInvokeKnowledgeCenter(Sender: TObject);
const
  DOTNETDLL = 'SmartSearch';
  DOTNETCOMTYPE = 'IQMS.Search.SearchEngine';
var
  CW: Word;
  {*UG_rem_AE*}
  h:TPanelMesg;

  AAlias   : string;
  AUserName: string;
  APassword: string;
begin
  DisableFPUExceptions( CW );
  try
    FreeDNetObject_Ex( FKnowledgeCenter );

    {*UG_rem_AE*}
    h:= hPleaseWait( IQMS.Common.ResStrings.cTXT0000390 {'Loading Knowledge Center ...'} );
    {create object}
    {*UG_rem_AE*}
//    try
//      CreateDNetCOM( FKnowledgeCenter, DOTNETDLL, DOTNETCOMTYPE, DNetVersion4_0_30319 );
//    finally
//      if Assigned( h ) then h.Free;
//    end;

    {*UG_rem_AE*}
    AAlias   := IQGetServerName;
    AUserName:= UpperCase(SecurityManager.UserName);
    // Note: Do not make password uppercase.
    APassword:= SecurityManager.Password;

    {connect}
    FKnowledgeCenter.ConnectToDataBase( AAlias, AUserName, APassword );

    {show the widget}
    FKnowledgeCenter.ExecuteWidgetDlg;

  finally
    RestoreFPU( CW );
  end;
end;


procedure THookHelpSystem.DoInvokeWiki(Sender: TObject);
var
  ALink: string;
  AForm: TUniForm;
  AContents: TUniMenuItem;
  AHelpContext: Integer;
  AHelp1: TComponent;
  ATmp: string;
begin
  ALink := '';
  AForm := nil;
  AHelp1 := nil;
  AContents := nil;
  AHelpContext := 0;

  if (Sender <> nil) then
    begin
      if (Sender is TUniMenuItem) and (TUniMenuItem(Sender).Tag > 0) then
         AForm := Pointer( TUniMenuItem(Sender).Tag )
      else if (Sender is TUniForm) then
         AForm := TUniForm(Sender)
      {*UG_rem_AE*}
      else if (Sender is TComponent) then
         AForm := GetOwnerForm(Sender as TComponent);
    end;

  // 'Unable to identify the form requesting the Wiki page.  Operation aborted.'
  {*UG_rem_AE*}
  IQAssert( Assigned( AForm ), IQMS.Common.ResStrings.cTXT0000407);

  {Simulate clicking Contents to obtain HelpContext}
  AHelp1 := AForm.FindComponent('Help1');
  if Assigned(AHelp1) and (AHelp1 is TUniMenuItem) then
    AContents:= FindSubMenuByCaption(TUniMenuItem(AHelp1), IQMS.Common.ResStrings.cTXT0000389 {'Contents'});
  if Assigned(AContents) then
     AHelpContext:= ObtainHelpContextUsing(AContents);

  {just in case fall back on what's assigned to the form}
  if AHelpContext = 0 then
     AHelpContext:= AForm.HelpContext;
  // 'Unable to establish help conext ID of the form requesting the Wiki page.'
  {*UG_rem_AE*}
  IQAssert( AHelpContext > 0, IQMS.Common.ResStrings.cTXT0000408);

  {generate link keyword EIQ_12345}
  ALink:= GetWikiKeyword( AHelpContext );

  {for development and troubleshooting}
  {*UG_rem_AE*}
  if ExtractInLineParam( '_SHOW_HELP_CONTEXT_ID_', ATmp ) then    {IQMisc.pas}
  begin
    if not TFrmDebugHelpContext.DoShowModal( IntToStr(AHelpContext), GetWikiUrlFromKeyword( ALink )) then  //  debug_help_context.pas
       EXIT;
  end;

  {Finally show it!}
  DoInvokeWiki( ALink );
end;


procedure THookHelpSystem.DoInvokeMyIQMS(Sender: TObject);
var
  AURL: string;
begin
  AURL:= 'www.myiqms.com';
  ShellExecute( Application.MainForm.Handle, 'open', PChar(AURL), nil, nil, SW_SHOWNORMAL) ;
end;

procedure THookHelpSystem.DoInvokeWiki( ALink: string );
var
  AURL: string;
begin
  // 'Undefined Wiki/SOP link.  Operation aborted.'
  {*UG_rem_AE*}
  IQAssert( ALink > '', IQMS.Common.ResStrings.cTXT0000405);

  AURL:= GetWikiUrlFromKeyword( ALink );
  ShellExecute( Application.MainForm.Handle, 'open', PChar(AURL), nil, nil, SW_SHOWNORMAL) ;
end;


function THookHelpSystem.GetWikiKeyword( AHelpContext: Integer ): string;
begin
  Result:= Format('%s_%d', [ ChangeFileExt( ExtractFileName(HHP_MapFileName), '' ), AHelpContext ]);
end;


function THookHelpSystem.GetWikiUrlFromKeyword( ALink: string ): string;
begin
  Result:= SelectValueAsString('select app_server_url from iqsys');
  // 'The Application Server URL has not been assigned.'
  {*UG_rem_AE*}
  IQAssert( Result > '', IQMS.Common.ResStrings.cTXT0000406);
  if Result[ Length(Result) ] <> '/' then
     Result:= Result + '/';

  // Result:= Format('%s/twiki/bin/view/Main/%s', [ Result, ALink ]);
  Result:= Format('%s/cgi/twiki.exe?v_topic=%s', [ Result, ALink ]);
end;

function THookHelpSystem.ObtainHelpContextUsing( AContents: TUniMenuItem ): Integer;
begin
  {Simulate clicking on Contents1 - the idea is to force the system to call self.HelpContext method wich may update the HelpContext ID
   and then scoop it up using FObtainHelpContext4Wiki variable}
  FObtainHelpContextOnly := TRUE;
  FObtainHelpContext4Wiki:= 0;
  Result:= 0;
  try
    {Similate Contents1 click that modifies FObtainHelpContext4Wiki in HelpContext method}
    if Assigned( AContents.OnClick ) then
       AContents.OnClick( AContents );

    Result:= FObtainHelpContext4Wiki;
  finally
    FObtainHelpContextOnly := FALSE;
    FObtainHelpContext4Wiki:= 0;
  end;
end;

initialization
  ModuleInit;

end.

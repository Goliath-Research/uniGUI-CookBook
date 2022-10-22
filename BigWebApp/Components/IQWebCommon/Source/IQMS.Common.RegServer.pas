unit IQMS.Common.RegServer;

(******************************************************************************
 * ***                      Register/Unregister Server                      ***
 ******************************************************************************
 *                                                                            *
 *  This unit contains the component, TRegSvr, which is used for              *
 *  registering and unregistering files in the same way that a call           *
 *  to, Regsvr32, would work.                                                 *
 *                                                                            *
 *  Call one of the wrappers below to register or unregister a DLL, TLB,      *
 *  EXE or OCX.  Pass the full path and file name of an existing file.        *
 *  If the file does not exist, an error will be raised.                      *
 *                                                                            *
 *  To ensure this unit compiles correctly, add $(DELPHI)\Source\Rtl\Win      *
 *  to the Environment Library path.                                          *
 *                                                                            *
 ******************************************************************************)

interface

uses
  System.SysUtils, Winapi.Windows, Vcl.Forms, System.Classes, System.Variants, Winapi.ActiveX, System.Win.ComObj,
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
  FireDAC.UI.Intf;

  function RegisterFile(const AFileName: String): Boolean;
  function UnRegisterFile(const AFileName: String): Boolean;


type
  TRegType = (rtUnknown, rtAxLib, rtTypeLib, rtExeLib);
  TRegAction = (raReg, raUnreg);
  TRegProc = function : HResult; stdcall;
  TUnRegTlbProc = function (const libID: TGUID; wVerMajor, wVerMinor: Word;
    lcid: TLCID; syskind: TSysKind): HResult; stdcall;

  TIQWebRegSvr = class(TComponent)
  private
    { Private declarations }
    RegType: TRegType;
    RegAction: TRegAction;
    RegProc: TRegProc;
    LibHandle: THandle;
    OleAutLib: THandle;
    UnRegTlbProc: TUnRegTlbProc;
    FFileName: String;

    procedure DetermineRegType;

    function ProcessExec: Boolean;
    function ProcessAs_ActiveX: Boolean;
    function ProcessAs_TLB: Boolean;
    function ProcessAs_EXE: Boolean;

  public
    { Public declarations }
    constructor Create(const AFileName: String); reintroduce;
    function RegisterFile: Boolean;
    function UnRegisterFile: Boolean;
    function IsFileRegistered: Boolean;
  published
    { Published declarations }
    property FileName: String read FFileName write FFileName;
end;

resourcestring
   cRsc0000001 = 'Cannot load file, %s';
   cRsc0000002 = 'Cannot register file, %s';
   cRsc0000003 = 'Cannot find file, %s';
   cRsc0000004 = 'The version of OLEAUT32.DLL on this machine does not ' +
    'support type library unregistration.';
   cRsc0000005 = 'File, %s, must have a file extension.';
   cRsc0000006 = '%s procedure not found in %s';
   cRsc0000007 = 'Call to %s failed in %s';

const
  ProcName: array[TRegAction] of PChar = (
    'DllRegisterServer', 'DllUnregisterServer');
  ExeFlags: array[TRegAction] of string = (' /regserver', ' /unregserver');

implementation

// Register a file
function RegisterFile(const AFileName: String): Boolean;
begin
  // Create the component and process the file
  with TIQWebRegSvr.Create(AFileName) do
  try
     Result := RegisterFile;
  finally
     Free;
  end;
end;

// Unregister a file
function UnRegisterFile(const AFileName: String): Boolean;
begin
  // Create the component and process the file
  with TIQWebRegSvr.Create(AFileName) do
  try
     Result := UnregisterFile;
  finally
     Free;
  end;
end;

{ ---------------------------------------------------------------------------- }
{ TRegSvr }
{ ---------------------------------------------------------------------------- }

constructor TIQWebRegSvr.Create(const AFileName: String);
begin
  inherited Create(Application);

  // Assign default values
  RegType := TRegType(0);
  RegAction := TRegAction(0);
  FFileName := AFileName;

end;

function TIQWebRegSvr.ProcessExec: Boolean;
begin
  // Process action based on property values.  This method is called
  // internally.

  // Default
  Result := False;

  // Validation
  if not FileExists(FileName) then
    // 'Cannot find file, %s'
    raise Exception.CreateFmt(cRsc0000003, [FileName]);

  // Determine which method to call based on the file type.
  DetermineRegType;

  // Process the appropriate file
  case RegType of
    rtAxLib:   Result := ProcessAs_ActiveX;
    rtTypeLib: Result := ProcessAs_TLB;
    rtExeLib:  Result := ProcessAs_EXE;
  end;
end;

function TIQWebRegSvr.ProcessAs_ActiveX: Boolean;
begin
  // Default method for registering or unregistering a DLL or OCX.

  LibHandle := LoadLibrary(PChar(FileName));
  if LibHandle = 0 then
     // 'Cannot load file, %s'
     raise Exception.CreateFmt(cRsc0000001, [FileName]);
  try
    @RegProc := GetProcAddress(LibHandle, ProcName[RegAction]);
    if @RegProc = Nil then
      // '%s procedure not found in %s'
      raise Exception.CreateFmt(cRsc0000006,
        [ProcName[RegAction], FileName]);
    if RegProc <> 0 then
      // 'Call to %s failed in %s'
      raise Exception.CreateFmt(cRsc0000007,
       [ProcName[RegAction], FileName]);
  finally
    FreeLibrary(LibHandle);
  end;

  // Pass successful result
  Result := True;

end;

function TIQWebRegSvr.ProcessAs_TLB: Boolean;
var
  WFileName, DocName: WideString;
  TypeLib: ITypeLib;
  LibAttr: PTLibAttr;
  DirBuffer: array[0..MAX_PATH] of char;
begin
  if ExtractFilePath(FileName) = '' then
     begin
       GetCurrentDirectory(SizeOf(DirBuffer), DirBuffer);
       FileName := '\' + FileName;
       FileName := DirBuffer + FileName;
     end;
  if not FileExists(FileName) then
    // 'Cannot find file, %s'
    raise Exception.CreateFmt(cRsc0000003, [FileName]);
  WFileName := FileName;

  OleCheck(LoadTypeLib(PWideChar(WFileName), TypeLib));
  OleCheck(TypeLib.GetLibAttr(LibAttr));

  try
    // Guid = GuidToString(LibAttr^.Guid)
    if RegAction = raReg then
    begin
      OleCheck(TypeLib.GetDocumentation(-1, nil, nil, nil, @DocName));
      DocName := ExtractFilePath(DocName);
      OleCheck(RegisterTypeLib(TypeLib, PWideChar(WFileName), PWideChar(DocName)));
    end
    else begin
      OleAutLib := GetModuleHandle('OLEAUT32.DLL');
      if OleAutLib <> 0 then
        @UnRegTlbProc := GetProcAddress(OleAutLib, 'UnRegisterTypeLib');
      if @UnRegTlbProc = nil then
         {'The version of OLEAUT32.DLL on this machine does not ' +
          'support type library unregistration.'}
         raise Exception.Create(cRsc0000004);
      with LibAttr^ do
        OleCheck(UnRegTlbProc(Guid, wMajorVerNum, wMinorVerNum, LCID, SysKind));
    end;

    // Pass successful result
    Result := True;

  finally
    TypeLib.ReleaseTLibAttr(LibAttr);
  end;
end;

function TIQWebRegSvr.ProcessAs_EXE: Boolean;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  ASuccess: BOOL;
begin
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);
  ASuccess := Win32Check(CreateProcess(PChar(FileName),
    PChar(FileName + ExeFlags[RegAction]),
    nil, nil, True, 0, nil, nil, SI, PI));
  CloseHandle(PI.hThread);
  CloseHandle(PI.hProcess);

  // Pass successful result
  Result := True;
end;

procedure TIQWebRegSvr.DetermineRegType;
var
   FileExt: String;
begin
  FileExt := UpperCase(ExtractFileExt(FileName));
  if FileExt = '' then
     // 'File, %s, must have a file extension.'
     raise Exception.CreateFmt(cRsc0000005, [FileName]);
  if CompareText(FileExt, '.TLB') = 0 then RegType := rtTypeLib
  else if CompareText(FileExt, '.EXE') = 0 then RegType := rtExeLib
  else RegType := rtAxLib;
end;

function TIQWebRegSvr.RegisterFile: Boolean;
begin
  // Set action type
  RegAction := raReg;
  // Execute
  Result := ProcessExec;
end;

function TIQWebRegSvr.UnRegisterFile: Boolean;
begin
  // Set action type
  RegAction := raUnreg;
  // Execute
  Result := ProcessExec;
end;

function TIQWebRegSvr.IsFileRegistered: Boolean;
begin
  if (FileName = '') or not FileExists(FileName) then
     // Cannot find file, %s
     raise Exception.CreateFmt(cRsc0000003, [FileName]);

  Result := GetModuleHandle(PChar(FileName + #0)) <> 0; // Windows.pas

end;

end.

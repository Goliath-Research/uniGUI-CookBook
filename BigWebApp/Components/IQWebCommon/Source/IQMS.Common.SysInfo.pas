unit IQMS.Common.SysInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, System.Variants,
  System.StrUtils,
  Winapi.ShellAPI, Vcl.Controls, WinSock, IQMS.Common.Registry;

function GetCPUIdentifier: string;
function GetCPUName: string;
function GetCPUSpeedStr: string;
function GetCPUSpeedMhz: Integer;

function GetIPAddress(var IPAddress: string): Boolean; overload;
function GetIPAddress: string; overload;
function GetMachineName: string;
function GetMachineUser: string;
function GetMachineLanguage: string;
function GetMachineTimeZone: string;
function GetMachineRAM: string;
function GetMachineRAMKb: Integer;
function GetMachineVirtualMem: Integer;
function GetWindowsVersion: string;
function GetMachineProcessor(var AProcessorCount: Integer): string;

function GetDiskSize(const ADrive: Char;
  var AFreeSize, ATotalSize: Real): Boolean;
function TotalDiskSizeOf(const ADrive: Char): Real;
function TotalDiskKBSizeOf(const ADrive: Char): Real;
function FreeDiskSizeOf(const ADrive: Char): Real;
function FreeDiskKBSizeOf(const ADrive: Char): Real;
function GetFirstCDROMDrive: Char;
function HasCDROMDrive: Boolean;

function IsWinSvr03: Boolean;
function IsWinXP: Boolean;
function IsWin2k: Boolean;
function IsWin98: Boolean;
function IsWin95: Boolean;
function IsWinMe: Boolean;
function IsWinNT4: Boolean;
function IsWin3X: Boolean;
function IsWinVista: Boolean;
function IsWin7: Boolean;
function IsWin7Up: Boolean;
function IsWinSvr2008R2: Boolean;
function IsWin8: Boolean;
function IsWinSvr2012: Boolean;
function IsWin10: Boolean;
function Is64Bit: Boolean;

function MajorVersion: Integer;
function MinorVersion: Integer;
function PlatformID: Integer;

function SystemFont: TFont;
function SystemFontName: string;

type
  // See:
  // https://msdn.microsoft.com/en-us/library/bb822049(v=vs.110).aspx
  TDotNetVersion = (Version1, Version11, Version2, Version3, Version35,
    Version4, Version45, Version451, Version452, Version46, Version461);

const
  DotNetVersionName: array [TDotNetVersion] of string = (
    '1',
    '1.1',
    '2',
    '3',
    '3.5',
    '4',
    '4.5',
    '4.5.1',
    '4.5.2',
    '4.6',
    '4.6.1'
    );

function NetFrameworkInstalled(AVersion: TDotNetVersion): Boolean;
function DotNetVersion: TDotNetVersion; deprecated 'This needs to be rewritten to use Registry unit, not IQMS.Common.Registry';

var
  GetProductInfo: function(dwOSMajorVersion, dwOSMinorVersion,
    dwSpMajorVersion, dwSpMinorVersion: DWORD;
    var pdwReturnedProductType: DWORD): BOOL stdcall = nil;

var
  GetNativeSystemInfo: function(var SysInfo: TSystemInfo): BOOL stdcall = nil;

implementation

uses
//  iqnumber,
  Registry;

function GetCPUIdentifier: string; // CPU description
begin
  Result := Trim(LoadStrFromLocalMachineRegistry
    ('\Hardware\Description\System\CentralProcessor\0', 'Identifier'));
end;

function GetCPUName: string; // CPU description
begin
  Result := Trim(LoadStrFromLocalMachineRegistry
    ('\Hardware\Description\System\CentralProcessor\0', 'ProcessorNameString'));
end;

function GetCPUSpeedStr: string;
begin
  Result := Format('%d Mhz', [GetCPUSpeedMhz]);
end;

function GetCPUSpeedMhz: Integer;
begin
  Result := 0;
  with TIQWebRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      if OpenKey('Hardware\Description\System\CentralProcessor\0', False) then
      begin
        Result := ReadInteger('~MHz');
        CloseKey;
      end;
    finally
      Free;
    end;
end;

function GetIPAddress: string;
begin
  GetIPAddress(Result);
end;

function GetIPAddress(var IPAddress: string): Boolean;
type
  TaPInAddr = array [0 .. 10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: PAnsiChar; // array[0..63] of Char;
  I: Integer;
  GInitData: TWSAData;
begin
  Result := False;
  IPAddress := '';
  Buffer := '';
  try
    WSAStartup($101, GInitData);
    GetHostName(Buffer, SizeOf(PAnsiChar));
    phe := GetHostByName(Buffer);
    if phe = nil then
      Exit;
    pptr := PaPInAddr(phe^.h_addr_list);
    I := 0;
    while pptr^[I] <> nil do
    begin
      IPAddress := inet_ntoa(pptr^[I]^);
      Inc(I);
    end;
    WSACleanup;
    Result := IPAddress > '';
  except
    Result := False;
  end;
end;

function GetMachineName: string;
var
  Buffer: array [0 .. MAX_COMPUTERNAME_LENGTH + 1] of Char;
  Size: Cardinal;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  GetComputerName(@Buffer, Size);
  Result := StrPas(Buffer);
end;

function GetMachineUser: string;
var
  iSize: DWORD;
  pC: PChar;
begin
  iSize := 250;
  GetMem(pC, iSize);
  GetUserName(pC, iSize);
  Result := StrPas(pC);
  FreeMem(pC);
end;

function GetMachineLanguage: string;
var
  iSize: DWORD;
  pC: PChar;
  I: Integer;
begin
  iSize := 250;
  GetMem(pC, iSize);
  I := GetSystemDefaultLangID;
  VerLanguageName(I, pC, iSize);
  Result := StrPas(pC);
  FreeMem(pC);
end;

function GetMachineTimeZone: string;
var
  iZoneInfo: TTimeZoneInformation;
begin
  GetTimeZoneInformation(iZoneInfo);
  Result := IfThen(iZoneInfo.DaylightName > '', iZoneInfo.DaylightName, iZoneInfo.StandardName);
end;

function GetMachineRAM: string;
var
  AValue: Integer;
begin
  AValue := GetMachineRAMKb;
  Result := FormatFloat('#,###', AValue) + ' KB RAM';
end;

function GetMachineRAMKb: Integer;
var
  iMemStatus: TMemoryStatus;
begin
  iMemStatus.dwLength := SizeOf(iMemStatus);
  GlobalmemoryStatus(iMemStatus);
  Result := iMemStatus.dwTotalPhys div 1024;
end;

function GetMachineVirtualMem: Integer;
var
  iSysInf: TSystemInfo;
begin
  // Virtual Memory in KB
  GetSystemInfo(iSysInf);
  Result := Trunc(iSysInf.dwAllocationGranularity / 1024);
end;

function GetWindowsVersion: string;
var
  AVersion, APlatform: string;
begin
  APlatform := 'Unknown Platform';
  AVersion := Format('%d.%d.%d', [Win32MajorVersion,
    Win32MinorVersion, Win32BuildNumber]);
  case Win32Platform of
    VER_PLATFORM_WIN32s:
      APlatform := 'Windows 3.1';
    VER_PLATFORM_WIN32_WINDOWS:
      APlatform := 'Windows 95/98';
    VER_PLATFORM_WIN32_NT:
      APlatform := 'Windows NT/2000/XP';
  end;
  Result := Trim(APlatform + ' ' + AVersion);
end;

function GetMachineProcessor(var AProcessorCount: Integer): string;
var
  iSysInf: TSystemInfo;
  S: string;
begin
  GetSystemInfo(iSysInf);
  if iSysInf.wProcessorArchitecture = 0 then
  begin
    case iSysInf.wProcessorLevel of
      0 .. 2:
        S := 'Unsupported';
      3:
        S := 'Intel 80386';
      4:
        S := 'Intel 80486';
      5:
        S := 'Intel Pentium';
      6:
        begin
          case HIBYTE(iSysInf.wProcessorRevision) of
            1:
              S := 'Intel Pentium Pro';
            3, 5:
              S := 'Intel Pentium II';
            7, 8, 10, 11:
              S := 'Intel Pentium III';
          else
            S := 'Intel Pentium Class';
          end; // end case
        end;
      15:
        S := 'Intel Pentium IV';
    else
      S := 'Intel Pentium Class';
    end;

    Result := Format('%s (%d)', [S, iSysInf.dwProcessorType]);
    AProcessorCount := iSysInf.dwNumberOfProcessors;
  end;
end;

function GetDiskSize(const ADrive: Char;
  var AFreeSize, ATotalSize: Real): Boolean;
var
  RootPath: array [0 .. 4] of Char;
  RootPtr: PChar;
  ACurDir: string;
  AFree64, ATotal64: Int64;
begin
  try
    RootPath[0] := ADrive;
    RootPath[1] := ':';
    RootPath[2] := '\';
    RootPath[3] := #0;
    RootPtr := RootPath;
    ACurDir := GetCurrentDir;
    if SetCurrentDir(ADrive + ':\') then
    begin
      GetDiskFreeSpaceEx(RootPtr, AFree64, ATotal64, nil);
      AFreeSize := AFree64;
      ATotalSize := ATotal64;
      // this to turn back to original dir
      SetCurrentDir(ACurDir);
      Result := True;
    end
    else
    begin
      Result := False;
      AFreeSize := 0;
      ATotalSize := 0;
    end;
  except // suppress
  end;
end;

function TotalDiskSizeOf(const ADrive: Char): Real;
var
  AFreeSize, ATotalSize: Real;
begin
  Result := 0;
  if GetDiskSize(ADrive, AFreeSize, ATotalSize) then
    Result := ATotalSize;
end;

function TotalDiskKBSizeOf(const ADrive: Char): Real;
//var
//  AFreeSize, ATotalSize: Real;
begin
  Result := 0;
//  if GetDiskSize(ADrive, AFreeSize, ATotalSize) then
//    Result := iqnumber.DtoF(ATotalSize / 1024);
end;

function FreeDiskSizeOf(const ADrive: Char): Real;
var
  AFreeSize, ATotalSize: Real;
begin
  Result := 0;
  if GetDiskSize(ADrive, AFreeSize, ATotalSize) then
    Result := AFreeSize;
end;

function FreeDiskKBSizeOf(const ADrive: Char): Real;
//var
//  AFreeSize, ATotalSize: Real;
begin
  Result := 0;
//  if GetDiskSize(ADrive, AFreeSize, ATotalSize) then
//    Result := iqnumber.DtoF(AFreeSize / 1024);
end;

function GetFirstCDROMDrive: Char;
var
  ADriveMap, AMask: DWORD;
  I: Integer;
  ARoot: string;
begin
  Result := #0;
  ARoot := 'A:\';
  ADriveMap := GetLogicalDrives;
  AMask := 1;
  for I := 1 to 32 do
  begin
    if (AMask and ADriveMap) <> 0 then
      if GetDriveType(PChar(ARoot)) = DRIVE_CDROM then
      begin
        Result := ARoot[1];
        Break;
      end;
    AMask := AMask shl 1;
    Inc(ARoot[1]);
  end;
end;

function HasCDROMDrive: Boolean;
begin
  Result := Trim(GetFirstCDROMDrive) > '';
end;

function GetOSInfo(var AMajor, AMinor, APlatform, AProductType,
  AArchitecture: Integer;
  var ADescription: string): Boolean;
const
  PRODUCT_PROFESSIONAL_WMC = $00000067; {Professional with Media Center}
var
  NTBres, BRes: Boolean;
  OSVI: TOSVERSIONINFO;
  OSVI_NT: TOSVERSIONINFOEX;
  tmpStr: string;
  pdwReturnedProductType: DWORD;
  SI: TSystemInfo;
begin
  Result := False;
  AMajor := 0;
  AMinor := 0;
  APlatform := 0;
  AProductType := 0;
  AArchitecture := 0;
  ADescription := '';

  NTBres := False;
  try
    OSVI_NT.dwOSVersionInfoSize := SizeOf(TOSVERSIONINFOEX);
    NTBres := GetVersionEx(OSVI_NT);
    OSVI.dwOSVersionInfoSize := SizeOf(TOSVERSIONINFO);
    BRes := GetVersionEx(OSVI);
  except
    OSVI.dwOSVersionInfoSize := SizeOf(TOSVERSIONINFO);
    BRes := GetVersionEx(OSVI);
  end;
  if (not BRes) and (not NTBres) then
    Exit;
  Move(OSVI, OSVI_NT, SizeOf(TOSVERSIONINFO));

  if Assigned(GetNativeSystemInfo) then
    GetNativeSystemInfo(SI)
  else
    GetSystemInfo(SI);

  AMajor := OSVI_NT.dwMajorVersion;
  AMinor := OSVI_NT.dwMinorVersion;
  APlatform := OSVI_NT.dwPlatformId;
  AProductType := OSVI_NT.wProductType;
  AArchitecture := SI.wProcessorArchitecture;

  {  ( weWinXPHome, weWinXPPro, weWinXPHomeN, weWinXPProN, weWinXPHomeK,
    weWinXPProK, weWinXPHomeKN, weWinXPProKN, weWinXPStarter, weWinXPMediaCenter,
   weWinXPTablet, weWinVistaStarter, weWinVistaHomeBasic, weWinVistaHomeBasicN,
   weWinVistaHomePremium, weWinVistaBusiness, weWinVistaBusinessN,
   weWinVistaEnterprise, weWinVistaUltimate, weWin7Starter, weWin7HomeBasic,
   weWin7HomePremium, weWin7Professional, weWin7Enterprise, weWin7Ultimate); }

  case OSVI_NT.dwPlatformId of
    VER_PLATFORM_WIN32_NT:
      begin
        if OSVI_NT.dwMajorVersion <= 4 then
          ADescription := 'Windows NT ';
        if (OSVI_NT.dwMajorVersion = 5) then
        begin
          case OSVI_NT.dwMinorVersion of
            0:
              ADescription := 'Windows 2000 ';
            1:
              begin
                ADescription := 'Windows XP ';
                if (GetSystemMetrics(SM_MEDIACENTER) <> 0) then
                  ADescription := ADescription + 'Media Center';
              end;
            2:
              begin
                if (OSVI_NT.wProductType = VER_NT_WORKSTATION) and
                  (SI.wProcessorArchitecture = PROCESSOR_ARCHITECTURE_AMD64)
                then
                  ADescription := 'Windows XP Professional x64 '
                else
                begin
                  if GetSystemMetrics(SM_SERVERR2) <> 0 then
                    ADescription := 'Windows Server 2003 R2'
                  else
                    ADescription := 'Windows Server 2003 ';
                end;
              end;
          end;
        end;
        if (OSVI_NT.dwMajorVersion = 6) then
        begin
          case OSVI_NT.dwMinorVersion of
            0:
              begin
                if OSVI_NT.wProductType = VER_NT_WORKSTATION then
                  ADescription := 'Windows Vista '
                else
                  ADescription := 'Windows Server 2008 ';
              end;
            1:
              begin
                if OSVI_NT.wProductType = VER_NT_WORKSTATION then
                  ADescription := 'Windows 7 '
                else
                  ADescription := 'Windows Server 2008 R2 ';
              end;
            2:
              begin
                if OSVI_NT.wProductType = VER_NT_WORKSTATION then
                  ADescription := 'Windows 8 '
                else
                  ADescription := 'Windows Server 2012 ';
              end;
          else
            ADescription := 'Unknown Windows version ';
          end;

          if Assigned(GetProductInfo) then
          begin
            GetProductInfo(OSVI_NT.dwMajorVersion,
              OSVI_NT.dwMinorVersion,
              0,
              0,
              pdwReturnedProductType);
            case pdwReturnedProductType of
              PRODUCT_PROFESSIONAL,
                PRODUCT_PROFESSIONAL_N:
                tmpStr := 'Professional';
              PRODUCT_PROFESSIONAL_WMC:
                tmpStr := 'Professional with Media Center';
              PRODUCT_BUSINESS,
                PRODUCT_BUSINESS_N:
                tmpStr := 'Business Edition';
              PRODUCT_CLUSTER_SERVER:
                tmpStr := 'Cluster Server Edition';
              PRODUCT_DATACENTER_SERVER:
                tmpStr := 'Server Datacenter Edition (full installation)';
              PRODUCT_DATACENTER_SERVER_CORE:
                tmpStr := 'Server Datacenter Edition (core installation)';
              PRODUCT_ENTERPRISE,
                PRODUCT_ENTERPRISE_N:
                tmpStr := 'Enterprise Edition';
              PRODUCT_ENTERPRISE_SERVER:
                tmpStr := 'Server Enterprise Edition (full installation)';
              PRODUCT_ENTERPRISE_SERVER_CORE:
                tmpStr := 'Server Enterprise Edition (core installation)';
              PRODUCT_ENTERPRISE_SERVER_IA64:
                tmpStr := 'Server Enterprise Edition for Itanium-based Systems';
              PRODUCT_HOME_BASIC,
                PRODUCT_HOME_BASIC_N:
                tmpStr := 'Home Basic Edition';
              PRODUCT_HOME_PREMIUM,
                PRODUCT_HOME_PREMIUM_N:
                tmpStr := 'Home Premium Edition';
              PRODUCT_HOME_PREMIUM_SERVER:
                tmpStr := 'Home Premium Server Edition';
              PRODUCT_HOME_SERVER:
                tmpStr := 'Home Server Edition';
              PRODUCT_HYPERV:
                tmpStr := 'Hyper-V Server Edition';
              PRODUCT_MEDIUMBUSINESS_SERVER_MANAGEMENT:
                tmpStr := 'Windows Essential Business Server Management Server Edition';
              PRODUCT_MEDIUMBUSINESS_SERVER_SECURITY:
                tmpStr := 'Windows Essential Business Server Security Server Edition';
              PRODUCT_MEDIUMBUSINESS_SERVER_MESSAGING:
                tmpStr := 'Windows Essential Business Server Messaging Server Edition';
              PRODUCT_SERVER_FOR_SMALLBUSINESS:
                tmpStr := 'Server for Small Business Edition';
              PRODUCT_SERVER_FOUNDATION:
                tmpStr := 'Server Foundation';
              PRODUCT_SMALLBUSINESS_SERVER:
                tmpStr := 'Small Business Server';
              PRODUCT_SMALLBUSINESS_SERVER_PREMIUM:
                tmpStr := 'Small Business Server Premium Edition';
              PRODUCT_STANDARD_SERVER:
                tmpStr := 'Server Standard Edition (full installation)';
              PRODUCT_STANDARD_SERVER_CORE:
                tmpStr := 'Server Standard Edition (core installation)';
              PRODUCT_STARTER:
                tmpStr := 'Starter Edition';
              PRODUCT_STORAGE_ENTERPRISE_SERVER:
                tmpStr := 'Storage Server Enterprise Edition';
              PRODUCT_STORAGE_EXPRESS_SERVER:
                tmpStr := 'Storage Server Express Edition';
              PRODUCT_STORAGE_STANDARD_SERVER:
                tmpStr := 'Storage Server Standard Edition';
              PRODUCT_STORAGE_WORKGROUP_SERVER:
                tmpStr := 'Storage Server Workgroup Edition';
              PRODUCT_UNDEFINED:
                tmpStr := 'An unknown product';
              PRODUCT_ULTIMATE,
                PRODUCT_ULTIMATE_N:
                tmpStr := 'Ultimate Edition';
              PRODUCT_WEB_SERVER:
                tmpStr := 'Web Server Edition';
              PRODUCT_WEB_SERVER_CORE:
                tmpStr := 'Web Server Edition (core installation)';
              PRODUCT_UNLICENSED:
                tmpStr := 'Unlicensed product'
            else
              tmpStr := '';
            end; { pdwReturnedProductType }
            ADescription := Trim(ADescription) + ' ' + Trim(tmpStr);
            NTBres := False;
          end; { GetProductInfo<>NIL }
        end; { Vista }

        if OSVI_NT.dwMajorVersion >= 6 then
        begin
          if Is64Bit or
            (SI.wProcessorArchitecture = PROCESSOR_ARCHITECTURE_AMD64) then
            ADescription := Trim(ADescription) + ' 64-bit'
          else if (SI.wProcessorArchitecture = PROCESSOR_ARCHITECTURE_INTEL)
          then
            ADescription := Trim(ADescription) + ' 32-bit';
        end;

        if NTBres then
        begin
          if OSVI_NT.wProductType = VER_NT_WORKSTATION then
          begin
            case OSVI_NT.wSuiteMask of
              512:
                ADescription := Trim(ADescription) + ' Personal';
              768:
                ADescription := Trim(ADescription) + ' Home Premium';
            else
              ADescription := Trim(ADescription) + ' Professional';
            end;
          end
          else if OSVI_NT.wProductType = VER_NT_SERVER then
          begin
            if OSVI_NT.wSuiteMask = VER_SUITE_DATACENTER then
              ADescription := Trim(ADescription) + ' DataCenter Server'
            else if OSVI_NT.wSuiteMask = VER_SUITE_ENTERPRISE then
              ADescription := Trim(ADescription) + ' Advanced Server'
            else
              ADescription := Trim(ADescription) + ' Server';
          end{ wProductType=VER_NT_WORKSTATION }
          else
          begin
            with TIQWebRegistry.Create do
              try
                RootKey := HKEY_LOCAL_MACHINE;
                if OpenKeyReadOnly('SYSTEM\CurrentControlSet\' +
                  'Control\ProductOptions') then
                  try
                    tmpStr := UpperCase(ReadString('ProductType'));
                    if tmpStr = 'WINNT' then
                      ADescription := Trim(ADescription) + ' Workstation';
                    if tmpStr = 'SERVERNT' then
                      ADescription := Trim(ADescription) + ' Server';
                  finally
                    CloseKey;
                  end;
              finally
                Free;
              end;
          end; { wProductType<>VER_NT_WORKSTATION }
        end; { NTBRes }
      end; { VER_PLATFORM_WIN32_NT }
    VER_PLATFORM_WIN32_WINDOWS:
      begin
        if (OSVI.dwMajorVersion = 4) and (OSVI.dwMinorVersion = 0) then
        begin
          ADescription := 'Windows 95 ';
          if OSVI.szCSDVersion[1] = 'C' then
            ADescription := Trim(ADescription) + ' OSR2';
        end;
        if (OSVI.dwMajorVersion = 4) and (OSVI.dwMinorVersion = 10) then
        begin
          ADescription := 'Windows 98 ';
          if OSVI.szCSDVersion[1] = 'A' then
            ADescription := Trim(ADescription) + ' SE';
        end;
        if (OSVI.dwMajorVersion = 4) and (OSVI.dwMinorVersion = 90) then
          ADescription := 'Windows Me';
      end; { VER_PLATFORM_WIN32_WINDOWS }
    VER_PLATFORM_WIN32s:
      ADescription := 'Microsoft Win32s';
  else
    ADescription := 'Unknown';
  end; { OSVI_NT.dwPlatformId }

  Result := (AMajor > 0) and (AMinor > 0) and (ADescription > '');

end; { GetOSInfo }

function IsWinVista: Boolean;
var
  AMajor, AMinor, APlatform, AProductType, AArchitecture: Integer;
  ADescription: string;
begin
  Result := False;
  if GetOSInfo(AMajor, AMinor, APlatform, AProductType, AArchitecture,
    ADescription) then
    Result := (APlatform = VER_PLATFORM_WIN32_NT) and (AMajor = 6) and
      (AMinor = 0) and (AProductType = VER_NT_WORKSTATION);
end;

function IsWin7: Boolean;
var
  AMajor, AMinor, APlatform, AProductType, AArchitecture: Integer;
  ADescription: string;
begin
  Result := False;
  if GetOSInfo(AMajor, AMinor, APlatform, AProductType, AArchitecture,
    ADescription) then
    Result := (APlatform = VER_PLATFORM_WIN32_NT) and
      (AProductType = VER_NT_WORKSTATION) and (AMajor = 6) and (AMinor = 1);
end;

function IsWin7Up: Boolean;
var
  AMajor, AMinor, APlatform, AProductType, AArchitecture: Integer;
  ADescription: string;
begin
  Result := False;
  if GetOSInfo(AMajor, AMinor, APlatform, AProductType, AArchitecture,
    ADescription) then
  begin
    // Basic check.
    Result := (APlatform = VER_PLATFORM_WIN32_NT) and
      (AProductType = VER_NT_WORKSTATION);
    // Check major version
    if Result then
      Result := (AMajor >= 6);
    // Check minor version
    if Result and (AMajor = 6) then
      Result := (AMinor >= 1);
  end;
end;

function IsWinSvr2008R2: Boolean;
var
  AMajor, AMinor, APlatform, AProductType, AArchitecture: Integer;
  ADescription: string;
begin
  Result := False;
  if GetOSInfo(AMajor, AMinor, APlatform, AProductType, AArchitecture,
    ADescription) then
    Result := (APlatform = VER_PLATFORM_WIN32_NT) and (AMajor = 6) and
      (AMinor = 1) and
      (AProductType <> VER_NT_WORKSTATION);
end;

function IsWin8: Boolean;
var
  AMajor, AMinor, APlatform, AProductType, AArchitecture: Integer;
  ADescription: string;
begin
  Result := False;
  // Note: Windows 8 minor version is 2. Windows 8.1 minor version is 3.
  if GetOSInfo(AMajor, AMinor, APlatform, AProductType, AArchitecture,
    ADescription) then
    Result := (APlatform = VER_PLATFORM_WIN32_NT) and
      (AProductType = VER_NT_WORKSTATION) and (AMajor = 6) and
      ((AMinor = 2) or (AMinor = 3));
end;

function IsWin10: Boolean;
var
  AMajor, AMinor, APlatform, AProductType, AArchitecture: Integer;
  ADescription: string;
begin
  Result := False;
  // Note:  At the time of this writing, Windows 10 did not have a minor version.
  // For documentation, see:
  // https://msdn.microsoft.com/en-us/library/windows/desktop/ms724832(v=vs.85).aspx
  if GetOSInfo(AMajor, AMinor, APlatform, AProductType, AArchitecture,
    ADescription) then
    Result := (APlatform = VER_PLATFORM_WIN32_NT) and
      (AProductType = VER_NT_WORKSTATION) and (AMajor = 10);
end;

function IsWinSvr2012: Boolean;
var
  AMajor, AMinor, APlatform, AProductType, AArchitecture: Integer;
  ADescription: string;
begin
  Result := False;
  if GetOSInfo(AMajor, AMinor, APlatform, AProductType, AArchitecture,
    ADescription) then
    Result := (APlatform = VER_PLATFORM_WIN32_NT) and (AMajor = 6) and
      (AMinor = 2) and
      (AProductType <> VER_NT_WORKSTATION);
end;

function IsWinSvr03: Boolean;
var
  AMajor, AMinor, APlatform, AProductType, AArchitecture: Integer;
  ADescription: string;
begin
  Result := False;
  if GetOSInfo(AMajor, AMinor, APlatform, AProductType, AArchitecture,
    ADescription) then
    Result := (APlatform = VER_PLATFORM_WIN32_NT) and (AMajor = 5) and
      (AMinor = 2) and
      (AProductType <> VER_NT_WORKSTATION) and
      (AArchitecture <> PROCESSOR_ARCHITECTURE_AMD64);
end;

function IsWinXP: Boolean;
var
  AMajor, AMinor, APlatform, AProductType, AArchitecture: Integer;
  ADescription: string;
begin
  Result := False;
  if GetOSInfo(AMajor, AMinor, APlatform, AProductType, AArchitecture,
    ADescription) then
    Result := (APlatform = VER_PLATFORM_WIN32_NT) and (AMajor = 5) and
      (AMinor in [1, 2]) and
      (AProductType = VER_NT_WORKSTATION) and
      (AArchitecture = PROCESSOR_ARCHITECTURE_AMD64);
end;

function IsWin2k: Boolean;
begin
  Result := (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion = 5)
    and (Win32MinorVersion = 0);
end;

function IsWinNT4: Boolean;
begin
  Result := Win32Platform = VER_PLATFORM_WIN32_NT;
  Result := Result and (Win32MajorVersion = 4);
end;

function IsWin3X: Boolean;
begin
  Result := Win32Platform = VER_PLATFORM_WIN32s;
  Result := Result and (Win32MajorVersion = 3) and
    ((Win32MinorVersion = 1) or (Win32MinorVersion = 5) or
    (Win32MinorVersion = 51));
end;

function IsWin98: Boolean;
begin
  Result := Win32Platform = VER_PLATFORM_WIN32_WINDOWS;
  Result := Result and (Win32MajorVersion = 4) and (Win32MinorVersion = 10);
end;

function IsWin95: Boolean;
begin
  Result := Win32Platform = VER_PLATFORM_WIN32_WINDOWS;
  Result := Result and (Win32MajorVersion = 4) and (Win32MinorVersion = 0);
end;

function IsWinMe: Boolean;
begin
  Result := Win32Platform = VER_PLATFORM_WIN32_WINDOWS;
  Result := Result and (Win32MajorVersion = 4) and (Win32MinorVersion = 90);
end;

function Is64Bit: Boolean;
// Type of IsWow64Process API fn
type
  TIsWow64Process = function(Handle: THandle; var Res: BOOL): BOOL; stdcall;
var
  IsWow64Result: BOOL; // result from IsWow64Process
  IsWow64Process: TIsWow64Process; // IsWow64Process fn reference
begin
  // Try to load required function from kernel32
  IsWow64Process := GetProcAddress(GetModuleHandle('kernel32'),
    'IsWow64Process');
  if Assigned(IsWow64Process) then
  begin
    // Function is implemented: call it
    if not IsWow64Process(GetCurrentProcess, IsWow64Result) then
      raise Exception.Create('Bad process handle');
    // Return result of function
    Result := IsWow64Result;
  end
  else
    // Function not implemented: can't be running on Wow64
    Result := False;
end;

function MajorVersion: Integer;
begin
  Result := Win32MajorVersion;
end;

function MinorVersion: Integer;
begin
  Result := Win32MinorVersion;
end;

function PlatformID: Integer;
begin
  Result := Win32Platform;
end;

function SystemFont: TFont;
var
  ALogFont: TLogFont;
begin
  Result := TFont.Create;

  if SystemParametersInfo(SPI_GETICONTITLELOGFONT, SizeOf(TLogFont),
    @ALogFont, 0) then
  begin
    Result.Height := ALogFont.lfHeight;
    Result.Orientation := ALogFont.lfOrientation;
    Result.Charset := TFontCharset(ALogFont.lfCharSet);
    Result.Name := PChar(@ALogFont.lfFaceName);
    Result.Style := [];

    if ALogFont.lfWeight >= FW_BOLD then
      Result.Style := Result.Style + [fsBold];

    if ALogFont.lfItalic = 1 then
      Result.Style := Result.Style + [fsItalic];

    if ALogFont.lfUnderline = 1 then
      Result.Style := Result.Style + [fsUnderline];

    if ALogFont.lfStrikeOut = 1 then
      Result.Style := Result.Style + [fsStrikeOut];

    case ALogFont.lfPitchAndFamily and $F of
      VARIABLE_PITCH:
        Result.Pitch := fpVariable;
      FIXED_PITCH:
        Result.Pitch := fpFixed;
    else
      Result.Pitch := fpDefault;
    end;
  end;
end;

function SystemFontName: string;
var
  ALogFont: TLogFont;
begin
  if SystemParametersInfo(SPI_GETICONTITLELOGFONT, SizeOf(TLogFont),
    @ALogFont, 0) then
    Result := PChar(@ALogFont.lfFaceName);
end;

function NetFrameworkInstalled(AVersion: TDotNetVersion): Boolean;
const
  NetFrameworkv1 = 'SOFTWARE\Microsoft\.NETFramework\policy\v1.0';
  NetFrameworkv1_1 = 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v1.1.4322';
  NetFrameworkv2 = 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727';
  NetFrameworkv3 = 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.0';
  NetFrameworkv3_5 = 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5';
  NetFrameworkv4 = 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4';
var
  APath: string;
  ARelease: UInt64;
begin
  case AVersion of
    TDotNetVersion.Version1:
      APath := 'SOFTWARE\Microsoft\.NETFramework\policy\v1.0';
    TDotNetVersion.Version11:
      APath := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v1.1.4322';
    TDotNetVersion.Version2:
      APath := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727';
    TDotNetVersion.Version3:
      APath := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.0';
    TDotNetVersion.Version35:
      APath := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5';
    TDotNetVersion.Version4:
      APath := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4';
    TDotNetVersion.Version45, TDotNetVersion.Version451,
      TDotNetVersion.Version452, TDotNetVersion.Version46,
      TDotNetVersion.Version461:
      APath := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full';
  end;

  try
    if (AVersion in [TDotNetVersion.Version1 .. TDotNetVersion.Version4]) then
      with TIQWebRegistry.CreateRO do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        Result := KeyExists(APath);
      finally
        Free;
      end
    else
      with TIQWebRegistry.CreateRO do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        Result := OpenKey(APath, False) and ValueExists('Release');
        if Result then
        begin
          // See https://msdn.microsoft.com/en-us/library/hh925568(v=vs.110).aspx#net_b
          ARelease := ReadInteger('Release');
          case AVersion of
            TDotNetVersion.Version45:
              Result := ARelease = 378389;
            TDotNetVersion.Version451:
              Result := (ARelease = 378675) or (ARelease = 378758);
            TDotNetVersion.Version452:
              Result := ARelease = 379893;
            TDotNetVersion.Version46:
              Result := (ARelease = 393295) or (ARelease = 393297);
            TDotNetVersion.Version461:
              Result := (ARelease = 394254) or (ARelease = 394271);
          else
            Result := False;
          end;
        end;
      finally
        Free;
      end;
  except
    // This kind of error will occur if user does not have rights
    // to read local machine.
    on ERegistryException do
      Result := False
    else
      raise;
  end;
end;

function DotNetVersion: TDotNetVersion;
var
  ADotNetVersion: TDotNetVersion;
begin
  Result := TDotNetVersion(0); // default
  for ADotNetVersion := high(TDotNetVersion) downto low(TDotNetVersion) do
    if NetFrameworkInstalled(ADotNetVersion) then
    begin
      Result := ADotNetVersion;
      Break;
    end;
end;

end.

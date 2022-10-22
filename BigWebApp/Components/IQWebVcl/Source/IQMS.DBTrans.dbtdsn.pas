unit IQMS.DBTrans.dbtdsn;

(* *****************************************************************************

  *** Component used to for working with DSN's ***


  This library unit contains methods for creating, removing, and
  otherwise working with Data Source Names (DSN's).  This is a
  shared unit, originally intended to be used by the IQDBTRANS
  system.  But since the methods and types declared in this unit are
  self-inclusive, it may be called in any application unit without
  hooking other IQDBTRANS units into it.


  *************************************************************************** *)

interface

uses
  Windows,
  SysUtils,
  Classes,
  IQMS.Common.Registry,
  Variants,
  StrUtils;

type
  { TDSNType }
  TDSNType = (dtNone, dtUser, dtSystem);

  { TDSNCargo }
{$IFDEF UNICODE}

  TDSNDescriptor = class
    DSN: AnsiString;
    DriverName: AnsiString;
    Driver: AnsiString;
    Description: AnsiString;
    FileName: AnsiString;
    DSNType: TDSNType;
    constructor Create(ADSN, ADriverName, ADriver, ADescription,
      AFileName: AnsiString; ADSNType: TDSNType);
  end;
{$ELSE}

  TDSNDescriptor = class
    DSN: string;
    DriverName: string;
    Driver: string;
    Description: string;
    FileName: string;
    DSNType: TDSNType;
    constructor Create(ADSN, ADriverName, ADriver, ADescription,
      AFileName: string; ADSNType: TDSNType);
  end;
{$ENDIF}


procedure GetDSNList(var List: TStringList); // includes TDSNDescriptor cargo
procedure GetSystemDSNNames(List: TStrings);

{$IFDEF UNICODE}
function CreateDSN(const ADriverName, AName, ADescription,
  ATarget: AnsiString): Boolean;
function RemoveDSN(ADSNName, ADriverName: AnsiString): Boolean;
function RemoveMSAccessDSN(ADSNName: AnsiString): Boolean;
function DSNType(ADSNName: AnsiString): TDSNType;
function DSNExists(ADSNName: AnsiString): Boolean;
function ODBCDriverExists(ADriver: AnsiString): Boolean;
{$ELSE}
function CreateDSN(const ADriverName, AName, ADescription,
  ATarget: string): Boolean;
function RemoveDSN(ADSNName, ADriverName: string): Boolean;
function RemoveMSAccessDSN(ADSNName: string): Boolean;
function DSNType(ADSNName: string): TDSNType;
function DSNExists(ADSNName: string): Boolean;
function ODBCDriverExists(ADriver: string): Boolean;
{$ENDIF}

// creates an alias for the given Microsoft Access database file name
function CreateMDBAlias(AliasName, AFileName: string): Boolean;
// Creates a Microsoft Access database
function CreateMSAccessMDB(AFileName: TFileName): Boolean;

type
  TSQLConfigDataSource = function(AHWNDParent: HWND; ARequest: Word;
    ADriver: LPCSTR; AAttributes: LPCSTR): Boolean; stdcall;

function SQLConfigDataSource(hwndParent: HWND; fRequest: Word;
  lpszDriver: LPCSTR; lpszAttributes: LPCSTR): BOOL; stdcall;
  external 'ODBCCP32.DLL';

const
  ODBC_ADD_DSN = 1; // Add data source
  ODBC_CONFIG_DSN = 2; // Configure (edit) data source
  ODBC_REMOVE_DSN = 3; // Remove data source
  ODBC_ADD_SYS_DSN = 4; // add a system DSN
  ODBC_CONFIG_SYS_DSN = 5; // Configure a system DSN
  ODBC_REMOVE_SYS_DSN = 6; // remove a system DSN

  // These are used for the temporary DSN
  MSACCESS_DRIVER = 'Microsoft Access Driver (*.mdb)';
  DSN_TEMP_NAME = 'IQMS_Temp_MSAccess';
  DSN_TEMP_DESCRIPTION = 'Temporary connection to Microsoft Access database.';

implementation

uses
  IQMS.DBTrans.dbtrscstr,
  IQMS.Common.Dialogs;

procedure GetDSNList(var List: TStringList);
const
  C_REGPATH_LOCALMACHINE_ODBC_INI = 'SOFTWARE\ODBC\ODBC.INI\';
  C_REGPATH_LOCALMACHINE_DATASOURCES =
    'SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources\';
  C_REGPATH_CURRENT_USER_ODBC_INI = 'Software\ODBC\ODBC.INI\';
  C_REGPATH_CURRENT_USER_DATASOURCES =
    'Software\ODBC\ODBC.INI\ODBC Data Sources\';
var
  sl: TStringList;
  i: Integer;
  ADSN, ADriverName, ADriver, ADescription, AFileName: string;
  ADSNType: TDSNType;
begin
  if not Assigned(List) then
    Exit;

  sl := TStringList.Create;
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKeyReadOnly(C_REGPATH_LOCALMACHINE_DATASOURCES) then
          begin
            GetValueNames(sl);
            for i := 0 to sl.Count - 1 do
              begin
                ADSN := sl.Strings[i];
                ADriverName := ReadString(ADSN);
                ADSNType := dtSystem;
                ADriver := '';
                ADescription := '';
                AFileName := '';
                List.AddObject(ADSN, TDSNDescriptor.Create(ADSN, ADriverName,
                  ADriver, ADescription, AFileName, ADSNType));
              end;
            CloseKey;
          end;

        for i := 0 to List.Count - 1 do
          begin
            ADSN := List.Strings[i];
            if OpenKeyReadOnly(C_REGPATH_LOCALMACHINE_ODBC_INI + ADSN) then
              begin
                ADriver := ReadString('Driver');
                ADescription := ReadString('Description');
                AFileName := ReadString('DBQ');
                TDSNDescriptor(List.Objects[i]).Driver := ADriver;
                TDSNDescriptor(List.Objects[i]).Description := ADescription;
                TDSNDescriptor(List.Objects[i]).FileName := AFileName;
                CloseKey;
              end;
          end;

        RootKey := HKEY_CURRENT_USER;
        if OpenKeyReadOnly(C_REGPATH_CURRENT_USER_DATASOURCES) then
          begin
            GetValueNames(sl);
            for i := 0 to sl.Count - 1 do
              begin
                ADSN := sl.Strings[i];
                ADriverName := ReadString(ADSN);
                ADSNType := dtUser;
                ADriver := '';
                ADescription := '';
                AFileName := '';
                List.AddObject(ADSN, TDSNDescriptor.Create(ADSN, ADriverName,
                  ADriver, ADescription, AFileName, ADSNType));
              end;
            CloseKey;
          end;

        for i := 0 to List.Count - 1 do
          begin
            ADSN := List.Strings[i];
            if OpenKeyReadOnly(C_REGPATH_CURRENT_USER_ODBC_INI + ADSN) then
              begin
                ADriver := ReadString('Driver');
                ADescription := ReadString('Description');
                AFileName := ReadString('DBQ');
                TDSNDescriptor(List.Objects[i]).Driver := ADriver;
                TDSNDescriptor(List.Objects[i]).Description := ADescription;
                TDSNDescriptor(List.Objects[i]).FileName := AFileName;
                CloseKey;
              end;
          end;

      finally
        Free;
      end;
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

procedure GetSystemDSNNames(List: TStrings);
const
  C_REGPATH_LOCALMACHINE = 'SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources';
  C_REGPATH_CURRENT_USER = 'Software\ODBC\ODBC.INI\ODBC Data Sources';
var
  sl: TStringList;
begin
  try
    sl := TStringList.Create;
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(C_REGPATH_LOCALMACHINE, False) then
          begin
            GetValueNames(sl);
            List.AddStrings(sl);
            CloseKey;
          end;
        sl.Clear;
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(C_REGPATH_CURRENT_USER, False) then
          begin
            GetValueNames(sl);
            List.AddStrings(sl);
            CloseKey;
          end;
      finally
        Free;
      end;
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

function CreateDSN;
var
  AProcAddress: TSQLConfigDataSource;
  ALibrary: LongWord;
{$IFDEF UNICODE}
  AAttributes: AnsiString;
  ADSNFileName: AnsiString;
{$ELSE}
  AAttributes: string;
  ADSNFileName: string;
{$ENDIF}
  ASearchRec: TSearchRec;
begin
  Result := False; // initialize result value

  // Load the ODBC library
  ALibrary := LoadLibrary('ODBCCP32'); // load from default path
  if (ALibrary <> NULL) then
    begin
      @AProcAddress := GetProcAddress(ALibrary, 'SQLConfigDataSource');

      if (@AProcAddress <> nil) then
        begin
          // Verify DSN created.
          AAttributes :=
            Format('DSN=%s'#0'Server=%s'#0'Exclusive=0'#0'Description=%s '#0#0,
            [AName, ATarget, ADescription]);
          Result := AProcAddress(0, ODBC_ADD_SYS_DSN, @ADriverName[1],
            @AAttributes[1]);

          if (Result = False) then
            begin
              // 'Could not create ODBC Datasource (DSN).'
              IQError(cTXT0000135);
              SysUtils.Abort;
            end;
        end;

      FreeLibrary(ALibrary); // free the library, we are done with it.

    end
  else
    Result := False;
end;

function RemoveMSAccessDSN;
begin
  Result := RemoveDSN(ADSNName, MSACCESS_DRIVER);
end;

function RemoveDSN;
var
{$IFDEF UNICODE}
  Attributes: AnsiString;
{$ELSE}
  Attributes: string;
{$ENDIF}
  Request: Integer;
begin
  Result := False;
  Attributes := 'DSN=' + ADSNName + #0#0;
  case DSNType(ADSNName) of
    dtNone:
      Exit;
    dtUser:
      Request := ODBC_REMOVE_DSN;
    dtSystem:
      Request := ODBC_REMOVE_SYS_DSN;
  end;
{$IFDEF UNICODE}
  Result := SQLConfigDataSource(0, Request, PAnsiChar(ADriverName),
    PAnsiChar(Attributes));
{$ELSE}
  Result := SQLConfigDataSource(0, Request, PChar(ADriverName),
    PChar(Attributes));
{$ENDIF}
end;

function DSNExists;
begin
  Result := DSNType(ADSNName) <> dtNone;
end;

function DSNType;

{ Check if a user or system DSN exists.

  Returns:
  0 for does not exist
  1 for user DSN
  2 for system DSN

  Only check registry list.
  Does not verify that it has been installed correctly }

var
  index: Integer;
  OdbcReg: TIQWebRegistry; // NTRegistry
  OdbcDsn: TStringList;
begin
  Result := dtNone;
  OdbcReg := TIQWebRegistry.Create;
  try
    // User DSNs
    OdbcReg.RootKey := HKEY_CURRENT_USER;
    if OdbcReg.OpenKeyReadOnly('Software\ODBC\ODBC.INI\ODBC Data Sources') then
      begin
        OdbcDsn := TStringList.Create;
        try
          OdbcReg.GetValueNames(OdbcDsn);
          for index := 0 to OdbcDsn.Count - 1 do // convert to uppercase
            OdbcDsn.Strings[index] := Uppercase(OdbcDsn.Strings[index]);
          if OdbcDsn.IndexOf(Uppercase(ADSNName)) >= 0 then // search unsorted
            Result := dtUser;
        finally
          FreeAndNil(OdbcDsn);
        end;
        OdbcReg.CloseKey;
      end;
    if Result = dtNone then
      begin
        // System DSNs
        OdbcReg.RootKey := HKEY_LOCAL_MACHINE;
        if OdbcReg.OpenKeyReadOnly
          ('SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources') then
          begin
            OdbcDsn := TStringList.Create;
            try
              OdbcReg.GetValueNames(OdbcDsn);
              for index := 0 to OdbcDsn.Count - 1 do // convert to uppercase
                OdbcDsn.Strings[index] := Uppercase(OdbcDsn.Strings[index]);
              if OdbcDsn.IndexOf(Uppercase(ADSNName)) >= 0 then
                // search unsorted
                Result := dtSystem;
            finally
              FreeAndNil(OdbcDsn);
            end;
            OdbcReg.CloseKey;
          end;
      end;
  finally
    FreeAndNil(OdbcReg);
  end;
end;

function ODBCDriverExists;
const
  cRegPath = '\SOFTWARE\ODBC\ODBCINST.INI\'; // HKEY_LOCAL_MACHINE
var
  ADriverPath: string;
begin
  // Example:  '\SOFTWARE\ODBC\ODBCINST.INI\Microsoft ODBC for Oracle'
  ADriverPath := cRegPath + ADriver;
  with TIQWebRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      Result := OpenKeyReadOnly(ADriverPath);
    finally
      Free;
    end;
end;

// create a ODBC Connection for a Microsoft Access database
function CreateMDBAlias;
var
  AProcAddress: TSQLConfigDataSource;
  ALibrary: LongWord;
  ASearchRec: TSearchRec;
{$IFDEF UNICODE}
  ADriverName: AnsiString;
  AAttributes: AnsiString;
  ADSNFileName: AnsiString;
{$ELSE}
  ADriverName: string;
  AAttributes: string;
  ADSNFileName: string;
{$ENDIF}
begin
  Result := False; // initialize result value

  // Load the ODBC library
  ALibrary := LoadLibrary('ODBCCP32'); // load from default path
  if (ALibrary <> NULL) then
    begin
      @AProcAddress := GetProcAddress(ALibrary, 'SQLConfigDataSource');

      if (@AProcAddress <> nil) then
        begin
          // Verify DSN created.
          ADriverName := MSACCESS_DRIVER;
          AAttributes :=
            Format('DSN=%s'#0'DBQ=%s'#0'Exclusive=0'#0'Description=%s '#0#0,
            [AliasName, AFileName, AliasName]);
          Result := AProcAddress(0, ODBC_ADD_SYS_DSN, @ADriverName[1],
            @AAttributes[1]);

          if (Result = False) then
            begin
              // 'Could not create ODBC Datasource (DSN).'
              IQError(cTXT0000135);
              SysUtils.Abort;
            end;
        end;

      FreeLibrary(ALibrary); // free the library, we are done with it.

    end
  else
    Result := False;
end;

function CreateMSAccessMDB(AFileName: TFileName): Boolean;
var
  AProcAddress: TSQLConfigDataSource;
  ALibrary: LongWord;
  ASearchRec: TSearchRec;

{$IFDEF UNICODE}
  ADriverName: AnsiString;
  AAttributes: AnsiString;
  ADSNFileName: AnsiString;
{$ELSE}
  ADriverName: string;
  AAttributes: string;
  ADSNFileName: string;
{$ENDIF}
begin
  Result := False; // initialize result value

  // Load the ODBC library
  ALibrary := LoadLibrary('ODBCCP32'); // load from default path
  if (ALibrary <> NULL) then
    begin
      @AProcAddress := GetProcAddress(ALibrary, 'SQLConfigDataSource');

      if (@AProcAddress <> nil) then
        begin
          // Verify DSN created.  We use the ODBC driver to create the
          // MDB file.
          ADriverName := MSACCESS_DRIVER;
          AAttributes :=
            Format('DSN=%s'#0'DBQ=%s'#0'Exclusive=0'#0'Description=%s'#0#0,
            [DSN_TEMP_NAME, AFileName, DSN_TEMP_DESCRIPTION]);
          Result := AProcAddress(0, ODBC_ADD_SYS_DSN, @ADriverName[1],
            @AAttributes[1]);

          if not Result then
            // 'Could not create ODBC Datasource (DSN).'
            raise Exception.Create(cTXT0000149);

          // Now create the MDB file, using ODBC
          if (FindFirst(AFileName, 0, ASearchRec) <> 0) then
            begin
              ADriverName := MSACCESS_DRIVER;
              AAttributes :=
                Format('DSN=%s'#0'DBQ=%s'#0'Exclusive=0'#0'Description= %s'#0 +
                'CREATE_DB="%s"'#0#0, [DSN_TEMP_NAME, AFileName,
                DSN_TEMP_DESCRIPTION, AFileName]);

              Result := AProcAddress(0, ODBC_CONFIG_SYS_DSN, @ADriverName[1],
                @AAttributes[1]);

              if not Result then
                // 'Could not create Microsoft Access Database:'
                raise Exception.CreateFmt('%s:'#13#13'%s',
                  [cTXT0000150, AFileName]);

            end;

          FindClose(ASearchRec);

          RemoveMSAccessDSN(DSN_TEMP_NAME);

        end;

      FreeLibrary(ALibrary); // free the library, we are done with it.

    end
  else
    Result := False
end;

{ TDSNDescriptor }

constructor TDSNDescriptor.Create;
begin
  DSN := ADSN;
  DriverName := ADriverName;
  Driver := ADriver;
  Description := ADescription;
  FileName := AFileName;
  DSNType := ADSNType;
end;

end.

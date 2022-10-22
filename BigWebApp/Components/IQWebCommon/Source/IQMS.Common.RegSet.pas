unit IQMS.Common.RegSet;

interface

uses
  Winapi.Windows, System.SysUtils,
  Registry, IQMS.Common.Registry;

{$REGION 'Current User (HKEY_CURRENT_USER) Methods'}

// Boolean settings
procedure WriteSetting_Bool(APath, ASettingName: String; AValue: Boolean);
function ReadSetting_Bool(APath, ASettingName: String;
  ADefaultValue: Boolean = TRUE): Boolean;

// Integer settings
procedure WriteSetting_Int(APath, ASettingName: String; AValue: Integer);
function ReadSetting_Int(APath, ASettingName: String;
  ADefaultValue: Integer): Integer;

// Floating point value settings
procedure WriteSetting_Float(APath, ASettingName: String; AValue: Real);
function ReadSetting_Float(APath, ASettingName: String;
  ADefaultValue: Real): Real;

// String/text settings
procedure WriteSetting_String(APath, ASettingName: String; AValue: String);
function ReadSetting_String(APath, ASettingName: String;
  ADefaultValue: String): String;

// Date/time settings
procedure WriteSetting_DateTime(APath, ASettingName: String; AValue: TDateTime);
function ReadSetting_DateTime(APath, ASettingName: String;
  ADefaultValue: TDateTime): TDateTime;

{$ENDREGION 'Current User (HKEY_CURRENT_USER) Methods'}

{$REGION 'Local Machine(HKEY_LOCAL_MACHINE) Methods'}

// Boolean settings
procedure WriteSetting_Bool2(APath, ASettingName: String; AValue: Boolean);
function ReadSetting_Bool2(APath, ASettingName: String;
  ADefaultValue: Boolean = TRUE): Boolean;

// Integer settings
procedure WriteSetting_Int2(APath, ASettingName: String; AValue: Integer);
function ReadSetting_Int2(APath, ASettingName: String;
  ADefaultValue: Integer): Integer;

// Floating point value settings
procedure WriteSetting_Float2(APath, ASettingName: String; AValue: Real);
function ReadSetting_Float2(APath, ASettingName: String;
  ADefaultValue: Real): Real;

// String/text settings
procedure WriteSetting_String2(APath, ASettingName: String; AValue: String);
function ReadSetting_String2(APath, ASettingName: String;
  ADefaultValue: String): String;

// Date/time settings
procedure WriteSetting_DateTime2(APath, ASettingName: String;
  AValue: TDateTime);
function ReadSetting_DateTime2(APath, ASettingName: String;
  ADefaultValue: TDateTime): TDateTime;

{$ENDREGION 'Local Machine(HKEY_LOCAL_MACHINE) Methods'}

implementation

uses
  IQMS.Common.Dialogs;

{$REGION 'Internal Methods'}

resourcestring
  cTXT0000298982 = 'Error reading setting for %s:'#13#13'%s';
  cTXT0000298983 = 'Error writing setting for %s:'#13#13'%s';

procedure RaiseSettingReadError(E: Exception; ASettingName: string);
begin
  // cTXT0000298982 = 'Error reading setting for %s:'#13#13'%s'
  IQError(Format(cTXT0000298982, [ASettingName, E.Message]));
end;

procedure RaiseSettingWriteError(E: Exception; ASettingName: string);
begin
  // For now, ignore access rights errors.
  if not E.ClassNameIs('ERegistryException') then
    // cTXT0000298982 = 'Error writing setting for %s:'#13#13'%s'
    IQError(Format(cTXT0000298983, [ASettingName, E.Message]));
end;

{$ENDREGION 'Internal Methods'}

{$REGION 'Current User (HKEY_CURRENT_USER) Implementation'}

function ReadSetting_Bool(APath, ASettingName: String;
  ADefaultValue: Boolean): Boolean;
begin
  Result := ADefaultValue;
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(APath, TRUE) then
          begin
            if ValueExists(ASettingName) then
              Result := ReadBool(ASettingName)
            else // The setting has not been created, so create it and apply the default
              WriteBool(ASettingName, ADefaultValue);
          end;
      finally
        Free;
      end;
  except
    on E: Exception do
      begin
        Result := ADefaultValue;
        RaiseSettingReadError(E, ASettingName);
      end;
  end;
end;

procedure WriteSetting_Bool(APath, ASettingName: String;
  AValue: Boolean);
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(APath, TRUE) then
          WriteBool(ASettingName, AValue);
      finally
        Free;
      end;
  except
    on E: Exception do
      RaiseSettingWriteError(E, ASettingName);
  end;
end;

function ReadSetting_Int(APath, ASettingName: String;
  ADefaultValue: Integer): Integer;
var
  s: String;
begin
  Result := ADefaultValue;
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(APath, TRUE) then
          begin
            if ValueExists(ASettingName) then
              begin
                s := ReadString(ASettingName);
                System.SysUtils.TryStrToInt(s, Result);
              end
            else // The setting has not been created, so create it and apply the default
              WriteInteger(ASettingName, ADefaultValue);
          end;
      finally
        Free;
      end;
  except
    on E: Exception do
      begin
        Result := ADefaultValue;
        RaiseSettingReadError(E, ASettingName);
      end;
  end;
end;

procedure WriteSetting_Int(APath, ASettingName: String;
  AValue: Integer);
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(APath, TRUE) then
          WriteInteger(ASettingName, AValue);
      finally
        Free;
      end;
  except
    on E: Exception do
      RaiseSettingWriteError(E, ASettingName);
  end;
end;

function ReadSetting_Float(APath, ASettingName: String;
  ADefaultValue: Real): Real;
var
  s: String;
  r: Double;
begin
  Result := ADefaultValue;
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(APath, TRUE) then
          begin
            if ValueExists(ASettingName) then
              begin
                s := ReadString(ASettingName);
                if System.SysUtils.TryStrToFloat(s, r) then
                  Result := r
                else
                  Result := ADefaultValue;
              end
            else // The setting has not been created, so create it and apply the default
              WriteFloat(ASettingName, ADefaultValue);
          end;
      finally
        Free;
      end;
  except
    on E: Exception do
      begin
        Result := ADefaultValue;
        RaiseSettingReadError(E, ASettingName);
      end;
  end;
end;

procedure WriteSetting_Float(APath, ASettingName: String;
  AValue: Real);
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(APath, TRUE) then
          WriteFloat(ASettingName, AValue);
      finally
        Free;
      end;
  except
    on E: Exception do
      RaiseSettingWriteError(E, ASettingName);
  end;
end;

function ReadSetting_String(APath, ASettingName,
  ADefaultValue: String): String;
begin
  Result := ADefaultValue;
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(APath, TRUE) then
          begin
            if ValueExists(ASettingName) then
              Result := ReadString(ASettingName)
            else // The setting has not been created, so create it and apply the default
              WriteString(ASettingName, ADefaultValue);
          end;
      finally
        Free;
      end;
  except
    on E: Exception do
      begin
        Result := ADefaultValue;
        RaiseSettingReadError(E, ASettingName);
      end;
  end;
end;

procedure WriteSetting_String(APath, ASettingName, AValue: String);
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(APath, TRUE) then
          WriteString(ASettingName, AValue);
      finally
        Free;
      end;
  except
    on E: Exception do
      RaiseSettingWriteError(E, ASettingName);
  end;
end;

function ReadSetting_DateTime(APath, ASettingName: String;
  ADefaultValue: TDateTime): TDateTime;
begin
  Result := ADefaultValue;
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(APath, TRUE) then
          begin
            if ValueExists(ASettingName) then
              Result := ReadDateTime(ASettingName)
            else // The setting has not been created, so create it and apply the default
              WriteDateTime(ASettingName, ADefaultValue);
          end;
      finally
        Free;
      end;
  except
    on E: Exception do
      begin
        Result := ADefaultValue;
        RaiseSettingReadError(E, ASettingName);
      end;
  end;
end;

procedure WriteSetting_DateTime(APath, ASettingName: String;
  AValue: TDateTime);
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        if OpenKey(APath, TRUE) then
          WriteDateTime(ASettingName, AValue);
      finally
        Free;
      end;
  except
    on E: Exception do
      RaiseSettingWriteError(E, ASettingName);
  end;
end;

{$ENDREGION 'Current User (HKEY_CURRENT_USER) Implementation'}

{$REGION 'Local Machine (HKEY_LOCAL_MACHINE) Implementation'}

function ReadSetting_Bool2(APath, ASettingName: String;
  ADefaultValue: Boolean): Boolean;
begin
  Result := ADefaultValue;
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(APath, TRUE) then
          begin
            if ValueExists(ASettingName) then
              Result := ReadBool(ASettingName)
            else // The setting has not been created, so create it and apply the default
              WriteBool(ASettingName, ADefaultValue);
          end;
      finally
        Free;
      end;
  except
    on E: Exception do
      begin
        Result := ADefaultValue;
        RaiseSettingReadError(E, ASettingName);
      end;
  end;
end;

procedure WriteSetting_Bool2(APath, ASettingName: String;
  AValue: Boolean);
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(APath, TRUE) then
          WriteBool(ASettingName, AValue);
      finally
        Free;
      end;
  except
    on E: Exception do
      RaiseSettingWriteError(E, ASettingName);
  end;
end;

function ReadSetting_Int2(APath, ASettingName: String;
  ADefaultValue: Integer): Integer;
var
  s: String;
begin
  Result := ADefaultValue;
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(APath, TRUE) then
          begin
            if ValueExists(ASettingName) then
              begin
                s := ReadString(ASettingName);
                System.SysUtils.TryStrToInt(s, Result);
              end
            else // The setting has not been created, so create it and apply the default
              WriteInteger(ASettingName, ADefaultValue);
          end;
      finally
        Free;
      end;
  except
    on E: Exception do
      begin
        Result := ADefaultValue;
        RaiseSettingReadError(E, ASettingName);
      end;
  end;
end;

procedure WriteSetting_Int2(APath, ASettingName: String;
  AValue: Integer);
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(APath, TRUE) then
          WriteInteger(ASettingName, AValue);
      finally
        Free;
      end;
  except
    on E: Exception do
      RaiseSettingWriteError(E, ASettingName);
  end;
end;

function ReadSetting_Float2(APath, ASettingName: String;
  ADefaultValue: Real): Real;
var
  s: String;
  r: Double;
begin
  Result := ADefaultValue;
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(APath, TRUE) then
          begin
            if ValueExists(ASettingName) then
              begin
                s := ReadString(ASettingName);
                if System.SysUtils.TryStrToFloat(s, r) then
                  Result := r
                else
                  Result := ADefaultValue;
              end
            else // The setting has not been created, so create it and apply the default
              WriteFloat(ASettingName, ADefaultValue);
          end;
      finally
        Free;
      end;
  except
    on E: Exception do
      begin
        Result := ADefaultValue;
        RaiseSettingReadError(E, ASettingName);
      end;
  end;
end;

procedure WriteSetting_Float2(APath, ASettingName: String;
  AValue: Real);
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(APath, TRUE) then
          WriteFloat(ASettingName, AValue);
      finally
        Free;
      end;
  except
    on E: Exception do
      RaiseSettingWriteError(E, ASettingName);
  end;
end;

function ReadSetting_String2(APath, ASettingName,
  ADefaultValue: String): String;
begin
  Result := ADefaultValue;
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(APath, TRUE) then
          begin
            if ValueExists(ASettingName) then
              Result := ReadString(ASettingName)
            else // The setting has not been created, so create it and apply the default
              WriteString(ASettingName, ADefaultValue);
          end;
      finally
        Free;
      end;
  except
    on E: Exception do
      begin
        Result := ADefaultValue;
        RaiseSettingReadError(E, ASettingName);
      end;
  end;
end;

procedure WriteSetting_String2(APath, ASettingName, AValue: String);
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(APath, TRUE) then
          WriteString(ASettingName, AValue);
      finally
        Free;
      end;
  except
    on E: Exception do
      RaiseSettingWriteError(E, ASettingName);
  end;
end;

function ReadSetting_DateTime2(APath, ASettingName: String;
  ADefaultValue: TDateTime): TDateTime;
begin
  Result := ADefaultValue;
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(APath, TRUE) then
          begin
            if ValueExists(ASettingName) then
              Result := ReadDateTime(ASettingName)
            else // The setting has not been created, so create it and apply the default
              WriteDateTime(ASettingName, ADefaultValue);
          end;
      finally
        Free;
      end;
  except
    on E: Exception do
      begin
        Result := ADefaultValue;
        RaiseSettingReadError(E, ASettingName);
      end;
  end;
end;

procedure WriteSetting_DateTime2(APath, ASettingName: String;
  AValue: TDateTime);
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_LOCAL_MACHINE;
        if OpenKey(APath, TRUE) then
          WriteDateTime(ASettingName, AValue);
      finally
        Free;
      end;
  except
    on E: Exception do
      RaiseSettingWriteError(E, ASettingName);
  end;
end;

{$ENDREGION 'Local Machine (HKEY_LOCAL_MACHINE) Implementation'}

end.

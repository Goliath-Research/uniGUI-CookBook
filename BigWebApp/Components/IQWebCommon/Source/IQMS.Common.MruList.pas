unit IQMS.Common.MruList;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, uniGUIForm, // Vcl.Forms,
  IQMS.Common.Registry, Vcl.StdCtrls,uniComboBox;

(* **               Most Recently Used (MRU) List              ***
  *
  * This unit handles saving and getting a "Most Recently Used" list.
  * This can be file names, search text, or anything users might want to
  * select again from a combo box (or any list).
  *
  * The KeyName is a sub-key in the Registry for the list.
  * The main path is as follows, with place holders as indicated:
  * 'HKEY_CURRENT_USER\Software\IQMS\IQWin32\{Application Exe Name}\{Form Name}\{AKeyName}'
*)

(* How to Use with a combo box:
  If you are using a combo box list, call SaveMRUList in OnExit and
  call GetMRUList in OnDropDown or OnBeforeDropDown.
*)

{ SaveMRUList():  Saves a list to the Registry

  Values IN:

  AOwnerForm = The form under which a Registry key will be created
  AKeyName = Registry sub-key for the list
  AMaxHistoryCount = Maximum number of entries to be maintained
  AItems = The TStringList items to be saved
}
procedure SaveMRUList(APath: string;
  const AMaxHistoryCount: Integer;
  const AItems: TStringList); overload;
procedure SaveMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  const AItems: TStringList); overload;
procedure SaveMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  const AItems: TStrings); overload;
procedure SaveMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  const AComboBox: TUniComboBox); overload;

{ GetMRUList():  Retrieves a list from the Registry

  Values IN:

  AOwnerForm = The form under which a Registry key has been created
  AKeyName = Registry sub-key for the list
  AMaxHistoryCount = Maximum number of entries to be retrieved
  AItems = The TStringList items to be filled
}
procedure GetMRUList(APath: string; const AMaxHistoryCount: Integer;
  var AItems: TStringList); overload;
procedure GetMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  var AItems: TStringList); overload;
procedure GetMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  var AItems: TStrings); overload;
procedure GetMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  var AComboBox: TUniComboBox); overload;

{ * Additional "Helper" methods * }

// Clears the list from the Registry
procedure ClearMRUList(APath: string); overload;
procedure ClearMRUList(AOwnerForm: TUniForm; const AKeyName: String); overload;

// Used internally to retrieve the Registry path
function GeTUniFormPath(AOwnerForm: TUniForm; const AKeyName: String): String;

implementation

const
  // The root Registry key where items are saved
  // Format strings (%s) represent EXE name, Form name, and sub-key
  cRegRoot = '\Software\IQMS\IQWin32\%s\%s\%s';

procedure GetMRUList(APath: string; const AMaxHistoryCount: Integer;
  var AItems: TStringList);
var
  AKey: String;
  i: Integer;
begin
  if (APath > '') and (AMaxHistoryCount > 0) and Assigned(AItems) then
    begin
      AItems.Clear;
      try
        with TIQWebRegistry.Create do
          try
            RootKey := HKEY_CURRENT_USER;
            if OpenKey(APath, FALSE) then
              for i := 1 to AMaxHistoryCount do
                begin
                  AKey := 'MRU' + IntToStr(i);
                  if (ValueExists(AKey)) and (ReadString(AKey) > ' ') then
                    AItems.Add(ReadString(AKey));
                end;
          finally
            Free;
          end;
      except // silent
      end;
    end;
end;

procedure GetMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  var AComboBox: TUniComboBox);
var
  AList: TStringList;
begin
  if Assigned(AComboBox) then
    begin
      AList := TStringList.Create;
      try
        GetMRUList(AOwnerForm, AKeyName, AMaxHistoryCount, AList);
        AComboBox.Items.Text := AList.Text;
      finally
        if Assigned(AList) then
          AList.Free;
      end;
    end;
end;

procedure GetMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  var AItems: TStrings);
var
  AList: TStringList;
begin
  if Assigned(AItems) then
    begin
      AList := TStringList.Create;
      try
        GetMRUList(AOwnerForm, AKeyName, AMaxHistoryCount, AList);
        AItems.Text := AList.Text;
      finally
        if Assigned(AList) then
          FreeAndNil(AList);
      end;
    end;
end;

procedure GetMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  var AItems: TStringList);
begin
  GetMRUList(GeTUniFormPath(AOwnerForm, AKeyName), AMaxHistoryCount, AItems);
end;

procedure ClearMRUList(APath: string); overload;
var
  AKey: String;
  i: Integer;
//  ARegKeyInfo: TRegKeyInfo;
begin
  try
    with TIQWebRegistry.Create do
      try
        RootKey := HKEY_CURRENT_USER;
        // Clear the old items from the Registry

        // TODO -oGabe -cIQRegistry: WEBIQ-365 Need to convert this to work with IQWebRegistry

//        if OpenKey(APath, TRUE) and GetKeyInfo(ARegKeyInfo) then
//          begin
//            // Scan all items under this key
//            for i := 1 to ARegKeyInfo.NumValues do
//              begin
//                AKey := 'MRU' + IntToStr(i);
//                if ValueExists(AKey) then
//                  DeleteValue(AKey);
//              end;
//          end;

      finally
        Free;
      end;
  except // silent
  end;
end;

procedure ClearMRUList(AOwnerForm: TUniForm; const AKeyName: String);
begin
  ClearMRUList(GeTUniFormPath(AOwnerForm, AKeyName));
end;

procedure SaveMRUList(APath: string;
  const AMaxHistoryCount: Integer;
  const AItems: TStringList); overload;
var
  AKey: String;
  AValue: String;
  i: Integer;
begin
  if Assigned(AItems) then
    begin
      ClearMRUList(APath); // clears Registry list of old items
      try
        with TIQWebRegistry.Create do
          try
            RootKey := HKEY_CURRENT_USER;
            if OpenKey(APath, TRUE) then
              // Create new list
              for i := 0 to AItems.Count - 1 do
                begin
                  if i = AMaxHistoryCount then
                    BREAK;
                  AKey := 'MRU' + IntToStr(i + 1);
                  AValue := Trim(AItems.Strings[i]);
                  if AValue > ' ' then
                    begin
                      WriteString(AKey, AValue);
                    end;
                end;
          finally
            Free;
          end;
      except // silent
      end;
    end;
end;

procedure SaveMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  const AComboBox: TUniComboBox);
var
  AList: TStringList;
  i: Integer;
begin
  if Assigned(AComboBox) then
    begin
      AList := TStringList.Create;
      try

        // Prevents duplicates
        AList.Sorted := TRUE;
        AList.Duplicates := dupIgnore;

        // Fill the list to save
        AList.Add(AComboBox.Text); // add the current text
        for i := 0 to AComboBox.Items.Count - 1 do
          AList.Add(AComboBox.Items.Strings[i]);

        // Save the list
        SaveMRUList(AOwnerForm, AKeyName, AMaxHistoryCount, AList);
      finally
        if Assigned(AList) then
          FreeAndNil(AList);
      end;
    end;
end;

procedure SaveMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  const AItems: TStrings);
var
  AList: TStringList;
begin
  if Assigned(AItems) then
    begin
      AList := TStringList.Create;
      try
        AList.Text := AItems.Text;
        SaveMRUList(AOwnerForm, AKeyName, AMaxHistoryCount, AList);
      finally
        if Assigned(AList) then
          FreeAndNil(AList);
      end;
    end;
end;

procedure SaveMRUList(AOwnerForm: TUniForm; const AKeyName: String;
  const AMaxHistoryCount: Integer;
  const AItems: TStringList);
begin
  SaveMRUList(GeTUniFormPath(AOwnerForm, AKeyName), AMaxHistoryCount, AItems);
end;

function GeTUniFormPath(AOwnerForm: TUniForm; const AKeyName: String): String;
begin
  // This method is used internally to retrieve the root Registry path
  // where MRU items are saved.
//  Result := Format(cRegRoot, [ExtractFileName(ExeName),
//    AOwnerForm.Name, AKeyName]);
end;

end.

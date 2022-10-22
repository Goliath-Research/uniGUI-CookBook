unit IQMS.Common.Version;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms,
  IQMS.Common.Registry, IQMS.WebVCL.About,   IQMS.Common.ProgressDialog,
  uniGUIForm,uniGUIApplication;

{ Example:
  //In the form's OnCreate() event call the following:
  NotifyIfVersionChanged( Self );
  // This will display a prompt to the user to reset the form.
  // After this completes, then the application will continue as usual

  // In the form's OnClose() event call the following:
  MemorizeVersion( Self );
  // This will save the version string to the Registry
}

var
  C_Version : string;

  // Primary methods
  /// <summary> If the form version has changed, prompt the user to reset
  /// the application Registry settings.  Call this method in FormCreate or
  // a constructor of the application main form.
  /// </summary>
function NotifyIfVersionChanged(AForm: TUniForm): Boolean; overload;
/// <summary> Store the form version in the Registry.  Call this method
/// in FormClose of the application main form.
procedure MemorizeVersion(AForm: TUniForm);

// Secondary methods
/// <summary> Get the last stored version for the form. </summary>
function RememberVersion(AForm: TUniForm): string;
/// <summary> Get the current version for the form. </summary>
function CurrentVersion(AForm: TUniForm): string;
/// <summary> Determine if the form version has changed since it was last
/// opened. </summary>
function VersionHasChanged(AForm: TUniForm): Boolean;
/// <summary> Delete the application Registry key. </summary>
procedure DeleteApplicationKey;

/// <summary> Get the version number from a change list string.  Parses
/// a change list string and returns the version number.
/// </summary>
/// <remarks> Method should be used by applications to pass in their specific
/// change list version.  Used by IQAbout and IQRF.
/// </remarks>
function GetIQVersion(AChangeListString: string): string;

type
  { TIQVersion }
  TIQWebVersion = class(TComponent)
  strict private
    { Private declarations }
    FSystemPath: string;
    FLocalHomePath: string;
     ProgressDlg: TIQWebProgressDialog;
    procedure InitProgressDialog(const AMax: Integer);
    function GetIQAbout(AForm: TUniForm): TIQWebAbout;
    procedure DeleteSchemaFiles;
    procedure ResetApplicationPicklists;
    procedure FindFiles(APath, AFileMask: String; var AFileList: TStringList);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CheckResetApplication: Boolean;
    function GetCurrentVersion: string;
    procedure DeleteApplicationKey;
    class function CurrentVersion(AOwner: TUniForm): string;
    class procedure MemorizeVersion(AOwner: TUniForm);
    class function RememberVersion(AOwner: TUniForm): string;
    class function VersionHasChanged(AOwner: TUniForm): Boolean;
  end;

implementation

uses
  IQMS.WebVCL.BuildVersion,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings;

function GetIQVersion(AChangeListString: string): string;
begin
  Result := StringReplace(AChangeListString, '$Change: ', '',
    [rfReplaceAll, rfIgnoreCase]);
  Result := Trim(StringReplace(Result, '$', '', [rfReplaceAll, rfIgnoreCase]));
end;

procedure MemorizeVersion(AForm: TUniForm);
begin
  TIQWebVersion.MemorizeVersion(AForm);
end;

function RememberVersion(AForm: TUniForm): string;
begin
  Result := TIQWebVersion.RememberVersion(AForm);
end;

function VersionHasChanged(AForm: TUniForm): Boolean;
begin
  Result := TIQWebVersion.VersionHasChanged(AForm);
end;

function NotifyIfVersionChanged(AForm: TUniForm): Boolean;
begin
  Result := False;
  with TIQWebVersion.Create(AForm) do
    try
      Result := CheckResetApplication;
    finally
      Free;
    end;
end;

function CurrentVersion(AForm: TUniForm): string;
begin
  Result := TIQWebVersion.CurrentVersion(AForm);
end;

procedure DeleteApplicationKey;
var
  APath: string;
begin
  with TIQWebVersion.Create(uniGUIApplication.UniApplication) do
    try
      DeleteApplicationKey;
    finally
      Free;
    end;
end;

{$REGION 'TIQVersion'}

{ TIQVersion }

constructor TIQWebVersion.Create(AOwner: TComponent);
var
  ASystemPath: array [0 .. MAX_PATH] of Char;
begin
  inherited Create(AOwner);

  // Get Winapi.Windows system directory
  GetSystemDirectory(ASystemPath, SizeOf(ASystemPath));
  FSystemPath := ASystemPath;
   FLocalHomePath := IQGetLocalHomePath;
end;

destructor TIQWebVersion.Destroy;
begin
  if Assigned(ProgressDlg) then
    FreeAndNil(ProgressDlg);
  inherited Destroy;
end;

function TIQWebVersion.GetIQAbout(AForm: TUniForm): TIQWebAbout;
var
  i: Integer;
begin
  Result := nil; // Initialize
  for i := 0 to AForm.ComponentCount - 1 do
    if AForm.Components[i].ClassType = TIQWebAbout then
      begin
        Result := AForm.Components[i] as TIQWebAbout;
        BREAK;
      end;
end;

class function TIQWebVersion.CurrentVersion(AOwner: TUniForm): string;
begin
  with Self.Create(AOwner) do
    try
      Result := GetCurrentVersion
    finally
      Free;
    end;
end;

function TIQWebVersion.GetCurrentVersion: string;
var
  AIQAbout: TIQWebAbout;
begin
  AIQAbout := GetIQAbout(TUniForm(Owner));
  if AIQAbout <> nil then
    Result := AIQAbout.Version
  else
    Result := '';
end;

class function TIQWebVersion.VersionHasChanged(AOwner: TUniForm): Boolean;
var
  AOldVersion, ACurrentVersion: string;
begin
  AOldVersion := RememberVersion(AOwner);
  ACurrentVersion := CurrentVersion(AOwner);
  Result := (AOldVersion > '') and
    (CompareText(AOldVersion, ACurrentVersion) <> 0)
end;

class function TIQWebVersion.RememberVersion(AOwner: TUniForm): string;
var
  AVersion: string;
begin
  IQRegStringScalarRead(AOwner, 'Version', AVersion);
  Result := AVersion;
end;

class procedure TIQWebVersion.MemorizeVersion(AOwner: TUniForm);
begin
  IQRegStringScalarWrite(AOwner, 'Version', CurrentVersion(AOwner));
end;

procedure TIQWebVersion.InitProgressDialog(const AMax: Integer);
begin
  if not Assigned(ProgressDlg) then
    begin
      // Create the Progress Dialog box
      // iqshare_rcstr.cTXT0000479 = 'Please wait while the application is reset.';
        ProgressDlg := hProgressDlg(AMax { Max Value } ,
          IQMS.Common.ResStrings.cTXT0000479 { Status Text } );

      // IQMS.Common.ResourceStrings.cTXT0000481 = 'You Have A New Version!'
      ProgressDlg.Caption := IQMS.Common.ResStrings.cTXT0000481;

      // IQMS.Common.ResourceStrings.cTXT0000480 =
      // 'Please wait, this will not take long...';
      ProgressDlg.Status2 := IQMS.Common.ResStrings.cTXT0000480;
    end;
end;

function TIQWebVersion.CheckResetApplication: Boolean;
var
  AAutoReset: Boolean;
  AMax: Integer;
begin
  // Initialization
  Result := False;
  AAutoReset := False;

  // 03/26/2012
  try
    AAutoReset := SelectValueAsString(
      'SELECT auto_reg_reset FROM params WHERE ROWNUM < 2') = 'Y';
  except
    AAutoReset := False;
  end;

  if VersionHasChanged(TUniForm(Owner)) then
    begin
      // Get the function result, which indicates whether or not the
      // application will be reset.  If True, then the application
      // will be reset.  If False, exit early; nothing will occur.
      if AAutoReset then
        Result := True
      else
        { 'The version has changed.  It is recommended that your ' +
          'personal settings now be cleared to improve performance.  ' +
          'Clicking the "Yes" button will restore settings to the default values.  ' +
          'This will not affect other users or interfere with security.'#13#13 +
          'Do you want to reset now?' }
         Result := IQConfirmYN(IQMS.Common.ResStrings.cTXT0000180);
//        Result:= FALSE;

      // Initialize the max progress.  If adding steps, increment the
      // value.  This value also includes progress within the methods
      // below.
      AMax := 9;
      if Result then
        begin
          // Create the Progress Dialog box
          InitProgressDialog(AMax);
          try
            // IQMS.Common.ResourceStrings.cTXT0000480 =
            // 'This will only take a moment ...';
            ProgressDlg.Status2 := IQMS.Common.ResStrings.cTXT0000480;
            IQMS.Common.Miscellaneous.Delay(100);

            // 1
            DeleteApplicationKey;
            ProgressDlg.StepProgress;
            ProgressDlg.CancelBtnEnabled := False;
            IQMS.Common.Miscellaneous.Delay(100);

            // 2
            ResetApplicationPicklists;
            ProgressDlg.StepProgress;
            IQMS.Common.Miscellaneous.Delay(100);

            // 3
            DeleteSchemaFiles;
            ProgressDlg.StepProgress;
            IQMS.Common.Miscellaneous.Delay(100);

            // 4
            IQRegFormWrite(TUniForm(Owner), [TUniForm(Owner)]);
            ProgressDlg.StepProgress;
            IQMS.Common.Miscellaneous.Delay(100);

            // 5
            // Record the version for later use
            MemorizeVersion(TUniForm(Owner));
            ProgressDlg.Position := ProgressDlg.MaxProgress;
            IQMS.Common.Miscellaneous.Delay(800);

          finally
            // Free the Progress Dialog box
            if Assigned(ProgressDlg) then
              FreeAndNil(ProgressDlg);
          end;
          // 05/15/2015 Do not display confirmation box at the end.
          // This locks up DCOM apps.
          // EIQ-7163 Application Registry Reset, Remove Confirmation Message at End of Process
          // if AAutoReset then
            // IQMS.Common.ResourceStrings.cTXT0000417 =
            // 'The version has changed.  Personal settings have been ' +
            // 'cleared to improve performance.'
            // IQMesg.IQInformation(IQMS.Common.ResourceStrings.cTXT0000417);
        end;
    end;
end;

procedure TIQWebVersion.DeleteApplicationKey;
begin
  with TIQRegForm.Create(nil) do
    try
      Path := Format('\Software\IQMS\IQWin32\%s',[ExtractFileName(Application.ExeName)]);
      IQDeleteKey(Path);
    finally
      Free;
    end;
end;

procedure TIQWebVersion.FindFiles(APath, AFileMask: String;
  var AFileList: TStringList);

  function IsDirNotation(ADirName: String): Boolean;
  begin
    Result := (ADirName = '.') or (ADirName = '..');
  end;

var
  FSearchRec, DSearchRec: TSearchRec;
  FindResult: Integer;
  AFindText: String;
begin
  // Find the first occurence of the specified file name
  FindResult := FindFirst(APath + AFileMask, faAnyFile, FSearchRec);
  try
    // Continue to search for the files according to the specified mask.
    while FindResult = 0 do
      begin
        if not IsDirNotation(FSearchRec.Name) then
          begin
            AFindText := APath + FSearchRec.Name; // get the search result
            if (FSearchRec.Attr and faDirectory = faDirectory) then
              // is this result a directory?
              AFindText := System.SysUtils.IncludeTrailingPathDelimiter(AFindText);
            // fix the directory name
            AFileList.Add(AFindText); // add it to the list
          end;
        FindResult := FindNext(FSearchRec);
      end;
  finally
    FindClose(FSearchRec);
  end;
end;

procedure TIQWebVersion.DeleteSchemaFiles;
var
  AFilesList: TStringList;
  i: Integer;
begin
  // Create the file list object
  AFilesList := TStringList.Create;
  try
    // Find files include subdir
    FindFiles(FLocalHomePath, '*.SCF', AFilesList); // IQFile.pas
    ProgressDlg.StepProgress;
    IQMS.Common.Miscellaneous.Delay(100);

    FindFiles(FLocalHomePath, 'SCACHE.INI', AFilesList);
    ProgressDlg.StepProgress;
    IQMS.Common.Miscellaneous.Delay(100);

    FindFiles(FLocalHomePath, 'BDESC*.SCF', AFilesList);
    ProgressDlg.StepProgress;
    IQMS.Common.Miscellaneous.Delay(100);

    FindFiles(FSystemPath, 'BDESC*.SCF', AFilesList);
    ProgressDlg.StepProgress;
    IQMS.Common.Miscellaneous.Delay(100);

    // Add the file count to the progress bar
    ProgressDlg.MaxProgress := ProgressDlg.MaxProgress + AFilesList.Count;
    // Delete files
    for i := 0 to AFilesList.Count - 1 do
      begin
        DeleteFile(AFilesList[i]);
        ProgressDlg.StepProgress;
      end;
  finally
    AFilesList.Free;
  end;
end;

procedure TIQWebVersion.ResetApplicationPicklists;
var
  ABasePath: string;
  i: Integer;
  ADeleteKeys: TStringList;

  procedure _EnumSubKeys(const Key: string);
  var
    ARegistry: TIQWebRegistry;
    ASubKeyNames: TStringList;
    APath, AKeyName: string;
  begin
    ARegistry := TIQWebRegistry.Create;
    try
      ARegistry.RootKey := HKEY_CURRENT_USER;
      ARegistry.OpenKeyReadOnly(Key);
      // This list is used locally to get the subkeys
      ASubKeyNames := TStringList.Create;
      try
        // Get the subkey names
        ARegistry.GetKeyNames(ASubKeyNames);
        // Loop the subkeys
        for AKeyName in ASubKeyNames do
          begin
            // This is the current path
            APath := Format('%s\%s', [Key, AKeyName]);
            // Add the keys to be deleted
            if (CompareText(AKeyName, 'dbGrid') = 0) or
              (CompareText(AKeyName, 'DescendingOrder') = 0) or
              (CompareText(AKeyName, 'Search') = 0) or
              (CompareText(AKeyName, 'SortColIndex') = 0) or
              (CompareText(AKeyName, 'SortColumns') = 0) then
              begin
                // Add it to the list
                ADeleteKeys.Add(APath);
                // Done here; keep moving.
                Continue;
              end;
            // Recursion:  check sub keys
            _EnumSubKeys(APath);
          end;
      finally
        ASubKeyNames.Free;
      end;
    finally
      ARegistry.Free;
    end;
  end;

begin
  // This is the pick list Registry key for the current application
  ABasePath := Format('\Software\IQMS\IQWin32\Picklist\%s',
    [ExtractFileName(Application.ExeName)]);
  // Create the list that will hold the keys to be deleted
  ADeleteKeys := TStringList.Create;
  try
    // List keys to be deleted
    _EnumSubKeys(ABasePath);
    ProgressDlg.MaxProgress := ProgressDlg.MaxProgress + ADeleteKeys.Count;
    // Loop the list of keys to be deleted
    for i := 0 to ADeleteKeys.Count - 1 do
      begin
        // Delete the key
        with TIQWebRegistry.Create do
          try
            RootKey := HKEY_CURRENT_USER;
            DeleteKey(ADeleteKeys.Strings[i]);
            ProgressDlg.StepProgress;
          finally
            Free;
          end;
      end;
  finally
    ADeleteKeys.Free;
  end;
end;

{$ENDREGION 'TIQVersion'}

  procedure LoadVersionFromBuildVersionStrings;

    function ExtractParam(AStr, APrefix, APostfix: string) : string;
    var
      fPos, tPos: integer;
    begin
      result := '';

      fPos := Pos(APrefix, AStr);
      if fPos > 0 then
      begin
        tPos := Pos(APostfix, AStr, fPos + Length(APrefix));

        if tPos > 0 then
        begin
          result := Copy(AStr, fPos + Length(APrefix), tPos - (fPos + Length(APrefix)));
          result := Trim(result);
        end;
      end;
    end;

    function ExtractBuild(str : string) : integer;
    var
      strBuild: string;
    begin
      result := 0;

      strBuild := ExtractParam(str, '$Change:', '$');

      if strBuild <> '' then
        try
          result := StrToInt(strBuild);
        except
        end;
    end;

    function ExtractVersion(str : string) : string;
    var
      fPos, tPos: integer;
      strPath: string;
      strVersion: string;
    begin
      result := 'DEV';

      strPath := ExtractParam(str, '$File:', '$');

      if strPath <> '' then
        begin
          strVersion := ExtractParam(str, '//delphi/iqwin/win', '/vcl/BuildVersion.pas');

          // EIQ-9030 get rid of "_" as in _2015.2
          while (strVersion <> '') and (strVersion[1] = '_') do
            strVersion:= Copy(strVersion, 2, 255);

          if strVersion <> '' then
            result := strVersion;
        end;
    end;

  begin
    // Extract BuildVersion from $Change: 126059 $

    IQMS.WebVCL.BuildVersion.cBuildVersion := IntToStr(ExtractBuild(cChange));

    // Extract Version from $File: //delphi/iqwin/CHANGELIST.txt $

    C_Version := ExtractVersion(cFile);
  end;

initialization

  LoadVersionFromBuildVersionStrings;

end.

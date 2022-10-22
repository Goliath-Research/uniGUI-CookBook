unit IQMS.Common.CGIShare;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  UniTimer,
  uniGUIForm,
  uniGUIApplication,
  uniGUIBaseClasses,
  uniGUIClasses;

procedure CGIDelDirContentOlderThan(ADirName, AMask: string; ADays: Real);
procedure CGIDeleteFilesOlderThan(ADirName, AMask: string; ADays: Real);
procedure CGIDeleteSubDirsOlderThan(ADirName, AMask: string; ADays: Real);
procedure CGILoadFilesInDirectory(ADirName: string; AList: TStringList;
  AAtributes: Integer; AMask: string = '*.*'; ADays: Real = 0);
function CGIDeleteDirectory(ADirName: string): Boolean;
function CGIIncludeTrailingBackslash(ADirName: string): string;
procedure CGITouchFile(AFileName: string; AFileAge: Integer);
procedure CGISetFileAttribute(AFileName: string);

 type
  TCGITimer = class
    Timer        : TUniTimer;
  strict private
    FTargetTimeout,
    FElapsedSeconds     : integer;
  protected
    FTimeOut  : integer;
    FDbgMsg,
    FCurrentClass,
    FDebug : string;
    FShutDownOnTimeout : Boolean;
  public
    property CurrentClass : string read FCurrentClass write FCurrentClass;
    property Debug : string read FDebug write FDebug;
    property DbgMsg : string read FDbgMsg write FDbgMsg;
    property SecondsLeft : integer read FTimeout;
    constructor Create( AOwner: TComponent; AInterval : integer; ATimeoutInSecs : integer;
                        ADbg, ADbgMsg, ACurrentClass : string; AStartTimer : Boolean; AShutDownOnTimeout : Boolean );
    procedure CheckTimeout( Sender : TObject );
  end;

  procedure WriteToLog( AMsg : string );

implementation

uses
  IQMS.Common.StringUtils,
  IQMS.Common.Miscellaneous,
  IQMS.Common.CheckPoint,
  IQMS.Common.Numbers;

procedure CGIDelDirContentOlderThan( ADirName, AMask: string; ADays: Real );
begin
  CGIDeleteFilesOlderThan( ADirName, AMask, ADays );
  CGIDeleteSubDirsOlderThan( ADirName, AMask, ADays );
end;

procedure CGIDeleteFilesOlderThan( ADirName, AMask: string; ADays: Real );
var
  AList: TStringList;
  I    : Integer;
begin
  ADirName:= CGIIncludeTrailingBackslash( ADirName );

  AList:= TStringList.Create;
  try
    {Load files}
    CGILoadFilesInDirectory( ADirName, AList, faAnyFile - faDirectory, AMask, ADays );

    {Delete files}
    for I:= 0 to AList.Count - 1 do
    begin
      if not DeleteFile( ADirName + AList[ I ]) then
        Continue;
    end;

  finally
    AList.Free;
  end;
end;

procedure CGIDeleteSubDirsOlderThan( ADirName, AMask: string; ADays: Real );
var
  AList: TStringList;
  I    : Integer;
begin
  ADirName:= CGIIncludeTrailingBackslash( ADirName );

  AList:= TStringList.Create;
  try
    CGILoadFilesInDirectory( ADirName, AList, faDirectory, AMask, ADays );

    for I:= 0 to AList.Count - 1 do
      CGIDeleteDirectory( ADirName + AList[ I ]);
  finally
    AList.Free;
  end;
end;

{aux procedure}
procedure CGILoadFilesInDirectory( ADirName: string; AList: TStringList; AAtributes: Integer; AMask: string = '*.*'; ADays: Real = 0 );
var
  SearchRec : TSearchRec;
  FindResult: Integer;
begin
  FindResult:= FindFirst( CGIIncludeTrailingBackslash( ADirName ) + AMask, AAtributes, SearchRec );
  try
    while FindResult = 0 do
    begin
      if (SearchRec.Attr and AAtributes > 0)
         and not StrInList( SearchRec.Name, ['.', '..'])
         and (FileDateToDateTime( SearchRec.Time ) + ADays < Date) then
         AList.Add( SearchRec.Name );
      FindResult:= FindNext( SearchRec );
    end;
  finally
    System.SysUtils.FindClose( SearchRec );
  end;
end;


{aux procedure}
function CGIDeleteDirectory( ADirName: string ): Boolean;
var
  AList: TStringList;
  I    : Integer;
begin
  Result:= FALSE;
  ADirName:= CGIIncludeTrailingBackslash( ADirName );

  AList:= TStringList.Create;
  try
    {Load files}
    CGILoadFilesInDirectory( ADirName, AList, faAnyFile - faDirectory );

    {Delete files}
    for I:= 0 to AList.Count - 1 do
    begin
      if not DeleteFile( ADirName + AList[ I ]) then
        Continue;
    end;

    {Get rid of the dir}
    if not RemoveDir( ADirName ) then
      EXIT;

    Result:= TRUE;
  finally
    AList.Free;
  end;
end;

function CGIIncludeTrailingBackslash( ADirName: string ): string;
begin
  if not ( CompareText( ADirName[ Length(ADirName) ], '\') = 0 ) then
    ADirName:= ADirName + '\';

  Result:= ADirName;
end;

procedure CGITouchFile( AFileName: string; AFileAge: Integer );
var
  AFileHandle: Integer;
  AErrCode   : Integer;
begin
  AFileHandle:= FileOpen(AFileName, fmOpenReadWrite);  // or fmShareDenyNone
  if AFileHandle <= 0 then
    raise Exception.CreateFmt('Unable to open file %s'#13#13'Error Code: %d', [ AFileName, GetLastError ]);

  try
    AErrCode:= FileSetDate(AFileHandle, AFileAge);
    if AErrCode <> 0 then
      raise Exception.CreateFmt('Unable to change %s timestamp. Error Code = %d', [ AFileName, AErrCode ]);
  finally
    FileClose(AFileHandle);
  end;
end;

procedure CGISetFileAttribute(AFileName: string);
var
  Attrs: Integer;
begin
  if not FileExists( AFileName ) then EXIT;

  Attrs:= FileGetAttr( AFileName );
  try
    if (Attrs and faReadOnly) <> 0 then
      IQAssert( FileSetAttr(AFileName, Attrs - System.SysUtils.faReadOnly) > -1, 'Error Code = ' + FloatToStr( GetLastError ));
  except on E: Exception do
    raise Exception.CreateFmt('Unable to assign file %s ReadOnly property to False.'#13'%s', [AFileName, E.Message]);
  end;
end;

{$REGION 'TCGITimer'}
constructor TCGITimer.Create(  AOwner: TComponent; AInterval : integer; ATimeoutInSecs : integer;
                               ADbg, ADbgMsg, ACurrentClass : string; AStartTimer : Boolean; AShutDownOnTimeout : Boolean );
begin
  Timer:= TUniTimer.Create( AOwner );

  with Timer do
  begin
    OnTimer := CheckTimeout;
    Interval:= AInterval;
    FTimeOut:= ATimeoutInSecs;
    Enabled := AStartTimer;
  end;

  FTargetTimeout:= FTimeout;

  FDebug    := ADbg;
  FDbgMsg := ADbgMsg;
  FCurrentClass:= ACurrentClass;
  FShutDownOnTimeout := AShutDownOnTimeout;
end;

procedure TCGITimer.CheckTimeout( Sender : TObject );

  procedure _HandleTimedOutThread;
  var
    i : integer;
    aForms : string;
    aMessage : string;
    aOpenFormsCount : integer;
  begin
    aForms:= '';

    //Get Open Forms
    aOpenFormsCount:= unisession.FormsList.Count;

    for i:= 0 to aOpenFormsCount -1 do
      with TStringList.Create do
      try
        Add( TUniBaseForm( UniSession.FormsList[I] ).ClassName + ',' );
        aForms:= Trim(Text);
      finally
        Free;
      end;

    aMessage:= Format('%s Thread Timed Out: '   +
                      '%s '+
                      '%s '+
                      '%s '+
                      '%s '+
                      'Time: %s ',
                      [ Application.Title,
                        SIIF(FDebug <> '', ' FDbg: ' + FDebug, ''),
                        SIIF(FDbgMsg <> '', ' FDbgMsg: ' + FDbgMsg, ''),
                        SIIF(CurrentClass <> '', ' CurrentClass: ' + CurrentClass, ' '),
                        SIIF(aOpenFormsCount > 0, ' Forms waiting for interaction: ' + aForms, ''),
                        DateTimeToStr(Now) ]);

    WriteToLog( aMessage );

    if FShutDownOnTimeout then
    begin
//      Application.Terminate;
      WriteToLog(Format('Terminating %s - Elapsed Time: %f minutes Target Timeout: %f minutes ',
        [ Application.Title, FElapsedSeconds / 60, FTargetTimeout / 60 ]));
      HALT; //hard kill the app
    end;
  end;

begin
  if FTimeout = -1 then
    Exit;

  if FTimeout > 0 then
  begin
    //Track elapsed time against target timeout
    Dec( FTimeout );
    Inc( FElapsedSeconds );
  end
  else
    //Thread timed out!
    _HandleTimedOutThread;
end;
{$ENDREGION}

procedure WriteToLog( AMsg : string );
var
  aProcId : cardinal;
begin
  aProcId:= GetCurrentProcessId;
  TFrmCheckPointList.BackupLogExceeding(1024*1024*20);
  TFrmCheckPointList.Add( Format( 'ProcessID: %d %s',[ aProcId, AMsg] ));
end;

end.

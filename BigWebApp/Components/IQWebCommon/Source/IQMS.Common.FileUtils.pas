unit IQMS.Common.FileUtils;

interface

         {Example of use:

         //Copy EXE and DLL files including subdir from f:\iqwin to c:\iqwin.
         //Build subdirs as needed.

         with TIQCopyDir.Create( 'F:\IQwin', 'C:\IQwin' ) do
         try
            Copy( [ '*.EXE', '*.DLL' ]);
         finally
            Free;
         end;

         //Delete Files
              IQDeleteFiles( [ C:\IQwin32\tmp\*.* ] );
         }

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, IQMS.Common.Registry, Winapi.ShellAPI, Winapi.ShlObj, TLHelp32,
  System.Zip, FireDAC.Comp.Client, Data.SQLExpr, Winapi.ActiveX;
  {*UG_rem_AE*}
  //db_dm;

      function IQDirExists( const Path  : string ) : boolean;
      function IQCreateDir( Path  : string ) : boolean;
      procedure DeleteFilesOlderThan( AFileMask: string; ADays: Real );

      {Delete files in the specified directory.
      Example:
         IQDeleteFiles( [ C:\IQwin32\tmp\*.* ] ); }
      function IQDeleteFiles( const FileNames : array of string ):boolean;
      function IQMoveFile(const AFileName: TFileName; const ANewDirectory: String;
       ARaiseErrors: Boolean = TRUE): Boolean;
      function IQMoveFileStrict(const AFileName: TFileName;
       const ANewDirectory: String; var AError: string): Boolean;

      {Deletes files in the specified directory that fit the file mask.  This does
      not delete subdirectories.  The Attribute parameter is optional; if zero,
      any file that fits the mask will be returned.}
      procedure DeleteFilesDir( Directory : String; AMask : String;
                                FileAttribute: Integer );

      {Finds files from the APath down through subdirectories.  The AStringList
      is filled with the files, with their paths, that match AFileName.  A result
      of TRUE is returned if any are found, otherwise the result is FALSE.}
      function FindFiles( APath, AFileMask: String; var AStringList: TStringList;
                          ASearchSubdir: Boolean = TRUE ): Boolean;

      procedure ParseMasks(const AMaskText: String; var AMasks: TStringList);

      {Does file exist - if not, user is prompted to browse or search for file}
      function FileExistsDlg(const ATargetFileName: String; // file name (In)
                           var AActualFileName: String; // file name selected (Out)
                           AOpenDlgFilter: String = 'Any file (*.*)|*.*'): Boolean;

      {Returns a valid directory name, with trailing front slash.}
      function GetDirectoryName( Dir: String ): String;
      procedure GetFileParts(const AFileName: TFileName; var APath, AName, AExt: String);
      function PathCombineEx(const APath: array of string): String;
      {Given a directory or file name, parses the path into its parts based
       on the system path delimiter, and returns the result in the AParts
       string list.  Set AIncludeDelim to True to include the path delimiter
       after directory sections.}
      procedure ParseDirectory(const ADirectory: String;
       var AParts: TStringList; AIncludeDelim: Boolean = True);

      {Builds a directory with the parts provided.  The system delimiter
       is used.}
      function BuildDirectory(const ADrive: Char;
       const AFolders: array of String): String;

      function ShortDirectoryName(Dir: String): String;
      function ShortDirectoryAndFileName(AFileName: String): String;
      function UpOneLevel(const ADirectory: String): String;

      // Returns a file name with standardized path delimiters
      // For example:
      //   AFileName = 'C:\IQWin\UPS\InMail/lm2684_1223330925.000'
      //   Result = 'C:\IQWin\UPS\InMail\lm2684_1223330925.000'
      // Works with directories also.
      function StandardizePathDelimeters(const AFileName: String): String;

      /// <summary> Return just the file name, excluding the path and extension.
      /// </summary>
      function FileNameNoExt(const AFileName: String ): string;

      /// <summary> Similar to ExtractFileName, returns just the file name
      /// (including the extension) of the given file name. Includes support
      /// for Linux and other non-Windows formats.
      /// </summary>
      function FileNameOnly(const AFileName: String ): string;

      /// <summary> Similar to ExtractFilePath, returns just the path
      /// of a file name.  Includes support for Linux and other
      /// non-Windows formats.
      /// </summary>
      function FilePathOnly(const AFileName: string): string;

      function SetFileDate(AFileName: TFileName; AFileAge: Integer ): Boolean;
      function SetFileDateEx(ASourceFile, ATargetFile: TFileName ): Boolean;
      function GetFileDate(AFileName: String): TDateTime;


      /// <summary> Ensures the file name is unique.  If a file with the
      /// given name already exists, a number will be appended to the name
      /// to ensure it is unique. </summary>
      function EnsureUniqueFileName(const AFileName: string): string;

      // Is the file a local file (not available on the network)? Local files
      // reside on the current machine.
      function IsLocalFile(const AFileName: TFileName): Boolean;
      // Is the file a disk file (local or network)? Disk files reside on an
      // available drive, by contrast to internet links.  Use this to test if
      // a link is a file or a hyperlink.
      function IsDiskFile(ALinkName: String): Boolean;


      { These two functions work together to return the first instance of a
       filename.  GetFirstFileInstance() is the wrapper.
       Example:
          // IN:  AFileName := MyFile.exe
          // OUT:  ALocation := 'C:\WINNT\MyFile.exe'
          var
             AFileName, ALocation : String;
          begin
               if not FileExists( GetFileNameFromReg ) then // First, check Registry
                  begin
                       if GetFirstFileInstance( AFileName, ALocation ) then
                          begin
                               SaveFileNameToReg( ALocation );    // Save to Registry
                               ExecuteFile( ALocation ); // Execute
                          end
                       else
                          raise Exception.Create( 'Cannot find required file.' );
                  end
               else
                  ExecuteFile( GetFileNameFromReg );
         end;
      }
    function GetFirstFileInstance( AFileToFind: String; var ALocationResult: String ): Boolean;
    function FindFirstFileInstance( ADirectory, AFileName: String; var ALocation: String ): Boolean;

    /// <summary> Get file size in bytes. </summary>
    function IQGetFileSize( AFileName: string ): Integer;
    function IQGetFileSizeStr( AFileName: string ): String;

    function IsFileReadOnly(const AFileName: String): Boolean;
    procedure SetFileReadOnly(const AFileName: String; const AReadOnly: Boolean);
    function IsFileHidden(const AFileName: String): Boolean;
    procedure SetFileHidden(const AFileName: String; const AHidden: Boolean);
    procedure RemoveWriteProtection(const AFileName: TFileName);

    procedure ShowFileProperties(AFileName: TFileName);
    function SendToRecycleBin( Sender: TComponent; AFileName: TFileName ): Boolean;

    // Pass the name of the file as it appears in the list of processes (i.e., 'Delphi32.exe')
    function IsProcessRunning(AProcess: string): Boolean;
    function IsProcessRunningA(AProcess: string;
      AFilterCurrentUser: Boolean = True): Boolean;
    function IsProcessRunningB(AProcess: string; AUserName: string;
      AFiltered: Boolean = True): Boolean;

    // Appends text to a file (e.g., a log file)
    procedure WriteLineToFile(const AText, AFileName: String; var AError: String);

    // Application specific
    function ExeDir: String;
    function ExeFileName: String;
    function ExeFileNameNoExt: String;
    function OriginalExeName: string;
    function ExeCompanyName: string;
    function ExeInternalName: string;

    // converts an 8.3 path to a full file name...without the tilde
    // note: you need the full path to the file.
    // more info, look up this key:
    //     HKLM\SYSTEM\CurrentControlSet\Control\FileSystem\NtfsDisable8dot3NameCreation
    function ShortToLongFileName(FileName: string): string;

    // Zip/Unzip methods
    procedure ZipFiles(const AZipFile: string; const AFiles: TStringList); overload;
    procedure ZipFiles(const AZipFile: string; const AFiles: array of string); overload;
    procedure ZipFiles(const AZipFile: string; const ADirectory: string); overload;
    procedure UnzipFiles(const AZipFile: string; ATargetDir: string);

    function OpenFolderAndSelectFile(const FileName: string): Boolean;


    {$REGION 'FireDAC Oracle File Methods'}
    function OracleFD_FileExists(const AOracleDirName : string; const AFileName: string; var ASize : Real; AFDConnection : TFDConnection = nil ): Boolean;
    function OracleFD_FindStrInTextFile(const AFindStr, AOracleDirName, AFileName: string; var AFileExists : Boolean; AFDConnection : TFDConnection = nil  ) : Boolean;
    {$REGION 'FireDAC Oracle File Methods'}

    {$REGION 'DBExpress Oracle File Methods'}
    function OracleSqlExpr_FileExists(const AOracleDirName : string; const AFileName: string; var ASize : Real; ASQLExprConnection : Data.SqlExpr.TSQLConnection = nil ): Boolean;
    function OracleSqlExpr_FindStrInTextFile(const AFindStr, AOracleDirName, AFileName: string; var AFileExists : Boolean; ASQLExprConnection : Data.SqlExpr.TSQLConnection = nil  ) : Boolean;
    {$REGION 'DBExpress Oracle File Methods'}

type
  TOnFileCopyProcedure = procedure( AObject:TObject ) of object;


type
  TIQCopyDir = class
    FSourceFile    : string;
    FTargetFile    : string;
    FSourceRootDir : string;
    FTargetRootDir : string;
    FIncludeSubDir : Boolean;
    FFilesCopied   : Integer;
    FOnFileCopy    : TOnFileCopyProcedure;
    procedure SetSourceRootDir( APath : string );
    procedure SetTargetRootDir( APath : string );
  protected
    procedure CheckDirExists( const TargetDir:string );
    procedure CopyFromSource( const SourceDir, TargetDir : string; const FileNames : array of string );
  public
    property SourceRootDir : string read FSourceRootDir write SetSourceRootDir;
    property TargetRootDir : string read FTargetRootDir write SetTargetRootDir;
    property SourceFile    : string read FSourceFile write FSourceFile;
    property TargetFile    : string read FTargetFile write FTargetFile;
    property IncludeSubDir : Boolean read FIncludeSubDir write FIncludeSubDir;
    property FilesCopied   : Integer read FFilesCopied write FFilesCopied;
    property OnFileCopy    : TOnFileCopyProcedure read FOnFileCopy write FOnFileCopy;

    constructor Create( const ASourceRootDir, ATargetRootDir : string );
    procedure CopyFiles( const FileNames : array of string );
    procedure ShowFilesCopiedCount;
  end;

const
  OFASI_EDIT = $0001;
  OFASI_OPENDESKTOP = $0002;

{$IFDEF UNICODE}
function ILCreateFromPath(pszPath: PChar): PItemIDList stdcall; external 'shell32.dll'
  name 'ILCreateFromPathW';
{$ELSE}
function ILCreateFromPath(pszPath: PChar): PItemIDList stdcall; external 'shell32.dll'
  name 'ILCreateFromPathA';
{$ENDIF}
procedure ILFree(pidl: PItemIDList)stdcall; external 'shell32.dll';
function SHOpenFolderAndSelectItems(pidlFolder: PItemIDList; cidl: Cardinal;
  apidl: pointer; dwFlags: DWORD): HRESULT; stdcall; external 'shell32.dll';

implementation

uses
    Data.DB,
    IQMS.Common.Dialogs,
    IQMS.Common.ResStrings,
    IQMS.Common.StringUtils,
    IQMS.Common.SysInfo;
    {*UG_rem_AE*}
    //IQMisc,
    //FindFileWizard,

type
  TFNGetLongPathName = function(lpszShortName: LPCTSTR; lpszLongName: LPTSTR;
    cchBuffer: DWORD): DWORD; stdcall;

var
  GetLongPathName: TFNGetLongPathName = nil;
  KernelHandle: THandle;

{ Functions and Procedures }
function IQDirExists( const Path  : string ) : boolean;
begin
  Result:= GetFileAttributes( PChar( Path )) <> $FFFFFFFF ;
end;

function IQCreateDir( Path  : string ) : boolean;
var
  S:string;
begin
  if IQDirExists( Path ) then
     Result:= TRUE
  else
    begin
      if Path[ Length( Path )] = '\' then
         Path:= Copy( Path, 1, Length(Path) - 1);
      S:= ExtractFilePath( Path );
      if S = Path then
         raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000096 {'Invalid Path: %s'}, [ S ])
      else
      begin
        Result:= IQCreateDir( S );
        if Result and not CreateDir( Path ) then
        begin
           Result:= FALSE;
           IQWarning( Format( IQMS.Common.ResStrings.cTXT0000097 {'Unable to Create Directory: %s'}, [ Path ]));
        end;
      end;
    end;
end;

function IQDeleteFiles( const FileNames : array of string ):boolean;
var
  i         : Integer;
  SearchRec : TSearchRec;
  FindResult: Integer;
  ErrCode   : Integer;
begin
  for i:= 0 to High( FileNames ) do
  begin
    FindResult:= FindFirst( FileNames[ i ], faAnyFile, SearchRec );
    while FindResult = 0 do
    try
      try
        if not DeleteFile( ExtractFilePath( FileNames[ i ] ) + SearchRec.Name ) then
        begin
          ErrCode := GetLastError;
          raise Exception.Create(Format(IQMS.Common.ResStrings.cTXT0000098 {'Unable to Delete File %s. Error Code: %d'}, [ SearchRec.Name, ErrCode ] ));
        end;
      finally
        FindClose( SearchRec );
      end;
      FindResult:= FindFirst( FileNames[ i ], faAnyFile, SearchRec );
      Application.ProcessMessages;
    except on E:Exception do
         if MessageDlg( E.Message, mtWarning, [mbRETRY, mbABORT], 0 ) = mrAbort then
           raise EAbort.Create('');
    end;
    if FindResult <> 0 then
      FindClose( SearchRec );
  end; {scan all passed files w/extensions}
end;

function IQMoveFile(const AFileName: TFileName; const ANewDirectory: String;
 ARaiseErrors: Boolean = TRUE): Boolean;
var
  ANewFile, ATemp: String;
  APath, AName, AExt: String;
  i: Integer;
begin
  try
     // Ensure the new directory exists
     if not ForceDirectories(ANewDirectory) then
        raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000321 {'Cannot create directory, %s'}, [ANewDirectory]);

     GetFileParts(AFileName, APath, AName, AExt);

     // The default new file, the one we hope to move
     ANewFile := GetDirectoryName(ANewDirectory) + ExtractFileName(AFileName);

     // Ensure that a file of this name does not already exist in the target dir
     // If it does, then we will have problems.
     i := 2;
     repeat
       if FileExists(ANewFile) then
          ANewFile := Format('%s%s (%d)%s', [IQMS.Common.FileUtils.GetDirectoryName(ANewDirectory), AName, i, AExt])
       else BREAK;
       Inc(i);
     until not FileExists(ANewFile);

     // Copy the old file into the new directory
     Result := CopyFile(PChar(AFileName + #0), PChar(ANewFile + #0), FALSE);

     // If we did not succeed in copying the file, raise an error
     if not Result then
        IQError(Format(IQMS.Common.ResStrings.cTXT0000322 {'Cannot copy file, %s, to %s'}, [AFileName, ANewDirectory]))
     // if the file was copied successfully, delete the original file
     else
        Result := DeleteFile(AFileName);

     // If we could not delete the original file, raise an error
     if not Result and ARaiseErrors then
        // 'The file, %s, was copied successfully.  But the original file could not be removed.';
        IQError(Format(IQMS.Common.ResStrings.cTXT0000323, [AFileName]));

  except on E:Exception do
   if ARaiseErrors then // some applications do not want errors raised
      raise;
  end;
end;

function IQMoveFileStrict(const AFileName: TFileName;
  const ANewDirectory: String; var AError: string): Boolean;
const
  FileErrorCode: array [0 .. 110, 0 .. 1] of String =
    (('1', 'Invalid function code'),
    ('2', 'File not found'),
    ('3', 'Path not found'),
    ('4', 'No handles available.  Too many open files'),
    ('5', 'Access denied.  File attribute is Read Only or Hidden.'),
    ('6', 'Invalid file handle.'),
    ('7', 'Memory Control Blocks destroyed.'),
    ('8', 'Insufficient memory.'),
    ('9', 'Invalid memory block address.'),
    ('10', 'Invalid environment.'),
    ('11', 'Invalid format.'),
    ('12', 'Invalid access code.'),
    ('13', 'Invalid data.'),
    ('14', 'Unknown error code.'),
    ('15', 'Invalid drive.'),
    ('16', 'Attempt to remove the current directory.'),
    ('17', 'Not same device.'),
    ('18', 'No more files.'),
    ('19', 'Disk is write-protected.'),
    ('20', 'Bad disk unit.'),
    ('21', 'Drive not ready.'),
    ('22', 'Invalid disk command.'),
    ('23', 'Cyclic Redundancy Check error.'),
    ('24', 'Invalid length for disk operation.'),
    ('25', 'Seek error.'),
    ('26', 'Unknown media type.  Not a DOS disk.'),
    ('27', 'Sector not found.'),
    ('28', 'Out of paper.'),
    ('29', 'Write fault.'),
    ('30', 'Read fault.'),
    ('31', 'General failure.'),
    ('32', 'Sharing violation.'),
    ('33', 'Lock violation.'),
    ('34', 'Wrong disk.  Invalid disk change.'),
    ('35', 'File Control Block unavailable.'),
    ('36', 'Sharing buffer invalid.'),
    ('37', 'Code page mismatch.'),
    ('38', 'Cannot complete file operation (out of input).'),
    ('39', 'Insufficient disk space.'),
    ('50', 'Network request not supported.'),
    ('51', 'Remote computer not listening.'),
    ('52', 'Duplicate name on network.'),
    ('53', 'Network name not found.'),
    ('54', 'Network busy.'),
    ('55', 'Network device no longer exists.'),
    ('56', 'Net BIOS command limit exceeded.'),
    ('57', 'Network adapter hardware error.'),
    ('58', 'Incorrect response from network.'),
    ('59', 'Unexpected Network Error.'),
    ('60', 'Incompatible Remote Adapter.'),
    ('61', 'Print Queue full.'),
    ('62', 'Queue not full.'),
    ('63', 'Not enough space for Print File.'),
    ('64', 'Network name was deleted.'),
    ('65', 'Access denied.'),
    ('66', 'Network Device Type Incorrect.'),
    ('67', 'Network name not found.'),
    ('68', 'Network name limit exceeded.'),
    ('69', 'Net BIOS Session limit exceeded.'),
    ('70', 'Temporarily paused.'),
    ('71', 'Network request not accepted.'),
    ('72', 'Print or Disk Redirection is paused.'),
    ('73', 'Invalid network version (LANtastic).'),
    ('74', 'Account expired (LANtastic).'),
    ('75', 'Password expired (LANtastic).'),
    ('76', 'Login attempted invalid at this time (LANtastic).'),
    ('77', 'Disk limit exceed on network node (LANtastic).'),
    ('78', 'Not logged in to network node (LANtastic).'),
    ('79', 'Unknown error code.'),
    ('80', 'File already exists.'),
    ('81', 'Unknown error code.'),
    ('82', 'Cannot create directory entry.'),
    ('83', 'Interrupt 24 Failure.'),
    ('84', 'Out of structures.'),
    ('85', 'Already assigned.'),
    ('86', 'Invalid password.'),
    ('87', 'Invalid parameter.'),
    ('88', 'Network write fault.'),
    ('89', 'Function not supported on network.'),
    ('90', 'Required system component not installed.'),
    ('100', 'Disk read error. The file could not be read because of ' +
            'attempted read past the end of the file.'),
    ('101', 'Disk write error.  Cause: Your hard drive is full.'),
    ('102', 'File not assigned. Causes:  Reported by Reset, Rewrite, ' +
            'Append, Rename, or Erase if the file variable has not been ' +
            'assigned a name through a call to Assign or AssignFile.'),
    ('103', 'The file could not be opened.  Causes:  The file may already ' +
            'be opened, or its file attributes set to Read Only or Hidden.'),
    ('104', 'File not open for input. Causes:  Reported by Read, Readln, ' +
            'Eof, Eoln, SeekEof, or SeekEoln on a text file if the file is ' +
            'not open for input.'),
    ('105', 'File not open for output.  Causes:  Reported by Write or ' +
            'Writeln on a text file if you do not generate a Console ' +
            'application.'),
    ('106', 'Invalid numeric format.  Causes:  Reported by Read or Readln ' +
            'if a numeric value read from a text file does not conform to ' +
            'the proper numeric format.'),
    ('200', 'Division by zero.'),
    ('201', 'Range check error.'),
    ('202', 'Stack overflow.'),
    ('203', 'Heap overflow error.  Out of memory.'),
    ('204', 'Invalid pointer operation.'),
    ('205', 'Floating point overflow.'),
    ('206', 'Floating point underflow.'),
    ('207', 'Invalid floating point operation.'),
    ('210', 'Abstract Method Error.'),
    ('215', 'Arithmetic overflow (integer only).'),
    ('216', 'Access violation.'),
    ('217', 'Control-C.'),
    ('218', 'Privileged instruction.'),
    ('219', 'Invalid typecast.'),
    ('220', 'Invalid variant typecast.'),
    ('221', 'Invalid variant operation.'),
    ('222', 'No variant method call dispatcher.'),
    ('223', 'Cannot create variant array.'),
    ('224', 'Variant does not contain array.'),
    ('225', 'Variant array bounds error.'),
    ('226', 'TLS initialization error.'),
    ('227', 'Assertion failed.'),
    ('228', 'Interface Cast Error.'),
    ('229', 'Safecall error.  Windows E_UNEXPECTED error.'));
var
  ATargetFileName, ACode: string;
  ACodeInt: Cardinal;

  function _GetErrorMessage: string;
  var
    i: Integer;
    s: string;
  begin
    for i := Low(FileErrorCode) to High(FileErrorCode) do
      if CompareText(FileErrorCode[i, 0], ACode) = 0  then
        begin
          Result := FileErrorCode[i, 1];
          Break;
        end;
    if Result = '' then
      Result := 'Unknown error code.';
  end;
begin
  ATargetFileName :=
    System.SysUtils.IncludeTrailingPathDelimiter(ANewDirectory) +
    ExtractFileName(AFileName);

  Result := Winapi.Windows.MoveFile(PWideChar(AFileName), PWideChar(ATargetFileName));
  if not Result then
     begin
       ACodeInt  := GetLastError;
       ACode := IntToStr(ACodeInt);
       Result := ACodeInt = 0; // if no code, then we are OK
       if not Result then
         AError := Format('%s: %s', [ACode, _GetErrorMessage]);
     end;
end;


{TIQCopyDir}
constructor TIQCopyDir.Create( const ASourceRootDir, ATargetRootDir : string );
begin
  SourceRootDir:= ASourceRootDir;
  TargetRootDir:= ATargetRootDir;
  IncludeSubDir:= TRUE;
  FFilesCopied := 0;
end;

procedure TIQCopyDir.SetSourceRootDir( APath : string );
begin
  if APath <> FSourceRootDir then
  begin
    if APath[ Length( APath )] <> ':' then
      FSourceRootDir:= StrTran( APath + '\', '\\', '\' )
    else
      FSourceRootDir:= APath;
  end;
end;

procedure TIQCopyDir.SetTargetRootDir( APath : string );
begin
  if APath <> FTargetRootDir then
  begin
    if APath[ Length( APath )] <> ':' then
      FTargetRootDir:= StrTran( APath + '\', '\\', '\' )
    else
      FTargetRootDir:= APath;
  end;
end;

procedure TIQCopyDir.CopyFiles( const FileNames : array of string );
{ Returns # of copied files. -1 in case of an Error }
begin
  FFilesCopied:= 0;
  try
    CopyFromSource( SourceRootDir, TargetRootDir, FileNames );
  except on E:Exception do
    begin
      if E.ClassType <> EAbort then
        Application.ShowException(E);
      FFilesCopied:= -1;
    end;
  end;
end;

procedure TIQCopyDir.CopyFromSource( const SourceDir, TargetDir : string; const FileNames : array of string );
var
  i          : Integer;
  ErrCode    : Integer;
  SearchRec  : TSearchRec;
  FindResult : Integer;
begin
  {Make sure Target dir exists}
  CheckDirExists( TargetDir );

  try
    {Copy Files}
    for i:= 0 to High( FileNames ) do
    begin
      //FindResult:= FindFirst( SourceDir+FileNames[ i ], (faAnyFile+faHidden+faSysFile+faReadOnly), SearchRec );
      FindResult:= FindFirst( SourceDir + FileNames[ I ], faAnyFile, SearchRec );

      while FindResult = 0 do
      try
        SourceFile:= SourceDir+SearchRec.Name;
        TargetFile:= TargetDir+SearchRec.Name;
        if not CopyFile( PChar( SourceFile ), PChar( TargetFile ), FALSE ) then
           begin
                ErrCode := GetLastError;
                raise Exception.Create(Format( IQMS.Common.ResStrings.cTXT0000099 {'Unable to copy %s to %s. Error Code: %d'}, [ SourceFile, TargetFile, ErrCode ] ));
           end;

        FilesCopied:= FilesCopied + 1;
        if Assigned( FOnFileCopy ) then FOnFileCopy( self );

        FindResult := FindNext( SearchRec );

        Application.ProcessMessages;
      except on E:Exception do
        if MessageDlg( E.Message, mtWarning, [mbRETRY, mbABORT], 0 ) = mrAbort then
          raise EAbort.Create('');
      end;
    end; {scan all passed file extensions}

    {SubDirs}
    if IncludeSubDir then
    begin
      FindResult:= FindFirst( SourceDir+'*.*', faDirectory, SearchRec );
      while FindResult = 0 do with SearchRec do
      begin
        if ( Attr and faDirectory = faDirectory ) and ( Name <> '.' ) and ( Name <> '..' ) then
           CopyFromSource( SourceDir+Name+'\', TargetDir+Name+'\', FileNames );
        FindResult:= FindNext( SearchRec );
        Application.ProcessMessages;
      end;
    end;

  finally
    FindClose( SearchRec );
  end;
end;

procedure TIQCopyDir.ShowFilesCopiedCount;
begin
  case FilesCopied of
    -1: IQError  ( Format( IQMS.Common.ResStrings.cTXT0000100 {'Copy to %s Failed. Please retry later.'},   [ TargetRootDir ]));
     0: IQWarning( Format( IQMS.Common.ResStrings.cTXT0000101 { 'No files copied to %s' }, [ TargetRootDir ]));
  else
     IQConfirm( Format( IQMS.Common.ResStrings.cTXT0000102 {'%d files have been copied to %s'}, [ FilesCopied, TargetRootDir ]));
  end;
end;

procedure TIQCopyDir.CheckDirExists( const TargetDir:string );
var
  ThisDir: string;
  Len    : Integer;
begin
  Len:= Length(TargetDir);
  if IQDirExists( TargetDir ) or ( Len = 0 ) then
    EXIT;

    {*UG_rem_AE*}
//  if RightStr( TargetDir, 2 ) = ':\'  then
//    raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000103 {'Unable to resolve directory, %s.'}, [ TargetDir ] );

  if TargetDir[ Len ] = '\' then
     ThisDir:= LeftStr( TargetDir, Len - 1 )
  else
     ThisDir:= TargetDir;

  {Recursive call}
  CheckDirExists( ExtractFilePath( ThisDir ));

  {if dir creation failed raise exception}
  if not CreateDir( TargetDir ) then
    raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000104 {'Unable to Create directory, %s.'}, [TargetDir]);
end;

{Deletes files in the specified directory that fit the file mask.  This does
not delete subdirectories.
    Example:
            DeleteFilesDir( 'C:\TEMP', '*.tmp', 0 );
}
procedure DeleteFilesDir( Directory : String; AMask : String;
                          FileAttribute: Integer );
var
  SearchRec  : TSearchRec;
  RetVal     : Integer;
  AData32    : TWin32FindData;
begin
     try
         {Make sure the File Attribute is correct}
         if FileAttribute = 0 then
            FileAttribute := faAnyFile;

         {Initiate the search and return the first file if it exists.}
         RetVal    := FindFirst( Directory + '\' + AMask, FileAttribute, SearchRec );
         {If not even one file was found then exit.}
         if ( RetVal <> 0 ) or
            ( SearchRec.Name = '' ) then
              Exit;
         {Otherwise, since the first file was found, delete it.}
         if FileExists( Directory + '\' + SearchRec.Name ) and
            ( LeftStr( SearchRec.Name, 1 ) <> '.' ) then
              DeleteFile( Directory + '\' + SearchRec.Name );
         {Find additional files that fit the mask and delete them too.}
         while (FindNext( SearchRec ) = 0) do
               begin
                    if FileExists( Directory + '\' + SearchRec.Name ) and
                       ( LeftStr( SearchRec.Name, 1 ) <> '.' ) then
                         DeleteFile( Directory + '\' + SearchRec.Name );
               end;
     finally
           FindClose( SearchRec );
     end;
end;

{Returns a TString list of files in the specified directory.  Directories are indicated
by dots (.., . ), as in a DOS environment.
   Example:
           FileList( 'C:\WINNT\System32', '*.*', faSysFile );
           //or
           FileList( 'C:\', '*.*', faArchive );
           //or
           FileList( 'C:\My Documents', '*.txt', 0 );
}
function FileList( Directory : String; AMask : String;
                   FileAttribute: Integer ): TStrings;
var
  SearchRec  : TSearchRec;
  AFileList  : TStringList;
  RetVal     : Integer;
begin
     try
         {Create the list object}
         AFileList := TStringList.Create;
         AFileList.Clear;

         {Make sure the File Attribute is correct}
         if FileAttribute = 0 then
            FileAttribute := faAnyFile;

         {Get the first file}
         RetVal    := FindFirst( Directory + '\' + AMask, FileAttribute, SearchRec );

         {If not even one file was found then exit.}
         if ( RetVal <> 0 ) or
            ( SearchRec.Name = '' ) then
            begin
                 Result := AFileList;
                 AFileList.Free;
                 Exit;
            end;

         {Find additional files that fit the mask and delete them too.}
         AFileList.Add( SearchRec.Name {AData32.cFileName} ); {AData32 returns the long file name}
         while (FindNext( SearchRec ) = 0) do
               begin
                    AFileList.Add( SearchRec.Name  {AData32.cFileName} );
               end;
         Result := AFileList;
     finally
         FindClose( SearchRec );
         if Assigned( AFileList ) then AFileList.Free;
     end;
end;

function GetDirectoryName(Dir: String): String;
{ This function formats the directory name so that it is a valid
  directory containing the back-slash (\) as the last character. }
begin
  Result := System.SysUtils.IncludeTrailingPathDelimiter(Dir);
{
     Result := ''; // initial
     if Length( Trim( Dir )) = 0 then Exit;

     if Dir[Length(Dir)]<> '\' then
        Result := Dir+'\'
     else
        Result := Dir;
}
end;

function StandardizePathDelimeters(const AFileName: String): String;
var
   ATemp: String;
begin
  // default result
  Result := AFileName;
  // change path delimiters to the system default
  Result := IQMS.Common.StringUtils.StrTran(Result, '/', System.SysUtils.PathDelim);
  Result := IQMS.Common.StringUtils.StrTran(Result, '\', System.SysUtils.PathDelim);
  // remove double delimiters
  Result := IQMS.Common.StringUtils.StrTran(Result, '//', System.SysUtils.PathDelim);
  Result := IQMS.Common.StringUtils.StrTran(Result, '\\', System.SysUtils.PathDelim);
end;

procedure GetFileParts(const AFileName: TFileName;
 var APath, AName, AExt: String);
begin
  APath := ExtractFilePath(AFileName);
  AName := FileNameNoExt(AFileName); // iqfile
  AExt  := ExtractFileExt(AFileName);
end;

function PathCombineEx(const APath: array of string): string;
var
  i: Integer;
  tmp: String;
begin
  // Initialize result
  Result := '';
  // Loop elements and combine
  for i := Low(APath) to High(APath) do
    begin
      // get value to add
      tmp := Trim(APath[i]);
      // skip empty values
      if Length(tmp) = 0 then
        Continue;
      // concatenate result
      if (Length(Result) = 0) then
       Result := tmp
      else
       Result := System.SysUtils.IncludeTrailingPathDelimiter(Result) + tmp;
    end;
end;

function BuildDirectory(const ADrive: Char;
 const AFolders: array of String): String;
var
   i: Integer;
   s: String;
begin
  // drive
  Result := System.SysUtils.IncludeTrailingPathDelimiter(ADrive + ':');
  // build path
  for i := Low(AFolders) to High(AFolders) do
      begin
        // get value to add
        s := AFolders[i];
        // remove preceding path delimiter, if exists
        if s[1] = System.SysUtils.PathDelim then
           s := Copy(s, 2, Length(s));
        // concatenate result
        Result := System.SysUtils.IncludeTrailingPathDelimiter(Result + s);
      end;
end;

procedure ParseDirectory(const ADirectory: String;
 var AParts: TStringList; AIncludeDelim: Boolean = True);
var
   APath, ADelim, ATemp: String;
   i, x: Integer;
begin
  if not Assigned(AParts) then
     Exit;

  // ensure delimiters are standard
  APath := StandardizePathDelimeters(ADirectory);
  // get value for parsing
  ADelim := System.SysUtils.PathDelim;
  // count delimiters
  x := IQMS.Common.StringUtils.NumToken(APath, ADelim);
  // loop and fill string list
  for i := 1 to x do
   begin
     ATemp := IQMS.Common.StringUtils.GetToken(APath, ADelim, i);
     if ATemp > '' then
        begin
          if AIncludeDelim then
             ATemp := ATemp + ADelim;
          AParts.Add(ATemp);
        end;
   end;
end;

function UpOneLevel(const ADirectory: String): String;
var
   AList: TStringList;
   i: Integer;
begin
  Result := '';
  try
     AList := TStringList.Create;
     ParseDirectory(ADirectory, AList, True);
     for i := 0 to AList.Count - 2 do
      Result := Result + AList.Strings[i];
  finally
     AList.Free;
  end;
end;

function FindFiles( APath, AFileMask: String; var AStringList: TStringList;
  ASearchSubdir: Boolean = TRUE ): Boolean;
  // ==========================================================================
  function IsDirNotation( ADirName: String ): Boolean;
  begin
    Result := (ADirName = '.') or (ADirName = '..');
  end;
  // ==========================================================================
var
  FSearchRec, DSearchRec  : TSearchRec;
  FindResult: Integer;
  AFindText: String;
begin

  // Set TStringList options
  AStringList.Sorted     := TRUE;       // sorted, which is the standard Windows display
  AStringList.Duplicates := dupIgnore;  // no duplicates, not that we should have any

  // Fix path string
  APath := GetDirectoryName(APath); // Obtain a valid directory name

  // Find the first occurence of the specified file name
  FindResult := FindFirst( APath + AFileMask, faAnyFile, FSearchRec );
  try
    // Continue to search for the files according to the specified mask.
    while FindResult = 0 do
    begin
      if not IsDirNotation( FSearchRec.Name ) then
         begin
              AFindText := APath + FSearchRec.Name; // get the search result
              if ( FSearchRec.Attr and faDirectory = faDirectory ) then // is this result a directory?
                 AFindText := GetDirectoryName( AFindText ); // fix the directory name
              AStringList.Add( AFindText ); // add it to the list
         end;
      FindResult := FindNext( FSearchRec );
    end;

    // Search subdirectories
    if ASearchSubdir then
       begin
            // Find first instanc
            FindResult := FindFirst(APath + '*.', faDirectory, DSearchRec);
            try
              while FindResult = 0 do // file was found
              begin
                AFindText := APath + DSearchRec.Name; // full path found
                // Add additional files
                if ( (DSearchRec.Attr and faDirectory) = faDirectory ) and not IsDirNotation( DSearchRec.Name ) then
                   FindFiles( AFindText, AFileMask, AStringList ); // Recursion here
                FindResult:= FindNext( DSearchRec );
                // NOTE: Recursion continues until all sub-directories have been searched.
              end;
            finally
              FindClose( DSearchRec );
            end;
       end;
  finally
    FindClose(FSearchRec);
  end;
  Result:= ( AStringList.Count > 0 );
end;

procedure ParseMasks(const AMaskText: String; var AMasks: TStringList);
var
  ATempList: TStringList;
  i: Integer;
  ATempMask: String;
begin
  ATempList := TStringList.Create;
  try
     // Initialization
     ATempMask := '';

     // Check if we have a list of delimited masks
     {*UG_rem_AE*}
//     if (Pos(';', AMaskText) > 0) or (Pos(',', AMaskText) > 0) then
//        IQMS.Common.StringUtils.StrToStringListExB(AMaskText, [';',','], ATempList)
//     // Check if the mask is a complete file name
//     else if (Pos('.', AMaskText) > 0) and (ExtractFileExt(AMaskText) > '') then
//        ATempList.Add(AMaskText);

     // Cycle the text to build a list of masks
     if ATempList.Count = 0 then
     for i := 1 to Length(AMaskText) do
      begin
        if (AMaskText[i] = ' ') and (ATempMask > '') then
           begin
             ATempList.Add(ATempMask);
             ATempMask := ''; // clear it
           end
        else if IQMS.Common.StringUtils.StrInList(AMaskText[i], [',',';']) then
           begin
             if (Pos('*',ATempMask) = 0) then
                ATempMask := '*' + ATempMask;
             if (Pos('.',ATempMask) = 0) then
                ATempMask := ATempMask + '.*';
             ATempList.Add(ATempMask);
             ATempMask := ''; // clear it
           end
        else
           ATempMask := ATempMask + AMaskText[i];
      end;

     if ATempMask > '' then
        begin
          if (Pos('*',ATempMask) = 0) then
             ATempMask := '*' + ATempMask;
          if (Pos('.',ATempMask) = 0) then
             ATempMask := ATempMask + '*.*';
          ATempList.Add(ATempMask);
        end;

     // update masks
     ATempMask := '';
     for i := 0 to ATempList.Count - 1 do
     begin
       ATempMask := ATempList.Strings[i]; // get mask text
       if (ATempMask = '') then CONTINUE;
       // fix up the mask
       if (Pos('.', ATempMask) = 0) and (Pos('*', ATempMask) = 0) then
          AMasks.Add(Format('*%s*', [ATempMask]))
       else AMasks.Add(ATempMask);
     end;

     // Ensure we have a mask
     if (AMasks.Count = 0) or (Trim(AMasks.Text)='') then
        AMasks.Text := '*';

  finally
    ATempList.Free;
  end;
end;

function ShortDirectoryName(Dir: String): String;
var
   Buffer: Cardinal;
   S: String;
begin
  SetLength(S, Buffer);
  GetShortPathName(PChar(Dir), PChar(S), Buffer);
  Result := IncludeTrailingPathDelimiter(Trim(S));
end;

function ShortDirectoryAndFileName(AFileName: String): String;
var
   APath: String;
begin
  APath := ExtractFilePath(AFileName);
  APath := System.SysUtils.ExtractShortPathName(APath);
  Result := IncludeTrailingPathDelimiter(APath) + ExtractFileName(AFileName);
end;

{OBSOLETE:  Doesn't work predictably}
{function ToRecycleBin( Sender: TComponent; AFileName: String ): Boolean;
var
 Ret  : Integer;
 ipFileOp : TSHFileOpStruct;
begin
   // Send a file located on the hard disk to the Recycle Bin.
   // This will not work with files on a removeable or a network
   // drive.
   try
     FillChar( ipFileOp, SizeOf( ipFileOp ), 0 );
     with ipFileOp do
     begin
         // Get handle
         if Sender is TForm then
            wnd := TForm( Sender ).Handle
         else
            wnd := Application.Handle;

         wFunc           := FO_DELETE;
         pFrom           := pChar( AFileName );
         pTo                   := pChar( '' );
         fFlags           := FOF_ALLOWUNDO;
         fAnyOperationsAborted := False;
         hNameMappings   := NIL;
         lpszProgressTitle     := '';
      end;

     try
      Ret                      := SHFileOperation(ipFileOp);
      Result                   := ipFileOp.fAnyOperationsAborted;
     except
      Ret := 1;
     end;

     Result := (Ret = 0);
   except
   end;
end;    }


procedure DeleteFilesOlderThan( AFileMask: string; ADays: Real );
var
  SearchRec : TSearchRec;
  FindResult: Integer;
begin
  FindResult:= FindFirst( AFileMask, faAnyFile, SearchRec );
  try
    while FindResult = 0 do
    begin
      if FileDateToDateTime( SearchRec.Time ) + ADays < Date then
         DeleteFile( ExtractFilePath( AFileMask ) + SearchRec.Name );
      FindResult:= FindNext( SearchRec );
    end;
  finally
    FindClose( SearchRec );
  end;
end;


function FileNameNoExt(const AFileName: string ): string;
var
  I: Integer;
begin
  // Convert Linux path delim to system delim.
  Result:= FileNameOnly(AFileName); // see below
  if ExtractFileExt( Result ) > '' then
  begin
     I:= Pos( ExtractFileExt( Result ), Result );
     Result:= Copy(Result, 1, I - 1);
  end;
end;

function FileNameOnly(const AFileName: String ): string;
var
  I: Integer;
begin
  I := AFileName.LastDelimiter(PathDelim + DriveDelim);
  // Compensate for Linux path
  if I = -1 then
    I := AFileName.LastDelimiter('/' + DriveDelim);
  Result := AFileName.SubString(I + 1);
end;

function FilePathOnly(const AFileName: string): string;
var
  I: Integer;
begin
  I := AFileName.LastDelimiter(PathDelim + DriveDelim);
  // Compensate for Linux path
  if I = -1 then
    I := AFileName.LastDelimiter('/' + DriveDelim);
  Result := AFileName.SubString(0, I + 1);
end;

function SetFileDate(AFileName: TFileName; AFileAge: Integer ): Boolean;
var
   AFileHandle: Integer;
   AErrCode   : Integer;
   ro: Boolean;
begin
  try
     // 07/08/2010 Must remove write protection to set the file date,
     // or an error will occur. (Byron).
     ro := IsFileReadOnly(AFileName);
     if ro then
        SetFileReadOnly(AFileName, False);

     // Open the file and return the handle
     AFileHandle:= FileOpen(AFileName, fmOpenReadWrite or fmShareDenyNone );

     // Check if file is opened successfully.
     // If not raise exception
     if AFileHandle <= 0 then
        raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000106 {'Unable to open file %s'}, [ AFileName ]);

     // Set the new datetime for the file
     try
        // Set DOS datetime stamp of the file, using the handle
        AErrCode:= FileSetDate( AFileHandle, AFileAge );
        // Return an error code if unsuccessfull and raise exception
        if AErrCode <> 0 then
           raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000105 {'Unable to change %s timestamp. Error Code = %d'}, [ AFileName, AErrCode ]);
     finally
        FileClose( AFileHandle ); // Close file handle
     end;
  finally
     SetFileReadOnly(AFileName, ro);
  end;
end;

function SetFileDateEx(ASourceFile, ATargetFile: TFileName ): Boolean;
var
   AFileHandle: Integer;
   AErrCode   : Integer;
   AFileAge: Integer;
   ro: Boolean;
begin
  try
     // 07/08/2010 Must remove write protection to set the file date,
     // or an error will occur. (Byron).
     ro := IsFileReadOnly(ATargetFile);
     if ro then
        SetFileReadOnly(ATargetFile, False);

     // Get the file age of the source file
     AFileAge := FileAge( ASourceFile );
     // Open the file and return the handle
     AFileHandle:= FileOpen(ATargetFile, fmOpenReadWrite or fmShareDenyNone );

     // Check if file is opened successfully.
     // If not raise exception
     if AFileHandle <= 0 then
        raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000106 {'Unable to open file %s'}, [ ATargetFile ]);

     // Set the new datetime for the file
     try
        // Set DOS datetime stamp of the file, using the handle
        AErrCode:= FileSetDate( AFileHandle, AFileAge );
        // Return an error code if unsuccessfull and raise exception
        if AErrCode <> 0 then
           raise Exception.CreateFmt( IQMS.Common.ResStrings.cTXT0000105 {'Unable to change %s timestamp. Error Code = %d'}, [ ATargetFile, AErrCode ]);
     finally
        FileClose( AFileHandle ); // Close file handle
     end;
  finally
     SetFileReadOnly(ATargetFile, ro);
  end;
end;

function GetFileDate(AFileName: String): TDateTime;
var
   AHandle: THandle;
   AStruct: TOFSTRUCT;
   ALastWritten: integer;
begin
  Result := 0;
  if not FileExists(AFileName) then Exit;
  AHandle := OpenFile( PAnsiChar(AFileName), AStruct, OF_SHARE_DENY_NONE);
  try
     if AHandle<>HFILE_ERROR then
        begin
             ALastWritten:=FileGetDate(AHandle);
             Result:= FileDateToDateTime(ALastWritten);
        end;
  finally
     _lclose(AHandle);
  end;
end;

function EnsureUniqueFileName(const AFileName: string): string;
var
  i: Integer;
  APath, AName, AExt: string;
begin
  Result := AFileName;
  i := 1;
  if FileExists(Result) then
  begin
    APath := ExtractFilePath(Result);
    AName := FileNameNoExt(Result);
    AExt := ExtractFileExt(Result);
    repeat
      Result := Format('%s%s (%d)%s', [APath, AName, i, AExt]);
      Inc(i);
    until not FileExists(Result);
  end;
end;


function IsLocalFile(const AFileName: TFileName): Boolean;
var
  ADrive: string;
begin
  // is the file a local file (not networked)?
  ADrive := ExtractFileDrive(AFileName);
  Result := ( GetDriveType( PChar( ADrive )) in [ DRIVE_REMOVABLE, DRIVE_FIXED ] );
end;

function IsDiskFile(ALinkName: String): Boolean;
begin
  // Execute the file externally -- do not display embedded in WebBrowser.
  Result := IsLocalFile(ALinkName);
  if not Result then
     begin
       Result := ( Pos( 'http://' , ALinkName ) = 0 ) and
                 ( Pos( 'https://', ALinkName ) = 0 ) and
                 ( Pos( 'ftp://'  , ALinkName ) = 0 ) and
                 ( Pos( 'mailto:' , ALinkName ) = 0 );
     end;
end;

function IQGetFileSize(AFileName: string): Integer;
var
  ASearchRec: TSearchRec;
begin
  // 11/20/2014 (Byron)  Get the file size without opening it.  Replaced old
  // method to avoid errors if the file is already opened.
  try
    if FindFirst(AFileName, faAnyFile, ASearchRec) = 0 then
      Result := Int64(ASearchRec.FindData.nFileSizeHigh) shl Int64(32) +
        Int64(ASearchRec.FindData.nFileSizeLow)
    else
      Result := 0;
    FindClose(ASearchRec);
  except // suppress errors
    Result := 0;
  end;
end;

function IQGetFileSizeStr( AFileName: string ): String;
var
   ASize: String;
   ABSize,
   AKSize,
   AMSize,
   AGSize: Real;
begin
  Result := '';

  if not FileExists(AFileName) then Exit;

  // get the file size in KB
  ABSize := IQGetFileSize(AFileName);
  AKSize := ABSize / 1024;
  AMSize := AKSize / 1024;
  AGSize := AMSize / 1024;

  if AGSize > 1 then ASize := Format( '%s GB', [FormatFloat('#,###.##', AGSize)])
  else if AMSize > 1 then ASize := Format( '%s MB', [FormatFloat('#,###.##', AMSize)])
  else if AGSize > 1 then ASize := Format( '%s GB', [FormatFloat('#,###.##', AGSize)])
  else if AKSize > 1 then ASize := Format( '%s KB', [FormatFloat('#,###.##', AKSize)])
  else ASize := Format( '%d Bytes', [Trunc(ABSize)]);

  Result := ASize;
end;

{  -- Begin First File Instance -- }
function GetFirstFileInstance( AFileToFind: String; var ALocationResult: String ): Boolean;
var
   i: Integer;
   C: String;
   DType: Integer;
begin

     // Loop from A..Z to determine available drives
     for i := 65 to 90 do
         begin

              // Format a string to represent the root directory.
              C := chr(i)+':\';

              // Call the GetDriveType() function which returns an integer
              // value representing one of the types shown in the case statement
              // below
              DType := GetDriveType(PChar(C));

              // Only add drive types that can be determined.
              if DType = DRIVE_FIXED then
                 begin
                      Result := FindFirstFileInstance( C, AFileToFind, ALocationResult );
                      if Result = TRUE then BREAK;
                 end;
         end;
end;

function FindFirstFileInstance( ADirectory, AFileName: String;
                                var ALocation: String ): Boolean;
// Finds the first location of a file
var
  FSearchRec, DSearchRec  : TSearchRec;
  FindResult              : integer;

  function IsDirNotation( ADirName: String ): Boolean;
  begin
    Result := (ADirName = '.') or (ADirName = '..');
  end;

begin
  Result := FALSE;
  ADirectory := StrTran( ADirectory + '\', '\\', '\');
  { Find the first occurence of the specified file name }

  try
     ALocation := ADirectory + AFileName;
     if FileExists( ALocation ) then
        begin
             Result    := TRUE;
             Exit;
        end;

     // Search sub-directories of this current directory.
     FindResult := FindFirst( ADirectory + '*.', faDirectory, DSearchRec);

     try
        while FindResult = 0 do
             begin
                  if ( (DSearchRec.Attr and faDirectory) = faDirectory ) and
                     not ( IsDirNotation( DSearchRec.Name )) then
                         begin
                              if FindFirstFileInstance( ADirectory + DSearchRec.Name, AFileName, ALocation ) = TRUE then // Recursion here
                                 begin
                                      Result    := TRUE;
                                      BREAK;
                                 end;
                         end;
                  FindResult:= FindNext( DSearchRec );
             end;
     finally
         FindClose( DSearchRec );
     end;
  finally
       FindClose(FSearchRec);
  end;
end;
{  -- End First File Instance -- }

function IsFileReadOnly(const AFileName: String): Boolean;
var
   Attributes: Word;
begin
  Attributes := System.SysUtils.FileGetAttr(AFileName);
  Result := System.SysUtils.FileExists(AFileName) and
            (Attributes and System.SysUtils.faReadOnly = System.SysUtils.faReadOnly);
end;

procedure SetFileReadOnly(const AFileName: String; const AReadOnly: Boolean);
var
   ro: Boolean; // current ro
   Attributes: Word;
begin
  ro := IsFileReadOnly(AFileName); // see above, this unit.
  Attributes := System.SysUtils.FileGetAttr(AFileName);
  if AReadOnly and not ro then
     System.SysUtils.FileSetAttr(AFileName, System.SysUtils.faReadOnly)
  else if not AReadOnly and ro then
     System.SysUtils.FileSetAttr(AFileName, Attributes xor System.SysUtils.faReadOnly);
end;

function IsFileHidden(const AFileName: String): Boolean;
var
   Attributes: Word;
begin
  Attributes := System.SysUtils.FileGetAttr(AFileName);
  Result := System.SysUtils.FileExists(AFileName) and
            (Attributes and System.SysUtils.faHidden = System.SysUtils.faHidden);
end;

procedure SetFileHidden(const AFileName: String; const AHidden: Boolean);
var
   hd: Boolean; // current ro
   Attributes: Word;
begin
  hd := IsFileHidden(AFileName); // see above, this unit.
  Attributes := System.SysUtils.FileGetAttr(AFileName);
  if AHidden and not hd then
     System.SysUtils.FileSetAttr(AFileName, System.SysUtils.faHidden)
  else if not AHidden and hd then
     System.SysUtils.FileSetAttr(AFileName, Attributes xor System.SysUtils.faHidden);
end;

procedure RemoveWriteProtection(const AFileName: TFileName);
begin
  if ( FileExists( AFileName )) then
     begin
       if IsFileReadOnly(AFileName) then
          SetFileReadOnly(AFileName, False);
       if IsFileHidden(AFileName) then
          SetFileHidden(AFileName, False);
     end;
end;

procedure ShowFileProperties(AFileName: TFileName);
var
   sei: TShellExecuteInfo;
begin
     FillChar(sei, SizeOf(sei), 0);
     sei.cbSize := SizeOf(sei);
     sei.lpFile := PChar(AFileName);
     sei.lpVerb := 'properties';
     sei.fMask  := SEE_MASK_INVOKEIDLIST;
     ShellExecuteEx(@sei);
end;

function SendToRecycleBin( Sender: TComponent; AFileName: TFileName ): Boolean;
var
  AFileOp : TSHFileOpStruct;
  AList: TStringList;
  i: Integer;
  S: string;
  AHasErrors: Boolean;
begin
  Result := False;
  AList := nil;
  AHasErrors := False; // initialize

  // First, attempt to send the file to the Windows Recycle bin
  FillChar(AFileOp, SizeOf(AFileOp), 0);
  with AFileOp do
  begin
    wFunc  := FO_DELETE;
    pFrom  := PChar( AFileName );
    fFlags := FOF_ALLOWUNDO or FOF_SILENT;
  end;
  // Do we have errors?
  Result := (0 = ShFileOperation(AFileOp));
  AHasErrors := not Result;
  // The actual result of the prompt
  Result := (AFileOp.fAnyOperationsAborted = False);

  // Do we have errors?
  if (Result and not AHasErrors) or not Result then
    Exit;

  // If we have errors, then let's try and delete the file list in the usual
  // way.  But first we prompt the user.
  if AHasErrors then
    Result := IQConfirmYN('Delete file?');
  if not Result then
    Exit;

  AHasErrors := FALSE; // re-initialize
  AList := TStringList.Create;
  try
    AList.Text := StrTran( AFileName, #0, #13 );
    for i := 0 to AList.Count - 1 do
    begin
      // Fix the file name.  On some machines it does not matter,
      // but on others it does.  I added this in response to
      // bug report from Jason (08/19/2003).
      S := AList.Strings[i];
      S := Trim( StrTran( S, '"', '' ));

      // Delete the file
      Result := DeleteFile( S ); // sysutils

      if not Result then
        AHasErrors := TRUE;
    end;
  finally
    FreeAndNil( AList );
  end;

  //if AHasErrors then
  //   IQError('One or more files could not be deleted.');
end;

function IsProcessRunning(AProcess: string): Boolean;
begin
  Result := IsProcessRunningA(AProcess, False);
end;

function IsProcessRunningA(AProcess: string;
  AFilterCurrentUser: Boolean): Boolean;
var
  AUserName: string;
begin
  AUserName := IQMS.Common.SysInfo.GetMachineUser;
  Result := IsProcessRunningB(AProcess, AUserName, AFilterCurrentUser);
end;

function IsProcessRunningB(AProcess: string; AUserName: string;
  AFiltered: Boolean): Boolean;
var
  bLoop: BOOL;
  aSnapshotHandle: THandle;
  aProcessEntry32: TProcessEntry32; // declared in TLHelp32.pas
  AProcessName, AProcessDomain, AProcessUserName: string;
  AUserAccept: Boolean;
type
  PTokenUser = ^TTokenUser;

  TTokenUser = packed record
    User: SID_AND_ATTRIBUTES;
  end;

  function GetProcessUserName(nProcessID: Cardinal;
    out sDomain, sUser: string): Boolean;
  var
    ProcessHandle, ProcessToken: THandle;
    InfoSize, UserNameSize, DomainNameSize: Cardinal;
    ATokenUser: PTokenUser;
    ANameUse: SID_NAME_USE;
    _DomainName, _UserName: array [0 .. 255] of Char;
  begin
    Result := False;
    sDomain := '';
    sUser := '';

    ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,
      False, nProcessID);
    if ProcessHandle = 0 then
      Exit;

    try
      if not OpenProcessToken(ProcessHandle, TOKEN_QUERY, ProcessToken) then
        Exit;

      try
        GetTokenInformation(ProcessToken, TokenUser, nil, 0, InfoSize);
        ATokenUser := AllocMem(InfoSize * 2);
        try
          if GetTokenInformation(ProcessToken, TokenUser, ATokenUser, InfoSize * 2,
            InfoSize) then
            begin
              DomainNameSize := SizeOf(_DomainName);
              UserNameSize := SizeOf(_UserName);

              Result := LookupAccountSid(nil, ATokenUser^.User.Sid, _UserName,
                UserNameSize, _DomainName, DomainNameSize, ANameUse);

              if Result then
                begin
                  SetString(sDomain, _DomainName, StrLen(_DomainName));
                  SetString(sUser, _UserName, StrLen(_UserName));
                end;
            end;
        finally
          FreeMem(ATokenUser);
        end;
      finally
        CloseHandle(ProcessToken);
      end;
    finally
      CloseHandle(ProcessHandle);
    end;
  end;

begin
  Result := False;
  AUserAccept := True; // default
  aSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  try
    aProcessEntry32.dwSize := SizeOf(aProcessEntry32);
    bLoop := Process32First(aSnapshotHandle, aProcessEntry32);
    AProcess := UpperCase(AProcess);
    while integer(bLoop) <> 0 do
    begin
      if AFiltered then
      begin
        GetProcessUserName(aProcessEntry32.th32ProcessID, AProcessDomain, AProcessUserName);
        AUserAccept := (AProcessUserName > '') and (CompareText(AProcessUserName, AUserName) = 0);
      end;
      AProcessName := UpperCase(ExtractFileName(aProcessEntry32.szExeFile));
      Result := AUserAccept and (CompareText(AProcessName, AProcess) = 0);
      if Result or not Process32Next(aSnapshotHandle, aProcessEntry32) then
        BREAK;
    end;
  finally
    CloseHandle(aSnapshotHandle);
  end;
end;

procedure WriteLineToFile(const AText, AFileName: String; var AError: String);
var
   AFile : TextFile;
   ADir: String;
begin
  {$I-}

  if AFileName = '' then Exit;

  // This method handles writing text to a text file
  try
     ADir := ExtractFilePath(AFileName); // get just the directory name
     ForceDirectories(ADir); // make sure the directory exists
     AssignFile( AFile, AFileName  ); // assign the file

     // Create the file if it does not already exist
     if ( not FileExists( AFileName )) then
        Rewrite( AFile );

     if ioresult = 0 then  // return status of the last I/O operation performed
     try
        // Write the text to the end of the file
        Append( AFile );
        Writeln( AFile, AText );
     finally
       Flush( AFile );     // empty buffer of the file opened for output
       CloseFile( AFile ); // terminate association between file variable and an external disk file
     end;
  except on E:Exception do
    AError := E.Message;
  end;
end;

{ FileExistsDlg - File Exists dialog }
function FileExistsDlg(const ATargetFileName: String;
                         var AActualFileName: String;
                         AOpenDlgFilter: String): Boolean;
begin
  // Initialize
  AActualFileName := '';

  // Basic check for the existence of this file
  Result := FileExists(ATargetFileName);

  // If found, then return True and file name
  if Result then
     AActualFileName := ATargetFileName

  // The file was not found; display form
  {*UG_rem_AE*}
//  else
//    with TFrmFindFileWizard.Create(Application.MainForm, ATargetFileName, AOpenDlgFilter) do
//    try
//       Result := (ShowModal = mrOk);
//       if Result then
//          AActualFileName := SelectedFile;
//    finally
//       Free;
//    end;
end;

function ExeDir: String;
begin
  Result := ExtractFileDir(Application.ExeName);
  if Result = '' then Result := GetCurrentDir;
  Result := GetDirectoryName(Result);
end;

function ExeFileName: String;
begin
  Result := ExtractFileName(Application.ExeName);
end;

function ExeFileNameNoExt: String;
begin
  Result := FileNameNoExt(Application.ExeName);
end;

function OriginalExeName: string;
var
  AExeName, AValue: string;
  AHandle, ALen: Cardinal;
  ASize: Integer;
  ABuffer: PChar;
begin
  // Get the application executable name.  This will include the path.
  AExeName := Application.ExeName;
  // By default, return the executable name
  Result := ExtractFileName(AExeName);
  // Now attempt to access the properties of this file to
  // get the original file name
  ASize := GetFileVersionInfoSize(PWideChar(AExeName), AHandle);
  // If successfull, there will be a size value
  if ASize > 0 then
  begin
    ABuffer := AllocMem(ASize);
    try
      GetFileVersionInfo(PWideChar(AExeName), 0, ASize, ABuffer);
      // The result is contained in AValue, which should only have the value
      // we want.  If this fails, either the pointer will be nil (null), or
      // the string length of the value will be greater than the allocated
      // size.
      if VerQueryValue(ABuffer,
        PWideChar('StringFileInfo\040904E4\OriginalFilename'), Pointer(AValue),
        ALen) and (Pointer(AValue) <> nil) and (Length(AValue) <= ASize) then
        // Return the trimmed value
        Result := PChar(Trim(AValue));
    finally
      FreeMem(ABuffer, ASize);
    end;
  end;
end;

function ExeCompanyName: string;
var
  AExeName, AValue: string;
  AHandle, ALen: Cardinal;
  ASize: Integer;
  ABuffer: PChar;
begin
  // By default, return an empty string
  Result := '';
  // Get the application executable name.  This will include the path.
  AExeName := Application.ExeName;
  // Now attempt to access the properties of this file to
  // get the original file name
  ASize := GetFileVersionInfoSize(PWideChar(AExeName), AHandle);
  // If successfull, there will be a size value
  if ASize > 0 then
  begin
    ABuffer := AllocMem(ASize);
    try
      GetFileVersionInfo(PWideChar(AExeName), 0, ASize, ABuffer);
      // The result is contained in AValue, which should only have the value
      // we want.  If this fails, either the pointer will be nil (null), or
      // the string length of the value will be greater than the allocated
      // size.
      if VerQueryValue(ABuffer,
        PWideChar('StringFileInfo\040904E4\CompanyName'), Pointer(AValue),
        ALen) and (Pointer(AValue) <> nil) and (Length(AValue) <= ASize) then
        // Return the trimmed value
        Result := PChar(Trim(AValue));
    finally
      FreeMem(ABuffer, ASize);
    end;
  end;
end;

function ExeInternalName: string;
var
  AExeName, AValue: string;
  AHandle, ALen: Cardinal;
  ASize: Integer;
  ABuffer: PChar;
begin
  // By default, return an empty string
  Result := '';
  // Get the application executable name.  This will include the path.
  AExeName := Application.ExeName;
  // Now attempt to access the properties of this file to
  // get the original file name
  ASize := GetFileVersionInfoSize(PWideChar(AExeName), AHandle);
  // If successfull, there will be a size value
  if ASize > 0 then
  begin
    ABuffer := AllocMem(ASize);
    try
      GetFileVersionInfo(PWideChar(AExeName), 0, ASize, ABuffer);
      // The result is contained in AValue, which should only have the value
      // we want.  If this fails, either the pointer will be nil (null), or
      // the string length of the value will be greater than the allocated
      // size.
      if VerQueryValue(ABuffer,
        PWideChar('StringFileInfo\040904E4\InternalName'), Pointer(AValue),
        ALen) and (Pointer(AValue) <> nil) and (Length(AValue) <= ASize) then
        // Return the trimmed value
        Result := PChar(Trim(AValue));
    finally
      FreeMem(ABuffer, ASize);
    end;
  end;
end;

function ShortToLongFileName(FileName: string): string;
var
  FindData: TWin32FindData;
  Search: THandle;
begin
  // Use GetLongPathName where available (Win98 and later) to avoid
  // Win98 SE problems accessing UNC paths on NT/2K/XP based systems
  if Assigned(GetLongPathName) then
  begin
    SetLength(Result, MAX_PATH + 1);
    SetLength(Result, GetLongPathName(PChar(FileName), @Result[1], MAX_PATH));
  end
  else
  begin
    Result := '';

    // Strip off one directory level at a time starting with the file name
    // and store it into the result. FindFirstFile will return the long file
    // name from the short file name.
    while (True) do
    begin
      Search := Winapi.Windows.FindFirstFile(PChar(FileName), FindData);

      if Search = INVALID_HANDLE_VALUE then
        Break;

      Result := string('\') + FindData.cFileName + Result;
      FileName := ExtractFileDir(FileName);
      Winapi.Windows.FindClose(Search);

      // Found the drive letter followed by the colon.
      if Length(FileName) <= 2 then
        Break;
    end;

    Result := ExtractFileDrive(FileName) + Result;
  end;
end;

procedure ZipFiles(const AZipFile: string; const AFiles: TStringList);
var
  i: Integer;
begin
  if Assigned(AFiles) then
    with TZipFile.Create do
      try
        Open(AZipFile, zmWrite);
        for i := 0 to AFiles.Count - 1 do
          if FileExists(AFiles.Strings[i]) then
            Add(AFiles.Strings[i]);
      finally
        Free;
      end;
end;

procedure ZipFiles(const AZipFile: string; const AFiles: array of string);
var
  i: Integer;
begin
  with TZipFile.Create do
    try
      Open(AZipFile, zmWrite);
      for i := Low(AFiles) to High(AFiles) do
        if FileExists(AFiles[i]) then
          Add(AFiles[i]);
    finally
      Free;
    end;
end;

procedure ZipFiles(const AZipFile: string; const ADirectory: string);
var
  ATargetDir: string;
begin
  // The zip file cannot be created in the same directory as the
  // directory where the files are located.  If it is in the same
  // directory, the library will create the file and attempt to
  // include it in the list.  It's a exceptionally stupid bug,
  // but what can we do?  We compensate.
  ATargetDir := ExtractFilePath(AZipFile);
  if CompareText(ATargetDir, ADirectory) = 0 then
    raise Exception.Create(
      'The archive file cannot be created in the same directory as ' +
      'the directory containing files to be compressed.  Please select ' +
      'a different archive file location.');

  // Delete the old file
  if FileExists(AZipFile) then
    DeleteFile(AZipFile);

  // Zip the directory.  This keeps the directory structure.
  with TZipFile.Create do
    try
      ZipDirectoryContents(AZipFile, ADirectory);
    finally
      Free;
    end;
end;

procedure UnzipFiles(const AZipFile: string; ATargetDir: string);
begin
  ForceDirectories(ATargetDir);
  with TZipFile.Create do
    try
      if FileExists(AZipFile) and IsValid(AZipFile) then
        ExtractZipFile(AZipFile, ATargetDir);
    finally
      Free;
    end;

{ Alternate method:
  with TZipFile.Create do
    try
      if FileExists(AZipFile) and IsValid(AZipFile) then
        begin
          Open(AZipFile, TZipMode.zmRead);
          for i := 0 to FileCount - 1 do
            Extract(i, ATargetDir, True);
        end;
    finally
      Free;
    end;}
end;

function OpenFolderAndSelectFile(const FileName: string): Boolean;
var
  DidInitCOM: boolean;
  IIDL: PItemIDList;
  TheValue: HRESULT;
begin
  Result := false;
  DidInitCOM := false;
  try
    IIDL := ILCreateFromPath(PChar(FileName));
    if (IIDL <> nil) then
      try
        TheValue := SHOpenFolderAndSelectItems(IIDL, 0, Nil, 0);
        If TheValue <> S_OK then
          begin
            If TheValue = $800401F0 { CO_E_NOTINITIALIZED } then
              begin
                DidInitCOM := Succeeded(CoInitialize(nil));
                if DidInitCOM then
                  TheValue := SHOpenFolderAndSelectItems(IIDL,
                    0, nil, 0);
              end;
          end;
        Result := TheValue = S_OK;
      finally
        ILFree(IIDL);
      end;
  finally
    if DidInitCOM then
      CoUninitialize;
  end;
end;

function OracleFD_FileExists(const AOracleDirName : string; const AFileName: string; var ASize : Real; AFDConnection : TFDConnection = nil  ): Boolean;
begin
  with TFDStoredProc.Create(nil) do
  try
    {*UG_rem_AE*}
//    if Assigned( AFDConnection ) then
//      Connection:=  AFDConnection
//    else
//      Connection := DB_DataModule.FDConnection1;
    StoredProcName:= 'IQMS.IQFILE.ORA_FILE_EXISTS';
    Params.CreateParam( ftString, 'P_ORADIR_NAME', ptInput ).asString     := AOracleDirName;
    Params.CreateParam( ftString, 'P_FILENAME'   , ptInput ).asString     := AFileName;
    Params.CreateParam( ftFMTBcd, 'P_SIZE'       , ptInputOutput).AsFMTBCD:= ASize;
    Prepare;
    ExecProc;
    ASize := ParamByName( 'P_SIZE' ).asFloat;
    Result:= ParamByName( 'RESULT' ).AsBoolean;
  finally
    Free;
  end;
end;

function OracleFD_FindStrInTextFile(const AFindStr, AOracleDirName, AFileName: string; var AFileExists : Boolean; AFDConnection : TFDConnection = nil   ) : Boolean;
begin
  with TFDStoredProc.Create(nil) do
  try
    {*UG_rem_AE*}
//    if Assigned( AFDConnection ) then
//      Connection:=  AFDConnection
//    else
//      Connection := DB_DataModule.FDConnection1;
    StoredProcName:= 'IQMS.IQFILE.ORA_FIND_STR_IN_TXT_FILE';
    Params.CreateParam( ftString, 'P_FIND_STR', ptInput ).asString     := AFindStr;
    Params.CreateParam( ftString, 'P_ORADIR_NAME', ptInput ).asString  := AOracleDirName;
    Params.CreateParam( ftString, 'P_FILENAME'   , ptInput ).asString  := AFileName;
    Params.CreateParam( ftBoolean,'P_FILE_EXISTS', ptOutput);
    Prepare;
    ExecProc;
    AFileExists := ParamByName( 'P_FILE_EXISTS' ).AsBoolean;
    Result      := ParamByName( 'RESULT' ).AsBoolean;
  finally
    Free;
  end;
end;

function OracleSqlExpr_FileExists(const AOracleDirName : string; const AFileName: string; var ASize : Real; ASQLExprConnection : Data.SqlExpr.TSQLConnection = nil ): Boolean;
begin
  with TSQLStoredProc.Create(nil) do
  try
    {*UG_rem_AE*}
//    if Assigned( ASQLExprConnection ) then
//      SQLConnection:=  ASQLExprConnection
//    else
//      SQLConnection := DB_DataModule.SQLConnection;
    StoredProcName:= 'IQMS.IQFILE.ORA_FILE_EXISTS';
    Params.CreateParam( ftString, 'P_ORADIR_NAME', ptInput ).asString     := AOracleDirName;
    Params.CreateParam( ftString, 'P_FILENAME'   , ptInput ).asString     := AFileName;
    Params.CreateParam( ftFMTBcd, 'P_SIZE'       , ptInputOutput).AsFMTBCD:= ASize;
    PrepareStatement;
    ExecProc;
    ASize := ParamByName( 'P_SIZE' ).asFloat;
    Result:= ParamByName( 'RESULT' ).AsBoolean;
  finally
    Free;
  end;
end;

function OracleSqlExpr_FindStrInTextFile(const AFindStr, AOracleDirName, AFileName: string; var AFileExists : Boolean; ASQLExprConnection : Data.SqlExpr.TSQLConnection = nil  ) : Boolean;
begin
  with TSQLStoredProc.Create(nil) do
  try
    {*UG_rem_AE*}
//    if Assigned( ASQLExprConnection ) then
//      SQLConnection:=  ASQLExprConnection
//    else
//      SQLConnection := DB_DataModule.SQLConnection;
    StoredProcName:= 'IQMS.IQFILE.ORA_FIND_STR_IN_TXT_FILE';
    Params.CreateParam( ftString, 'P_FIND_STR', ptInput ).asString     := AFindStr;
    Params.CreateParam( ftString, 'P_ORADIR_NAME', ptInput ).asString  := AOracleDirName;
    Params.CreateParam( ftString, 'P_FILENAME'   , ptInput ).asString  := AFileName;
    Params.CreateParam( ftBoolean,'P_FILE_EXISTS', ptOutput);
    PrepareStatement;
    ExecProc;
    AFileExists := ParamByName( 'P_FILE_EXISTS' ).AsBoolean;
    Result      := ParamByName( 'RESULT' ).AsBoolean;
  finally
    Free;
  end;
end;

initialization
begin
  KernelHandle := GetModuleHandle('KERNEL32');
  if KernelHandle <> 0 then
    @GetLongPathName := GetProcAddress(KernelHandle, 'GetLongPathNameA');
end;

end.

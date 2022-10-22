unit IQMS.Common.MemMap;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms;

type
  EMMFError = class(Exception);

  TMemMapFile = class
  private
    FFileName: String;          // File name of the mapped file.
    FSize: Longint;             // Size of the mapped view
    FFileSize: Longint;         // Actual File Size
    FFileMode: Integer;         // File access mode
    FFileHandle: THandle;       // File handle
    FMapHandle: THandle;        // Handle to the file mapping object.
    FMakeNull : Boolean;
    FLocalCopy: Boolean;
    FData    : PByte;
    FPosition: PByte;
    FErrorMesg: string;
    procedure SetFileName( const S:string );
    procedure AllocFileHandle;  // Retrieves a handle to the disk file
    procedure AllocFileMapping; // Retrieves a file-mapping object handle
    procedure AllocFileView;    // Maps a view to the file
    function GetSize: Longint;  // Returns the size of the mapped view
    function GetOffset: Longint;
    procedure SetOffset( AValue : Longint );
    procedure FreeHandles;
    procedure FreeFileHandle;
    procedure FreeMapHandle;
    function GetFieldAt( I : Integer ):Pointer;
  public
    constructor Create( const AFileName: string; FileMode: Integer; CreateLocalCopy: Boolean ); virtual;
    destructor Destroy; override;
    procedure FreeMapping;
    procedure CheckError;
    property Data: PByte read FData;
    property Size: Longint read GetSize;
    property FileName: String read FFileName write SetFileName;
    property FileHandle: THandle read FFileHandle;
    property MapHandle: THandle read FMapHandle;
    property ErrorMesg: string read FErrorMesg write FErrorMesg;
    property Position: PByte read FPosition write FPosition;
    property Offset: LongInt read GetOffset write SetOffset;
    property FieldAt[I:Integer]: Pointer read GetFieldAt;
  end;

implementation

uses
  IQMS.Common.ResStrings;

constructor TMemMapFile.Create(const AFileName: string; FileMode: Integer; CreateLocalCopy: Boolean );
var
  TmpPtr: PChar;
begin
  try
     FErrorMesg:= '';
     FLocalCopy:= CreateLocalCopy;
     FFileMode := FileMode;
     FileName  := AFileName;                // Assign Name AND copy file to a local dir
     FMakeNull := FileMode = fmOpenReadWrite;

     AllocFileHandle;                       // Obtain a file handle of the disk file.
     AllocFileMapping;                      // Get the file mapping object handle.
     AllocFileView;                         // Map the view of the file

     if FMakeNull then                      // Add a null-terminator.
     begin
       PByte(TmpPtr) := FData;
       Inc(TmpPtr, FFileSize + 1);
       TmpPtr^ := #0;
     end;

     FreeFileHandle;
     FreeMapHandle;
  except on E:Exception do
     begin
       FErrorMesg:= E.Message;
       FreeHandles;
     end;
  end;
end;

destructor TMemMapFile.Destroy;
begin
  { If FMakeNull is true, then set the file pointer to the actual end of the file not counting the null-terminating character. }
  if FMakeNull then
    SetFilePointer(FFileHandle, FFileSize, NIL, FILE_BEGIN);
  FreeHandles;
  inherited Destroy;
end;

procedure TMemMapFile.FreeHandles;
begin
  FreeFileHandle;
  FreeMapHandle;
  FreeMapping;
end;

procedure TMemMapFile.FreeMapping;
begin
  if FData <> Nil then begin
    UnMapViewOfFile(FData);
    FData := NIL;
  end;
end;

procedure TMemMapFile.FreeFileHandle;
begin
  if FFileHandle <> 0 then
  begin
    CloseHandle(FFileHandle);
    FFileHandle:= 0;
  end;
end;

procedure TMemMapFile.FreeMapHandle;
begin
  if FMapHandle <> 0 then
  begin
    CloseHandle(FMapHandle);
    FMapHandle:= 0;
  end;
end;

function TMemMapFile.GetSize: Longint;
begin
  if not FMakeNull then
    Result := FSize
  else
    Result := FFileSize;
end;

procedure TMemMapFile.SetFileName( const S:string );
begin
  if (FFileMode = fmCreate) or not FLocalCopy then
     FFileName:= S
  else begin
     FFileName:= ExtractFilePath( Application.ExeName ) + ExtractFileName( S );
     if CompareText( FFileName, S ) <> 0 then
        if not CopyFile( PChar(S), PChar(FFileName), FALSE ) then
           raise EMMFError.CreateFmt( IQMS.Common.ResStrings.cTXT0000065 {'Unable to copy %s to %s. Error Code = %d'}, [S, FFileName, GetLastError]);
  end;
end;

procedure TMemMapFile.AllocFileHandle;
begin
  if FFileMode = fmCreate then
    FFileHandle := FileCreate(FFileName)
  else
    FFileHandle := FileOpen(FFileName, FFileMode);

  if FFileHandle < 0 then
    // 'Failed to open or create file. Error Code = %d'
    raise EMMFError.CreateFmt(IQMS.Common.ResStrings.cTXT0000194, [GetLastError]);

  FFileSize := GetFileSize(FFileHandle, Nil);
  if FMakeNull then
     FSize := FFileSize + 1
  else
     FSize := FFileSize;
end;

procedure TMemMapFile.AllocFileMapping;
var
  ProtAttr: DWORD;
begin
  if (FFileMode and fmOpenRead) = fmOpenRead then         // obtain correct protection attribute
    ProtAttr := Page_ReadOnly
  else
    ProtAttr := Page_ReadWrite;

  FMapHandle := CreateFileMapping( FFileHandle, NIL, ProtAttr, 0, FSize, NIL ); // attempt to create file mapping of disk file
  if FMapHandle = 0 then
    // 'Failed to create file mapping. Error Code = %d'
    raise EMMFError.CreateFmt(IQMS.Common.ResStrings.cTXT0000195, [GetLastError]);
end;

procedure TMemMapFile.AllocFileView;
var
  Access: Longint;
begin
  if (FFileMode and fmOpenRead) = fmOpenRead then       // obtain correct file mode
    Access := File_Map_Read
  else
    Access := File_Map_All_Access;
  FData := MapViewOfFile(FMapHandle, Access, 0, 0, FSize);
  if FData = NIL then
    // 'Failed to map view of file. Error Code = %d'
    raise EMMFError.CreateFmt( IQMS.Common.ResStrings.cTXT0000196, [GetLastError]);
  FPosition:= FData;
end;

function TMemMapFile.GetOffset:LongInt;
begin
  Result:= LongInt(FPosition) - LongInt( FData );
end;

procedure TMemMapFile.SetOffset( AValue:LongInt );
begin
  if (AValue <= Size) and (AValue >= 0) then
    FPosition:= Pointer( LongInt( FData ) + AValue );
end;

function TMemMapFile.GetFieldAt( I : Integer ):Pointer;
begin
  Result:= Pointer( LongInt(Position) + I );
end;

procedure TMemMapFile.CheckError;
begin
  if ErrorMesg <> '' then
     raise EMMFError.Create( ErrorMesg );
end;

end.

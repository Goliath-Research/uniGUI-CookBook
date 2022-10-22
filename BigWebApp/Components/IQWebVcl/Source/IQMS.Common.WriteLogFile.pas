unit IQMS.Common.WriteLogFile;

(****************************************************************************
  *** IQMS Log File ***

  This unit contains the declaration for TIQLogFile.  The TIQLogFile object
  handles writing (appending) lines to a log file in real-time.  Meaning,
  you can establish a connection in memory to a log file and write lines
  to it directly.  When you free the TIQLogFile object, the connection to
  the file is also freed.

  ****************************************************************************)

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes;

type
  { TIQLogFile }
  TIQLogFile = class
  strict private
    { Private declarations }
    FFile: TextFile;
    FFileName: TFileName;
    FModified: Boolean;
    FProcessBatch: Boolean;
    FBatchSize: Integer;
    FList: TStringList;
    procedure FreeMemory;
    procedure CheckBatchWrite;
    procedure FlushBatchWrite;
    procedure WriteToFile(AText: String);
    procedure WriteToList(AText: String);
    procedure SetBatchSize(const Value: Integer);
  private
    procedure SetFileName(const Value: TFileName);
  public
    { Public declarations }
    constructor Create(AFileName: TFileName);
    destructor Destroy; override;
    /// <summary> Write text to the log file. </summary>
    procedure Write(AText: String);
    /// <summary>Clear lines stored in memory and delete the physical log
    /// file on the disk.</summary>
    procedure Clear;
    /// <summary> Display the log file. </summary>
    procedure Show;
  published
    /// <summary> Complete path and file name of the log to create. </summary>
    property FileName: TFileName read FFileName write SetFileName;
    /// <summary> Determine if the log file was modified. </summary>
    property Modified: Boolean read FModified;
    /// <summary> Indicate the number of lines that will be stored in memory
    /// before writing to the log file. </summary>
    property BatchSize: Integer read FBatchSize write SetBatchSize default 100;
    /// <summary>Indicate whether or not lines will be written to the log file
    /// in batches.  Set the number of lines in the BatchSize property.
    /// </summary>
    property ProcessBatch: Boolean read FProcessBatch write FProcessBatch;
  end;

implementation

uses
  IQMS.Common.Miscellaneous;

{$REGION 'TIQLogFile'}


constructor TIQLogFile.Create(AFileName: TFileName);
begin
  inherited Create;

  // Set the file name here when we create the object.  Once we set this, it
  // cannot be changed for this instance of TIQLogFile
  FileName := AFileName;
  FBatchSize := 100;

  FList := TStringList.Create;
end;

destructor TIQLogFile.Destroy;
begin
  // Free the connection to the file
  FlushBatchWrite;
  if Assigned(FList) then
    FreeAndNil(FList);
  FreeMemory;
  inherited Destroy;
end;

procedure TIQLogFile.FreeMemory;
begin
  if (FFileName = '') then
    Exit;
{$I-}
  Flush(FFile); // empty buffer of the file opened for output
  CloseFile(FFile);
  // terminate association between file variable and an external disk file
{$I+}
end;

procedure TIQLogFile.Write(AText: String);
begin
  if ProcessBatch then
    begin
      WriteToList(AText);
      CheckBatchWrite;
    end
  else
    WriteToFile(AText);
end;

procedure TIQLogFile.Clear;
begin
  DeleteFile(FFileName);
  Write('');
  FModified := FALSE;
end;

procedure TIQLogFile.Show;
begin
  if FileExists(FFileName) then
    IQMS.Common.Miscellaneous.ExecuteProgram(FFileName, SW_SHOWDEFAULT, '');
end;

procedure TIQLogFile.WriteToFile(AText: String);
begin
{$I-}
  if (FFileName = '') then
    Exit;

  // Ensure the directory path exists
  if not DirectoryExists(ExtractFilePath(FFileName)) then
    ForceDirectories(ExtractFilePath(FFileName));

  // If the file does not exist, then created it
  if (not FileExists(FFileName)) then
    Rewrite(FFile);

  if ioresult = 0 then // return status of the last I/O operation performed
    begin
      Append(FFile);
      Writeln(FFile, AText); // write an end-of-line marker to the file
      FModified := TRUE;
    end;
end;

procedure TIQLogFile.WriteToList(AText: String);
begin
  if not Assigned(FList) then
    FList := TStringList.Create;
  FList.Add(AText);
end;

procedure TIQLogFile.CheckBatchWrite;
var
  i: Integer;
begin
  if not ProcessBatch or not Assigned(FList) then
    Exit;
  if FList.Count >= BatchSize then
    begin
      // for i := 0 to FList.Count - 1 do
      // WriteToFile(FList.Strings[i]);
      WriteToFile(FList.Text);
      FList.Clear;
    end;
end;

procedure TIQLogFile.FlushBatchWrite;
var
  i: Integer;
begin
  if not ProcessBatch or not Assigned(FList) then
    Exit;
  WriteToFile(FList.Text);
  // for i := 0 to FList.Count - 1 do
  // WriteToFile(FList.Strings[i]);
  FList.Clear;
end;

procedure TIQLogFile.SetBatchSize(const Value: Integer);
begin
  if (Value < 5) then
    FBatchSize := 5
  else
    FBatchSize := Value;
end;

procedure TIQLogFile.SetFileName(const Value: TFileName);
begin
  FFileName := Value;
  // Assign the TextFile to the TextFile object
  if (FFileName > '') then
    AssignFile(FFile, FFileName);
end;

{$ENDREGION 'TIQLogFile'}

end.

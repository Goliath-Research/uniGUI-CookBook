unit dbtfile;

{*****************************************************************************}
{                                                                             }
{ Read and write to text files                                                }
{                                                                             }
{*****************************************************************************}

interface

uses
  Windows,
  SysUtils,
  Classes;

type
   { TDbtFile }
   TDbtFile = class
   private
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
   protected
   public
    constructor Create(AFileName: TFileName);
    destructor Destroy; override;
    procedure Write(AText: String);
    procedure Clear;
    procedure Show;
    procedure FlushBatch;
   published
    property FileName: TFileName read FFileName;
    property Modified: Boolean read FModified;
    property BatchSize: Integer read FBatchSize write SetBatchSize default 100;
    property ProcessBatch: Boolean read FProcessBatch write FProcessBatch;
end;

implementation

uses
  IQMS.Common.Miscellaneous;

{ ---------------------------------------------------------------------------- }
{ TDbtFile }
{ ---------------------------------------------------------------------------- }

constructor TDbtFile.Create(AFileName: TFileName);
begin
  inherited Create;
  
  // Set the file name here when we create the object.  Once we set this, it
  // cannot be changed for this instance of TDbtFile
  FFileName := AFileName;
  FBatchSize := 100;
  
  // Assign the TextFile to the TextFile object
  if (FFileName > '') then
     AssignFile(FFile, FFileName);

  FList:= TStringList.Create;
end;

destructor TDbtFile.Destroy;
begin
  // Free the connection to the file
  FlushBatchWrite;
  if Assigned(FList) then FreeAndNil(FList);
  FreeMemory;
  inherited Destroy;
end;

procedure TDbtFile.FreeMemory;
begin
  if (FFileName = '') then Exit;
  {$I-}
  Flush( FFile ); // empty buffer of the file opened for output
  CloseFile( FFile ); // terminate association between file variable and an external disk file
  {$I+}
end;

procedure TDbtFile.Write(AText: String);
begin
  if ProcessBatch then
     begin
       WriteToList(AText);
       CheckBatchWrite;
     end
  else WriteToFile(AText);
end;

procedure TDbtFile.Clear;
begin
  DeleteFile(FFileName);
  Write('');
  FModified := FALSE;
end;

procedure TDbtFile.Show;
begin
  if FileExists(FFileName) then
     IQMS.Common.Miscellaneous.ExecuteProgram(FFileName, SW_SHOWDEFAULT, '');
end;

procedure TDbtFile.WriteToFile(AText: String);
begin
  {$I-}

  if (FFileName = '') then Exit;

  // Ensure the directory path exists
  if not DirectoryExists(ExtractFilePath(FFileName)) then
     ForceDirectories(ExtractFilePath(FFileName));

  // If the file does not exist, then created it
  if ( not FileExists(FFileName)) then
     Rewrite(FFile);

  if ioresult = 0 then // return status of the last I/O operation performed
  begin
     Append( FFile );
     Writeln( FFile, AText ); // write an end-of-line marker to the file
     FModified := TRUE;
  end;
end;

procedure TDbtFile.WriteToList(AText: String);
begin
  if not Assigned(FList) then
     FList := TStringList.Create;
  FList.Add(AText);
end;

procedure TDbtFile.CheckBatchWrite;
var
   i: Integer;
begin
  if not ProcessBatch or not Assigned(FList) then Exit;
  if FList.Count >= BatchSize then
     begin
       //for i := 0 to FList.Count - 1 do
       //    WriteToFile(FList.Strings[i]);
       WriteToFile(Trim(FList.Text));
       FList.Clear;
     end;
end;

procedure TDbtFile.FlushBatch;
begin
  FlushBatchWrite;
end;

procedure TDbtFile.FlushBatchWrite;
var
   i: Integer;
begin
  if not ProcessBatch or not Assigned(FList) then Exit;
  WriteToFile(FList.Text);
  //for i := 0 to FList.Count - 1 do
  //    WriteToFile(FList.Strings[i]);
  FList.Clear;
end;

procedure TDbtFile.SetBatchSize(const Value: Integer);
begin
  if (Value < 5) then
     FBatchSize := 5
  else
     FBatchSize := Value;
end;

end.

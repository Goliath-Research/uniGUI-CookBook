// The TTextStream class encapsulates a Text File.  The text file is opened or
// created when an instance of the TTextStream classes is created.  The file is
// closed when the instance is destroyed.
//
// The TStringStream class decents from the TTextStream class and encapsulates
// a text file accessed through a string buffer.

unit IQMS.WebVcl.TextStream;

interface

uses SysUtils;

type
  // Modes for openning a text file.
  TTextFileMode = (tfmCreate, tfmRead, tfmAppend);

  TTextStream = class
  private
    FFileName : string;
    FHandle : TextFile;
    FMode : TTextFileMode;
  protected
    IsOpen : boolean;
  public
    constructor Create(NameOfFile : string; FileMode : TTextFileMode); virtual;
    destructor Destroy; override;
    procedure Flush;
    procedure Read(var Buffer : string);
    procedure ReadLn(var Buffer : string);
    procedure Write(var Buffer : string);
    procedure WriteLn(var Buffer : string);
    function EOF : boolean;
    function EOLn : boolean;
    function Size : longint;
    property FileName : string read FFileName;
    property Handle : TextFile read FHandle;
    property Mode : TTextFileMode read FMode;
  end;

  TStringStream = class(TTextStream)
  private
  protected
  public
    Buffer : string;
    procedure Read;
    procedure ReadLn;
    procedure Write;
    procedure WriteLn;
  end;



implementation

// TTextStream Class

// Creates the object and opens the file.
constructor TTextStream.Create(NameOfFile : string; FileMode : TTextFileMode);
begin
  inherited Create;

  Try
    IsOpen := False;
    FMode := FileMode;
    FFileName := NameOfFile;

    System.AssignFile(FHandle, FFileName);

    // Check if the file exist, if so open the file according to the FileMode.
    If FileExists(FileName) then
      begin
        If (FMode = tfmCreate) then
          System.Rewrite(FHandle)                // Over-write the file
        Else If (FMode = tfmRead) then
          System.Reset(FHandle)                  // Open file for read
        Else If (FMode = tfmAppend) then
          System.Append(FHandle);                // Append to end of file
      end
    Else
      begin
        // The file does not exist, therefore create it.
        System.Rewrite(FHandle);
      end;

    IsOpen := True;
  Except
    Raise;
  End;
end;

// Flushs the buffer, closes the file, and destroys the object.
destructor TTextStream.Destroy;
begin
  Try
    If IsOpen Then
    begin
      System.Flush(FHandle);
      System.CloseFile(FHandle);
      IsOpen := False;
    end;
  Except
  End;

  inherited Destroy;
end;

// Clears the buffer of the Text File if open for output.
procedure TTextStream.Flush;
begin
  Try
    System.Flush(FHandle);
  Except
    Raise;
  End;
end;

procedure TTextStream.Read(var Buffer : string);
begin
  Try
    If (IsOpen) And (FMode = tfmRead) then
      System.Read(FHandle, Buffer);
  Except
    Raise;
  End;
end;

procedure TTextStream.ReadLn(var Buffer : string);
begin
  Try
    If  (IsOpen) And (FMode = tfmRead) then
      System.ReadLn(FHandle, Buffer);
  Except
    Raise;
  End;
end;

procedure TTextStream.Write(var Buffer : string);
begin
  Try
    If  (IsOpen) And (FMode <> tfmRead) then
      System.Write(FHandle, Buffer);
  Except
    Raise;
  End;
end;

procedure TTextStream.WriteLn(var Buffer : string);
begin
  Try
    If  (IsOpen) And (FMode <> tfmRead) then
      System.WriteLn(FHandle, Buffer);
  Except
    Raise;
  End;
end;

// Return the End Of File status.
function TTextStream.EOF : boolean;
begin
  Try
    Result := False;
    If IsOpen Then Result := System.SeekEof(FHandle);
  Except
    Raise;
  End;
end;

// Return the End Of Line status.
function TTextStream.EOLn : boolean;
begin
  Try
    Result := False;
    If IsOpen Then Result := System.SeekEoLn(FHandle);
  Except
    Raise;
  End;
end;

// Return the size of the text file.
function TTextStream.Size : longint;
begin
  Try
    Result := 0;
    If IsOpen Then Result := System.FileSize(FHandle);
  Except
    Raise;
  End;
end;


// TStringStream Class

procedure TStringStream.Read;
begin
  Try
    If (IsOpen) And (Mode = tfmRead) then
      System.Read(Handle, Buffer);
  Except
    Raise;
  End;
end;

procedure TStringStream.ReadLn;
begin
  Try
    If  (IsOpen) And (Mode = tfmRead) then
      System.ReadLn(Handle, Buffer);
  Except
    Raise;
  End;
end;

procedure TStringStream.Write;
begin
  Try
    If  (IsOpen) And (Mode <> tfmRead) then
      System.Write(Handle, Buffer);
  Except
    Raise;
  End;
end;

procedure TStringStream.WriteLn;
begin
  Try
    If  (IsOpen) And (Mode <> tfmRead) then
      System.WriteLn(Handle, Buffer);
  Except
    Raise;
  End;
end;

END.

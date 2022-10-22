unit IQMS.Common.RecMMap;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  IQMS.Common.MemMap,
  FireDAC.Comp.DataSet;

type
  TRecMemMapFile = class(TMemMapFile)
  private
    FHeaderSize: LongInt;
    function GetRecordCount: Longint;
    function GetRecNo: Longint;
    procedure SetRecNo( ARecNo: Longint );
    function GetBof:Boolean;
    function GetEof:Boolean;
  protected
    property HeaderSize: LongInt read FHeaderSize write FHeaderSize;
    function GetRecSize: Longint; virtual;
    procedure CheckPos;
    procedure AssignHeader; virtual;
  public
    constructor Create( const AFileName: string; FileMode: Integer; CreateLocalCopy: Boolean ); virtual;
    function SeekRec( ARecNo: Longint; Origin: Word): Longint;
    function WriteRec(const Rec): Longint;
    function AppendRec(const Rec): Longint;
    function ReadRec : Pointer;
    procedure First;
    procedure Last;
    procedure Next;
    procedure Prev;

    property RecordCount: Longint read GetRecordCount;
    property RecNo: Longint read GetRecNo write SetRecNo;
    property Eof: Boolean read GetEof;
    property Bof: Boolean read GetBof;
  end;

implementation

constructor TRecMemMapFile.Create(const AFileName: string; FileMode: Integer; CreateLocalCopy: Boolean );
begin
  inherited;
  CheckError;
  AssignHeader;
  First;
end;

procedure TRecMemMapFile.AssignHeader;
begin
  FHeaderSize:= 0;
end;

function TRecMemMapFile.GetRecSize:Longint;
begin
  Result:= SizeOf( Byte );   {default - 1 byte long}
end;

function TRecMemMapFile.GetRecordCount: Longint;
begin
  Result:= ( Size - HeaderSize ) div GetRecSize;
end;

function TRecMemMapFile.GetRecNo: Longint;
begin
  Result:= ( Offset - HeaderSize ) div GetRecSize + 1;
end;

function TRecMemMapFile.GetBof:Boolean;
begin
  {First record always set Bof to TRUE}
  Result:= Offset <= HeaderSize;
end;

function TRecMemMapFile.GetEof: Boolean;
begin
  Result:= Offset > Size - 1;
end;

procedure TRecMemMapFile.SetRecNo( ARecNo: Longint);
begin
  if (ARecNo > 0) and ( (ARecNo - 1) * GetRecSize <= (Size - FHeaderSize) ) then
    Offset:= HeaderSize + (ARecNo - 1) * GetRecSize;
end;

function TRecMemMapFile.SeekRec( ARecNo: Longint; Origin: Word ): Longint;
begin
  {missing error detection}
  // Result:= Seek( ARecNo * GetRecSize, Origin);
end;

function TRecMemMapFile.WriteRec( const Rec ): Longint;
begin
  //  Result:= Write( Rec, GetRecSize );
  //  Seek(-GetRecSize, 1);           {Reset pointer to the begining of the record}
end;

function TRecMemMapFile.AppendRec( const Rec): Longint;
begin
  //Seek(0, 2);
  //Result := Write(Rec, GetRecSize);
  //Last;                           {Reset pointer to the begining of the record}
end;

function TRecMemMapFile.ReadRec : Pointer;
begin
  CheckPos;
  Result:= Position;
end;

procedure TRecMemMapFile.First;
begin
  RecNo:= 1;
end;

procedure TRecMemMapFile.Last;
begin
  RecNo:= RecordCount;
end;

procedure TRecMemMapFile.Next;
begin
  if not Eof and (( Offset - HeaderSize + GetRecSize) div GetRecSize < RecordCount) then
    RecNo:= RecNo + 1
  else
    Offset:= Size;
end;

procedure TRecMemMapFile.Prev;
begin
  if not Bof and ( Offset - FHeaderSize - GetRecSize >= 0) then
    RecNo:= RecNo - 1
  else
    First;
end;

procedure TRecMemMapFile.CheckPos;
begin
  if Eof then
    Last
  else if Bof then
    First;
end;

end.

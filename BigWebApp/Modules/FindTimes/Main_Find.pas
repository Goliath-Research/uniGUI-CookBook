unit Main_Find;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ComCtrls,
  ExtCtrls,
  Menus,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniMainMenu,
  uniPanel,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton, uniBasicGrid, uniStringGrid, uniMemo, uniHTMLMemo, uniFileUpload;

type

  TTimesCargo = class
     TimeInSecs: Real;
    constructor Create( ATimeInSecs: Real );
  end;


  TFrmFindTimes = class(TUniForm)
    Panel1: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Splitter1: TUniSplitter;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    BtnLoad: TUniButton;
    BtnProcess: TUniButton;
    EdMin: TUniEdit;
    Label1: TUniLabel;
    PopupMenu1: TUniPopupMenu;
    FindinFile1: TUniMenuItem;
    EditStr: TUniEdit;
    Label2: TUniLabel;
    ListView: TUniStringGrid;
    RichEdit1: TUniHTMLMemo;
    UniFileUpload1: TUniFileUpload;
    procedure BtnLoadClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnProcessClick(Sender: TObject);
    procedure FindinFile1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
    procedure ListViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FFile:String;
    FList:TStringList;
    procedure ProcessString(S:String);
    function  FindPosition(ATime:Real):Integer;
  public
    { Public declarations }
  end;


implementation
uses
  IQMS.Common.Controls,
  IQMS.Common.FileUtils,
  IQMS.Common.StringUtils;
{$R *.dfm}

constructor TTimesCargo.Create(ATimeInSecs: Real);
begin
  TimeInSecs:= ATimeInSecs;
end;

procedure TFrmFindTimes.BtnLoadClick(Sender: TObject);
begin
  UniFileUpload1.Execute;
end;

procedure TFrmFindTimes.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  ClearStringListOfObjects( FList );
end;

procedure TFrmFindTimes.ListViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
    PopupMenu1.Popup(x,y,sender);

end;

procedure TFrmFindTimes.BtnProcessClick(Sender: TObject);
var
 AFile : TextFile;
 AFileSize:Integer;
 S, AStr:String;
 I, ACount:Integer;
begin
  ClearStringListOfObjects( FList );
  if FileExists(FFile) then
  try
    AssignFile( AFile, FFile  );
    Reset( AFile );
    while not  SeekEof( AFile ) do
    begin
      {Get line of text}
      if SeekEoln( AFile ) then
        Readln; { Go to next line }
      Read( AFile, S );
      ProcessString(S);
     end;
  finally
    {Finish}
    Flush( AFile );           {empty buffer of the file opened for output}
    CloseFile( AFile );       {terminate association between file variable and an external disk file}
  end;
  ACount := FList.Count;
  ListView.RowCount:=ACount;
  for I := 0 to ACount - 1 do
  begin
     with ListView do
     begin
       Cells[0,I]:= FList[I];
       AStr := FloatToStr(TTimesCargo(FList.Objects[ I ]).TimeInSecs);
       Cells[1,I]:=AStr;
     end;
  end;
end;

procedure TFrmFindTimes.ProcessString(S:String);
var
  APos:Integer;
  AStr, AStrTime:String;
  ATime:Real;
  I, J, K, ACount:Integer;
begin
  APos := Pos(EditStr.Text, S);
//  APos := Pos('-- OK.  [', S);
  if APos = 0 then Exit;
  AStr := Copy(S, APos, Length(S));
  AStr := Copy(AStr, 1, Pos(']', AStr));
  AStrTime := Copy(AStr, Pos('[', AStr) + 1, Length(AStr));
  AStrTime := Trim(Copy(AStrTime, 1, Pos('sec]', AStrTime) - 1));
  ATime := StrToFloat(AStrTime);
  if ATime > StrToFloat(EdMin.text) then
  begin
    ACount := FList.Count;
    if ACount = 0 then
    begin
      J := FList.Add(AStr);
      FList.Objects[ J ]:= TTimesCargo.Create(ATime);
    end
    else
    begin
      APos := FindPosition(ATime);
      if APos = -1 then
      begin
        J := FList.Add(AStr);
        FList.Objects[ J ]:= TTimesCargo.Create(ATime);
      end
      else
      begin
        K := FList.Add('');
        FList.Objects[ K ]:= TTimesCargo.Create(0);
        for J := ACount - 1 downto APos do
        begin
          FList[J + 1] := FList[J];
          TTimesCargo(FList.Objects[ J + 1 ]).TimeInSecs := TTimesCargo(FList.Objects[ J ]).TimeInSecs;
        end;
        FList[APos] := AStr;
        TTimesCargo(FList.Objects[APos]).TimeInSecs := ATime;
      end;
    end;
  end;
end;

procedure TFrmFindTimes.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
var
  i:Integer;
begin
    ListView.RowCount:=0;
    if FileExists(AStream.FileName) then
    begin
       RichEdit1.Lines.LoadFromFile(AStream.FileName);
       Panel7.Caption := AStream.FileName;
       FFile          := AStream.FileName;
    end;
end;

procedure TFrmFindTimes.UniFormCreate(Sender: TObject);
begin
  FList := TStringList.Create;
end;

function TFrmFindTimes.FindPosition(ATime:Real):Integer;
var
  ACount, I:Integer;
begin
  ACount := FList.Count;
  for I := 0 to ACount - 1 do
  begin
    if ATime >= TTimesCargo(FList.Objects[ I ]).TimeInSecs then
    begin
      Result := I;
      Exit;
    end;
  end;
  if I = ACount then
    Result := -1;

end;

procedure TFrmFindTimes.FindinFile1Click(Sender: TObject);
var
  AStr:String;
  I:Integer;
  FoundAt: LongInt;
  StartPos, ToEnd: Integer;
begin
  AStr := ListView.Cells[ListView.Col,0];
  with RichEdit1 do
  begin
    StartPos := 0;


    ToEnd := Length(Text) - StartPos;

//    FoundAt := FindText(AStr, StartPos, ToEnd, [stMatchCase]);
//    if FoundAt <>  -1 then
//    begin
//      SetFocus;
//      SelStart := FoundAt;
//      SelLength := Length(AStr);
//      Perform( em_scrollcaret, 0, 0);
//    end;
  end;


end;

end.

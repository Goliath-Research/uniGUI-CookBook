unit scan_repair_disp_file;

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
  Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMemo,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit, uniStatusBar, uniButton, uniBitBtn, uniSpeedButton, uniSplitter,
  uniPanel, uniBasicGrid, uniStringGrid, uniHTMLMemo;

type
  TFrmDisplayFile = class(TUniForm)
    Panel2: TUniPanel;
    StatusBar1: TUniStatusBar;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    sbtnGoLine: TUniSpeedButton;
    Splitter1: TUniSplitter;
    ListView1: TUniStringGrid;
    RE: TUniHTMLMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure REMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure REKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbtnGoLineClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ChangeLineToRed(LineNumber: Integer);
    procedure MarkAffectedLines;
    procedure DisplayLineNumber;
    procedure SetFileName(AFileName:string);
  public
    property FileName :string write SetFileName;
    { Public declarations }
  end;


  procedure DoShow(AFileName: string );

implementation

{$R *.dfm}

uses
 MainModule,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm;

{ TFrmDisplayFile }

procedure DoShow(AFileName: string);
var
  FrmDisplayFile : TFrmDisplayFile;
begin
  FrmDisplayFile := TFrmDisplayFile.Create(uniGUIApplication.UniApplication);
  with FrmDisplayFile do
   begin
    FileName:=AFileName;
    Show;
   end;
end;

procedure TFrmDisplayFile.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmDisplayFile.MarkAffectedLines;
var
  I: Integer;
begin
  for I:= 0 to RE.Lines.Count -1 do
    if Pos( #9, RE.Lines[ I ] ) > 0 then
    begin
       ChangeLineToRed(I);
       with ListView1 do
       begin
         RowCount:=RowCount+1;
         Cells[0,RowCount-1]:=IntToStr( I + 1 );
       end;
    end;

  // StatusBar1.Panels[ 1 ].Text:= Format('# affected lines: %d', [ ACounter ]);
end;

procedure TFrmDisplayFile.ChangeLineToRed(LineNumber: Integer);
var
  X: Integer;
begin
//  RE.CaretPos:= Point(0, LineNumber);             // LineNumber starts at 0
//  X:= RE.SelStart;
//  RE.SelLength := Length(RE.Lines[LineNumber]);   // select the length of that line
//  RE.SelAttributes.Color:= clRed;                 // change the selected texts attributes
end;


procedure TFrmDisplayFile.REMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DisplayLineNumber;
end;

procedure TFrmDisplayFile.REKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  DisplayLineNumber;
end;

procedure TFrmDisplayFile.DisplayLineNumber;
begin
//  StatusBar1.Panels[ 0 ].Text:= Format('Line: %d', [ RE.Perform(EM_LINEFROMCHAR, RE.SelStart,0) + 1 ]);
end;


procedure TFrmDisplayFile.sbtnGoLineClick(Sender: TObject);
begin
  IQAssert( ListView1.Cells[ListView1.Col,ListView1.Row]<>'', 'Select Line # to jumpt to');
//  RE.SelStart:= RE.Perform(EM_LINEINDEX, StrToInt(ListView1.Selected.Caption) - 1, 0);
  RE.SetFocus;
  RE.Perform(EM_SCROLLCARET, 0, 0); 
  DisplayLineNumber;
end;

procedure TFrmDisplayFile.SetFileName(AFileName: string);
begin
  Caption:= Format('File %s contents', [ AFileName ]);
  RE.Lines.LoadFromFile( AFileName );
  MarkAffectedLines;
end;

procedure TFrmDisplayFile.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

end.

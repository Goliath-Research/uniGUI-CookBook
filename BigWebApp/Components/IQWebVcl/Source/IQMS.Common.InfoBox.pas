unit IQMS.Common.InfoBox;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniStringGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, Vcl.Controls;

type
  TFrmInfoBox = class(TUniForm)
    Grid: TUniStringGrid;
    PMain: TUniPopupMenu;
    CopyListtoClipboard1: TUniMenuItem;
    SaveListtoFile1: TUniMenuItem;
    SaveDialog: TSaveDialog;
    PrintList1: TUniMenuItem;
    PrintDialog1: TPrintDialog;
    N1: TUniMenuItem;
    StayOnTop1: TUniMenuItem;
    CopyCelltoClipboard1: TUniMenuItem;
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CopyListtoClipboard1Click(Sender: TObject);
    procedure SaveListtoFile1Click(Sender: TObject);
    procedure PrintList1Click(Sender: TObject);
    procedure StayOnTop1Click(Sender: TObject);
    procedure PMainPopup(Sender: TObject);
    procedure CopyCelltoClipboard1Click(Sender: TObject);
    procedure GridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FList: TStringList;
    FNameCaption, FValueCaption: String;

  public
    { Public declarations }
    constructor Create(AList: TStringList; AHeader: string = 'Info Box');

    procedure UpdateList(const AList: TStringList);
    procedure ColumnHeaders(ANameCaption, AValueCaption: String);
  end;

procedure DoShowInfoBox( AList: TStringList; AHeader: string = 'Info Box' );
function DoShowInfoBox_Ex( AList: TStringList;
                          AHeader: string = 'Info Box';
                          ANameTitle: string = 'Name';
                          AValueTitle: string = 'Value' ): TUniForm;
var
  FrmInfoBox: TFrmInfoBox;

implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  IQMS.Common.PrintDialogsShare;

procedure DoShowInfoBox( AList: TStringList; AHeader: string = 'Info Box' );
begin
  if (AList = NIL) or not Assigned(AList) then Exit;
  TFrmInfoBox.Create( AList, AHeader ).ShowModal;
end;

function DoShowInfoBox_Ex( AList: TStringList;
   AHeader: string = 'Info Box'; ANameTitle: string = 'Name';
   AValueTitle: string = 'Value' ): TUniForm;
begin
  if (AList = NIL) or not Assigned(AList) then Exit;

  Result := TFrmInfoBox.Create( AList, AHeader );
  with TFrmInfoBox(Result) do
  begin
    // Allow for localization
    if ANameTitle = 'Name' then ANameTitle := IQMS.Common.ResStrings.cTXT0000123; {'Name'}
    if AValueTitle = 'Name' then AValueTitle := IQMS.Common.ResStrings.cTXT0000124; {'Value'}
    ColumnHeaders(ANameTitle, AValueTitle);
    Show;
  end;
end;

procedure TFrmInfoBox.FormResize(Sender: TObject);
begin
  with Grid do
    ColWidths[ 1 ]:= ClientWidth - ColWidths[ 0 ] - 3;
end;

procedure TFrmInfoBox.GridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbRight then
    PMain.Popup(x,y,sender);

end;

procedure TFrmInfoBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmInfoBox.CopyCelltoClipboard1Click(Sender: TObject);
begin
//  if (Grid.Row > -1) and (Grid.Col > -1) then
//     IQMS.Common.StringUtils.CopyStrToClipbrd( Grid.Cells[ Grid.Col, Grid.Row ]);
end;

procedure TFrmInfoBox.CopyListtoClipboard1Click(Sender: TObject);
begin
//  if Assigned(FList) then
//     IQMS.Common.StringUtils.CopyStrToClipbrd(FList.Text);
end;

constructor TFrmInfoBox.Create(AList: TStringList; AHeader: string = 'Info Box');
var
  I: Integer;
begin
  inherited create(uniGUIApplication.UniApplication);
  // Allow for localization
  if AHeader = 'Info Box' then AHeader := IQMS.Common.ResStrings.cTXT0000122 {'Info Box'};
  Caption:= AHeader;

  // Default captions
  FNameCaption :=  IQMS.Common.ResStrings.cTXT0000123; {'Name'};
  FValueCaption := IQMS.Common.ResStrings.cTXT0000124; {'Value'}

  // Update the list
  UpdateList(AList);
  IQRegFormRead(self, [ self ]);

end;

procedure TFrmInfoBox.SaveListtoFile1Click(Sender: TObject);
var
S : TStringStream;
begin
  if Assigned(FList) and SaveDialog.Execute then
   begin
      S := TStringStream.Create(FList.text);
        try
          UniSession.SendStream(S, 'List.txt');
        finally
          S.Free;
        end;
   end;
//     FList.SaveToFile(SaveDialog.FileName);
end;

procedure TFrmInfoBox.PrintList1Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
     IQMS.Common.PrintDialogsShare.PrintStringGrid(Grid, Self.Caption);
end;


procedure TFrmInfoBox.ColumnHeaders(ANameCaption, AValueCaption: String);
begin
  FNameCaption := ANameCaption;
  FValueCaption := AValueCaption;

  if Grid.RowCount >= 1 then
  begin
    Grid.Cells[0, 0]:= ANameCaption;
    Grid.Cells[1, 0]:= AValueCaption;
  end;
end;

procedure TFrmInfoBox.UpdateList(const AList: TStringList);
var
   i: Integer;
begin
  if not Assigned(AList) then
     Exit;

  // Prepare the list.  This is used for saving to file, copying to clipboard, etc.
  if not Assigned(FList) then
     FList := TStringList.Create;
  FList.Clear;
  FList.AddStrings(AList);

  // Clear the grid
  Grid.RowCount := 2;
  ColumnHeaders(FNameCaption, FValueCaption);
  //Grid.Rows[1].Text := '';

  // Update the grid
  for i := 0 to FList.Count - 1 do
  begin
    if i + 1 >= Grid.RowCount then
      Grid.RowCount:= Grid.RowCount + 1;
    Grid.Cells[0, i+1] := FList.Names[i];
    Grid.Cells[1, i+1] := FList.Values[FList.Names[i]];
  end;
end;

procedure TFrmInfoBox.PMainPopup(Sender: TObject);
begin
  StayOnTop1.Checked := ( FormStyle = fsStayOnTop );
end;

procedure TFrmInfoBox.StayOnTop1Click(Sender: TObject);
begin
  if ( FormStyle = fsNormal ) then FormStyle := fsStayOnTop
  else FormStyle := fsNormal;
end;

end.

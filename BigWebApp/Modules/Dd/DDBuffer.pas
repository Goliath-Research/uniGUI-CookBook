unit DDBuffer;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Menus,
  ComCtrls,
//  DD_Main,
  Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniSplitter,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMainMenu,
  uniPanel,
  uniMemo,
  uniMultiItem,
  uniListBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, IQMS.WebVcl.About;

type
  TFrmBuffer = class(TUniForm)
    Panel1: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    About1: TUniMenuItem;
    Help1: TUniMenuItem;
    Splitter1: TUniSplitter;
    IQAbout1: TIQWebAbout;
    ListBox1: TUniListBox;
    PopupMenu1: TUniPopupMenu;
    GoToBufferItem1: TUniMenuItem;
    sbtnClearBuffer: TUniSpeedButton;
    sbtnFastForward: TUniSpeedButton;
    sbtnForeward: TUniSpeedButton;
    sbtnBack: TUniSpeedButton;
    sbtnRewind: TUniSpeedButton;
    SBLocate: TUniSpeedButton;
    Panel2: TUniPanel;
    Memo1: TUniMemo;
    Bevel1: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure GoToBufferItem1Click(Sender: TObject);
    procedure sbtnRewindClick(Sender: TObject);
    procedure sbtnFastForwardClick(Sender: TObject);
    procedure sbtnBackClick(Sender: TObject);
    procedure sbtnForewardClick(Sender: TObject);
//    procedure sbtnDeleteBufferClick(Sender: TObject);
    procedure sbtnClearBufferClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure ListBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FBuffer:TList;
    procedure LoadListBox;
  public
    { Public declarations }
  end;

procedure DoShowBuffer(AListBuffer:TList);

implementation
uses
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  MainModule,
  DD_resourcestring;
{$R *.DFM}

procedure DoShowBuffer(AListBuffer:TList);
var
  FrmBuffer : TFrmBuffer;
begin
  FrmBuffer := TFrmBuffer.Create(UniApplication);
  with FrmBuffer do
  begin
   FBuffer := AListBuffer;
   LoadListBox;
   ShowModal;
  end;
end;


procedure TFrmBuffer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self,[ self, Panel2]);
end;

procedure TFrmBuffer.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuffer.Help1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmBuffer.ListBox1Click(Sender: TObject);
var
  I:Integer;
begin
  Memo1.Clear;
  for I := 0 to TStringList(FBuffer[ListBox1.ItemIndex ]).Count - 1 do
  begin
    Memo1.Lines.Add(TStringList(FBuffer[ListBox1.ItemIndex ])[I]);
  end;
end;

procedure TFrmBuffer.ListBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
    begin
      PopupMenu1.Popup(x,y,Sender);
    end;

end;

procedure TFrmBuffer.GoToBufferItem1Click(Sender: TObject);
begin
  if ListBox1.Items.Count < 1 then Exit;
//  TDDmain(Owner).reSQL.Lines.Assign( TStringList( FBuffer[ListBox1.ItemIndex] ));
  Close;
end;

procedure TFrmBuffer.sbtnRewindClick(Sender: TObject);
begin
  if ListBox1.Items.Count < 1 then Exit;
  ListBox1.ItemIndex := 0;
  ListBox1Click(nil);
end;

procedure TFrmBuffer.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self,[ self, Panel2]);
end;

procedure TFrmBuffer.sbtnFastForwardClick(Sender: TObject);
begin
  if ListBox1.Items.Count < 1 then Exit;
  ListBox1.ItemIndex := ListBox1.Items.Count - 1;
  ListBox1Click(nil);
end;

procedure TFrmBuffer.sbtnBackClick(Sender: TObject);
begin
  if ListBox1.Items.Count < 1 then Exit;
  if ListBox1.ItemIndex > 0 then
    ListBox1.ItemIndex := ListBox1.ItemIndex - 1;
  ListBox1Click(nil);
end;

procedure TFrmBuffer.sbtnForewardClick(Sender: TObject);
begin
  if ListBox1.Items.Count < 1 then Exit;
  if ListBox1.ItemIndex < ListBox1.Items.Count - 1 then
    ListBox1.ItemIndex := ListBox1.ItemIndex + 1;
  ListBox1Click(nil);
end;

{
procedure TFrmBuffer.sbtnDeleteBufferClick(Sender: TObject);
var
  I:Integer;
begin
  if ListBox1.Items.Count < 1 then Exit;
  TStringList( FBuffer[ ListBox1.ItemIndex ]).Free;
  FBuffer.Delete( ListBox1.ItemIndex );
  I := ListBox1.ItemIndex - 1;
  ListBox1.Items.Delete(ListBox1.ItemIndex);
  if I > -1 then
  begin
    ListBox1.ItemIndex := I;
    ListBox1Click(nil);
  end
  else
  begin
    if ListBox1.Items.Count > 0 then
    begin
      ListBox1.ItemIndex := 0;
      ListBox1Click(nil);
    end
    else
    begin
      Memo1.Clear;
      TDDmain(Owner).reSQL.Lines.Clear;
    end;
  end;
  TDDmain(Owner).FListBufferIndex := ListBox1.ItemIndex + 1;
end;

}

procedure TFrmBuffer.sbtnClearBufferClick(Sender: TObject);
var
  I:Integer;
begin
  if ListBox1.Items.Count = 0 then Exit;
  // 'Do you wish to delete the selected items?'
  if not IqConfirmYN( DD_resourcestring.cTXT0000066 ) then Exit;
  if ListBox1.SelCount = 0 then
    ListBox1.Selected[ListBox1.ItemIndex] := True;

  for I := ListBox1.Items.Count - 1 downto 0 do
  begin
    if ListBox1.Selected[I] then
    begin
      TStringList( FBuffer[ I ]).Free;
      FBuffer.Delete( I );
    end;
  end;
  LoadListBox;
//  TDDmain(Owner).reSQL.Lines.Clear;
//  TDDmain(Owner).FListBufferIndex := ListBox1.ItemIndex + 1;
  Memo1.Clear;
end;

procedure TFrmBuffer.LoadListBox;
var
  I:Integer;
begin
  ListBox1.Clear;
  for I := 0 to FBuffer.Count - 1 do
  begin
    ListBox1.Items.Add( Format('%-5s', [IntToStr(I)]) + ' ' + TStringList(FBuffer[I]).Text);
  end;
  if ListBox1.Items.Count > 0 then
  begin
    ListBox1.ItemIndex := 0;
    ListBox1Click(nil);
  end;
end;


end.

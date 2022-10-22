// The conversion from D5 to D7 is sometimes faulty.  Lines must end in #13,
// but in converted files this is sometimes not the case.  This utility
// fixes up the .PAS files.

unit fix_file_lines;

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
  ExtCtrls,
  Menus,
  ComCtrls,
  Buttons,
  XPMan,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniStatusBar,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMainMenu,
  uniPanel,
  uniMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, uniFileUpload;

type
  TFrmFixFileLines = class(TUniForm)
    memText: TUniMemo;
    StatusBar1: TUniStatusBar;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    FileOpen1: TUniMenuItem;
    FileSave1: TUniMenuItem;
    FileReload1: TUniMenuItem;
    N1: TUniMenuItem;
    FileExit1: TUniMenuItem;
    Actions1: TUniMenuItem;
    ActionsFixLines1: TUniMenuItem;
    Edit1: TUniMenuItem;
    EditCopyAll1: TUniMenuItem;
    FileClose1: TUniMenuItem;
    PnlToolbar_Buttons: TUniPanel;
    sbtnOpenFile: TUniSpeedButton;
    sbtnReload: TUniSpeedButton;
    SpeedButton1: TUniSpeedButton;
    sbtnFixLines: TUniSpeedButton;
    sbtnCopyAll: TUniSpeedButton;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    sbtnFileClose: TUniSpeedButton;
    Bevel3: TUniPanel;
    EditSelectAll1: TUniMenuItem;
    N2: TUniMenuItem;
    sbtnSortAll: TUniSpeedButton;
    SortandRemoveDuplicates1: TUniMenuItem;
    shpRMargin: TUniPanel;
    UniFileUpload1: TUniFileUpload;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FileOpen1Click(Sender: TObject);
    procedure FileSave1Click(Sender: TObject);
    procedure FileReload1Click(Sender: TObject);
    procedure ActionsFixLines1Click(Sender: TObject);
    procedure FileClose1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SortandRemoveDuplicates1Click(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
    FFileName: string;
    OriginalText:widestring;
    procedure DoFixLines;
    procedure SetCaption;
  public
    { Public declarations }
  end;


procedure DoShow;

const
  cRMargin = 80;

implementation

{$R *.dfm}


uses
 MainModule,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

procedure DoShow;
var
  FrmFixFileLines : TFrmFixFileLines;
begin
  FrmFixFileLines := TFrmFixFileLines.Create(UniApplication);
  FrmFixFileLines.Show;
end;

procedure TFrmFixFileLines.FormCreate(Sender: TObject);
begin
  IQRegFormRead(Self, [Self]); // iqregfrm.pas
  // fix up the margin shape
//  shpRMargin.Parent := memText;
  shpRMargin.Top := 0;
  shpRMargin.Height := memText.ClientHeight;
  shpRMargin.Anchors := [akLeft, akTop, akBottom];
  shpRMargin.Left := 8 * cRMargin;

  sbtnCopyAll.ClientEvents.ExtEvents.Values['click']:='function click(sender, e, eOpts) '+
      ' { '+
      ' var textarea = document.getElementById("'+memText.JSName+'_id-inputEl"); '+
      ' textarea.select(); '+
      ' try { '+
      ' var successful = document.execCommand(''copy''); '+
      ' if(successful) console.log(''Copied!''); '+
      ' else console.log(''Unable to copy!''); '+
      ' } catch (err) { '+
      ' console.log(''Unsupported Browser!''); '+
      ' } '+
      ' }';
end;

procedure TFrmFixFileLines.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]); // iqregfrm.pas
end;

procedure TFrmFixFileLines.FileOpen1Click(Sender: TObject);
begin
  UniFileUpload1.Execute;
end;

procedure TFrmFixFileLines.FileSave1Click(Sender: TObject);
var
 S : TStringStream;
begin
  if FileExists(FFileName) then
  begin
    S := TStringStream.Create(memText.Lines.Text);
        try
          UniSession.SendStream(S, ExtractFileName(FFileName));
        finally
          S.Free;
        end;
  end;
end;

procedure TFrmFixFileLines.FileReload1Click(Sender: TObject);
begin
  if FileExists(FFileName) then
  begin
    memText.Lines.Clear;
    memText.Lines.LoadFromFile(FFileName);
  end;
end;

procedure TFrmFixFileLines.ActionsFixLines1Click(Sender: TObject);
begin
  DoFixLines;
end;

procedure TFrmFixFileLines.DoFixLines;

  function _countPrecSpaces(const S: string): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 1 to Length(S) do
    begin
      if S[i] = #32 then
        Inc(Result)
      else
        BREAK;
    end;
  end;

var
  ATemp: TStringList;
  i, x1: Integer;
  S: string;
begin
  try
    memText.Lines.BeginUpdate;
    StatusBar1.Panels[0].Text := 'Fixing text...';
    StatusBar1.Update;
    ATemp := TStringList.Create;
    ATemp.AddStrings(memText.Lines);
    memText.Lines.Clear;
    for i := 0 to ATemp.Count - 1 do
    begin
      S := ATemp.Strings[i];
      x1 := _countPrecSpaces(S);
      S := Repl(#32, x1) + Trim(S);

      if Trim(S) = '' then
        S := Trim(S);

      memText.Lines.Add(S);
    end;
  finally
    if Assigned(ATemp) then
      FreeAndNil(ATemp);
    StatusBar1.Panels[0].Text := '';
    StatusBar1.Update;
    memText.Lines.EndUpdate;
  end;

end;

procedure TFrmFixFileLines.SetCaption;
begin
  if FFileName > '' then
    Caption := Format('Fix Lines - %s', [FFileName])
  else
    Caption := 'Fix Lines';
end;

procedure TFrmFixFileLines.FileClose1Click(Sender: TObject);
begin
  if FileExists(FFileName) and (memText.text<>OriginalText)
  and IQConfirmYN('Save changes?')= TRUE
  then
    FileSave1Click(Sender);
  FFileName := '';
  memText.Lines.Clear;
  SetCaption;
end;

procedure TFrmFixFileLines.SortandRemoveDuplicates1Click(Sender: TObject);
var
  AList: TStringList;
begin
  if not IQConfirmYN('Sort all text and remove duplicates?') then
    Exit;

  AList := TStringList.Create;
  try
    AList.Sorted := TRUE;
    AList.Duplicates := dupIgnore;
    AList.Text := memText.Text;
    AList.Sort;
    memText.Text := AList.Text;
  finally
    if Assigned(AList) then
      FreeAndNil(AList);
  end;
end;

procedure TFrmFixFileLines.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
begin
  FFileName := UniFileUpload1.FileName;
  memText.Lines.Clear;
  memText.Lines.LoadFromFile(AStream.FileName);
  OriginalText:=memText.Text;
  SetCaption;
end;

end.

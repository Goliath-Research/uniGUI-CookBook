unit IQMS.WebVcl.OptionDialogForm;

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
  ExtCtrls,
  StdCtrls,
  Buttons,
  CheckLst,
  math,
  Menus,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel;

type
  TFrmIQOptionDialog = class(TUniForm)
    PnlCheckList: TUniPanel;
    PnlButtons: TUniPanel;
    lstOptions: TCheckListBox;
    PnlPrompt: TUniPanel;
    lblPrompt: TUniLabel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PMain: TUniPopupMenu;
    SelectAll1: TUniMenuItem;
    UnselectAll1: TUniMenuItem;
    procedure FormShow(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure UnselectAll1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lstOptionsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FPrompt: String;
    procedure SetPrompt(const Value: String);
  public
    { Public declarations }
    procedure SetItems(const S: array of String);
    procedure CheckItems(AChecked: Boolean); overload;
    procedure CheckItems(const AIndexes: array of Byte); overload;
    property Prompt: String read FPrompt write SetPrompt;
  end;


implementation

{$R *.dfm}

{ TOptionCheckList }

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

procedure TFrmIQOptionDialog.FormShow(Sender: TObject);
begin
//  IQMS.Common.Controls.CenterForm(Self, True);
  IQRegFormRead(Self, [Self]);
  SetPrompt(FPrompt);
end;

procedure TFrmIQOptionDialog.lstOptionsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
    PMain.Popup(x,y,sender);
end;

procedure TFrmIQOptionDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]);
end;

procedure TFrmIQOptionDialog.FormResize(Sender: TObject);
begin
  SetPrompt(FPrompt);
end;

procedure TFrmIQOptionDialog.CheckItems(AChecked: Boolean);
var
  i: Integer;
begin
  for i := 0 to lstOptions.Items.Count - 1 do
    lstOptions.Checked[i] := AChecked;
end;

procedure TFrmIQOptionDialog.CheckItems(const AIndexes: array of Byte);

  function _ValueInList(AValue: Integer; const AList: array of Byte): Boolean;
  var
    i: Integer;
  begin
    for i := 0 to High(AList) do
      begin
        Result := AValue = AList[i];
        if Result then
          EXIT;
      end;
    Result := FALSE;
  end;

var
  i: Integer;
begin
  for i := 0 to lstOptions.Items.Count - 1 do
    if _ValueInList(i, AIndexes) then
      lstOptions.Checked[i] := True
    else
      lstOptions.Checked[i] := FALSE;
end;

procedure TFrmIQOptionDialog.SetItems(const S: array of String);
var
  i: Integer;
begin
  lstOptions.Items.Clear;
  for i := 0 to High(S) do
    lstOptions.Items.Add(S[i]);
end;

procedure TFrmIQOptionDialog.SetPrompt(const Value: String);
begin
  // Set variable
  FPrompt := Value;

  // Set caption
  lblPrompt.AutoSize := False;
  lblPrompt.Caption := Value;
  lblPrompt.AutoSize := True;

  // Force autosize
  lblPrompt.AutoSize := False;
  lblPrompt.Height := 13;
  lblPrompt.AutoSize := True;

  // Update display
  lblPrompt.Update;

  // Set parent panel display
  PnlPrompt.Visible := Trim(lblPrompt.Caption) > '';
  if PnlPrompt.Visible then
    PnlPrompt.Height := lblPrompt.Height ;
end;

procedure TFrmIQOptionDialog.SelectAll1Click(Sender: TObject);
begin
  IQMS.Common.Controls.CheckItems(lstOptions, True);
end;

procedure TFrmIQOptionDialog.UnselectAll1Click(Sender: TObject);
begin
  IQMS.Common.Controls.CheckItems(lstOptions, FALSE);
end;

end.

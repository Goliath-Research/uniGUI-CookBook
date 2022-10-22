unit crm_module_shortcuts_frame;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.HotLabel,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniLabel, uniMainMenu,uniGUIFrame, uniImage;

type
  { TJumpCargo }
  TJumpCargo = class
    JumpLabel: TIQWebHotLabel;
    MenuItem: TUniMenuItem;
    constructor Create(AMenuItem: TUniMenuItem; AJumpLabel: TIQWebHotLabel);
  end;

  { TFrmModuleShortcutsFrame }
  TFrmModuleShortcutsFrame = class(TUniFrame)
    PnlCarrier: TUniPanel;
    sbPnlHint: TUniScrollBox;
    PnlDisplay: TUniPanel;
    PnlNode: TUniPanel;
    PnlTextHint: TUniPanel;
    txtHint: TUniLabel;
    PnlTitle: TUniPanel;
    lblTitle: TUniLabel;
    Bevel1: TUniPanel;
    PnlSelected: TUniPanel;
    PnlSelectDescrip: TUniPanel;
    lblSelectedItemDescription: TUniLabel;
    PnlSelectedItemCaption: TUniPanel;
    lblSelectedItemCaption: TUniLabel;
    Bevel2: TUniPanel;
    PnlTasks: TUniPanel;
    PnlActions: TUniPanel;
    PnlActionsCaption: TUniPanel;
    lblActionsCaption: TUniLabel;
    Bevel3: TUniPanel;
    PnlCollapseStatistics: TUniPanel;
    sbtnCollapsePane: TUniSpeedButton;
    procedure OnJumpClick(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure sbtnCollapsePaneClick(Sender: TObject);
  private
    { Private declarations }
    FJumpList: TList;
    FUpdating: Boolean;
    FSystemFontName: string;
    FOnCloseBtnClick: TNotifyEvent;
    procedure Init;
    procedure SetLabelText(ALabel: TUniLabel; ACaption: string);
    function PanelActionsLabelCount: Integer;
    procedure AlignNodePanel;
    function GetCaptionHeight(ALabel: TUniLabel; ACaption: string): Integer;
  public
    { Public declarations }
    procedure CreateWnd; override;
    destructor Destroy; override;
    procedure SetGroupText(ATitle, AHint: string);
    procedure SetItemText(ATitle, AHint: string);

    procedure ClearJumps;
    procedure AddJump(ACaption: string; AMenuItem: TUniMenuItem; ATag: Integer);
    procedure AddJumpB(AMenuItem: TUniMenuItem; ACaption: string = '');
    // adds jump based on an existing menu item
    procedure AddHintLine(ACaption: string);
    // adds an informational line to PnlActions
    procedure RealignControls;
    procedure BeginUpdate;
    procedure EndUpdate;

    property OnCloseBtnClick: TNotifyEvent read FOnCloseBtnClick
      write FOnCloseBtnClick;
  end;

const
  clLabelFontColor: TColor = 11359005; // $00C65D21;

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.Screen,
  System.Math,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

{ TJumpCargo }

constructor TJumpCargo.Create(AMenuItem: TUniMenuItem; AJumpLabel: TIQWebHotLabel);
begin
  MenuItem := AMenuItem;
  JumpLabel := AJumpLabel;
end;

{ TFrmModuleShortcutsFrame }

procedure TFrmModuleShortcutsFrame.CreateWnd;
begin
  inherited;
  FJumpList := TList.Create;
  Init;
end;

destructor TFrmModuleShortcutsFrame.Destroy;
begin
  ClearJumps;
  if Assigned(FJumpList) then
    FreeAndNil(FJumpList);
  inherited Destroy;
end;

procedure TFrmModuleShortcutsFrame.Init;
begin
  FSystemFontName := IQMS.Common.Screen.SystemFontName;
  IQMS.Common.Screen.ApplySystemFont(Self);
  lblSelectedItemCaption.Caption := '';
  lblSelectedItemDescription.Caption := '';
  PnlSelected.Visible := False;

  with PnlCarrier do
    begin
      ParentBackground := False;
      Tag := 1999;
    end;

  with sbPnlHint do
    begin
      ParentBackground := False;
      Tag := 1999;
    end;

  lblTitle.Font.Name := FSystemFontName;
  txtHint.Font.Name := FSystemFontName;
  lblSelectedItemCaption.Font.Name := FSystemFontName;
  lblSelectedItemDescription.Font.Name := FSystemFontName;
  lblActionsCaption.Font.Name := FSystemFontName;
end;

procedure TFrmModuleShortcutsFrame.AddHintLine(ACaption: string);
var
  ANewLabel: TUniLabel;
begin
  ANewLabel := TUniLabel.Create(Self);
  with ANewLabel do
    begin
      // Height := 17;
      AutoSize := True;
      Top := PnlActions.ControlCount * Height;
      Left := 8;
      Font.Name := FSystemFontName;
      Font.Style := [fsBold];
      Font.Color := clWindowText; // clLabelFontColor;
      Caption := ACaption;
    end;
  PnlActions.InsertControl(ANewLabel);
end;

procedure TFrmModuleShortcutsFrame.AddJump(ACaption: string;
  AMenuItem: TUniMenuItem;
  ATag: Integer);
const
  cMinHeight = 82;
  cLabelHeight = 17;
  cStartTop = 8;
var
  AImage: TUniImage;
  ANewLabel: TIQWebHotLabel;
  ATop,
    i: Integer;
begin
  // initial
  AImage := nil;
  ANewLabel := nil;

  ATop := (PanelActionsLabelCount * cLabelHeight) + cStartTop;

  ANewLabel := TIQWebHotLabel.Create(Self);
  with ANewLabel do
    begin
      Caption := ACaption;
      // Font.Color := clLabelFontColor;
      Height := cLabelHeight;
      Top := ATop;
      Left := 8;
      OnClick := OnJumpClick;
      Tag := ATag;
    end;
  FJumpList.Add(TJumpCargo.Create(AMenuItem, ANewLabel));
  if Assigned(AImage) then
    PnlActions.InsertControl(AImage);
  PnlActions.InsertControl(ANewLabel);

  i := (PnlActions.ControlCount * (cLabelHeight + 1)) +
    PnlActionsCaption.Height + 8;
  PnlTasks.Height := Max(i, cMinHeight);

end;

procedure TFrmModuleShortcutsFrame.AddJumpB(AMenuItem: TUniMenuItem;
  ACaption: string);
var
  AUseThisCaption: string;
begin
  if AMenuItem.Enabled then
    begin
      if ACaption > '' then
        AUseThisCaption := ACaption
      else
        AUseThisCaption := AMenuItem.Caption;
      AddJump(AUseThisCaption, AMenuItem, AMenuItem.Tag);
    end;
end;

procedure TFrmModuleShortcutsFrame.ClearJumps;
var
  i: Integer;
begin
  if Assigned(PnlActions) then
    begin
      for i := PnlActions.ControlCount - 1 downto 0 do
        PnlActions.Controls[i].Free;
    end;
  if Assigned(FJumpList) then
    begin
      ClearListOfObjects(FJumpList);
      FJumpList.Clear;
    end;
end;

procedure TFrmModuleShortcutsFrame.SetGroupText(ATitle, AHint: string);
var
  i: Integer;
begin
  // if not Self.Showing then
  // Exit;

  // if (Self = NIL) or (PnlCarrier = NIL) or (PnlCarrier.Visible = FALSE) then Exit;

  if Trim(ATitle) <> lblTitle.Caption then
    lblTitle.Caption := ATitle;

  if Trim(AHint) <> txtHint.Caption then
    begin
      SetLabelText(txtHint, AHint); // see below
      AlignNodePanel;
    end;

  RealignControls;
  PnlCarrier.Update;
  Repaint;
end;

procedure TFrmModuleShortcutsFrame.AlignNodePanel;
var
  i: Integer;
begin
  i := PnlTitle.Height + txtHint.Top + txtHint.Height + 2;
  PnlNode.Height := Max(i, 62);
end;

procedure TFrmModuleShortcutsFrame.SetItemText(ATitle, AHint: string);
// ---------------------------------------------------------------------------
  procedure _resetCaptions;
  begin
    lblSelectedItemCaption.Caption := '';
    lblSelectedItemDescription.Caption := '';
    PnlSelected.Visible := False;
  end;
// ---------------------------------------------------------------------------
  procedure _FixUpCtrls;
  begin
    PnlSelected.Visible := not FUpdating and
      (lblSelectedItemCaption.Caption > '') or
      (lblSelectedItemDescription.Caption > '');
    lblSelectedItemCaption.Visible := (lblSelectedItemCaption.Caption > '');
    lblSelectedItemDescription.Visible :=
      (lblSelectedItemDescription.Caption > '');
    RealignControls;
  end;

// ---------------------------------------------------------------------------
var
  AVisible: Boolean;
  i: Integer;
begin
  if Self.Showing then
    try
      // Do we show the captions? Both caption and descrip together must exist
      // AVisible := not (( ATitle = AHint ) or ( ATitle = '' ) or ( AHint = '' ));
      AVisible := (ATitle > '') or (AHint > '');

      if not AVisible then
        begin
          _resetCaptions;
          _FixUpCtrls;
        end
      else
        begin
          if lblSelectedItemCaption.Caption <> ATitle then
            begin
              lblSelectedItemCaption.Caption := ATitle;

              if AHint = ATitle then
                AHint := '';

              if (lblSelectedItemDescription.Caption <> AHint) then
                begin
                  SetLabelText(lblSelectedItemDescription, AHint); // see below

                  // add a buffer
                  lblSelectedItemDescription.Height :=
                    lblSelectedItemDescription.Height + 6;
                  // set the parent panel height
                  i := PnlSelectedItemCaption.Height +
                    lblSelectedItemDescription.Top +
                    lblSelectedItemDescription.Height + 2;
                  PnlSelected.Height := Max(i, 62);
                end;

              _FixUpCtrls;

            end;
        end;
    except
      _resetCaptions;
    end;
end;

procedure TFrmModuleShortcutsFrame.OnJumpClick(Sender: TObject);
var
  i: Integer;
  mnu: TUniMenuItem;
begin
  // Are you wondering why we get here, but the jump doesn't work?
  // Make sure that the menu item (on which the jump is based) is not
  // called from a TPopupMenu.  Only TMainMenu menu items will work
  // as jumps.

  for i := 0 to FJumpList.Count - 1 do
    if TJumpCargo(FJumpList.Items[i]).JumpLabel = TIQWebHotLabel(Sender) then
      begin
        mnu := TJumpCargo(FJumpList.Items[i]).MenuItem;
        BREAK;
      end;
  if Assigned(mnu) then
    begin
      mnu.Tag := TIQWebHotLabel(Sender).Tag;
      PostMessage(TUniForm(mnu.Owner).Handle, WM_COMMAND, mnu.Command, 0);
    end;
end;

procedure TFrmModuleShortcutsFrame.RealignControls;
const
  cBuffer = 10;

  procedure _StackControls(ATop: Integer; const AControls: array of TControl);
  var
    i: Integer;
  begin
    for i := 0 to high(AControls) do
      if AControls[i].Visible then
        begin
          AControls[i].Top := ATop;
          ATop := ATop + AControls[i].Height + cBuffer;
        end;
  end;

begin
  if FUpdating then
    Exit;
  PnlTasks.Visible := PnlActions.ControlCount > 0;
  PnlSelected.Visible := lblSelectedItemDescription.Caption > '';
  _StackControls(0, [PnlNode, PnlSelected, PnlTasks]);
  PnlDisplay.Realign;
  FrameResize(Self);
end;

procedure TFrmModuleShortcutsFrame.sbtnCollapsePaneClick(Sender: TObject);
begin
  if Assigned(FOnCloseBtnClick) then
    FOnCloseBtnClick(Sender);
  FrameResize(Self);
end;

function TFrmModuleShortcutsFrame.GetCaptionHeight(ALabel: TUniLabel;
  ACaption: string): Integer;
//const
//  Alignments: array [TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
//  WordWraps: array [Boolean] of Word = (0, DT_WORDBREAK);
//var
//  R: TRect;
//  S: string;
//  Flags, i: Integer;
begin
//  Result := 0;
//  Flags := DT_EXPANDTABS or WordWraps[ALabel.autosize] or
//    Alignments[ALabel.Alignment] or DT_CALCRECT;
//  Flags := ALabel.DrawTextBiDiModeFlags(Flags);
////  ALabel.Canvas.Font := ALabel.Font;
//
//  R := Rect(0, 0, ALabel.Width, 13);
//  S := WrapText(ACaption, #13, ['.', ' ', #9, '-'], ALabel.Width);
//  Winapi.Windows.DrawText(ALabel.Canvas.Handle, PChar(S), Length(S), R, Flags);
//  Result := Max(13, R.Bottom - R.Top);
end;

procedure TFrmModuleShortcutsFrame.SetLabelText(ALabel: TUniLabel;
  ACaption: string);
begin
  with ALabel do
    begin
      // set caption
      Caption := ACaption;
      Font.Name := FSystemFontName;
      AutoSize := True;
      Width := Parent.ClientWidth - 8 - Left;
      AutoSize := False;
      AutoSize := True;
      Invalidate;
    end;
end;

procedure TFrmModuleShortcutsFrame.BeginUpdate;
begin
  FUpdating := True;
  PnlSelected.Visible := False;
  PnlTasks.Visible := False;
end;

procedure TFrmModuleShortcutsFrame.EndUpdate;
begin
  FUpdating := False;
  RealignControls;
end;

procedure TFrmModuleShortcutsFrame.FrameResize(Sender: TObject);
begin
  AlignNodePanel;
  PnlCollapseStatistics.Top := 0;
  PnlCollapseStatistics.Left := PnlDisplay.ClientWidth -
    PnlCollapseStatistics.Width;
end;

function TFrmModuleShortcutsFrame.PanelActionsLabelCount: Integer;
var
  i, j: Integer;
begin
  j := 0;
  for i := 0 to PnlActions.ControlCount - 1 do
    if (PnlActions.Controls[i] is TUniLabel) or
      (PnlActions.Controls[i] is TIQWebHotLabel) then
      Inc(j);
  Result := j;
end;

end.

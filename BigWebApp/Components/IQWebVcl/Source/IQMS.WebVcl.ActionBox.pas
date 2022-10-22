unit IQMS.WebVcl.actionbox;

{ This component displays a list box filled with items from the PopupMenu
  property.  Call Execute or ExecutePos to display the form.

  Example:

    MenuListBox: TMenuListBox;
    ...

    MenuListBox := TMenuListBox.Create(Self);
    MenuListBox.Style := mlsTouchscreen;
    MenuListBox.PopupMenu := PopupMenu1;

    ...

    MenuListBox.Execute;

    *** or ***

    MenuListBox.ExecutePos(Button1.ClientOrigin.X+Button1.Width,
      Button1.ClientOrigin.Y+Button1.Height);



}

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
  Menus,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniMainMenu,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniSpeedButton,
  uniGUIApplication,
  IQMS.WebVcl.ActionBoxFrm;

type
  TMenuListStyle = (mlsNormal, mlsTouchscreen);

  TIQWebActionBox = class(TComponent)
  private
    FPopupMenu: TUniPopupMenu;
    FMenuListStyle: TMenuListStyle;
    FShowCancel: Boolean;
    FShowCaptionBar: Boolean;
    procedure DisplayForm(X, Y: Integer);
    function OSCheckOK: Boolean; // TRUE = Windows 2000 +
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Execute;
    procedure ExecutePos(X, Y: Integer);
  published
    property PopupMenu: TUniPopupMenu read FPopupMenu write FPopupMenu;
    property Style: TMenuListStyle read FMenuListStyle write FMenuListStyle;
    property CancelBtnVisible: Boolean read FShowCancel write FShowCancel;
    property CaptionBarVisible: Boolean read FShowCaptionBar write FShowCaptionBar;
end;

implementation

{ TActionBox }

uses
  IQMS.Common.SysInfo;

constructor TIQWebActionBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FMenuListStyle := mlsTouchscreen;
  FShowCancel := TRUE;
  FShowCaptionBar := TRUE;
end;

destructor TIQWebActionBox.Destroy;
begin
  inherited Destroy;
end;

procedure TIQWebActionBox.Execute;
begin
   // 08/08/2005 - Show popup menu if OS is not supported
   // Ensure the OS is Windows 2000 or better
   if OSCheckOK then
      DisplayForm(-1, -1)
   else
      FPopupMenu.Popup(-1, -1);
end;

procedure TIQWebActionBox.ExecutePos(X, Y: Integer);
begin
   // 08/08/2005 - Show popup menu if OS is not supported
   if OSCheckOK then
      DisplayForm(X, Y)
   else
      FPopupMenu.Popup(X, Y);
end;

procedure TIQWebActionBox.DisplayForm(X, Y: Integer);
var
  i: Integer;
begin
  if not Assigned(FPopupMenu) then Exit;
  if FPopupMenu.Items.Count = 0 then Exit;

  if Assigned(FPopupMenu.OnPopup) then FPopupMenu.OnPopup(Self);
  
  with CreateMenuListFrm( (FMenuListStyle=mlsTouchscreen),
   FShowCancel, FShowCaptionBar, x, y) do
  begin
    for i := 0 to FPopupMenu.Items.Count - 1 do
     if FPopupMenu.Items[i].Visible and FPopupMenu.Items[i].Enabled and
        (FPopupMenu.Items[i].Caption > '') and (FPopupMenu.Items[i].Caption <> '-') then
        AddItem(FPopupMenu.Items[i].Caption, FPopupMenu.Items[i]);

    if HasItems then
       Show;
  end;
end;

function TIQWebActionBox.OSCheckOK: Boolean;
begin
   // Returns TRUE if the Operating System is Windows 2000 or greater.
   // Windows NT is excluded, as are Windows 95/98 and 3.x
   Result := (IQMS.Common.SysInfo.PlatformID >= 2) and (IQMS.Common.SysInfo.IsWinNT4 = FALSE);
end;

end.

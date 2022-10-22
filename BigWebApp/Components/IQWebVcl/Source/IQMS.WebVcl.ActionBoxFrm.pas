unit IQMS.WebVcl.ActionBoxFrm;

{ used by actionbox.pas }

interface

uses
  Windows,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Controls,
  System.Classes,
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
  uniImage;

type
  TListCargo = class
    Action: TNotifyEvent;
    MenuItem: TUniMenuItem;
    constructor Create(AAction: TNotifyEvent; AMenuItem: TUniMenuItem);
  end;

type
  TFrmMenuList = class(TUniForm)
    shpLeft: TUniPanel;
    shpRight: TUniPanel;
    shpBottom: TUniPanel;
    shpTop: TUniPanel;
    PnlCarrier: TUniPanel;
    lstActions: TUniListBox;
    PnlCancel: TUniPanel;
    Shape5: TUniPanel;
    Shape6: TUniPanel;
    PnlCaptionBar: TUniPanel;
    drCaption: TUniPanel;
    imgDots: TUniImage;
    procedure lstActionsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lstActionsMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure DoCancelClick(Sender: TObject);
//    procedure DoFormMouseDown(Sender: TObject; Button: TMouseButton;
//      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    private
      { Private declarations }
      FMaxMenuLength: Integer;
      FCancelBtn: TuniSpeedButton;
      FSimpleList: Boolean;
      //procedure CreateParams(var Params: TCreateParams); override;
  //    procedure WMNCHitTest(var msg: TWMNCHitTest); message WM_NCHITTEST;
      procedure CheckCreateCancelBtn;
      procedure SetFormPos(X, Y: Integer);
    public
      { Public declarations }
      constructor Create( ATouchScreen, AShowCancel,
        AShowCaptionBar: Boolean);
      procedure AddItem(ACaption: string; AMenuItem: TUniMenuItem); overload;
      procedure AddItem(AText: string); overload;
      function ItemCount: Integer;
      function HasItems: Boolean;
      procedure ClearList;
  end;

function CreateMenuListFrm( ATouchScreen, AShowCancel,
  AShowCaptionBar: Boolean; X, Y: Integer): TFrmMenuList;

function CreateSimpleListFrm( ATouchScreen, AShowCancel,
  AShowCaptionBar: Boolean; X, Y: Integer;
  AItems: TStringList; var AItemIndex: Integer): Boolean;

const
  cMinMenuWidth = 250;

var
  FrmMenuList: TFrmMenuList;

implementation

{$R *.dfm}

uses
  IQMS.Common.Numbers,
  //IQMS.Common.Screen,
  IQMS.Common.StringUtils;
  //IQMS.Common.SysInfo;

function CreateMenuListFrm( ATouchScreen, AShowCancel,
    AShowCaptionBar: Boolean; X, Y: Integer): TFrmMenuList;
begin
  Result := TFrmMenuList.Create( ATouchScreen, AShowCancel,
    AShowCaptionBar);

  if Assigned(Result) then
    Result.SetFormPos(X, Y);

end;

function CreateSimpleListFrm( ATouchScreen, AShowCancel, AShowCaptionBar: Boolean; X, Y: Integer;
  AItems: TStringList; var AItemIndex: Integer): Boolean;
var
  i: Integer;
begin
  if not Assigned(AItems) then
    Exit;

  with TFrmMenuList.Create( ATouchScreen, AShowCancel,
    AShowCaptionBar) do
    try
      FSimpleList := TRUE;
      SetFormPos(X, Y);

      for i := 0 to AItems.Count - 1 do
        AddItem(AItems.Strings[i]);

      Result := (lstActions.Items.Count > 0) and (ShowModal = mrOk);

      if Result then
        AItemIndex := lstActions.ItemIndex;

    finally
      Free;
    end;
end;

{ TListCargo }

constructor TListCargo.Create(AAction: TNotifyEvent; AMenuItem: TUniMenuItem);
begin
  Action := AAction;
  MenuItem := AMenuItem;
end;

{ TFrmMenuList }

constructor TFrmMenuList.Create( ATouchScreen, AShowCancel, AShowCaptionBar: Boolean);
begin
  inherited Create(uniGUIApplication.UniApplication);
  if ATouchScreen then
    begin
      Self.Font.Name := 'Tahoma';
      Self.Font.Style := [fsBold];
      Self.Font.Size := 12;
      //lstActions.Style := lbOwnerDrawFixed;
      //lstActions.itItemHeight := 30;
      PnlCancel.Visible := AShowCancel;
      if AShowCancel then
        begin
          PnlCancel.Height := PnlCancel.Height + 5;
          shpBottom.Top := Self.ClientHeight + 10;
        end;
      PnlCaptionBar.Visible := AShowCaptionBar;
    end;
end;

procedure TFrmMenuList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide; // do not Free!
end;

procedure TFrmMenuList.AddItem(ACaption: string; AMenuItem: TUniMenuItem);
var
  i: Integer;
  AAction: TNotifyEvent;
begin
  if AMenuItem <> nil then
    AAction := AMenuItem.OnClick;
  ACaption := IQMS.Common.StringUtils.StrTran(ACaption, '&', ''); // 09/18/2006
  lstActions.Items.AddObject(ACaption, TListCargo.Create(AAction, AMenuItem));
  lstActions.ItemIndex := 0;
  //i := iMax(GetTextWidthPixels(lstActions.Font, ACaption, Self), cMinMenuWidth);
  //FMaxMenuLength := iMax(i, FMaxMenuLength);
end;

procedure TFrmMenuList.AddItem(AText: string);
var
  i: Integer;
  AAction: TNotifyEvent;
begin
  lstActions.Items.AddObject(AText, nil);
  lstActions.ItemIndex := 0;
//  i := iMax(GetTextWidthPixels(lstActions.Font, AText, Self), cMinMenuWidth);
//  FMaxMenuLength := iMax(i, FMaxMenuLength);
end;

procedure TFrmMenuList.ClearList;
begin
  lstActions.Items.Clear;
end;

procedure TFrmMenuList.lstActionsClick(Sender: TObject);
var
  AAction: TNotifyEvent;
  AMenuItem: TUniMenuItem;
begin
  if lstActions.ItemIndex = - 1 then
    Exit;

  if not FSimpleList then
    begin
      // Event to execute
      AAction := TListCargo(lstActions.Items.Objects
        [lstActions.ItemIndex]).Action;
      AMenuItem := TListCargo(lstActions.Items.Objects[lstActions.ItemIndex]
        ).MenuItem;
      // Hide this form
      Close; // this is caHide = (Self.Visible := FALSE)
      Application.ProcessMessages;

      // Execute the menu item event
      if Assigned(AAction) then
        AAction(AMenuItem);
    end
  else
    ModalResult := mrOk;

end;

procedure TFrmMenuList.FormDeactivate(Sender: TObject);
begin
  Application.ProcessMessages;
  Close;
end;

procedure TFrmMenuList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      Key := 0;
      Close;
    end;
end;

procedure TFrmMenuList.lstActionsMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  APt: TPoint;
begin
  APt.X := X;
  APt.Y := Y;
//  lstActions.ItemIndex := lstActions.ItemAtPos(APt, TRUE);
end;

procedure TFrmMenuList.DoCancelClick(Sender: TObject);
begin
  Close;
end;

//procedure TFrmMenuList.CreateParams(var Params: TCreateParams);
//const
//  CS_DROPSHADOW = $00020000;
//begin
//  inherited CreateParams(Params);
//
//  // Adds a drop shadow to the form (supported only by XP)
////  if IQMS.Common.SysInfo.IsWinXP then
////    Params.WindowClass.Style := Params.WindowClass.Style or CS_DROPSHADOW;
//end;

//procedure TFrmMenuList.WMNCHitTest(var msg: TWMNCHitTest);
//begin
//  inherited;
//  if msg.Result = htClient then
//    msg.Result := htCaption;
//end;

//procedure TFrmMenuList.DoFormMouseDown(Sender: TObject; Button: TMouseButton;
//  Shift: TShiftState; X, Y: Integer);
//const
//  SC_DRAGMOVE = $F012;
//begin
//  if Button = mbleft then
//    begin
//      ReleaseCapture;
//      Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
//    end;
//end;

procedure TFrmMenuList.FormShow(Sender: TObject);
var
  h, w: Integer;
begin
  // Initialize
  h := 220;
  w := 200;

  // Get the height of the form
  // We want to show as many items as possible, but we don't want to
  // overshoot the screen size
//  h := (lstActions.Count * (lstActions.ItemHeight + 1)) +
//    (PnlCarrier.BorderWidth * 2) + iIIf(PnlCancel.Visible, PnlCancel.Height, 0)
//    + PnlCaptionBar.Height;
//  h := iMin(h, Screen.DesktopHeight - (Self.Top + 50));
//  h := iMax(h, 220);
//  Height := h;
//  // Get the width of the form
//  w := FMaxMenuLength + (PnlCarrier.BorderWidth * 2) + 22;
//  Width := w;
//
//  // Dots image (froo froo)
//  imgDots.Left := (drCaption.Width div 2) - (imgDots.Width div 2);

  CheckCreateCancelBtn;

end;

procedure TFrmMenuList.CheckCreateCancelBtn;
begin
  if not Assigned(FCancelBtn) then
    FCancelBtn := TuniSpeedButton.Create(Self);
  with FCancelBtn do
    begin
      Parent := PnlCancel;
      Left := 5;
      Top := 4;
      Width := PnlCancel.ClientWidth - 10;
      Height := PnlCancel.ClientHeight - 8;
      Anchors := [akLeft, akTop, akRight, akBottom];
      Caption := 'Cancel ...';
      OnClick := DoCancelClick;
      Visible := TRUE;
    end;

end;

procedure TFrmMenuList.SetFormPos(X, Y: Integer);
begin
  // form position
  if (X > - 1) and (Y > - 1) then
    begin
      Left := X;
      Top := Y;
    end
  else // CenterForm(Self);
    // Don't center on desktop; center on main form.  The user may be
    // using dual monitors.
    begin
//      Self.Left :=Application.Left +
//        ((Application.MainForm.Width div 2) - (Self.Width div 2));
//      Self.Top := Application.MainForm.Top +
//        ((Application.MainForm.Height div 2) - (Self.Height div 2));
    end;
end;

function TFrmMenuList.HasItems: Boolean;
begin
  Result := lstActions.Items.Count > 0;
end;

function TFrmMenuList.ItemCount: Integer;
begin
  Result := lstActions.Items.Count;
end;

end.

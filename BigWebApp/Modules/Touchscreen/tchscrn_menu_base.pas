unit tchscrn_menu_base;

{ ******************************************************************************
  How to use this unit:

  Basics:
  -----------------------------------------------------------------------------
  1.  Add this "base" unit in your project.  Make sure you remove it from
      the list of automatically created forms.

  2.  Create a new form unit that inherits from this unit.

  3.  Add speed buttons (TSpeedButton) to the TFlowPanel on the default panel.
      3.1 Ensure the speed button is not Flat, and not Transparent.  You want
          your buttons to look like actual buttons.  This ensures the buttons
          will look good against any colored background because the background
          color can change, depending on EPlant.
      3.2 Assign the button unique Tag value.  The tag value will
          be used to determine which button was clicked.
      3.3 Assign the default event, DoButtonClick() to the the OnClick event
          of the new button.
      3.4 To adjust the sequence of buttons, in the list of the speedbutton's
          properties, locate the property called, ControlIndex, which will be at
          the very bottom of the Properties list.  It is not in alphabetical
          order. Change the ControlIndex of the button as needed.

  4.  In your main form, call the DoShow() procedure to invoke the form.
      See sd_main.pas in \IQWin\Shopdata for an example.

  Security:
  -----------------------------------------------------------------------------
  1.  Change the SecurityCode of the SR (TSecurityRegister).  The name
      must be unique so that security will apply only to your menu form.

  2.  Add the SecurityCode to the ForceAccessItems property.  Users
      should at least be able to access the form with having security.
      This is a menu form, that's all.

  3.  Add the button names to the SecurityItems list.

  Adding another page (TTabSheet):
  -----------------------------------------------------------------------------
  1.  Right-click on pcMain (TPageControl), and select New Page.

  2.  On the default, TabSheet1, copy PnlMenuButtonList and everything
      it contains, and then paste it onto the new tab sheet.  This way
      you have everything you need without adding components one-by-one.
      Make sure ParentColor = True on all of your container controls.

  3.  Rename controls as needed, and add your buttons.

  Modifying controls at run-time:
  -----------------------------------------------------------------------------
  1.  Override the protected method, UpdateControlSecurity.  This method
      is called in FormShow of this base unit.

  2.  In your UpdateControlSecurity procedure, do the following:
      - Apply module licensing if necessary (IQApps.pas).
      - Apply additional security to controls.  For example, you would only
        show the "Security Inspector" button if the user is a DBA.
      - Check for empty flow controls (TFlowControl) or tab sheets (TTabSheet).
        If a page is completely empty -- meaning, there are no available
        controls under the current security role -- set the Enabled
        property to False on the TTabSheet.
        For example:
        TabSheet2.Enabled := iqctrl.VisibleControlCount(FlowPanel2) > 0;


  Note:
  The "Back" and "More" buttons will display automatically if you have
  more than one tabsheet.

  **************************************************************************** }

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel,
  uniPageControl, uniMainMenu;

type
  { TFrmTouchScreenMenuBase }
  TFrmTouchScreenMenuBase = class(TUniForm)
    FlowPanel1: TUniPanel;
    PnlBottomButtons: TUniPanel;
    sbtnMore: TUniSpeedButton;
    PnlMain: TUniPanel;
    PnlCaption: TUniPanel;
    lblMenu: TUniLabel;
    PnlMenuList1: TUniPanel;
    PnlPageControlCarrier: TUniPanel;
    pcMain: TUniPageControl;
    TabSheet1: TUniTabSheet;
    sbtnPrior: TUniSpeedButton;
    bvLeftSpacer: TUniPanel;
    bvRightSpacer: TUniPanel;
    MainMenu1: TUniMainMenu;
    Hidden1: TUniMenuItem;
    Exit1: TUniMenuItem;
    shpButtonBar: TUniPanel;
    sbtnClose: TUniSpeedButton;
    shpLeftBorder: TUniPanel;
    shpRightBorder: TUniPanel;
    shpTopBorder: TUniPanel;
    SR: TIQWebSecurityRegister;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnMoreClick(Sender: TObject);
    procedure DoButtonClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sbtnPriorClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    strict private
      { Private declarations }
      FSelectedValue: Integer;
      FButtonClickEvent: TNotifyEvent;
      FLabelFontColor: TColor;
      FSavedUserName: string;
      procedure SetModalButtonPositions;
      function GetBackgroundColor: TColor;
      procedure ApplyBackgroundColor;
      procedure ProcessButtonClick(Sender: TUniSpeedButton);
      procedure RefreshSecurity(SecurityRegister: TIQWebSecurityRegister);
    strict protected
      { Protected declarations }
      procedure SetControls; virtual;
      procedure UpdateControlSecurity; virtual;
    public
      { Public declarations }
      class procedure DoShow(
        AButtonClickEvent: TNotifyEvent); virtual;
      procedure SetControlVisible(const AControlName: string;
        AVisible: Boolean);
      procedure SetControlEnabled(const AControlName: string;
        AEnabled: Boolean);
      property SelectedValue: Integer read FSelectedValue;
      property OnButtonClick: TNotifyEvent read FButtonClickEvent
        write FButtonClickEvent;
      property LabelFontColor: TColor read FLabelFontColor;
  end;

const
  DEFAULT_MENU_COLOR: TColor = clWhite;

//var
//  FrmTouchScreenMenuBase: TFrmTouchScreenMenuBase;

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.Graphics,
  IQMS.Common.Screen,
  { TODO -oSanketG -cWC : Need to revisit }
  //iqsecins,
  IQMS.WebVcl.SecurityManager;

procedure TFrmTouchScreenMenuBase.FormCreate(Sender: TObject);
begin
  // Initialize fields (variables)
  FSavedUserName := SecurityManager.UserName;
  FSelectedValue := - 1;
  FButtonClickEvent := nil;
  // Note: Instead of the touch-screen font, we apply the system font.
  IQMS.Common.Screen.ApplySystemFont(Self);
  // Always center the menu form on the touch-screen parent.
  { TODO -oSanketG -cWC : Need to revisit ,
  [dcc32 Error] tchscrn_menu_base.pas(192): E2010 Incompatible types: 'TForm' and 'TFrmTouchScreenMenuBase'}
  //IQMS.Common.Controls.CenterForm(Self, True);
  // Adjust controls
  IQMS.Common.Controls.AdjustPageControlToParent(pcMain);
  SetModalButtonPositions;
  SetControls;
end;

procedure TFrmTouchScreenMenuBase.FormDeactivate(Sender: TObject);
begin
  { TODO -oSanketG -cWC : Need to revisit , dependent on IQsecins}
  {if IQMS.Common.Controls.FindFormByClassType(TSecurityInspector) = nil then
    Exit1.Click;}
end;

class procedure TFrmTouchScreenMenuBase.DoShow(
  AButtonClickEvent: TNotifyEvent);
var
  AForm: TUniForm;
begin
  { TODO -oSanketG -cWC : [dcc32 Error] tchscrn_menu_base.pas(213): E2010 Incompatible types: 'TUniForm' and 'TForm'}
  //AForm := IQMS.Common.Controls.FindFormByClassType(TFrmTouchScreenMenuBase) as TUniForm;
  if not Assigned(AForm) then
    AForm := Self.Create(uniGUIApplication.UniApplication);
  TFrmTouchScreenMenuBase(AForm).OnButtonClick := AButtonClickEvent;
  AForm.Show;
end;

procedure TFrmTouchScreenMenuBase.FormShow(Sender: TObject);
begin
  // Refresh security. This is a local method (see below) which
  // checks the user name, in case the end-user has re-logged in
  // as another user, and ensures security is applied.  This is
  // required because we do not free this form; we only hide it.
  RefreshSecurity(SR);
  // Call the virtual method to make any last-second adjustments
  // to the controls.  This is provided by descendent form units.
  UpdateControlSecurity;
  // Set the navigation Vcl.Buttons on this form.
  SetControls;
  // Apply the background color.  This can change according to
  // system or Eplant settings.
  ApplyBackgroundColor;
  // Ensure the security inspector is always on top of this form.
  { TODO -oSanketG -cWC : Need to revisit, dependent on iqsecins }
  //iqsecins.EnsureSecurityInspectorOnTopOf(Self);
end;

procedure TFrmTouchScreenMenuBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Hide, do not free
  Action := caHide;
end;

procedure TFrmTouchScreenMenuBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // This is for keyboard users.
  // If the Escape key is pressed, hide the form.
  if Key = VK_ESCAPE then
    begin
      Key := 0;
      PostMessage(Handle, WM_COMMAND, Exit1.Command, 0);
    end
    // If the left or down arrow is pressed, click the "Prior" button
  else if (Key = VK_LEFT) or (Key = VK_DOWN) then
    begin
      sbtnPriorClick(sbtnPrior);
      Key := 0;
    end
    // If the right or up arrow is pressed, click the "Next" button
  else if (Key = VK_RIGHT) or (Key = VK_UP) then
    begin
      sbtnMoreClick(sbtnMore);
      Key := 0;
    end;
end;

procedure TFrmTouchScreenMenuBase.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTouchScreenMenuBase.SetControlVisible(const AControlName: string;
  AVisible: Boolean);
var
  AControl: TControl;
begin
  AControl := TUniForm(Self).FindChildControl(AControlName);
  if AControl <> nil then
    AControl.Visible := AVisible;
end;

procedure TFrmTouchScreenMenuBase.SetControlEnabled(const AControlName: string;
  AEnabled: Boolean);
var
  AControl: TControl;
begin
  AControl := TUniForm(Self).FindChildControl(AControlName);
  if AControl <> nil then
    AControl.Enabled := AEnabled;
end;

procedure TFrmTouchScreenMenuBase.SetModalButtonPositions;
begin
  // Set the modal button positions according to form size
  sbtnPrior.Left := 19;
  sbtnPrior.Top := 9;
  sbtnMore.Left := sbtnPrior.Left + sbtnPrior.Width + 8;
  sbtnMore.Top := sbtnPrior.Top;
  sbtnClose.Left := PnlBottomButtons.ClientWidth - (sbtnClose.Width + 19);
  sbtnClose.Top := sbtnPrior.Top;
end;

procedure TFrmTouchScreenMenuBase.UpdateControlSecurity;
begin
  // Provided by descendant.  This method is called in FormShow.
  // It is intended to be overridden by descendent form units
  // in order to apply licensing and update controls under
  // the current security role.
end;

procedure TFrmTouchScreenMenuBase.DoButtonClick(Sender: TObject);
begin
  // This is the default button click.  Every speed button (TSpeedButton)
  // on this form should execute this event OnClick.
  if (Sender is TUniSpeedButton) then
    // Process the click.  See below.
    ProcessButtonClick(Sender as TUniSpeedButton);
end;

procedure TFrmTouchScreenMenuBase.ProcessButtonClick(Sender: TUniSpeedButton);
begin
  // Hide the form
  Self.Visible := False;
  // Get the selected Tag
  FSelectedValue := TUniSpeedButton(Sender).Tag;
  // Execute the button event, if provided
  if Assigned(FButtonClickEvent) then
    FButtonClickEvent(Sender);
  // Close the form
  PostMessage(Handle, WM_COMMAND, Exit1.Command, 0);
end;

procedure TFrmTouchScreenMenuBase.RefreshSecurity(
  SecurityRegister: TIQWebSecurityRegister);
var
  i: Integer;
  AName: string;
  AComponent: TComponent;
begin
  // This method applies security if the user has logged in with
  // another Oracle user account.
  if Assigned(SecurityRegister) and
    (CompareText(SecurityManager.UserName, FSavedUserName) <> 0) then
    begin
      // Assign the new user name to the private field (variable)
      FSavedUserName := SecurityManager.UserName;
      // Reset the screen so the main page shows first
      pcMain.ActivePageIndex := 0;
      // First, set all security components visible and enabled.
      // This is required if the user has re-logged in as IQMS,
      // after having been logged in as a standard user with
      // restricted security.  If we don't do this, then even
      // for user IQMS some controls will be invisible or disabled.
      for i := 0 to SecurityRegister.SecurityItems.Count - 1 do
        begin
          AName := SecurityRegister.SecurityItems.Strings[i];
          AComponent := Self.FindComponent(AName);
          if (AComponent <> nil) and (AComponent is TControl) then
            begin
              TControl(AComponent).Visible := True;
              TControl(AComponent).Enabled := True;
            end;
        end;
      // Read security for the new user
      SecurityRegister.ReadSecurityData(SecurityManager.UserName);
      // Apply security
      SecurityRegister.Apply;
    end;
end;

procedure TFrmTouchScreenMenuBase.sbtnMoreClick(Sender: TObject);
var
  ATabSheet: TUniTabSheet;
begin
  // The "More" button shows the next page
  // Get the next TTabSheet that is enabled.
  // Note:  Checking for enabled prevents displaying either an empty
  // page, or a page that has inaccessible to the user.
    { TODO -oSanketG -cWC : [dcc32 Error] tchscrn_menu_base.pas(387): E2010 Incompatible types: 'TTabSheet' and 'TUniTabSheet'
  [dcc32 Error] tchscrn_menu_base.pas(383): E2010 Incompatible types: 'TTabSheet' and 'TUniTabSheet'}
  //ATabSheet := IQMS.Common.Controls.NextEnabledPage(pcMain.ActivePage);
  if ATabSheet <> nil then
    pcMain.ActivePage := ATabSheet;
  SetControls;
end;

procedure TFrmTouchScreenMenuBase.sbtnPriorClick(Sender: TObject);
var
  ATabSheet: TUniTabSheet;
begin
  // The "Prior" button shows the previous page
  // Get the prior TTabSheet that is enabled.
  // Note:  Checking for enabled prevents displaying either an empty
  // page, or a page that has inaccessible to the user.
  { TODO -oSanketG -cWC : Need to revisit,
  [dcc32 Error] tchscrn_menu_base.pas(397): E2010 Incompatible types: 'TTabSheet' and 'TUniTabSheet' }
  //ATabSheet := IQMS.Common.Controls.PriorEnabledPage(pcMain.ActivePage);
  if ATabSheet <> nil then
    pcMain.ActivePage := ATabSheet;
  SetControls;
end;

procedure TFrmTouchScreenMenuBase.SetControls;
var
  AEnabledCount: Integer;
  ATabSheet: TUniTabSheet;
begin
  // Update the navigation Vcl.Buttons, either enabled or disabled,
  // based on the number of visible pages and the currently
  // selected page.
  // Note:  We cannot rely on the PageCount property because
  // it is possible that some TTabSheets will be hidden
  // (Visible = False) intentionally.  We want to skip hidden
  // tab sheets.
  AEnabledCount := IQMS.Common.Controls.EnabledPageCount(pcMain);
  sbtnMore.Visible := AEnabledCount > 1;
  sbtnPrior.Visible := AEnabledCount > 1;
  { TODO -oSanketG -cWC : Need to revisit,
  [dcc32 Error] tchscrn_menu_base.pas(397): E2010 Incompatible types: 'TTabSheet' and 'TUniTabSheet' }
  //ATabSheet := IQMS.Common.Controls.NextEnabledPage(pcMain.ActivePage);
  sbtnMore.Enabled := (ATabSheet <> nil) and (ATabSheet <> pcMain.ActivePage);
  { TODO -oSanketG -cWC : Need to revisit,
  [dcc32 Error] tchscrn_menu_base.pas(397): E2010 Incompatible types: 'TTabSheet' and 'TUniTabSheet' }
  //ATabSheet := IQMS.Common.Controls.PriorEnabledPage(pcMain.ActivePage);
  sbtnPrior.Enabled := (ATabSheet <> nil) and (ATabSheet <> pcMain.ActivePage);
end;

function TFrmTouchScreenMenuBase.GetBackgroundColor: TColor;
begin
  Result := DEFAULT_MENU_COLOR;
end;

procedure TFrmTouchScreenMenuBase.ApplyBackgroundColor;
var
  i: Integer;
begin
  Self.Color := GetBackgroundColor;
  if SecurityManager.LoggedIntoEPlant then
    Self.Color := SecurityManager.Color;
  FLabelFontColor := IQMS.Common.Graphics.GetFontColor(Self.Color);
  Self.Font.Color := FLabelFontColor;
  lblMenu.Font.Color := FLabelFontColor;
  for i := 0 to Self.ComponentCount - 1 do
    if Self.Components[i] is TUniLabel then
      TUniLabel(Self.Components[i]).Font.Color := FLabelFontColor;
end;

end.

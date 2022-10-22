unit crm_principle_source_display;

{ ** Principal Source Display bar ** }

{ This component displays the principal source information, and is usually
  aligned to the top of the form.

  This component cannot be added to the standard, IQMS component pallette
  because it uses CRM units.

  *** History ***

  05/13/2008
  Hide telephone information for employees.  Requested by Nancy.

  05/15/2009
  Ensure the company telephone displays for customers, venders and
  partners in the collapsed view.  Reported by Susan.

}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  Vcl.Buttons,
  IQMS.WebVcl.HotLabel,
  System.Math,
  System.SyncObjs,
  IQMS.Common.PrincipalSourceTypes,
  DM_CRMIMG,
  FireDAC.Phys,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  IQMS.common.dataconst,
  uniBitBtn,
  uniSpeedButton,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  UniCanvas,
  uniLabel, UniPanel;

type
  TPincipleSourceDisplayTheme = (psdWindowsStandard, psdWindowsXPBlue,
    psdWindowsXPOrange);

type
  TPrincipalSourceDisplayColors = packed record
    BackColor, GradientLtColor, GradientDkColor, BorderLtColor,
      BorderDkColor: TColor;
  end;

type
  TPrincipalSourceDisplay = class(TUniPanel)
    lblPrincipleDisplay: TIQWebHotLabel;
    lblEMail: TIQWebHotLabel;
    lblContactTelephoneLabel: TUniLabel;
    lblContactCellTelephoneLabel: TUniLabel;
    lblContactTelephone: TUniLabel;
    lblContactCellTelephone: TUniLabel;
    lblContactFaxLabel: TUniLabel;
    lblContactFax: TUniLabel;

    lblAddress1: TUniLabel;
    lblAddress2: TUniLabel;
    lblAddress3: TUniLabel;
    lblCompanyTelephoneLabel: TUniLabel;
    lblCompanyTelephone: TUniLabel;
    lblCompanyFaxLabel: TUniLabel;
    lblCompanyFax: TUniLabel;
    lblWebSiteURLLabel: TUniLabel;
    lblWebSiteURL: TIQWebHoTLabel;

    sbtnAssign: TUniSpeedButton;
    sbtnExpand: TUniSpeedButton;
    Background: TUniCanvas;
    lblAssignPrinciple: TIQWebHoTLabel;
    PSourceMenu: TUniPopupMenu;
    SelectSource1: TUniMenuItem;
    SelectContact1: TUniMenuItem;
    procedure OnEMailClick(Sender: TObject);
    procedure OnWebSiteURLClick(Sender: TObject);
    procedure OnPrincipleClick(Sender: TObject);
    procedure DoOnResize(Sender: TUniControl; x,y:integer);
    procedure DoExpandCollapse(Sender: TObject);
    procedure DoChangePrincipleClick(Sender: TObject);
    procedure DoAssignPrincipleClick(Sender: TObject);
    procedure DoAssignContactClick(Sender: TObject);
    private
      { Private declarations }
      FPrincipalContactID: Real;
      FPrincipalSourceID: Real;
      FPrincipalSource: string;
      FPrincipalDisplay: string;
      FPrincipalDisplayRec: TPrincipalDisplayRec;

      FOnAssignPrincipleClick: TNotifyEvent;
      FOnAssignContactClick: TNotifyEvent;

      FCRMActivityID: Real;

      FPrincipleSourceDisplayColors: TPrincipalSourceDisplayColors;
      FPincipleSourceDisplayTheme: TPincipleSourceDisplayTheme;
      FExpanded: Boolean;
      FExpandedHeight: Integer;
      // procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
      // procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
      // procedure WMMouseMove(var Message: TMessage); message WM_MOUSEMOVE;
      FLock: TCriticalSection;


      procedure DoPaint(Sender: TObject);
      procedure DrawFrame;
      procedure ButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

      procedure ApplyThemeColors(APincipleSourceDisplayTheme
        : TPincipleSourceDisplayTheme);

      procedure SetCRMActivityID(const Value: Real);
      procedure SetPincipleSourceDisplayTheme(const Value
        : TPincipleSourceDisplayTheme);
      procedure SetExpanded(const Value: Boolean);

      procedure SeTUniLabels(const APrincipalSourceDisplay, AEMail, AddressLine1,
        AddressLine2, AddressLine3, AContactTelephone, AContactCellTelephone,
        AContactFax, ACompanyTelephone, ACompanyFax, AWebSiteURL: string);
      procedure CheckHasSource;
      procedure CheckHeight;
      procedure Reset;
      function TelephoneAndExt(const ATelephone, AExt: string): string;
      procedure SetExpandBtnImage;

      function HasSource: Boolean;
      function CheckComponentState: Boolean;
      procedure Slide(AExpanded: Boolean);
      procedure SetExpandBtnPos;

    protected
      { Protected declarations }
      ImageDM: TCRMIMG_DM;
      procedure Loaded; override;
      procedure RefreshByCRMActivityID;
      procedure RefreshBySource;
    public
      { Public declarations }
      constructor Create(AOwner: TComponent);
      destructor Destroy; override;

      procedure RefreshDisplay; // based on CRMActivityID
      procedure ShowSummary;
      procedure SendEMail;
      procedure GoToWebSite;

    published
      { Published declarations }
      property CRMActivityID: Real
        read FCRMActivityID
        write SetCRMActivityID;

      property PrincipleSource: string
        read FPrincipalSource
        write FPrincipalSource;
      property PrincipleSourceID: Real
        read FPrincipalSourceID
        write FPrincipalSourceID;
      property PrincipleContactID: Real
        read FPrincipalContactID
        write FPrincipalContactID;

      property ColorTheme: TPincipleSourceDisplayTheme
        read FPincipleSourceDisplayTheme
        write SetPincipleSourceDisplayTheme
        default psdWindowsStandard;

      property Expanded: Boolean
        read FExpanded
        write SetExpanded;

      // Executes when user clicks button or link to assign a principal
      property OnAssignPrincipleClick: TNotifyEvent
        read FOnAssignPrincipleClick
        write FOnAssignPrincipleClick;
      property OnAssignContactClick: TNotifyEvent
        read FOnAssignContactClick
        write FOnAssignContactClick;

      property Align;
      property Alignment;
      property Anchors;
      property Constraints;
      property UseDockManager
        default True;
      property DockSite;
      property DragCursor;
      property DragKind;
      property DragMode;
      // property Enabled;
      // property Locked;
      property PopupMenu;
      property TabOrder;
      property TabStop;
      property Visible;

      // property OnCanResize;
      // property OnClick;
      // property OnConstrainedResize;
      // property OnContextPopup;
      property OnDockDrop;
      property OnDockOver;
      // property OnDblClick;
      property OnDragDrop;
      property OnDragOver;
      property OnEndDock;
      property OnEndDrag;
      // property OnEnter;
      // property OnExit;
      // property OnGetSiteInfo;
      // property OnMouseDown;
      // property OnMouseMove;
      // property OnMouseUp;
      // property OnResize;
      property OnStartDock;
      property OnStartDrag;
      property OnUnDock;

  end;

resourcestring
  cRsc0000001 = 'Change Company';
  cRsc0000002 = 'Change Contact Only';
  cRsc0000003 = 'Contact Telephone:';
  cRsc0000004 = 'Contact Fax:';
  cRsc0000005 = 'Company Telephone:';
  cRsc0000006 = 'Company Fax:';
  cRsc0000007 = 'Web Site:';
  cRsc0000008 = 'Assign Principal';
  cRsc0000009 = 'Expand';
  cRsc0000010 = 'No principal assigned (click here to assign a principal)';
  cRsc0000011 = '%s, Ext. %s';
  cRsc0000012 = 'Collapse detail';
  cRsc0000013 = 'Expand to show detail';
  cRsc0000014 = 'Contact Cell Telephone:';
  cRsc0000015 = '';
  cRsc0000016 = '';
  cRsc0000017 = '';
  cRsc0000018 = '';
  cRsc0000019 = '';
  cRsc0000020 = '';

const
  cStandardHeight = 43;
  cShortHeight = 28;
  cExpandedHeight = 98; // 82;
  cInitWidth = 688;

  Column1Left = 35;
  Column2Left = 235;

  Column1 = 1;
  Column2 = 2;
  Column2Value = 3;

implementation

uses
  IQMS.Common.Controls,
  IQMS.Common.Graphics,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.StringUtils,
  IQMS.Common.PrincipalSource;

{ TPrincipalSourceDisplay }

constructor TPrincipalSourceDisplay.Create(AOwner: TComponent);
const
  C_LABEL_BUFFER = 16;
  C_LABEL_TOP = 7;
var
  AParent: TWinControl;
  ATop: Integer;

  // ---------------------------------------------------------------------------
  procedure _CreateLabel(const ALeft, ATop, ATag: Integer; var ALabel: TUniLabel;
    ACaption: string = ''; ABold: Boolean = False);
  begin
    ALabel := TUniLabel.Create(Self);
    with ALabel do
      begin
        Parent := AParent;
        Left := ALeft;
        Top := ATop;
        Caption := ACaption;
        if ABold then
          Font.Style := [fsBold];
        Transparent := True;
        Tag := ATag;
      end;
  end;
// ---------------------------------------------------------------------------
  procedure _CreateHoTUniLabel(const ALeft, ATop, ATag: Integer;
    AClickEvent: TNotifyEvent; var AHoTUniLabel: TIQWebHoTLabel;
    ACaption: string = ''; ABold: Boolean = False);
  begin
    AHoTUniLabel := TIQWebHoTLabel.Create(Self);
    with AHoTUniLabel do
      begin
        Parent := AParent;
        Left := ALeft;
        Top := ATop;
        Caption := ACaption;
        if ABold then
          Font.Style := [fsBold];
        Transparent := True;
        Tag := ATag;
        OnClick := AClickEvent;
      end;
  end;
// ---------------------------------------------------------------------------

begin
  inherited Create(AOwner);

  ControlStyle := [csAcceptsControls, csFixedHeight, csCaptureMouse,
    csClickEvents, csDoubleClicks, csOpaque, csReplicatable,
    csDesignInteractive, csDisplayDragImage, csActionClient, csMenuEvents];

  ControlStyle := ControlStyle - [csSetCaption];

  AParent := Self;

  Caption := '';
  Color := clBtnFace; // we may change this once the component is loaded
  Width := cInitWidth;
  Height := cStandardHeight;
  BevelInner := bvNone;
  BevelOuter := bvNone;
  ParentBackground := False;
  DoubleBuffered := True;
  OnResize := DoOnResize;

  ImageDM := TCRMIMG_DM.Create(Self);
  ImageDM.Name := '';

  SelectSource1 := TUniMenuItem.Create(Self);
  with SelectSource1 do
    begin
      Caption := cRsc0000001; // 'Change Company';
      OnClick := DoAssignPrincipleClick;
      default := True;
    end;

  SelectContact1 := TUniMenuItem.Create(Self);
  with SelectContact1 do
    begin
      Caption := cRsc0000002; // 'Change Contact Only';
      OnClick := DoAssignContactClick;
    end;

  PSourceMenu := TUniPopupMenu.Create(Self);
  PSourceMenu.Items.Add(SelectSource1);
  PSourceMenu.Items.Add(SelectContact1);

  Background := TUniCanvas.Create(Self);
  with Background do
    begin
      Parent := AParent;
      Align := alClient;
//      OnPaint := DoPaint;
    end;

  // Column 1
  ATop := C_LABEL_TOP;
  _CreateHoTUniLabel(Column1Left { ALeft } , ATop, Column1 { ATag } ,
    OnPrincipleClick { AClickEvent } , lblPrincipleDisplay { AHoTUniLabel } ,
    '' { ACaption } , True { Bold } );
  lblPrincipleDisplay.Font.Color := clBlack;

  ATop := C_LABEL_TOP + C_LABEL_BUFFER;
  _CreateHoTUniLabel(Column1Left { ALeft } , ATop, Column1 { ATag } ,
    OnEMailClick { AClickEvent } , lblEMail { AHoTUniLabel } );

  ATop := C_LABEL_TOP + (C_LABEL_BUFFER * 2);
  _CreateLabel(Column1Left { ALeft } , ATop, Column1 { ATag } ,
    lblAddress1 { ALabel } );

  ATop := C_LABEL_TOP + (C_LABEL_BUFFER * 3);
  _CreateLabel(Column1Left { ALeft } , ATop, Column1 { ATag } ,
    lblAddress2 { ALabel } );

  ATop := C_LABEL_TOP + (C_LABEL_BUFFER * 4);
  _CreateLabel(Column1Left { ALeft } , ATop, Column1 { ATag } ,
    lblAddress3 { ALabel } );

  // Column 2
  ATop := C_LABEL_TOP;
  _CreateLabel(Column2Left { ALeft } , ATop, Column2 { ATag } ,
    lblContactTelephoneLabel { ALabel } ,
    cRsc0000003 { 'Contact Telephone:' } { ACaption } , True { ABold } );
  _CreateLabel(307 { ALeft } , ATop, Column2Value { ATag } ,
    lblContactTelephone { ALabel } );

  ATop := C_LABEL_TOP + (C_LABEL_BUFFER * 1);
  _CreateLabel(Column2Left { ALeft } , ATop, Column2 { ATag } ,
    lblContactCellTelephoneLabel { ALabel } ,
    cRsc0000014 { 'Contact Cell Telephone:' } { ACaption } , True { ABold } );
  _CreateLabel(307 { ALeft } , ATop, Column2Value { ATag } ,
    lblContactCellTelephone { ALabel } );

  ATop := C_LABEL_TOP + (C_LABEL_BUFFER * 2);
  _CreateLabel(Column2Left { ALeft } , ATop, Column2 { ATag } ,
    lblContactFaxLabel { ALabel } ,
    cRsc0000004 { 'Contact Fax:' } { ACaption } , True { ABold } );
  _CreateLabel(267 { ALeft } , ATop, Column2Value { ATag } ,
    lblContactFax { ALabel } );

  ATop := C_LABEL_TOP + (C_LABEL_BUFFER * 3);
  _CreateLabel(Column2Left { ALeft } , ATop, Column2 { ATag } ,
    lblCompanyTelephoneLabel { ALabel } ,
    cRsc0000005 { 'Company Telephone:' } { ACaption } , True { ABold } );
  _CreateLabel(363 { ALeft } , ATop, Column2Value { ATag } ,
    lblCompanyTelephone { ALabel } );

  ATop := C_LABEL_TOP + (C_LABEL_BUFFER * 4);
  _CreateLabel(Column2Left { ALeft } , ATop, Column2 { ATag } ,
    lblCompanyFaxLabel { ALabel } ,
    cRsc0000006 { 'Company Fax:' } { ACaption } , True { ABold } );
  _CreateLabel(323 { ALeft } , ATop, Column2Value { ATag } ,
    lblCompanyFax { ALabel } );

  ATop := C_LABEL_TOP + (C_LABEL_BUFFER * 5);
  _CreateLabel(Column2Left { ALeft } , ATop, Column2 { ATag } ,
    lblWebSiteURLLabel { ALabel } , cRsc0000007 { 'Web Site:' } { ACaption } ,
    True { ABold } );
  _CreateHoTUniLabel(Column2Left { ALeft } , ATop, Column2Value { ATag } ,
    OnWebSiteURLClick { AClickEvent } , lblWebSiteURL { AHoTUniLabel } );

  sbtnAssign := TUniSpeedButton.Create(Self);
  with sbtnAssign do
    begin
      Parent := AParent;
      Left := 8;
      Top := 3;
      Width := 22;
      Height := 22;
      ShowHint := True;
      Hint := cRsc0000008; // 'Assign Principal'
      OnClick := DoChangePrincipleClick;
    end;
  ImageDM.AssignStandardImage(sbtnAssign, DM_CRMIMG.imagePrincipal16x16);

  sbtnExpand := TUniSpeedButton.Create(Self);
  with sbtnExpand do
    begin
      Parent := AParent;
      Anchors := [akLeft, akTop];
      Left := cInitWidth - 30;
      Top := 3;
      Width := 22;
      Height := 22;
      ShowHint := True;
      Hint := cRsc0000009; // 'Expand'
      OnClick := DoExpandCollapse;
    end;
  ImageDM.AssignStandardImage(sbtnExpand, DM_CRMIMG.imageExpand16x16);

  _CreateHoTUniLabel(Column1Left { ALeft } , 7 { ATop } , Column1 { ATag } ,
    DoAssignPrincipleClick { AClickEvent } , lblAssignPrinciple { AHoTUniLabel } );
  // 'No principal assigned (click here to assign a principal)'
  lblAssignPrinciple.Caption := cRsc0000010;

  FLock := TCriticalSection.Create;
end;

destructor TPrincipalSourceDisplay.Destroy;
begin
  if Assigned(lblPrincipleDisplay) then
    FreeAndNil(lblPrincipleDisplay);
  if Assigned(lblEMail) then
    FreeAndNil(lblEMail);
  if Assigned(lblContactTelephoneLabel) then
    FreeAndNil(lblContactTelephoneLabel);
  if Assigned(lblContactTelephone) then
    FreeAndNil(lblContactTelephone);
  if Assigned(lblContactCellTelephoneLabel) then
    FreeAndNil(lblContactCellTelephoneLabel);
  if Assigned(lblContactCellTelephone) then
    FreeAndNil(lblContactCellTelephone);
  if Assigned(lblContactFaxLabel) then
    FreeAndNil(lblContactFaxLabel);
  if Assigned(lblContactFax) then
    FreeAndNil(lblContactFax);
  if Assigned(sbtnAssign) then
    FreeAndNil(sbtnAssign);
  if Assigned(lblAssignPrinciple) then
    FreeAndNil(lblAssignPrinciple);

  if Assigned(lblAddress1) then
    FreeAndNil(lblAddress1);
  if Assigned(lblAddress2) then
    FreeAndNil(lblAddress2);
  if Assigned(lblAddress3) then
    FreeAndNil(lblAddress3);
  if Assigned(lblCompanyTelephoneLabel) then
    FreeAndNil(lblCompanyTelephoneLabel);
  if Assigned(lblCompanyTelephone) then
    FreeAndNil(lblCompanyTelephone);
  if Assigned(lblCompanyFaxLabel) then
    FreeAndNil(lblCompanyFaxLabel);
  if Assigned(lblCompanyFax) then
    FreeAndNil(lblCompanyFax);
  if Assigned(lblWebSiteURLLabel) then
    FreeAndNil(lblWebSiteURLLabel);
  if Assigned(lblWebSiteURL) then
    FreeAndNil(lblWebSiteURL);
  if Assigned(FLock) then
    FreeAndNil(FLock);
  inherited Destroy;
end;

procedure TPrincipalSourceDisplay.Loaded;
begin
  inherited;
  ApplyThemeColors(psdWindowsStandard);
  SetExpandBtnImage;
end;

procedure TPrincipalSourceDisplay.ButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
   PSourceMenu.Popup(x,y,sender);
end;

function TPrincipalSourceDisplay.CheckComponentState: Boolean;
begin
  // Returns FALSE if the component should not continue processing
  Result := not ((csLoading in ComponentState) or
    (csDestroying in ComponentState) or (csReading in ComponentState) or
    (csWriting in ComponentState) or (csFixups in ComponentState) or
    (csDesigning in ComponentState));

end;

procedure TPrincipalSourceDisplay.SetCRMActivityID(const Value: Real);
var
  AData: Variant;
begin
  if Value = FCRMActivityID then
    Exit;

  FCRMActivityID := Value;

  RefreshDisplay;
end;

procedure TPrincipalSourceDisplay.RefreshDisplay;
begin
  FLock.Acquire;
  try
    CheckHasSource;

    if CRMActivityID > 0 then
      RefreshByCRMActivityID
    else
      RefreshBySource;

    SetPincipleSourceDisplayTheme(ColorTheme);
    SetExpandBtnImage;
  finally
    if Assigned(FLock) then
      FLock.Release;
  end;
end;

procedure TPrincipalSourceDisplay.Reset;
begin
  FPrincipalContactID := 0;
  FPrincipalSourceID := 0;
  FPrincipalSource := '';
  FPrincipalDisplay := '';
  FPrincipalDisplayRec.CompanyNo := '';
  FPrincipalDisplayRec.Company := '';
  FPrincipalDisplayRec.ContactFirstName := '';
  FPrincipalDisplayRec.ContactLastName := '';
  FPrincipalDisplayRec.ContactFullName := '';
  FPrincipalDisplayRec.ContactTitle := '';
  FPrincipalDisplayRec.Address1 := '';
  FPrincipalDisplayRec.Address2 := '';
  FPrincipalDisplayRec.City := '';
  FPrincipalDisplayRec.State := '';
  FPrincipalDisplayRec.Zip := '';
  FPrincipalDisplayRec.Country := '';
  FPrincipalDisplayRec.CompanyTelephone := '';
  FPrincipalDisplayRec.CompanyExt := '';
  FPrincipalDisplayRec.CompanyFax := '';
  FPrincipalDisplayRec.ContactTelephone := '';
  FPrincipalDisplayRec.ContactExt := '';
  FPrincipalDisplayRec.ContactFax := '';
  FPrincipalDisplayRec.ContactMobile := '';
  FPrincipalDisplayRec.ContactEMail := '';
  FPrincipalDisplayRec.WebSiteURL := '';
  FPrincipalDisplayRec.UseUSAMask := '';
  FPrincipalDisplayRec.CompanyTelephone := '';
  FPrincipalDisplayRec.ContactTelephone := '';
  FPrincipalDisplayRec.CompanyFax := '';
  FPrincipalDisplayRec.ContactFax := '';
  FPrincipalDisplayRec.ContactMobile := '';
  FPrincipalDisplayRec.CompanyTelephone := '';
  FPrincipalDisplayRec.ContactTelephone := '';
  FPrincipalDisplayRec.CityStateZip := '';
  FPrincipalDisplayRec.ContactFullName  := '';
  FPrincipalDisplayRec.CompanyTelephoneAndExt := '';
  FPrincipalDisplayRec.ContactTelephoneAndExt := '';
  SeTUniLabels('', '', '', '', '', '', '', '', '', '', '');
  CheckHasSource;
  CheckHeight;
  SetExpandBtnImage;
end;

procedure TPrincipalSourceDisplay.RefreshBySource;
begin
  if (FPrincipalSourceID = 0) then
    begin
      Reset;
      Exit;
    end;

  // get values
  FPrincipalDisplayRec.Update(PrincipleSource, PrincipleSourceID,
    PrincipleContactID);

  // update property values

  if (FPrincipalDisplayRec.Company > '') and
    (FPrincipalDisplayRec.ContactFullName > '') then
    FPrincipalDisplay := Format('%s, %s', [FPrincipalDisplayRec.Company,
      FPrincipalDisplayRec.ContactFullName])
  else if (FPrincipalDisplayRec.Company > '') then
    FPrincipalDisplay := FPrincipalDisplayRec.Company
  else if (FPrincipalDisplayRec.ContactFullName > '') then
    FPrincipalDisplay := FPrincipalDisplayRec.ContactFullName
  else
    FPrincipalDisplay := '';

  with FPrincipalDisplayRec do
    SeTUniLabels(FPrincipalDisplay, { APrincipalSourceDisplay }
      FPrincipalDisplayRec.ContactEMail, { AEMail }
      FPrincipalDisplayRec.Address1, { AddressLine1 }
      FPrincipalDisplayRec.CityStateZip, { AddressLine2 }
      FPrincipalDisplayRec.Country, { AddressLine3 }
      TelephoneAndExt(FPrincipalDisplayRec.ContactTelephone,
      FPrincipalDisplayRec.ContactExt), { AContactTelephone }
      FPrincipalDisplayRec.ContactMobile, FPrincipalDisplayRec.ContactFax,
      { AContactFax }
      TelephoneAndExt(FPrincipalDisplayRec.CompanyTelephone,
      FPrincipalDisplayRec.CompanyExt), { ACompanyTelephone }
      FPrincipalDisplayRec.CompanyFax, { ACompanyFax }
      FPrincipalDisplayRec.WebSiteURL); { AWebSiteURL }
end;

procedure TPrincipalSourceDisplay.RefreshByCRMActivityID;
var
  AUseUSAMask: Boolean;
begin
  if (FCRMActivityID = 0) then
    Exit;

  with TFDQuery.Create(nil) do
    try
      ConnectionName := cnstFDConnectionName;
      SQL.Add('select                          ');
      SQL.Add('     principle_first_name,      ');
      SQL.Add('     principle_last_name,       ');
      SQL.Add('     principle_title,           ');
      SQL.Add('     principle_contact_phone,   ');
      SQL.Add('     principle_contact_cell,    ');
      SQL.Add('     principle_contact_ext,     ');
      SQL.Add('     principle_contact_fax,     ');
      SQL.Add('     principle_contact_email,   ');
      SQL.Add('     principle_company,         ');
      SQL.Add('     principle_addr1,           ');
      SQL.Add('     principle_addr2,           ');
      SQL.Add('     principle_addr3,           ');
      SQL.Add('     principle_city,            ');
      SQL.Add('     principle_state,           ');
      SQL.Add('     principle_zip,             ');
      SQL.Add('     principle_country,         ');
      SQL.Add('     principle_company_phone,   ');
      SQL.Add('     principle_company_ext,     ');
      SQL.Add('     principle_company_fax,     ');
      SQL.Add('     principle_company_url,     ');
      SQL.Add('     use_usa_mask,              ');

      SQL.Add('     principle_source,          ');
      SQL.Add('     principle_source_id,       ');
      SQL.Add('     contact_id,                ');
      SQL.Add('     principle_source_disp,     ');

      SQL.Add('     principle_crm_prospect,    ');
      SQL.Add('     principle_pk_hide          ');
      SQL.Add('from                            ');
      SQL.Add('     crm_activity               ');
      SQL.Add('where                           ');
      SQL.Add(Format('     id=%.0f                    ', [FCRMActivityID]));
      Open;

      // 05/15/2009 Moved these lines here.  These must be done first
      // because they are essential when evaluating how to display the
      // contact information below.
      PrincipleSource := FieldByName('principle_source').AsString;
      PrincipleSourceID := FieldByName('principle_source_id').AsFloat;
      PrincipleContactID := FieldByName('contact_id').AsFloat;

      // Format display text
      FPrincipalDisplayRec.ContactFirstName :=
        Trim(FieldByName('principle_first_name').AsString);
      FPrincipalDisplayRec.ContactLastName :=
        Trim(FieldByName('principle_last_name').AsString);
      FPrincipalDisplayRec.ContactFullName :=
        Trim(FPrincipalDisplayRec.ContactFirstName + ' ' +
        FPrincipalDisplayRec.ContactLastName);
      FPrincipalDisplayRec.Company :=
        Trim(FieldByName('principle_company').AsString);
      FPrincipalDisplay := Trim(FieldByName('principle_source_disp').AsString);

      // If both the company and the contact name are blank, then we have a problem;
      // this means that the source data exists, but nothing has been filled into
      // the non-normalized fields.  Instead, let's just refresh from the database
      // 05/15/2009 Remmed conditional for APrincipalDisplay.  Only eval
      // for company and name.
      if (FPrincipalDisplayRec.Company = '') and
        (FPrincipalDisplayRec.ContactFullName = '') then
        begin
          RefreshBySource;
          Exit; // out of here!
        end;

      if (PrincipleSource <> 'PR_EMP') then
        begin
          if (FPrincipalDisplayRec.Company > '') and
            (FPrincipalDisplayRec.ContactFullName > '') then
            FPrincipalDisplay := Format('%s, %s', [FPrincipalDisplayRec.Company,
              FPrincipalDisplayRec.ContactFullName])
          else if (FPrincipalDisplayRec.Company > '') then
            FPrincipalDisplay := FPrincipalDisplayRec.Company
          else if (FPrincipalDisplayRec.ContactFullName > '') then
            FPrincipalDisplay := FPrincipalDisplayRec.ContactFullName;
        end;

      FPrincipalDisplayRec.UseUSAMask :=
        Trim(FieldByName('use_usa_mask').AsString);
      AUseUSAMask := FPrincipalDisplayRec.UseUSAMask = 'Y';
      FPrincipalDisplayRec.CompanyTelephone :=
        Trim(FieldByName('principle_company_phone').AsString);
      FPrincipalDisplayRec.CompanyExt :=
        Trim(FieldByName('principle_company_ext').AsString);
      FPrincipalDisplayRec.ContactTelephone :=
        Trim(FieldByName('principle_contact_phone').AsString);
      FPrincipalDisplayRec.ContactExt :=
        Trim(FieldByName('principle_contact_ext').AsString);
      FPrincipalDisplayRec.CompanyFax :=
        Trim(FieldByName('principle_company_fax').AsString);
      FPrincipalDisplayRec.ContactFax :=
        Trim(FieldByName('principle_contact_fax').AsString);
      FPrincipalDisplayRec.ContactMobile :=
        Trim(FieldByName('principle_contact_cell').AsString);

      // 06/01/2009 Format the telephone mask.  Requested by Nancy.
      FPrincipalDisplayRec.CompanyTelephone :=
        FormatTelephoneText(FPrincipalDisplayRec.CompanyTelephone, AUseUSAMask);
      FPrincipalDisplayRec.ContactTelephone :=
        FormatTelephoneText(FPrincipalDisplayRec.ContactTelephone, AUseUSAMask);
      FPrincipalDisplayRec.CompanyFax :=
        FormatTelephoneText(FPrincipalDisplayRec.CompanyFax, AUseUSAMask);
      FPrincipalDisplayRec.ContactFax :=
        FormatTelephoneText(FPrincipalDisplayRec.ContactFax, AUseUSAMask);
      FPrincipalDisplayRec.ContactMobile :=
        FormatTelephoneText(FPrincipalDisplayRec.ContactMobile, AUseUSAMask);

      // Next, after formatting, concat tel with ext
      FPrincipalDisplayRec.CompanyTelephoneAndExt :=
        TelephoneAndExt(FPrincipalDisplayRec.CompanyTelephone,
        FPrincipalDisplayRec.CompanyExt);
      FPrincipalDisplayRec.ContactTelephoneAndExt :=
        TelephoneAndExt(FPrincipalDisplayRec.ContactTelephone,
        FPrincipalDisplayRec.ContactExt);

      FPrincipalDisplayRec.ContactEMail :=
        Trim(FieldByName('principle_contact_email').AsString);
      FPrincipalDisplayRec.Address1 :=
        Trim(FieldByName('principle_addr1').AsString);
      FPrincipalDisplayRec.Address2 :=
        Trim(FieldByName('principle_addr2').AsString);
      FPrincipalDisplayRec.City := Trim(FieldByName('principle_city').AsString);
      FPrincipalDisplayRec.State :=
        Trim(FieldByName('principle_state').AsString);
      FPrincipalDisplayRec.Zip := Trim(FieldByName('principle_zip').AsString);
      FPrincipalDisplayRec.CityStateZip :=
        ConcatCityStateZip(FPrincipalDisplayRec.City,
        FPrincipalDisplayRec.State, FPrincipalDisplayRec.Zip);
      FPrincipalDisplayRec.Country :=
        Trim(FieldByName('principle_country').AsString);
      FPrincipalDisplayRec.WebSiteURL :=
        Trim(FieldByName('principle_company_url').AsString);

      SeTUniLabels(FPrincipalDisplay, FPrincipalDisplayRec.ContactEMail,
        FPrincipalDisplayRec.Address1, FPrincipalDisplayRec.CityStateZip,
        FPrincipalDisplayRec.Country,
        FPrincipalDisplayRec.ContactTelephoneAndExt,
        FPrincipalDisplayRec.ContactMobile, FPrincipalDisplayRec.ContactFax,
        FPrincipalDisplayRec.CompanyTelephoneAndExt,
        FPrincipalDisplayRec.CompanyFax, FPrincipalDisplayRec.WebSiteURL);

    finally
      Free; // free TFDQuery
    end;
end;

function TPrincipalSourceDisplay.TelephoneAndExt(const ATelephone,
  AExt: string): string;
begin
  Result := '';
  if (ATelephone > '') then
    begin
      if Trim(AExt) > '' then
        Result := Format(cRsc0000011 { '%s, Ext. %s' } , [ATelephone, AExt])
      else
        Result := ATelephone;
    end;
end;

function TPrincipalSourceDisplay.HasSource: Boolean;
begin
  Result := ((FPrincipalSource > '') and (FPrincipalSourceID > 0)) or
    ((FPrincipalDisplayRec.Company > '') and
    (FPrincipalDisplayRec.ContactFullName > ''));
end;

procedure TPrincipalSourceDisplay.CheckHasSource;
var
  AShow: Boolean;
begin
  // This method simply checks to see if a source is assigned;
  // if not, then controls are hidden.
  AShow := HasSource;

  if not AShow then
    IQMS.Common.Controls.IQShowControl([lblPrincipleDisplay, lblEMail,
      lblContactTelephoneLabel, lblContactTelephone,
      lblContactCellTelephoneLabel, lblContactCellTelephone, lblContactFaxLabel,
      lblContactFax, lblAddress1, lblAddress2, lblAddress3,
      lblCompanyTelephoneLabel, lblCompanyTelephone, lblCompanyFaxLabel,
      lblCompanyFax, lblWebSiteURLLabel, lblWebSiteURL], False);
  lblAssignPrinciple.Visible := not AShow;
end;

procedure TPrincipalSourceDisplay.CheckHeight;
var
  b: Boolean;
begin
  b := HasSource and (Self.lblPrincipleDisplay.Caption > '');
  if FExpandedHeight > cStandardHeight then
    Height := IQMS.Common.Numbers.iIIf(b, IQMS.Common.Numbers.iIIf(Expanded, FExpandedHeight,
      cStandardHeight), cShortHeight)
  else
    Height := IQMS.Common.Numbers.iIIf(b, IQMS.Common.Numbers.iIIf(Expanded, cExpandedHeight,
      cStandardHeight), cShortHeight);
end;

procedure TPrincipalSourceDisplay.DoPaint(Sender: TObject);
var
  ARect: TRect;
begin
  if (csLoading in ComponentState) then
    Exit;

  Self.Color := FPrincipleSourceDisplayColors.BackColor;

  DrawGradient(Background, ClientRect,
    [FPrincipleSourceDisplayColors.GradientLtColor,
    FPrincipleSourceDisplayColors.GradientDkColor]);

  { ARect := ClientRect;
    ARect.Bottom := ARect.Bottom div 2;
    DrawGradient(ARect, [FPrincipleSourceDisplayColors.GradientLtColor,
    FPrincipleSourceDisplayColors.GradientDkColor]);

    ARect := ClientRect;
    ARect.Top := ARect.Bottom div 2;
    DrawGradient(ARect, [FPrincipleSourceDisplayColors.GradientDkColor,
    FPrincipleSourceDisplayColors.GradientLtColor]); }

  DrawFrame;
end;

procedure TPrincipalSourceDisplay.DrawFrame;
var
  ARect: TRect;
begin
  with Background do
    begin
      ARect := ClientRect;
      Pen.Color := FPrincipleSourceDisplayColors.BorderDkColor;
      Rectangle(ARect.Left,arect.Top, ARect.Left+ARect.Width,arect.Top+arect.Height);

      InflateRect(ARect, - 1, - 1);
      Pen.Color := FPrincipleSourceDisplayColors.BorderLtColor;
      Rectangle(ARect.Left,arect.Top, ARect.Left+ARect.Width,arect.Top+arect.Height);

    end;
end;

procedure TPrincipalSourceDisplay.OnEMailClick(Sender: TObject);
begin
  SendEMail;
end;

procedure TPrincipalSourceDisplay.OnWebSiteURLClick(Sender: TObject);
begin
  GoToWebSite;
end;

procedure TPrincipalSourceDisplay.OnPrincipleClick(Sender: TObject);
begin
  ShowSummary;
end;

procedure TPrincipalSourceDisplay.DoChangePrincipleClick(Sender: TObject);
var
  AShowContact: Boolean;
begin
  AShowContact := (PrincipleSource <> '') and (PrincipleSource <> 'PR_EMP') and
    (PrincipleSourceID > 0);
  if AShowContact then
//    sbtnAssign.onmouseDown:=ButtonMouseDown
  else if Assigned(FOnAssignPrincipleClick) then
    FOnAssignPrincipleClick(Self);
end;

procedure TPrincipalSourceDisplay.DoAssignPrincipleClick(Sender: TObject);
begin
  if Assigned(FOnAssignPrincipleClick) then
    FOnAssignPrincipleClick(Self);
end;

procedure TPrincipalSourceDisplay.DoAssignContactClick(Sender: TObject);
begin
  if Assigned(FOnAssignContactClick) then
    FOnAssignContactClick(Self);
end;

procedure TPrincipalSourceDisplay.ShowSummary;
begin
  if FPrincipalSourceID > 0 then
    IQMS.Common.PrincipalSource.ShowPrincipalSummary(TUniForm(Owner), FPrincipalSource,
      FPrincipalSourceID, FPrincipalContactID);
end;

procedure TPrincipalSourceDisplay.GoToWebSite;
begin
  if lblWebSiteURL.Caption > '' then
    ExecuteHyperlink(lblWebSiteURL.Caption);
end;

procedure TPrincipalSourceDisplay.SendEMail;
begin
  if lblEMail.Caption > '' then
    ExecuteHyperlink(lblEMail.Caption); // iqctrl
end;

procedure TPrincipalSourceDisplay.ApplyThemeColors(APincipleSourceDisplayTheme
  : TPincipleSourceDisplayTheme);
begin
  case APincipleSourceDisplayTheme of
    psdWindowsXPBlue:
      with FPrincipleSourceDisplayColors do
        begin
          BackColor := 16707813;
          GradientLtColor := 16773092;
          GradientDkColor := 16768193;
          BorderLtColor := 16777215;
          BorderDkColor := 14790538;
        end;
    psdWindowsXPOrange:
      with FPrincipleSourceDisplayColors do
        begin
          BackColor := 9032703;
          GradientLtColor := 9032703;
          GradientDkColor := 5615103;
          BorderLtColor := 15792895;
          BorderDkColor := 33010;
        end;
  else
    with FPrincipleSourceDisplayColors do
      begin
        BackColor := clBtnFace;
        GradientLtColor := clWhite;
        GradientDkColor := clBtnFace;
        BorderLtColor := clWhite;
        BorderDkColor := clBtnShadow;
      end;
  end;

  Invalidate;
end;

procedure TPrincipalSourceDisplay.SetPincipleSourceDisplayTheme
  (const Value: TPincipleSourceDisplayTheme);
begin
  FPincipleSourceDisplayTheme := Value;
  ApplyThemeColors(Value);
end;

procedure TPrincipalSourceDisplay.SetExpanded(const Value: Boolean);
begin
  if FExpanded = Value then
    Exit;

  FExpanded := Value;

  //Slide(FExpanded);

  // AdjustControls;
  RefreshDisplay;

end;

procedure TPrincipalSourceDisplay.SeTUniLabels(const APrincipalSourceDisplay,
  AEMail, AddressLine1, AddressLine2, AddressLine3, AContactTelephone,
  AContactCellTelephone, AContactFax, ACompanyTelephone, ACompanyFax,
  AWebSiteURL: string);
const
  c_space_between_labels: Integer = 1;
  // ---------------------------------------------------------------------------
  procedure _EvalCaption(ALabel: TUniLabel; ACaption: string;
    AParam: Boolean = True);
  begin
    if not Assigned(ALabel) then
      Exit;
    ALabel.Caption := StrTran( ACaption, '&', '&&' );
    ALabel.Visible := (Trim(ACaption) > '') and AParam;
  end;
// ---------------------------------------------------------------------------
  procedure _SetTops(const ALabels: array of TUniLabel);
  var
    i, ATop: Integer;
  begin
    ATop := 7;
    for i := low(ALabels) to high(ALabels) do
      if ALabels[i].Visible then
        begin
          ALabels[i].Top := ATop;
          ATop := ATop + ALabels[i].Height + c_space_between_labels;
        end;
  end;
// ---------------------------------------------------------------------------
  function _getMaxHeight(const ALabels: array of TUniLabel): Integer;
  var
    i: Integer;
  begin
    Result := 7;
    for i := low(ALabels) to high(ALabels) do
      if ALabels[i].Visible then
        Result := Max(ALabels[i].Top + ALabels[i].Height +
          c_space_between_labels, Result);
  end;

const
  cMinLeft = 235;
var
  i, ATop: Integer;
  AShow: Boolean;

  AMaxWidth, AColumn2Left: Integer;

begin
  if not CheckComponentState then
    Exit;

  AShow := HasSource;
  if not AShow then
    IQMS.Common.Controls.IQShowControl([lblPrincipleDisplay, lblEMail,
      lblContactTelephoneLabel, lblContactTelephone,
      lblContactCellTelephoneLabel, lblContactCellTelephone, lblContactFaxLabel,
      lblContactFax, lblAddress1, lblAddress2, lblAddress3,
      lblCompanyTelephoneLabel, lblCompanyTelephone, lblCompanyFaxLabel,
      lblCompanyFax, lblWebSiteURLLabel, lblWebSiteURL], False);
  lblAssignPrinciple.Visible := not AShow;
  _EvalCaption(TUniLabel(lblPrincipleDisplay), APrincipalSourceDisplay);

  //CheckHeight;

  if not AShow then
    begin
      CheckHeight;
      Exit;
    end;

  // Column 1 Values
  _EvalCaption(TUniLabel(lblEMail), AEMail);
  _EvalCaption(lblAddress1, AddressLine1, Expanded);
  _EvalCaption(lblAddress2, AddressLine2, Expanded);
  _EvalCaption(lblAddress3, AddressLine3, Expanded);

  // Column 2 Values
  if Expanded then
    begin
      lblContactTelephoneLabel.Caption := cRsc0000003; // 'Contact Telephone:'
      lblContactFaxLabel.Caption := cRsc0000004; // 'Contact Fax:'
      // 05/13/2008 Do not show the contact telephone number for employees
      _EvalCaption(lblContactTelephone, AContactTelephone,
        (FPrincipalSource <> 'PR_EMP'));
      _EvalCaption(lblContactCellTelephone, AContactCellTelephone,
        (FPrincipalSource <> 'PR_EMP'));
      _EvalCaption(lblContactFax, AContactFax);
      _EvalCaption(lblCompanyTelephone, ACompanyTelephone);
      _EvalCaption(lblCompanyFax, ACompanyFax);
    end
  else begin
      // 05/13/2008 Do not show the contact telephone number for employees
      _EvalCaption(lblContactTelephone, sIIf(AContactTelephone > '',
        AContactTelephone, ACompanyTelephone), (FPrincipalSource <> 'PR_EMP'));
      lblContactTelephoneLabel.Caption := IQMS.Common.Numbers.sIIf(AContactTelephone > '',
        cRsc0000003 { 'Contact Telephone:' } ,
        cRsc0000005 { 'Company Telephone:' } );
      lblContactTelephoneLabel.Visible := lblContactTelephone.Visible;

      lblContactFax.Caption := sIIf(AContactFax > '', AContactFax, ACompanyFax);
      lblContactFax.Visible := lblContactFax.Caption > '';
      lblContactFaxLabel.Caption := IQMS.Common.Numbers.sIIf(AContactFax > '', cRsc0000004,
        // 'Contact Fax:'
        cRsc0000006); // 'Company Fax:'

      // Hide these in the collapsed view.  The "contact" labels display
      // all relevant information.
      lblCompanyTelephone.Caption := '';
      lblCompanyTelephone.Visible := False;
      lblCompanyFax.Caption := '';
      lblCompanyFax.Visible := False;
      lblContactCellTelephone.Visible := False;
      lblContactCellTelephoneLabel.Visible := False;
      lblContactCellTelephone.Caption := '';
    end;

  _EvalCaption(TUniLabel(lblWebSiteURL), AWebSiteURL, Expanded);

  // Now, after filling in values, set label visibility
  lblContactTelephoneLabel.Visible := lblContactTelephone.Caption > '';
  lblContactCellTelephoneLabel.Visible := lblContactCellTelephone.Caption > '';
  lblContactFaxLabel.Visible := lblContactFax.Caption > '';
  lblCompanyTelephoneLabel.Visible := lblCompanyTelephone.Caption > '';
  lblCompanyFaxLabel.Visible := lblCompanyFax.Caption > '';
  lblWebSiteURLLabel.Visible := (AWebSiteURL > '') and Expanded;

  // Now set left values, based on current label width
  // if (PrincipleSourceID > 0) then
  begin
    // Maximum width for Column 1
    AMaxWidth := ((Self.ClientWidth div 3) * 2) - lblPrincipleDisplay.Left;
    // only 2/3

    // Column 1 Controls
    lblPrincipleDisplay.Width := Min(lblPrincipleDisplay.Width, AMaxWidth);
    lblEMail.Width := Min(lblEMail.Width, AMaxWidth);
    lblAddress1.Width := Min(lblAddress1.Width, AMaxWidth);
    lblAddress2.Width := Min(lblAddress2.Width, AMaxWidth);
    lblAddress3.Width := Min(lblAddress3.Width, AMaxWidth);

    // Column 2 Controls
    AColumn2Left := lblPrincipleDisplay.Left + Max(lblPrincipleDisplay.Width,
      lblEMail.Width) + 16;
    AColumn2Left := Max(AColumn2Left, cMinLeft);

    // labels
    lblContactTelephoneLabel.Left := AColumn2Left;
    lblContactCellTelephoneLabel.Left := AColumn2Left;
    lblContactFaxLabel.Left := AColumn2Left;
    lblCompanyTelephoneLabel.Left := AColumn2Left;
    lblCompanyFaxLabel.Left := AColumn2Left;
    lblWebSiteURLLabel.Left := AColumn2Left;

    // values - adjusted based on corresponding label
    lblContactTelephone.Left := lblContactTelephoneLabel.Left +
      lblContactTelephoneLabel.Width + 8;
    lblContactCellTelephone.Left := lblContactCellTelephoneLabel.Left +
      lblContactCellTelephoneLabel.Width + 8;
    lblContactFax.Left := lblContactFaxLabel.Left +
      lblContactFaxLabel.Width + 8;
    lblCompanyTelephone.Left := lblCompanyTelephoneLabel.Left +
      lblCompanyTelephoneLabel.Width + 8;
    lblCompanyFax.Left := lblCompanyFaxLabel.Left +
      lblCompanyFaxLabel.Width + 8;
    lblWebSiteURL.Left := lblWebSiteURLLabel.Left +
      lblWebSiteURLLabel.Width + 8;

  end;

  // After setting the visibility, adjust tops by column
  // A.) Left Column
  _SetTops([TUniLabel(lblPrincipleDisplay), TUniLabel(lblEMail), lblAddress1,
    lblAddress2, lblAddress3]);

  // B.) Right Column
  _SetTops([lblContactTelephoneLabel, lblContactCellTelephoneLabel,
    lblContactFaxLabel, lblCompanyTelephoneLabel, lblCompanyFaxLabel,
    TUniLabel(lblWebSiteURLLabel)]);

  // Now, align the tops of the values to their corresponding labels
  lblContactTelephone.Top := lblContactTelephoneLabel.Top;
  lblContactCellTelephone.Top := lblContactCellTelephoneLabel.Top;
  lblContactFax.Top := lblContactFaxLabel.Top;
  lblCompanyTelephone.Top := lblCompanyTelephoneLabel.Top;
  lblCompanyFax.Top := lblCompanyFaxLabel.Top;
  lblWebSiteURL.Top := lblWebSiteURLLabel.Top;

  FExpandedHeight := cExpandedHeight;
  if Expanded then
    FExpandedHeight := _getMaxHeight([lblContactTelephoneLabel,
      lblContactTelephone, lblContactCellTelephoneLabel,
      lblContactCellTelephone, lblContactFaxLabel, lblContactFax, lblAddress1,
      lblAddress2, lblAddress3, lblCompanyTelephoneLabel, lblCompanyTelephone,
      lblCompanyFaxLabel, lblCompanyFax, lblWebSiteURLLabel]) +
      4;

  if CheckComponentState then
    Slide(Expanded);
  //CheckHeight;
end;

procedure TPrincipalSourceDisplay.DoExpandCollapse(Sender: TObject);
begin
  Application.ProcessMessages;
  Expanded := not Expanded;
  SetExpandBtnImage;
end;

procedure TPrincipalSourceDisplay.SetExpandBtnImage;
//var
//  ARsc: string;
begin
  // if not CheckComponentState then Exit;
  sbtnExpand.Glyph := NIL;
  if Expanded then
    ImageDM.AssignStandardImage(sbtnExpand, DM_CRMIMG.imageCollapse16x16)
  else
    ImageDM.AssignStandardImage(sbtnExpand, DM_CRMIMG.imageExpand16x16);
  sbtnExpand.Hint := IQMS.Common.Numbers.sIIf(Expanded, cRsc0000012, // 'Collapse detail'
    cRsc0000013); // 'Expand to show detail'
  sbtnExpand.Visible := HasSource;
  SetExpandBtnPos;
end;

procedure TPrincipalSourceDisplay.SetExpandBtnPos;
begin
  sbtnExpand.Left := Self.ClientWidth - sbtnExpand.Width - 8;
end;

procedure TPrincipalSourceDisplay.Slide(AExpanded: Boolean);
const
  cIncrement = 20;
var
  i, AValue, ACurHeight, ATargetHeight: Integer;
begin
  if not CheckComponentState then
    Exit;

  ACurHeight := Self.Height;
  if FExpandedHeight > cStandardHeight then
    ATargetHeight := IQMS.Common.Numbers.iIIf(AExpanded, FExpandedHeight, cStandardHeight)
  else
    ATargetHeight := IQMS.Common.Numbers.iIIf(AExpanded, cExpandedHeight, cStandardHeight);

  // 05/08/2012 Added iqctrl method
//  if ACurHeight <> ATargetHeight then
//    IQMS.Common.Controls.SlidePanelVertically(Self, ATargetHeight);

(*  if (ATargetHeight > ACurHeight) then
    // Increase height
    repeat
      AValue := Self.Height + cIncrement;
      if AValue > ATargetHeight then
        AValue := ATargetHeight;
      Self.Height := AValue;
      Invalidate;
      Application.ProcessMessages;
    until Self.Height >= ATargetHeight

  else if (ATargetHeight < ACurHeight) then
    // Decrease height
    repeat
      AValue := Self.Height - cIncrement;
      if AValue < ATargetHeight then
        AValue := ATargetHeight;
      Self.Height := AValue;
      Invalidate;
      Application.ProcessMessages;
    until Self.Height <= ATargetHeight;

  Self.Height := ATargetHeight;  *)
end;

procedure TPrincipalSourceDisplay.DoOnResize(Sender: TUniControl; x,y:integer);
begin
  SetExpandBtnPos;
end;

end.

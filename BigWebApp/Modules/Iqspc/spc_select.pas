unit spc_select;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  { TODO -omugdha -cWEBIQ : unit 'IQMS.Common.UserMessages' not found in several forms.
  IQMS.Common.UserMessages,       }
  spc,

  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, uniRadioGroup;

type
  { TSelectionOptions }
  TSelectionOption = (spxShowScheduling, spxShowNonConformInventory,
    spxQuickInspectionTypes, spxShowBuyingAKA, spxShowSellingAKA);
  TSelectionOptions = set of TSelectionOption;

  { TListCargo }
  TListCargo = class
    Source: TSPCSourceType;
    Kind: TSPCSourceKind;
    constructor Create(ASource: TSPCSourceType;
      AKind: TSPCSourceKind = spkUnknown);
  end;

  { TFrmSPCSelect }
  TFrmSPCSelect = class(TUniForm)
    PnlSource: TUniPanel;
    Panel2: TUniPanel;
    rgSource: TUniGroupBox;
    PnlList: TUniPanel;
    lstSource: TUniListBox;
    PnlButtonsRight: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlOption: TUniPanel;
    gbOption: TUniRadioGroup;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    FOptions: TSelectionOptions;
    { Private declarations }
    procedure IQAfterShowMessage(var Msg: TMessage);
    { TODO -omugdha -cWEBIQ : unit 'IQMS.Common.UserMessages' not found in several forms.
      message iq_AfterShowMessage; }
    function GetScheduleOption: TScheduleOption;
    function GetSource: TSPCSourceType;
    procedure SetOptionVisible(const Value: Boolean);
    procedure ResizeControls;
    procedure RestoreFromRegistry;
    procedure SaveToRegistry;
    function GetKind: TSPCSourceKind;
    procedure SetOptions(const Value: TSelectionOptions);
  protected
    { Protected declarations }
    procedure BuildList; virtual;
    function GetStandardFormWidth: Integer; virtual;
    procedure GetSelectedSource(var ASource: TSPCSource);
  public
    { Public declarations }
      property Options : TSelectionOptions write SetOptions;
  end;

  { TSPCSelectSource }
type
  TSPCSelectSource = class(TComponent)
  private
    FSource: TSPCSource;
    FOptions: TSelectionOptions;
  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    function Execute: Boolean;
    class function DoSelectSource(
      AOwner: TComponent;
      var ASource: string): Boolean;
    property Source: TSPCSource read FSource;
    property Options: TSelectionOptions read FOptions write FOptions;
  end;

  // function SelectSPCSource(const AOwner: TComponent;
  // const AOptions: TSelectionOptions; var ASource: TSPCSource): Boolean;

implementation

{$R *.DFM}


uses
  IQMS.Common.Applications,
  IQMS.Common.ApplicationSet,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  spc_rscstr,
  spc_select_sd;

const
  c_standard_width: Integer = 280;

{$REGION 'TSPCSelectSource'}
  { TSPCSelectSource }

constructor TSPCSelectSource.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOptions := [];
  FSource := TSPCSource.Create;
end;

destructor TSPCSelectSource.Destroy;
begin
  if Assigned(FSource) then
    FreeAndNil(FSource);
  inherited Destroy;
end;

class function TSPCSelectSource.DoSelectSource(AOwner: TComponent; var ASource: string): Boolean;
begin
  with Self.Create(AOwner) do
    try
      if Execute then
        ASource := Source.SourceTableName;
    finally
      Release;
    end;
end;

function TSPCSelectSource.Execute: Boolean;
type
  TSelectFormClass = class of TFrmSPCSelect;
var
  AReference: TSelectFormClass;
begin
  if IQMS.Common.ApplicationSet.IsTouchScreen then
    AReference := TFrmSPCSelect_ShopData
  else
    AReference := TFrmSPCSelect;

  // Reset
  FSource.Clear;

  // Show the form
  with AReference.Create(uniGUIApplication.uniApplication) do
    try
      SetOptions(FOptions);
      Result := ShowModal = mrOk;
      if Result then
        GetSelectedSource( { var } FSource);
    finally
      Release;
    end;
end;

{$ENDREGION 'TSPCSelectSource'}

{$REGION 'TListCargo'}

{ TListCargo }

constructor TListCargo.Create(ASource: TSPCSourceType; AKind: TSPCSourceKind);
begin
  Source := ASource;
  Kind := AKind;
end;

{$ENDREGION 'TListCargo'}

{$REGION 'TFrmSPCSelect'}

{ TFrmSPCSelect }

(*constructor TFrmSPCSelect.Create(const AOwner: TComponent;
  const AOptions: TSelectionOptions);
begin
  inherited Create(AOwner);
  IQMS.Common.ApplicationSet.AssignApplicationSettingsA(Application);
  { TODO -omugdha -cWEBIQ : Parameter type mismatch. Expected is Tform
    but passed TUniForm. Need to change the function implementation.
  IQMS.Common.Controls.CenterForm(Self, True);}
  // default option to "All"
  gbOption.ItemIndex := 2;
  BuildList;
end; *)

procedure TFrmSPCSelect.FormShow(Sender: TObject);
begin
  // 02/23/2012
  { TODO -omugdha -cWEBIQ : unit 'IQMS.Common.UserMessages' not found in several forms.
  PostMessage(Handle, iq_AfterShowMessage, 0, 0); }
end;

procedure TFrmSPCSelect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveToRegistry;
  Action := caFree;
end;

procedure TFrmSPCSelect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    ModalResult := mrOk;
  end;
end;

procedure TFrmSPCSelect.IQAfterShowMessage(var Msg: TMessage);
begin
  // 11/15/2007
  Application.ProcessMessages;
  ResizeControls;
  RestoreFromRegistry;
  ForceForegroundWindowB(Application.Handle);
  Self.BringToFront;
end;

function TFrmSPCSelect.GetScheduleOption: TScheduleOption;
begin
  Result := TScheduleOption(gbOption.ItemIndex + 1);
end;

procedure TFrmSPCSelect.GetSelectedSource(var ASource: TSPCSource);
begin
  ASource.Source := GetSource;
  ASource.SourceID := 0;
  ASource.Kind := GetKind;
  if PnlOption.Visible then
    ASource.ScheduleOption := GetScheduleOption
  else
    ASource.ScheduleOption := scoUnknown;
end;

procedure TFrmSPCSelect.SetOptions(const Value: TSelectionOptions);
begin
  FOptions := Value;
  SetOptionVisible(spxShowScheduling in Value);
  // AOption := TScheduleOption.scoAll;
  SetOptions(Value);
end;

procedure TFrmSPCSelect.SetOptionVisible(const Value: Boolean);
var
  AStandardWidth: Integer;
begin
  AStandardWidth := GetStandardFormWidth;

  PnlOption.Visible := Value;
  if Value then
    Width := AStandardWidth * 2
  else
    Width := AStandardWidth;
  ResizeControls;
  //IQMS.Common.Controls.CenterForm(Self, True);
end;

procedure TFrmSPCSelect.UniFormCreate(Sender: TObject);
begin
  IQMS.Common.ApplicationSet.AssignApplicationSettingsA(Application);
  { TODO -omugdha -cWEBIQ : Parameter type mismatch. Expected is Tform
    but passed TUniForm. Need to change the function implementation.
  IQMS.Common.Controls.CenterForm(Self, True);}
  // default option to "All"
  gbOption.ItemIndex := 2;
  BuildList;
end;

function TFrmSPCSelect.GetSource: TSPCSourceType;
begin
  Result := TSPCSourceType(0);
  if lstSource.ItemIndex > - 1 then
    Result := TListCargo(lstSource.Items.Objects[lstSource.ItemIndex]).Source;
end;

function TFrmSPCSelect.GetKind: TSPCSourceKind;
begin
  Result := TSPCSourceKind(0);
  if lstSource.ItemIndex > - 1 then
    Result := TListCargo(lstSource.Items.Objects[lstSource.ItemIndex]).Kind;
end;

function TFrmSPCSelect.GetStandardFormWidth: Integer;
begin
  Result := c_standard_width;
end;

procedure TFrmSPCSelect.BuildList;
var
  AUsesAssy1: Boolean;
begin
  // 08/04/2014 Important:  Set property, lstSource.Sorted = False.
  // Randy does not want the list sorted.  Items must be grouped
  // manually.  The code below was organized to reflect the desired
  // order. This change was made for the following YouTrack:
  // EIQ-3827 SER# 05836 - Add AKA lookup capability to pick list in Inspection Setup

  // 08/21/2014 Do not show CRM Opportunity or Engineering Quote Inventory
  // for touch-screen.  Approved by Randy.
  // EIQ-4085 Quick Inspection - Remove "CRM Opportunities" and "Engineering Quote Inventory" types

  try
    lstSource.Items.BeginUpdate;
    lstSource.Items.Clear;

    // 'CRM Opportunity'
    { TODO -omugdha -cWEBIQ : Parameter type mismatch. Expected is Tform but passed TUniForm.
    Need to change the function implementation.
    if SecurityManager.IsModuleLicensed(IQAppsNames[IQMS.Common.Applications.apCRM]) and
      not IQMS.Common.ApplicationSet.IsTouchScreen then
      lstSource.AddItem(SPCSourceDisplayName[spcCRMOpportunity],
        TListCargo.Create(spcCRMOpportunity));}

    // 'Engineering Quote Inventory'

    { TODO -omugdha -cWEBIQ : Parameter type mismatch. Expected is Tform but passed TUniForm.
    Need to change the function implementation.
    if SecurityManager.IsModuleLicensed(IQAppsNames[IQMS.Common.Applications.apQuote]) and
      not IQMS.Common.ApplicationSet.IsTouchScreen then
      lstSource.AddItem(SPCSourceDisplayName[spcEngineeringQuote],
        TListCargo.Create(spcEngineeringQuote));}

    // Inventory
    // spc_rscstr.cTXT000000295 = 'Parts'
    { TODO -omugdha -cWEBIQ : Parameter type mismatch. Expected is Tform but passed TUniForm.
    Need to change the function implementation.
    if IQMS.Common.ApplicationSet.IsTouchScreen then
      lstSource.AddItem(spc_rscstr.cTXT000000295,
        TListCargo.Create(spcInventory))
    else
      lstSource.AddItem(SPCSourceDisplayName[spcInventory],
        TListCargo.Create(spcInventory));
         }
    // 09/05/2013 Non-Conform Inventory

    { TODO -omugdha -cWEBIQ : Parameter type mismatch. Expected is Tform but passed TUniForm.
     Need to change the function implementation.
    if (spxShowNonConformInventory in FOptions) then
      // spc_rscstr.cTXT000000026 = 'Non-Conform Inventory';
      lstSource.AddItem(spc_rscstr.cTXT000000026,
        TListCargo.Create(spcInventory, spkNonConform));
     }
    // 08/01/2014 Buying AKA
    // EIQ-3827 SER# 05836 - Add AKA lookup capability to pick list in Inspection Setup
    { TODO -omugdha -cWEBIQ : Parameter type mismatch. Expected is Tform but passed TUniForm. Need to change the function implementation.
    if (spxShowBuyingAKA in FOptions) then
      // spc_rscstr.cTXT000000826 = 'Buying AKA';
      lstSource.AddItem(spc_rscstr.cTXT000000826,
        TListCargo.Create(spcInventory, spkAKABuying));  }

    // 08/01/2014 Selling AKA
    // EIQ-3827 SER# 05836 - Add AKA lookup capability to pick list in Inspection Setup
    { TODO -omugdha -cWEBIQ : Parameter type mismatch. Expected is Tform but passed TUniForm.
    Need to change the function implementation.
    if (spxShowSellingAKA in FOptions) then
      // spc_rscstr.cTXT000000827 = 'Selling AKA';
      lstSource.AddItem(spc_rscstr.cTXT000000827,
        TListCargo.Create(spcInventory, spkAKASelling));}

    // 'PLM/DHR Items'
    // spxQuickInspectionTypes = exclude this source, we are showing
    // only Quick Inspection types
    { TODO -omugdha -cWEBIQ : Parameter type mismatch. Expected is Tform but passed TUniForm. Need to change the function implementation.
    if SecurityManager.IsModuleLicensed(IQAppsNames[IQMS.Common.Applications.apPLM]) and
      not IQMS.Common.ApplicationSet.IsTouchScreen then
      lstSource.AddItem(SPCSourceDisplayName[spcPLM],
        TListCargo.Create(spcPLM));  }

    // 'Processes'
    AUsesAssy1 := SelectValueAsFloat('SELECT 1 FROM mfgtype ' +
      'WHERE TRIM(mfgtype) = ''ASSY1'' AND ROWNUM < 2') = 1;
      { TODO -omugdha -cWEBIQ : Parameter type mismatch. Expected is Tform but passed TUniForm. Need to change the function implementation.
    if SecurityManager.IsModuleLicensed(IQAppsNames[IQMS.Common.Applications.apFAB]) or
      AUsesAssy1 then
      lstSource.AddItem(SPCSourceDisplayName[spcProcess],
        TListCargo.Create(spcProcess));

    // 'Tooling/MRO';
    if SecurityManager.IsModuleLicensed(IQAppsNames[IQMS.Common.Applications.apPM]) then
      lstSource.AddItem(SPCSourceDisplayName[spcPMEqmt],
        TListCargo.Create(spcPMEqmt));

    // 'Work Centers'
    lstSource.AddItem(SPCSourceDisplayName[spcWorkCenter],
      TListCargo.Create(spcWorkCenter));  }

    lstSource.ItemIndex := 0;
  finally
    lstSource.Items.EndUpdate;
  end;
end;

procedure TFrmSPCSelect.btnOkClick(Sender: TObject);
begin
  if lstSource.ItemIndex = - 1 then
    // spc_rscstr.cTXT000000294 = 'Please select an item.'
    raise Exception.Create(spc_rscstr.cTXT000000294);
  ModalResult := mrOk;
end;

procedure TFrmSPCSelect.ResizeControls;
begin
  PnlOption.Width := PnlOption.Parent.ClientWidth div 2;
end;

procedure TFrmSPCSelect.SaveToRegistry;
begin
  if PnlOption.Visible then
    IQMS.Common.RegFrm.IQRegIntegerScalarWrite(Self, 'Option', gbOption.ItemIndex);
  IQMS.Common.RegFrm.IQRegIntegerScalarWrite(Self, 'Source', lstSource.ItemIndex);
end;

procedure TFrmSPCSelect.RestoreFromRegistry;
var
  AIndex: Integer;
begin
  AIndex := - 1;
  if IQMS.Common.RegFrm.IQRegIntegerScalarRead(Self, 'Option', AIndex) and
    (AIndex > - 1) and (AIndex <= gbOption.Items.Count - 1) then
    gbOption.ItemIndex := AIndex;
  if IQMS.Common.RegFrm.IQRegIntegerScalarRead(Self, 'Source', AIndex) and
    (AIndex > - 1) and (AIndex <= lstSource.Items.Count - 1) then
    lstSource.ItemIndex := AIndex;
end;

{$ENDREGION 'TFrmSPCSelect'}

end.

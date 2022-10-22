unit crm_assignedto;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  DM_CRMPK,
  Vcl.Menus,
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel, uniRadioGroup, uniImage;

type
  TFrmCrmAssignedTo = class(TUniForm)
    PnlOptions: TUniPanel;
    PnlButtons: TUniPanel;
    Panel1: TUniPanel;
    PnlSelectedUser: TUniPanel;
    gbIndex: TUniRadioGroup;
    edtUserDisplay: TUniEdit;
    lblSelectUser: TUniLabel;
    sbtnRecordFilter: TUniSpeedButton;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    Image1: TUniImage;
    procedure gbIndexClick(Sender: TObject);
    procedure sbtnRecordFilterClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Help1Click(Sender: TObject);
  private
    function GetModifiedOptionIndex: Integer;
    procedure SetModifiedOptionIndex(const Value: Integer);
    function GetNeedUserName: Boolean;
    procedure UpdateEmployeeDisplayName;
  private
    { Private declarations }
    FAllowNone: Boolean;
    FAssignedTo: String;
    FPrEmpID: Real;
    procedure EnableAssignedTo(AEnabled: Boolean);
    procedure SetOptionList;
    procedure ApplyMyRecordsIndex;
    property OptionIndex: Integer read GetModifiedOptionIndex
      write SetModifiedOptionIndex;
    property NeedUserName: Boolean read GetNeedUserName;
  public
    { Public declarations }
    DM: TCRMPK_DM;
    constructor Create(AOwner: TComponent; AIndex: Integer; AssignedTo: String;
      AllowNone: Boolean);
  end;

function DoAssignedTo(AOwner: TComponent;
  var AIndex: Integer;
  var AssignedTo: String;
  var APrEmpID: Real;
  AllowNone: Boolean = True): Boolean;

var
  FrmCrmAssignedTo: TFrmCrmAssignedTo;

implementation

{$R *.DFM}


uses
  crm_activity_dblib,
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.WebVcl.SecurityManager;

function DoAssignedTo(AOwner: TComponent; var AIndex: Integer;
  var AssignedTo: String; var APrEmpID: Real;
  AllowNone: Boolean = True): Boolean;
begin
  with TFrmCrmAssignedTo.Create(AOwner, AIndex, AssignedTo, AllowNone) do
    try
      if ShowModal = mrOk then
        begin
          AIndex := OptionIndex;
          AssignedTo := FAssignedTo;
          APrEmpID := FPrEmpID;
          Result := True;
        end
      else
        Result := False;
    finally
      Release;
    end;
end;

{ TFrmCrmAssignedTo }

constructor TFrmCrmAssignedTo.Create(AOwner: TComponent; AIndex: Integer;
  AssignedTo: String; AllowNone: Boolean);
var
  ADisplayName: String;
begin
  DM := TCRMPK_DM.Create(Self);
  inherited Create(AOwner);
  DM.Name := '';
  FPrEmpID := 0;
  FAllowNone := AllowNone; // set the private value
  SetOptionList; // build our list of options
  // NOTE: We will need to do things differently if AllowNone is False.
  // If AllowNone is False, then we will have only two options in the
  // group box, not three.  So, every time we reference gbIndex.ItemIndex
  // we need always to check FAllowNone first.
  OptionIndex := AIndex;

  if AssignedTo > '' then
    begin
      if AssignedTo = SecurityManager.UserName then
        ApplyMyRecordsIndex
      else
        begin
          FAssignedTo := AssignedTo;
          UpdateEmployeeDisplayName; // local, see below
        end;
    end;
end;

procedure TFrmCrmAssignedTo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCrmAssignedTo.EnableAssignedTo(AEnabled: Boolean);
begin
  IQEnableControl([sbtnRecordFilter, lblSelectUser], AEnabled);
  if not AEnabled then
    edtUserDisplay.Clear;
end;

procedure TFrmCrmAssignedTo.gbIndexClick(Sender: TObject);
begin
  if FAllowNone then
    begin
      case gbIndex.ItemIndex of
        0:
          EnableAssignedTo(False);
        1:
          EnableAssignedTo(False);
        2:
          EnableAssignedTo(True);
      end;
    end
  else
    begin
      case gbIndex.ItemIndex of
        0:
          EnableAssignedTo(False);
        1:
          EnableAssignedTo(True);
      end;
    end
end;

procedure TFrmCrmAssignedTo.sbtnRecordFilterClick(Sender: TObject);
begin
  with DM.PkEmployee do
    if Execute then
      begin
        FAssignedTo := GetValue('USER_NAME');
        UpdateEmployeeDisplayName;
      end;
end;

procedure TFrmCrmAssignedTo.UpdateEmployeeDisplayName;
var
  ADisplayName: String;
begin
  if FAssignedTo > '' then
    begin
      ADisplayName := crm_activity_dblib.GetEmployeeName(FAssignedTo);
      edtUserDisplay.Text := Format('%s (%s)', [ADisplayName, FAssignedTo]);
    end
  else
    edtUserDisplay.Text := '';
end;

procedure TFrmCrmAssignedTo.btnOkClick(Sender: TObject);
begin
  if NeedUserName and (Trim(FAssignedTo) = '') then
    begin
      ModalResult := mrNone;
      raise Exception.Create
        (crm_rscstr.cTXT0000284 { 'Please select a user.' } );
    end;
end;

function TFrmCrmAssignedTo.GetModifiedOptionIndex: Integer;
var
  i: Integer;
begin
  // This returns an adjusted value for the index
  i := gbIndex.ItemIndex;
  if not FAllowNone then
    Inc(i, 1);
  Result := i;
end;

procedure TFrmCrmAssignedTo.SetModifiedOptionIndex(const Value: Integer);
var
  i: Integer;
begin
  // This merely updates the option group
  if FAllowNone and (Value in [0, 1, 2]) then
    i := Value
  else if not FAllowNone then
    begin
      // if a value is passed outside of the range, modified it
      if Value > 1 then
        i := Value - 1
      else
        i := Value;
      // Test to avoid out of range error
      if not (i in [0, 1]) then
        i := 0;
    end
  else
    i := 0;
  gbIndex.ItemIndex := i;
end;

procedure TFrmCrmAssignedTo.SetOptionList;
begin
  gbIndex.Items.Clear;
  if FAllowNone then
    begin
      gbIndex.Items.Add(crm_rscstr.cTXT0000285 { 'Show All' } );
      gbIndex.Items.Add(crm_rscstr.cTXT0000286 { 'My Records' } );
      gbIndex.Items.Add(crm_rscstr.cTXT0000287 { 'Selected User' } );
    end
  else
    begin
      // We exclude Show All, because we are requiring a selection
      gbIndex.Items.Add(crm_rscstr.cTXT0000288 { 'Assign to me' } );
      gbIndex.Items.Add(crm_rscstr.cTXT0000289 { 'Selected User' } );
    end;
end;

function TFrmCrmAssignedTo.GetNeedUserName: Boolean;
begin
  if FAllowNone and (gbIndex.ItemIndex = 2) then
    Result := True
  else if not FAllowNone and (gbIndex.ItemIndex = 1) then
    Result := True
  else
    Result := False;
end;

procedure TFrmCrmAssignedTo.ApplyMyRecordsIndex;
begin
  if FAllowNone then
    gbIndex.ItemIndex := 1
  else
    gbIndex.ItemIndex := 0;
end;

procedure TFrmCrmAssignedTo.Help1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(IQMS.Common.HelpHook.iqchmIQCRM, IQMS.Common.HelpHook.iqhtmIQCRM);
  // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext);
end;

end.

unit crm_child_base;

{
  Base class for all "child" forms on the main CRM screen.
  This unit is not called directly.  See crm_view.pas.
}

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  crm_types,
  IQMS.Common.PrincipalSourceTypes,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication;

type
  TFrmCRMChild = class(TUniForm)
    PnlCarrier: TUniPanel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FLastEPlantID: Real;
    FLastUserID: String;
    FLastPrincipalSource: TPrincipalSourceType;
    FLastPrincipalSourceID: Real;
    FLastContactID: Real;
    FLastProspectFilter: TProspectType;
    FLastAssignedTo: String;
    FLastFilterByEplant: Boolean;
  protected
    { Protected declarations }
  public
    { Public declarations }
    FClosing: Boolean;
    function NeedsRefresh: Boolean;
    procedure SetLastFilterUsed;
  end;

var
  FrmCRMChild: TFrmCRMChild;

implementation

{$R *.dfm}


uses
  crm_context,
  IQMS.WebVcl.SecurityManager;

procedure TFrmCRMChild.FormCreate(Sender: TObject);
begin
  SetLastFilterUsed;
end;

procedure TFrmCRMChild.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  FClosing := TRUE;
  CanClose := TRUE;
end;

function TFrmCRMChild.NeedsRefresh: Boolean;
begin
  Result := (SecurityManager.EPlant_ID_AsFloat <> FLastEPlantID) or
    (SecurityManager.UserName <> FLastUserID) or
    (CRMContext.GlobalContext.Source <> FLastPrincipalSource) or
    (CRMContext.GlobalContext.SourceID <> FLastPrincipalSourceID) or
    (CRMContext.GlobalContext.ContactID <> FLastContactID) or
    (CRMContext.GlobalContext.Prospect <> FLastProspectFilter) or
    (CRMContext.AssignmentContext.AssignedTo <> FLastAssignedTo) or
    (CRMContext.GlobalContext.FilterByEPlant <> FLastFilterByEplant);
end;

procedure TFrmCRMChild.SetLastFilterUsed;
begin
  FLastEPlantID := SecurityManager.EPlant_ID_AsFloat;
  FLastUserID := SecurityManager.UserName;
  FLastPrincipalSource := CRMContext.GlobalContext.Source;
  FLastPrincipalSourceID := CRMContext.GlobalContext.SourceID;
  FLastContactID := CRMContext.GlobalContext.ContactID;
  FLastProspectFilter := CRMContext.GlobalContext.Prospect;
  FLastAssignedTo := CRMContext.AssignmentContext.AssignedTo;
  FLastFilterByEplant := CRMContext.GlobalContext.FilterByEPlant;
end;

end.

unit pm_prompt_total_units;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  { TFrmPMPromptTotalUnits }
  TFrmPMPromptTotalUnits = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    lblUnitsToAdd: TUniLabel;
    edtUnits: TUniEdit;
    chkUpdateTask: TUniCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure edtUnitsExit(Sender: TObject);
  private
    { Private declarations }
    function GetUnits: Integer;
    function GetUpdateTasks: Boolean;
    procedure SetUnits(const Value: Integer);
    procedure SetUpdateTasks(const Value: Boolean);
    procedure Validate;
  public
    { Public declarations }
    property Units: Integer read GetUnits write SetUnits;
    property UpdateTasks: Boolean read GetUpdateTasks write SetUpdateTasks;
  end;

function PromptTotalUnits(var AUnits: Int64; var AUpdateTasks: Boolean): Boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm;

function PromptTotalUnits(var AUnits: Int64; var AUpdateTasks: Boolean): Boolean;
var
  FrmPMPromptTotalUnits: TFrmPMPromptTotalUnits;
begin
  // Initialize
  AUnits := 0;
  AUpdateTasks := False;
  // Show form ...
  FrmPMPromptTotalUnits := TFrmPMPromptTotalUnits.Create(uniGUIApplication.uniApplication);
  with FrmPMPromptTotalUnits do
  begin
    Result := ShowModal = mrOk;
    // Populate referenced var parameters
    if Result then
    begin
      AUnits := Units;
      AUpdateTasks := UpdateTasks;
    end;
  end;
end;

{ TFrmPMPromptTotalUnits }

procedure TFrmPMPromptTotalUnits.FormCreate(Sender: TObject);
begin
  Units := 0;
  UpdateTasks := False;
  IQMS.Common.RegFrm.IQRegFormRead(Self, [PnlLeft01]);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlClient02);
end;

procedure TFrmPMPromptTotalUnits.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [PnlLeft01]);
end;

procedure TFrmPMPromptTotalUnits.btnOkClick(Sender: TObject);
begin
  Validate;
  ModalResult := mrOk;
end;

procedure TFrmPMPromptTotalUnits.edtUnitsExit(Sender: TObject);
begin
  Validate;
end;

function TFrmPMPromptTotalUnits.GetUnits: Integer;
var
  i: Integer;
begin
  Result := 0;
  if IQMS.Common.Numbers.IsStringValidInteger(edtUnits.Text, i) then
    Result := i;
end;

function TFrmPMPromptTotalUnits.GetUpdateTasks: Boolean;
begin
  Result := chkUpdateTask.Checked;
end;

procedure TFrmPMPromptTotalUnits.SetUnits(const Value: Integer);
begin
  edtUnits.Text := IntToStr(Value);
end;

procedure TFrmPMPromptTotalUnits.SetUpdateTasks(const Value: Boolean);
begin
  chkUpdateTask.Checked := Value;
end;

procedure TFrmPMPromptTotalUnits.Validate;
begin
  FormatEditTextAsInteger(edtUnits);
end;

end.

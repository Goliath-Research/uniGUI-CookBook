unit Tloption;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel,
  uniPageControl;

type
  TFrmToolingOptions = class(TUniForm)
    PnlMain: TUniPanel;
    PnlCtrls: TUniPanel;
    pcMain: TUniPageControl;
    TabGeneral: TUniTabSheet;
    PnlButtons: TUniPanel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    btnApply: TUniBitBtn;
    lblDefaultMarkUpRate: TUniLabel;
    sbtnClearMURate: TUniSpeedButton;
    PMURate: TUniPopupMenu;
    ClearMarkUpRate1: TUniMenuItem;
    lblDefaultLaborRate: TUniLabel;
    SR: TIQWebSecurityRegister;
    sbtnClearLaborRate: TUniSpeedButton;
    PLaborRate: TUniPopupMenu;
    ClearLaborRate1: TUniMenuItem;
    chkShowTax: TUniCheckBox;
    edtMURate: TUniEdit;
    edtLaborRate: TUniEdit;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    lblPercent1: TUniLabel;
    lblPercent2: TUniLabel;
    chkWorkflowApproval: TUniCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure sbtnClearMURateClick(Sender: TObject);
    procedure sbtnClearLaborRateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtMURateExit(Sender: TObject);
    procedure edtLaborRateExit(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    private
      { Private declarations }
      FFormActive: Boolean;
      chkUpdateMSProjActuals_Modified: Boolean;
      chkUpdateToolingActuals_Modified: Boolean;
      procedure GetValues;
      procedure SaveValues;
      function GetLaborRate: Real;
      function GetMURate: Real;
      procedure StartUp;
    public
      { Public declarations }
  end;

procedure DoToolingOptions ;

implementation

{$R *.DFM}

uses
  IQMS.Common.Boolean,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas File
  iqsecins,  }
  IQMS.Common.StringUtils,
  iqtool_rscstr,
  tl_settings,
  tlshr;

procedure DoToolingOptions;
var
  LFrmToolingOptions : TFrmToolingOptions;
begin
  LFrmToolingOptions := TFrmToolingOptions.Create(UniGUIApplication.UniApplication);
  LFrmToolingOptions.ShowModal;
end;

procedure TFrmToolingOptions.FormShow(Sender: TObject);
begin
  FFormActive := TRUE;
{ TODO -oGPatil -cWebConvert : Dependency on iqsecins.pas File
  EnsureSecurityInspectorOnTopOf(Self); // IQSecIns.pas }
end;

procedure TFrmToolingOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmToolingOptions.StartUp;
begin
  CheckToolingSettingsCreated;
  GetValues;
end;

procedure TFrmToolingOptions.btnApplyClick(Sender: TObject);
begin
  SaveValues;
  Application.ProcessMessages;
  GetValues;
end;

procedure TFrmToolingOptions.btnOKClick(Sender: TObject);
begin
  SaveValues;
end;

procedure TFrmToolingOptions.sbtnClearMURateClick(Sender: TObject);
begin
  edtMURate.Clear;
end;

procedure TFrmToolingOptions.sbtnClearLaborRateClick(Sender: TObject);
begin
  edtLaborRate.Clear;
end;

procedure TFrmToolingOptions.GetValues;
var
  AValue: Real;
begin
  ToolingSettings.RefreshSettings;
  // explicit call to retrieve values from the database

  AValue := ToolingSettings.MarkUpRate;
  edtMURate.Text := FormatFloat1000SeparatorB(AValue, 2);

  AValue := ToolingSettings.LaborRate;
  edtLaborRate.Text := FormatFloat1000SeparatorB(AValue, 2);

  chkShowTax.Checked := ToolingSettings.ShowTax;

  chkWorkflowApproval.Checked := ToolingSettings.WorkflowApproval;
end;

procedure TFrmToolingOptions.SaveValues;
var
  AMURate: Real;
  ALaborRate: Real;
  AShowTax, AWFApproval: string;
begin
  AMURate := GetMURate; // local
  ALaborRate := GetLaborRate; // local
  AShowTax := BoolToYN(chkShowTax.Checked); // IQMS.Common.Boolean.pas
  AWFApproval:= BoolToYN(chkWorkflowApproval.Checked); // IQMS.Common.Boolean.pas
  UniMainModule.FDConnection1.StartTransaction;
  try
    ExecuteCommand('DELETE FROM tool_option');
    ExecuteCommandFmt('INSERT INTO tool_option ( mu_rate, labor_rate, show_tax, ' +
      'wf_approval ) VALUES ( %f, %f, ''%s'', ''%s'' )',
      [AMURate, ALaborRate, AShowTax, AWFApproval]);
    UniMainModule.FDConnection1.Commit; // commit changes
  finally
    if UniMainModule.FDConnection1.InTransaction then
      UniMainModule.FDConnection1.RollBack; // rollback if there was a problem
  end;

  ToolingSettings.RefreshSettings;
  // explicit call to retrieve values from the database
end;

procedure TFrmToolingOptions.FormCreate(Sender: TObject);
begin
  pcMain.ActivePage := TabGeneral;
  FFormActive := FALSE;
  IQRegFormRead(Self, [Self]); { IQMS.Common.RegFrm.pas }
  StartUp;
end;

function TFrmToolingOptions.GetLaborRate: Real;
var
  S: string;
  AValue: Real;
begin
  AValue := 0;
  // Remove the percent sign, if it exists
  S := Trim(StrTran(edtLaborRate.Text, '%', ''));
  if not IQMS.Common.Numbers.IsStringValidFloat(S, AValue) then
    begin
      ModalResult := mrNone;
      if edtLaborRate.CanFocus then
        edtLaborRate.SetFocus;
      // 'The Labor Rate is not a valid number.'
      raise Exception.Create(iqtool_rscstr.cTXT0000210);
    end
  else
    Result := AValue;
end;

function TFrmToolingOptions.GetMURate: Real;
var
  S: string;
  AValue: Real;
begin
  AValue := 0;
  // Remove the percent sign, if it exists
  S := Trim(StrTran(edtMURate.Text, '%', ''));
  if not IQMS.Common.Numbers.IsStringValidFloat(S, AValue) then
    begin
      ModalResult := mrNone;
      if edtLaborRate.CanFocus then
        edtMURate.SetFocus;
      // 'The Mark Up Rate is not a valid number.'
      raise Exception.Create(iqtool_rscstr.cTXT0000211);
    end
  else
    Result := AValue;
end;

procedure TFrmToolingOptions.edtMURateExit(Sender: TObject);
begin
  FormatEditTextAsFloat(edtMURate, 2, TRUE); // pas
end;

procedure TFrmToolingOptions.edtLaborRateExit(Sender: TObject);
begin
  FormatEditTextAsFloat(edtLaborRate, 2, TRUE); // pas
end;

procedure TFrmToolingOptions.Help1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmTOOLING { CHM } , iqhtmTOOLING { HTM } );
  // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(1005620);
end;

end.

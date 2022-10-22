unit Pmoption;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniRadioButton,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniPageControl, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrmPMOptions = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    pcMain: TUniPageControl;
    TabGeneral: TUniTabSheet;
    SrcParams: TDataSource;
    TblParams: TFDTable;
    TblParamsRESET_PMWO_ON_OPEN: TStringField;
    SR: TIQWebSecurityRegister;
    GroupBox1: TUniGroupBox;
    SrcPMOption: TDataSource;
    TblPMOption: TFDTable;
    chkShowTax: TUniDBCheckBox;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    TblPMOptionSHOW_TAX: TStringField;
    rbResetUnitsY: TUniRadioButton;
    rbResetUnitsN: TUniRadioButton;
    rbResetUnitsZero: TUniRadioButton;
    TblParamsZERO_PMWO_TASK: TStringField;
    dbCommentEqualsDescrip: TUniDBCheckBox;
    TblPMOptionMISC_COMMENT_EQUALS_DESCRIP: TStringField;
    PnlButtonsRight: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    btnApply: TUniBitBtn;
    memResetPrompt: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure SaveOptions(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure DoResetOptionClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateResetCheckboxPrompt;
  public
    { Public declarations }
    FFormActive: Boolean;
  end;

procedure DoPMOptions();

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.RegFrm,
  {TODO -oSanketG -cWebConvert : Need to revisit}
  // iqsecins,
  pm_rscstr,
  pm_taskunit;

procedure DoPMOptions();
var
  FrmPMOptions: TFrmPMOptions;
begin
  FrmPMOptions := TFrmPMOptions.Create(uniGUIApplication.uniApplication);
  FrmPMOptions.ShowModal;
end;

procedure TFrmPMOptions.FormCreate(Sender: TObject);
var
  ATaskUnitCountOption: TTaskUnitCountOption;
begin
  FFormActive := FALSE;
  IQRegFormRead(Self, [Self]); { IQMS.Common.RegFrm.pas }
  TblParams.Open;
  TblParams.Edit;
  TblPMOption.Open;
  TblPMOption.Edit;

  // rbResetUnitsY.Checked :=  TblParamsRESET_PMWO_ON_OPEN.AsString = 'Y';
  // rbResetUnitsN.Checked := (TblParamsRESET_PMWO_ON_OPEN.AsString <> 'Y') and (TblParamsZERO_PMWO_TASK.AsString <> 'Y');
  // rbResetUnitsZero.Checked := TblParamsZERO_PMWO_TASK.AsString = 'Y';

  // 02/21/2008
  ATaskUnitCountOption := pm_taskunit.GetTaskUnitCountOption(0);
  rbResetUnitsY.Checked := ATaskUnitCountOption = tucResetAdd;
  rbResetUnitsN.Checked := ATaskUnitCountOption = tucResetClose;
  rbResetUnitsZero.Checked := ATaskUnitCountOption = tucZero;

  // 'When adding a new miscellaneous MRO Work Order item,
  // update the comment field with the task description.'
  dbCommentEqualsDescrip.Hint := WrapText(pm_rscstr.cTXT0000172, #13,
    ['.', ' ', #9, '-'], 65);
end;

procedure TFrmPMOptions.FormShow(Sender: TObject);
begin
  FFormActive := TRUE;
  UpdateResetCheckboxPrompt;
  { TODO -oSanketG -cWebConvert : Need to revisit , dependent on iqsecins}
  //EnsureSecurityInspectorOnTopOf(Self);
end;

procedure TFrmPMOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FFormActive := FALSE;
  with TblParams do
  begin
    if State in [dsEdit, dsInsert] then
      Cancel;
    Close;
  end;

  with TblPMOption do
  begin
    if State in [dsEdit, dsInsert] then
      Cancel;
    Close;
  end;

  IQRegFormWrite(Self, [Self]); { IQMS.Common.RegFrm.pas }
end;

procedure TFrmPMOptions.btnCancelClick(Sender: TObject);
begin
  with TblParams do
    if State in [dsEdit, dsInsert] then
      Cancel;
  with TblPMOption do
    if State in [dsEdit, dsInsert] then
      Cancel;
end;

procedure TFrmPMOptions.SaveOptions(Sender: TObject);
begin
  if not(TblParams.State in [dsEdit, dsInsert]) then
    TblParams.Edit;

  // Someday we need to consolidate this option into a single, numeric
  // field.  Using these character fields is messy.

  // Method A or B?
  if rbResetUnitsY.Checked then
    TblParamsRESET_PMWO_ON_OPEN.AsString := 'Y'
  else
    TblParamsRESET_PMWO_ON_OPEN.AsString := 'N';

  // Zero the total units, when closing a work order task?
  if rbResetUnitsZero.Checked then
    TblParamsZERO_PMWO_TASK.AsString := 'Y'
  else
    TblParamsZERO_PMWO_TASK.AsString := 'N';

  with TblParams do
  begin
    if State in [dsEdit, dsInsert] then
      Post;
    Edit;
  end;

  with TblPMOption do
  begin
    if State in [dsEdit, dsInsert] then
      Post;
    Edit;
  end;
end;

procedure TFrmPMOptions.Help1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(1000046);
end;

procedure TFrmPMOptions.UpdateResetCheckboxPrompt;
begin
  if FFormActive = FALSE then
    Exit;
  if rbResetUnitsY.Checked then
    { 'When the job task is added to a MRO Work Order, the value will be reset to zero (0).  ' +
      'Note:  The value will not be reset simply by re-opening a closed work order task.'; }
    memResetPrompt.Text := pm_rscstr.cTXT0000139
  else if rbResetUnitsN.Checked then
    { 'When the job task is closed on a MRO Work Order, ' +
      'Total Units will be set to the Current Total Units (as seen on the main screen) ' +
      'minus the Starting Total Units (when the task was added to the work order).'; }
    memResetPrompt.Text := pm_rscstr.cTXT0000140
  else if rbResetUnitsZero.Checked then
    { 'When the job task is closed on a MRO Work Order, ' +
      'Total Units will be set to zero (0).' }
    memResetPrompt.Text := pm_rscstr.cTXT0000147;
end;

procedure TFrmPMOptions.DoResetOptionClick(Sender: TObject);
var
  ACurRB: TUniRadioButton;
begin
  Application.ProcessMessages;
  UpdateResetCheckboxPrompt;
end;

end.

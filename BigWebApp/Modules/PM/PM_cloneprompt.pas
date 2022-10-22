unit PM_cloneprompt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  IQMS.Common.Registry,
  Vcl.Menus,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,
  uniLabel;

type
  { TFrmClonePrompt }
  TFrmClonePrompt = class(TUniForm)
    lblEquipmentNo: TUniLabel;
    lblEquipmentDescrip: TUniLabel;
    edtEqno: TUniEdit;
    edtDesc: TUniEdit;
    lblPrompt: TUniLabel;
    gbOption: TUniGroupBox;
    chkParts: TUniCheckBox;
    chkComponents: TUniCheckBox;
    chkInventory: TUniCheckBox;
    chkDocuments: TUniCheckBox;
    chkResetTaskUnits: TUniCheckBox;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PMain: TUniPopupMenu;
    Help1: TUniMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Help1Click(Sender: TObject);
  private
    procedure SetDescrip(const Value: String);
    procedure SetEqno(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property Eqno : String write SetEqno;
    property Descrip : String write SetDescrip;

  end;

function DoCloneEquipmentPrompt(
  var AEqno,
  ADescrip: String;
  var AShowDocuments,
  AShowInventory,
  AShowParts,
  AShowComponents,
  AResetTaskUnits: Boolean): Boolean;

const
  cRegFormPath = '\Software\IQMS\IQWin32\IQPM.exe\%s';

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  pm_rscstr;

function DoCloneEquipmentPrompt(
  var AEqno,
  ADescrip: String;
  var AShowDocuments,
  AShowInventory,
  AShowParts,
  AShowComponents,
  AResetTaskUnits: Boolean): Boolean;
 var
  LFrmClonePrompt : TFrmClonePrompt;
begin
  LFrmClonePrompt := TFrmClonePrompt.Create(UniGUIApplication.UniApplication);
  LFrmClonePrompt.Eqno := AEqno;
  LFrmClonePrompt.Descrip := ADescrip;
  Result := LFrmClonePrompt.ShowModal = mrOk;
  if Result then
    begin
      AEqno := LFrmClonePrompt.edtEqno.Text;
      ADescrip := LFrmClonePrompt.edtDesc.Text;
      AShowDocuments := LFrmClonePrompt.chkDocuments.Checked;
      AShowInventory := LFrmClonePrompt.chkInventory.Checked;
      AShowParts := LFrmClonePrompt.chkParts.Checked;
      AShowComponents := LFrmClonePrompt.chkComponents.Checked;
      AResetTaskUnits := LFrmClonePrompt.chkResetTaskUnits.Checked;
      Result := TRUE;
    end;
end;

procedure TFrmClonePrompt.FormCreate(Sender: TObject);
var
  bDocuments, bInventory, bParts, bComponents: Boolean;
begin
  // Get Reg values
(* TODO -oGPatil -cWebConvert : IQMS.Common.Registry errors
  with IQMS.Common.Registry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey(Format(cRegFormPath { '\Software\IQMS\IQWin32\IQPM.exe\%s' } ,
        [Name]), TRUE) then
        begin
          if ValueExists('chkDocuments') then
            chkDocuments.Checked := ReadBool('chkDocuments')
          else
            chkDocuments.Checked := TRUE;
          if ValueExists('chkInventory') then
            chkInventory.Checked := ReadBool('chkInventory')
          else
            chkInventory.Checked := TRUE;
          if ValueExists('chkParts') then
            chkParts.Checked := ReadBool('chkParts')
          else
            chkParts.Checked := TRUE;
          if ValueExists('chkComponents') then
            chkComponents.Checked := ReadBool('chkComponents')
          else
            chkComponents.Checked := TRUE;
          if ValueExists('chkResetTaskUnits') then
            chkResetTaskUnits.Checked := ReadBool('chkResetTaskUnits')
          else
            chkResetTaskUnits.Checked := False;
        end;
    finally
      Free;
    end;  *)
  IQMS.Common.Controls.ResizeCheckBoxes(Self, gbOption);
  IQMS.Common.Controls.ResizeCheckBoxes(Self, Self);
end;

procedure TFrmClonePrompt.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnOkClick(NIL);
  if Key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TFrmClonePrompt.btnOkClick(Sender: TObject);
begin
  if (Trim(edtEqno.Text) = '') then
    begin
      ModalResult := mrNone;
      edtEqno.SetFocus;
      //pm_rscstr.cTXT0000247 =
      // 'Equipment number is required.  Please enter a value.'
      IQError(pm_rscstr.cTXT0000247);
    end
  else
    if (Trim(edtDesc.Text) = '') then
    begin
      ModalResult := mrNone;
      edtDesc.SetFocus;
      //pm_rscstr.cTXT0000248 =
      //  'Equipment description is required.  Please enter a value.'
      IQError(pm_rscstr.cTXT0000248);
    end
  else if IsFoundParam
    ('select id from pmeqmt where Upper(Trim(eqno)) = Upper(Trim( :EQNO ))',
    ['EQNO'], [Trim(edtEqno.Text)]) then
    begin
      ModalResult := mrNone;
      edtEqno.SetFocus;
      //pm_rscstr.cTXT0000249 =
      // 'This Equipment number is already used.  Please enter a unique value.'
      IQError(pm_rscstr.cTXT0000249);
    end
  else
    begin
(* TODO -oGPatil -cWebConvert : IQMS.Common.Registry errors
      with TIQWebIQMS.Common.Registry.Create do
        try
          RootKey := HKEY_CURRENT_USER;
          if OpenKey
            (Format(cRegFormPath { '\Software\IQMS\IQWin32\IQPM.exe\%s' } ,
            [Name]), TRUE) then
            begin
              WriteBool('chkDocuments', chkDocuments.Checked);
              WriteBool('chkInventory', chkInventory.Checked);
              WriteBool('chkParts', chkParts.Checked);
              WriteBool('chkComponents', chkComponents.Checked);
              WriteBool('chkResetTaskUnits', chkResetTaskUnits.Checked);
            end;
        finally
          Free;
        end;  *)

      ModalResult := mrOk; // in case this is called from another control
    end;
end;

procedure TFrmClonePrompt.Help1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM); // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(Self.HelpContext)
end;

procedure TFrmClonePrompt.SetDescrip(const Value: String);
begin
  edtDesc.Text := Value;
end;

procedure TFrmClonePrompt.SetEqno(const Value: String);
begin
  edtEqno.Text := Value;
end;

end.

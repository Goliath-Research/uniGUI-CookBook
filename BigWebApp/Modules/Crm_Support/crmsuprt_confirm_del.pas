unit crmsuprt_confirm_del;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TSupportConfirmDelOption = (CloseRecord, DeleteRecord);

  TFrmSupportConfirmDel = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    AcceptButton: TUniButton;
    CancelButton: TUniButton;
    PnlCarrier: TUniPanel;
    lblPrompt: TUniLabel;
    CloseOption: TUniRadioButton;
    DeleteOption: TUniRadioButton;
    SR: TIQWebSecurityRegister;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
  private
    function GetSelectedOption: TSupportConfirmDelOption;
    procedure SetSelectedOption(const Value: TSupportConfirmDelOption);
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal(AOwner: TComponent;
      var AOption: TSupportConfirmDelOption): Boolean;
    property SelectedOption: TSupportConfirmDelOption read GetSelectedOption
      write SetSelectedOption;
  end;

var
  FrmSupportConfirmDel: TFrmSupportConfirmDel;

implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  iqsecins;

class function TFrmSupportConfirmDel.DoShowModal(AOwner: TComponent;
  var AOption: TSupportConfirmDelOption): Boolean;
begin
  with TFrmSupportConfirmDel.Create(AOwner) do
    try
      Result := ShowModal = mrOk;
    finally
      Release;
    end;
end;

procedure TFrmSupportConfirmDel.FormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlCarrier);
end;

procedure TFrmSupportConfirmDel.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  iqsecins.EnsureSecurityInspectorOnTopOf(Self);
end;

procedure TFrmSupportConfirmDel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

function TFrmSupportConfirmDel.GetSelectedOption: TSupportConfirmDelOption;
begin
  if CloseOption.Checked then
    Result := TSupportConfirmDelOption.CloseRecord
  else
    Result := TSupportConfirmDelOption.DeleteRecord;
end;

procedure TFrmSupportConfirmDel.SetSelectedOption(
  const Value: TSupportConfirmDelOption);
begin
  case Value of
    CloseRecord:
      CloseOption.Checked := True;
    DeleteRecord:
      DeleteOption.Checked := True;
  end;
end;

procedure TFrmSupportConfirmDel.SRAfterApply(Sender: TObject);
var
  ACanClose, ACanDelete: Boolean;
begin
  // Assign to variables to simplify logic below
  ACanClose := CloseOption.Visible and CloseOption.Enabled;
  ACanDelete := DeleteOption.Visible and DeleteOption.Enabled;

  // Ensure the visible option is checked
  if not ACanClose then
    DeleteOption.Checked := ACanDelete
  else if not ACanDelete then
    CloseOption.Checked := ACanClose;

  // Allow "accept" button, only if an option is available
  AcceptButton.Enabled := SR.Enabled['AcceptButton'] and
    (ACanDelete or ACanClose);
  AcceptButton.Visible := SR.Visible['AcceptButton'] and
    (ACanDelete or ACanClose);
end;

end.

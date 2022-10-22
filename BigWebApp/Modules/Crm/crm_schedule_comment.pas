unit crm_schedule_comment;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniImage;

type
  TFrmCRMScheduleDeclineComment = class(TUniForm)
    PnlPrompt: TUniPanel;
    PnlEdit: TUniPanel;
    PnlImage: TUniPanel;
    PnlPromptInner: TUniPanel;
    imgDecline: TUniImage;
    lblPrompt: TUniLabel;
    memComment: TUniMemo;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ADisplayName, AEMailAddress: String);
  end;

function DoScheduleComment(AOwner: TComponent;
  ADisplayName, AEMailAddress: String;
  var AComment: String): Boolean;

var
  FrmCRMScheduleDeclineComment: TFrmCRMScheduleDeclineComment;

implementation

{$R *.dfm}


uses
  crm_rscstr,
  IQMS.Common.Controls,
  IQMS.Common.RegFrm;

function DoScheduleComment(AOwner: TComponent;
  ADisplayName, AEMailAddress: String;
  var AComment: String): Boolean;
begin
  with TFrmCRMScheduleDeclineComment.Create(AOwner, ADisplayName,
    AEMailAddress) do
    try
      Result := ShowModal = mrOk;
      if Result then
        AComment := memComment.Text;
    finally
      Free;
    end;
end;

{ TFrmCRMScheduleDeclineComment }

constructor TFrmCRMScheduleDeclineComment.Create(AOwner: TComponent;
  ADisplayName,
  AEMailAddress: String);
var
  S: String;
begin
  inherited Create(AOwner);
  IQMS.Common.Controls.CenterForm(Self);
  memComment.Clear;

  if (ADisplayName > '') and (AEMailAddress > '') then
    S := Format('%s (%s)', [ADisplayName, AEMailAddress])
  else if (ADisplayName > '') then
    S := ADisplayName
  else if (AEMailAddress > '') then
    S := AEMailAddress;

  if S > '' then
    { 'You have chosen to decline this meeting request.  ' +
      'An email response will be sent to %s.  If you would like to include a ' +
      'comment with the email response, please enter it below.' }
    lblPrompt.Caption := Format(crm_rscstr.cTXT0001564, [S]);
end;

procedure TFrmCRMScheduleDeclineComment.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
end;

procedure TFrmCRMScheduleDeclineComment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

end.

unit crm_recur_open;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Vcl.Forms,
  Vcl.Buttons,
  IQMS.Common.JumpConstants,
  Vcl.Graphics,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniBitBtn, uniImage;

type
  TFrmCRMOpenRecurrencePrompt = class(TUniForm)
    PnlClient: TUniPanel;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PnlImageCarrier: TUniPanel;
    PnlTextCarrier: TUniPanel;
    Image1: TUniImage;
    lblPrompt: TUniLabel;
    Bevel1: TUniPanel;
    PnlOptionCarrier: TUniPanel;
    rbThis: TUniRadioButton;
    rbAll: TUniRadioButton;
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function SelectedIndex: Integer;
  end;

implementation

{$R *.DFM}

function TFrmCRMOpenRecurrencePrompt.SelectedIndex: Integer;
begin
  if rbThis.Checked then
    Result := 0
  else
    Result := 1;
end;

procedure TFrmCRMOpenRecurrencePrompt.UniFormShow(Sender: TObject);
begin
  lblPrompt.AutoSize := FALSE;
  lblPrompt.AutoSize := TRUE;
  lblPrompt.Update;
end;

end.

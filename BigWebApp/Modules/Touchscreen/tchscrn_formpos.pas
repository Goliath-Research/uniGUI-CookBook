unit tchscrn_formpos;

interface

uses
  tchscrn_const,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniBitBtn,
  uniSpeedButton, Vcl.Controls, System.Classes, Vcl.Forms;

type
  TFrmTouchScreenSetFormPos = class(TUniForm)
    PnlMain: TUniPanel;
    sbtnClose: TUniSpeedButton;
    sbtnKeypad: TUniSpeedButton;
    sbtnKeyboard: TUniSpeedButton;
    sbtnDateTime: TUniSpeedButton;
    SpeedButton1: TUniSpeedButton;
    procedure DoBtnClick(Sender: TObject);
  private
    { Private declarations }
    FResult: TScreenPos;
  public
    { Public declarations }
    class procedure DoShowModal(var aScreenPos:TScreenPos);

    property ScreenPosition: TScreenPos read FResult;
  end;

implementation

{$R *.dfm}

class procedure TFrmTouchScreenSetFormPos.DoShowModal(var aScreenPos:TScreenPos);
var
  frm:TFrmTouchScreenSetFormPos;
begin
  frm := TFrmTouchScreenSetFormPos.Create(uniGUIApplication.UniApplication);
  if frm.ShowModal = mrOK then
    aScreenPos := frm.ScreenPosition;
end;

procedure TFrmTouchScreenSetFormPos.DoBtnClick(Sender: TObject);
begin
  with TComponent(Sender) do
    FResult := TScreenPos(Tag);
  ModalResult := mrOk;
end;

end.

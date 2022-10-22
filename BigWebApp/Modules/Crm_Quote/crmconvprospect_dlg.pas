unit crmconvprospect_dlg;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  IQMS.Common.Confbas,
  StdCtrls,
  ExtCtrls,
  Buttons,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniLabel, uniCheckBox,UniGUIApplication;

type
  TFrmConvertProspectDlg = class(TIQDialogCheckBox)
    lblPrompt: TUniLabel;
    Label1: TUniLabel;
    Panel3: TUniPanel;
    btnYes: TUniBitBtn;
    btnNo: TUniBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function PromptConvertCRMProspectForQuote: Boolean;

implementation

{$R *.dfm}


uses
  IQMS.Common.RegFrm,
  IQMS.Common.Controls;

function PromptConvertCRMProspectForQuote: Boolean;
var
  ADlg: TFrmConvertProspectDlg;
  i: Integer;
begin
  ADlg := TFrmConvertProspectDlg.Create(UniGUIApplication.UniApplication);
  with ADlg do
    try
{ TODO -omsonawane -cWebConvert :  Incompatible types: 'TForm' and 'TFrmConvertProspectDlg'
      CenterForm(ADlg);  }
      IQRegFormRead(ADlg, [ADlg, CheckBox]);
      if not SR.Enabled['btnNo'] then
        BorderIcons := [];

      if CheckBox.Checked then
      begin
        IQRegIntegerScalarRead(ADlg, 'LastResult', i);
        ModalResult := TModalResult(i);
        Result := TModalResult(i) = mrOk;
      end
      else
        Result := ShowModal = mrOk;
    finally
      IQRegFormWrite(ADlg, [ADlg, CheckBox]);
      if CheckBox.Checked then
        IQRegIntegerScalarWrite(ADlg, 'LastResult', Ord(ModalResult));
      Free;
    end;
end;

end.

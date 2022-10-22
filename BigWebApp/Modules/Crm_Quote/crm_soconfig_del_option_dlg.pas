unit crm_soconfig_del_option_dlg;

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
  StdCtrls,
  ExtCtrls,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmCRMSalesConfigDeleteOptionDlg = class(TUniForm)
    lblPrompt: TUniLabel;
    PnlButtons: TUniPanel;
    Panel3: TUniPanel;
    btnYes: TUniButton;
    btnNo: TUniButton;
    SR: TIQWebSecurityRegister;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function PromptDeleteSalesConfigOption(): Boolean;



implementation

{$R *.dfm}

 { TODO -oSanketG -cWebConvert : Need to revisit
uses
  iqsecins;}

function PromptDeleteSalesConfigOption(): Boolean;
var
  FrmCRMSalesConfigDeleteOptionDlg: TFrmCRMSalesConfigDeleteOptionDlg;
begin
  FrmCRMSalesConfigDeleteOptionDlg := TFrmCRMSalesConfigDeleteOptionDlg.Create(uniGUIApplication.UniApplication);
  Result := FrmCRMSalesConfigDeleteOptionDlg.ShowModal = mrOk;
end;

procedure TFrmCRMSalesConfigDeleteOptionDlg.FormShow(Sender: TObject);
begin
  { TODO -oSanketG -cWebConvert : Need to revisit , dependent on IQSecIns}
  //iqsecins.EnsureSecurityInspectorOnTopOf(Self);
end;

end.

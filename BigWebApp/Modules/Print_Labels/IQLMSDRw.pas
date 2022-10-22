unit IQLMSDRw;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Iqlmpurc,
  Mask,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.UserDefinedLabel,
  IQMS.WebVcl.UDComboBox,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniPanel,
  uniBitBtn,
  uniSpeedButton;

type
  TFrmLM_SDRaw = class(TFrmLM_Purch)
    btnPrintLabel: TUniBitBtn;
    sbtnEditBoxQty: TUniSpeedButton;
    sbtnEditLabelQty: TUniSpeedButton;
    btnClose: TUniBitBtn;
    procedure sbtnEditBoxQtyClick(Sender: TObject);
    procedure sbtnEditLabelQtyClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    procedure AssignDefaults;override;
    function GetParent: TWinControl;
    procedure SetParent(const Value: TWinControl);
    function GetCloseBtnVisible: Boolean;
    procedure SetCloseBtnVisible(const Value: Boolean);
    { Private declarations }
  published
     property DisplayParent : TWinControl read GetParent write SetParent;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; Id:Real);override;

    property CloseBtnVisible: Boolean read GetCloseBtnVisible write SetCloseBtnVisible;
  end;

var
  FrmLM_SDRaw:TFrmLM_SDRaw;

implementation

{$R *.DFM}

uses
  IQMS.PrintLabels.LabelMatrix,
  sd_const,
//  touchscrn,
  IQMS.WebVcl.ResourceStrings;

{ TFrmLM_SDRaw }

constructor TFrmLM_SDRaw.Create(AOwner: TComponent; Id: Real);
begin
  inherited Create( AOwner, Id);

  TIQWebLMBase(Owner).FPONORec := TIQWebLMBase(Owner).FPONO;
  EditLblQty.Text := '1';
  EditQty.Text := '1';
  TIQWebLMBase(Owner).AssignBlends;

  Panel1.Visible := False;
  CloseBtnVisible := False; // default (10/25/2010)

  with TIQWebLMBase( Owner ) as TIQWebSDLMRaw do
   begin
     if ( hDisplayParent <> NIL ) and Assigned( hDisplayParent ) then
        begin
          PageControl1.Parent := hDisplayParent;
          Visible := False;
        end;
   end;
end;

procedure TFrmLM_SDRaw.AssignDefaults;
begin
     inherited;
     //
end;


function TFrmLM_SDRaw.GetParent: TWinControl;
begin
     Result := FrmLM_SDRaw.PageControl1.Parent;
end;

procedure TFrmLM_SDRaw.SetParent(const Value: TWinControl);
begin
     FrmLM_SDRaw.PageControl1.Parent := Value;
end;

procedure TFrmLM_SDRaw.sbtnEditBoxQtyClick(Sender: TObject);
begin
//  touchscrn.TouchScreen_EditFloat( EditQty );
end;

procedure TFrmLM_SDRaw.sbtnEditLabelQtyClick(Sender: TObject);
begin
//  touchscrn.TouchScreen_EditFloat( EditLblQty );
end;

function TFrmLM_SDRaw.GetCloseBtnVisible: Boolean;
begin
  Result := btnClose.Visible;
end;

procedure TFrmLM_SDRaw.SetCloseBtnVisible(const Value: Boolean);
begin
  btnClose.Visible := Value;
  if Value then
     btnClose.Left := TUniPanel(btnClose.Parent).ClientWidth - (btnClose.Width + 32);
end;

procedure TFrmLM_SDRaw.BtnOkClick(Sender: TObject);
begin
  inherited BtnOkClick(Sender);
{
  // 'Would you like to print another label?'
  if touchscrn.TouchScreen_Msg_ConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000136) then
     AssignDefaults // protected method
  else if Assigned( Application.MainForm ) then
     PostMessage( Application.MainForm.Handle, IQMS.Common.UserMessages.IQ_NOTIFY,
       sd_const.NOTIFY_SHOW_LAST_MODULE, 0 );
}
end;

end.

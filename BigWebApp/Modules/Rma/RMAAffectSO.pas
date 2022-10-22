unit RMAAffectSO;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  MainModule,
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
  TFrmAffectSO = class(TUniForm)
    Label1: TUniLabel;
    SR: TIQWebSecurityRegister;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function CheckAffectSO(AId, ARmaReceiptsID:Real):Boolean;

var
  FrmAffectSO: TFrmAffectSO;

implementation
uses
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns,
  IQMS.Common.DataLib;
{$R *.DFM}

function CheckAffectSO(AId, ARmaReceiptsID:Real):Boolean;
var
  ARecId:Real;
  frm : TFrmAffectSO;
begin
//  ARecId := SelectValueFmtAsFloat('select id from rma_receipts where id = %f', [ARmaReceiptsID]);
//  if (ARecId <> 0) and (SelectValueFmtAsString('select NVL(so_updated, ''N'') from rma_detail where id = %f', [AId]) = 'Y') then

  if (SelectValueFmtAsString('select NVL(so_updated, ''N'') from rma_detail where id = %f', [AId]) = 'Y') then
  begin
    Result := false;
    Exit;
  end;

  frm := TFrmAffectSO.Create(uniGUIApplication.UniApplication);
  Result := (frm.ShowModal = mrYes);

end;

procedure TFrmAffectSO.FormShow(Sender: TObject);
begin
  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf( self );
end;

end.

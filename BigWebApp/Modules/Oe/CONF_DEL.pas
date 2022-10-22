unit Conf_Del;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TConfrimDeleteArchive = (daNone, daDelete, daDeleteArchive);

type
  TFrmConfirmDelete = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Button1: TUniButton;
    Button2: TUniButton;
    SR: TIQWebSecurityRegister;
    Panel4: TUniPanel;
    GroupBox1: TUniGroupBox;
    rbDelete: TUniRadioButton;
    rbArcDel: TUniRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    nConfirmDelete:TConfrimDeleteArchive;
  //  constructor Create(AOwner:TComponent; nId, nPercentage:Real);
    { Public declarations }
  end;


function DeleteOrNo(nId:Integer; nPercentage:Real):TConfrimDeleteArchive;

var
  FrmConfirmDelete: TFrmConfirmDelete;

implementation

uses
  IQMS.Common.DataLib;
 // IQSecIns,
//  Oe_main;

{$R *.DFM}

function DeleteOrNo(nId:Integer; nPercentage:Real):TConfrimDeleteArchive;
begin
 FrmConfirmDelete := TFrmConfirmDelete.Create(uniGUIApplication.UniApplication);
  with FrmConfirmDelete do
  try
// removed from source  rbDelete.Enabled := SR.Enabled['rbDelete'] and (SelectValueFmtAsFloat('select count(id) from ord_detail where cumm_shipped <> 0 and orders_id = %f', [nId]) = 0);
  rbDelete.Enabled := SR.Enabled['rbDelete'] and (SelectValueFmtAsFloat('select count(id) from shipment_dtl where order_dtl_id in (select id from ord_detail where orders_id = %f)', [nId]) = 0);
  Panel1.Caption := Format('Order is within %f%% of the closing margin', [nPercentage]);
  Panel1.Visible := nPercentage <> 0;
  if not Panel1.Visible then Height := Height - Panel1.Height;

    Caption := Format('Delete Order # %s', [ SelectValueFmtAsString('select orderno from orders where id = %d', [ nID ]) ]);
    ShowModal;
    Result:= nConfirmDelete;
  finally
    Free;
  end;
end;




procedure TFrmConfirmDelete.FormCreate(Sender: TObject);
begin
  rbArcDel.Checked := True;
end;

procedure TFrmConfirmDelete.Button1Click(Sender: TObject);
begin
  if rbDelete.Checked then
     nConfirmDelete := daDelete
  else nConfirmDelete := daDeleteArchive;
  Close;
end;

procedure TFrmConfirmDelete.Button2Click(Sender: TObject);
begin
  nConfirmDelete := daNone;
  Close;
end;

procedure TFrmConfirmDelete.FormShow(Sender: TObject);
begin
 // EnsureSecurityInspectorOnTopOf( self );
end;

end.

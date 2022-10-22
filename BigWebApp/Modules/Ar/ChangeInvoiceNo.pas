unit ChangeInvoiceNo;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmChangeARInvoiceno = class(TUniForm)
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    BtnCancel: TUniButton;
    BtnOk: TUniButton;
    Edit1: TUniEdit;
    Label1: TUniLabel;
    SR: TIQWebSecurityRegister;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    FResult:boolean;
    FId:Real;
    { Private declarations }
  public
    { Public declarations }
  end;

function DoChangeInvoiceNo( AId:Real ):boolean;


implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;
  //IQSecIns;
{$R *.dfm}

function DoChangeInvoiceNo( AId:Real ):boolean;
var
  Form: TFrmChangeARInvoiceno;
begin
  Form := TFrmChangeARInvoiceno.Create(uniGUIApplication.UniApplication);
  Form.FResult := false;
  Form.FId := AId;
//  IQRegFormRead( self, [ self ]);
  Form.Edit1.Text := SelectValueFmtAsString('select invoice_no from arprepost where id = %f', [AId]);
  Form.ShowModal;

  Result := Form.FResult;

end;


procedure TFrmChangeARInvoiceno.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmChangeARInvoiceno.BtnOkClick(Sender: TObject);
begin
  FResult := true;
  if Edit1.Text <> '' then
    ExecuteCommandFmt('update arprepost set invoice_no = ''%s'' where id = %f', [StrTran(Edit1.Text, '''', ''''''), FId]);
    Close;
end;

procedure TFrmChangeARInvoiceno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //IQRegFormRead( self, [ self ]);
end;

procedure TFrmChangeARInvoiceno.FormShow(Sender: TObject);
begin
  //EnsureSecurityInspectorOnTopOf( self );
end;

end.

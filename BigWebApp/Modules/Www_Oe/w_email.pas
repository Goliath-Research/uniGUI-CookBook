unit w_email;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniEdit,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, Vcl.Controls;

type
  TFrmWWWEMail = class(TUniForm)
    Panel2: TUniPanel;
    btnCancel: TUniBitBtn;
    btnSend: TUniBitBtn;
    Panel1: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    dbSubject: TUniEdit;
    dbRecepient: TUniEdit;
    memBody: TUniMemo;
    Label1: TUniLabel;
    Panel3: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoW_Email(ARecepient, ABody, ASubject:String);



implementation

{$R *.DFM}

uses
  IQMS.Common.EmailUtils,
  IQMS.Common.RegFrm,
  w_oe_rscstr;

procedure DoW_Email(ARecepient, ABody, ASubject:String);
var
  FrmWWWEMail: TFrmWWWEMail;
begin
  FrmWWWEMail := TFrmWWWEMail.Create(UniGUIApplication.UniApplication);
  with FrmWWWEMail do
  begin
    dbRecepient.Text := ARecepient;
    memBody.Text     := ABody;
    dbSubject.Text   := ASubject;
    ShowModal;
  end;
end;

procedure TFrmWWWEMail.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmWWWEMail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmWWWEMail.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmWWWEMail.btnSendClick(Sender: TObject);
begin
  IQMS.Common.EmailUtils.IQSendMailSmtp(dbRecepient.Text, // ARecipient (String)
                            dbSubject.Text, // ASubject (String)
                            memBody.Text, // ABodyText (String)
                            NIL, // AAttachments (TStringList)
                            False); // AHTML (Boolean)

  Close;
end;

end.

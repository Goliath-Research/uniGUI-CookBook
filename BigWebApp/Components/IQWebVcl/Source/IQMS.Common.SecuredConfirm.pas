{1. inherit from this form.
 2. change the SR SecurityCode
 3. change form's caption
 4. Call: if TheNewClass.DoShowModal('My Confirm Text') = mrYes then
}
unit IQMS.Common.SecuredConfirm;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  UniImage,
  uniLabel, Vcl.Graphics;

type
  TFrmSecuredConfirm = class(TUniForm)
    Panel1: TUniPanel;
    btnYes: TUniButton;
    btnNo: TUniButton;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Image1: TUniImage;
    Panel4: TUniPanel;
    Bevel1: TUniPanel;
    lblConfirmationText: TUniLabel;
    Bevel2: TUniPanel;
    Bevel3: TUniPanel;
    SR: TIQWebSecurityRegister;
    btnCancel: TUniButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetConfirmationText(const AConfirmationText: string);
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal( AConfirmationText: string ): TModalResult; overload;
    class function DoShowModal: TModalResult; overload;
    property ConfirmationText:string write SetConfirmationText;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm;
//  IQSecIns;

{ TFrmSecuredConfirm }
class function TFrmSecuredConfirm.DoShowModal( AConfirmationText: string ): TModalResult;
var
  FrmSecuredConfirm: TFrmSecuredConfirm;
begin
  FrmSecuredConfirm:= TFrmSecuredConfirm.Create(uniGUIApplication.UniApplication);
  with FrmSecuredConfirm do
  begin
    ConfirmationText:=AConfirmationText;
    Result:= ShowModal;
  end;
end;

class function TFrmSecuredConfirm.DoShowModal: TModalResult;
var
  FrmSecuredConfirm: TFrmSecuredConfirm;
begin
  FrmSecuredConfirm:= TFrmSecuredConfirm.Create(uniGUIApplication.UniApplication);
  with FrmSecuredConfirm do
  begin
    ConfirmationText:='';
    Result:= ShowModal;
  end;
end;

procedure TFrmSecuredConfirm.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmSecuredConfirm.SetConfirmationText(const AConfirmationText: string);
begin
  if AConfirmationText <> '' then
     lblConfirmationText.Caption:= AConfirmationText;
end;

procedure TFrmSecuredConfirm.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmSecuredConfirm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

end.

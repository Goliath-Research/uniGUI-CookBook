unit crm_menu_prop;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniMemo,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton,
  uniCheckBox;

type
  TFrmCRMMenuProperties = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    chkVisible: TUniCheckBox;
    edtCaption: TUniEdit;
    lblCaption: TUniLabel;
    btnCancel: TUniButton;
    btnOk: TUniButton;
    Label1: TUniLabel;
    memDescrip: TUniMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoCRMMenuProp(ADescrip: String; var ACaption: String; var AVisible: Boolean): Boolean;

implementation

{$R *.DFM}


uses
 MainModule;

function DoCRMMenuProp(ADescrip: String;
  var ACaption: String; var AVisible: Boolean): Boolean;
var
  FrmCRMMenuProperties : TFrmCRMMenuProperties;
begin
  FrmCRMMenuProperties := TFrmCRMMenuProperties.Create(UniApplication);
  with FrmCRMMenuProperties do
   begin
    edtCaption.Text := ACaption;
    memDescrip.Text := ADescrip;
    chkVisible.Checked := AVisible;

    Result := ShowModal = mrOk;
    if Result then
    begin
      ACaption := edtCaption.Text;
      AVisible := chkVisible.Checked;
    end;
   end;
end;

end.

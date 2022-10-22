unit SelClass;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniMultiItem,
  uniComboBox;

type
  TFrmSelClass = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    GroupBox1: TUniGroupBox;
    cbClass: TUniComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoSelectClass(var AClass:String):Boolean;


implementation

uses
  IQMS.Common.RegFrm;

{$R *.DFM}

function DoSelectClass(var AClass:String):Boolean;
var
  FrmSelClass : TFrmSelClass;
begin
  FrmSelClass := TFrmSelClass.Create(uniGUIApplication.UniApplication);
  with FrmSelClass do
  begin
    cbClass.Text := AClass;
    Result := ShowModal = mrOk;
     if Result then
       AClass := cbClass.Text;
  end;
end;

procedure TFrmSelClass.btnOkClick(Sender: TObject);
begin
  if Trim(cbClass.Text) = '' then raise Exception.Create('No class selected.');
  ModalResult := mrOk;
end;

procedure TFrmSelClass.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmSelClass.FormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

end.

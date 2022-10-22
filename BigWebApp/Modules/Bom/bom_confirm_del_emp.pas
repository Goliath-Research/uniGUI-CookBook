unit bom_confirm_del_emp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Graphics,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniCheckBox,
  uniImage;

type
  TFrmBOMConfirmDeleteEmployee = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Image1: TUniImage;
    Label1: TUniLabel;
    chkAllBoms: TUniCheckBox;
    Bevel1: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShoModal( var ADeleteFromAllBOMs: Boolean): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm;

{ TFrmBOMConfirmDeleteEmployee }

class function TFrmBOMConfirmDeleteEmployee.DoShoModal(var ADeleteFromAllBOMs: Boolean): Boolean;
var
  FrmBOMConfirmDeleteEmployee: TFrmBOMConfirmDeleteEmployee;
begin
  FrmBOMConfirmDeleteEmployee := TFrmBOMConfirmDeleteEmployee.Create(uniGUIApplication.UniApplication);
  with FrmBOMConfirmDeleteEmployee do
  begin
    Result:= ShowModal = mrOK;
    if Result then
      ADeleteFromAllBOMs:= chkAllBoms.Checked;
  end;
end;

procedure TFrmBOMConfirmDeleteEmployee.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmBOMConfirmDeleteEmployee.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

end.

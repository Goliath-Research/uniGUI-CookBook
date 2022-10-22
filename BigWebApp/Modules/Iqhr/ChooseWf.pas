unit ChooseWf;

interface

uses
  System.Classes,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, Vcl.Controls;

type
  TFrmChooseWf = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    rbEmp: TUniRadioButton;
    rbApp: TUniRadioButton;
    procedure BtnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnOkClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;


procedure DOChooseWF(AOwner:TComponent);

var
  FrmChooseWf: TFrmChooseWf;

implementation
uses
  IQMS.Common.RegFrm;
//  pr_emp_wf_main,
 // hr_app_wf_main;
{$R *.dfm}

procedure DOChooseWF(AOwner:TComponent);
begin
  with TFrmChooseWf.Create(AOwner) do Show;
end;




procedure TFrmChooseWf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
  Action := caFree;
end;

procedure TFrmChooseWf.UniFormCreate(Sender: TObject);
var
  AType:Integer;
begin
  inherited;
  IQRegFormRead( self, [self]);
  AType := 0;

  if IQRegIntegerScalarRead( self, 'CHOOSE_WF', AType ) then
  begin
    if AType = 0 then
    begin
      rbEmp.Checked := true;
      rbApp.Checked := false;
    end
    else
    begin
      rbEmp.Checked := false;
      rbApp.Checked := true;
    end;
  end
  else
  begin
    rbEmp.Checked := true;
    rbApp.Checked := false;
    IQRegIntegerScalarWrite( self, 'CHOOSE_WF', 0);
  end;
end;

procedure TFrmChooseWf.BtnOkClick(Sender: TObject);
begin
  if rbEmp.checked then
  begin
    IQRegIntegerScalarWrite( self, 'CHOOSE_WF', 0);
//    TFrmPrEmpWorkflowMain.DoShow;
  end
  else
  begin
    IQRegIntegerScalarWrite( self, 'CHOOSE_WF', 1);
 //   TFrmHrAppWorkflowMain.DoShow;
  end;
  Close;
end;

procedure TFrmChooseWf.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

end.

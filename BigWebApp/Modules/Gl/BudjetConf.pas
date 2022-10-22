unit BudjetConf;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmBudgetConfirm = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnYes: TUniButton;
    BtnNo: TUniButton;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    SR: TIQWebSecurityRegister;
    CheckBox1: TUniCheckBox;
    CheckBox2: TUniCheckBox;
    Label1: TUniLabel;
    Label2: TUniLabel;
    procedure BtnNoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnYesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FKind:String;
    FResult:boolean;
  public
    { Public declarations }
  end;

function DoConfirmBudgetRecalc(var AKind:String):boolean;


implementation
uses
  IQMS.Common.RegFrm,
  gl_rscstr;
  //WEBCONVERT IQSecIns;
{$R *.dfm}


function DoConfirmBudgetRecalc(var AKind:String):boolean;
var
  LFrmBudgetConfirm : TFrmBudgetConfirm;
begin
  LFrmBudgetConfirm := TFrmBudgetConfirm.Create(uniGUIApplication.UniApplication);
  with LFrmBudgetConfirm do
  begin
    ShowModal;
    AKind := FKind;
    Result := FResult;
  end;
end;

procedure TFrmBudgetConfirm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    CheckBox2.checked := false
  else
    CheckBox2.checked := true;
end;

procedure TFrmBudgetConfirm.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
    CheckBox1.checked := false
  else
    CheckBox1.checked := true;
end;

procedure TFrmBudgetConfirm.BtnNoClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBudgetConfirm.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmBudgetConfirm.BtnYesClick(Sender: TObject);
begin
  if (not CheckBox1.checked) and (not CheckBox2.checked) then
    raise Exception.create(gl_rscstr.cTXT0000094)
  else if (CheckBox1.checked) and (CheckBox2.checked) then
    FKind := 'X'
  else if (CheckBox1.checked) then
    FKind := 'S'
  else
    FKind := 'P';
  FResult := true;
  Close;
end;

procedure TFrmBudgetConfirm.FormShow(Sender: TObject);
begin
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmBudgetConfirm.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  FKind := 'X';
  Fresult := false;
end;

end.

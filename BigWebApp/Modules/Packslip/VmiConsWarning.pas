unit VmiConsWarning;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton;

type
  TFrmVMIConsWarning = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    BtnJump: TUniButton;
    Button2: TUniButton;
    Panel3: TUniPanel;
    SR: TIQWebSecurityRegister;
    BtnVoid: TUniButton;
    procedure Button2Click(Sender: TObject);
    procedure BtnJumpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnVoidClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FId:Real;
    FVoid:boolean;
    procedure SetId(const Value: Real);
  public
    { Public declarations }
    //constructor Create(AOwner:TComponent; AId:Real);
    property Id:Real write SetId;
  end;

procedure DisplayVMIConsWarning(AOwner:TComponent; AId:Real; var AVoid:boolean);

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  inv_main;
  //IQSecIns;

procedure DisplayVMIConsWarning(AOwner:TComponent; AId:Real; var AVoid:boolean);
Var
LFrmVMIConsWarning : TFrmVMIConsWarning;
begin
  LFrmVMIConsWarning :=TFrmVMIConsWarning.Create(UniGUIApplication.UniApplication);
  with LFrmVMIConsWarning do
  begin
    ShowModal;
    AVoid := FVoid;
    FVoid := False;
    FId := AId;
  end;
end;

//constructor TFrmVMIConsWarning.Create(AOwner:TComponent; AId:Real);
//begin
//  inherited Create(AOwner);
//  FVoid := False;
//  FId := AId;
//end;

procedure TFrmVMIConsWarning.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmVMIConsWarning.SetId(const Value: Real);
begin
  FId := Value;
end;

procedure TFrmVMIConsWarning.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

procedure TFrmVMIConsWarning.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmVMIConsWarning.BtnJumpClick(Sender: TObject);
begin
  DoInvoiceJump(FId);
  Close;
end;

procedure TFrmVMIConsWarning.BtnVoidClick(Sender: TObject);
begin
  FVoid := True;
  Close;
end;

end.

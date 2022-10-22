unit wc_conf_cntr_type_costs;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.CaptionPanel,
  pngimage,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniImage;

type
  TConfDfltCntrType = class(TUniForm)
    pnl1: TUniPanel;
    pnl2: TUniPanel;
    Image1: TUniImage;
    btnYes: TUniButton;
    btnNo: TUniButton;
    CaptionPanel1: TIQWebCaptionPanel;
    Panel3: TUniPanel;
    SR1: TIQWebSecurityRegister;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnYesClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal: TModalResult;
  end;

implementation

uses
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns,
  IQMS.Common.RegFrm,
  workcntr_rscstr;

{$R *.dfm}

{ TConfDfltCntrType }

procedure TConfDfltCntrType.btnNoClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TConfDfltCntrType.btnYesClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

class function TConfDfltCntrType.DoShowModal: TModalResult;
var
  frm: TConfDfltCntrType;
begin
  frm := TConfDfltCntrType.Create(uniGUIApplication.UniApplication);

  //workcntr_rscstr.cTXT0000038 =
  //Warning!
  frm.CaptionPanel1.Caption := workcntr_rscstr.cTXT0000038;
  //workcntr_rscstr.cTXT0000039 =
  //All Standard Costs for Manufactured Items that use this Center Type...
  frm.CaptionPanel1.Text := workcntr_rscstr.cTXT0000039;
  Result := frm.ShowModal;

end;

procedure TConfDfltCntrType.FormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TConfDfltCntrType.FormShow(Sender: TObject);
begin
  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf(self);
end;

procedure TConfDfltCntrType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

end.

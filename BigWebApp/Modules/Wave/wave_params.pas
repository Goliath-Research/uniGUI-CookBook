unit wave_params;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  { TWaveParamsCargo = record
    PrintPickTicketOnCreate: Boolean;
    PrintShipLabelOnCreate: Boolean;
    EvaluateRequestDate: Boolean;
    SalesOrderReleaseScope: Real;
    constructor Create( ADummy: Real );
    end;
  }
  TFrmWaveParams = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    chkPrintPickTicket: TUniCheckBox;
    chkPrintShipLabel: TUniCheckBox;
    chkEvalReqDate: TUniCheckBox;
    edReleasesScope: TUniEdit;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label6: TUniLabel;
    chkPopulatePendTrans: TUniCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LoadParams;
  public
    { Public declarations }
    class function DoShowModal: Boolean;
    procedure SaveParams;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.RegFrm,
  wave_settings;

{ TWaveParamsCargo }
{
  constructor TWaveParamsCargo.Create(ADummy: Real);
  begin
  PrintPickTicketOnCreate:= False;
  PrintShipLabelOnCreate := False;
  EvaluateRequestDate    := False;
  SalesOrderReleaseScope  := 0;
  end;
}
{ TFrmWaveParams }

class function TFrmWaveParams.DoShowModal: Boolean;
var
  frm: TFrmWaveParams;
begin
  frm := TFrmWaveParams.Create(uniGUIApplication.UniApplication);
  Result := (frm.ShowModal = mrOK);
  if Result then
    frm.SaveParams;
end;

procedure TFrmWaveParams.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  LoadParams;
end;

procedure TFrmWaveParams.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmWaveParams.LoadParams;
begin
  with TWaveSettings.Create do
    try
      chkPrintPickTicket.Checked := PrintPickTicket;
      chkPrintShipLabel.Checked := PrintShippingLabels;
      chkEvalReqDate.Checked := EvaluateRequestDate;
      edReleasesScope.Text := FloatToStr(SalesOrderReleaseScope);
      chkPopulatePendTrans.Checked := PopulatePendingTransactions;
    finally
      Free;
    end;
end;

procedure TFrmWaveParams.SaveParams;
begin
  with TWaveSettings.Create do
    try
      PrintPickTicket := chkPrintPickTicket.Checked;
      PrintShippingLabels := chkPrintShipLabel.Checked;
      EvaluateRequestDate := chkEvalReqDate.Checked;
      SalesOrderReleaseScope := StrToFloat(edReleasesScope.Text);
      PopulatePendingTransactions := chkPopulatePendTrans.Checked;
    finally
      Free;
    end;
end;

procedure TFrmWaveParams.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.

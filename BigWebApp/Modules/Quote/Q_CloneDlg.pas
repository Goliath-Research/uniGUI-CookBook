unit Q_CloneDlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  FireDAC.Comp.DataSet,
  MainModule,
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
  { TFrmQ_CloneDlg }
  TFrmQ_CloneDlg = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnCancel: TUniButton;
    btnOK: TUniButton;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    edRFQ: TUniEdit;
    edRev: TUniEdit;
    chkIncludeUDForm: TUniCheckBox;
    chkIncludeInternalDocs: TUniCheckBox;
    chkIncludeExternalDocs: TUniCheckBox;
    chkIncludeNotes: TUniCheckBox;
    chkIncludeAdditionalNotes: TUniCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure Validate;
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal(AQuote_ID: Real; var ANew_Rfq: string; var ANew_Rev: Real; var AUDForm, AIntDoc, AExtDoc, ANotes, AAddNotes: Boolean): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls,
  quote_rscstr;

{ TFrmQ_CloneDlg }

class function TFrmQ_CloneDlg.DoShowModal(AQuote_ID: Real; var ANew_Rfq: string; var ANew_Rev: Real; var AUDForm, AIntDoc, AExtDoc, ANotes, AAddNotes: Boolean): Boolean;
var
  frm: TFrmQ_CloneDlg;
  A: Variant;
begin
  frm := TFrmQ_CloneDlg.Create(uniGUIApplication.UniApplication);

  with frm do
  begin

    A := SelectValueArrayFmt('select rfq, quote_rev from quote where id = %f', [AQuote_ID]);
    if VarArrayDimCount(A) > 0 then
    begin
      Caption := Format(quote_rscstr.cTXT000000117 { 'Clone RFQ # %s' } , [A[0]]);
      edRFQ.Text := A[0];
      edRev.Text := IntToStr(A[1] + 1);
    end;

    Result := (ShowModal = mrOK);
    if Result then
    begin
      ANew_Rfq := edRFQ.Text;
      ANew_Rev := StrToFloat(edRev.Text);
      AUDForm := chkIncludeUDForm.Checked;
      AIntDoc := chkIncludeInternalDocs.Checked;
      AExtDoc := chkIncludeExternalDocs.Checked;
      ANotes := chkIncludeNotes.Checked;
      AAddNotes := chkIncludeAdditionalNotes.Checked;
    end;
  end;

end;

procedure TFrmQ_CloneDlg.FormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self, PnlLeft01]);

  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
  IQMS.Common.Controls.ResizeCheckBoxes(self, PnlClient02);
end;

procedure TFrmQ_CloneDlg.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult := mrOK;
end;

procedure TFrmQ_CloneDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, PnlLeft01]);
end;

procedure TFrmQ_CloneDlg.Validate;
begin
  IQAssert(edRFQ.Text > '', quote_rscstr.cTXT000000118); // 'Please enter a value for RFQ number.'
  IQAssert(StrToInt(edRev.Text) >= 0, quote_rscstr.cTXT000000119); // 'Please enter a value for Revision.'
  IQAssert(StrToInt(edRev.Text) <= 999, quote_rscstr.cTXT000000120); // 'The value for Revision cannot exceed 999.'
end;

end.

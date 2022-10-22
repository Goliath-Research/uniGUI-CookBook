unit po_clone;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
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
  TFrmPO_Clone = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    Bevel1: TUniPanel;
    Panel4: TUniPanel;
    Splitter1: TUniSplitter;
    Label1: TUniLabel;
    Panel5: TUniPanel;
    edPoNo: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    FNewPoNo: String;
    procedure Validate;
    procedure SetNewPoNo(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal(var ANewPoNo: string): Boolean;
    property NewPoNo : String write SetNewPoNo;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmPO_Clone }

class function TFrmPO_Clone.DoShowModal(var ANewPoNo: string): Boolean;
var
  LFrmPO_Clone : TFrmPO_Clone;
begin
  LFrmPO_Clone := TFrmPO_Clone.Create(UniGUIApplication.UniApplication);
  with LFrmPO_Clone do
  begin
    Result:= ShowModal = mrOK;
    if Result then
       NewPoNo:= edPoNo.Text;
  end;
end;

procedure TFrmPO_Clone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self]);
end;

procedure TFrmPO_Clone.SetNewPoNo(const Value: String);
begin
  FNewPoNo := Value;
end;

procedure TFrmPO_Clone.UniFormShow(Sender: TObject);
begin
  IQRegFormRead(self, [ self]);
  edPoNo.Text:= FNewPoNo;
end;

procedure TFrmPO_Clone.btnOKClick(Sender: TObject);
begin
  Validate;
  ModalResult:= mrOK;
end;

procedure TFrmPO_Clone.Validate;
begin
  edPoNo.Text:= Trim(edPoNo.Text); //Removed uppercase wrapper, CRM# 779218
  IQAssert( edPoNo.Text > '', 'PO# must be entered - operation aborted' );
  IQAssert( SelectValueFmtAsFloat('select id from po where pono = ''%s''', [ edPoNo.Text ]) = 0, Format('PO# %s already exists in the PO table - operation aborted', [ edPoNo.Text ]));
  IQAssert( SelectValueFmtAsFloat('select id from po_hist where pono = ''%s''', [ edPoNo.Text ]) = 0, Format('PO# %s exists in the PO history table - operation aborted', [ edPoNo.Text ]));
end;

end.

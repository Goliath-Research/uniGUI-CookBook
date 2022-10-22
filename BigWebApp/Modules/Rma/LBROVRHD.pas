unit LbrOvrHd;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
//  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox, Vcl.Controls;

type
  TFrmLaborOverhead = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    tblWorkCtr: TFDTable;
    tblLabor: TFDTable;
    tblLaborID: TBCDField;
    tblLaborLABOR_RATE: TFMTBCDField;
    tblWorkCtrID: TBCDField;
    tblWorkCtrEQNO: TStringField;
    tblWorkCtrCNTR_TYPE: TStringField;
    tblWorkCtrCNTR_RATE: TBCDField;
    tblWorkCtrCNTR_COST: TFMTBCDField;
    tblWorkCtrMFGCELL: TStringField;
    tblWorkCtrMFG_TYPE: TStringField;
    tblWorkCtrCNTR_DESC: TStringField;
    tblWorkCtrSET_UP: TBCDField;
    tblWorkCtrSTART_SHOTS: TBCDField;
    tblWorkCtrASY_MACH: TStringField;
    tblWorkCtrIS_RT: TStringField;
    tblWorkCtrCAPACITY: TBCDField;
    tblWorkCtrPMEQMT_ID: TBCDField;
    PnlClient01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlOverhead: TUniPanel;
    PnlLabor: TUniPanel;
    gbOverhead: TUniGroupBox;
    gbLabor: TUniGroupBox;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    PnlOverheadLeft: TUniPanel;
    PnlOverheadClient: TUniPanel;
    Label1: TUniLabel;
    Label3: TUniLabel;
    Label5: TUniLabel;
    cbWc: TUniDBLookupComboBox;
    edWCHrs: TUniEdit;
    edWCTotal: TUniEdit;
    PnlLaborGroup: TUniPanel;
    Splitter3: TUniSplitter;
    PnlLaborLeft: TUniPanel;
    PnlLaborClient: TUniPanel;
    Label2: TUniLabel;
    Label4: TUniLabel;
    Label6: TUniLabel;
    cbLabor: TUniDBLookupComboBox;
    edLaborHrs: TUniEdit;
    edLaborTotal: TUniEdit;
    ds_WorkCtr: TDataSource;
    ds_Labor: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edWCHrsExit(Sender: TObject);
//    procedure cbWcCloseUp(Sender: TObject; LookupTable,
//      FillTable: TDataSet; modified: Boolean);
    procedure cbWcCloseUp(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FID    : Real;
    FBatch: Real;
    function CheckText(AStr:String):Real;
    procedure DisplayTotals;
    procedure PostLaborAndOverHead;
    function TexttoMoney(AStr:String):Real;
    procedure SetID(Value : Real);
    function GetID: Real;
    procedure SetBatch(Value : Real);
    function GetBatch: Real;
  public
    { Public declarations }
    property ID: Real read GetID write SetID;
    property Batch: Real read GetBatch write SetBatch;
  end;

procedure DoLaborOverHead(AID:Real; ABatch: Real );


implementation
{$R *.DFM}
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.WebVcl.Trans,
  IQMS.Common.Controls;

procedure DoLaborOverHead(AID:Real; ABatch: Real );
var
  frm: TFrmLaborOverhead;
begin
  frm:= TFrmLaborOverhead.Create(uniGUIApplication.UniApplication);
  frm.ID := AID;
  frm.Batch := ABatch;
  frm.ShowModal;
end;

procedure TFrmLaborOverhead.UniFormCreate(Sender: TObject);
begin
{ TODO -oLema : Incompatible type in CenterForm }
//  IQMS.Common.Controls.CenterForm(Self);
  IQRegFormRead( self, [self, PnlOverhead, PnlOverheadLeft, PnlLaborLeft]);
  IQSetTablesActive( true, self );
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlOverheadClient);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlLaborClient);
end;


procedure TFrmLaborOverhead.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, PnlOverhead, PnlOverheadLeft, PnlLaborLeft]);
end;


procedure TFrmLaborOverhead.edWCHrsExit(Sender: TObject);
begin
  DisplayTotals;
end;


function TFrmLaborOverhead.CheckText(AStr:String):Real;
begin
  if Trim(AStr) = '' then
     Result := 0
  else
     Result := StrToFloat(AStr);
end;

procedure TFrmLaborOverhead.DisplayTotals;
begin
  if Trim(cbWc.Text) <> '' then
    edWCTotal.Text := Format('%m', [ CheckText(cbWc.Text) * CheckText(edWCHrs.Text)]);
  if Trim(cbLabor.Text) <> '' then
    edLaborTotal.Text := Format('%m', [ CheckText(cbLabor.Text) * CheckText(edLaborHrs.Text)]);
end;

{
procedure TFrmLaborOverhead.cbWcCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  DisplayTotals;
end;
}

procedure TFrmLaborOverhead.cbWcCloseUp(Sender: TObject);
begin
  DisplayTotals;
end;


function TFrmLaborOverhead.TexttoMoney(AStr:String):Real;
var
  S: string;
  i, j:Integer;
begin
  j := 1;
  if (Length(Trim(AStr)) > 0) and ((Trim(AStr)[1] = '-') or (Trim(AStr)[1] = '(')) then j := -1;
  S:= '';
  if Length(Trim(AStr)) > 0 then
    for i := 1 to Length(AStr) do
      if AStr[i]  in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'] then S := S + AStr[i];
  Result := j * CheckText( Trim( S ));
end;


procedure TFrmLaborOverhead.btnOkClick(Sender: TObject);
begin
  DisplayTotals;
  if not((TexttoMoney(edWCTotal.Text) = 0) and (TexttoMoney(edLaborTotal.Text) = 0)) then
    PostLaborAndOverHead;
  Close;
end;

procedure TFrmLaborOverhead.PostLaborAndOverHead;
begin

  with TIQWebLaborOverhead.Create(self) do
  try
    TransBatchAutoInc:= FBatch = 0;
    Trans_Batch:= FBatch;

    Trans_Reason:= '';
    if FBatch > 0 then
       Trans_Reason:= SelectValueFmtAsString('select trans_reason from translog where batch = %f order by id', [ FBatch ]);
    if Trim(Trans_Reason) = '' then
       Trans_Reason:= 'RMA Transaction';

    if edLaborTotal.Text > '' then
       AddLabor( TexttoMoney(edLaborTotal.Text), TRAN_OUT, FID, CheckText(edLaborHrs.Text));
    if edWCTotal.Text > '' then
       AddOverHead( TexttoMoney(edWCTotal.Text),  TRAN_OUT, FID, CheckText(edWCHrs.Text));

    if FBatch > 0 then
       UpdateFG_LotNo( 'OUT', SelectValueFmtAsString('select lotno from translog where batch = %f and nvl(parent_arinvt_id,0) = 0', [ FBatch ]));

    Execute;
  finally
    Free;
  end;
end;

function TFrmLaborOverhead.GetBatch: Real;
begin
  result := FBatch;
end;

function TFrmLaborOverhead.GetID: Real;
begin
  result := FID;
end;

procedure TFrmLaborOverhead.SetBatch(Value: Real);
begin
  FBatch := Value;
end;

procedure TFrmLaborOverhead.SetID(Value: Real);
begin
  FID := Value;
end;

end.











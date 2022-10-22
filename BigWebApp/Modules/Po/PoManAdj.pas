unit PoManAdj;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  wwmonthcalendar,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, uniMainMenu, uniCalendar;

type
  TFrmManRecAdj = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    BtnCancel: TUniButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Label1: TUniLabel;
    Label2: TUniLabel;
    edTotalQty: TUniEdit;
    EdAdjQty: TUniEdit;
    Panel3: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    N1: TUniMenuItem;
    Contents1: TUniMenuItem;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Label5: TUniLabel;
    Panel6: TUniPanel;
    edDate: TUniCalendar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FId :Real;
    FItem : string;
    procedure SetId(const Value:Real);
    procedure SetItem(const Value:string);
  public
    { Public declarations }
    property Id: Real read FId write SetId;
    property Item: string read FItem write SetItem;
  end;

function DoManualReceivedQuantityAdjustment(AId:Real; AItem:String):boolean;

implementation

{$R *.dfm}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  po_rscstr;

function DoManualReceivedQuantityAdjustment(AId:Real; AItem:String):boolean;
var
  frm: TFrmManRecAdj;
begin
  frm := TFrmManRecAdj.Create(uniGUIApplication.UniApplication);
  frm.FId := AId;
  frm.FItem := AItem;
  Result := (frm.ShowModal = mrOk);
end;

procedure TFrmManRecAdj.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmManRecAdj.UniFormShow(Sender: TObject);
begin
  Label3.Caption := Format('PO# %s', [SelectValueFmtAsString('select pono from po p, po_detail d where d.id = %f and d.po_id = p.id', [FId])]);
  Label4.Caption := Format('Item: %s', [FItem]);
//  Caption := Format('Manual Received Quantity Adjustment PO# %s. Item: %s',
//  [SelectValueFmtAsString('select pono from po p, po_detail d where d.id = %f and d.po_id = p.id', [FId]),
//   AItem]);
  edTotalQty.Text := FloatToStr(SelectValueFmtAsFloat('select sum(qty_received) from po_receipts where po_detail_id = %f', [FId]));
  EdAdjQty.Text := FloatToStr(SelectValueFmtAsFloat('select sum(qty_received) from po_receipts where po_detail_id = %f', [FId]));
  edTotalQty.Readonly := True;
  edDate.Date := Date;

end;

procedure TFrmManRecAdj.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmManRecAdj.SetId(const Value: Real);
begin
  FId := Value;
end;

procedure TFrmManRecAdj.SetItem(const Value: string);
begin
  FItem := Value;
end;


procedure TFrmManRecAdj.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmManRecAdj.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmManRecAdj.btnOkClick(Sender: TObject);
var
  AQty:Real;
begin
  if edTotalQty.Text = EdAdjQty.Text then
    raise Exception.Create(po_rscstr.cTXT0000033);

  try
    AQty := StrToFloat(EdAdjQty.Text)
  except
    raise Exception.Create(po_rscstr.cTXT0000034);
  end;

  AQty := AQty -  StrToFloat(edTotalQty.Text);

  ExecuteCommandFmt('insert into po_receipts (po_detail_id, qty_received, date_received, posted, receiptno, user_name) ' +
            ' values (%f, %f, To_Date(''%s'', ''MM/DD/RRRR''), ''Y'', ''CUM RECEIPT ADJUSTMENT'', misc.getusername)',
            [FId, AQty, FormatDateTime('mm/dd/yyyy', edDate.Date)]);

  ModalResult := mrOk;

end;

procedure TFrmManRecAdj.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1034178 );

end;

procedure TFrmManRecAdj.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmPO{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.

unit OrdersDRP;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.DBGrids,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu;

type
  TFrmSalesOrderDRP = class(TUniForm)
    DataSource1: TDataSource;
    Query1: TFDQuery;
    DBGrid1: TUniDBGrid;
    Query1ORDER_ID: TBCDField;
    Query1ORDERNO: TStringField;
    Query1PONO: TStringField;
    Query1REQUEST_DATE: TDateTimeField;
    Query1PROMISE_DATE: TDateTimeField;
    Query1COMPANY: TStringField;
    Query1SHIP_QUAN: TFMTBCDField;
    Query1MFG_QUAN: TFMTBCDField;
    PopupMenu1: TUniPopupMenu;
    JumptoOrder1: TUniMenuItem;
    Query1ORD_DETAIL_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure JumptoOrder1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FShipDate : TDateTime;
    procedure SetArinvt_ID(const Value: Real);
    procedure SetShipDate(const Value: TDateTime);
  public
    { Public declarations }
    //constructor Create( AOwner:TComponent; AArinvt_ID: Real; AShipDate: TDateTime );
    class procedure CreateModaless(AArinvt_ID: Real; AShipDate: TDateTime );
    property Arinvt_ID : Real write SetArinvt_ID;
    property ShipDate : TDateTime write SetShipDate;
  end;

{var
  FrmSalesOrderDRP: TFrmSalesOrderDRP; }

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Cursor,
  capacity_rscstr;

{Based on arinvt_id and date query PTALLOCATE to retrieve sales orders for the DRP item}
{DRP item is an item that we do not manufacture - we buy and sell it}
class procedure TFrmSalesOrderDRP.CreateModaless(AArinvt_ID: Real; AShipDate: TDateTime );
var
  LFrmSalesOrderDRP : TFrmSalesOrderDRP;
begin
  LFrmSalesOrderDRP := TFrmSalesOrderDRP.Create(UniGUIApplication.UniApplication);
  LFrmSalesOrderDRP.Arinvt_ID := AArinvt_ID;
  LFrmSalesOrderDRP.ShipDate := AShipDate;
  LFrmSalesOrderDRP.Show;
end;

(*constructor TFrmSalesOrderDRP.Create( AOwner:TComponent; AArinvt_ID: Real; AShipDate: TDateTime );
begin
  FArinvt_ID:= AArinvt_ID;
  FShipDate := AShipDate;
  inherited Create( AOwner );
  IQSetTablesActiveEx(TRUE, self, capacity_rscstr.cTXT0000005 {'Accessing Sales Orders DRP Demand.  Please Wait.'});
  IQRegFormRead(self, [self, DBGrid1]);
  Caption:= Format('DRP Demand: Sales Orders for %s', [ SelectValueByID( 'RTrim(itemno) || '' '' || rev', 'arinvt', AArinvt_ID )]);
  DBGrid1.Cursor:= crJump;
end; *)

procedure TFrmSalesOrderDRP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //Action:= caFree;
  IQRegFormWrite(self, [self, DBGrid1]);
end;

procedure TFrmSalesOrderDRP.Query1BeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //    ParamByName('arinvt_id').asFloat  := FArinvt_ID;
  //    ParamByName('shipdate').asDateTime:= FShipDate;
  // end;
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID);
  AssignQueryParamValue(DataSet, 'shipdate',  FShipDate);
end;

procedure TFrmSalesOrderDRP.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmSalesOrderDRP.SetShipDate(const Value: TDateTime);
begin
  FShipDate := Value;
end;

procedure TFrmSalesOrderDRP.UniFormShow(Sender: TObject);
begin
  IQSetTablesActiveEx(TRUE, self, capacity_rscstr.cTXT0000005 {'Accessing Sales Orders DRP Demand.  Please Wait.'});
  IQRegFormRead(self, [self, DBGrid1]);
  Caption:= Format('DRP Demand: Sales Orders for %s', [ SelectValueByID( 'RTrim(itemno) || '' '' || rev', 'arinvt', FArinvt_ID )]);
  DBGrid1.Cursor:= crJump;
end;

procedure TFrmSalesOrderDRP.JumptoOrder1Click(Sender: TObject);
begin
  IQJumpOrdDetail.Execute;
end;

end.

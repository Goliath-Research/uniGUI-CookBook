unit TPD_Jump_SO;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  TPD_Jump,
  Data.DB,
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
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Menus,
  Vcl.DBGrids,
  System.Classes,
  Vcl.Controls, uniMainMenu, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniDBNavigator, uniGUIBaseClasses, uniPanel,
  UniGUIApplication;

type
  TFrmTPD_Jump_SO = class(TFrmTPD_JumpBase)
    Query1ORDER_ID: TBCDField;
    Query1ORD_DETAIL_ID: TBCDField;
    Query1MUST_SHIP_DATE: TDateTimeField;
    Query1SHIP_QUAN: TFMTBCDField;
    Query1ARCUSTO_ID: TBCDField;
    Query1SHIP_TO_ID: TFMTBCDField;
    Query1RELEASE_ID: TBCDField;
    Query1CUSTNO: TStringField;
    Query1COMPANY: TStringField;
    Query1ADDR1: TStringField;
    Query1CITY: TStringField;
    Query1STATE: TStringField;
    Query1ORDERNO: TStringField;
    Query1PONO: TStringField;
    Query1QUAN: TBCDField;
    Query1PROMISE_DATE: TDateTimeField;
    procedure JumptoSalesOrder1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoTPD_Jump_SO( AArinvt_ID: Real; AWeek_Start: TDateTime );



implementation

{$R *.DFM}

uses
  { TODO -oSanketG -cWC : Need to revisit }
  //IQMS.Common.UserMessages,
  IQMS.WebVcl.Jump,
  IQMS.Common.JumpConstants;

procedure DoTPD_Jump_SO( AArinvt_ID: Real; AWeek_Start: TDateTime );
var
  FrmTPD_Jump_SO: TFrmTPD_Jump_SO;
begin
  FrmTPD_Jump_SO := TFrmTPD_Jump_SO.Create( UniGUIApplication.UniApplication);
  FrmTPD_Jump_SO.Show;
end;

procedure TFrmTPD_Jump_SO.JumptoSalesOrder1Click(Sender: TObject);
begin
  inherited;  {nothing}
  JumpDirect( iq_JumpToSalesOrderDetail, Query1ORD_DETAIL_ID.asInteger );  {IQJump}
end;

end.

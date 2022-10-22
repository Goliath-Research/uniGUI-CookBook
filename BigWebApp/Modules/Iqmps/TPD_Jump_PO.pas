unit TPD_Jump_PO;

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
  TFrmTPD_Jump_PO = class(TFrmTPD_JumpBase)
    Query1ID: TBCDField;
    Query1PONO: TStringField;
    Query1VENDOR_ID: TBCDField;
    Query1PO_RELEASES_ID: TBCDField;
    Query1PO_DETAIL_ID: TBCDField;
    Query1ARINVT_ID: TBCDField;
    Query1BLANKET_QTY: TBCDField;
    Query1PROMISE_DATE: TDateTimeField;
    Query1REL_QTY: TFMTBCDField;
    Query1REL_QTY_RECEIVED: TFMTBCDField;
    Query1VENDORNO: TStringField;
    Query1COMPANY: TStringField;
    Query1ADDR1: TStringField;
    Query1CITY: TStringField;
    Query1STATE: TStringField;
    procedure JumpTo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoTPD_Jump_PO( AArinvt_ID: Real; AWeek_Start: TDateTime );



implementation

{$R *.DFM}

uses
  { TODO -oSanketG -cWC : Need to revisit }
  //IQMS.Common.UserMessages,
  IQMS.WebVcl.Jump,
  IQMS.Common.JumpConstants;

procedure DoTPD_Jump_PO( AArinvt_ID: Real; AWeek_Start: TDateTime );
var
  FrmTPD_Jump_PO: TFrmTPD_Jump_PO;
begin
  FrmTPD_Jump_PO := TFrmTPD_Jump_PO.Create( UniGUIApplication.UniApplication );
  FrmTPD_Jump_PO.Show;
end;

procedure TFrmTPD_Jump_PO.JumpTo1Click(Sender: TObject);
begin
  inherited; {nothing}
  JumpDirect( iq_JumpToPO, Query1PO_DETAIL_ID.asInteger );  {IQJump}
end;

end.

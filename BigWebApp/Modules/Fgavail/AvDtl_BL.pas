unit AvDtl_BL;

interface

uses
  Winapi.Windows,
  System.Classes,
  AvDtlBas,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.Jump,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniGUIApplication,
  Vcl.DBGrids, uniMainMenu, uniButton, uniGUIClasses, uniPanel, Vcl.Forms,
  uniGUIBaseClasses, uniBasicGrid, uniDBGrid;

type
  TFrmFGAvailDetailBackLog = class(TFrmFGAvailBase)
    Query1ORDERNO: TStringField;
    Query1REQUEST_DATE: TDateTimeField;
    Query1PROMISE_DATE: TDateTimeField;
    Query1MUST_SHIP_DATE: TDateTimeField;
    Query1CUSTNO: TStringField;
    Query1COMPANY: TStringField;
    IQJump1: TIQWebJump;
    Query1ORDER_ID: TBCDField;
    JumpToOrder1: TUniMenuItem;
    Query1SHIP_QUAN_NATIVE: TFMTBCDField;
    Query1PONO: TStringField;
    Query1FORECAST: TStringField;
    procedure JumpToOrder1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoCreate(AArinvt_ID:Real; ADate:TDateTime; ADivision_ID: Real = 0);

implementation

{$R *.DFM}

uses
  fgavail_rscstr;

procedure DoCreate(AArinvt_ID:Real; ADate:TDateTime; ADivision_ID: Real = 0);
var
  frm : TFrmFGAvailDetailBackLog;
begin
  frm := TFrmFGAvailDetailBackLog.Create(uniGUIApplication.UniApplication);
  frm.Arinvt_ID := AArinvt_ID;
  frm.Date := ADate;
  frm.Division_ID := ADivision_ID;
  frm.Show;
end;

procedure TFrmFGAvailDetailBackLog.JumpToOrder1Click(Sender: TObject);
begin
  inherited; {nothing}
  IQJump1.Execute;
end;

procedure TFrmFGAvailDetailBackLog.UniFormCreate(Sender: TObject);
begin
  inherited;
  Caption:= fgavail_rscstr.cTXT0000007 {'Backlog'} + ' ' + Caption;
end;

end.

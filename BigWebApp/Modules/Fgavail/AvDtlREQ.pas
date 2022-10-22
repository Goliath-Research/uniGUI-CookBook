unit AvDtlREQ;

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
  Vcl.DBGrids, uniMainMenu, uniButton, uniGUIClasses, uniPanel, Vcl.Forms,
  uniGUIBaseClasses, uniBasicGrid, uniDBGrid;

type                                              
  TFrmFGAvailDetailReq = class(TFrmFGAvailBase)
    Query1WORKORDER_ID: TBCDField;
    Query1EQNO: TStringField;
    Query1POS: TBCDField;
    Query1QTY: TFMTBCDField;
    Query1MAT_REQ: TFMTBCDField;
    Query1CUSTNO: TStringField;
    Query1COMPANY: TStringField;
    Query1MFGNO: TStringField;
    Query1ITEMNO: TStringField;
    Query1DESCRIP: TStringField;
    IQJump1: TIQWebJump;
    Query1STANDARD_ID: TBCDField;
    Query1ARINVT_ID: TBCDField;
    JumptoWO1: TUniMenuItem;
    JumpToBOM1: TUniMenuItem;
    JumptoInventory1: TUniMenuItem;
    IQJump2: TIQWebJump;
    IQJump3: TIQWebJump;
    JumpToInventoryAvailability1: TUniMenuItem;
    IQJumpInvAvailability: TIQWebJump;
    procedure JumptoWO1Click(Sender: TObject);
    procedure JumpToBOM1Click(Sender: TObject);
    procedure JumptoInventory1Click(Sender: TObject);
    procedure JumpToInventoryAvailability1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoCreate(AArinvt_ID:Real; ADate:TDateTime; ADivision_ID: Real = 0; AIncNonSchedWO: Boolean = FALSE );

implementation

{$R *.DFM}

uses
  fgavail_rscstr,
  uniGUIApplication;

procedure DoCreate(AArinvt_ID:Real; ADate:TDateTime; ADivision_ID: Real = 0; AIncNonSchedWO: Boolean = FALSE );
var
  frm : TFrmFGAvailDetailReq;
begin
  frm := TFrmFGAvailDetailReq.Create(uniGUIApplication.UniApplication);
  frm.Arinvt_ID := AArinvt_ID;
  frm.Date := ADate;
  frm.Division_ID := ADivision_ID;
  frm.Show;
end;

procedure TFrmFGAvailDetailReq.JumptoWO1Click(Sender: TObject);
begin
  inherited;
  IQJump1.Execute;
end;

procedure TFrmFGAvailDetailReq.UniFormCreate(Sender: TObject);
begin
  inherited;
  Caption:= fgavail_rscstr.cTXT0000009 {'Material Requirement'} + ' ' + Caption;
end;

procedure TFrmFGAvailDetailReq.JumpToBOM1Click(Sender: TObject);
begin
  inherited;
  IQJump2.Execute;
end;

procedure TFrmFGAvailDetailReq.JumptoInventory1Click(Sender: TObject);
begin
  inherited;
  IQJump3.Execute;
end;

procedure TFrmFGAvailDetailReq.JumpToInventoryAvailability1Click(
  Sender: TObject);
begin
  inherited;
  IQJumpInvAvailability.Execute;
end;

end.

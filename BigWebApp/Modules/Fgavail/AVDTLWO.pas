unit AvDtlWO;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  AvDtlBas,
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
  Vcl.DBGrids, uniMainMenu, uniButton, uniGUIClasses, uniPanel, Vcl.Forms,
  uniGUIBaseClasses, uniBasicGrid, uniDBGrid;

type
  TFrmFGAvailDetailWO = class(TFrmFGAvailBase)
    Query1WORKORDER_ID: TBCDField;
    Query1QTY: TFMTBCDField;
    Query1CUSTNO: TStringField;
    Query1COMPANY: TStringField;
    Query1EQNO: TStringField;
    Query1POS: TFMTBCDField;
    Query1MFGNO: TStringField;
    IQJump1: TIQWebJump;
    JumpToWO1: TUniMenuItem;
    JumpToBOM1: TUniMenuItem;
    Query1STANDARD_ID: TBCDField;
    IQJump2: TIQWebJump;
    QueryByDivision: TFDQuery;
    QueryByDivisionWORKORDER_ID: TBCDField;
    QueryByDivisionEQNO: TStringField;
    QueryByDivisionPOS: TFMTBCDField;
    QueryByDivisionQTY: TFMTBCDField;
    QueryByDivisionCUSTNO: TStringField;
    QueryByDivisionCOMPANY: TStringField;
    QueryByDivisionMFGNO: TStringField;
    QueryByDivisionSTANDARD_ID: TBCDField;
    procedure JumpToWO1Click(Sender: TObject);
    procedure JumpToBOM1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FIncNonSchedWO: Boolean;
  protected
    procedure AssignQueryParams; override;
  public
    { Public declarations }
  end;

procedure DoCreate(AArinvt_ID:Real; ADate:TDateTime; ADivision_ID: Real = 0; AIncNonSchedWO: Boolean = FALSE );

implementation

{$R *.DFM}

uses
  IQMS.Common.SysShare,
  fgavail_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  uniGUIApplication;

procedure DoCreate(AArinvt_ID:Real; ADate:TDateTime; ADivision_ID: Real = 0; AIncNonSchedWO: Boolean = FALSE );
var
  LFrmFGAvailDetailWO : TFrmFGAvailDetailWO;
begin
  LFrmFGAvailDetailWO := TFrmFGAvailDetailWO.Create(uniGUIApplication.UniApplication);
  LFrmFGAvailDetailWO.FIncNonSchedWO:= AIncNonSchedWO;
  LFrmFGAvailDetailWO.Arinvt_ID := AArinvt_ID;
  LFrmFGAvailDetailWO.Date := ADate;
  LFrmFGAvailDetailWO.Division_ID := ADivision_ID;
  LFrmFGAvailDetailWO.Show;
end;

procedure TFrmFGAvailDetailWO.JumpToWO1Click(Sender: TObject);
begin
  inherited;
  IQJump1.Execute;
end;

procedure TFrmFGAvailDetailWO.UniFormCreate(Sender: TObject);
begin
  inherited;
  Caption:= fgavail_rscstr.cTXT0000010 {'Work Order'} + ' ' + Caption;
end;

procedure TFrmFGAvailDetailWO.JumpToBOM1Click(Sender: TObject);
begin
  inherited;
  IQJump2.Execute;
end;

procedure TFrmFGAvailDetailWO.AssignQueryParams;
var
  I: Integer;
begin
  {based on params.is_whs_division decide what query to use}
  if Is_Whs_Division then      // Sys_Share;
  begin
    DataSource1.DataSet:= QueryByDivision;
    QueryByDivision.Tag:= 0; {allow to auto open}
    Query1.Tag:= 1;
  end;

  // if Assigned(DataSource1.DataSet) then with DataSource1.DataSet as TFDQuery do
  // begin
  //   if Assigned( Params.FindParam('inc_non_sched_wo')) then
  //      ParamByName('inc_non_sched_wo').asFloat:= IQMS.Common.StringUtils.BoolToNum(FIncNonSchedWO);
  // end;
  if Assigned(DataSource1.DataSet) then
     AssignQueryParamValue(DataSource1.DataSet, 'inc_non_sched_wo', IQMS.Common.StringUtils.BoolToNum(FIncNonSchedWO));

  inherited;
end;


end.

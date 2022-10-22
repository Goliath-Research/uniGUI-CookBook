unit TPD_Jump_Planned;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  TPD_Jump,
  Data.DB,
  Vcl.Menus,
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
  Vcl.DBGrids,
  System.Classes,
  Vcl.Controls, uniMainMenu, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniDBNavigator, uniGUIBaseClasses, uniPanel,
  UniGUIApplication;

type
  TFrmTPD_JumpPlanned = class(TFrmTPD_JumpBase)
    Query1WORKORDER_ID: TBCDField;
    Query1MFGNO: TStringField;
    Query1QTY: TFMTBCDField;
    JumpToSchedule1: TUniMenuItem;
    procedure JumpTo1Click(Sender: TObject);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure JumpToSchedule1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoTPD_Jump_PlannedMPS( AArinvt_ID: Real; AWeek_Start: TDateTime );


implementation

{$R *.DFM}

uses
  { TODO -oSanketG -cWC : Need to revisit }
  //IQMS.Common.UserMessages,
  IQMS.WebVcl.Jump,
  IQMS.Common.DataLib,
  IQMS.Common.JumpConstants;

procedure DoTPD_Jump_PlannedMPS( AArinvt_ID: Real; AWeek_Start: TDateTime );
var
  FrmTPD_JumpPlanned: TFrmTPD_JumpPlanned;
begin
  FrmTPD_JumpPlanned := TFrmTPD_JumpPlanned.Create(UniGUIApplication.UniApplication);
  FrmTPD_JumpPlanned.Show;
end;

procedure TFrmTPD_JumpPlanned.JumpTo1Click(Sender: TObject);
begin
  inherited;
  JumpDirect( iq_JumpToWorkOrder, Query1WORKORDER_ID.asInteger );  {IQJump}
end;

procedure TFrmTPD_JumpPlanned.Query1BeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // with DataSet as TFDQuery do
  //   if Params.FindParam('sndop_count') <> nil then
  //      ParamByName('sndop_count').asFloat:= GetSndopCountOfSimilarToASSY1( FArinvt_ID );
  AssignQueryParamValue(DataSet, 'sndop_count', GetSndopCountOfSimilarToASSY1( FArinvt_ID ));
end;

procedure TFrmTPD_JumpPlanned.JumpToSchedule1Click(Sender: TObject);
begin
  inherited;  {n}
  IQMS.WebVcl.Jump.JumpDirect( iq_JumpToScheduleByWorkorder, Query1WORKORDER_ID.asInteger );
end;

end.




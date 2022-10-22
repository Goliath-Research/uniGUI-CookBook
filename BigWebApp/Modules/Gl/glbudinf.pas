unit glbudinf;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication, IQUniGrid, uniGUIFrame;

type
  TFrmBudgInfo = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    Src: TDataSource;
    Qry: TFDQuery;
    QryGLACCT_FY_ID: TBCDField;
    QryGLPERIODS_ID: TBCDField;
    QryBUDAMOUNT: TBCDField;
    QryBUDPERCENT: TBCDField;
    QryBUD_CALC_AMOUNT: TBCDField;
    QryID: TBCDField;
    QryBUDGETS_FY_ID: TBCDField;
    QryDESCRIP: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    FGlPeriodsId: Real;
    FGlAccountId: Real;
    FGlYearId: Real;
    procedure SetGlAccountId(const Value: Real);
    procedure SetGlPeriodsId(const Value: Real);
    procedure SetGlYearId(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property GlPeriodsId: Real read FGlPeriodsId write SetGlPeriodsId;
    property GlAccountId: Real read FGlAccountId write SetGlAccountId;
    property GlYearId: Real read FGlYearId write SetGlYearId;
  end;

procedure ShowBudgetInfo(AGlPeriodsId, AGlYearId, AGlAccountId:Real);

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{$R *.DFM}

procedure ShowBudgetInfo(AGlPeriodsId, AGlYearId, AGlAccountId:Real);
var
  LFrmBudgInfo : TFrmBudgInfo;
begin
  LFrmBudgInfo := TFrmBudgInfo.Create(uniGUIApplication.UniApplication);
  LFrmBudgInfo.Qry.Close;
  LFrmBudgInfo.GlPeriodsId := AGlPeriodsId;
  LFrmBudgInfo.GlAccountId := AGlAccountId;
  LFrmBudgInfo.GlYearId := AGlAccountId;
  LFrmBudgInfo.Qry.Open;
  LFrmBudgInfo.ShowModal;
end;

procedure TFrmBudgInfo.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self]);
end;

procedure TFrmBudgInfo.SetGlAccountId(const Value: Real);
begin
  Qry.ParamByName('Aglacct_id').Value := Value;
end;

procedure TFrmBudgInfo.SetGlPeriodsId(const Value: Real);
begin
  Qry.ParamByName('Aperiod_id').Value := Value;
end;

procedure TFrmBudgInfo.SetGlYearId(const Value: Real);
begin
  Qry.ParamByName('Aglyear_id').Value := Value;
end;

procedure TFrmBudgInfo.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self]);
end;

end.

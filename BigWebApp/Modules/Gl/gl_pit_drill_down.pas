unit gl_pit_drill_down;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmGLActivityPitDrillDown = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery1ARINVT_ID: TBCDField;
    FDQuery1ITEMNO: TStringField;
    FDQuery1QTY: TFMTBCDField;
    FDQuery1DEBIT: TBCDField;
    FDQuery1CREDIT: TBCDField;
    FDQuery1CLASS: TStringField;
    FDQuery1REV: TStringField;
    FDQuery1DESCRIP: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDQuery1BeforeOpen(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    FGLBatch_ID: Real;
    FGLAcct_ID: Real;
    procedure SetGLBatch_ID(const Value: Real);
    procedure SetGLAcct_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow( AGLBatch_ID, AGLAcct_ID: Real );
    property GLBatch_ID: Real write SetGLBatch_ID;
    property GLAcct_ID: Real write SetGLAcct_ID;
  end;


implementation

{$R *.dfm}

uses
  gl_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmGLActivityPitDrillDown }

class procedure TFrmGLActivityPitDrillDown.DoShow(AGLBatch_ID, AGLAcct_ID: Real);
var
  frm : TFrmGLActivityPitDrillDown;
begin
  frm := TFrmGLActivityPitDrillDown.Create( uniGUIApplication.UniApplication);
  frm.GLBatch_ID := AGLBatch_ID;
  frm.GLAcct_ID := AGLAcct_ID;
  frm.Show;
end;

procedure TFrmGLActivityPitDrillDown.FDQuery1BeforeOpen(DataSet: TDataSet);
begin
  with Dataset as TFDQuery do
  begin
    ParamByName('glbatchid_id').Value := Trunc(FGLBatch_ID);
    ParamByName('glacct_id').Value := Trunc(FGLAcct_ID);
  end;
end;

procedure TFrmGLActivityPitDrillDown.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBgrid1 ]);
  Action:= caFree;
end;

procedure TFrmGLActivityPitDrillDown.SetGLAcct_ID(const Value: Real);
begin
  FGLAcct_ID := Value;
end;

procedure TFrmGLActivityPitDrillDown.SetGLBatch_ID(const Value: Real);
begin
  FGLBatch_ID := Value;
  Caption:= Format( gl_rscstr.cTXT0000099, [ FGLBatch_ID, SelectValueByID('acct', 'glacct', FGLAcct_ID)]); {'PIT Drill Down [GLBatch: %.0f, Account# %s]'; }
end;

procedure TFrmGLActivityPitDrillDown.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, wwDBgrid1 ]);
end;

end.

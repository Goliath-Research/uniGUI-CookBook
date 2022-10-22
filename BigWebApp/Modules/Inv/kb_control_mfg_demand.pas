unit kb_control_mfg_demand;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmKB_ControlMfgDemand = class(TUniForm)
    Panel2: TUniPanel;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    PopupMenu1: TUniPopupMenu;
    wwQuery1WORKORDER_ID: TBCDField;
    wwQuery1ORDERNO: TStringField;
    wwQuery1PONO: TStringField;
    wwQuery1CUSTNO: TStringField;
    wwQuery1REL_DATE: TDateTimeField;
    wwQuery1REL_QUAN: TBCDField;
    wwQuery1ORDERS_ID: TBCDField;
    wwQuery1PTORDER_ID: TBCDField;
    wwQuery1ORD_DETAIL_ID: TBCDField;
    IQSearch1: TIQUniGridControl;
    JumpToOE1: TUniMenuItem;
    IQJumpOE: TIQWebJump;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure JumpToOE1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FKB_Control_ID: Real;
    FMfgcell_ID: Real;
    FArinvt_ID: Real;
    FStandard_ID: Real;
    FPartno_ID: Real;
    FScope: Real;
    procedure AssignFormCaption;
    procedure SetKB_Control_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow(AKB_Control_ID: Real );
    property KB_Control_ID: Real write SetKB_Control_ID;
  end;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{$R *.dfm}

{ TFrmKB_ControlMfgDemand }

class procedure TFrmKB_ControlMfgDemand.DoShow(AKB_Control_ID: Real);
var
  LFrmKB_ControlMfgDemand : TFrmKB_ControlMfgDemand;
begin
  LFrmKB_ControlMfgDemand := TFrmKB_ControlMfgDemand.Create(UniGUIApplication.UniApplication);
  with LFrmKB_ControlMfgDemand do
  begin
    KB_Control_ID := AKB_Control_ID;
    Show;
  end;
end;

procedure TFrmKB_ControlMfgDemand.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmKB_ControlMfgDemand.JumpToOE1Click(Sender: TObject);
begin
  IQJumpOE.Execute;
end;

procedure TFrmKB_ControlMfgDemand.SetKB_Control_ID(const Value: Real);
begin
  FKB_Control_ID := Value;
  FMfgcell_ID   := SelectValueByID('mfgcell_id', 'kb_control', FKB_Control_ID);
  FArinvt_ID    := SelectValueByID('arinvt_id', 'kb_control', FKB_Control_ID);
  FStandard_ID  := SelectValueFmtAsFloat('select kb_misc.get_kanban_standard_id( %f ) from dual', [ FKB_Control_ID ]);
  FPartno_ID    := SelectValueFmtAsFloat('select id from partno where arinvt_id = %f and standard_id = %f', [ FArinvt_ID, FStandard_ID ]);
  FScope        := SelectValueFmtAsFloat('select iqmisc.no_zero(nvl(s.runscope, p.mfg_scope), 90) from standard s, params p where s.id = %f', [ FStandard_ID ]);
end;

procedure TFrmKB_ControlMfgDemand.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( FALSE, self );
  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self ]);
  AssignFormCaption;
end;

procedure TFrmKB_ControlMfgDemand.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    Params.ParamByName('mfgcell_id').Value := FMfgcell_ID;
    Params.ParamByName('partno_id').Value := FPartno_ID;
    Params.ParamByName('scope').Value := FScope;
  end;
end;

procedure TFrmKB_ControlMfgDemand.AssignFormCaption;
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select itemno, descrip from arinvt where id = %f', [ FArinvt_ID ]);
  if VarArrayDimCount( A ) > 0 then
     Caption:= Format('Showing Demand [Item#: %s, %s]', [A[0], A[1] ]);
end;


end.

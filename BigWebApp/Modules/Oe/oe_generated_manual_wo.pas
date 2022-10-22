unit oe_generated_manual_wo;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.CaptionPanel,
  Data.DB,
  IQMS.WebVcl.Search,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.ExtCtrls;

type
  TFrmOEGeneratedManualWorkorders = class(TUniForm)
    Panel1: TUniPanel;
    CaptionPanel1: TIQWebCaptionPanel;
    Panel2: TUniPanel;
    Query1: TFDQuery;
    Query1ID: TBCDField;
    Query1EPLANT_ID: TBCDField;
    Query1CYCLES_REQ: TBCDField;
    IQSearch1: TIQUniGridControl;
    DataSource1: TDataSource;
    PopupMenu1: TUniPopupMenu;
    JumpToWorkOrder1: TUniMenuItem;
    IQJump1: TIQWebJump;
    procedure JumpToWorkOrder1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure IQSearch1DblClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FOrd_Detail_ID: Real;
    procedure SetOrd_Detail_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow(AOrd_Detail_ID: Real );
    property Ord_Detail_ID : Real write SetOrd_Detail_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Numbers;

class procedure TFrmOEGeneratedManualWorkorders.DoShow( AOrd_Detail_ID: Real);
var
  LFrmOEGeneratedManualWorkorders : TFrmOEGeneratedManualWorkorders;
begin
  LFrmOEGeneratedManualWorkorders := TFrmOEGeneratedManualWorkorders.Create(UniGUIApplication.UniApplication);
  LFrmOEGeneratedManualWorkorders.Ord_Detail_ID := AOrd_Detail_ID;
  LFrmOEGeneratedManualWorkorders.Show;
end;

procedure TFrmOEGeneratedManualWorkorders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmOEGeneratedManualWorkorders.IQSearch1DblClick(Sender: TObject);
begin
  JumpToWorkOrder1Click(nil);
end;

procedure TFrmOEGeneratedManualWorkorders.Query1BeforeOpen(DataSet: TDataSet);
begin
  with TFDQuery(DataSet) do
    ParamByName('ord_detail_id').asFloat:= FOrd_Detail_ID;
end;

procedure TFrmOEGeneratedManualWorkorders.SetOrd_Detail_ID(const Value: Real);
begin
  FOrd_Detail_ID := Value;
end;

procedure TFrmOEGeneratedManualWorkorders.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self ]);

  Caption:= Format('SO Line # %.0f - Associated Firm Work Orders', [ DtoF(SelectValueByID('ord_det_seqno', 'ord_detail', FOrd_Detail_ID ))]);
end;

procedure TFrmOEGeneratedManualWorkorders.JumpToWorkOrder1Click(Sender: TObject);
begin
  IQJump1.Execute;
end;

end.

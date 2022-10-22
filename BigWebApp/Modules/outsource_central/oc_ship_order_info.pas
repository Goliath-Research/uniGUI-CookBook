unit oc_ship_order_info;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.wwDataInspector,
  Data.DB,
  FireDAC.Comp.Client,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, Vcl.Grids;

type
  TFrmOutSourceShipOrderInfo = class(TUniForm)
    Panel2: TUniPanel;
    { TODO -oysingh -cWebConvert : No uni component for TwwDataInspector }
    //wwDataInspector1: TwwDataInspector;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1PARENT_ARINVT_ID: TBCDField;
    Query1PARENT_CLASS: TStringField;
    Query1PARENT_ITEMNO: TStringField;
    Query1PARENT_DESCRIP: TStringField;
    Query1PARENT_DESCRIP2: TStringField;
    Query1PARENT_REV: TStringField;
    Query1PARENT_WORKORDER_ID: TBCDField;
    Query1CHILD_ARINVT_ID: TBCDField;
    Query1CHILD_CLASS: TStringField;
    Query1CHILD_ITEMNO: TStringField;
    Query1CHILD_DESCRIP: TStringField;
    Query1CHILD_DESCRIP2: TStringField;
    Query1CHILD_REV: TStringField;
    Query1IN_TRANSIT_WORKORDER_ID: TBCDField;
    Query1IN_TRANSIT_PARTNO_ID: TBCDField;
    Query1CHILD_WORKORDER_ID: TFMTBCDField;
    wwDataInspector1: TwwDataInspector;
    wwDBComboDlgChildWO: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure wwDBComboDlgChildWOCustomDlg(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    procedure SetOrd_Detail_ID(const Value: Real);
    { Private declarations }
  protected
    FOrd_Detail_ID: Real;
  public
    { Public declarations }
    class procedure DoShow(AOrd_Detail_ID: Real );
    property Ord_Detail_ID : Real write SetOrd_Detail_ID;
    class procedure DoShowChildWorkorders( AParent_Workorder_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.MsgFrm;

{ TFrmOutSourceShipOrderInfo }

{constructor TFrmOutSourceShipOrderInfo.Create(AOwner: TComponent;
  AOrd_Detail_ID: Real);
begin
  FOrd_Detail_ID:= AOrd_Detail_ID;
  inherited Create(AOwner);
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);
end;      }

class procedure TFrmOutSourceShipOrderInfo.DoShow(AOrd_Detail_ID: Real);
var
  LFrmOutSourceShipOrderInfo : TFrmOutSourceShipOrderInfo;
begin
  LFrmOutSourceShipOrderInfo := TFrmOutSourceShipOrderInfo.Create(UniGUIApplication.UniApplication);
  LFrmOutSourceShipOrderInfo.Ord_Detail_ID := AOrd_Detail_ID;
  LFrmOutSourceShipOrderInfo.Show;
end;

class procedure TFrmOutSourceShipOrderInfo.DoShowChildWorkorders(AParent_Workorder_ID: Real);
var
  AList: TStringList;
begin
  AList:= TStringList.Create;
  try
    LoadColumnValueIntoStringList( AList,     {pas}
                                   Format( 'select workorder_id from wo_depend where parent_workorder_id = %f', [ AParent_Workorder_ID ]));

    AList.Insert(0, Format('Outsource WO# : %.0f'#13, [ AParent_Workorder_ID ]));
    AList.Insert(1, Format('Child workorder(s) of %.0f: ', [ AParent_Workorder_ID ]));
    IQShowStringList( AList );  // IQMsgFrm;
  finally
    AList.Free;
  end;
end;

procedure TFrmOutSourceShipOrderInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmOutSourceShipOrderInfo.Query1BeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).ParamByName('ord_detail_id').asFloat:= FOrd_Detail_ID;
  AssignQueryParamValue(DataSet, 'ord_detail_id', FOrd_Detail_ID);
end;

procedure TFrmOutSourceShipOrderInfo.SetOrd_Detail_ID(const Value: Real);
begin
  FOrd_Detail_ID := Value;
end;

procedure TFrmOutSourceShipOrderInfo.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmOutSourceShipOrderInfo.wwDBComboDlgChildWOCustomDlg(Sender: TObject);
begin
  TFrmOutSourceShipOrderInfo.DoShowChildWorkorders( Query1PARENT_WORKORDER_ID.asFloat );
end;

end.

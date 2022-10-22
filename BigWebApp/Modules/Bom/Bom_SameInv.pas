unit Bom_SameInv;

interface

uses
  Winapi.Windows,
  System.Classes,
  IQMS.Common.GridBase,
  Data.DB,
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
  IQMS.WebVcl.Jump,
  Vcl.Menus,
  FireDAC.Comp.DataSet,
  Vcl.Controls, uniMainMenu, IQUniGrid, Vcl.Forms,
  uniGUIFrame, uniDBNavigator, uniGUIBaseClasses, uniGUIClasses, uniPanel, uniGUIApplication;

type
  TFrmBomSameArinvt = class(TFrmIQGridBase)
    Query1MFGNO: TStringField;
    Query1ITEMNO: TStringField;
    Query1REV: TStringField;
    Query1DESCRIP: TStringField;
    Query1COMPANY: TStringField;
    Query1ID: TBCDField;
    Query1MFG_TYPE: TStringField;
    Query1DESCRIP2: TStringField;
    Query1EPLANT_ID: TBCDField;
    Query1EFFECT_DATE: TDateTimeField;
    Query1DEACTIVE_DATE: TDateTimeField;
    Query1ROUTE_SEQ: TBCDField;
    Query1PK_HIDE: TStringField;
    procedure Query1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FArinvt_ID: Real;
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow( AArinvt_ID: Real );
    property Arinvt_ID: Real write SetArinvt_ID;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib;

class procedure TFrmBomSameArinvt.DoShow(AArinvt_ID: Real);
begin
  TFrmBomSameArinvt.Create( uniGUIApplication.UniApplication).Show;
end;

procedure TFrmBomSameArinvt.Query1BeforeOpen(DataSet: TDataSet);
begin
  inherited;
  // with DataSet as TFDQuery do
  //   ParamByName('arinvt_id').Value := FArinvt_ID;
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID);
end;

procedure TFrmBomSameArinvt.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

end.

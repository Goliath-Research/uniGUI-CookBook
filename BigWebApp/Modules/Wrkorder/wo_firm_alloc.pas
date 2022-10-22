                             unit wo_firm_alloc;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.GridBase,
  Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  IQMS.WebVcl.Jump, Vcl.Menus, uniMainMenu, FireDAC.Comp.Client, IQUniGrid,
  uniGUIFrame, uniDBNavigator, Vcl.Controls, uniGUIBaseClasses, uniGUIClasses,
  uniPanel,MainModule;


type
  TFrmWo_Firm_Alloc = class(TFrmIQGridBase)
    Query1WORKORDER_ID: TBCDField;
    Query1QTY: TFMTBCDField;
    Query1PTALLOCATE_ID: TBCDField;
    Query1ORDER_ID: TBCDField;
    Query1ORD_DETAIL_ID: TBCDField;
    Query1ORDERNO: TStringField;
    Query1ORD_DET_SEQNO: TBCDField;
    Query1ARINVT_ID: TBCDField;
    Query1ITEMNO: TStringField;
    Query1DESCRIP: TStringField;
    Query1CLASS: TStringField;
    Query1REV: TStringField;
    procedure Query1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FWorkorder_ID: Real;
  public
    { Public declarations }
    class procedure DoShowModal( AWorkorder_ID: Real );
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  wo_rscstr;

class procedure TFrmWo_Firm_Alloc.DoShowModal(AWorkorder_ID: Real);
var
   FrmWo_Firm_Alloc: TFrmWo_Firm_Alloc;
begin
   FrmWo_Firm_Alloc:=UniMainModule.GetFormInstance(TFrmWo_Firm_Alloc) as TFrmWo_Firm_Alloc;
   FrmWo_Firm_Alloc.FWorkorder_ID:= AWorkorder_ID;
   //wo_rscstr.cTXT0000032 = 'Firm Work Order %.0f Allocation';
   FrmWo_Firm_Alloc.Caption:= Format(wo_rscstr.cTXT0000032, [ AWorkorder_ID ]);
end;

procedure TFrmWo_Firm_Alloc.Query1BeforeOpen(DataSet: TDataSet);
begin
  inherited;

  AssignQueryParamValue(DataSet, 'id', FWorkorder_ID);
end;

end.

unit crm_drill_arinvoice;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  crm_drilldown_base,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Jump,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniDBNavigator, IQUniGrid, Vcl.Forms,
  uniGUIFrame, Vcl.Controls, uniGUIBaseClasses, uniGUIClasses, uniPanel;

type
  TFrmCRMDrillDown_Invoices = class(TFrmCRMDrillDownBase)
    JARInvoice: TIQWebJump;
    QryInformationARCUSTO_ID: TBCDField;
    QryInformationCOMPANY: TStringField;
    QryInformationARINVOICE_ID: TBCDField;
    QryInformationARINVOICE_DETAIL_ID: TBCDField;
    QryInformationINVOICE_NO: TStringField;
    QryInformationARINVT_ID: TBCDField;
    QryInformationARINVT_ITEMNO: TStringField;
    QryInformationARINVT_DESCRIP: TStringField;
    QryInformationARINVT_REV: TStringField;
    QryInformationINVOICE_QTY: TBCDField;
    QryInformationUNIT_PRICE: TFMTBCDField;
    QryInformationTOTAL_AMT: TFMTBCDField;
    QryInformationINVOICE_DATE: TDateTimeField;
    QryInformationARINVT_DESCRIP2: TStringField;
    procedure QryInformationBeforeOpen(DataSet: TDataSet);
    procedure GridDblClick(Sender: TObject);
  private
    { Private declarations }
    FItemno: String;
    FArcustoID: Real;
  public
    { Public declarations }
    //constructor Create(AOwner: TComponent; AItemNo: String; AArcustoID: Real);
  end;

procedure DoShowArinvtPurchases( AItemNo: String;
  AArcustoID: Real);

var
  FrmCRMDrillDown_Invoices: TFrmCRMDrillDown_Invoices;

implementation

{$R *.DFM}


uses
  IQMS.Common.Cursor,
  IQMS.Common.DataLib;

procedure DoShowArinvtPurchases( AItemNo: String;
  AArcustoID: Real);
  var
    form : TFrmCRMDrillDown_Invoices;
begin
    form :=UniMainModule.GetFormInstance(TFrmCRMDrillDown_Invoices) as TFrmCRMDrillDown_Invoices;
    form.FItemno := AItemNo;
    form.FArcustoID := AArcustoID;
    form.Grid.Cursor := crDrill;

end;

{ TFrmCRMDrillDown_Invoices }

procedure TFrmCRMDrillDown_Invoices.QryInformationBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ITEMNO', Trim(FItemno));
  AssignQueryParamValue(DataSet, 'ARCUSTO_ID', FArcustoID);
end;

procedure TFrmCRMDrillDown_Invoices.GridDblClick(Sender: TObject);
begin
  if (QryInformationARINVOICE_ID.AsFloat > 0) then
    JARInvoice.Execute;
end;

end.

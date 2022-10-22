unit wc_pm_workorders;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.Jump,
  Vcl.Menus,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  MainModule,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBGrid, //TUniDBGridColumn
  uniMainMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, IQUniGrid,
  Vcl.Controls, uniGUIFrame;

type
  TFrmWorkCenterPMWorkorders = class(TUniForm)
    SrcPMWorkOrdersByEQMT: TDataSource;
    QryPMWorkOrdersByEQMT: TFDQuery;
    QryPMWorkOrdersByEQMTID: TBCDField;
    QryPMWorkOrdersByEQMTWO_DATE: TDateTimeField;
    QryPMWorkOrdersByEQMTCLASS: TStringField;
    QryPMWorkOrdersByEQMTDEPARTMENT: TStringField;
    QryPMWorkOrdersByEQMTSTART_DATE: TDateTimeField;
    QryPMWorkOrdersByEQMTEND_DATE: TDateTimeField;
    QryPMWorkOrdersByEQMTPRIORITY: TStringField;
    QryPMWorkOrdersByEQMTSTATUS: TStringField;
    QryPMWorkOrdersByEQMTWO_TYPE: TStringField;
    QryPMWorkOrdersByEQMTUSERID: TStringField;
    QryPMWorkOrdersByEQMTEPLANT_ID: TBCDField;
    GridPMWorkOrdersEQMT: TIQUniGridControl;
    PPMWorkOrdersByEQMT: TUniPopupMenu;
    JumptoWorkOrder1: TUniMenuItem;
    JCustomer: TIQWebJump;
    QryPMWorkOrdersByEQMTWO_OPEN: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumptoWorkOrder1Click(Sender: TObject);
    procedure QryPMWorkOrdersByEQMTBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure GridPMWorkOrdersEQMTDBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    FPMEqmt_ID: Real;
    procedure SetPMEqmt_ID(const Value: Real);
  public
    { Public declarations }
    property PMEqmt_ID: Real write SetPMEqmt_ID;
    class procedure DoShow(APmEqmt_ID: Real);
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.Graphics,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  pm_color,
  workcntr_rscstr;


class procedure TFrmWorkCenterPMWorkorders.DoShow(APmEqmt_ID: Real);
var
  frm: TFrmWorkCenterPMWorkorders;
begin
  frm := TFrmWorkCenterPMWorkorders.Create(uniGUIApplication.UniApplication);
  frm.PMEqmt_ID := APmEqmt_ID;
  frm.Show;
end;

procedure TFrmWorkCenterPMWorkorders.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
  IQSetTablesActive(TRUE, self);

  // workcntr_rscstr.cTXT0000044 = 'MRO Work Orders for Equipment %s';
  Caption := Format(workcntr_rscstr.cTXT0000044,
    [SelectValueByID('eqno', 'pmeqmt', FPmEqmt_ID)]);

end;

procedure TFrmWorkCenterPMWorkorders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmWorkCenterPMWorkorders.JumptoWorkOrder1Click(
  Sender: TObject);
begin
  if QryPMWorkOrdersByEQMTID.AsLargeInt > 0 then
    IQMS.WebVcl.Jump.JumpDirect(iq_JumpToPMWorkOrder, QryPMWorkOrdersByEQMTID.AsLargeInt);
end;

procedure TFrmWorkCenterPMWorkorders.QryPMWorkOrdersByEQMTBeforeOpen(
  DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'pmeqmt_id', FPMEqmt_ID);
end;

procedure TFrmWorkCenterPMWorkorders.SetPMEqmt_ID(const Value: Real);
begin
  FPMEqmt_ID := Value;
end;

procedure TFrmWorkCenterPMWorkorders.GridPMWorkOrdersEQMTDBGridDrawColumnCell(
  Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn;
  Attribs: TUniCellAttribs);
var
  ABrushColor, AFontColor: TColor;
begin
//  if Highlight then
//    Exit;

  if QryPMWorkOrdersByEQMTWO_OPEN.AsString = 'Y' then
    ABrushColor := pm_color.COLOR_WO_OPEN
  else if QryPMWorkOrdersByEQMTWO_OPEN.AsString = 'N' then
    ABrushColor := pm_color.COLOR_WO_CLOSED
  else
    ABrushColor := pm_color.COLOR_UNASSIGNED;

  AFontColor := IQMS.Common.Graphics.GetFontColor(ABrushColor);

  Attribs.Color := ABrushColor;
  Attribs.Font.Color := AFontColor;
end;

end.

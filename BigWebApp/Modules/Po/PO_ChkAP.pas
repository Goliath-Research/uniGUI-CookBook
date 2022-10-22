unit PO_ChkAP;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Data.DB,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniBasicGrid,
  uniDBGrid, uniButton, uniCheckBox, uniPanel, uniEdit, uniDBEdit, uniLabel,
  uniPageControl,
  UniGUIApplication;

type
  TFrmUnInvoicedPOExcep = class(TFrmStatusException)
    TabSheet2: TUniTabSheet;
    DataSource2: TDataSource;
    Query2: TFDQuery;
    DBGrid1: TUniDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure CheckPOReceived_UnInvoiced( APO_ID:Real );
procedure CheckPODetail_UnInvoiced( APODETAIL_ID, APO_ID:Real );



implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib;

procedure CheckPODetail_UnInvoiced( APODETAIL_ID, APO_ID:Real );
var
  FrmUnInvoicedPOExcep: TFrmUnInvoicedPOExcep;
begin
  if SelectValueFmtAsFloat('select count(v.uninvoiced) from v_po_received_vs_ap v where v.po_detail_id = %f and v.uninvoiced <> 0',
               [ APODETAIL_ID ]) > 0 then
     begin
       FrmUnInvoicedPOExcep := TFrmUnInvoicedPOExcep.Create( UniGUIApplication.UniApplication );
       with FrmUnInvoicedPOExcep do
       try
         rcusto_ID := APo_ID;
         if not (ShowModal = mrOK) then
            raise TIQNotAuthorizedException .Create;
       finally
         //Release;
       end;
     end;
end;


procedure CheckPOReceived_UnInvoiced( APO_ID:Real );
var
  FrmUnInvoicedPOExcep: TFrmUnInvoicedPOExcep;
begin
  if SelectValueFmtAsFloat('select count(v.uninvoiced) from v_po_received_vs_ap v where v.po_id = %f and v.uninvoiced <> 0', [ APO_ID ]) > 0 then
     begin
       FrmUnInvoicedPOExcep := TFrmUnInvoicedPOExcep.Create( UniGUIApplication.UniApplication );
       with FrmUnInvoicedPOExcep do
       try
         rcusto_ID := APo_ID;
         if not (ShowModal = mrOK) then
            raise TIQNotAuthorizedException .Create;
       finally
         //Release;
       end;
     end;
end;

end.

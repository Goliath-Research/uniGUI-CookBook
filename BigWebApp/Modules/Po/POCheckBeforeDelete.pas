unit POCheckBeforeDelete;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.Common.StatChk,
  Data.DB,
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
  FireDAC.Comp.Client,
  uniGUIApplication,
  System.Classes;

type
  TFrmCheckPoBeforeDelete = class(TFrmStatusException)
    Query1PONO: TStringField;
    Query1PO_DATE: TDateTimeField;
    Query1STATUS_ID: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

procedure CheckPOBeforeDelete(APOId: Real);

var
  FrmCheckPoBeforeDelete: TFrmCheckPoBeforeDelete;

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib;

procedure CheckPOBeforeDelete(APOId: Real);
begin
  if SelectValueFmtAsInteger(
    'select count(d.id)                                          ' +
    '   from po_detail d,                                        ' +
    '        v_po_receipts_total v                               ' +
    '  where d.po_id = %f                                        ' +
    '    and d.id = v.po_detail_id(+)                            ' +
    '    and NVL(d.total_qty_ord, 0) > NVL(v.qty_received, 0)    ',
    [APOId]) = 0 then
    Exit;
 FrmCheckPoBeforeDelete := TFrmCheckPoBeforeDelete.Create(UniGUIApplication.UniApplication) ;
  with FrmCheckPoBeforeDelete do
    try
      if not(ShowModal = mrOK) then
        raise TIQNotAuthorizedException.Create;
    finally
      Release;
    end;
end;

end.

unit Under_Recv_Chk;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.wwDataInspector,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Grids;

type
  TFrmUnderRecvCheck = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    DataSource1: TDataSource;
    Query1: TFDQuery;
    Query1ID: TBCDField;
    Query1PONO: TStringField;
    Query1SEQ: TBCDField;
    Query1ITEMNO: TStringField;
    Query1DESCRIP: TStringField;
    Query1REV: TStringField;
    Query1CLASS: TStringField;
    Query1QUAN: TBCDField;
    Query1LEFT_TO_RECV: TFMTBCDField;
    Query1RECV_QUAN: TFMTBCDField;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Query1BeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FPO_Releseas_ID: Real;
    procedure SetPO_Releases_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoExecute( APO_Detail_ID: Real );
    class function FindUndershippedRelease( APO_Detail_ID: Real ): Real;
    property PO_Releases_ID: Real write SetPO_Releases_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  { TODO : Dependent on IQsecIns }
  //IQSecIns;

class function TFrmUnderRecvCheck.FindUndershippedRelease( APO_Detail_ID: Real): Real;
begin
  Result:= 0;
  if SelectValueFmtAsString('select v.eval_short_shipment from po_detail d, po, vendor v where d.id = %f and d.po_id = po.id and po.vendor_id = v.id',
                  [ APO_Detail_ID ]) <> 'Y' then
     begin
      EXIT;
     end;

  Result:= SelectValueFmtAsFloat('select id                                                                                            '+
                     '  from                                                                                               '+
                     '       ( select x.id,                                                                                '+
                     '                NVL(x.quan, 0) as quan,                                                              '+
                     // '             NVL(greatest(0, Least( x.quan, x.cum_quan - NVL(r.qty_received, 0))),0) left_to_recv '+
                     '                greatest(0, x.quan - nvl(x.recv_quan,0)) as left_to_recv                             '+
                     '           from c_po_releases x                                                                      '+
                     // '             c_po_receipts_total r                                                                '+
                     '          where                                                                                      '+
                     '                x.po_detail_id = %f )                                                                '+
                     // '         and x.po_detail_id = r.po_detail_id(+))                                                  '+
                     ' where                                                                                               '+
                     '       left_to_recv > 0                                                                              '+
                     '   and abs(quan - left_to_recv) > 0.0000001',
                     [ APO_Detail_ID ]);
end;


class procedure TFrmUnderRecvCheck.DoExecute(APO_Detail_ID: Real);
var
  APO_Releases_ID: Real;
  LFrmUnderRecvCheck : TFrmUnderRecvCheck;
begin
  if IsConsole then
     EXIT;

  APO_Releases_ID:= TFrmUnderRecvCheck.FindUndershippedRelease( APO_Detail_ID );
  if APO_Releases_ID = 0 then
     EXIT;

  LFrmUnderRecvCheck := TFrmUnderRecvCheck.Create(UniGUIApplication.UniApplication);
  with LFrmUnderRecvCheck do
  begin
    PO_Releases_ID := APO_Releases_ID;
    ShowModal;
  end;
end;

procedure TFrmUnderRecvCheck.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmUnderRecvCheck.Query1BeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
    ParamByName('po_releases_id').Value := FPO_Releseas_ID;
end;

procedure TFrmUnderRecvCheck.SetPO_Releases_ID(const Value: Real);
begin
  FPO_Releseas_ID := Value;
end;

procedure TFrmUnderRecvCheck.btnOKClick(Sender: TObject);
begin
  ExecuteCommandFmt('update po_releases set quan = %.6f where id = %f', [ Query1RECV_QUAN.asFloat, FPO_Releseas_ID ]);
  ModalResult:= mrOK;
end;

procedure TFrmUnderRecvCheck.FormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
  { TODO : Dependent on IQsecIns }
  //EnsureSecurityInspectorOnTopOf( self );
end;

end.

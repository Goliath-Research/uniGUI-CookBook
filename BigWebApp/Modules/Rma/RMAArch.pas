unit RMAArch;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;


const cCreditedSQL = 'select distinct rma_id from (select r.id as rma_id,                                                   ' +
                    '                                    r.rmano,                                                          ' +
                    '                                    d.qtyreturned,                                                    ' +
                    '                                    NVL(vc.qty_credited, 0) as qty_credited,                          ' +
                    '                                    NVL(vr.qty_received, 0) as qty_received                           ' +
                    '                               from rma r,                                                            ' +
                    '                                    rma_detail d,                                                     ' +
                    '                                    (select sum(qty_invoiced) as qty_credited,                        ' +
                    '                                            rma_detail_id                                             ' +
                    '                                       from v_rma_credits1                                            ' +
                    '                                      group by rma_detail_id) vc,                                     ' +
                    '                                    (select qty_received, rma_detail_id from v_rma_receipts_total) vr ' +
                    '                              where d.rma_id = r.id                                                   ' +
                    '                                and d.id = vc.rma_detail_id(+)                                        ' +
                    '                                and d.id = vr.rma_detail_id(+)                                        ' +
                    '                                and NVL(r.closed, ''N'') = ''Y''                                      ' +
                    '                                and misc.eplant_filter(r.eplant_id) = 1 )                             ' +
                    '        where qty_credited = qty_received                                                             ' +
                    '          and qty_credited = qtyreturned                                                              ';

const cAllSql = 'select id as rma_id from rma where NVL(CLOSED, ''N'') = ''Y'' and misc.eplant_filter(eplant_id) = 1';

type
  TFrmRMAArchive = class(TUniForm)
    Label1: TUniLabel;
    CBUnInv: TUniCheckBox;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    SR: TIQWebSecurityRegister;
    procedure QryRmaBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DoArchiveClosedRMA:Boolean;


implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.PanelMsg,
  IQMS.Common.DataConst,
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns,
  rma_rscstr;

{$R *.DFM}

function DoArchiveClosedRMA:Boolean;
var
  frm : TFrmRMAArchive;
begin
  frm := TFrmRMAArchive.Create(uniGUIApplication.UniApplication);
  Result := (frm.ShowModal = mrOk);
end;


procedure TFrmRMAArchive.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //IQRegFormWrite( self, [self]);
end;

procedure TFrmRMAArchive.QryRmaBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
end;

procedure TFrmRMAArchive.UniFormCreate(Sender: TObject);
begin
  //IQRegFormRead( self, [self]);
end;

procedure TFrmRMAArchive.btnOkClick(Sender: TObject);
var
  AIds:TStringList;
  I   :Integer;
  hMsg: TPanelMesg;
begin
  hMsg:= hPleaseWait('');
  with TFDQuery.Create(self) do
  try
    AIds := TStringList.Create;
    ConnectionName := cnstFDConnectionName;
//    Connection := MainModule.FDConnection;
    if CBUnInv.Checked then
       Sql.Add(cAllSQL)
    else
       Sql.Add(cCreditedSQL);
    Open;
    if Eof and Bof then
    begin
      ModalResult:= mrCancel;
      EXIT;
    end;

    while not eof do
    begin
      AIds.Add( FieldByName('RMA_ID').asString );
      Next;
    end;

    for I:= 0 to AIds.Count - 1 do
    begin
      hMsg.Mesg:= Format(rma_rscstr.cTXT0000072
       {'Processing RMA header record # %d'}, [ I+1 ]);
      ExecuteCommandFmt('begin RMA_ARCHIVE.Archive_RMA(%s); end;', [AIds[ I ]]);
    end;

    ModalResult := mrOk;
  finally
    AIds.Free;
    hMsg.Free;
    Free;
  end;
end;

procedure TFrmRMAArchive.FormShow(Sender: TObject);
begin
  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf( self );
end;

end.

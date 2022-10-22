unit qsnd_where_used;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
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
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmQSndWhereUsed = class(TUniForm)
    pnlAttachedMat: TUniPanel;
    IQSearchOpMat: TIQUniGridControl;
    QryBOM_Opmat: TFDQuery;
    SrcBOM_OPMat: TDataSource;
    PnlToolbarCaption: TUniPanel;
    lblCaptionLabel: TUniLabel;
    Bevel1: TUniPanel;
    QryBOM_OpmatRFQ: TStringField;
    QryBOM_OpmatQUOTE_ID: TBCDField;
    QryBOM_OpmatQINVT_ID: TBCDField;
    QryBOM_OpmatCLASS: TStringField;
    QryBOM_OpmatITEMNO: TStringField;
    QryBOM_OpmatREV: TStringField;
    QryBOM_OpmatDESCRIP: TStringField;
    QryBOM_OpmatDESCRIP2: TStringField;
    procedure QryBOM_OpmatBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FSndOp_ID: Real;
    procedure SetSndOp_ID(const Value:Real);
  public
    { Public declarations }
    property SndOp_ID: Real write SetSndOp_ID;
    class procedure DoShowModal(ASndop_ID: Real );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  sndop_rscstr;

class procedure TFrmQSndWhereUsed.DoShowModal(ASndop_ID: Real);
var
  frm: TFrmQSndWhereUsed;
begin
  frm := TFrmQSndWhereUsed.Create(uniGUIApplication.UniApplication);
  frm.SndOp_ID := ASndop_ID;
  frm.ShowModal;
end;

procedure TFrmQSndWhereUsed.QryBOM_OpmatBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('sndop_id').Value := FSndOp_ID;
end;

procedure TFrmQSndWhereUsed.SetSndOp_ID(const Value: Real);
begin
  FSndOp_ID := Value;
end;

procedure TFrmQSndWhereUsed.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
end;

procedure TFrmQSndWhereUsed.UniFormShow(Sender: TObject);
begin
  IQSetTablesActiveEx(TRUE, self, sndop_rscstr.cTXT0000050 {'Accessing database.  Please wait.'});
end;

procedure TFrmQSndWhereUsed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

end.

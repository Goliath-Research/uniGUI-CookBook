unit q_extr_line_worksheet;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.wwDataInspector,
  Data.DB,
  Vcl.Wwdatsrc,
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
  TFrmExtrusionLineWorksheet = class(TUniForm)
    Panel1: TUniPanel;
    Panel4: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    wwDataInspector1: TwwDataInspector;
    wwDataSource1: TDataSource;
    QryQuote: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryQuoteEXTR_OD: TFMTBCDField;
    QryQuoteEXTR_ID: TFMTBCDField;
    QryQuoteEXTR_LINESPEED: TFMTBCDField;
    QryQuoteSPG: TFMTBCDField;
    QryQuoteID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryQuoteBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FQuote_ID: Real;
   // procedure Quote_ID(const Value: Real);
    procedure SetQuote_ID(const Value: Real);
  public
    { Public declarations }
    property Quote_ID : Real write SetQuote_ID;
    class function DoShowModal(AQuote_ID: Real; var ASets_Disp, ACycletm_Disp: Real ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{ TFrmExtrusionLineWorksheet }
class function TFrmExtrusionLineWorksheet.DoShowModal(AQuote_ID: Real; var ASets_Disp, ACycletm_Disp: Real ): Boolean;
var
  LFrm : TFrmExtrusionLineWorksheet;
begin
  LFrm := TFrmExtrusionLineWorksheet.Create(uniGUIApplication.UniApplication);
    LFrm.Quote_ID:= AQuote_ID;
    Result:= LFrm.ShowModal = mrOK;
    if Result then
    begin
      ASets_Disp   := 1000/( (Sqr(LFrm.QryQuoteEXTR_OD.asFloat) - Sqr(LFrm.QryQuoteEXTR_ID.asFloat)) * 3.14159 / 4 * LFrm.QryQuoteSPG.asFloat);
      ACycletm_Disp:= (Sqr(LFrm.QryQuoteEXTR_OD.asFloat) - Sqr(LFrm.QryQuoteEXTR_ID.asFloat) ) * 3.14159 / 4 * LFrm.QryQuoteSPG.asFloat * LFrm.QryQuoteEXTR_LINESPEED.asFloat * 60/1000;
    end;
end;

procedure TFrmExtrusionLineWorksheet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmExtrusionLineWorksheet.QryQuoteBeforeOpen(DataSet: TDataSet);
begin
  TFDQuery(DataSet).ParamByName('quote_id').Value := FQuote_ID;
  TFDQuery(DataSet).ParamByName('spg').Value := SelectValueFmtAsFloat('select iqmisc.no_zero(spg) from qinvt where id = %f',
                                                         [ SelectValueFmtAsFloat('select qinvt_id_mat from quote where id = %f', [ FQuote_ID ]) ]);
end;
procedure TFrmExtrusionLineWorksheet.SetQuote_ID(const Value: Real);
begin
      FQuote_ID:=Value;
end;

procedure TFrmExtrusionLineWorksheet.UniFormShow(Sender: TObject);
begin
 IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmExtrusionLineWorksheet.btnOKClick(Sender: TObject);
begin
  QryQuote.CheckBrowseMode;
  ModalResult:= mrOK;
end;

end.

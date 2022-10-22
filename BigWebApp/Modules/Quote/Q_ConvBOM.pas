unit Q_ConvBOM;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.Common.GridBase,
  Data.DB,
  System.Variants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQMS.WebVcl.Jump, Vcl.Menus, uniMainMenu,
  IQUniGrid, uniGUIFrame, uniDBNavigator, Vcl.Controls, uniGUIBaseClasses,
  uniGUIClasses, uniPanel,UniGUIApplication;

type
  TFrmQuoteConvertedBOMs = class(TFrmIQGridBase)
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
    procedure Query1BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FQuote_ID: Real;
    procedure SetQuote_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow( AQuote_ID: Real );
    property Quote_ID : Real write SetQuote_ID;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  quote_rscstr;

class procedure TFrmQuoteConvertedBOMs.DoShow( AQuote_ID: Real );
var
  LFrmQuoteConvertedBOMs : TFrmQuoteConvertedBOMs;
begin
  LFrmQuoteConvertedBOMs := TFrmQuoteConvertedBOMs.Create( UniGUIApplication.UniApplication );
  LFrmQuoteConvertedBOMs.Quote_ID := AQuote_ID;
  LFrmQuoteConvertedBOMs.Show;
end;

procedure TFrmQuoteConvertedBOMs.Query1BeforeOpen(DataSet: TDataSet);
var
  A: Variant;
begin
  inherited;

  A:= SelectValueArrayFmt( 'select rtrim(rfq), eplant_id from quote where id = %f', [ FQuote_ID ]);
  if VarArrayDimCount( A ) = 0 then
     ABORT;

  with DataSet as TFDQuery do
  begin
    ParamByName('rfq').asString     := A[ 0 ];
    ParamByName('eplant_id').Value := A[ 1 ];
  end;
end;

procedure TFrmQuoteConvertedBOMs.SetQuote_ID(const Value: Real);
begin
  FQuote_ID := Value;
    //Caption:= 'BOMs converted from RFQ # ' + SelectValueByID( 'rfq', 'quote', AQuote_ID );
  // 'BOMs Converted from RFQ # %s'
  Caption:= Format(quote_rscstr.cTXT000000134,
   [SelectValueByID( 'rfq', 'quote', Value)]);
end;

end.

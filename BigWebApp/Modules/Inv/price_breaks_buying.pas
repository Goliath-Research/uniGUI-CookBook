unit price_breaks_buying;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmPriceBreaksBuying = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel28: TUniPanel;
    Panel3: TUniPanel;
    QryArinvtBreaks: TFDQuery;
    SrcArinvtBreaks: TDataSource;
    GridInventoryBreaks: TIQUniGridControl;
    QryArinvtBreaksID: TBCDField;
    QryArinvtBreaksARINVT_ID: TBCDField;
    QryArinvtBreaksQUAN: TBCDField;
    QryArinvtBreaksQPRICE: TFMTBCDField;
    QryArinvtBreaksPRICE_DATE: TDateTimeField;
    QryArinvtBreaksEFFECT_DATE: TDateTimeField;
    QryArinvtBreaksDEACTIVE_DATE: TDateTimeField;
    QryArinvtBreaksCOMMENT1: TStringField;
    Panel4: TUniPanel;
    Splitter2: TUniSplitter;
    Panel5: TUniPanel;
    GridArinvtVendorBreaks: TIQUniGridControl;
    SrcArinvtVendors: TDataSource;
    QryArinvtVendors: TFDQuery;
    QryArinvtVendorsID: TBCDField;
    QryArinvtVendorsVEND_ITEMNO: TStringField;
    QryArinvtVendorsVEND_DESCRIP: TStringField;
    GridArinvtVendor: TIQUniGridControl;
    SrcArinvtVendorBreaks: TDataSource;
    QryArinvtVendorBreaks: TFDQuery;
    QryArinvtVendorBreaksID: TBCDField;
    QryArinvtVendorBreaksARINVT_VENDORS_ID: TBCDField;
    QryArinvtVendorBreaksQUAN: TBCDField;
    QryArinvtVendorBreaksQPRICE: TFMTBCDField;
    QryArinvtVendorBreaksPRICE_DATE: TDateTimeField;
    QryArinvtVendorBreaksEFFECT_DATE: TDateTimeField;
    QryArinvtVendorBreaksDEACTIVE_DATE: TDateTimeField;
    QryArinvtVendorBreaksCOMMENT1: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssignParams(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FVendor_ID: Real;
    procedure SetArinvt_ID(const Value: Real);
    procedure SetVendor_ID(const Value: Real);
  public
    { Public declarations }
    property Vendor_ID: Real read FVendor_ID write SetVendor_ID;
    property Arinvt_ID: Real read FArinvt_ID write SetArinvt_ID;
    class procedure DoShowModal( AVendor_ID, AArinvt_ID: Real );
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmPriceBreaksBuying }

class procedure TFrmPriceBreaksBuying.DoShowModal(AVendor_ID, AArinvt_ID: Real);
var
  LFrmPriceBreaksBuying : TFrmPriceBreaksBuying;
begin
  LFrmPriceBreaksBuying := TFrmPriceBreaksBuying.Create( uniGUIApplication.UniApplication );
  LFrmPriceBreaksBuying.Vendor_ID := AVendor_ID;
  LFrmPriceBreaksBuying.Arinvt_ID := AArinvt_ID;
  LFrmPriceBreaksBuying.ShowModal;
end;

procedure TFrmPriceBreaksBuying.AssignParams(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    if Assigned(Params.FindParam('arinvt_id')) then
       Params.ParamByName('arinvt_id').Value := FArinvt_ID;

    if Assigned(Params.FindParam('vendor_id')) then
       Params.ParamByName('vendor_id').Value := FVendor_ID;
  end;
end;

procedure TFrmPriceBreaksBuying.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, Panel1, Panel4,  GridInventoryBreaks, GridArinvtVendor, GridArinvtVendorBreaks ]);
end;

procedure TFrmPriceBreaksBuying.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmPriceBreaksBuying.SetVendor_ID(const Value: Real);
begin
  FVendor_ID := Value;
end;

procedure TFrmPriceBreaksBuying.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, Panel1, Panel4, GridInventoryBreaks, GridArinvtVendor, GridArinvtVendorBreaks ]);
end;

end.

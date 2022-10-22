unit CDVendorAging;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  vcl.Wwdatainspector,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, Vcl.Grids;

type
  TFrmCDVendorAging = class(TUniForm)
    SrcVendorAging: TDataSource;
    ViewVendorAging: TFDQuery;
    ViewVendorAgingVENDORNO: TStringField;
    ViewVendorAgingCOMPANY: TStringField;
    ViewVendorAgingATTN: TStringField;
    ViewVendorAgingADDR1: TStringField;
    ViewVendorAgingADDR2: TStringField;
    ViewVendorAgingADDR3: TStringField;
    ViewVendorAgingCITY: TStringField;
    ViewVendorAgingSTATE: TStringField;
    ViewVendorAgingCOUNTRY: TStringField;
    ViewVendorAgingZIP: TStringField;
    ViewVendorAgingPHONE_NUMBER: TStringField;
    ViewVendorAgingFAX_NUMBER: TStringField;
    ViewVendorAgingUSE_USA_MASK: TStringField;
    ViewVendorAgingCREDIT_LIMIT: TBCDField;
    ViewVendorAgingYTD_PURCHASES: TBCDField;
    ViewVendorAgingp_current: TFloatField;
    ViewVendorAgingp_1_30: TFloatField;
    ViewVendorAgingp_30_60: TFloatField;
    ViewVendorAgingp_60_90: TFloatField;
    ViewVendorAgingp_90: TFloatField;
    ViewVendorAgingtotal_to_pay: TFloatField;
    ViewVendorAgingopen_to_buy: TFloatField;
    ViewVendorAgingtotal_overdue: TFloatField;
    ViewVendorAgingVENDOR_ID: TBCDField;
    ViewVendorAgingCurr_code: TStringField;
    ViewVendorAgingCURRENCY_ID: TBCDField;
    ViewVendorAgingVendorAddress: TStringField;
    ProcOverdue: TFDStoredProc;
    Panel1: TUniPanel;
    diAging: TwwDataInspector;
    procedure ViewVendorAgingCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    FVendorId: Real;
    procedure SetVendorId(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property VendorId:Real read FVendorId write SetVendorId;
  end;

procedure DoCdVendorAging(AVendorId:Real);

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
{$R *.dfm}


procedure DoCdVendorAging(AVendorId:Real);
var
  LFrmCDVendorAging : TFrmCDVendorAging;
begin
  LFrmCDVendorAging := TFrmCDVendorAging.Create(uniGUIApplication.UniApplication);
  LFrmCDVendorAging.VendorId := AVendorId;
  LFrmCDVendorAging.ShowModal;
end;

procedure TFrmCDVendorAging.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmCDVendorAging.SetVendorId(const Value: Real);
var
  AVendor:String;
begin
  AVendor := SelectValueFmtAsString('select ''  Vendor: '' || company || '' ('' || trim(vendorno) || '')'' from vendor where id = %f', [Value]);
  Panel1.Caption := AVendor;
  ViewVendorAging.ParamByName('aId').Value := Value;
  ViewVendorAging.Open;
end;

procedure TFrmCDVendorAging.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmCDVendorAging.ViewVendorAgingCalcFields(DataSet: TDataSet);
begin
  ViewVendorAgingCurr_code.asString := SelectValueFmtAsString('select curr_code from currency where id = %f', [ViewVendorAgingCURRENCY_ID.asFloat]);

  with ProcOverDue do
  begin
    ParamByName('v_vendor_id').Value := ViewVendorAgingVENDOR_ID.AsFloat;
    ExecProc;
    ViewVendorAgingp_current.AsFloat     := ParamByName('v_current').asFloat        ;
    ViewVendorAgingp_1_30.AsFloat        := ParamByName('v_1_30').asFloat           ;
    ViewVendorAgingp_30_60.AsFloat       := ParamByName('v_30_60').asFloat          ;
    ViewVendorAgingp_60_90.AsFloat       := ParamByName('v_60_90').asFloat          ;
    ViewVendorAgingp_90.AsFloat          := ParamByName('v_90').asFloat             ;
    ViewVendorAgingtotal_to_pay.AsFloat  := ParamByName('v_total_to_pay').asFloat      ;
    ViewVendorAgingtotal_overdue.AsFloat := ParamByName('v_total_overdue').asFloat  ;
  end;

  ViewVendorAgingopen_to_buy.AsFloat := ViewVendorAgingCREDIT_LIMIT.AsFloat - ViewVendorAgingtotal_to_pay.asFloat;

  if ViewVendorAgingopen_to_buy.AsFloat < 0 then
    ViewVendorAgingopen_to_buy.AsFloat := 0;
end;

end.

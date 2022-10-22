unit demo_packingslips_dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, MainModule, IQMS.WebVcl.HPick;

type
  TDemoPackSlip_DM = class(TDataModule)
    FDQryPSHeader: TFDQuery;
    SrcPSHeader: TDataSource;
    SrcShip_Dtl: TDataSource;
    FDQryShipDetail: TFDQuery;
    FDQryShipDetailID: TBCDField;
    FDQryShipDetailSHIPMENTS_ID: TBCDField;
    FDQryShipDetailORDER_DTL_ID: TBCDField;
    FDQryShipDetailQTYSHIPPED: TBCDField;
    FDQryShipDetailBACKORDER_QTY: TBCDField;
    FDQryShipDetailINVOICED_QTY: TBCDField;
    FDQryShipDetailORD_INVOICED_QTY: TBCDField;
    FDQryShipDetailCMTLINE: TStringField;
    FDQryShipDetailORD_DETAIL_CMTLINE: TStringField;
    FDQryShipDetailORDERNO: TStringField;
    FDQryShipDetailSHIPMENT_TYPE: TStringField;
    FDQryShipDetailUOM: TStringField;
    FDQryShipDetailCRM_QUOTE_ID: TBCDField;
    FDQryShipDetailCRM_QUOTE_RFQ: TStringField;
    FDQryShipDetailCRM_QUOTE_DESCRIP: TStringField;
    FDQryShipDetailRAN: TStringField;
    FDQryShipDetailPONO: TStringField;
    FDQryShipDetailPHANTOM_PS_TICKET_DTL_ID: TBCDField;
    FDQryShipDetailPS_TICKET_DTL_ARINVT_ID: TBCDField;
    FDQryShipDetailPHANTOM_ORD_DETAIL_ID: TBCDField;
    FDQryShipDetailDESCRIP: TStringField;
    FDQryShipDetailEXTDESCRIP: TStringField;
    FDQryShipDetailITEMNO: TStringField;
    FDQryShipDetailREV: TStringField;
    FDQryShipDetailCLASS: TStringField;
    SrcShip_Rel: TDataSource;
    FDQryShipReleases: TFDQuery;
    FDQryShipReleasesSHIPMENT_DTL_ID: TBCDField;
    FDQryShipReleasesLOC_DESC: TStringField;
    FDQryShipReleasesLOTNO: TStringField;
    FDQryShipReleasesQTYSHIPPED: TBCDField;
    FDQryShipReleasesLOT_DATE: TDateTimeField;
    FDQryShipReleasesLOT_EXPIRY_DATE: TDateTimeField;
    FDQryShipReleasesID: TBCDField;
    FDQryPSHeaderPACKSLIPNO: TStringField;
    FDQryPSHeaderFOB: TStringField;
    FDQryPSHeaderSHIPDATE: TDateTimeField;
    FDQryPSHeaderPS_DATE: TDateTimeField;
    FDQryPSHeaderARCUSTO_CUSTNO: TStringField;
    FDQryPSHeaderARCUSTO_ADDR1: TStringField;
    FDQryPSHeaderARCUSTO_ADDR2: TStringField;
    FDQryPSHeaderARCUSTO_ADDR3: TStringField;
    FDQryPSHeaderARCUSTO_CITY: TStringField;
    FDQryPSHeaderARCUSTO_STATE: TStringField;
    FDQryPSHeaderARCUSTO_COUNTRY: TStringField;
    FDQryPSHeaderARCUSTO_ZIP: TStringField;
    FDQryPSHeaderARCUSTO_EXT: TStringField;
    FDQryPSHeaderARCUSTO_PRIME_CONTACT: TStringField;
    FDQryPSHeaderSHIP_TO_ATTN: TStringField;
    FDQryPSHeaderSHIP_TO_ADDR1: TStringField;
    FDQryPSHeaderSHIP_TO_ADDR2: TStringField;
    FDQryPSHeaderSHIP_TO_ADDR3: TStringField;
    FDQryPSHeaderSHIP_TO_CITY: TStringField;
    FDQryPSHeaderSHIP_TO_STATE: TStringField;
    FDQryPSHeaderSHIP_TO_COUNTRY: TStringField;
    FDQryPSHeaderSHIP_TO_ZIP: TStringField;
    FDQryPSHeaderSHIP_TO_TAX_CODE_ID: TBCDField;
    FDQryPSHeaderSHIP_TO_PHONE_NUMBER: TStringField;
    FDQryPSHeaderSHIP_TO_EXT: TStringField;
    FDQryPSHeaderSHIP_TO_FAX: TStringField;
    FDQryPSHeaderSHIP_TO_PRIME_CONTACT: TStringField;
    FDQryPSHeaderSHIP_TO_SHIP_TIME: TBCDField;
    FDQryPSHeaderBILL_TO_ATTN: TStringField;
    FDQryPSHeaderBILL_TO_ADDR1: TStringField;
    FDQryPSHeaderBILL_TO_ADDR2: TStringField;
    FDQryPSHeaderBILL_TO_ADDR3: TStringField;
    FDQryPSHeaderBILL_TO_CITY: TStringField;
    FDQryPSHeaderBILL_TO_STATE: TStringField;
    FDQryPSHeaderBILL_TO_COUNTRY: TStringField;
    FDQryPSHeaderBILL_TO_ZIP: TStringField;
    FDQryPSHeaderBILL_TO_PHONE_NUMBER: TStringField;
    FDQryPSHeaderBILL_TO_EXT: TStringField;
    FDQryPSHeaderBILL_TO_FAX: TStringField;
    FDQryPSHeaderBILL_TO_PRIME_CONTACT: TStringField;
    FDQryPSHeaderTERMS_DESCRIP: TStringField;
    FDQryPSHeaderTERMS_DAYS: TBCDField;
    FDQryPSHeaderTERMS_DISCOUNT: TBCDField;
    FDQryPSHeaderTERMS_DISCOUNT_DAYS: TBCDField;
    FDQryPSHeaderARCUSTO_COMPANY: TStringField;
    FDQryPSHeaderARCUSTO_PHONE_NUMBER: TStringField;
    FDQryPSHeaderARCUSTO_FAX_NUMBER: TStringField;
    FDQryPSHeaderPOOL_BILL_NUMBER: TStringField;
    FDQryPSHeaderSHIP_VIA: TStringField;
    FDQryPSHeaderFREIGHT_DESCRIP: TStringField;
    FDQryPSHeaderPRO_NO: TStringField;
    FDQryPSHeaderSHIP_TIME: TDateTimeField;
    FDQryPSHeaderEST_ARRIVAL: TDateTimeField;
    FDQryPSHeaderCONVEYANCE_NO: TStringField;
    FDQryPSHeaderBOX_CODE: TStringField;
    FDQryPSHeaderTO_INVOICE: TStringField;
    FDQryPSHeaderARCUSTO_ID: TBCDField;
    FDQryPSHeaderUSERID: TStringField;
    FDQryPSHeaderBOL_COMMENT1: TStringField;
    FDQryPSHeaderSHIPMENT_TYPE: TStringField;
    FDQryPSHeaderEPLANT_ID: TBCDField;
    FDQryPSHeaderEPLANT_NAME: TStringField;
    FDQryPSHeaderARCHIVED: TStringField;
    FDQryPSHeaderEDI_CREATED: TStringField;
    FDQryPSHeaderTRACKING_NUM: TStringField;
    FDQryPSHeaderVMI: TStringField;
    FDQryPSHeaderID: TBCDField;
    FDQryPSHeaderPALLET_COUNT: TBCDField;
    FDQryPSHeaderSHIP_TO_ID: TBCDField;
    FDQryPSHeaderBILL_TO_ID: TBCDField;
    FDQryPSHeaderFREIGHT_ID: TBCDField;
    FDQryPSHeaderPS_TICKET_ID: TBCDField;
    FDQryPSHeaderAUTO_FREIGHT_PRICE: TBCDField;
    FDQryPSHeaderPS_TICKET_BATCH: TBCDField;
    FDQryPSHeaderBOL_ID: TBCDField;
    FDQryPSHeaderFOB_THIRD_PARTY_ID: TBCDField;
    FDQryPSHeaderFOB_ATTN: TStringField;
    FDQryPSHeaderCUSER1: TStringField;
    FDQryPSHeaderTRAILNO: TStringField;
    FDQryPSHeaderNOTE: TStringField;
    FDQryPSHeaderACCRUED_FREIGHT: TBCDField;
  private
    { Private declarations }

    procedure SetActive(Value : boolean);
  public
    { Public declarations }
    procedure Initialize;
    procedure Finalize;
  end;

  function _DemoPackSlip_DM: TDemoPackSlip_DM;


implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule;

{ TDemoPackslip_DM }

function _DemoPackSlip_DM: TDemoPackSlip_DM;
begin
  Result := UniMainModule.GetModuleInstance(TDemoPackSlip_DM) as TDemoPackSlip_DM;
end;

procedure TDemoPackSlip_DM.Initialize;
begin
  SetActive(True);
end;

procedure TDemoPackSlip_DM.Finalize;
begin
  SetActive(False);
end;

procedure TDemoPackSlip_DM.SetActive(Value: boolean);
var
  I : integer;
begin
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if Components[I] is TDataSet then
      TDataSet(Components[I]).Active := Value;
  end;
end;

end.

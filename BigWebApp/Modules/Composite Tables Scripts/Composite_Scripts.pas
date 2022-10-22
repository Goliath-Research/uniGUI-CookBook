unit Composite_Scripts;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  IQMS.Common.StringUtils,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication, IQMS.WebVcl.Strings;

type
  TFrmCompositeScripts = class(TUniForm)
    C_PR_CHECK_EMPL_TAX: TIQWebStrings;
    C_PR_CHECK_TAX_941: TIQWebStrings;
    C_AP_CHEQUE_DETAIL: TIQWebStrings;
    C_AP_DISTRIBUTED: TIQWebStrings;
    C_APINV_DTL_PO_TOTAL: TIQWebStrings;
    C_ARINVOICE_DETAIL_TOTAL: TIQWebStrings;
    C_ARPREPOST_SHIP_SUM: TIQWebStrings;
    C_CASHREC_DTL_TOTAL: TIQWebStrings;
    C_CRPREP_ARINV_TOTAL: TIQWebStrings;
    C_PR_YTDTOTAL_DEDUCT: TIQWebStrings;
    C_TRANSACTION_SET: TIQWebStrings;
    C_VENDOR_RMA_RETURNS: TIQWebStrings;
    C_ARINVOICE_SHIP_SUM: TIQWebStrings;
    C_ARINVOICE_ORD_SUM: TIQWebStrings;
    C_ARPREPOST_ORD_SUM: TIQWebStrings;
    C_CREDIT_MEMO_TOTAL: TIQWebStrings;
    C_GLACCT_YTD: TIQWebStrings;
    C_GLACCT_PERIOD_SUMMARY: TIQWebStrings;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

end.

unit crmquote_const;

interface

uses
  Classes,
  Variants,
  SysUtils,
  crm_rscstr,
  DB;

const
  // The source type count is used for looping.  It is 0-based.
  // We set it here for simplicity.
  nSourceTypeCount = 8;

type
  TQuoteDetailSourceType = (stMISC,
    stSTANDARD,
    stQUOTE,
    stQINVT,
    stARINVT,
    stTOOL_RFQ,
    stSALES_CONFIG,
    stSALES_CONFIG_OPTION,
    stSOURCE_SERVICE_LABOR,
    stAKA);

  TQuoteDetailSourceTypes = array of TQuoteDetailSourceType;

const
  // Source Sets
  // Sources which the user can edit or modify
  ssSourceSet_CanEdit = [stMISC,
    stQINVT,
    stARINVT,
    stTOOL_RFQ,
    stSALES_CONFIG_OPTION,
    stSOURCE_SERVICE_LABOR,
    stAKA];

  ssSourceSet_CanEditMarkup = [stSALES_CONFIG,
    stSALES_CONFIG_OPTION];

  ssSourceSet_CanJump = [stQINVT,
    stARINVT,
    stTOOL_RFQ,
    stSALES_CONFIG,
    stSALES_CONFIG_OPTION,
    stAKA];

  // Ensure each constant matches the table name exactly
  cSOURCE_MISC = '';
  cSOURCE_STANDARD = 'STANDARD';
  cSOURCE_QUOTE = 'QUOTE';
  cSOURCE_QINVT = 'QINVT';
  cSOURCE_ARINVT = 'ARINVT';
  cSOURCE_TOOL_RFQ = 'TOOL_RFQ';
  cSOURCE_SALES_CONFIG = 'SALES_CONFIG';
  cSOURCE_SALES_CONFIG_OPTION = 'SALES_CONFIG_OPTION';
  cSOURCE_SERVICE_LABOR = 'SERVICE_LABOR';
  cSOURCE_AKA = 'AKA';

  QuoteDetailSource: array [TQuoteDetailSourceType] of string =
    (cSOURCE_MISC,
    cSOURCE_STANDARD,
    cSOURCE_QUOTE,
    cSOURCE_QINVT,
    cSOURCE_ARINVT,
    cSOURCE_TOOL_RFQ,
    cSOURCE_SALES_CONFIG,
    cSOURCE_SALES_CONFIG_OPTION,
    cSOURCE_SERVICE_LABOR,
    cSOURCE_AKA);

  QuoteDetailSourceDisplay: array [TQuoteDetailSourceType] of string =
    (crm_rscstr.cTXT0000670, // 'Miscellaneous'
    crm_rscstr.cTXT0000665, // 'BOM'
    crm_rscstr.cTXT0000666, // 'Engineering Quote'
    crm_rscstr.cTXT0000667, // 'Quote Inventory'
    crm_rscstr.cTXT0000668, // 'Master Inventory'
    crm_rscstr.cTXT0000669, // 'Project Manager'
    crm_rscstr.cTXT0001307, // 'Sales Configuration Item'
    crm_rscstr.cTXT0001308, // 'Sales Choice'
    crm_rscstr.cTXT0001412, // 'Service Labor'
    crm_rscstr.cTXT0000675); // 'AKA Inventory'

  QuoteDetailJumpToCaption: array [TQuoteDetailSourceType] of string =
    ('', // 'Miscellaneous'
    crm_rscstr.cTXT0000056, // 'Jump to BOM'
    crm_rscstr.cTXT0000057, // 'Jump to RFQ'
    crm_rscstr.cTXT0000057, // 'Jump to RFQ'
    crm_rscstr.cTXT0000058, // 'Jump to Master Inventory'
    crm_rscstr.cTXT0000059, // 'Jump to Project'
    crm_rscstr.cTXT0001309, // 'Jump to Sales Configuration'
    crm_rscstr.cTXT0001309, // 'Jump to Sales Configuration'
    '', // 'Service Labor'
    crm_rscstr.cTXT0000058); // 'Jump to Master Inventory'

  // Examples:
  // AQuoteDetailSourceType = stSTANDARD;
  // ...
  // S := QuoteDetailSource(AQuoteDetailSourceType);
  //
  // or ...
  // S := QuoteDetailSource[stSTANDARD]
  //
  // or just ...
  // S := cSOURCE_STANDARD
  //

function GetQuoteDetailSourceType(ASource: string): TQuoteDetailSourceType; // for case statements

/// <summary> Determine if a source is a given TQuoteDetailSourceType.
/// </summary>
function IsSourceType(ASource: string; AType: TQuoteDetailSourceType): Boolean; overload;
/// <summary> Determine if a source is a given TQuoteDetailSourceType.
/// </summary>
function IsSourceType(ASourceField: TField; AType: TQuoteDetailSourceType): Boolean; overload;

implementation

function GetQuoteDetailSourceType(ASource: string): TQuoteDetailSourceType;
var
  // i: Integer;
  o: TQuoteDetailSourceType;
begin
  Result := stMISC; // default, in case not in list

  { for i := Ord(Low(TQuoteDetailSourceType)) to Ord(High(TQuoteDetailSourceType)) do // nSourceTypeCount do
    if ASource = QuoteDetailSource[TQuoteDetailSourceType(i)] then
    begin
    Result := TQuoteDetailSourceType(i);
    BREAK;
    end;
  }
  for o := low(TQuoteDetailSourceType) to high(TQuoteDetailSourceType) do
    if CompareText(ASource, QuoteDetailSource[TQuoteDetailSourceType(o)]) = 0 then
    begin
      Result := o;
      Break;
    end;
end;

function IsSourceType(ASource: string; AType: TQuoteDetailSourceType): Boolean;
begin
  Result := GetQuoteDetailSourceType(ASource) = AType;
end;

function IsSourceType(ASourceField: TField; AType: TQuoteDetailSourceType): Boolean;
begin
  Result := IsSourceType(ASourceField.AsString, AType);
end;

end.

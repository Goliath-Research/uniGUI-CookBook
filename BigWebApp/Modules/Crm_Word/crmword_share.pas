unit crmword_share;

interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  IQMS.Common.Registry,
  crmword_types;


  function HasSelectionCriteria(ADocumentID: Real): Boolean;

  // Returns the type of dataset that the user has chosen
  function GetDataSetIndex(ADocumentID: Real): Integer;

  // Returns name of the Oracle mail merge view
  function MailMergeViewNameEx(ADocumentID: Real): String;
  function MailMergeViewName(const ADataSetIndex: Byte): String;


  // Is the field name in the forbidden fields list?
  // Pass only the name of the field, not the table name
  function IsForbidden(AFieldName: String): Boolean;
  function FieldDisplayLabel(AFieldName: String): String;

  // Get database information, based on the CRM Word Doc ID
  // Database and the table in the database used for the merge
  // If Result = FALSE then not enough information is provided to create
  // a merge document, access database and temporary table.
  function UpdateDatabaseAndTableName(ADocumentID: Real): Boolean;

  // converts text to proper date format, if possible
  function ConvertToIQDateStr(const ADateIN: String;
   var ADateOUT: String): Boolean;

  // Microsoft Applications
  function IsMSAccessInstalled(var AVersion: Integer): Boolean;
  function IsDCOMEnabled: Boolean;
  procedure EnableDCOM;

  //Does the CRM_WORD_DOC record qualify for Current Context?
  function ValidCurrentRecord(const ADocumentID: Real; const ASource: String;
    const ASourceID, AContactID: Real): Boolean;


const
     cForbiddenFields : array[0..9] of String = ('ARCUSTO_ID',
                                                  'CONTACT_ID',
                                                  'CONTACTS_ID',
                                                  'GROUP_DTL_ID',
                                                  'ID',
                                                  'PARTNER_ID',
                                                  // 'PK_HIDE',
                                                  'SOURCE',
                                                  'SOURCE_DISPLAY',
                                                  'SOURCE_ID',
                                                  'VENDOR_ID');


implementation

uses
  crm_rscstr,
  IQMS.DBTrans.dbttypes,
  IQMS.Common.FileUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg;


function HasSelectionCriteria(ADocumentID: Real): Boolean;
var i: Integer;
begin
  i := Trunc(SelectValueFmtAsFloat('select count(*) from CRM_WORD_CRITERIA ' +
   'where CRM_WORD_DOC_ID = %.0f',
                [ADocumentID]));
  Result := (i > 0);
end;

function GetDataSetIndex(ADocumentID: Real): Integer;
begin
  Result := Round(SelectValueFmtAsFloat('select dataset_index from crm_word_doc ' +
   'where id = %.0f', [ADocumentID]));
end;

function MailMergeViewNameEx(ADocumentID: Real): String;
var
   ADataSetIndex: Integer; // which mail merge dataset are we using?
begin
  // Returns the name of the mail merge view used as the basis for the
  // merge data.

  // Get the dataset index
  ADataSetIndex := GetDataSetIndex(ADocumentID);
  Result := MailMergeViewName(ADataSetIndex); // see below
end;

function MailMergeViewName(const ADataSetIndex: Byte): String;
begin
  Result := OracleViewName[TMergeKind(ADataSetIndex)];
end;

function IsForbidden(AFieldName: String): Boolean;
begin
  Result := StrInList(AFieldName, cForbiddenFields);  // IQString
end;

function FieldDisplayLabel(AFieldName: String): String;
var
   AMatchFound: Boolean;

   // --------------------------------------------------------------------------
   procedure _Eval(ACheckFieldName, ADisplayLabel: String);
   begin
     // exit early if a match has been found
     if AMatchFound then Exit;
     // do we have a match?
     AMatchFound := AFieldName = ACheckFieldName;
     // assign the value
     if AMatchFound then
        FieldDisplayLabel{Result} := ADisplayLabel;
   end;
   // --------------------------------------------------------------------------

begin
  // Note:  This is for visual purposes only.  The only time this display
  //        label ever appears, is on the crmword_edit screen.  This does
  //        not get saved to the database, nor is it used as part of the
  //        query.
  Result := AFieldName; // initialize
  // Note: We do it this way for internationalization.  At first, I just
  //       changed the field name to proper case.  But since the field
  //       name can be anything (not English), then I have to do this the
  //       long way.  Whenever a field is added to any one of the mail merge
  //       views, then this needs to be updated and so does crm_rscstr.pas.
  _Eval('ADDRESS_1'                 , crm_rscstr.cTXT0000820); // 'Address 1'
  _Eval('ADDRESS_2'                 , crm_rscstr.cTXT0000821); // 'Address 2'
  _Eval('BADGE_NUMBER'              , crm_rscstr.cTXT0000822); // 'Badge Number'
  _Eval('BIRTH_DATE'                , crm_rscstr.cTXT0000823); // 'Birth Date'
  _Eval('CITY'                      , crm_rscstr.cTXT0000824); // 'City'
  _Eval('COMPANY'                   , crm_rscstr.cTXT0000825); // 'Company'
  _Eval('COMPANY_ADDRESS_1'         , crm_rscstr.cTXT0000826); // 'Company Address 1'
  _Eval('COMPANY_ADDRESS_2'         , crm_rscstr.cTXT0000827); // 'Company Address 2'
  _Eval('COMPANY_ADDRESS_3'         , crm_rscstr.cTXT0000828); // 'Company Address 3'
  _Eval('COMPANY_CITY'              , crm_rscstr.cTXT0000829); // 'Company City'
  _Eval('COMPANY_COUNTRY'           , crm_rscstr.cTXT0000830); // 'Company Country'
  _Eval('COMPANY_FAX_NUMBER'        , crm_rscstr.cTXT0000831); // 'Company Fax Number'
  _Eval('COMPANY_POSTAL_CODE'       , crm_rscstr.cTXT0000832); // 'Company Postal Code'
  _Eval('COMPANY_STATE_OR_REGION'   , crm_rscstr.cTXT0000833); // 'Company State Or Region'
  _Eval('COMPANY_TELEPHONE_EXT'     , crm_rscstr.cTXT0000834); // 'Company Telephone Ext'
  _Eval('COMPANY_TELEPHONE_NUMBER'  , crm_rscstr.cTXT0000835); // 'Company Telephone Number'
  _Eval('COMPANY_WEB_SITE'          , crm_rscstr.cTXT0000836); // 'Company Web Site'
  _Eval('CONTACT_E_MAIL'            , crm_rscstr.cTXT0000837); // 'Contact E-Mail'
  _Eval('CONTACT_EMAIL'             , crm_rscstr.cTXT0000837); // 'Contact E-Mail'
  _Eval('CONTACT_FAX_NUMBER'        , crm_rscstr.cTXT0000839); // 'Contact Fax Number'
  _Eval('CONTACT_FIRST_NAME'        , crm_rscstr.cTXT0000840); // 'Contact First Name'
  _Eval('CONTACT_LAST_NAME'         , crm_rscstr.cTXT0000841); // 'Contact Last Name'
  _Eval('CONTACT_MOBILE_TELEPHONE'  , crm_rscstr.cTXT0000842); // 'Contact Mobile Telephone'
  _Eval('CONTACT_PAGER'             , crm_rscstr.cTXT0000843); // 'Contact Pager'
  _Eval('CONTACT_SALUTATION'        , crm_rscstr.cTXT0000844); // 'Contact Salutation'
  _Eval('CONTACT_TELEPHONE_EXT'     , crm_rscstr.cTXT0000845); // 'Contact Telephone Extension'
  _Eval('CONTACT_TELEPHONE_NUMBER'  , crm_rscstr.cTXT0000846); // 'Contact Telephone Number'
  _Eval('CONTACT_TEXT_FIELD_1'      , crm_rscstr.cTXT0000847); // 'Contact Text Field 1'
  _Eval('CONTACT_TEXT_FIELD_2'      , crm_rscstr.cTXT0000848); // 'Contact Text Field 2'
  _Eval('CONTACT_TITLE'             , crm_rscstr.cTXT0000849); // 'Contact Title'
  _Eval('CONTACT_TYPE'              , crm_rscstr.cTXT0000850); // 'Contact Type'
  _Eval('CONTACT_WEB_USER_NAME'     , crm_rscstr.cTXT0000851); // 'Contact Web User Name'
  _Eval('COUNTRY'                   , crm_rscstr.cTXT0000852); // 'Country'
  _Eval('CRM_NUMBER_FIELD_1'        , crm_rscstr.cTXT0000853); // 'CRM Number Field 1'
  _Eval('CRM_NUMBER_FIELD_10'       , crm_rscstr.cTXT0000854); // 'CRM Number Field 10'
  _Eval('CRM_NUMBER_FIELD_2'        , crm_rscstr.cTXT0000855); // 'CRM Number Field 2'
  _Eval('CRM_NUMBER_FIELD_3'        , crm_rscstr.cTXT0000856); // 'CRM Number Field 3'
  _Eval('CRM_NUMBER_FIELD_4'        , crm_rscstr.cTXT0000857); // 'CRM Number Field 4'
  _Eval('CRM_NUMBER_FIELD_5'        , crm_rscstr.cTXT0000858); // 'CRM Number Field 5'
  _Eval('CRM_NUMBER_FIELD_6'        , crm_rscstr.cTXT0000859); // 'CRM Number Field 6'
  _Eval('CRM_NUMBER_FIELD_7'        , crm_rscstr.cTXT0000860); // 'CRM Number Field 7'
  _Eval('CRM_NUMBER_FIELD_8'        , crm_rscstr.cTXT0000861); // 'CRM Number Field 8'
  _Eval('CRM_NUMBER_FIELD_9'        , crm_rscstr.cTXT0000862); // 'CRM Number Field 9'
  _Eval('CRM_PROSPECT'              , crm_rscstr.cTXT0000863); // 'CRM Prospect'
  _Eval('CRM_TEXT_FIELD_1'          , crm_rscstr.cTXT0000864); // 'CRM Text Field 1'
  _Eval('CRM_TEXT_FIELD_10'         , crm_rscstr.cTXT0000865); // 'CRM Text Field 10'
  _Eval('CRM_TEXT_FIELD_2'          , crm_rscstr.cTXT0000866); // 'CRM Text Field 2'
  _Eval('CRM_TEXT_FIELD_3'          , crm_rscstr.cTXT0000867); // 'CRM Text Field 3'
  _Eval('CRM_TEXT_FIELD_4'          , crm_rscstr.cTXT0000868); // 'CRM Text Field 4'
  _Eval('CRM_TEXT_FIELD_5'          , crm_rscstr.cTXT0000869); // 'CRM Text Field 5'
  _Eval('CRM_TEXT_FIELD_6'          , crm_rscstr.cTXT0000870); // 'CRM Text Field 6'
  _Eval('CRM_TEXT_FIELD_7'          , crm_rscstr.cTXT0000871); // 'CRM Text Field 7'
  _Eval('CRM_TEXT_FIELD_8'          , crm_rscstr.cTXT0000872); // 'CRM Text Field 8'
  _Eval('CRM_TEXT_FIELD_9'          , crm_rscstr.cTXT0000873); // 'CRM Text Field 9'
  _Eval('CURRENT_STATUS'            , crm_rscstr.cTXT0001205); // 'Current Status'
  _Eval('CUSTOMER_ADDRESS_1'        , crm_rscstr.cTXT0000874); // 'Customer Address 1'
  _Eval('CUSTOMER_ADDRESS_2'        , crm_rscstr.cTXT0000875); // 'Customer Address 2'
  _Eval('CUSTOMER_ADDRESS_3'        , crm_rscstr.cTXT0000876); // 'Customer Address 3'
  _Eval('CUSTOMER_CITY'             , crm_rscstr.cTXT0000877); // 'Customer City'
  _Eval('CUSTOMER_COMMISSION'       , crm_rscstr.cTXT0000878); // 'Customer Commission'
  _Eval('CUSTOMER_COMPANY'          , crm_rscstr.cTXT0000879); // 'Customer Company'
  _Eval('CUSTOMER_COUNTRY'          , crm_rscstr.cTXT0000880); // 'Customer Country'
  _Eval('CUSTOMER_CREDIT_LIMIT'     , crm_rscstr.cTXT0000881); // 'Customer Credit Limit'
  _Eval('CUSTOMER_DISCOUNT'         , crm_rscstr.cTXT0000882); // 'Customer Discount'
  _Eval('CUSTOMER_FAX_NUMBER'       , crm_rscstr.cTXT0000883); // 'Customer Fax Number'
  _Eval('CUSTOMER_FINANCE_CHARGE'   , crm_rscstr.cTXT0000884); // 'Customer Finance Charge'
  _Eval('CUSTOMER_GROUP'            , crm_rscstr.cTXT0000885); // 'Customer Group'
  _Eval('CUSTOMER_HIGHEST_BALANCE'  , crm_rscstr.cTXT0000886); // 'Customer Highest Balance'
  _Eval('CUSTOMER_INDUSTRY'         , crm_rscstr.cTXT0000887); // 'Customer Industry'
  _Eval('CUSTOMER_IS_INACTIVE'      , crm_rscstr.cTXT0000888); // 'Customer Is Inactive'
  _Eval('CUSTOMER_NOTE'             , crm_rscstr.cTXT0000889); // 'Customer Note'
  _Eval('CUSTOMER_NUMBER'           , crm_rscstr.cTXT0000890); // 'Customer Number'
  _Eval('CUSTOMER_NUMBER_FIELD_1'   , crm_rscstr.cTXT0000891); // 'Customer Number Field 1'
  _Eval('CUSTOMER_NUMBER_FIELD_2'   , crm_rscstr.cTXT0000892); // 'Customer Number Field 2'
  _Eval('CUSTOMER_NUMBER_FIELD_3'   , crm_rscstr.cTXT0000893); // 'Customer Number Field 3'
  _Eval('CUSTOMER_NUMBER_FIELD_4'   , crm_rscstr.cTXT0000894); // 'Customer Number Field 4'
  _Eval('CUSTOMER_NUMBER_FIELD_5'   , crm_rscstr.cTXT0000895); // 'Customer Number Field 5'
  _Eval('CUSTOMER_POSTAL_CODE'      , crm_rscstr.cTXT0000896); // 'Customer Postal Code'
  _Eval('CUSTOMER_PRIME_CONTACT'    , crm_rscstr.cTXT0000897); // 'Customer Prime Contact'
  _Eval('CUSTOMER_SAFETY_LEAD_TIME' , crm_rscstr.cTXT0000898); // 'Customer Safety Lead Time'
  _Eval('CUSTOMER_SHIPMENT_FORECAST', crm_rscstr.cTXT0000899); // 'Customer Shipment Forecast'
  _Eval('CUSTOMER_SINCE_DATE'       , crm_rscstr.cTXT0000900); // 'Customer Since Date'
  _Eval('CUSTOMER_STATE_OR_REGION'  , crm_rscstr.cTXT0000901); // 'Customer State Or Region'
  _Eval('CUSTOMER_STATUS'           , crm_rscstr.cTXT0000902); // 'Customer Status'
  _Eval('CUSTOMER_STATUS_DATE'      , crm_rscstr.cTXT0000903); // 'Customer Status Date'
  _Eval('CUSTOMER_TELEPHONE_EXT'    , crm_rscstr.cTXT0000904); // 'Customer Telephone Extension'
  _Eval('CUSTOMER_TELEPHONE_NUMBER' , crm_rscstr.cTXT0000905); // 'Customer Telephone Number'
  _Eval('CUSTOMER_TERRITORY'        , crm_rscstr.cTXT0000906); // 'Customer Territory'
  _Eval('CUSTOMER_TEXT_FIELD_1'     , crm_rscstr.cTXT0000907); // 'Customer Text Field 1'
  _Eval('CUSTOMER_TEXT_FIELD_2'     , crm_rscstr.cTXT0000908); // 'Customer Text Field 2'
  _Eval('CUSTOMER_TEXT_FIELD_3'     , crm_rscstr.cTXT0000909); // 'Customer Text Field 3'
  _Eval('CUSTOMER_TEXT_FIELD_4'     , crm_rscstr.cTXT0000910); // 'Customer Text Field 4'
  _Eval('CUSTOMER_TEXT_FIELD_5'     , crm_rscstr.cTXT0000911); // 'Customer Text Field 5'
  _Eval('CUSTOMER_TEXT_FIELD_6'     , crm_rscstr.cTXT0000912); // 'Customer Text Field 6'
  _Eval('CUSTOMER_WEB_SITE'         , crm_rscstr.cTXT0000913); // 'Customer Web Site'
  _Eval('CUSTOMER_YTD_SALES'        , crm_rscstr.cTXT0000914); // 'Customer Ytd Sales'
  _Eval('DATE_HIRED'                , crm_rscstr.cTXT0000915); // 'Date Hired'
  _Eval('DEPARTMENT'                , crm_rscstr.cTXT0000916); // 'Department'
  _Eval('EIC'                       , crm_rscstr.cTXT0000917); // 'EIC'
  _Eval('EIC_MARRIED_STATUS'        , crm_rscstr.cTXT0000918); // 'EIC Married Status'
  _Eval('EMAIL_HIDE'                , crm_rscstr.cTXT0001719); // 'Exclude from E-Mailings'
  _Eval('EMPLOYEE_LEVEL_CODE'       , crm_rscstr.cTXT0000919); // 'Employee Level Code'
  _Eval('EMPLOYEE_LEVEL_DESCRIPTION', crm_rscstr.cTXT0000920); // 'Employee Level Description'
  _Eval('EMPLOYEE_NUMBER'           , crm_rscstr.cTXT0000921); // 'Employee Number'
  _Eval('FIRST_NAME'                , crm_rscstr.cTXT0000922); // 'First Name'
  _Eval('FREIGHT_DESCRIPTION'       , crm_rscstr.cTXT0000923); // 'Freight Description'
  _Eval('GROUP_DESCRIP'             , crm_rscstr.cTXT0000924); // 'Group Description'
  _Eval('GROUP_NAME'                , crm_rscstr.cTXT0000925); // 'Group Name'
  _Eval('IS_CITIZEN'                , crm_rscstr.cTXT0000926); // 'Is Citizen?'
  _Eval('IS_DEFAULT_CONTACT'        , crm_rscstr.cTXT0000927); // 'Is Default Contact?'
  _Eval('IS_INACTIVE'               , crm_rscstr.cTXT0000928); // 'Is Inactive?'
  _Eval('JOB_DESCRIPTION'           , crm_rscstr.cTXT0000929); // 'Job Description'
  _Eval('JOB_TITLE'                 , crm_rscstr.cTXT0000930); // 'Job Title'
  _Eval('LAST_FINANCE_CHARGE_DATE'  , crm_rscstr.cTXT0000931); // 'Last Finance Charge Date'
  _Eval('LAST_NAME'                 , crm_rscstr.cTXT0000932); // 'Last Name'
  _Eval('LAST_REVIEW_DATE'          , crm_rscstr.cTXT0000933); // 'Last Review Date'
  _Eval('MARITAL_STATUS'            , crm_rscstr.cTXT0000934); // 'Marital Status'
  _Eval('MIDDLE_NAME'               , crm_rscstr.cTXT0000935); // 'Middle Name'
  _Eval('MIN_CHANGE_INTERVAL'       , crm_rscstr.cTXT0000936); // 'Minimum Change Interval'
  _Eval('NEXT_REVIEW_DATE'          , crm_rscstr.cTXT0000937); // 'Next Review Date'
  _Eval('PARTNER_ADDRESS_1'         , crm_rscstr.cTXT0000938); // 'Partner Address 1'
  _Eval('PARTNER_ADDRESS_2'         , crm_rscstr.cTXT0000939); // 'Partner Address 2'
  _Eval('PARTNER_ADDRESS_3'         , crm_rscstr.cTXT0000940); // 'Partner Address 3'
  _Eval('PARTNER_CITY'              , crm_rscstr.cTXT0000941); // 'Partner City'
  _Eval('PARTNER_COMPANY'           , crm_rscstr.cTXT0000942); // 'Partner Company'
  _Eval('PARTNER_COUNTRY'           , crm_rscstr.cTXT0000943); // 'Partner Country'
  _Eval('PARTNER_CREATED'           , crm_rscstr.cTXT0000944); // 'Partner Created'
  _Eval('PARTNER_FAX_NUMBER'        , crm_rscstr.cTXT0000945); // 'Partner Fax Number'
  _Eval('PARTNER_GROUP'             , crm_rscstr.cTXT0000946); // 'Partner Group'
  _Eval('PARTNER_INDUSTRY'          , crm_rscstr.cTXT0000947); // 'Partner Industry'
  _Eval('PARTNER_IS_INACTIVE'       , crm_rscstr.cTXT0000948); // 'Partner Is Inactive?'
  _Eval('PARTNER_NOTE'              , crm_rscstr.cTXT0000949); // 'Partner Note'
  _Eval('PARTNER_NUMBER'            , crm_rscstr.cTXT0000950); // 'Partner Number'
  _Eval('PARTNER_NUMBER_FIELD_1'    , crm_rscstr.cTXT0000951); // 'Partner Number Field 1'
  _Eval('PARTNER_NUMBER_FIELD_2'    , crm_rscstr.cTXT0000952); // 'Partner Number Field 2'
  _Eval('PARTNER_NUMBER_FIELD_3'    , crm_rscstr.cTXT0000953); // 'Partner Number Field 3'
  _Eval('PARTNER_NUMBER_FIELD_4'    , crm_rscstr.cTXT0000954); // 'Partner Number Field 4'
  _Eval('PARTNER_NUMBER_FIELD_5'    , crm_rscstr.cTXT0000955); // 'Partner Number Field 5'
  _Eval('PARTNER_POSTAL_CODE'       , crm_rscstr.cTXT0000956); // 'Partner Postal Code'
  _Eval('PARTNER_PRIME_CONTACT'     , crm_rscstr.cTXT0000957); // 'Partner Prime Contact'
  _Eval('PARTNER_STATE_OR_REGION'   , crm_rscstr.cTXT0000958); // 'Partner State Or Region'
  _Eval('PARTNER_STATUS'            , crm_rscstr.cTXT0000959); // 'Partner Status'
  _Eval('PARTNER_STATUS_DATE'       , crm_rscstr.cTXT0000960); // 'Partner Status Date'
  _Eval('PARTNER_TELEPHONE_EXT'     , crm_rscstr.cTXT0000961); // 'Partner Telephone Ext'
  _Eval('PARTNER_TELEPHONE_NUMBER'  , crm_rscstr.cTXT0000962); // 'Partner Telephone Number'
  _Eval('PARTNER_TERRITORY'         , crm_rscstr.cTXT0000963); // 'Partner Territory'
  _Eval('PARTNER_TEXT_FIELD_1'      , crm_rscstr.cTXT0000964); // 'Partner Text Field 1'
  _Eval('PARTNER_TEXT_FIELD_2'      , crm_rscstr.cTXT0000965); // 'Partner Text Field 2'
  _Eval('PARTNER_TEXT_FIELD_3'      , crm_rscstr.cTXT0000966); // 'Partner Text Field 3'
  _Eval('PARTNER_TEXT_FIELD_4'      , crm_rscstr.cTXT0000967); // 'Partner Text Field 4'
  _Eval('PARTNER_TEXT_FIELD_5'      , crm_rscstr.cTXT0000968); // 'Partner Text Field 5'
  _Eval('PARTNER_TEXT_FIELD_6'      , crm_rscstr.cTXT0000969); // 'Partner Text Field 6'
  _Eval('PARTNER_WEB_SITE'          , crm_rscstr.cTXT0000970); // 'Partner Web Site'
  _Eval('PK_HIDE'                   , crm_rscstr.cTXT0000928); // 'Is Inactive?'
  _Eval('POSTAL_CODE'               , crm_rscstr.cTXT0000971); // 'Postal Code'
  _Eval('RACE'                      , crm_rscstr.cTXT0000972); // 'Race'
  _Eval('REFERRAL_SOURCE'           , crm_rscstr.cTXT0001207); // 'Referral Source'
  _Eval('RELOCATION'                , crm_rscstr.cTXT0001208); // 'Relocation'
  _Eval('RESET_BENEFITS_DATE'       , crm_rscstr.cTXT0000973); // 'Reset Benefits Date'
  _Eval('RESIDENT_VISA_EXPIRES'     , crm_rscstr.cTXT0001206); // 'Resident Visa Expires'
  _Eval('SEX'                       , crm_rscstr.cTXT0000974); // 'Sex/Gender'
  _Eval('SOURCE'                    , crm_rscstr.cTXT0000975); // 'Source'
  _Eval('STATE_OR_REGION'           , crm_rscstr.cTXT0000976); // 'State or Region'
  _Eval('STATUS_CODE'               , crm_rscstr.cTXT0000977); // 'Status Code'
  _Eval('SS_NUMBER'                 , crm_rscstr.cTXT0001204); // 'Social Security Number'
  _Eval('TAX_CODE'                  , crm_rscstr.cTXT0000978); // 'Tax Code'
  _Eval('TAX_CODE_DESCRIPTION'      , crm_rscstr.cTXT0000979); // 'Tax Code Description'
  _Eval('TAX_RATE'                  , crm_rscstr.cTXT0000980); // 'Tax Rate'
  _Eval('TELEPHONE_NUMBER'          , crm_rscstr.cTXT0000981); // 'Telephone Number'
  _Eval('TERMINATION_DATE'          , crm_rscstr.cTXT0000982); // 'Termination Date'
  _Eval('USE_USA_MASK'              , crm_rscstr.cTXT0000983); // 'Use USA Mask (Telephone/Fax)'
  _Eval('VENDOR_ADDRESS_1'          , crm_rscstr.cTXT0000984); // 'Vendor Address 1'
  _Eval('VENDOR_ADDRESS_2'          , crm_rscstr.cTXT0000985); // 'Vendor Address 2'
  _Eval('VENDOR_ADDRESS_3'          , crm_rscstr.cTXT0000986); // 'Vendor Address 3'
  _Eval('VENDOR_ATTENTION'          , crm_rscstr.cTXT0000987); // 'Vendor Attention'
  _Eval('VENDOR_BANK_ACCOUNT_NUMBER', crm_rscstr.cTXT0000988); // 'Vendor Bank Account Number'
  _Eval('VENDOR_CITY'               , crm_rscstr.cTXT0000989); // 'Vendor City'
  _Eval('VENDOR_COMPANY'            , crm_rscstr.cTXT0000990); // 'Vendor Company'
  _Eval('VENDOR_COUNTRY'            , crm_rscstr.cTXT0000991); // 'Vendor Country'
  _Eval('VENDOR_CREDIT_LIMIT'       , crm_rscstr.cTXT0000992); // 'Vendor Credit Limit'
  _Eval('VENDOR_E_MAIL'             , crm_rscstr.cTXT0000993); // 'Vendor E-Mail'
  _Eval('VENDOR_EMARKET_PLACE'      , crm_rscstr.cTXT0000994); // 'Vendor EMarket Place'
  _Eval('VENDOR_FAX_NUMBER'         , crm_rscstr.cTXT0000995); // 'Vendor Fax Number'
  _Eval('VENDOR_FAX_NUMBER_2'       , crm_rscstr.cTXT0000996); // 'Vendor Fax Number 2'
  _Eval('VENDOR_FEDERAL_TAX_ID'     , crm_rscstr.cTXT0000997); // 'Vendor Federal Tax ID'
  _Eval('VENDOR_FOB'                , crm_rscstr.cTXT0000998); // 'Vendor FOB'
  _Eval('VENDOR_INCLUDE_IN_1099'    , crm_rscstr.cTXT0000999); // 'Vendor Include in 1099'
  _Eval('VENDOR_IS_INACTIVE'        , crm_rscstr.cTXT0001000); // 'Vendor Is Inactive'
  _Eval('VENDOR_NUMBER'             , crm_rscstr.cTXT0001001); // 'Vendor Number'
  _Eval('VENDOR_NUMBER_FIELD_1'     , crm_rscstr.cTXT0001002); // 'Vendor Number Field 1'
  _Eval('VENDOR_NUMBER_FIELD_2'     , crm_rscstr.cTXT0001003); // 'Vendor Number Field 2'
  _Eval('VENDOR_POSTAL_CODE'        , crm_rscstr.cTXT0001004); // 'Vendor Postal Code'
  _Eval('VENDOR_PRIME_CONTACT'      , crm_rscstr.cTXT0001005); // 'Vendor Prime Contact'
  _Eval('VENDOR_QA_RATING'          , crm_rscstr.cTXT0001006); // 'Vendor QA Rating'
  _Eval('VENDOR_RATING'             , crm_rscstr.cTXT0001007); // 'Vendor Rating'
  _Eval('VENDOR_STATE_OR_REGION'    , crm_rscstr.cTXT0001008); // 'Vendor State or Region'
  _Eval('VENDOR_STATEMENT_DATE'     , crm_rscstr.cTXT0001009); // 'Vendor Statement Date'
  _Eval('VENDOR_STATUS'             , crm_rscstr.cTXT0001010); // 'Vendor Status'
  _Eval('VENDOR_SUBJECT_TO_RATING'  , crm_rscstr.cTXT0001011); // 'Vendor Subject To Rating'
  _Eval('VENDOR_TAX_RATE'           , crm_rscstr.cTXT0001012); // 'Vendor Tax Rate'
  _Eval('VENDOR_TAXABLE'            , crm_rscstr.cTXT0001013); // 'Vendor Taxable'
  _Eval('VENDOR_TELEPHONE_NUMBER'   , crm_rscstr.cTXT0001014); // 'Vendor Telephone Number'
  _Eval('VENDOR_TEXT_FIELD_1'       , crm_rscstr.cTXT0001015); // 'Vendor Text Field 1'
  _Eval('VENDOR_TEXT_FIELD_2'       , crm_rscstr.cTXT0001016); // 'Vendor Text Field 2'
  _Eval('VENDOR_TEXT_FIELD_3'       , crm_rscstr.cTXT0001017); // 'Vendor Text Field 3'
  _Eval('VENDOR_WEB_SITE'           , crm_rscstr.cTXT0001018); // 'Vendor Web Site'
  _Eval('VENDOR_YTD_PURCHASES'      , crm_rscstr.cTXT0001019); // 'Vendor YTD Purchases'
  _Eval('WAGE_BASIS'                , crm_rscstr.cTXT0001020); // 'Wage Basis'
  _Eval('WEB_USER_NAME'             , crm_rscstr.cTXT0001021); // 'Web User Name'

  // If not match was found, convert field name to proper case and pass it
  // as the display label.
  if not AMatchFound then
     begin
       Result := StrTran(ProperCase(AFieldName), '_', ' ');
       Result := ProperCase(Result); //iqstring
     end;

end;

function UpdateDatabaseAndTableName(ADocumentID: Real): Boolean;
var
   APath: String;
   ACRMMergeDocumentRecord: TCRMMergeDocumentRecord;
begin
  // Get data
  if not GetCRMMergeDocumentRecord(ADocumentID, ACRMMergeDocumentRecord) then
     Exit;

  // Evaluate
  Result := (ACRMMergeDocumentRecord.DataFileName > '') and
            (ACRMMergeDocumentRecord.DataTableName > '');

  // If table values do not exist, then provide the default values
  if (ACRMMergeDocumentRecord.DataFileName = '') then
     begin
       // No document - no database
       Result := Trim(ACRMMergeDocumentRecord.FileName) > '' ;
       if not Result then Exit;

       APath := IQMS.Common.FileUtils.GetDirectoryName(
        ExtractFilePath(ACRMMergeDocumentRecord.FileName));

       ACRMMergeDocumentRecord.DataFileName := Trim(APath +
        IQMS.Common.FileUtils.FileNameNoExt(ACRMMergeDocumentRecord.FileName));

       // No database name, then exit
       Result := Trim(ACRMMergeDocumentRecord.DataFileName) > '';
       if not Result then Exit;

       ACRMMergeDocumentRecord.DataFileName :=
        ACRMMergeDocumentRecord.DataFileName +
        ACRMMergeDocumentRecord.DataFileExt;

       ExecuteCommandFmt('update crm_word_doc set datafilename = ''%s'' ' +
        'where id = %.0f',
        [ACRMMergeDocumentRecord.DataFileName, ADocumentID]);
     end;

  if (ACRMMergeDocumentRecord.DataTableName = '') and
     (ACRMMergeDocumentRecord.CustomTableType = dttMSAccess) then
     begin
       ACRMMergeDocumentRecord.DataTableName := Format('tbl%s',
        [ACRMMergeDocumentRecord.MergeTableName]);
       ExecuteCommandFmt('update crm_word_doc set datatablename = ''%s'' ' +
        'where id = %.0f',
        [ACRMMergeDocumentRecord.DataTableName, ADocumentID]);
     end;
end;

function IsMSAccessInstalled(var AVersion: Integer): Boolean;
var
   S: String;
begin
  Result:= FALSE;
  with TIQWebRegistry.Create do
  try
    RootKey:= HKEY_CLASSES_ROOT;
    if OpenKey('Access.Application\CurVer', FALSE) then
       begin
            Result := TRUE;
            S:= ReadString('');
            S:=GetToken(S, '.', 3);
            if S > '' then
            try
               AVersion := StrToInt(S);
            except
            end;
       end;
  finally
    Free;
  end;
end;

function IsDCOMEnabled: Boolean;
begin
 Result := IQMS.Common.Registry.LoadStrFromLocalMachineRegistry(
  '\SOFTWARE\Microsoft\Ole', 'EnableDCOM') = 'Y';
end;

procedure EnableDCOM;
begin
  IQMS.Common.Registry.SaveStrToLocalMachineRegistry(
  '\SOFTWARE\Microsoft\Ole', 'EnableDCOM', 'Y');
end;

function ValidCurrentRecord(const ADocumentID: Real; const ASource: String;
   const ASourceID, AContactID: Real): Boolean;
var
   ADataSetIndex: Integer;
begin
  ADataSetIndex:= Trunc(SelectValueFmtAsFloat('select DATASET_INDEX from crm_word_doc ' +
   'where id = %.0f', [ADocumentID]));

  // The initial value for FCurrentRecord...
  if (ASource = 'ARCUSTO') then
     begin
       if AContactID = 0 then
          Result := (SelectValueFmtAsFloat('select id from arcusto where id = %.0f',
           [ASourceID]) > 0) and (ADataSetIndex = 1)
       else
          Result := (SelectValueFmtAsFloat('select id from contact where id = %.0f and ' +
           'arcusto_id = %.0f', [AContactID, ASourceID]) > 0) and
            (ADataSetIndex in [1,2]);
     end
  else if (ASource = 'VENDOR') then
     begin
       if AContactID = 0 then
          Result := (SelectValueFmtAsFloat('select id from vendor where id = %.0f',
           [ASourceID]) > 0) and (ADataSetIndex = 3)
       else
          Result := (SelectValueFmtAsFloat('select id from vendor_contact ' +
           'where id = %.0f and vendor_id = %.0f', [AContactID, ASourceID]) > 0)
           and (ADataSetIndex in [3,4]);
     end
  else if (ASource = 'PARTNER') then
     begin
       if AContactID = 0 then
          Result := (SelectValueFmtAsFloat('select id from partner where id = %.0f',
            [ASourceID]) > 0) and (ADataSetIndex = 5)
       else
          Result := (SelectValueFmtAsFloat('select id from partner_contacts ' +
           'where id = %.0f and partner_id = %.0f',
            [AContactID, ASourceID]) > 0) and (ADataSetIndex in [5,6]);
     end
  else if (ASource = 'PR_EMP') then
     Result := (SelectValueFmtAsFloat('select id from pr_emp where id = %.0f',
      [ASourceID]) > 0) and (ADataSetIndex = 7)
  else if (ASource = 'HR_APP') then
     Result := (SelectValueFmtAsFloat('select id from hr_app where id = %.0f',
      [ASourceID]) > 0) and (ADataSetIndex = 7)
  else
     Result := FALSE;

end;

function ConvertToIQDateStr(const ADateIN: String;
 var ADateOUT: String): Boolean;
const
  cNumbers  = ['0'..'9'];
  cDateChar = cNumbers + ['/'];
var
  S: String;
  d: TDateTime;
begin
  ADateOUT := '';
  if ADateIN = '' then Exit;

  S := IQMS.Common.StringUtils.StrTran(ADateIN, '-', '/');
  d := IQMS.Common.NLS.IQStrToDate(s);
  ADateOUT := FormatDatetime('mm/dd/yyyy', d);
  Result := TRUE;
end;

end.

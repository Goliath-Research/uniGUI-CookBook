unit IQMS.Common.Applications;

interface

{to find 'Quote' as it saved in the IQorder2 just say IQAppsNames[ apQuote ] }
type
  TIQAppsType = ( apQuote,
                  apBom, 
                  apOrder_Entry,
                  apShipping,
                  apInventory,
                  apSchedule,
                  apWork_Order,
                  apProd_Report,
                  apWork_Center,
                  apVendor,
                  apCustomer,
                  apOperation,
                  apPM,
                  apGL,
                  apAP,
                  apAR,
                  apPO,
                  apPR,
                  apCR,
                  apCD,
                  apRMA,
                  apLM,
                  apBudget,
                  apRT_Monitor,
                  apIQLog,
                  apDartWin,
                  apJobCost,
                  apEDI,
                  apForecast,
                  apPayroll,
                  apCANPayroll,
                  apTooling,
                  apGLConsolidation,
                  apIQRepMng,
                  apTA,
                  apFRX,
                  apWEB,
                  apHR,
                  apBOMRoute,
                  apIQVoice,
                  apOmnexus,
                  apJobShop,
                  apEIS,
                  apConfigurator,
                  apQuality,
                  apIQDoc,
                  apIQCar,
                  apIQEco,
                  apIQAPQP,
                  apIQPPAP,
                  apSPC,
                  apCRM,
                  apWMS,      {apWMS - for web wms  }
                  apFAB,
                  apFA,
                  apPLM,
                  apIQMrb,
                  apCapa,
                  apProc_PQ,
                  apProd_PQ,
                  apCCP,
                  apRTLabel,
                  apScanID,
                  apScanLine,
                  apPalletWrap,
                  apInterCompTrans,
                  apLabel_ID,  {Label Printing Assistant}
                  apDHR,
                  apOutsource,
                  apEServer,
                  apCoQ,      {Cost of Quality}
                  apShipMan,
                  apTestServer,
                  apIQFax,
                  apLanguageGerman,
                  apLanguageSpanish,
                  apLanguageChineseSimplified,
                  apLanguageChineseTraditional,
                  apLanguageSwedish,
                  apLanguageDutch,
                  apRTPDA,              // Limited PDA Realtime app
                  apSignatureCapture,
                  apExpense,
                  apPCMon,
                  apQualityAudit,
                  apVINGen,
                  apJobShop2,
                  apToteJogger,
                  apEmpPortal,
                  apCartonBuilder,
                  apIQGate,
                  apLanguageFrench,
                  apLanguageItalian,
                  apSpreadsheetServer,
                  apSmartPageSlideShow,
                  apCMMImportTool,
                  apApplicationManager,
                  apSolidWorks,
                  apProdRepByWO,
                  // apSpcImport, USE CMMImportTool above
                  apWebAPISDK,
                  apWebDirectB2C,
                  apSpotRate,
                  apTaxUpdate,
                  apWMS2,      // Advanced WMS
                  apLanguageJapanese,
                  apIQHotkey,
                  apLanguagePortuguese,
                  apShipManFreight,
                  apMarketingAutomation,
                  apTaxReportingTool,
                  apCarouselScheduler,
                  apPkgAsst,
                  apExtLblImport,
                  apAssyTrackByGroup,
                  apImportToyotaLabels,
                  apSupermarket,
                  apCircuitBoardProcess,
                  apHubSpotConnector,
                  apSalesForceConnector,
                  apVMR, //Vendor Managed Replenishment
                  apEServerPollDir,
                  apEServerEDIAutoOutbound,
                  apEServerVendorEDI,
                  apEServerVendorEDIReport,
                  apILVS,
                  apAvalaraTax,
				  apRTMultiLbl,
                  apCSV_Only,
                  apXML_Only
                  );

const
//List of modules with their originally licensed name
  IQAppsNames : array[ TIQAppsType ] of string = ( 'Quote',
                                                   'Bom',
                                                   'Order Entry',
                                                   'Shipping',
                                                   'Inventory',
                                                   'Schedule',
                                                   'Work Order',
                                                   'Prod Report',
                                                   'Work Center',
                                                   'Vendor',
                                                   'Customer',
                                                   'Operation',
                                                   'Preventative Maintenance', (*Renamed to Maintenance, Repair and Overhaul*)
                                                   'GL',
                                                   'AP',
                                                   'AR',
                                                   'PO',
                                                   'PR',
                                                   'CR',
                                                   'CD',
                                                   'RMA',
                                                   'LM',
                                                   'Budget',
                                                   'RT Monitor',
                                                   'IQ Log',
                                                   'Dart Win',
                                                   'Job Costing',
                                                   'EDI',
                                                   'Forecast',
                                                   'Payroll',
                                                   'CANPayroll',
                                                   'Tooling',
                                                   'GL Consolidation',
                                                   'IQRepMng',
                                                   'TA',
                                                   'FRX',
                                                   'WEB',
                                                   'HR',
                                                   'BOM Routing',
                                                   'IQVoice',
                                                   'Omnexus',
                                                   'JobShop',
                                                   'EIS',
                                                   'Configurator',
                                                   'Quality',
                                                   'IQDoc',
                                                   'IQCar',
                                                   'IQEco',
                                                   'IQAPQP',
                                                   'IQPPAP',
                                                   'SPC',
                                                   'CRM',
                                                   'WMS',
                                                   'FAB',
                                                   'FA',
                                                   'PLM',
                                                   'IQMRB',
                                                   'CAPA',
                                                   'Proc_PQ',
                                                   'Prod_PQ',
                                                   'CCP',
                                                   'RTLabel',
                                                   'ScanID',
                                                   'ScanLine',
                                                   'PalletWrap',
                                                   'InterCompTrans',
                                                   'Label_ID',
                                                   'DHR',
                                                   'Outsource',
                                                   'EServer',
                                                   'CoQ',
                                                   'ShipMan',
                                                   'Test Server',
                                                   'IQFax',
                                                   'Language German',
                                                   'Language Spanish',
                                                   'Language Chinese Simplified',
                                                   'Language Chinese Traditional',
                                                   'Language Swedish',
                                                   'Language Dutch',
                                                   'RTPDA',
                                                   'SignatureCapture',
                                                   'Expense',
                                                   'PCMon',
                                                   'Quality Audit',
                                                   'VINGen',
                                                   'JobShop2',
                                                   'ToteJogger',
                                                   'EmpPortal',
                                                   'CartonBuilder',
                                                   'IQ Gate',
                                                   'Language French',
                                                   'Language Italian',
                                                   'Spreadsheet Server',
                                                   'SmartPage Slide Show',
                                                   'CMM Import Tool',
                                                   'Application Manager',
                                                   'SolidWorks',
                                                   'ProdRepByWO',
                                                   // 'SpcImport',  USE CMMImportTool above
                                                   'WebAPISDK',
                                                   'WebDirectB2C',
                                                   'Spot Rate',
                                                   'Tax Update',
                                                   'WMS2',  {Advanced WMS}
                                                   'Language Japanese',
                                                   'IQ Hotkey',
                                                   'Language Portuguese',
                                                   'ShipManFreight',
                                                   'Marketing Automation',
                                                   'Tax Reporting Tool',
                                                   'Carousel Scheduler',
                                                   'Packaging Assistant',
                                                   'External Label Importer',
                                                   'AssyTrack By Group',
                                                   'Import Toyota Labels',
                                                   'Supermarket',
                                                   'Circuit Board Processing',
                                                   'HubSpotConnector',
                                                   'SalesforceConnector',
                                                   'VendorManagedReplenishment',
                                                   'EServerPollDir',
                                                   'EServerAutoOutbound',
                                                   'EServerVendorEDI',
                                                   'EServerVendorEDIReport',
                                                   'ILVS',
                                                   'Avalara Tax',
												   'RTMultiLabel',
                                                   'EDI CSV Only',
                                                   'EDI XML Only'
                                                   );

 (*
  To change the name of a module: AMB 03-02-15 YouTrack: EIQ-6175

    1) Add the original name to IQOldAppsNames, and increment high bound of the array
    2) Add the new name to IQNewAppsNames, and increment high bound of the array
    3) Ensure that the modules' new name is in the same index as its new name

       Example:
       Old Name:
        'Preventative Maintenance' index of 0 in IQOldAppsNames
       New Name:
        'Maintenance, Repair and Overhaul' index of 0 in IQNewAppsNames

    Note: This doesn't change how the app name is stored in IQORDER2.MODULES, it simply
          displays the new name in the licensing applications (IQMLC, DD, IQLicens),
          and ensures we save the original name so that licenses generated from them will
          be reverse compatible and easy for the sales/admin team to find.
 *)


 //List of old module names that have been replaced - to add, increment high bound and add corresponding new name to IQNewAppsNames. The indexes must match.
 IQOldAppsNames : array[0..0] of string = ('Preventative Maintenance');

 //List of replacement names - to add, increment high bound
 IQNewAppsNames : array[0..0] of string = ('Maintenance, Repair and Overhaul (MRO)');


function GetNewAppName( ALicensedAppName : string ) : string; //returns the current name of the module
function GetLicensedAppName( ANewAppName : string ) : string; //returns original name of module when it was first licensed for backwards compatibility

implementation

uses IQMS.Common.StringUtils, IQMS.Common.Numbers;

(*Pass in the original/licensed app name, get the new name*)
function GetNewAppName( ALicensedAppName : string ) : string;
var
  AIndex : integer;
begin
  Result:= '';
  AIndex:= IQMS.Common.StringUtils.CaseOfStr( ALicensedAppName, IQOldAppsNames );
  Result:= SIIF( AIndex <> -1, IQNewAppsNames[ AIndex ], ALicensedAppName );
end;

(*Pass in the new app name, get the licensed app name*)
function GetLicensedAppName( ANewAppName : string ) : string;
var
  AIndex : integer;
begin
  Result:= '';
  AIndex:= IQMS.Common.StringUtils.CaseOfStr( ANewAppName, IQNewAppsNames );
  Result:= SIIF( AIndex <> -1, IQOldAppsNames[ AIndex ], ANewAppName );
end;


end.


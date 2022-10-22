unit ups_httplink_typelib;

interface

uses
  System.Variants;


type
  TUPSWeightUOM = (uwLBS, uwKG);

  TUPSDimensionUOM = (udIN, udCM);

  TUPSPrinterType = (uptEltron, uptZebra, uptUniMark);
  TUPSPrintDestination = (updPrinter, updTextFile);

  TPickupAttemptsByte = 0..3;

  Code2String = String[2];
  Code28String = String[28];

  (* International Document Indicators *
    - Domestic labels do not use document indicators.
      Only international labels have document indicators.
    - For international shipments, a paperless invoice is always
      required for merchandise (not documents only).

    "When shipping internationally, documentation indicators are required for
     proper shipment processing. These indicators will print right-justified
     in the Additional Routing Instructions Block immediately below the
     highlight bar of the Tracking Number Bar Code Block." (UPS Guide to
     Labeling, page 33).

     For Paperless Invoice (from "2008_Paperless_Invoice_Supplement.pdf"):

       1.) EDI must used when the invoice is the only customs document.
       2.) EDI-PULL must be used when there are additional customs documents
           included with the shipment.
     *)
  TUPSDocumentIndicator = (uriNone,                        // ''
                           uriDocumentsOnly,               // 'EDI-DOC'
                           uriDocumentsOnlyRS,             // 'DOC-RS'
                           uriInvoice,                     // 'INV'
                           uriInvoiceRS,                   // 'INV-RS'
                           uriPaperlessInvoice,            // 'EDI'
                           uriPaperlessInvoiceRS,          // 'EDI'
                           uriPaperlessInvoicePlus,        // 'EDI-PULL'
                           uriPaperlessInvoicePlusRS,      // 'EDI-PULL'
                           uriNoInvoice,                   // 'KEY'
                           uriNoInvoiceRS,                  // 'KEY-RS'
                           uriWorldEase);                  // 'INV-CC'


  TUPSDocumentOption = (udoPOA, udoSED, udoCO);
  TUPSDocumentOptions = set of TUPSDocumentOption;

{ SED File Type
  D      = SED included with export documents
  E      = Electronically filed by the shipper predeparture with an AES
           transaction number
  P      = Electronically filed by the shipper post-departure
  U      = UPS-prepared on the shipper’s behalf
  Y      = SED exists but type unknown
  Space  = Not applicable. Contact the Bureau of the Census - International
           Trade Administration for details of requirements, restrictions,
           and exemptions.}
  TSEDFiledType = (sedNone,                    // (Null)
                   sedWithExportDocuments,     // D
                   sedElectronicPreDeparture,  // E
                   sedElectronicPostDeparture, // P
                   sedUPSPrepared,             // U
                   sedUnknown);                // (Space)

  TExporterTaxIDType = (xtiDUNS, // 04 = DUNS Number
                        xtiSSN,  // 06 = SSN (Social Security Number)
                        xtiEIN); // 79 = EIN (Employers Identification Number)}

  TSEDPartiesToTrans = (sptNone, sptRelated {R}, sptNonRelated {N});

  TCODType = (ucdGuaranteed, ucdStandard);

  TAccountProfile = record
   Contact,
   Company,
   Address1,
   Address2,
   Address3,
   City,
   State,
   PostalCode,
   Country,
   CountryCode,
   Telephone,
   UPSAccount: String;
  end;

{

US values:
Domestic:
01 = Next Day Air
02 = 2nd Day Air
03 = Ground
12 = 3 Day Select
13 = Next Day Air Saver
14 = Next Day Air Early AM
59 = 2 Day Air A.M
International:
07 = Worldwide Express
08 = Worldwide Expedited
54 = Worldwide Express Plus
65 = UPS Worldwide Saver
Transborder:
11 = Standard to Canada

Canada values:
Domestic:
07 = Express
08 = Expedited
11 = Standard
13 = Next Day Air Saver
14 = Express Early AM
21 = Economy
54 = Worldwide Express Plus
65 = UPS Express Saver
International:
07 = Worldwide Express
08 = Worldwide Expedited
54 = Worldwide Express Plus
65 = UPS Express Saver
Transborder:
07 = Express (to the US & Mexico)
08 = Expedited (to the US & Mexico)
11 = Standard (to the US)
12 = 3 Day Select (to the US)
54 = Express Early AM (to the US)
65 = UPS Express Saver
}


type
  TUPSService =
    (upsNextDayAir,             // '01'
     upsSecondDayAir,           // '02'
     upsGround,                 // '03'
     upsWorldwideExpress,       // '07'
     upsWorldwideExpedited,     // '08'
     upsStandard,               // '11'
     upsThreeDaySelect,         // '12'
     upsNextDayAirSaver,        // '13'
     upsNextDayAirEarlyAM,      // '14'
     upsEconomy,                // '21'
     upsWorldwideExpressPlus,   // '54'
     upsSecondDayAirAM,         // '59'
     upsWorldwideExpressNA1,    // '64' // only if Sender = BE, DE, NL, or GB
     upsWorldwideSaver);        // '65'

  // NOTE:  The packaging codes used in PLD files is different from the
  //        packaging codes used in XML.
  TUPSPackaging =
   (upkUnkown,                //  00 = Unknown
    upkLetter,                //  01 = UPS Letter
    upkCustomerSupplied,      //  02 = Customer-supplied box
    upkTube,                  //  03 = Tube
    upkPAK,                   //  04 = UPS Pak
    upkNone,                  //  05 = None
    upkBag,                   //  07 = Bag
    upkBarrel,                //  08 = Barrel
    upkBolt,                  //  09 = Bolt
    upkBundle,                //  10 = Bundle
    upkCan,                   //  11 = Can
    upkCanister,              //  12 = Canister
    upkCoffin,                //  13 = Coffin
    upkCrate,                 //  14 = Crate
    upkCylinder,              //  15 = Cylinder
    upkDrum,                  //  16 = Drum
    upkPallet,                //  18 = Palletized
    upkSpool,                 //  19 = Spool
    upkRoll,                  //  20 = Roll
    upkUPSBoxSmall,           //  21 = UPS Box Small
    upkUPSBoxMedium,          //  21 = UPS Box Medium
    upkUPSBoxLarge,           //  21 = UPS Box Large
    upkEnvelope,              //  22 = Envelope
    upkUPS25KGbox,            //  24 = 25KG Box
    upkUPS10KGbox,            //  25 = 10KG Box
    upkLaboratoryPak,         //  26 = UPS Laboratory Pak
    upkUPSRegularMailPak,     //  27 = UPS Regular Mail Pak
    upkUPSJumboMailPak);      //  28 = UPS Jumbo Mail Pak

  TUPSBillingOption =
   (uboShipper,
    uboReceiver,
    uboThirdParty,
    uboConsignee);

  TUPSTradeDirectType =
  (utdUnknown,
   utdOcean,              // Trade Direct Ocean
   utdCrossBorderNorth,   // Trade Direct Cross Border North
   utdCrossBorderSouth,   // Trade Direct Cross Border South
   utdAir);               // Trade Direct Air

(* -----------------------------------------------------------------------------

   * BILLING OPTION FOR THE SHIPMENT. *

   1.) US and PR Origin - International and Domestic

       - C&F (Cost and Freight) (uboCostAndFreight)
         Shipper pays shipping charges to port of import.
         Consignee pays balance.

       - CBS (Consignee Billed Package) (uboConsignee)
         Valid only when the origin and destination country pairs
         are US to US, US to PR, PR to PR, or PR to US.

       - COL (Freight Collect) (uboFreightCollect)
         Consignee pays all shipping charges, duty, and VAT.

       - DDP (Delivered Duty Paid, VAT Unpaid) (uboDeliveryDutyPaid)
         Shipper pays shipping charges and duty. Consignee pays VAT.
         Shipper must have a UPS account.

       - FOB (Free On Board) (uboFOB)
         Shipper pays shipping charges to port of export. Consignee
         pays balance.

       - PRE (Prepaid) (uboPrepaid)
         Shipper pays all shipping charges. Consignee pays duty and VAT.

       - SDT (Free Domicile) (uboFreeDomicile)
         Shipper pays destination country’s duty and tax in addition to
         all shipping charges. Shipper must have a UPS account.

       - TPB (Third Party Billing) (uboThirdParty)
         Valid only when the origin and destination pairs are US to US,
         US to PR, CA to CA, PR to PR, or PR to US.

   1.) Canada Origin - International and Domestic

       - COL (Freight Collect) (uboFreightCollect)
         Consignee pays all shipping charges, duty, and VAT.

       - DDP (Delivered Duty Paid, VAT Unpaid) (uboDeliveryDutyPaid)
         Shipper pays shipping charges and duty. Consignee pays VAT.
         Shipper must have a UPS account.

       - PRE (Prepaid) (uboPrepaid)
         Shipper pays all shipping charges. Consignee pays duty and VAT.

       - SDT (Free Domicile) (uboFreeDomicile)
         Shipper pays destination country’s duty and tax in addition
         to all shipping charges. Shipper must have a UPS account.

       - TPB (Third Party Billing) (uboThirdParty)
         Valid only when the origin and destination pairs are US to US,
         US to PR, CA to CA, PR to PR, or PR to US..

 ---------------------------------------------------------------------------- *)



  // This applies only if "delivery confirmation" (boolean) is True;
  // these signify the type of delivery confirmation.
  TUPSSignatureOption =
    (usoNoSignature, // No signature required
     usoAnySignature, // Signature Required
     usoAdultSignature); // Adult Signature Required

  // This applies only if "quantum view" (boolean) is True;
  // these signify the type of quantum view.
  TUPSQuantumViewOption =
    (uqvShipNotification,       // Ship Notification
     uqvExceptionNotification, // Exception Notification
     uqvDeliveryNotification); // Delivery Notification

  // This applies only if "insurance" (boolean) is True;
  // these signify the type of insurance.
  TUPSInsuranceOption =
    (uioExpandedParcel,       // Expanded Parcel
     uioFlexibleBasic,        // Flexible Parcel Basic
     uioTimeTransit);        // Time in Transit

  // This applies only if "return service" (boolean) is True;
  // these signify the type of return service.
  TUPSReturnServiceOption =
    (ursOneAttempt,       // One Attempt
     ursThreeAttempts,    // Three Attempts
     ursElectronic,       // Electronic Return Label
     ursPrintMail,        // Print & Mail
     ursPrintLabel);      // Print Return Label

  // This applies only if "international special commodities" (boolean) is True;
  // these signify the type of international special commodity.
  TUPSISCOption =
    (uicSeeds,        // Seeds
     uicPerishables,  // Perishables
     uicTobacco,      // Tobacco
     uicPlants,       // Plants
     uicAlcohol,      // Alcoholic Beverages
     uicBio,          // Biological Substance
     uicSpecial);     // Special Exceptions
  TUPSReturnServicesTypes = (
    rstPackandcollectRS1Box1,
    rstPackandcollectRS1Box2,
    rstPackandcollectRS1Box3,
    rstPackandcollectRS1Box4,
    rstPackandcollectRS1Box5,
    rstPackandcollectRS3Box1,
    rstPackandcollectRS3Box2,
    rstPackandcollectRS3Box3,
    rstPackandcollectRS3Box4,
    rstPackandcollectRS3Box5,
    rstReturnsExchange,
    rstupsReturnsFlex
    );


const
  UPSWeightUOM: array[TUPSWeightUOM] of String =
   ('LBS', 'KG');
  UPSDimensionUOM: array[TUPSDimensionUOM] of String =
   ('IN', 'CM');

  UPSDocumentIndicator: array[TUPSDocumentIndicator] of String =
   ('',            //uriNone,
    'EDI-DOC',     //uriDocumentsOnly,
    'DOC-RS',      //uriDocumentsOnlyRS,
    'INV',         //uriInvoice,
    'INV-RS',      //uriInvoiceRS
    'EDI',         //uriPaperlessInvoice,
    'EDI',         //uriPaperlessInvoiceRS,
    'EDI-PULL',    //uriPaperlessInvoicePlus,
    'EDI-PULL',    //uriPaperlessInvoicePlusRS,
    'KEY',         //uriNoInvoice
    'KEY-RS',       //uriNoInvoiceRS
    'INV-CC');     //uriWorldEase);

  SEDFiledType: array[TSEDFiledType] of Char =
   (#0,   // sedNone (Null)
    'D',  // sedWithExportDocuments
    'E',  // sedElectronicPreDeparture
    'P',  // sedElectronicPostDeparture
    'U',  // sedUPSPrepared
    #32); // sedUnknown (Space)

  SEDFiledTypeDescription: array[TSEDFiledType] of String =
   ('None',   // sedNone (Null)
    'With Export Documents',  // sedWithExportDocuments
    'Electronic By Shipper (Pre-Departure)',  // sedElectronicPreDeparture
    'Electronic By Shipper (Post-Departure)',  // sedElectronicPostDeparture
    'UPS Prepared',  // sedUPSPrepared
    'Type Unknown'); // sedUnknown (Space)

  SEDExportInformationCode: array[0..23] of Code2String =
   ('CH',
    'CR',
    'DD',
    'DP',
    'FS',
    'GP',
    'GS',
    'HH',
    'HR',
    'IC',
    'IP',
    'IR',
    'IS',
    'LC',
    'LV',
    'MS',
    'OS',
    'RJ',
    'SC',
    'SR',
    'TE',
    'TL',
    'TP',
    'UG');

  SEDExportInformationLongDescription: array[0..23] of String =
   ('CH - Shipment of goods donated for relief or charity provided for ' +
          'in chapters 1 through 97 of Schedule B, Classification of ' +
          'Exports. Specific goods listed below should be reported under ' +
          'the appropriate Chapter 98 numbers. 1.) Commingled food ' +
          'products - Schedule B No. 9802.10.0000. 2.) Medicinal and ' +
          'pharmaceutical products - Schedule B No. 9802.20.0000. 3.) ' +
          'Wearing apparel - Schedule B No. 9802.30.0000.',
    'CR - Goods moving under a carnet.',
    'DD - Other exemptions are: Currency (both US and foreign), Airline ' +
         'tickets, Banknotes, Internal revenue stamps, State liquor stamps ' +
         '(Strip stamps are the same as liquor stamps.), Advertising ' +
         'literature, Export of articles imported temporarily for use by ' +
         'representatives of foreign governments of international ' +
         'organizations or members of armed forces or a foreign country.',
    'DP - Diplomatic pouches and their contents [15 CFR Sec. 30.55 (a)]',
    'FS - Foreign military sales program conducted on the basis of formal ' +
          'contracts or agreements between the US government and an ' +
          'authorized recipient, being shipped on a commercial carrier.',
    'GP = Shipments under US government contract for the construction of ' +
          'facilities overseas.',
    'GS = Shipments to US Government agencies and their employees for their ' +
          'exclusive use (15 CFR Sec. 30.53): Office furniture, equipment, ' +
          'and supplies; Food, medicine, or related items; Supplies and ' +
          'equipment sent to US embassies or diplomatic missions for their ' +
          'own use; Books, maps, charts, pamphlets, and similar articles ' +
          'shipped by US government to libraries, government establishments, ' +
          'or similar institutions.',
    'HH = Personal and household effects and tools of trade, including usual ' +
          'and reasonable kinds of furniture, clothing, instruments, tools, ' +
          'and other effects, provided that the articles are owned by the ' +
          'exporter or the exporter’s immediate family, in the possession of ' +
          'the exporter at the time of, or prior to departure, necessary and ' +
          'appropriate for the use of the exporter or the exporter’s ' +
          'immediate family, intended for the exporter’s use or the use of ' +
          'the exporter’s immediate family, and not intended for sale.',
    'HR - Human Remains with receptacles and flowers.',
    'IC - Interplant Correspondence.',
    'IP - Shipment of goods originally imported temporarily free under bond ' +
          '(TIB) exported after being processed or manufactured into a new ' +
          'article in the United States.',
    'IR - Shipments of goods originally imported temporarily free under ' +
          'bond (TIB) exported after being repaired or altered in the United ' +
          'States. Report value of repairs only under Schedule B No. ' +
          '9801.10.0000.',
    'IS - Shipment of goods originally imported temporarily free under bond ' +
          '(TIB) for return in the same condition as imported: 1.) Goods ' +
          'previously imported for testing, experimentation, demonstration, ' +
          'review, etc. 2.) Goods previously imported for exhibition, ' +
          'illustration, etc.  3.) Samples, models previously imported for ' +
          'review or for taking orders.  4.) Goods previously imported for ' +
          'participation in races or contests.  5.) Animals previously ' +
          'imported for breeding, exhibition, or both.',
    'LC - Shipment value $2500 or less per Classification Number [(15 CFR ' +
          'Sec. 30.55(h)] Destined to countries other than those included ' +
          'in Groups T and V. See Supplement No. 1 to Part 770, Export ' +
          'Administration Regulations. All Shipments regardless of value or ' +
          'destination that Require a validated license Are subject to the ' +
          'international Traffic in Arms Regulations, even if exempt from ' +
          'licensing Require a Drug Enforcement Administration export permit ',
    'LV - Shipments valued $2500 or less per Classification Number [15 CFR ' +
          'Sec. 30.55(h)] under any General License including Countries ' +
          'included in Groups T and V. See Supplement No. 1 to Part 770, ' +
          'Export Administration Regulations. Between the US and PR ' +
          'Shipments to the US Virgin Islands.',
    'MS - All commodities consigned to the US armed forces for their ' +
          'exclusive use (15 CFR Sec 30.52) including those to Armed ' +
          'services exchange systems Military bases for construction, ' +
          'maintenance or both.',
    'OS - All other exports.',
    'RJ - Inadmissible merchandise.',
    'SC - Instruments of international trade, exported without transfer of ' +
          'ownership or title, shipping containers, tanks returning for ' +
          'refilling, paper cores, bobbins, racks, reels, spools, etc.',
    'SR - US Carrier stores, to be warehoused overseas.',
    'TE - Temporary exportations that are not sold or offered for sale, ' +
          'and at the time of shipment are definitely intended to be ' +
          'returned to the United States in the same condition as exported ' +
          'including: 1. Goods for exhibition or demonstration and return ' +
          'to the United States 2.) Goods to be tested or evaluated and ' +
          'returned to the United States 3.) Goods to be inspected, ' +
          'calibrated, etc. and returned to the United States 4.) Goods to ' +
          'be repaired and returned to the United States 5.) Goods for ' +
          'participation in races or contests 6.) Goods for temporary use ' +
          'in international waters or for temporary use in foreign ' +
          'countries for research, exploration, construction, and similar ' +
          'projects.',
    'TL - Merchandise exported with a 1-year lease.',
    'TP - Temporary exportations of domestic merchandise that is to be ' +
          'processed, manufactured, or assembled abroad, and returned to the ' +
          'United States',
    'UG - Single gift parcels covered by Bureau of Export Administration ' +
          'General License Gift.');

  ExporterTaxIDTypeCode: array[TExporterTaxIDType] of Code2String =
    ('04',  // xtiDUNS = DUNS Number
     '06',  // xtiSSN = SSN (Social Security Number)
     '79'); // xtiEIN = EIN (Employers Identification Number)

  ExporterTaxIDTypeDescription: array[TExporterTaxIDType] of String =
    ('DUNS Number',  // xtiDUNS
     'SSN (Social Security Number)',  // xtiSSN
     'EIN (Employers Identification Number)'); // xtiEIN

  // UPS Pickup Type Codes
  UPS_PickupCode: array[0..6] of String = ('01','03','06','07','11','19','20');
  UPS_PickupDescrip: array[0..6] of String = ('Daily Pickup','Customer Counter',
    'One Time Pickup','On Call Air','Suggested Retail Rates','Letter Center',
    'Air Service Center');

  // *** UPS Package Codes **
  //UPS_PackagingCode: array[TUPSPackaging] of String =
  // ('00','01','02','03','04','21','2a','2b','2c','24','25','30');
  //UPS_PackagingDescrip: array[TUPSPackaging] of String =
  // ('Unknown','UPS Letter','Customer Supplied','Tube','PAK','UPS Express Box',
  //   'UPS Small Express Box','UPS Medium Express Box','UPS Large Express Box',
  //   'UPS 25KG box','UPS 10KG box','Pallet');

  UPS_PackagingCode: array[TUPSPackaging] of String =
   ('00',  // Unknown
    '01',  // UPS Letter
    '02',  // Customer-supplied box
    '03',  // Tube
    '04',  // UPS Pak
    '05',  // None
    '07',  // Bag
    '08',  // Barrel
    '09',  // Bolt
    '10',  // Bundle
    '11',  // Can
    '12',  // Canister
    '13',  // Coffin
    '14',  // Crate
    '15',  // Cylinder
    '16',  // Drum
    '18',  // Palletized
    '19',  // Spool
    '20',  // Roll
    '21',  // UPS Box
    '21',  // UPS Box
    '21',  // UPS Box
    '22',  // Envelope
    '24',  // 25KG Box
    '25',  // 10KG Box
    '26',  // UPS Laboratory Pak
    '27',  // UPS Regular Mail Pak
    '28'); // UPS Jumbo Mail Pak

  UPS_WWVPackagingCode: array[TUPSPackaging] of String =
   ('',  // Unknown
    'LTR',  // UPS Letter
    'PKG',  // Customer-supplied box
    'TUB',  // Tube
    'PAK',  // UPS Pak
    '',  // None
    '',  // Bag
    '',  // Barrel
    '',  // Bolt
    '',  // Bundle
    '',  // Can
    '',  // Canister
    '',  // Coffin
    '',  // Crate
    '',  // Cylinder
    '',  // Drum
    'PAL',  // Palletized
    '',  // Spool
    '',  // Roll
    'BOX',  // UPS Box
    'BOX',  // UPS Box
    'BOX',  // UPS Box
    '',  // Envelope
    '25N',  // 25KG Box
    '10N',  // 10KG Box
    'PAK',  // UPS Laboratory Pak
    'PAK',  // UPS Regular Mail Pak
    'PAK'); // UPS Jumbo Mail Pak

  UPS_PackagingDescrip: array[TUPSPackaging] of String =
   ('Unknown',
    'UPS Letter',
    'Package', // 'Customer-supplied box',
    'UPS Tube',
    'UPS Express® Pak',
    'None',
    'Bag',
    'Barrel',
    'Bolt',
    'Bundle',
    'Can',
    'Canister',
    'Coffin',
    'Crate',
    'Cylinder',
    'Drum',
    'Palletized',
    'Spool',
    'Roll',
    'UPS Express® Box - Small',
    'UPS Express® Box - Medium',
    'UPS Express® Box - Large',
    'Envelope',
    'UPS 25 KG Box®',
    'UPS 10 KG Box®',
    'UPS Laboratory Pak',
    'UPS Regular Mail Pak',
    'UPS Jumbo Mail Pak');

    (* -------------------------------------------------------------------------
       *** Package Code Summary ***
       Code     Description
       ----     -----------
       00       Unknown,
       01       UPS letter,
       02       Customer supplied package,
       03       Tube,
       04       PAK,
       21       UPS express box,
       2a       UPS small express box,
       2b       UPS medium express box,
       2c       UPS large express box,
       24       UPS 25KG box,
       25       UPS 10KG box,
       30       Pallet

       00       Unknown
       01       UPS Letter
       02       Customer-supplied box
       03       Tube
       04       UPS Pak
       05       None
       07       Bag
       08       Barrel
       09       Bolt
       10       Bundle
       11       Can
       12       Canister
       13       Coffin
       14       Crate
       15       Cylinder
       16       Drum
       18       Palletized
       19       Spool
       20       Roll
       21       UPS Box
       22       Envelope
       24       25KG Box
       25       10KG Box
       26       UPS Laboratory Pak
       27       UPS Regular Mail Pak
       28       UPS Jumbo Mail Pak
    ------------------------------------------------------------------------- *)


  // *** UPS Freight Package Codes *** //
  UPS_FreightPackageCode: array[0..35] of String =
   ('BAG','BAL','BAR','BDL','BIN','BOX','BSK','BUN','CAB','CAN','CAR','CAS',
    'CBY','CON','CRT','CSK','CTN','CYL','DRM','LOO','OTH','PAL','PCS','PKG',
    'PLN','PLT','RCK','REL','ROL','SKD','SPL','TBE','TNK','UNT','VPK','WRP');
  UPS_FreightPackageCodeDescrip: array[0..35] of String =
   ('Bag','Bale','Barrel','Bundle','Bin','Box','Basket','Bunch','Cabinet',
    'Can','Carrier','Case','Carboy','Container','Crate','Cask','Carton',
    'Cylinder','Drum','Loose','Other','Pail','Pieces','Package','Pipe Line',
    'Pallet','Rack','Reel','Roll','Skid','Spool','Tube','Tank','Unit',
    'Van Pack','Wrapped');
    (* -------------------------------------------------------------------------
       *** Package Code Summary ***
       Code     Description
       ----     -----------
       BAG 	    Bag
       BAL 	    Bale
       BAR 	    Barrel
       BDL 	    Bundle
       BIN 	    Bin
       BOX 	    Box
       BSK 	    Basket
       BUN 	    Bunch
       CAB 	    Cabinet
       CAN 	    Can
       CAR 	    Carrier
       CAS 	    Case
       CBY 	    Carboy
       CON 	    Container
       CRT 	    Crate
       CSK 	    Cask
       CTN 	    Carton
       CYL 	    Cylinder
       DRM 	    Drum
       LOO 	    Loose
       OTH 	    Other
       PAL 	    Pail
       PCS 	    Pieces
       PKG 	    Package
       PLN 	    Pipe Line
       PLT 	    Pallet
       RCK 	    Rack
       REL 	    Reel
       ROL 	    Roll
       SKD 	    Skid
       SPL 	    Spool
       TBE 	    Tube
       TNK 	    Tank
       UNT 	    Unit
       VPK 	    Van Pack
       WRP 	    Wrapped
    ------------------------------------------------------------------------- *)

  // *** UPS Service Codes ***
  // NOTE:  See shipman_ups.pas, ServiceCodeList(), for how the service
  //        code list is constructed.

  UPS_ServiceCode: array[TUPSService] of String =
    ('01',   // upsNextDayAir
     '02',   // upsSecondDayAir
     '03',   // upsGround
     '07',   // upsWorldwideExpress
     '08',   // upsWorldwideExpedited
     '11',   // upsStandard
     '12',   // upsThreeDaySelect
     '13',   // upsNextDayAirSaver
     '14',   // upsNextDayAirEarlyAM
     '21',   // upsEconomy
     '54',   // upsWorldwideExpressPlus
     '59',   // upsSecondDayAirAM
     '64',   // upsWorldwideExpressNA1 (only if Sender = BE, DE, NL, or GB)
     '65');  // upsWorldwideSaver

  {UPS_ServiceCodeDescrip: array[TUPSService] of String =
   ('UPS Next Day Air®','UPS Standard','UPS Three-Day Select®',
    'UPS Next Day Air Saver®','UPS Next Day Air® Early A.M. SM',
    'UPS Second Day Air®','UPS Ground','UPS Freight LTL',
    'UPS Freight LTL Guaranteed','UPS Freight LTL Urgent',
    'UPS Worldwide Express PlusSM','UPS Second Day Air A.M.®',
    'UPS Saver','UPS Worldwide ExpressSM','UPS Worldwide ExpeditedSM',
    'UPS Worldwide Express NA1®','UPS Worldwide SaverSM',
    'UPS Today StandardSM','UPS Today Dedicated CourrierSM',
    'UPS Today Intercity','UPS Today Express','UPS Today Express Saver',
    'Trade Direct Air','Trade Direct Cross Border','Trade Direct Ocean');}
  UPS_ServiceCodeDescrip: array[TUPSService] of String =
   ('UPS Next Day Air®',
    'UPS 2nd Day Air®',
    'UPS Ground',
    'UPS Worldwide Express®',
    'UPS Worldwide Expedited®',
    'UPS Standard',
    'UPS 3 Day Select®',
    'UPS Next Day Air Saver®',
    'UPS Next Day Air® Early A.M.®',
    'UPS Economy',
    'UPS Worldwide Express Plus®',
    'UPS 2nd Day Air A.M.®',
    'UPS Worldwide Express NA1®',
    'UPS Worldwide Saver®');
  UPS_ServiceCodeDescripSimplified: array[TUPSService] of String =
   ('UPS NEXT DAY AIR',
    'UPS 2ND DAY AIR',
    'UPS GROUND',
    'UPS EXPRESS',
    'UPS EXPEDITED',
    'UPS STANDARD',
    'UPS 3 DAY SELECT',
    'UPS NEXT DAY AIR SAVER',
    'UPS EARLY A.M.',
    'UPS ECONOMY',
    'UPS EXPRESS PLUS',
    'UPS 2ND DAY AIR A.M.',
    'UPS EXPRESS NA1',
    'UPS SAVER');

    (* -------------------------------------------------------------------------
       *** Service Code Summary ***
       US values:
       Domestic:
       01 = Next Day Air
       02 = 2nd Day Air
       03 = Ground
       12 = 3 Day Select
       13 = Next Day Air Saver
       14 = Next Day Air Early AM
       59 = 2 Day Air A.M
       International:
       07 = Worldwide Express
       08 = Worldwide Expedited
       54 = Worldwide Express Plus
       65 = UPS Worldwide Saver
       Transborder:
       11 = Standard to Canada

       Canada values:
       Domestic:
       07 = Express
       08 = Expedited
       11 = Standard
       13 = Next Day Air Saver
       14 = Express Early AM
       21 = Economy
       54 = Worldwide Express Plus
       65 = UPS Express Saver
       International:
       07 = Worldwide Express
       08 = Worldwide Expedited
       54 = Worldwide Express Plus
       65 = UPS Express Saver
       Transborder:
       07 = Express (to the US & Mexico)
       08 = Expedited (to the US & Mexico)
       11 = Standard (to the US)
       12 = 3 Day Select (to the US)
       54 = Express Early AM (to the US)
       65 = UPS Express Saver

    ------------------------------------------------------------------------- *)

  { NOTE:  The documentation used to build the list of services is
    "Jan 2009 Message Layouts.pdf"}

  // Service Codes - "United States Domestic Shipments"
  UPS_ServiceCode_USADomestic: array[0..6] of String =
     ('01','02','03','12','13','14','59');

  // Service Codes - "United States Puerto Rico Shipments"
  UPS_ServiceCode_USAPR: array[0..6] of String =
     ('01','02','03','07','08','54','65');

  // Service Codes - "Shipments Originating in United States"
  UPS_ServiceCode_USAInternational: array[0..3] of String =
     ('07','08','54','65');

  // Service Codes - "Shipments Originating in Puerto Rico"
  UPS_ServiceCode_PuertoRico: array[0..6] of String =
     ('01','02','03','12','13','14','59');

  // Service Codes - "Shipments Originating in Canada"
  UPS_ServiceCode_CanadaDomestic: array[0..7] of String =
     ('07','08','11','13','14','21','54','65');
  UPS_ServiceCodeDescrip_CanadaDomestic: array[0..7] of String =
     ('UPS Express',
      'UPS Expedited',
      'UPS Standard',
      'UPS Next Day Air Saver®',
      'UPS Express Early A.M.',
      'UPS Economy',
      'UPS Worldwide Express Plus',
      'UPS Express Saver');
  UPS_ServiceCode_CanadaTrans: array[0..5] of String =
     ('07',
      '08',
      '11',
      '12',
      '54',
      '65');
  // Transborder
  UPS_ServiceCodeDescrip_CanadaTrans: array[0..5] of String =
     ('UPS Express',
      'UPS Expedited',
      'UPS Standard',
      'UPS 3 Day Select',
      'UPS Express Early AM',
      'UPS Express Saver');
  UPS_ServiceCode_CanadaInternational: array[0..3] of String =
     ('07','08','54','65');
  UPS_ServiceCodeDescrip_CanadaInternational: array[0..3] of String =
     ('UPS Worldwide Express',
      'UPS Worldwide Expedited',
      'UPS Worldwide Express Plus',
      'UPS Express Saver');

  // Service Codes - "Shipments Originating in Mexico"
  UPS_ServiceCode_MexicoDomestic: array[0..4] of String =   //phillip added UPS Standard
     ('07','08','11','54','65');
  UPS_ServiceCodeDescrip_MexicoDomestic: array[0..3] of String =
     ('UPS Worldwide Express',
      'UPS Worldwide Expedited',
      'UPS Worldwide Express Plus',
      'UPS Express Saver');

  // Service Codes - "Polish Domestic Shipments"
  UPS_ServiceCode_Polish: array[0..9] of String =
     ('07','08','11','54','65','82','83','84','85','86');
    (* -------------------------------------------------------------------------
       *** Service Codes - Polish Domestic Shipments ***
       Code     Description
       ----     -----------
       07 	    UPS Express
       08 	    UPS ExpeditedSM
       11 	    UPS Standard
       54 	    UPS Worldwide Express PlusSM
       65 	    UPS Saver
       82 	    UPS Today StandardSM
       83 	    UPS Today Dedicated CourrierSM
       84 	    UPS Today Intercity
       85 	    UPS Today Express
       86 	    UPS Today Express Saver
    ------------------------------------------------------------------------- *)

  // Service Codes - "Shipments Originating in the European Union"
  UPS_ServiceCode_Euro: array[0..4] of String =
     ('07','08','11','54','65');
    (* -------------------------------------------------------------------------
       *** Service Codes - Shipments Originating in the European Union ***
       Code     Description
       ----     -----------
       07 	    UPS Express
       08 	    UPS ExpeditedSM
       11 	    UPS Standard
       54 	    UPS Worldwide Express PlusSM
       65 	    UPS Saver
    ------------------------------------------------------------------------- *)

  // Service Codes - "Shipments Originating in Other Countries"
  UPS_ServiceCode_Foreign: array[0..4] of String =
     ('07','08','11','54','65');
    (* -------------------------------------------------------------------------
       *** Service Codes - Shipments Originating in Other Countries ***
       Code     Description
       ----     -----------
       07 	    UPS Express
       08 	    UPS Worldwide ExpeditedSM
       11 	    UPS Standard
       54 	    UPS Worldwide Express PlusSM
       65 	    UPS Saver
    ------------------------------------------------------------------------- *)

  // Service Codes - "Freight Shipments"
  UPS_ServiceCode_Freight: array[0..5] of String =
     ('TDCB','TDA','TDO','308','309','310');
    (* -------------------------------------------------------------------------
       *** Service Codes - Freight Shipments ***
       Code     Description
       ----     -----------
       TDCB 	  Trade Direct Cross Border
       TDA 	    Trade Direct Air
       TDO 	    Trade Direct Ocean
       308 	    UPS Freight LTL
       309 	    UPS Freight LTL Guaranteed
       310 	    UPS Freight LTL Urgent
    ------------------------------------------------------------------------- *)

  // *** UPS Reference Codes *** //
  UPS_ReferenceCode: array[0..18] of String =
    ('AJ','AT','BM','9V','ON','DP','3Q','IK','MK','MJ','PM','PC','PO','RQ','RZ',
     'SA','SE','ST','TN');
  UPS_ReferenceCodeDescription: array[0..18] of String =
    ('Accounts Receivable Customer Account','Appropriation Number',
     'Bill of Lading Number','Collect on Delivery (COD) Number',
     'Dealer Order Number','Department Number',
     'Food and Drug Administration (FDA) Product Code','Invoice Number',
     'Manifest Key Number','Model Number','Part Number','Production Code',
     'Purchase Order Number','Purchase Request Number',
     'Return Authorization Number','Salesperson Number','Serial Number',
     'Store Number','Transaction Reference Number');

    (* -------------------------------------------------------------------------
       *** Package Code Summary ***
       Code     Description
       ----     -----------
       AJ 	    Accounts Receivable Customer Account
       AT 	    Appropriation Number
       BM 	    Bill of Lading Number
       9V 	    Collect on Delivery (COD) Number
       ON 	    Dealer Order Number
       DP 	    Department Number
       3Q 	    Food and Drug Administration (FDA) Product Code
       IK 	    Invoice Number
       MK 	    Manifest Key Number
       MJ 	    Model Number
       PM 	    Part Number
       PC 	    Production Code
       PO 	    Purchase Order Number
       RQ 	    Purchase Request Number
       RZ 	    Return Authorization Number
       SA 	    Salesperson Number
       SE 	    Serial Number
       ST 	    Store Number
       TN 	    Transaction Reference Number
    ------------------------------------------------------------------------- *)

  UPSReturnServiceDomesticCodes: array[0..4] of TUPSService =
   (upsNextDayAirEarlyAM, upsNextDayAir, upsSecondDayAir,
    upsThreeDaySelect, upsGround);

  UPSReturnServiceIntlCodes: array[0..4] of TUPSService =
   (upsWorldwideExpressPlus, upsWorldwideExpress, upsWorldwideSaver,
    upsWorldwideExpedited, upsStandard);

  // These billing types require an account number
//  UPSBillingOptionRequiresAccount: array[0..3] of TUPSBillingOption =

  UPSBillingOptionDescription: array[TUPSBillingOption] of String =
   ('Shipper',                         // uboShipper
    'Receiver',                  // uboReceiver
    'Third Party',              // uboThirdParty
    'Consignee'           // uboConsignee
    );


  UPSBillingCodes_USPR_Domestic: array[0..3] of TUPSBillingOption =
   (uboShipper,uboReceiver,uboThirdParty,uboConsignee);
  UPSBillingCodes_USPR_International: array[0..2] of TUPSBillingOption =
   (uboReceiver,uboShipper,uboThirdParty);


  UPSSignatureCode_USA: array[TUPSSignatureOption] of String =
    ('',                                 // usoNoSignature
     'SIGNATURE REQUIRED',               // usoAnySignature
     'ADULT SIGNATURE REQUIRED'#45'MIN 21'); // usoAdultSignature

  UPSSignatureCode_Canada: array[TUPSSignatureOption] of String =
    ('',                                 // usoNoSignature
     'SIGNATURE REQUIRED',               // usoAnySignature
     'ADULT SIGNATURE REQUIRED'#45'MIN 19'); // usoAdultSignature

  UPSSignatureCode_Foreign: array[TUPSSignatureOption] of String =
    ('',                                 // usoNoSignature
     'SIGNATURE REQUIRED',               // usoAnySignature
     'ADULT SIGNATURE REQUIRED');        // usoAdultSignature

  UPSSignatureDescription: array[TUPSSignatureOption] of String =
    ('No Signature Required',            // usoNoSignature
     'Signature Required',               // usoAnySignature
     'Adult Signature Required');        // usoAdultSignature

  UPSSignatureAccCode: array[TUPSSignatureOption] of String =
    ('DCR',         // usoNoSignature
     'DCS',         // usoAnySignature
     'ADS');        // usoAdultSignature

  UPSQuantumViewDescription: array[TUPSQuantumViewOption] of String =
    ('Quantum View Ship Notification®',       // uqvShipNotification
     'Quantum View Exception Notification®',  // uqvExceptionNotification
     'Quantum View Delivery Notification®');  // uqvDeliveryNotification

  UPSQuantumViewAccCode: array[TUPSQuantumViewOption] of String =
    ('QSC',         // uqvShipNotification
     'QBC',         // uqvExceptionNotification
     'QDN');        // uqvDeliveryNotification

  UPSInsuranceDescription: array[TUPSInsuranceOption] of String =
    ('Expanded Parcel',        // uioExpandedParcel
     'Flexible Parcel Basic',  // uioFlexibleBasic
     'Time in Transit');       // uioTimeTransit

  UPSInsuranceContractCode: array[TUPSInsuranceOption] of String =
    ('expandedFlex',        // uioExpandedParcel
     'basicFlex',  // uioFlexibleBasic
     'tntFlex');       // uioTimeTransit
  UPSInsuranceAccCode: array[TUPSInsuranceOption] of String =
    ('EPI',         // uioExpandedParcel
     'BPI',         // uioFlexibleBasic
     'TNT');        // uioTimeTransit

  UPSReturnServiceDescription: array[TUPSReturnServiceOption] of String =
    ('One Attempt',              // ursOneAttempt
     'Three Attempts',           // ursThreeAttempts
     'Electronic Return Label',  // ursElectronic
     'Print & Mail',             // ursPrintMail
     'Print Return Label');      // ursPrintLabel

  UPSReturnServiceAccCode: array[TUPSReturnServiceOption] of String =
    ('RSO',       // ursOneAttempt
     'ART',       // ursThreeAttempts
     'ERL',       // ursElectronic
     'PNM',       // ursPrintMail
     'ALP');      // ursPrintLabel

  UPSISCDescription: array[TUPSISCOption] of String =
    ('Seeds',                // uicSeeds
     'Perishables',          // uicPerishables
     'Tobacco',              // uicTobacco
     'Plants',               // uicPlants
     'Alcoholic Beverages',  // uicAlcohol
     'Biological Substance', // uicBio
     'Special Exceptions');  // uicSpecial

  UPSISCAccCode: array[TUPSISCOption] of String =
    ('ISS',       // uicSeeds
     'ISR',       // uicPerishables
     'IST',       // uicTobacco
     'ISP',       // uicPlants
     'ISA',       // uicAlcohol
     'ISD',       // uicBio
     'ISE');      // uicSpecial

  UPSISCCarrierCode: array[TUPSISCOption] of String =
    ('iscSeeds',         // uicSeeds
     'iscPerishables',   // uicPerishables
     'iscTobacco',       // uicTobacco
     'iscPlants',        // uicPlants
     'iscAlcohol',       // uicAlcohol
     'iscDiagSpec',      // uicBio
     'iscSpecExcept');   // uicSpecial

  UPSISCCarrierValue: array[TUPSISCOption] of String =
    ('032',     // uicSeeds
     '033',     // uicPerishables
     '034',     // uicTobacco
     '035',     // uicPlants
     '036',     // uicAlcohol
     '037',     // uicBio
     '038');    // uicSpecial

  UPSReturnServicesTypePackCollect: array[0..9] of TUPSReturnServicesTypes =
  (
    rstPackandcollectRS1Box1,
    rstPackandcollectRS1Box2,
    rstPackandcollectRS1Box3,
    rstPackandcollectRS1Box4,
    rstPackandcollectRS1Box5,
    rstPackandcollectRS3Box1,
    rstPackandcollectRS3Box2,
    rstPackandcollectRS3Box3,
    rstPackandcollectRS3Box4,
    rstPackandcollectRS3Box5
    );
  UPSReturnServicesTypeCodes: array[TUPSReturnServicesTypes] of String =
  (
    'packandcollectRS1Box1',
    'packandcollectRS1Box2',
    'packandcollectRS1Box3',
    'packandcollectRS1Box4',
    'packandcollectRS1Box5',
    'packandcollectRS3Box1',
    'packandcollectRS3Box2',
    'packandcollectRS3Box3',
    'packandcollectRS3Box4',
    'packandcollectRS3Box5',
    'returnsExchange',
    'upsReturnsFlex'
    );
  UPSReturnServicesTypeEnabledValues: array[TUPSReturnServicesTypes] of String =
  (
    '080',
    '081',
    '082',
    '083',
    '084',
    '085',
    '086',
    '087',
    '088',
    '089',
    '090',
    '806'
    );
  UPSReturnServicesTypeAccCode: array[TUPSReturnServicesTypes] of String =
  (
    'RSO',
    'RSO',
    'RSO',
    'RSO',
    'RSO',
    'ART',
    'ART',
    'ART',
    'ART',
    'ART',
    'ALP' ,
    ''
    );
//  UPSPrinterTypeDescription: array[TUPSPrinterType] of String =
//   ();

  procedure CopyAccountProfile(const ASource: TAccountProfile;
    var ATarget: TAccountProfile);


implementation

procedure CopyAccountProfile(const ASource: TAccountProfile;
 var ATarget: TAccountProfile);
begin
   ATarget.Contact          := ASource.Contact    ;
   ATarget.Company          := ASource.Company    ;
   ATarget.Address1         := ASource.Address1   ;
   ATarget.Address2         := ASource.Address2   ;
   ATarget.Address3         := ASource.Address3   ;
   ATarget.City             := ASource.City       ;
   ATarget.State            := ASource.State      ;
   ATarget.PostalCode       := ASource.PostalCode ;
   ATarget.Country          := ASource.Country    ;
   ATarget.CountryCode      := ASource.CountryCode;
   ATarget.Telephone        := ASource.Telephone  ;
   ATarget.UPSAccount       := ASource.UPSAccount ;
end;


end.

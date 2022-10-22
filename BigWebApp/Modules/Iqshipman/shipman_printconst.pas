unit shipman_printconst;

interface


type
  TLabelUOM = (cuInches, cuCentimeters);

  TOrientation = (orVertical,orHorizontal,orVerticalFlip,orHorizontalFlip);

  {TPrinterType}
  // Note:  Do not change the order of this enumeration.  The ordinal
  //        value is saved to the database.
  TPrinterType = (ptUnknown,ptLaser,ptEltron, ptZebra, ptUniMark);

  TCarrietReportType =
    ( rptUpsHighVal,
      rptUpsPickupSum,
      rptUpsWEDocBox,
      rptUpsMastInvc,
      rptUpsCnsldInvc,
      rptUpsWELabel,
      rptUpsCertOrigin,
      rptUpsCommercInvc,
      rptUpsLabel,
      rptUpsNafta,
      rptUpsPaperless,
      rptUpsSed,
      rptUpsDayShipDtl,
      rptUpsISA,
      rptUpsPOA,
      rptUpsExchReceipt,
      rptUpsRFALabel,
      rptUpsExtDoc,
      rptUpsConsignee );

  TLabelParams = packed record
   PrintJobName,
   DisplayName,
   Printer: String;
   PrinterType: TPrinterType;
   TopMargin,
   LeftMargin,
   Width,
   Height: Real;
   UOM: TLabelUOM;
   Orientation: TOrientation;
   StartingRotation: Integer;
end;

const
  PrinterTypeNames: array[TPrinterType] of String =
   ('(Unassigned)',
    'Generic Laser Printer',
    'Eltron® Series Thermal Printer',
    'Zebra® ZPL Thermal Printer',
    'UniMark® Series Thermal Printer');

  PrinterTypes: array[TPrinterType] of String =
   ('LASER', // unassigned
    'LASER',
    'ELTRON',
    'ZEBRA',
    'UNIMARK');

  PrinterTypeExamples: array[TPrinterType] of String =
   ('LANIER LD024', // unassigned
    'LANIER LD024',
    'ELTRON 2442',
    'ZEBRA ZP450',
    'UNIMARK U501');

implementation

end.

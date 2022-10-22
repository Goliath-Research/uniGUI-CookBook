unit ups_httplink_utils;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Math,
  MaskUtils,
  Vcl.Printers,
  ups_httplink_typelib;

  function CalculateShipmentNumber(const ATrackingNumber: ShortString): ShortString;
  function CalculateShipperNumber(const ATrackingNumber: ShortString): ShortString;

  procedure SetPrinterAsCurrent(APrinterName: String);
  procedure RoundToPoint5(const AValue: Real; var AResult: Real);
  procedure ConvertWeight(const AStartWt: Real; AFromUOM, AToUOM: TUPSWeightUOM;
   var ANewWt: Real);
  procedure ConvertDimension(const AStartDim: Real; AFromUOM, AToUOM: TUPSDimensionUOM;
   var ANewDim: Real);

  function IsLargePackage(const ALength, AWidth, AHeight: Integer;
   ADimUOM: TUPSDimensionUOM = udIN): Boolean;
  function AdditionalHandlingRequired(const ALength, AWidth, AHeight: Integer;
   const ADimensionUOM: TUPSDimensionUOM; AActualWeight: Real; AServiceCode: String): Boolean;
  function IsHeavyWeightPackage(const AActualWeight: Real; AUOM: TUPSWeightUOM): Boolean;

  function NextTrackingNumber(const AAccountNumber: String;
                              const AServiceIndicator: String;
                              const AReferenceNumber: String;
                              const ACheckDigit: String): String;

  procedure GetServiceData(const AShipToCountryCode,
                                 AShipFromCountryCode: String;
                                 AUPSService: TUPSService;
                                 ASaturdayDelivery: Boolean;
                                 ADeliveryConfirmation: Boolean;
                                 ASignatureOption: TUPSSignatureOption;
                                 AShipperRelease: Boolean;
                                 AReturnService: Boolean;
                                 ACOD: Boolean;
                             var AServiceIcon,
                                 AServiceIndicator,
                                 AServiceClass: String);

  procedure LogToShipmanChkPointFile( S:String );
  procedure CheckShipmanChkPointFileSize;

implementation

uses
  IQMS.Common.CheckPoint,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  ups_httplink_service;

procedure LogToShipmanChkPointFile( S:String );
begin
  IQMS.Common.CheckPoint.TFrmCheckPointList.Add( s, IQGetLocalHomePath + 'IQCheckPointListShipman.txt' );  { IQMisc }
end;

procedure CheckShipmanChkPointFileSize;
begin
  TFrmCheckPointList.BackupLogExceeding( 20 * 1024 * 1024, IQGetLocalHomePath + 'IQCheckPointListShipman.txt' );
end;

function CalculateShipmentNumber(const ATrackingNumber: ShortString): ShortString;
const
 ConversionArray:  array[0..25] of ShortString =
   ('3','4','7','8','9','B','C','D','F','G','H','J','K','L','M','N','P','Q',
    'R','S','T','V','W','X','Y','Z');
var
   i,
   Base,
   Pos1,
   Pos2,
   Pos3,
   Pos4,
   Pos5: Integer;
   tmpTrackingNo, tmpBase, tmp: ShortString;
   // --------------------------------------------------------------------------
   function _GetKey(const AValue: Integer): ShortString;
   begin
     Result := '';
     if (AValue >= 0) and (AValue <= High(ConversionArray)) then
     try
        Result := ConversionArray[AValue];
     except
     end;
   end;
   // --------------------------------------------------------------------------
begin

  // The Tracking Number Mask = '1Z 999 999 99 9999 999 9';
  // Check if valid.  The tracking number mask will always begin with
  // the string literal, '1Z'.  If it does not exist, then there is
  // nothing we can do with this tracking number.
  i := Pos('1Z',ATrackingNumber);
  if i <= 0 then
     raise Exception.CreateFmt('Invalid tracking number: %s',
      [ATrackingNumber]);

  // Remove all of the spaces in the tracking number.  We do this so that
  // we can find absolute positions.
  tmpTrackingNo := System.SysUtils.StringReplace(ATrackingNumber, ' ', '', [rfReplaceAll]);

  // Get the useable text; meaning, this is the section of the tracking
  // number that we use as our "base."
  tmpBase := Trim(Copy(tmpTrackingNo, 11, 7));

  // Get useable number.  We convert the "base" text to a number.  This
  // number is used in the calculations below.
  if not System.SysUtils.TryStrToInt(tmpBase, Base) then
     raise Exception.Create('Cannot calculate Shipment Number.');

  // There are 5 "positions" or values calculated from the "base" number.
  // Each formula has been documented by UPS in the labelling guide.
  Pos1 := Trunc(Base / Power(26,4));// requires System.Math.pas
  Pos2 := Trunc((Base - (Pos1 * Power(26,4)))/Power(26,3));
  Pos3 := Trunc((Base - (Pos1 * Power(26,4)) - (Pos2 * Power(26,3)))/Power(26,2));
  Pos4 := Trunc((Base - (Pos1 * Power(26,4)) - (Pos2 * Power(26,3)) - (Pos3 * Power(26,2)))/26);
  Pos5 := Trunc(Base - (Pos1 * Power(26,4)) - (Pos2* Power(26,3)) - (Pos3 * Power(26,2)) - (Pos4 * 26));

  // Build a string of text.  Each position returns either a number or a letter.
  tmp := '';
  tmp := _GetKey(Pos1);
  tmp := tmp + _GetKey(Pos2);
  tmp := tmp + _GetKey(Pos3);
  tmp := tmp + _GetKey(Pos4);
  tmp := tmp + _GetKey(Pos5);

  // Combine the result 5 letters with the first 6 characters of the 11
  // character tracking number -- after the literal, '1Z' -- with the
  // calculated string.  The final format of the shipper number will be
  // as follows:  123456#####
  tmp := Copy(tmpTrackingNo, 3, 6) + tmp;

  // Apply the mask
  tmp := MaskUtils.MaskDoFormatText('#### #### ###', tmp, ' ');

  // Return the result
  Result := tmp;
end;

procedure SetPrinterAsCurrent(APrinterName: String);
var
  I: Integer;
begin

  for I:= 0 to Printer.Printers.Count - 1 do
    if CompareText( Printer.Printers[ I ], Trim( APrinterName )) = 0 then     {RF_Pro.pas}
       Printer.PrinterIndex:= I;
end;

function CalculateShipperNumber(const ATrackingNumber: ShortString): ShortString;
var
   tmp: ShortString;
begin
  tmp := System.SysUtils.StringReplace(ATrackingNumber, ' ', '', [rfReplaceAll]);
  Result := Copy(tmp, 3, 6)
end;

procedure RoundToPoint5(const AValue: Real; var AResult: Real);
var
   r1,r2: Real;
begin
  r1 := Trunc(AValue);
  r2 := Frac(AValue);

  // Method 1
{  if InRange(r2, 0, 0.25) then r2 := 0
  else if InRange(r2, 0.26, 0.5) then r2 := 0.5
  else if InRange(r2, 0.51, 0.74) then r2 := 0.5
  else if InRange(r2, 0.75, 0.99) then r2 := 1; }

  // Method 2
  if (r2 > 0) then
     begin
       if InRange(r2, 0.1, 0.59) then r2 := 0.5
       else r2 := 1;
     end
  else r2 := 0;

  AResult := r1 + r2;
end;

procedure ConvertWeight(const AStartWt: Real; AFromUOM, AToUOM: TUPSWeightUOM;
 var ANewWt: Real);
const
  CONVERSION_RATE = 0.45359237;
begin
  // initial
  ANewWt := AStartWt;
  // is a change required?
  if AFromUOM = AToUOM then Exit;
  // lbs to kg
  if AFromUOM = uwLBS then
     ANewWt := AStartWt * CONVERSION_RATE
  // kg to lbs
  else if AFromUOM = uwKG then
     ANewWt := AStartWt / CONVERSION_RATE;
end;

procedure ConvertDimension(const AStartDim: Real; AFromUOM, AToUOM: TUPSDimensionUOM;
 var ANewDim: Real);
const
  CONVERSION_RATE = 2.54;
begin
  // initial
  ANewDim := AStartDim;
  // is a change required?
  if AFromUOM = AToUOM then Exit;
  // lbs to kg
  if AFromUOM = udIN then
     ANewDim := AStartDim * CONVERSION_RATE
  // kg to lbs
  else if AFromUOM = udCM then
     ANewDim := AStartDim / CONVERSION_RATE;
end;

function IsLargePackage(const ALength, AWidth, AHeight: Integer;
 ADimUOM: TUPSDimensionUOM): Boolean;
var
   tmpR: Real;
   L,W,H: Real;
begin
  {A package is considered a Large Package when its length plus girth
   [(2 x width) + (2 x height)] combined exceeds 130 inches, but does not
   exceed the maximum UPS size of 165 inches.
   Large Packages are subject to a minimum billable weight of 90 pounds.
   A Large Package Surcharge will apply; refer to page 69 for fees. An Additional
   Handling charge will not be assessed when a Large Package Surcharge
   is applied.}
   ConvertDimension(ALength,ADimUOM,udIN,L);
   ConvertDimension(AWidth,ADimUOM,udIN,W);
   ConvertDimension(AHeight,ADimUOM,udIN,H);
   tmpR := L + ((2 * W) + (2 * H));
   Result := (tmpR > 130) and (tmpR <= 165);
end;

function AdditionalHandlingRequired(const ALength, AWidth, AHeight: Integer;
 const ADimensionUOM: TUPSDimensionUOM; AActualWeight: Real; AServiceCode: String): Boolean;
var
   x, iMax, iMid, iMin, AThreshold: Real;
begin
  Result := (not IsLargePackage(Alength, AWidth, AHeight));
  if (not Result) then
    Exit;
    {Additional Handling (AH) = $7.50:
     1. Any article that is encased in an outside shipping container
        made of metal or wood.
     2. Any cylindrical item, such as a barrel, drum, pail or tire,
        that is not fully encased in a corrugated cardboard shipping container.
     3. Any package with the longest side exceeding 60 inches or its
        second-longest side exceeding 30 inches.
     4. Any package with an actual weight of more than 70 pounds.

     Will not be assessed when a Large Package Surcharge is applied.
     UPS also reserves the right to assess the charge for any package
     that, in UPS’s sole discretion, requires special handling.}

  // Get the min, mid, and max values.  Convert all to inches.
  // 1.) Max
  x := System.Math.MaxIntValue([ALength, AWidth, AHeight]);
  ConvertDimension(x,ADimensionUOM, udIN, iMax);
  // 2.) Min
  x := System.Math.MinIntValue([ALength, AWidth, AHeight]);
  ConvertDimension(x,ADimensionUOM, udIN, iMin);
  // 3. Mid
  x := System.Math.MaxIntValue([System.Math.MinIntValue([ALength, AWidth]),
                         System.Math.MinIntValue([ALength, AHeight]),
                         System.Math.MinIntValue([AWidth, AHeight])]);
  ConvertDimension(x,ADimensionUOM, udIN, iMid);

  // Does longest side exceed 60 inches?
  Result := iMax > 60;
  if Result then
     Exit;

  // Does the second-longest side exceede 30 inches?
  Result := iMid > 30;
  if Result then
     Exit;

  // Does actual weight exceed 70 pounds?
  AThreshold := SelectValueFmtAsFloat('select shipman.get_custom_value(''AdditionalHandlingThreshold'', ''%s'', 70) from dual', [AServiceCode]);
  Result := AActualWeight > AThreshold;
  if Result then
     Exit;

end;

function IsHeavyWeightPackage(const AActualWeight: Real;
 AUOM: TUPSWeightUOM): Boolean;
begin
  Result := ((AUOM = uwLBS) and (AActualWeight > 70)) or
            ((AUOM = uwKG) and (AActualWeight > 31.7514));
end;

function NextTrackingNumber(const AAccountNumber: String;
                            const AServiceIndicator: String;
                            const AReferenceNumber: String;
                            const ACheckDigit: String): String;
begin
  // '1Z 999 999 99 9999 999 9'
  Result := Format('1Z 999 999 99 9999 999 9',[]);
end;

procedure GetServiceData(const AShipToCountryCode,
                               AShipFromCountryCode: String;
                               AUPSService: TUPSService;
                               ASaturdayDelivery: Boolean;
                               ADeliveryConfirmation: Boolean;
                               ASignatureOption: TUPSSignatureOption;
                               AShipperRelease: Boolean;
                               AReturnService: Boolean;
                               ACOD: Boolean;
                           var AServiceIcon,
                               AServiceIndicator,
                               AServiceClass: String);
begin
 AServiceIcon := '';
 AServiceIndicator := '';
 AServiceClass := '';

 with TUPSSrvRetrieval.Create(NIL) do  // ups_httplink_service
 try
    // Supplied values
    SenderCountryCode := AShipFromCountryCode;
    RecipientCountryCode := AShipToCountryCode;
    UPSService := AUPSService;
    SaturdayDelivery := ASaturdayDelivery;
    DeliveryConfirmation := ADeliveryConfirmation;
    SignatureOption := ASignatureOption;
    ShipperRelease := AShipperRelease;
    ReturnService := AReturnService;
    COD := ACOD;

    // get values
    Execute;

    // Returned values
    AServiceIcon := ServiceIcon;
    AServiceIndicator := ServiceIndicator;
    AServiceClass := ServiceClass;

 finally
    Free;
 end;

Exit;

 //APackageServiceCode := UPS_ServiceCode[AUPSService];
 // NOTE:  The Service Icon for UPS Ground and UPS Standard is always a
 //        black square.  UPS Economy is a black circle.

 // ----------------------------------------------------------------------------
 // US - Domestic
 // ----------------------------------------------------------------------------
 if ((AShipFromCountryCode = 'US') or (AShipFromCountryCode = 'PR')) and
     (AShipToCountryCode = 'US') then
    begin
     case AUPSService of

      // UPS EARLY AM (14)
      upsNextDayAirEarlyAM:
        begin
          if ASaturdayDelivery then AServiceIcon := '1+S' else AServiceIcon := '1+';
          if not ADeliveryConfirmation then
            begin
              if AShipperRelease then
                 begin
                   if ASaturdayDelivery then AServiceIndicator := 'PA' else AServiceIndicator := 'NP';
                   if ASaturdayDelivery then AServiceClass := '714'
                   else AServiceClass := IQMS.Common.Numbers.sIIf(AShipFromCountryCode = 'PR','649','694');
                 end
              else
                 begin
                   if ASaturdayDelivery then AServiceIndicator := '41' else AServiceIndicator := '15';
                   if ASaturdayDelivery then AServiceClass := '041' else AServiceClass := '015';
                 end;
            end
          else
            begin
              if ASaturdayDelivery then AServiceIndicator := 'A1' else AServiceIndicator := 'A0';
              if ASaturdayDelivery then AServiceClass := '321' else AServiceClass := '320';
            end;
        end;

      // UPS NEXT DAY AIR ('01')
      upsNextDayAir:
        begin
          if ASaturdayDelivery then AServiceIcon := '1 S' else AServiceIcon := '1';

          if ADeliveryConfirmation then
             case ASignatureOption of
              usoNoSignature:
               begin
                 if AShipperRelease then
                    begin
                      if ASaturdayDelivery then AServiceIndicator := 'PN' else AServiceIndicator := 'P4';
                      if ASaturdayDelivery then AServiceClass := '725' else AServiceClass := '708';
                    end
                 else
                    begin
                      if ASaturdayDelivery then AServiceIndicator := '47' else AServiceIndicator := '25';
                      if ASaturdayDelivery then AServiceClass := '047' else AServiceClass := '025';
                    end;
               end;
              usoAnySignature:
               begin
                 if ASaturdayDelivery then AServiceIndicator := '58' else AServiceIndicator := '24';
                 if ASaturdayDelivery then AServiceClass := '058' else AServiceClass := '024';
               end;
              usoAdultSignature:
               begin
                 if ASaturdayDelivery then AServiceIndicator := 'A3' else AServiceIndicator := 'A2';
                 if ASaturdayDelivery then AServiceClass := '323' else AServiceClass := '322';
               end;
             end // end case
          else
             begin
               if AShipperRelease then
                  begin
                    if ASaturdayDelivery then AServiceIndicator := 'PG' else AServiceIndicator := 'NT';
                    if ASaturdayDelivery then AServiceClass := '719' else AServiceClass := '698';
                  end
               else
                  begin
                    if ASaturdayDelivery then AServiceIndicator := '44' else AServiceIndicator := '01';
                    if ASaturdayDelivery then AServiceClass := '044' else AServiceClass := '001';
                  end;
             end;
        end;

      // UPS NEXT DAY AIR SAVER ('13')
      upsNextDayAirSaver:
        begin
          AServiceIcon := '1P';
          if AShipperRelease then
             begin
               AServiceIndicator := 'NW';
               AServiceClass := '700';
             end
          else
             begin
               AServiceIndicator := '13';
               AServiceClass := '013';
             end;

          if ADeliveryConfirmation then
             case ASignatureOption of
              usoNoSignature:
               begin
                 if AShipperRelease then
                    begin
                      AServiceIndicator := 'P5';
                      AServiceClass := '709';
                    end
                 else
                    begin
                      AServiceIndicator := '30';
                      AServiceClass := '030';
                    end;
               end;
              usoAnySignature:
               begin
                 AServiceIndicator := '29';
                 AServiceClass := '029';
               end;
              usoAdultSignature:
               begin
                 AServiceIndicator := 'A4';
                 AServiceClass := '324';
               end;
             end; // end case
        end;

      // UPS 2ND DAY AIR A.M. ('59')
      upsSecondDayAirAM:
        begin
          AServiceIcon := '2A';
          if AShipperRelease then
             begin
               AServiceIndicator := 'P0';
               AServiceClass := '704';
             end
          else
             begin
               AServiceIndicator := '07';
               AServiceClass := '007';
             end;

          if ADeliveryConfirmation then
             case ASignatureOption of
              usoNoSignature:
               begin
                 if AShipperRelease then
                    begin
                      AServiceIndicator := 'P7';
                      AServiceClass := '711';
                    end
                 else
                    begin
                      AServiceIndicator := '18';
                      AServiceClass := '018';
                    end;
               end;
              usoAnySignature:
               begin
                 AServiceIndicator := '19';
                 AServiceClass := '019';
               end;
              usoAdultSignature:
               begin
                 AServiceIndicator := 'A5';
                 AServiceClass := '325';
               end;
             end; // end case
        end;

      // UPS 2ND DAY AIR ('02')
      upsSecondDayAir:
        begin
          if AShipperRelease then
             begin
               if ASaturdayDelivery then AServiceIcon := '2 S' else AServiceIcon := '2';
               if ASaturdayDelivery then AServiceIndicator := 'T3' else AServiceIndicator := 'NY';
               if ASaturdayDelivery then AServiceClass := '835' else AServiceClass := '702';
             end
          else
             begin
               if ASaturdayDelivery then AServiceIcon := '2 S' else AServiceIcon := '2';
               if ASaturdayDelivery then AServiceIndicator := 'PW' else AServiceIndicator := '02';
               if ASaturdayDelivery then AServiceClass := '732' else AServiceClass := '002';
             end;
          if ADeliveryConfirmation then
             case ASignatureOption of
              usoNoSignature:
               begin
                 if AShipperRelease then
                    begin
                      if ASaturdayDelivery then AServiceIndicator := 'T7' else AServiceIndicator := 'P6';
                      if ASaturdayDelivery then AServiceClass := '839' else AServiceClass := '710';
                    end
                 else
                    begin
                      if ASaturdayDelivery then AServiceIndicator := 'PY' else AServiceIndicator := '36';
                      if ASaturdayDelivery then AServiceClass := '734' else AServiceClass := '036';
                    end;
               end;
              usoAnySignature:
               begin
                 if ASaturdayDelivery then AServiceIndicator := 'T0' else AServiceIndicator := '35';
                 if ASaturdayDelivery then AServiceClass := '832' else AServiceClass := '035';
               end;
              usoAdultSignature:
               begin
                 if ASaturdayDelivery then AServiceIndicator := 'T1' else AServiceIndicator := 'A6';
                 if ASaturdayDelivery then AServiceClass := '833' else AServiceClass := '326';
               end;
             end; // end case
        end;

      // UPS 3 DAY SELECT ('12')
      upsThreeDaySelect:
        begin
          AServiceIcon := '3';
          if AShipperRelease then
             begin
               AServiceIndicator := 'P1';
               AServiceClass := '705';
             end
          else
             begin
               AServiceIndicator := '12';
               AServiceClass := '012';
             end;
          if ADeliveryConfirmation then
             case ASignatureOption of
              usoNoSignature:
               begin
                 if AShipperRelease then
                    begin
                      AServiceIndicator := 'P8';
                      AServiceClass := '712';
                    end
                 else
                    begin
                      AServiceIndicator := '40';
                      AServiceClass := '040';
                    end;
               end;
              usoAnySignature:
               begin
                 AServiceIndicator := '39';
                 AServiceClass := '039';
               end;
              usoAdultSignature:
               begin
                 AServiceIndicator := 'A7';
                 AServiceClass := '327';
               end;
             end; // end case
        end;

      // UPS GROUND ('03')
      upsGround:
        begin
          if AShipperRelease then
             begin
               AServiceIcon := ''; // this will be a black square (a graphic)
               AServiceIndicator := 'P2';
               AServiceClass := '706';
             end
          else
             begin
               AServiceIcon := ''; // this will be a black square (a graphic)
               AServiceIndicator := '03';
               AServiceClass := '003';
             end;

          if ADeliveryConfirmation then
             case ASignatureOption of
              usoNoSignature:
               begin
                 if AShipperRelease then
                    begin
                      AServiceIndicator := 'P9';
                      AServiceClass := '713';
                    end
                 else
                    begin
                      AServiceIndicator := '43';
                      AServiceClass := '043';
                    end;
               end;
              usoAnySignature:
               begin
                 AServiceIndicator := '42';
                 AServiceClass := '042';
               end;
              usoAdultSignature:
               begin
                 AServiceIndicator := 'A8';
                 AServiceClass := '328';
               end;
             end; // end case
        end;
      end; // end case
  end; // end if

 // ----------------------------------------------------------------------------
 // US - International
 // ----------------------------------------------------------------------------
 if ((AShipFromCountryCode = 'US') or (AShipFromCountryCode = 'PR')) and
    (AShipToCountryCode <> 'US') then
    begin
     case AUPSService of

      // UPS EXPRESS PLUS ('54')
      upsWorldwideExpressPlus:
       begin
          if ASaturdayDelivery then AServiceIcon := '1+S' else AServiceIcon := '1+';
          if ASaturdayDelivery then AServiceIndicator := '34' else AServiceIndicator := '54';
          if ASaturdayDelivery then AServiceClass := '034' else AServiceClass := '054';
          if ADeliveryConfirmation then
             case ASignatureOption of
              usoAnySignature:
               begin
                 if ASaturdayDelivery then AServiceIndicator := 'G4' else AServiceIndicator := 'G1';
                 if ASaturdayDelivery then AServiceClass := '484' else AServiceClass := '481';
               end;
              usoAdultSignature:
               begin
                 if ASaturdayDelivery then AServiceIndicator := 'G8' else AServiceIndicator := 'G5';
                 if ASaturdayDelivery then AServiceClass := '488' else AServiceClass := '485';
               end;
             end; // end case
       end;

      // UPS EXPRESS ('07')
      upsWorldwideExpress:
       begin
          if ASaturdayDelivery then AServiceIcon := '1 S' else AServiceIcon := '1';
          if ASaturdayDelivery then AServiceIndicator := '69' else AServiceIndicator := '66';
          if ASaturdayDelivery then AServiceClass := '069' else AServiceClass := '066';
          if ADeliveryConfirmation then
             case ASignatureOption of
              usoAnySignature:
               begin
                 if ASaturdayDelivery then AServiceIndicator := 'D6' else AServiceIndicator := 'D3';
                 if ASaturdayDelivery then AServiceClass := '390' else AServiceClass := '387';
               end;
              usoAdultSignature:
               begin
                 if ASaturdayDelivery then AServiceIndicator := 'D7' else AServiceIndicator := 'D4';
                 if ASaturdayDelivery then AServiceClass := '391' else AServiceClass := '388';
               end;
             end; // end case
       end;

      // UPS SAVER ('65')
      upsWorldwideSaver:
       begin
          AServiceIcon := '1 P';
          AServiceIndicator := '04';
          AServiceClass := '004';
          if ADeliveryConfirmation then
             case ASignatureOption of
              usoAnySignature:
               begin
                 AServiceIndicator := 'D9';
                 AServiceClass := '393';
               end;
              usoAdultSignature:
               begin
                 AServiceIndicator := 'DA';
                 AServiceClass := '394';
               end;
             end; // end case
       end;

      // UPS EXPEDITED ('08')
      upsWorldwideExpedited:
       begin
          AServiceIcon := '2';
          AServiceIndicator := '67';
          AServiceClass := '067';
          if ADeliveryConfirmation then
             case ASignatureOption of
              usoAnySignature:
               begin
                 AServiceIndicator := 'DG';
                 AServiceClass := '399';
               end;
              usoAdultSignature:
               begin
                 AServiceIndicator := 'DH';
                 AServiceClass := '400';
               end;
             end; // end case
       end;

      // UPS STANDARD ('11')
      upsStandard:
       begin
          AServiceIcon := ''; // black square
          AServiceIndicator := '68';
          AServiceClass := '068';
          if ADeliveryConfirmation then
             case ASignatureOption of
              usoAnySignature:
               begin
                 AServiceIndicator := 'DK';
                 AServiceClass := '402';
               end;
              usoAdultSignature:
               begin
                 AServiceIndicator := 'DL';
                 AServiceClass := '403';
               end;
             end; // end case
       end;

     end; // end case
    end; // end if

    {upsNextDayAir,             // '01'
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
     upsWorldwideSaver          // '65'}




(*

  // The "Americas"
  else if (AShipFromCountryCode = 'US') and
    ((AShipToCountryCode = 'DO') {or (AShipToCountryCode = 'PR')}) then
    begin
      // UPS EXPRESS PLUS
      if (APackageServiceCode = '54') then // upsWorldwideExpressPlus
        begin
          if ASaturdayDelivery then AServiceIcon := '1+S' else AServiceIcon := '1+';
    {usoNoSignature, // No signature required
     usoAnySignature, // Signature Required
     usoAdultSignature // Adult Signature Required}
          case ASignatureOption of
           usoNone:
            begin
              if ASaturdayDelivery then AServiceIndicator := '34' else AServiceIndicator := '54';
              if ASaturdayDelivery then AServiceClass := '034' else AServiceClass := '054';
            end;
           usoRequired:
            begin
              if ASaturdayDelivery then AServiceIndicator := 'G4' else AServiceIndicator := 'G1';
              if ASaturdayDelivery then AServiceClass := '484' else AServiceClass := '481';
            end;
           usoAdult:
            begin
              if ASaturdayDelivery then AServiceIndicator := 'G8' else AServiceIndicator := 'G5';
              if ASaturdayDelivery then AServiceClass := '488' else AServiceClass := '485';
            end;
          end; // end case
        end
      // UPS EXPRESS
      else if (APackageServiceCode = '07') then // upsWorldwideExpress
        begin
          if ASaturdayDelivery then AServiceIcon := '1 S' else AServiceIcon := '1';
          case ASignatureOption of
           usoNone:
            begin
              if ASaturdayDelivery then AServiceIndicator := '69' else AServiceIndicator := '66';
              if ASaturdayDelivery then AServiceClass := '069' else AServiceClass := '066';
            end;
           usoRequired:
            begin
              if ASaturdayDelivery then AServiceIndicator := 'D6' else AServiceIndicator := 'D3';
              if ASaturdayDelivery then AServiceClass := '390' else AServiceClass := '387';
            end;
           usoAdult:
            begin
              if ASaturdayDelivery then AServiceIndicator := 'D7' else AServiceIndicator := 'D4';
              if ASaturdayDelivery then AServiceClass := '391' else AServiceClass := '388';
            end;
          end; // end case
        end
      // UPS SAVER
      else if (APackageServiceCode = '13') or  // upsNextDayAirSaver
              (APackageServiceCode = '65') then // upsWorldwideSaver
        begin
          AServiceIcon := '1 P';
          case ASignatureOption of
           usoNone:
            begin
              AServiceIndicator := '04';
              AServiceClass := '004';
            end;
           usoRequired:
            begin
              AServiceIndicator := 'D9';
              AServiceClass := '393';
            end;
           usoAdult:
            begin
              AServiceIndicator := 'DA';
              else AServiceClass := '394';
            end;
          end; // end case
        end
      // UPS EXPEDITED
      else if (APackageServiceCode = '08') then // upsWorldwideExpedited
        begin
          AServiceIcon := '2';
          case ASignatureOption of
           usoNone:
            begin
              AServiceIndicator := '67';
              AServiceClass := '067';
            end;
           usoRequired:
            begin
              AServiceIndicator := 'DG';
              AServiceClass := '399';
            end;
           usoAdult:
            begin
              AServiceIndicator := 'DH';
              else AServiceClass := '400';
            end;
          end; // end case
        end;
    end;

 // Candada - Domestic
 if (AShipToCountryCode = 'CA') and (AShipFromCountryCode = 'CA') then
    begin
      // UPS EXPRESS EARLY A.M.
      if (APackageServiceCode = '14') then // upsNextDayAirEarlyAM
        begin
          if ASaturdayDelivery then AServiceIcon := '1+S' else AServiceIcon := '1+';
          case ASignatureOption of
           usoNone:
            begin
              if ASaturdayDelivery then AServiceIndicator := '41' else AServiceIndicator := '15';
              if ASaturdayDelivery then AServiceClass := '041' else AServiceClass := '015';
            end;
           usoRequired:
            begin
              if ASaturdayDelivery then AServiceIndicator := 'D6' else AServiceIndicator := 'D3';
              if ASaturdayDelivery then AServiceClass := '390' else AServiceClass := '387';
            end;
           usoAdult:
            begin
              if ASaturdayDelivery then AServiceIndicator := 'D7' else AServiceIndicator := 'D4';
              if ASaturdayDelivery then AServiceClass := '391' else AServiceClass := '388';
            end;
          end; // end case
        end
      // UPS EXPRESS
      else if (APackageServiceCode = '07') or    // upsWorldwideExpress
              (APackageServiceCode = '54') then  // upsWorldwideExpressPlus
        begin
          if ASaturdayDelivery then AServiceIcon := '1 S' else AServiceIcon := '1';
        end
      // UPS SAVER
      else if (APackageServiceCode = '13') or  // upsNextDayAirSaver
              (APackageServiceCode = '65') then // upsWorldwideSaver
        begin
          if ASaturdayDelivery then AServiceIcon := '1PS' else AServiceIcon := '1P';
        end
      // UPS EXPEDITED
      else if (APackageServiceCode = '08') then // upsWorldwideExpedited
        begin
          AServiceIcon := '2';
        end;
    end;

 // Candada to U.S.
 if (AShipFromCountryCode = 'CA') and
    ((AShipToCountryCode = 'US') or (AShipToCountryCode = 'MX')) then
    begin
      // UPS EXPRESS EARLY A.M.
      if (APackageServiceCode = '54') then // upsWorldwideExpressPlus
        begin
          if ASaturdayDelivery then AServiceIcon := '1+S' else AServiceIcon := '1+';
        end
      // UPS EXPRESS
      else if (APackageServiceCode = '07') then // upsWorldwideExpress
        begin
          if ASaturdayDelivery then AServiceIcon := '1 S' else AServiceIcon := '1';
        end
      // UPS SAVER
      else if (APackageServiceCode = '65') then // upsWorldwideSaver
        begin
          if ASaturdayDelivery then AServiceIcon := '1PS' else AServiceIcon := '1P';
        end
      // UPS 3 DAY SELECT
      else if (APackageServiceCode = '12') then // upsThreeDaySelect
        begin
          AServiceIcon := '3';
        end
      // UPS EXPEDITED
      else if (APackageServiceCode = '08') then // upsWorldwideExpedited
        begin
          AServiceIcon := '2';
        end;
    end;

 // Canada International
 if (AShipFromCountryCode = 'CA') and
    (AShipToCountryCode <> 'US') and
    (AShipToCountryCode <> 'CA') then
    begin
      // UPS EXPRESS PLUS
      if (APackageServiceCode = '54') then // upsWorldwideExpressPlus
        begin
          if ASaturdayDelivery then AServiceIcon := '1+S' else AServiceIcon := '1+';
        end
      // UPS EXPRESS
      else if (APackageServiceCode = '07') then // upsWorldwideExpress
        begin
          if ASaturdayDelivery then AServiceIcon := '1 S' else AServiceIcon := '1';
        end
      // UPS SAVER
      else if (APackageServiceCode = '65') then // upsWorldwideSaver
        begin
          AServiceIcon := '1 P';
        end
      // UPS EXPEDITED
      else if (APackageServiceCode = '08') then // upsWorldwideExpedited
        begin
          AServiceIcon := '2';
        end;
    end;

*)
end;

end.

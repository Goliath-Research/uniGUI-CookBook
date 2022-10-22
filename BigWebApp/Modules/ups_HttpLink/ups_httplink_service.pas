unit ups_httplink_service;

interface

uses
  System.Classes,
  System.SysUtils,
  MaskUtils,
  ups_httplink_typelib;

type
  TUPSSrvRetrieval = class(TComponent)
  private
    {Private declarations}
    FShpRls: Boolean;
    FSatDeliv: Boolean;
    FDlvConf: Boolean;
    FRtn: Boolean;
    FFlex: Boolean;
    FImportControl: Boolean;
    FSvcClass: String;
    FSndCntry: String;
    FSvcInd: String;
    FSvcIcon: String;
    FRcpCntry: String;
    FUPSService: TUPSService;
    FSigOpt: TUPSSignatureOption;
    FPckup: TPickupAttemptsByte;
    FCOD: Boolean;
    FExh: Boolean;
    FPack: Boolean;
    FProactiveResponse: Boolean;

    // Sender = US
    procedure Proc_USDomestic;
    procedure Proc_USDomesticCOD;
    procedure Proc_USDomesticShipperRelease;
    procedure Proc_USDomesticReturn;
    procedure Proc_USInternational;
    procedure Proc_USInternationalCOD;
    procedure Proc_USInternationalReturn;
    procedure Proc_USDomesticReturnsExchange;
    procedure Proc_USIntlReturnsExchange;
    procedure Proc_USPackCollect;

    // Sender = PR
    procedure Proc_PRDomesticCOD;
    procedure Proc_PRDomesticShipperRelease;
    procedure Proc_USInternationalImportControl;

  protected
    {Protected declarations}
  public
    {Public declarations}
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure Execute;
    procedure Clear;
  published
    {Published declarations}
    // Supplied values
    property SenderCountryCode: String read FSndCntry write FSndCntry;
    property RecipientCountryCode: String read FRcpCntry write FRcpCntry;
    property UPSService: TUPSService read FUPSService write FUPSService;
    property SaturdayDelivery: Boolean read FSatDeliv write FSatDeliv;
    property DeliveryConfirmation: Boolean read FDlvConf write FDlvConf;
    property SignatureOption: TUPSSignatureOption read FSigOpt write FSigOpt;
    property ShipperRelease: Boolean read FShpRls write FShpRls;
    property ReturnService: Boolean read FRtn write FRtn;
    property FlexibleAccess: Boolean read FFlex write FFlex;
    property ImportControl: Boolean read FImportControl write FImportControl;
    property PickupAttempts: TPickupAttemptsByte read FPckup write FPckup;
    property COD: Boolean read FCOD write FCOD;
    property ReturnsExchange: Boolean read FExh write FExh;
    property PackCollect: Boolean read FPack write FPack;
    property ProactiveResponse: Boolean read FProactiveResponse
     write FProactiveResponse;
    // Returned values
    property ServiceIcon: String read FSvcIcon write FSvcIcon;
    property ServiceIndicator: String read FSvcInd write FSvcInd;
    property ServiceClass: String read FSvcClass write FSvcClass;

end;


implementation

uses
  IQMS.Common.StringUtils;

{ TUPSSrvRetrieval }

constructor TUPSSrvRetrieval.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Clear;
end;

destructor TUPSSrvRetrieval.Destroy;
begin

  inherited Destroy;
end;

procedure TUPSSrvRetrieval.Clear;
begin
  FShpRls := False;
  FSatDeliv := False;
  FDlvConf := False;
  FRtn := False;
  FImportControl := False;
  FSvcClass := '';
  FSndCntry := '';
  FSvcInd := '';
  FSvcIcon := '';
  FRcpCntry := '';
  FUPSService := TUPSService(0);
  FSigOpt := TUPSSignatureOption(0);
  FPckup := TPickupAttemptsByte(0);
  FCOD := False;
end;

procedure TUPSSrvRetrieval.Execute;
var
  ATemp: String;
begin
{
    property SenderCountryCode: String read FSndCntry write FSndCntry;
    property RecipientCountryCode: String read FRcpCntry write FRcpCntry;
    property UPSService: TUPSService read FUPSService write FUPSService;
    property SaturdayDelivery: Boolean read FSatDeliv write FSatDeliv;
    property DeliveryConfirmation: Boolean read FDlvConf write FDlvConf;
    property SignatureOption: TUPSSignatureOption read FSigOpt write FSigOpt;
    property ShipperRelease: Boolean read FShpRls write FShpRls;
    property ReturnService: Boolean read FRtn write FRtn;
}
 if (FRtn) then
  begin
    ATemp := FSndCntry;
    FSndCntry := FRcpCntry;
    FRcpCntry := ATemp;
  end;

 if (FSndCntry = 'US') and IQMS.Common.StringUtils.StrInList(FRcpCntry, ['US']) then //Phillip separated US, PR
    begin
      if FExh then
        Proc_USDomesticReturnsExchange
      else if FShpRls then
         Proc_USDomesticShipperRelease
      else if FRtn then
         Proc_USDomesticReturn
      else if FCOD then
         Proc_USDomesticCOD
      else Proc_USDomestic;
    end
 else if (FSndCntry = 'US') and IQMS.Common.StringUtils.StrInList(FRcpCntry, ['PR']) then
    begin
      if FShpRls then
         Proc_USDomesticShipperRelease
      else if FRtn then
        begin
         Proc_USDomesticReturn;
         if (FSvcClass = '') then
           Proc_USInternationalReturn;
        end
      else if FCOD then
        begin
         Proc_USDomesticCOD;
         if (FSvcClass = '') then
           Proc_USInternationalCOD;
        end
      else
        begin
          Proc_USDomestic;
          if (FSvcClass = '') then
            Proc_USInternational;
        end;

    end
 else if (FSndCntry = 'PR') and IQMS.Common.StringUtils.StrInList(FRcpCntry, ['US','PR']) then
    begin
      if FShpRls then
         Proc_PRDomesticShipperRelease
      else if FRtn then
         Proc_USDomesticReturn
      else if FCOD then
         Proc_PRDomesticCOD
      else Proc_USDomestic;
    end
 else if IQMS.Common.StringUtils.StrInList(FSndCntry, ['US','PR']) and (FRcpCntry <> 'US') then
    begin
      if FExh then
        Proc_USIntlReturnsExchange
      else if FPack then
        Proc_USPackCollect
      else if FRtn then
       Proc_USInternationalReturn
      else if FImportControl then
         Proc_USInternationalImportControl
      else if FCOD then
         Proc_USInternationalCOD
      else
         Proc_USInternational;
    end;
end;

procedure TUPSSrvRetrieval.Proc_USDomestic;
begin
 // ----------------------------------------------------------------------------
 // US - Domestic
 // ----------------------------------------------------------------------------

 case FUPSService of

  // UPS EARLY AM (14)
  upsNextDayAirEarlyAM:
    begin
      if FSatDeliv then FSvcIcon := '1+S' else FSvcIcon := '1+';
      if not FDlvConf then
        begin
          if FSatDeliv then FSvcInd := '41' else FSvcInd := '15';
          if FSatDeliv then FSvcClass := '041' else FSvcClass := '015';
        end
      else
        begin
          if FSatDeliv then FSvcInd := 'A1' else FSvcInd := 'A0';
          if FSatDeliv then FSvcClass := '321' else FSvcClass := '320';
        end;
    end;

  // UPS NEXT DAY AIR ('01')
  upsNextDayAir:
    begin
      if FSatDeliv then FSvcIcon := '1 S' else FSvcIcon := '1';

      if FDlvConf then
         case FSigOpt of
          usoNoSignature:
           begin
             if FSatDeliv then FSvcInd := '47' else FSvcInd := '25';
             if FSatDeliv then FSvcClass := '047' else FSvcClass := '025';
           end;
          usoAnySignature:
           begin
             if FSatDeliv then FSvcInd := '58' else FSvcInd := '24';
             if FSatDeliv then FSvcClass := '058' else FSvcClass := '024';
           end;
          usoAdultSignature:
           begin
             if FSatDeliv then FSvcInd := 'A3' else FSvcInd := 'A2';
             if FSatDeliv then FSvcClass := '323' else FSvcClass := '322';
           end;
         end // end case
      else
         begin
           if FSatDeliv then FSvcInd := '44' else FSvcInd := '01';
           if FSatDeliv then FSvcClass := '044' else FSvcClass := '001';
         end;
    end;

  // UPS NEXT DAY AIR SAVER ('13')
  upsNextDayAirSaver:
    begin
      FSvcIcon := '1P';
      FSvcInd := '13';
      FSvcClass := '013';

      if FDlvConf then
         case FSigOpt of
          usoNoSignature:
           begin
             FSvcInd := '30';
             FSvcClass := '030';
           end;
          usoAnySignature:
           begin
             FSvcInd := '29';
             FSvcClass := '029';
           end;
          usoAdultSignature:
           begin
             FSvcInd := 'A4';
             FSvcClass := '324';
           end;
         end; // end case
    end;

  // UPS 2ND DAY AIR A.M. ('59')
  upsSecondDayAirAM:
    begin
      FSvcIcon := '2 A';
      FSvcInd := '07';
      FSvcClass := '007';

      if FDlvConf then
         case FSigOpt of
          usoNoSignature:
           begin
             FSvcInd := '18';
             FSvcClass := '018';
           end;
          usoAnySignature:
           begin
             FSvcInd := '19';
             FSvcClass := '019';
           end;
          usoAdultSignature:
           begin
             FSvcInd := 'A5';
             FSvcClass := '325';
           end;
         end; // end case
    end;

  // UPS 2ND DAY AIR ('02')
  upsSecondDayAir:
    begin
      if FSatDeliv then FSvcIcon := '2 S' else FSvcIcon := '2';
      if FSatDeliv then FSvcInd := 'PW' else FSvcInd := '02';
      if FSatDeliv then FSvcClass := '732' else FSvcClass := '002';
      if FDlvConf then
         case FSigOpt of
          usoNoSignature:
           begin
             if FSatDeliv then FSvcInd := 'PY' else FSvcInd := '36';
             if FSatDeliv then FSvcClass := '734' else FSvcClass := '036';
           end;
          usoAnySignature:
           begin
             if FSatDeliv then FSvcInd := 'T0' else FSvcInd := '35';
             if FSatDeliv then FSvcClass := '832' else FSvcClass := '035';
           end;
          usoAdultSignature:
           begin
             if FSatDeliv then FSvcInd := 'T1' else FSvcInd := 'A6';
             if FSatDeliv then FSvcClass := '833' else FSvcClass := '326';
           end;
         end; // end case
    end;

  // UPS 3 DAY SELECT ('12')
  upsThreeDaySelect:
    begin
      FSvcIcon := '3';
      FSvcInd := '12';
      FSvcClass := '012';
      if FDlvConf then
         case FSigOpt of
          usoNoSignature:
           begin
             FSvcInd := '40';
             FSvcClass := '040';
           end;
          usoAnySignature:
           begin
             FSvcInd := '39';
             FSvcClass := '039';
           end;
          usoAdultSignature:
           begin
             FSvcInd := 'A7';
             FSvcClass := '327';
           end;
         end; // end case
    end;

  // UPS GROUND ('03')
  upsGround:
    begin
      FSvcIcon := ''; // this will be a black square (a graphic)
      FSvcInd := '03';
      FSvcClass := '003';

      if FDlvConf then
         case FSigOpt of
          usoNoSignature:
           begin
             if FShpRls then
                begin
                  FSvcInd := 'P9';
                  FSvcClass := '713';
                end
             else
                begin
                  FSvcInd := '43';
                  FSvcClass := '043';
                end;
           end;
          usoAnySignature:
           begin
             FSvcInd := '42';
             FSvcClass := '042';
           end;
          usoAdultSignature:
           begin
             FSvcInd := 'A8';
             FSvcClass := '328';
           end;
         end; // end case
    end;
  end; // end case
end;

procedure TUPSSrvRetrieval.Proc_USDomesticReturn;
begin
  // Return Service = upsNextDayAirEarlyAM, upsNextDayAir, upsSecondDayAir, upsThreeDaySelect, upsGround
  case FUPSService of

   // UPS EARLY AM (14)
   upsNextDayAirEarlyAM:
     begin
       if FProactiveResponse then
          begin
            FSvcIcon := '1+';
            FSvcInd := 'V2';
            FSvcClass := '866';
            Exit;
          end
       else
        if FSatDeliv then
          begin
            FSvcIcon := '1+S';
            FSvcInd := 'WT';
            FSvcClass := '922';
          end
        else
          begin
            FSvcIcon := '1+';
            FSvcInd := 'V1';
            FSvcClass := '865';
          end;

       case FPckup of
        1..2:
          if FSatDeliv then
           begin
             FSvcIcon := '1+S';
             FSvcInd := 'WW';
             FSvcClass := '924';
           end
          else
           begin
             FSvcIcon := '1+';
             FSvcInd := 'TY';
             FSvcClass := '862';
           end;
        3:
          if FSatDeliv then
           begin
             FSvcIcon := '1+S';
             FSvcInd := 'WY';
             FSvcClass := '926';
           end
          else
           begin
             FSvcIcon := '1+';
             FSvcInd := 'V0';
             FSvcClass := '864';
           end;
       end; // end case pckup
     end;

   // UPS NEXT DAY AIR ('01')
   upsNextDayAir:
     begin
       if FProactiveResponse then
          begin
            FSvcIcon := '1';
            FSvcInd := 'V3';
            FSvcClass := '867';
            Exit;
          end
       else
        if FSatDeliv then
          begin
            FSvcIcon := '1 S';
            FSvcInd := 'Y0';
            FSvcClass := '960';
          end
        else
          begin
            FSvcIcon := '1';
            FSvcInd := '84';
            FSvcClass := '084';
          end;

       case FPckup of
        1..2:
         if FSatDeliv then
           begin
             FSvcIcon := '1 S';
             FSvcInd := 'Y1';
             FSvcClass := '961';
           end
         else
           begin
             FSvcIcon := '1';
             FSvcInd := '09';
             FSvcClass := '009';
           end;
        3:
         if FSatDeliv then
           begin
             FSvcIcon := '1 S';
             FSvcInd := 'Y2';
             FSvcClass := '962';
           end
         else
           begin
             FSvcIcon := '1';
             FSvcInd := '28';
             FSvcClass := '028';
           end;
       end; // end case pckup
     end;

   // UPS 2ND DAY AIR ('02')
   upsSecondDayAir:
     begin
      if FSatDeliv then
        begin
         FSvcIcon := '2 S';
         FSvcInd := 'Y3';
         FSvcClass := '963';
        end
      else
        begin
         FSvcIcon := '2';
         FSvcInd := '87';
         FSvcClass := '087';
        end;
       case FPckup of
        1..2:
         if FSatDeliv then
           begin
             FSvcIcon := '2 S';
             FSvcInd := 'Y4';
             FSvcClass := '964';
           end
         else
           begin
             FSvcIcon := '2';
             FSvcInd := '11';
             FSvcClass := '011';
           end;
        3:
         if FSatDeliv then
           begin
             FSvcIcon := '2 S';
             FSvcInd := 'Y5';
             FSvcClass := '965';
           end
         else
           begin
             FSvcIcon := '2';
             FSvcInd := '52';
             FSvcClass := '052';
           end;
       end; // end case pckup
     end;

   // UPS 3 DAY SELECT ('12')
   upsThreeDaySelect:
     begin
       FSvcIcon := '3';
       FSvcInd := '89';
       FSvcClass := '089';
       case FPckup of
        1..2:
         begin
           FSvcInd := '16';
           FSvcClass := '016';
         end;
        3:
         begin
           FSvcInd := '50';
           FSvcClass := '050';
         end;
       end; // end case pckup
     end;

   // UPS GROUND ('03')
   upsGround:
     begin
       FSvcIcon := ''; // black square
       FSvcInd := '90';
       FSvcClass := '090';
       if (not FFlex) then
         case FPckup of
          1..2:
           begin
             FSvcInd := '78';
             FSvcClass := '078';
           end;
          3:
           begin
             FSvcInd := '26';
             FSvcClass := '026';
           end;
         end; // end case pckup
     end;
   end; // end case
end;

procedure TUPSSrvRetrieval.Proc_USDomesticShipperRelease;
begin
  case FUPSService of

   // UPS EARLY AM (14)
   upsNextDayAirEarlyAM:
     begin
       if FSatDeliv then FSvcIcon := '1+S' else FSvcIcon := '1+';
       if not FDlvConf then
         begin
           if FSatDeliv then FSvcInd := 'PA' else FSvcInd := 'NP';
           if FSatDeliv then FSvcClass := '714' else FSvcClass := '694';
         end
       else
         begin
           if FSatDeliv then FSvcInd := 'A1' else FSvcInd := 'A0';
           if FSatDeliv then FSvcClass := '321' else FSvcClass := '320';
         end;
     end;

   // UPS NEXT DAY AIR ('01')
   upsNextDayAir:
     begin
       if FSatDeliv then FSvcIcon := '1 S' else FSvcIcon := '1';

       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              if FSatDeliv then FSvcInd := 'PN' else FSvcInd := 'P4';
              if FSatDeliv then FSvcClass := '725' else FSvcClass := '708';
            end;
           usoAnySignature:
            begin
              if FSatDeliv then FSvcInd := '58' else FSvcInd := '24';
              if FSatDeliv then FSvcClass := '058' else FSvcClass := '024';
            end;
           usoAdultSignature:
            begin
              if FSatDeliv then FSvcInd := 'A3' else FSvcInd := 'A2';
              if FSatDeliv then FSvcClass := '323' else FSvcClass := '322';
            end;
          end // end case
       else
          begin
            if FSatDeliv then FSvcInd := 'PG' else FSvcInd := 'NT';
            if FSatDeliv then FSvcClass := '719' else FSvcClass := '698';
          end;
     end;

   // UPS NEXT DAY AIR SAVER ('13')
   upsNextDayAirSaver:
     begin
       FSvcIcon := '1P';
       FSvcInd := 'NW';
       FSvcClass := '700';

       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              FSvcInd := 'P5';
              FSvcClass := '709';
            end;
           usoAnySignature:
            begin
              FSvcInd := '29';
              FSvcClass := '029';
            end;
           usoAdultSignature:
            begin
              FSvcInd := 'A4';
              FSvcClass := '324';
            end;
          end; // end case
     end;

   // UPS 2ND DAY AIR A.M. ('59')
   upsSecondDayAirAM:
     begin
       FSvcIcon := '2 A';
       FSvcInd := 'P0';
       FSvcClass := '704';

       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              FSvcInd := 'P7';
              FSvcClass := '711';
            end;
           usoAnySignature:
            begin
              FSvcInd := '19';
              FSvcClass := '019';
            end;
           usoAdultSignature:
            begin
              FSvcInd := 'A5';
              FSvcClass := '325';
            end;
          end; // end case
     end;

   // UPS 2ND DAY AIR ('02')
   upsSecondDayAir:
     begin
       if FSatDeliv then FSvcIcon := '2 S' else FSvcIcon := '2';
       if FSatDeliv then FSvcInd := 'T3' else FSvcInd := 'NY';
       if FSatDeliv then FSvcClass := '835' else FSvcClass := '702';

       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              if FSatDeliv then FSvcInd := 'T7' else FSvcInd := 'P6';
              if FSatDeliv then FSvcClass := '839' else FSvcClass := '710';
            end;
           usoAnySignature:
            begin
              if FSatDeliv then FSvcInd := 'T0' else FSvcInd := '35';
              if FSatDeliv then FSvcClass := '832' else FSvcClass := '035';
            end;
           usoAdultSignature:
            begin
              if FSatDeliv then FSvcInd := 'T1' else FSvcInd := 'A6';
              if FSatDeliv then FSvcClass := '833' else FSvcClass := '326';
            end;
          end; // end case
     end;

   // UPS 3 DAY SELECT ('12')
   upsThreeDaySelect:
     begin
       FSvcIcon := '3';
       FSvcInd := 'P1';
       FSvcClass := '705';
       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              FSvcInd := 'P8';
              FSvcClass := '712';
            end;
           usoAnySignature:
            begin
              FSvcInd := '39';
              FSvcClass := '039';
            end;
           usoAdultSignature:
            begin
              FSvcInd := 'A7';
              FSvcClass := '327';
            end;
          end; // end case
     end;

   // UPS GROUND ('03')
   upsGround:
     begin
       FSvcIcon := ''; // this will be a black square (a graphic)
       FSvcInd := 'P2';
       FSvcClass := '706';

       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              FSvcInd := 'P9';
              FSvcClass := '713';
            end;
           usoAnySignature:
            begin
              FSvcInd := '42';
              FSvcClass := '042';
            end;
           usoAdultSignature:
            begin
              FSvcInd := 'A8';
              FSvcClass := '328';
            end;
          end; // end case
     end;
   end; // end case
end;

procedure TUPSSrvRetrieval.Proc_PRDomesticShipperRelease;
begin
  case FUPSService of

   // UPS EARLY AM (14)
   upsNextDayAirEarlyAM:
     begin
       if FSatDeliv then FSvcIcon := '1+S' else FSvcIcon := '1+';
       if not FDlvConf then
         begin
           if FSatDeliv then FSvcInd := 'PA' else FSvcInd := 'NP';
           if FSatDeliv then FSvcClass := '714'
           else FSvcClass := '649';
         end
       else
         begin
           if FSatDeliv then FSvcInd := 'A1' else FSvcInd := 'A0';
           if FSatDeliv then FSvcClass := '321' else FSvcClass := '320';
         end;
     end;

   // UPS NEXT DAY AIR ('01')
   upsNextDayAir:
     begin
       if FSatDeliv then FSvcIcon := '1 S' else FSvcIcon := '1';

       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              if FSatDeliv then FSvcInd := 'PN' else FSvcInd := 'P4';
              if FSatDeliv then FSvcClass := '725' else FSvcClass := '708';
            end;
           usoAnySignature:
            begin
              if FSatDeliv then FSvcInd := '58' else FSvcInd := '24';
              if FSatDeliv then FSvcClass := '058' else FSvcClass := '024';
            end;
           usoAdultSignature:
            begin
              if FSatDeliv then FSvcInd := 'A3' else FSvcInd := 'A2';
              if FSatDeliv then FSvcClass := '323' else FSvcClass := '322';
            end;
          end // end case
       else
          begin
            if FSatDeliv then FSvcInd := 'PG' else FSvcInd := 'NT';
            if FSatDeliv then FSvcClass := '719' else FSvcClass := '698';
          end;
     end;

   // UPS NEXT DAY AIR SAVER ('13')
   upsNextDayAirSaver:
     begin
       FSvcIcon := '1P';
       FSvcInd := 'NW';
       FSvcClass := '700';

       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              FSvcInd := 'P5';
              FSvcClass := '709';
            end;
           usoAnySignature:
            begin
              FSvcInd := '29';
              FSvcClass := '029';
            end;
           usoAdultSignature:
            begin
              FSvcInd := 'A4';
              FSvcClass := '324';
            end;
          end; // end case
     end;

   // UPS 2ND DAY AIR A.M. ('59')
   upsSecondDayAirAM:
     begin
       FSvcIcon := '2 A';
       FSvcInd := 'P0';
       FSvcClass := '704';

       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              FSvcInd := 'P7';
              FSvcClass := '711';
            end;
           usoAnySignature:
            begin
              FSvcInd := '19';
              FSvcClass := '019';
            end;
           usoAdultSignature:
            begin
              FSvcInd := 'A5';
              FSvcClass := '325';
            end;
          end; // end case
     end;

   // UPS 2ND DAY AIR ('02')
   upsSecondDayAir:
     begin
       if FSatDeliv then FSvcIcon := '2 S' else FSvcIcon := '2';
       if FSatDeliv then FSvcInd := 'T3' else FSvcInd := 'NY';
       if FSatDeliv then FSvcClass := '835' else FSvcClass := '702';

       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              if FSatDeliv then FSvcInd := 'T7' else FSvcInd := 'P6';
              if FSatDeliv then FSvcClass := '839' else FSvcClass := '710';
            end;
           usoAnySignature:
            begin
              if FSatDeliv then FSvcInd := 'T0' else FSvcInd := '35';
              if FSatDeliv then FSvcClass := '832' else FSvcClass := '035';
            end;
           usoAdultSignature:
            begin
              if FSatDeliv then FSvcInd := 'T1' else FSvcInd := 'A6';
              if FSatDeliv then FSvcClass := '833' else FSvcClass := '326';
            end;
          end; // end case
     end;

   // UPS 3 DAY SELECT ('12')
   upsThreeDaySelect:
     begin
       FSvcIcon := '3';
       FSvcInd := 'P1';
       FSvcClass := '705';
       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              FSvcInd := 'P8';
              FSvcClass := '712';
            end;
           usoAnySignature:
            begin
              FSvcInd := '39';
              FSvcClass := '039';
            end;
           usoAdultSignature:
            begin
              FSvcInd := 'A7';
              FSvcClass := '327';
            end;
          end; // end case
     end;

   // UPS GROUND ('03')
   upsGround:
     begin
       FSvcIcon := ''; // this will be a black square (a graphic)
       FSvcInd := 'P2';
       FSvcClass := '706';

       if FDlvConf then
          case FSigOpt of
           usoNoSignature:
            begin
              FSvcInd := 'P9';
              FSvcClass := '713';
            end;
           usoAnySignature:
            begin
              FSvcInd := '42';
              FSvcClass := '042';
            end;
           usoAdultSignature:
            begin
              FSvcInd := 'A8';
              FSvcClass := '328';
            end;
          end; // end case
     end;
   end; // end case
end;

procedure TUPSSrvRetrieval.Proc_USDomesticCOD;
begin
 case FUPSService of

  // UPS EARLY AM (14)
  upsNextDayAirEarlyAM:
    begin
      if FSatDeliv then FSvcIcon := '1+S' else FSvcIcon := '1+';
      if FSatDeliv then FSvcInd := '33' else FSvcInd := '32';
      if FSatDeliv then FSvcClass := '033' else FSvcClass := '032';

      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           if FSatDeliv then FSvcInd := 'AA' else FSvcInd := 'A9';
           if FSatDeliv then FSvcClass := '330' else FSvcClass := '329';
         end;
    end;

  // UPS NEXT DAY AIR ('01')
  upsNextDayAir:
    begin
      if FSatDeliv then FSvcIcon := '1 S' else FSvcIcon := '1';
      if FSatDeliv then FSvcInd := '60' else FSvcInd := '59';
      if FSatDeliv then FSvcClass := '060' else FSvcClass := '059';

      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           if FSatDeliv then FSvcInd := 'AD' else FSvcInd := 'AC';
           if FSatDeliv then FSvcClass := '332' else FSvcClass := '331';
         end;
    end;

  // UPS NEXT DAY AIR SAVER ('13')
  upsNextDayAirSaver:
    begin
      FSvcIcon := '1P';
      FSvcInd := '62';
      FSvcClass := '062';
      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           FSvcInd := 'AE';
           FSvcClass := '333';
         end;
    end;

  // UPS 2ND DAY AIR A.M. ('59')
  upsSecondDayAirAM:
    begin
      FSvcIcon := '2 A';
      FSvcInd := '65';
      FSvcClass := '065';
      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           FSvcInd := 'AF';
           FSvcClass := '334';
         end;
    end;

  // UPS 2ND DAY AIR ('02')
  upsSecondDayAir:
    begin
      if FSatDeliv then FSvcIcon := '2 S' else FSvcIcon := '2';
      if FSatDeliv then FSvcInd := 'T2' else FSvcInd := '70';
      if FSatDeliv then FSvcClass := '834' else FSvcClass := '070';

      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           if FSatDeliv then FSvcInd := 'T6' else FSvcInd := 'AG';
           if FSatDeliv then FSvcClass := '838' else FSvcClass := '335';
         end;
    end;

  // UPS 3 DAY SELECT ('12')
  upsThreeDaySelect:
    begin
      FSvcIcon := '3';
      FSvcInd := '71';
      FSvcClass := '071';
      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           FSvcInd := 'AH';
           FSvcClass := '336';
         end;
    end;

  // UPS GROUND ('03')
  upsGround:
    begin
      FSvcIcon := ''; // this will be a black square (a graphic)
      FSvcInd := '72';
      FSvcClass := '072';
      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           FSvcInd := 'AJ';
           FSvcClass := '337';
         end;
    end;
  end; // end case
end;

procedure TUPSSrvRetrieval.Proc_PRDomesticCOD;
begin
 case FUPSService of

  // UPS EARLY AM (14)
  upsNextDayAirEarlyAM:
    begin
      if FSatDeliv then FSvcIcon := '1+S' else FSvcIcon := '1+';
      if FSatDeliv then FSvcInd := '33' else FSvcInd := '32';
      if FSatDeliv then FSvcClass := '033' else FSvcClass := '032';

      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           if FSatDeliv then FSvcInd := 'AA' else FSvcInd := 'A9';
           if FSatDeliv then FSvcClass := '330' else FSvcClass := '329';
         end;
    end;

  // UPS NEXT DAY AIR ('01')
  upsNextDayAir:
    begin
      if FSatDeliv then FSvcIcon := '1 S' else FSvcIcon := '1';
      if FSatDeliv then FSvcInd := '60' else FSvcInd := '59';
      if FSatDeliv then FSvcClass := '060' else FSvcClass := '059';

      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           if FSatDeliv then FSvcInd := 'AD' else FSvcInd := 'AC';
           if FSatDeliv then FSvcClass := '332' else FSvcClass := '331';
         end;
    end;

  // UPS NEXT DAY AIR SAVER ('13')
  {upsNextDayAirSaver:
    begin
      FSvcIcon := '1P';
      FSvcInd := '62';
      FSvcClass := '062';
      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           FSvcInd := 'AE';
           FSvcClass := '333';
         end;
    end;}

  // UPS 2ND DAY AIR A.M. ('59')
  {upsSecondDayAirAM:
    begin
      FSvcIcon := '2 A';
      FSvcInd := '65';
      FSvcClass := '065';
      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           FSvcInd := 'AF';
           FSvcClass := '334';
         end;
    end;}

  // UPS 2ND DAY AIR ('02')
  upsSecondDayAir:
    begin
      FSvcIcon := '2';
      FSvcInd := '70';
      FSvcClass := '070';

      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           FSvcInd := 'AG';
           FSvcClass := '335';
         end;
    end;

  // UPS 3 DAY SELECT ('12')
  {upsThreeDaySelect:
    begin
      FSvcIcon := '3';
      FSvcInd := '71';
      FSvcClass := '071';
      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           FSvcInd := 'AH';
           FSvcClass := '336';
         end;
    end; }

  // UPS GROUND ('03')
  upsGround:
    begin
      FSvcIcon := ''; // this will be a black square (a graphic)
      FSvcInd := '72';
      FSvcClass := '072';
      if FDlvConf and (FSigOpt = usoAdultSignature) then
         begin
           FSvcInd := 'AJ';
           FSvcClass := '337';
         end;
    end;
  end; // end case
end;


procedure TUPSSrvRetrieval.Proc_USInternational;
begin
 // ----------------------------------------------------------------------------
 // US - International
 // ----------------------------------------------------------------------------
 case FUPSService of

  // UPS EXPRESS PLUS ('54')
  upsWorldwideExpressPlus:
   begin
      if FSatDeliv then FSvcIcon := '1+S' else FSvcIcon := '1+';
      if FSatDeliv then FSvcInd := '34' else FSvcInd := '54';
      if FSatDeliv then FSvcClass := '034' else FSvcClass := '054';
      if FDlvConf then
         case FSigOpt of
          usoAnySignature:
           begin
             if FSatDeliv then FSvcInd := 'G4' else FSvcInd := 'G1';
             if FSatDeliv then FSvcClass := '484' else FSvcClass := '481';
           end;
          usoAdultSignature:
           begin
             if FSatDeliv then FSvcInd := 'G8' else FSvcInd := 'G5';
             if FSatDeliv then FSvcClass := '488' else FSvcClass := '485';
           end;
         end; // end case
   end;

  // UPS EXPRESS ('07')
  upsWorldwideExpress:
   begin
      if FSatDeliv then FSvcIcon := '1 S' else FSvcIcon := '1';
      if FSatDeliv then FSvcInd := '69' else FSvcInd := '66';
      if FSatDeliv then FSvcClass := '069' else FSvcClass := '066';
      if FDlvConf then
         case FSigOpt of
          usoAnySignature:
           begin
             if FSatDeliv then FSvcInd := 'D6' else FSvcInd := 'D3';
             if FSatDeliv then FSvcClass := '390' else FSvcClass := '387';
           end;
          usoAdultSignature:
           begin
             if FSatDeliv then FSvcInd := 'D7' else FSvcInd := 'D4';
             if FSatDeliv then FSvcClass := '391' else FSvcClass := '388';
           end;
         end; // end case
   end;

  // UPS SAVER ('65')
  upsWorldwideSaver:
   begin
      FSvcIcon := '1P';
      FSvcInd := '04';
      FSvcClass := '004';
      if FDlvConf then
         case FSigOpt of
          usoAnySignature:
           begin
             FSvcInd := 'D9';
             FSvcClass := '393';
           end;
          usoAdultSignature:
           begin
             FSvcInd := 'DA';
             FSvcClass := '394';
           end;
         end; // end case
   end;

  // UPS EXPEDITED ('08')
  upsWorldwideExpedited:
   begin
      FSvcIcon := '2';
      FSvcInd := '67';
      FSvcClass := '067';
      if FDlvConf then
         case FSigOpt of
          usoAnySignature:
           begin
             FSvcInd := 'DG';
             FSvcClass := '399';
           end;
          usoAdultSignature:
           begin
             FSvcInd := 'DH';
             FSvcClass := '400';
           end;
         end; // end case
   end;

  // UPS STANDARD ('11')
  upsStandard:
   begin
      FSvcIcon := ''; // black square
      FSvcInd := '68';
      FSvcClass := '068';
      if FDlvConf then
         case FSigOpt of
          usoAnySignature:
           begin
             FSvcInd := 'DK';
             FSvcClass := '402';
           end;
          usoAdultSignature:
           begin
             FSvcInd := 'DL';
             FSvcClass := '403';
           end;
         end; // end case
   end;
 end; // end case
end;

procedure TUPSSrvRetrieval.Proc_USInternationalCOD;
begin
 // ----------------------------------------------------------------------------
 // US - International, COD
 // ----------------------------------------------------------------------------
 case FUPSService of

  // UPS EXPRESS PLUS ('54')
  upsWorldwideExpressPlus:
   begin
      if FSatDeliv then FSvcIcon := '1+S' else FSvcIcon := '1+';
      if FSatDeliv then FSvcInd := '34' else FSvcInd := '54';
      if FSatDeliv then FSvcClass := '034' else FSvcClass := '054';
      if FDlvConf then
         case FSigOpt of
          usoAnySignature:
           begin
             if FSatDeliv then FSvcInd := 'G3' else FSvcInd := 'G2';
             if FSatDeliv then FSvcClass := '483' else FSvcClass := '482';
           end;
          usoAdultSignature:
           begin
             if FSatDeliv then FSvcInd := 'G7' else FSvcInd := 'G6';
             if FSatDeliv then FSvcClass := '487' else FSvcClass := '486';
           end;
         end; // end case
   end;

  // UPS EXPRESS ('07')
  upsWorldwideExpress:
   begin
      if FSatDeliv then FSvcIcon := '1 S' else FSvcIcon := '1';
      if FSatDeliv then FSvcInd := '69' else FSvcInd := '66';
      if FSatDeliv then FSvcClass := '069' else FSvcClass := '066';
      if FDlvConf then
         case FSigOpt of
          usoAnySignature:
           begin
             if FSatDeliv then FSvcInd := 'D6' else FSvcInd := 'D3';
             if FSatDeliv then FSvcClass := '390' else FSvcClass := '387';
           end;
          usoAdultSignature:
           begin
             if FSatDeliv then FSvcInd := 'D7' else FSvcInd := 'D4';
             if FSatDeliv then FSvcClass := '391' else FSvcClass := '388';
           end;
         end; // end case
   end;

  // UPS SAVER ('65')
  upsWorldwideSaver:
   begin
      FSvcIcon := '1P';
      FSvcInd := '04';
      FSvcClass := '004';
      if FDlvConf then
         case FSigOpt of
          usoAnySignature:
           begin
             FSvcInd := 'D9';
             FSvcClass := '393';
           end;
          usoAdultSignature:
           begin
             FSvcInd := 'DA';
             FSvcClass := '394';
           end;
         end; // end case
   end;

  // UPS EXPEDITED ('08')
  upsWorldwideExpedited:
   begin
      FSvcIcon := '2';
      FSvcInd := '67';
      FSvcClass := '067';
      if FDlvConf then
         case FSigOpt of
          usoAnySignature:
           begin
             FSvcInd := 'DG';
             FSvcClass := '399';
           end;
          usoAdultSignature:
           begin
             FSvcInd := 'DH';
             FSvcClass := '400';
           end;
         end; // end case
   end;

  // UPS STANDARD ('11')
  upsStandard:
   begin
      FSvcIcon := ''; // black square
      FSvcInd := '68';
      FSvcClass := '068';
      if FDlvConf then
         case FSigOpt of
          usoAnySignature:
           begin
             FSvcInd := 'DK';
             FSvcClass := '402';
           end;
          usoAdultSignature:
           begin
             FSvcInd := 'DL';
             FSvcClass := '403';
           end;
         end; // end case
   end;
 end; // end case
end;

procedure TUPSSrvRetrieval.Proc_USInternationalReturn;
begin
 // ----------------------------------------------------------------------------
 // US - International, Returns
 // ----------------------------------------------------------------------------
 case FUPSService of

  // UPS EXPRESS PLUS ('54')
  upsWorldwideExpressPlus:
   begin
       if FProactiveResponse then
          begin
            FSvcIcon := '1+';
            FSvcInd := 'V5';
            FSvcClass := '869';
            Exit;
          end
       else
          begin
            FSvcIcon := '1+';
            FSvcInd := 'AK';
            FSvcClass := '338';
          end;

      case PickupAttempts of
       1..2:
         begin
           FSvcInd := 'AM';
           FSvcClass := '340';
         end;
       3:
         begin
           FSvcInd := 'AL';
           FSvcClass := '339';
         end;
      end; // end case
   end;

  //UPS EXPRESS NA1
  upsWorldwideExpressNA1:
   begin
     {UPS EXPRESS NA1 is discussed in the Rate and Service Guide.

      UPS Worldwide Express NA1 is not a valid service from the US.
      It is valid from select cities in Belgium, Germany, the Netherlands,
      and the United Kingdom. }

       if FProactiveResponse then
          begin
            FSvcIcon := '1';
            FSvcInd := 'V8';
            FSvcClass := '872';
          end
       else
        if FSatDeliv then
          begin
            FSvcIcon := '1 S';
            FSvcInd := 'YA';
            FSvcClass := '970';
          end
        else
          begin
            FSvcIcon := '1';
            FSvcInd := 'V7';
            FSvcClass := '871';
          end;
   end;

  // UPS EXPRESS ('07')
  upsWorldwideExpress:
   begin
       if FProactiveResponse then
        if FSatDeliv then
          begin
            FSvcIcon := '1 S';
            FSvcInd := 'Y9';
            FSvcClass := '969';
          end
        else
          begin
            FSvcIcon := '1';
            FSvcInd := 'V4';
            FSvcClass := '868';
            Exit;
          end
       else
        case PickupAttempts of
          0: if FSatDeliv then
               begin
                 FSvcIcon := '1 S';
                 FSvcInd := 'Y6';
                 FSvcClass := '966';
               end
              else
               begin
                 FSvcIcon := '1';
                 FSvcInd := '85';
                 FSvcClass := '085';
               end;
          1..2: if FSatDeliv then
               begin
                 FSvcIcon := '1 S';
                 FSvcInd := 'Y7';
                 FSvcClass := '967';
               end
              else
               begin
                 FSvcIcon := '1';
                 FSvcInd := '96';
                 FSvcClass := '096';
               end;
          3: if FSatDeliv then
               begin
                 FSvcIcon := '1 S';
                 FSvcInd := 'Y8';
                 FSvcClass := '968';
               end
              else
               begin
                 FSvcIcon := '1';
                 FSvcInd := '92';
                 FSvcClass := '092';
               end;
          end;
   end;

  // UPS SAVER ('65')
  upsWorldwideSaver:
   begin
       if FProactiveResponse then
          begin
            FSvcIcon := '1P';
            FSvcInd := 'V6';
            FSvcClass := '870';
            Exit;
          end
       else
          begin
            FSvcIcon := '1P';
            FSvcInd := '86';
            FSvcClass := '086';
          end;

      case PickupAttempts of
       1..2:
         begin
           FSvcInd := '97';
           FSvcClass := '097';
         end;
       3:
         begin
           FSvcInd := '93';
           FSvcClass := '093';
         end;
      end; // end case
   end;

  // UPS EXPEDITED ('08')
  upsWorldwideExpedited:
   begin
      FSvcIcon := '2';
      FSvcInd := '88';
      FSvcClass := '088';
      case PickupAttempts of
       1..2:
         begin
           FSvcInd := '98';
           FSvcClass := '098';
         end;
       3:
         begin
           FSvcInd := '94';
           FSvcClass := '094';
         end;
      end; // end case
   end;

  // UPS STANDARD ('11')
  upsStandard:
   begin
      FSvcIcon := '';  // black square
      FSvcInd := '91';
      FSvcClass := '091';
      case PickupAttempts of
       1..2:
         begin
           FSvcInd := '99';
           FSvcClass := '099';
         end;
       3:
         begin
           FSvcInd := '95';
           FSvcClass := '095';
         end;
      end; // end case
   end;
 end; // end case
end;

procedure TUPSSrvRetrieval.Proc_USInternationalImportControl;
begin
 // ----------------------------------------------------------------------------
 // US - International, Import Control
 // ----------------------------------------------------------------------------
 case FUPSService of

  // UPS EXPRESS PLUS ('54')
  upsWorldwideExpressPlus:
   begin
       if FProactiveResponse then
          begin
            FSvcIcon := '1+';
            FSvcInd := 'V5';
            FSvcClass := '869';
            Exit;
          end
       else
          begin
            FSvcIcon := '1+';
            FSvcInd := 'AK';
            FSvcClass := '338';
          end;

      case PickupAttempts of
       1..2:
         begin
           FSvcInd := 'AM';
           FSvcClass := '340';
         end;
       3:
         begin
           FSvcInd := 'AL';
           FSvcClass := '339';
         end;
      end; // end case
   end;

  //UPS EXPRESS NA1
  upsWorldwideExpressNA1:
   begin
     {UPS EXPRESS NA1 is discussed in the Rate and Service Guide.

      UPS Worldwide Express NA1 is not a valid service from the US.
      It is valid from select cities in Belgium, Germany, the Netherlands,
      and the United Kingdom. }

       if FProactiveResponse then
          begin
            FSvcIcon := '1';
            FSvcInd := 'V8';
            FSvcClass := '872';
          end
       else
        if FSatDeliv then
          begin
            FSvcIcon := '1 S';
            FSvcInd := 'YA';
            FSvcClass := '970';
          end
        else
          begin
            FSvcIcon := '1';
            FSvcInd := 'V7';
            FSvcClass := '871';
          end;
   end;

  // UPS EXPRESS ('07')
  upsWorldwideExpress:
   begin
       if FProactiveResponse then
        if FSatDeliv then
          begin
            FSvcIcon := '1 S';
            FSvcInd := 'Y9';
            FSvcClass := '969';
          end
        else
          begin
            FSvcIcon := '1';
            FSvcInd := 'V4';
            FSvcClass := '868';
            Exit;
          end
       else
        case PickupAttempts of
          0: if FSatDeliv then
               begin
                 FSvcIcon := '1 S';
                 FSvcInd := 'Y6';
                 FSvcClass := '966';
               end
              else
               begin
                 FSvcIcon := '1';
                 FSvcInd := '85';
                 FSvcClass := '085';
               end;
          1..2: if FSatDeliv then
               begin
                 FSvcIcon := '1 S';
                 FSvcInd := 'Y7';
                 FSvcClass := '967';
               end
              else
               begin
                 FSvcIcon := '1';
                 FSvcInd := '96';
                 FSvcClass := '096';
               end;
          3: if FSatDeliv then
               begin
                 FSvcIcon := '1 S';
                 FSvcInd := 'Y8';
                 FSvcClass := '968';
               end
              else
               begin
                 FSvcIcon := '1';
                 FSvcInd := '92';
                 FSvcClass := '092';
               end;
          end;
   end;

  // UPS SAVER ('65')
  upsWorldwideSaver:
   begin
       if FProactiveResponse then
          begin
            FSvcIcon := '1P';
            FSvcInd := 'V6';
            FSvcClass := '870';
            Exit;
          end
       else
          begin
            FSvcIcon := '1P';
            FSvcInd := '86';
            FSvcClass := '086';
          end;

      case PickupAttempts of
       1..2:
         begin
           FSvcInd := '97';
           FSvcClass := '097';
         end;
       3:
         begin
           FSvcInd := '93';
           FSvcClass := '093';
         end;
      end; // end case
   end;

  // UPS EXPEDITED ('08')
  upsWorldwideExpedited:
   begin
      FSvcIcon := '2';
      FSvcInd := '88';
      FSvcClass := '088';
      case PickupAttempts of
       1..2:
         begin
           FSvcInd := '98';
           FSvcClass := '098';
         end;
       3:
         begin
           FSvcInd := '94';
           FSvcClass := '094';
         end;
      end; // end case
   end;

  // UPS STANDARD ('11')
  upsStandard:
   begin
      FSvcIcon := '';  // black square
      FSvcInd := '91';
      FSvcClass := '091';
      case PickupAttempts of
       1..2:
         begin
           FSvcInd := '99';
           FSvcClass := '099';
         end;
       3:
         begin
           FSvcInd := '95';
           FSvcClass := '095';
         end;
      end; // end case
   end;
 end; // end case
end;

procedure TUPSSrvRetrieval.Proc_USIntlReturnsExchange;
begin
 // ----------------------------------------------------------------------------
 // US - International, Returns Exchange
 // ----------------------------------------------------------------------------
 case FUPSService of

  // UPS EXPRESS PLUS ('54')
  upsWorldwideExpressPlus:
   begin
      if FSatDeliv then FSvcIcon := '1+S' else FSvcIcon := '1+';
      if FSatDeliv then FSvcInd := 'N4' else FSvcInd := 'HP';
      if FSatDeliv then FSvcClass := '676' else FSvcClass := '534';
      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
           begin
             if FSatDeliv then FSvcInd := 'P3' else FSvcInd := 'N5';
             if FSatDeliv then FSvcClass := '707' else FSvcClass := '677';
           end;
   end;

  // UPS EXPRESS NA1 ('64')
  upsWorldwideExpressNA1:
   begin
      if FSatDeliv then FSvcIcon := '1 S' else FSvcIcon := '1';
      if FSatDeliv then FSvcInd := 'T5' else FSvcInd := 'PH';
      if FSatDeliv then FSvcClass := '837' else FSvcClass := '720';
      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
           begin
             if FSatDeliv then FSvcInd := 'AQ' else FSvcInd := 'T4';
             if FSatDeliv then FSvcClass := '343' else FSvcClass := '836';
           end;
   end;

  // UPS EXPRESS ('07')
  upsWorldwideExpress:
   begin
      if FSatDeliv then FSvcIcon := '1 S' else FSvcIcon := '1';
      if FSatDeliv then FSvcInd := 'AZ' else FSvcInd := 'AS';
      if FSatDeliv then FSvcClass := '351' else FSvcClass := '345';
      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
           begin
             if FSatDeliv then FSvcInd := 'CS' else FSvcInd := 'CQ';
             if FSatDeliv then FSvcClass := '377' else FSvcClass := '375';
           end;
   end;

  // UPS Saver ('65')
  upsWorldwideSaver:
   begin
      FSvcIcon := '1P';
      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
        begin
          FSvcInd := 'DV';
          FSvcClass := '411';
        end
      else
        begin
          FSvcInd := 'DS';
          FSvcClass := '409';
        end;
   end;

  // UPS EXPEDITED ('08')
  upsWorldwideExpedited:
   begin
      FSvcIcon := '2';
      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
        begin
          FSvcInd := 'DX';
          FSvcClass := '413';
        end
      else
        begin
          FSvcInd := 'DW';
          FSvcClass := '412';
        end;
   end;

  // UPS STANDARD ('11')
  upsStandard:
   begin
      FSvcIcon := ''; // black square
      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
        begin
          FSvcInd := 'DZ';
          FSvcClass := '415';
        end
      else
        begin
          FSvcInd := 'DY';
          FSvcClass := '414';
        end;
   end;
 end; // end case
end;
procedure TUPSSrvRetrieval.Proc_USDomesticReturnsExchange;
begin
 // ----------------------------------------------------------------------------
 // US - Domestic
 // ----------------------------------------------------------------------------

 case FUPSService of

  // UPS EARLY AM (14)
  upsNextDayAirEarlyAM:
    begin
      if FSatDeliv then FSvcIcon := '1+S' else FSvcIcon := '1+';
      if not (FDlvConf and (FSigOpt = usoAdultSignature)) then
        begin
          if FSatDeliv then FSvcInd := '7G' else FSvcInd := '6Y';
          if FSatDeliv then FSvcClass := '239' else FSvcClass := '222';
        end
      else
        begin
          if FSatDeliv then FSvcInd := '7H' else FSvcInd := '7A';
          if FSatDeliv then FSvcClass := '240' else FSvcClass := '234';
        end;
    end;

  // UPS NEXT DAY AIR ('01')
  upsNextDayAir:
    begin
      if FSatDeliv then FSvcIcon := '1 S' else FSvcIcon := '1';

      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
           begin
             if FSatDeliv then FSvcInd := '7W' else FSvcInd := '7T';
             if FSatDeliv then FSvcClass := '252' else FSvcClass := '250';
           end
      else
         if (FShpRls) then
           begin
             if FSatDeliv then FSvcInd := '8A' else FSvcInd := '7Y';
             if FSatDeliv then FSvcClass := '266' else FSvcClass := '254';
           end
         else
           begin
             if FSatDeliv then FSvcInd := '7P' else FSvcInd := '7N';
             if FSatDeliv then FSvcClass := '246' else FSvcClass := '245';
           end;
    end;

  // UPS NEXT DAY AIR SAVER ('13')
  upsNextDayAirSaver:
    begin
      FSvcIcon := '1P';
      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
        begin
          FSvcInd := '8H';
          FSvcClass := '272';
        end
      else
        begin
          FSvcInd := '8G';
          FSvcClass := '271';
        end;
    end;

  // UPS 2ND DAY AIR A.M. ('59')
  upsSecondDayAirAM:
    begin
      FSvcIcon := '2A';
      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
        begin
          FSvcInd := '8P';
          FSvcClass := '278';
        end
      else
        begin
          FSvcInd := '8N';
          FSvcClass := '277';
        end;
    end;

  // UPS 2ND DAY AIR ('02')
  upsSecondDayAir:
    begin
      if FSatDeliv then FSvcIcon := '2 S' else FSvcIcon := '2';

      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
           begin
             if FSatDeliv then FSvcInd := '9A' else FSvcInd := '8Y';
             if FSatDeliv then FSvcClass := '298' else FSvcClass := '286';
           end
      else
         if (FShpRls) then
           begin
             if FSatDeliv then FSvcInd := '9H' else FSvcInd := '9G';
             if FSatDeliv then FSvcClass := '304' else FSvcClass := '303';
           end
         else
           begin
             if FSatDeliv then FSvcInd := '8W' else FSvcInd := '8T';
             if FSatDeliv then FSvcClass := '284' else FSvcClass := '282';
           end;
    end;

  // UPS 3 DAY SELECT ('12')
  upsThreeDaySelect:
    begin
      FSvcIcon := '3';
      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
        begin
          FSvcInd := '9P';
          FSvcClass := '310';
        end
      else
        begin
          FSvcInd := '9N';
          FSvcClass := '309';
        end;
    end;

  // UPS GROUND ('03')
  upsGround:
    begin
      FSvcIcon := ''; // this will be a black square (a graphic)

      if (FDlvConf and (FSigOpt = usoAdultSignature)) then
           begin
             FSvcInd := '9W';
             FSvcClass := '316';
           end
      else
         if (FShpRls) then
           begin
             FSvcInd := '9Y';
             FSvcClass := '318';
           end
         else
           begin
             FSvcInd := '9T';
             FSvcClass := '314';
           end;
    end;
  end; // end case
end;
procedure TUPSSrvRetrieval.Proc_USPackCollect;
begin
 // ----------------------------------------------------------------------------
 // US - International, Pack Collect
 // ----------------------------------------------------------------------------
 case FUPSService of

  // UPS EXPRESS PLUS ('54')
  upsWorldwideExpressPlus:
   begin
      FSvcIcon := '1+';

      case PickupAttempts of
       1..2:
         begin
           FSvcInd := '5N';
           FSvcClass := '181';
         end;
       3:
         begin
           FSvcInd := '5P';
           FSvcClass := '182';
         end;
      end; // end case
   end;

  // UPS EXPRESS ('07')
  upsWorldwideExpress:
   begin
        if FSatDeliv then FSvcIcon := '1 S' else FSvcIcon := '1';
        case PickupAttempts of
          1..2: if FSatDeliv then
               begin
                 FSvcInd := '5Y';
                 FSvcClass := '190';
               end
              else
               begin
                 FSvcInd := '5T';
                 FSvcClass := '186';
               end;
          3: if FSatDeliv then
               begin
                 FSvcInd := '6A';
                 FSvcClass := '202';
               end
              else
               begin
                 FSvcInd := '5W';
                 FSvcClass := '188';
               end;
          end;
   end;

  // UPS SAVER ('65')
  upsWorldwideSaver:
   begin
      FSvcIcon := '1P';
      case PickupAttempts of
       1..2:
         begin
           FSvcInd := '6G';
           FSvcClass := '207';
         end;
       3:
         begin
           FSvcInd := '6H';
           FSvcClass := '208';
         end;
      end; // end case
   end;

  // UPS EXPEDITED ('08')
  upsWorldwideExpedited:
   begin
      FSvcIcon := '2';
      case PickupAttempts of
       1..2:
         begin
           FSvcInd := '6N';
           FSvcClass := '213';
         end;
       3:
         begin
           FSvcInd := '6P';
           FSvcClass := '214';
         end;
      end; // end case
   end;

  // UPS STANDARD ('11')
  upsStandard:
   begin
      FSvcIcon := '';  // black square
      case PickupAttempts of
       1..2:
         begin
           FSvcInd := '6T';
           FSvcClass := '218';
         end;
       3:
         begin
           FSvcInd := '6W';
           FSvcClass := '220';
         end;
      end; // end case
   end;
 end; // end case
end;

end.

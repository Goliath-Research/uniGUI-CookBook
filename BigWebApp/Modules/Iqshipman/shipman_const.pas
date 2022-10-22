unit shipman_const;

(*                      *** Global constants ***
 *
 *  External applications may declare this unit when calling the Shipping
 *  Manifest through COM.
 *
    Examples:

      Application.ProcessMessages; // allow button to repaint
      try
         Com_Exec( 'IQSHIPMAN', [shipman_const.SHIP_MANIFEST, AShipmentsID ]); // IQComExe.pas
      except on E:Exception do // in case Cancel was clicked
         if not E.ClassNameIs( 'EAbort' ) and not E.ClassNameIs( 'EOleException' ) then raise;
      end;

      Or, if accessing "Carrier Maintenance," make this call:

         Com_Exec( 'IQSHIPMAN', [shipman_const.SHIP_CARRIER, 0 ]); // IQComExe.pas

 *)


interface

const
   SHIP_MANIFEST = 1;
   SHIP_CARRIER  = 2;
   SHIP_CLOSE    = 3;
   SHIP_SHOP     = 4;


implementation

end.

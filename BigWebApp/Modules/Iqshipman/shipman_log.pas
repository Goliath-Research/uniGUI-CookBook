unit shipman_log;

interface

uses
  Winapi.Windows,
  System.Classes,
  System.SysUtils,
  Vcl.Forms,
  shipman_common,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule;

type
   TLogClass = (lcUnknown, lcRate, lcShip, lcCancel, lcClose, lcLabel,
    lcRegister, lcSubscribe, lcVersionCapture, lcTrack); // type of event
   TLogClasses = set of TLogClass;

   procedure WriteToLog(const ACarrierType: TCarrierType;
                        const ACarrierID: Real;
                        const AClass: TLogClass;
                        const AError: Boolean;
                        const ADetails: String;
                        const ARequestData: String = '';
                        const AResponseData: String = '');

   procedure ShowShipManLog;

   // Similar to a FixStr method, this returns a string that Delphi can
   // successfully display in its controls.
   function LnChk(const AText: String): String;

const

   LogClassStr: array[TLogClass] of String =
    ('',  // lcUnknown
     'Rate',  // lcRate
     'Ship Package',  // lcShip
     'Cancel Package',  // lcCancel
     'Close Package', // lcClose
     'Print Label',  // lcLabel
     'Register Company',  // lcRegister
     'Subscribe Account', // lcSubscribe
     'Version Capture',  //lcVersionCapture
     'Tracking');        //lcTrack

   NL = #13#10; // #$D#$A

implementation

uses
  Data.DB,
  IQMS.Common.Miscellaneous,
  shipman_logfrm;

procedure WriteToLog(const ACarrierType: TCarrierType;
                     const ACarrierID: Real;
                     const AClass: TLogClass;
                     const AError: Boolean;
                     const ADetails: String;
                     const ARequestData: String = '';
                     const AResponseData: String = '');
var
   ARequest, AResponse: String;
begin
  // Text sometimes comes in without full new line characters
  ARequest := LnChk(ARequestData);
  AResponse := LnChk(AResponseData);

  with TFDStoredProc.Create(NIL) do
  try
     Connection := UniMainModule.FDConnection1;
     StoredProcName:= 'IQMS.SHIPMAN.ADD_LOG_ENTRY';


     // Params IN
     with Params.CreateParam( ftInteger, 'v_carrier_type', ptInput) do AsInteger := Ord(ACarrierType);
     with Params.CreateParam( ftFloat,   'v_carrier_id', ptInput) do AsFloat := ACarrierID;
     with Params.CreateParam( ftInteger, 'v_class', ptInput) do AsInteger := Ord(AClass);
     with Params.CreateParam( ftInteger, 'v_error', ptInput) do AsInteger := INTEGER(AError);
     with Params.CreateParam( ftOraClob, 'v_details', ptInput) do AsString:= ADetails;
     with Params.CreateParam( ftOraClob, 'v_request_data', ptInput) do AsString:= ARequest;
     with Params.CreateParam( ftOraClob, 'v_response_data', ptInput) do AsString:= AResponse;

     // Get values
     Prepare;
     ExecProc;
  finally
     Free;
  end;
end;

procedure ShowShipManLog;
begin
  TFrmShipManLog.Create(Application).Show;
end;

function LnChk(const AText: String): String;
var
   APrev,
   ACur,
   ANext: Char;
   S: String;
   i: Integer;

   procedure _Append(const C: Char);
   begin
     Result := Result + C;
   end;

begin
   // initialization
   APrev := #0;
   ANext := #0;
   ACur := #0;
   Result := '';
   i := 1;

   // Cycle text
   if Length(AText) > 0 then
   repeat

      // Next character
      ANext := #0;
      if (i > 0) and (i < Length(AText)) then
         ANext := AText[i+1];
      ACur := AText[i];

      // Evaluate text
      if ((ACur in [#10, #13]) and not (ANext in [#10, #13])) then
         begin
           _Append(#13);
           _Append(#10);
           APrev := #10;
           Inc(i);
         end
      else if
         ((ACur + ANext) = #13#10) or
         ((ACur + ANext) = #13#13) or
         ((ACur + ANext) = #10#10) then
         begin
           _Append(#13);
           _Append(#10);
           APrev := #10;
           i := i + 2;
         end
      else if not (AText[i] in [#0, #13, #10]) then
         begin
           _Append(ACur);
           APrev := ACur;
           Inc(i);
         end
      else Inc(i);

    until i > Length(AText);

end;

end.

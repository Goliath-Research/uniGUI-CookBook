unit cc_payflowpro_utils;

interface

uses
  System.SysUtils,
  cc_types;

/// <summary> Get the industry standard security code for the given
/// response code.
/// </summary>
function GetStandardSecurityCode(const ASecurityResponse: string): string;

/// <summary> Get the industry standard AVS code for the given
/// response code.
/// </summary>
function GetStandardAVSCode(const AAddress, APostalCode, AAddressResponse,
  APostalCodeResponse, AIAVSResponse: string): string;

/// <summary>Get the descriptive, message text for the provided host code.
/// </summary>
procedure GetHostCodeDescription(const AHostCode: ShortString;
  var AResponseClass: TResponseClass; var AResponse: ShortString;
  var ADescription: string);

implementation

function GetStandardSecurityCode(const ASecurityResponse: string): string;
begin
  if CompareText(ASecurityResponse, 'MATCH') = 0 then
    Result := 'M'
  else if CompareText(ASecurityResponse, 'NO MATCH') = 0 then
    Result := 'N'
  else if CompareText(ASecurityResponse, 'SERVICE NOT AVAILABLE') = 0 then
    Result := 'P'
  else if CompareText(ASecurityResponse, 'SERVICE NOT REQUESTED') = 0 then
    Result := 'S';
end;

function GetStandardAVSCode(const AAddress, APostalCode, AAddressResponse,
  APostalCodeResponse, AIAVSResponse: string): string;
begin
  // Available result codes:
  // Y = match
  // N = no match
  // X = cardholder’s bank does not support address verification service.
  // Address not provided, but Postal Code matches
  if (AAddress = '') and (CompareText(APostalCodeResponse, 'Y') = 0) then
    begin
      // 'Success!  Exact AVS match on the five-digit postal code.'
      Result := 'Y'
    end
    // Both match
  else if (CompareText(AAddressResponse, 'Y') = 0) and
    (CompareText(APostalCodeResponse, 'Y') = 0) then
    begin
      if CompareText(AIAVSResponse, 'Y') = 0 then
        // 'Success! The street address and postal code match for this
        // international transaction.'
        Result := 'M'
      else
        Result := 'Y';
    end
    // 'AVS Warning: Customer address matches, but the postal code does not.'
  else if (CompareText(AAddressResponse, 'Y') = 0) and
    (CompareText(APostalCodeResponse, 'N') = 0) then
    Result := 'A'
    // Postal code matches, but the address does not
  else if (CompareText(AAddressResponse, 'N') = 0) and
    (CompareText(APostalCodeResponse, 'Y') = 0) then
    begin
      if Length(APostalCode) = 9 then
        // 'AVS Warning: Nine-digit postal code matches, but the address does not.'
        Result := 'W'
      else
        // // 'Five-digit postal code matches, but the address does not.'
        Result := 'Z'
    end
    // 'AVS Warning: No match for customer address or postal code.'
  else if (CompareText(AAddressResponse, 'N') = 0) and
    (CompareText(APostalCodeResponse, 'N') = 0) then
    Result := 'N'
    // 'This service is not supported by the issuer.'
  else if (CompareText(AAddressResponse, 'X') = 0) or
    (CompareText(APostalCodeResponse, 'X') = 0) then
    // If both are X, that means the gateway (PayPal, TSYS, etc.) does
    // not support AVS.
    Result := 'S'
  else
    Result := 'P';
end;

procedure GetHostCodeDescription(const AHostCode: ShortString;
  var AResponseClass: TResponseClass; var AResponse: ShortString;
  var ADescription: string);

  function _Eval(const Code: string;
    AResponseClassIfTrue: TResponseClass = rcFailure): Boolean;
  begin
    Result := CompareText(Code, AHostCode) = 0;
    if Result then
      AResponseClass := AResponseClassIfTrue;
  end;

begin
  AResponseClass := rcFailure;
  AResponse := AHostCode;
  ADescription := '';

{$REGION 'Sale Approved HOSTCODE values'}
  // Success
  if _Eval('000500', rcSuccess) then
    begin
      AResponse := 'Sale Approved';
      ADescription := 'Sale Approved by credit card network';
    end
  else if _Eval('000501', rcSuccess) then
    begin
      AResponse := 'Sale Time-out';
      ADescription := 'Sale transaction time-out in credit card network';
    end
  else if _Eval('000502', rcSuccess) then
    begin
      AResponse := 'Test Card';
      ADescription := 'Test card sale approved (never billed)';
    end
  else if _Eval('000504', rcSuccess) then
    begin
      AResponse := 'ANI Sale Approved';
      ADescription := '900/Telco sale approved';
    end
  else if _Eval('000505', rcSuccess) then
    begin
      AResponse := 'PB Sale Approved';
      ADescription := 'Private billing sale approved';
    end
  else if _Eval('000800', rcSuccess) then
    begin
      AResponse := 'Sale Approved';
      ADescription := 'Direct Check Sale/ECA approved';
    end
  else if _Eval('000801', rcSuccess) then
    begin
      AResponse := 'Sale Approved';
      ADescription := 'Direct Check Sale approved (no ECA)';
    end
  else if _Eval('000802', rcSuccess) then
    begin
      AResponse := 'Sale Approved';
      ADescription := 'Direct Check Sale/ECA approved no guarantee';
    end
  else if _Eval('000803', rcSuccess) then
    begin
      AResponse := 'Sale Approved';
      ADescription := 'Direct Check Sale approved no ECA no guarantee';
    end
{$ENDREGION 'Sale Approved HOSTCODE values'}
{$REGION 'Sale Declined HOSTCODE values'}
  else if _Eval('000300', rcFailure) then
    begin
      AResponse := 'Sale Declined';
      ADescription := 'Sale declined by credit card network';
    end
  else if _Eval('000301', rcFailure) then
    begin
      AResponse := 'Sale Rejected';
      ADescription := 'Sale does not meet risk standards';
    end
  else if _Eval('000804', rcFailure) then
    begin
      AResponse := 'Check Declined';
      ADescription := 'Direct Check Sale declined negative data';
    end
  else if _Eval('000805', rcFailure) then
    begin
      AResponse := 'Check Declined';
      ADescription := 'Direct Check Sale Decline Scoring';
    end
  else if _Eval('000807', rcFailure) then
    begin
      AResponse := 'Check Failure';
      ADescription := 'Direct Check Sale';
    end

{$ENDREGION 'Sale Declined HOSTCODE values'}
{$REGION 'Inquiry Approved HOSTCODE values'}
  else if _Eval('000400', rcSuccess) then
    begin
      AResponse := 'OTB Approved';
      ADescription := 'Preauthorization approved. AVS matches if provided.';
    end
  else if _Eval('000401', rcSuccess) then
    begin
      AResponse := 'No Response';
      ADescription := 'No response from credit card network for preauth.';
    end
  else if _Eval('000402', rcSuccess) then
    begin
      AResponse := 'AVS Time-out';
      ADescription := 'Preauthorization approved, AVS timed out';
    end
  else if _Eval('000403', rcSuccess) then
    begin
      AResponse := 'PB Approved';
      ADescription := 'Private billing approved.';
    end
  else if _Eval('000410', rcSuccess) then
    begin
      AResponse := 'Positive Record';
      ADescription := 'Previous positive history.';
    end
  else if _Eval('000420', rcSuccess) then
    begin
      AResponse := 'Test card';
      ADescription := 'Approved Test Card';
    end
  else if _Eval('000421', rcSuccess) then
    begin
      AResponse := 'OTB/AVS Approval';
      ADescription := 'Preauthorization approved, AVS match';
    end
  else if _Eval('000503', rcSuccess) then
    begin
      AResponse := 'ANI Bill approved';
      ADescription := '900/TELCO billing approved';
    end

{$ENDREGION 'Inquiry Approved HOSTCODE values'}
{$REGION 'General Failure HOSTCODE values'}
  else if _Eval('000100', rcFailure) then
    begin
      AResponse := 'General Failure';
      ADescription := 'General host based failure';
    end
  else if _Eval('000101', rcFailure) then
    begin
      AResponse := 'Invalid Value';
      ADescription := 'Invalid for one or more fields in transaction';
    end
  else if _Eval('999999', rcFailure) then
    begin
      AResponse := 'Unknown Response';
      ADescription := 'TeleCheck received an unknown response';
    end

{$ENDREGION 'General Failure HOSTCODE values'}
{$REGION 'Inquiry Declined HOSTCODE values'}
  else if _Eval('000200', rcFailure) then
    begin
      AResponse := 'Preauth Declined';
      ADescription := 'Declined by credit card or Telco network (LIDB)';
    end
  else if _Eval('000201', rcFailure) then
    begin
      AResponse := 'PIN Mismatch';
      ADescription := 'Mismatch on PIN stored in TeleCheck database';
    end
  else if _Eval('000210', rcFailure) then
    begin
      AResponse := 'Negative Card Record';
      ADescription := 'Temporary and permanent blocks. Prior OTB decline, ' +
        'sale decline or CS block Transaction falls below minimum ' +
        'scoring standards. Most frequently used for risk scoring ' +
        'declines, where a transaction falls below minimum standards.';
    end
  else if _Eval('000215', rcFailure) then
    begin
      AResponse := 'Negative ANI Record';
      ADescription := 'ANI previously blocked by CS';
    end
  else if _Eval('000220', rcFailure) then
    begin
      AResponse := 'Chargeback Card';
      ADescription := 'Card with chargeback history';
    end
  else if _Eval('000225', rcFailure) then
    begin
      AResponse := 'Chargeback ANI';
      ADescription := 'ANI with chargeback history';
    end
  else if _Eval('000230', rcFailure) then
    begin
      AResponse := 'Exceed card profile';
      ADescription := 'Card has exceeded usage limits';
    end
  else if _Eval('000240', rcFailure) then
    begin
      AResponse := 'Too many Cards';
      ADescription := 'ANI has excessive number of cards';
    end
  else if _Eval('000250', rcFailure) then
    begin
      AResponse := 'Exceed ANI profile';
      ADescription := 'ANI has exceeded usage limits';
    end
  else if _Eval('000260', rcFailure) then
    begin
      AResponse := 'Too Many Phones';
      ADescription := 'Card has been used from excessive ANI';
    end
  else if _Eval('000270', rcFailure) then
    begin
      AResponse := 'OTB/AVS Decline';
      ADescription := 'OTB decline and AVS mismatch';
    end
  else if _Eval('000271', rcFailure) then
    begin
      AResponse := 'OTB/AVS Decline';
      ADescription := 'OTB approved and AVS mismatch';
    end
  else if _Eval('000272', rcFailure) then
    begin
      AResponse := 'OTB/AVS Decline';
      ADescription := 'OTB decline and AVS match';
    end
  else if _Eval('000280', rcFailure) then
    begin
      AResponse := 'Risk Referral';
      ADescription := 'Temporary Risk referral, AVS necessary';
    end
  else if _Eval('000281', rcFailure) then
    begin
      AResponse := 'Card Not Qualified';
      ADescription := 'Card does not meet minimum bank restrictions';
    end
  else if _Eval('000282', rcFailure) then
    begin
      AResponse := 'PB Risk Referral';
      ADescription := 'Private billing risk referral, AVS necessary';
    end;

{$ENDREGION 'Inquiry Declined HOSTCODE values'}
end;

end.

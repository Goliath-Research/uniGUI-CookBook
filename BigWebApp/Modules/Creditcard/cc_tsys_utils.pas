unit cc_tsys_utils;

interface

uses
  System.SysUtils,
  System.Classes,
  cc_types;

function GetResponseText(const AResponseCode: string;
  var AResponseClass: TResponseClass): string;
function GetErrorText(ACode: Integer): string;

/// <summary> Parse XML and populate string list with printable receipt text.
/// </summary>
function GetReceiptText(const AXML, ATag: string;
  var APrintText: string): Boolean;
/// <summary> Parse XML and populate string list with printable receipt text.
/// Applies only to API 1.0, build 3.0.
/// </summary>
function GetReceiptText_API_1(const AXML: string; var ACustomerCopy,
  AMerchantCopy: string): Boolean;
procedure PrintXmlReceipts(AOwner: TComponent; AXML: string;
  APrintPreview: Boolean);
procedure PrintXmlReceipts_API_1(AOwner: TComponent; AXML: string;
  APrintPreview: Boolean);

implementation

uses
//  cc_print_receipt,
  cc_rscstr,
  IQMS.Common.StringUtils,
  IQMS.Common.XML,
  Xml.XMLDoc,
  Xml.XMLIntf;

function GetResponseText(const AResponseCode: string;
  var AResponseClass: TResponseClass): string;

  function _Eval(const Code: array of string;
    AResponseClassIfTrue: TResponseClass = rcFailure): Boolean;
  begin
    // Evaluate combinations of codes
    Result := IQMS.Common.StringUtils.StrInList(AResponseCode, Code);
    if Result then
      AResponseClass := AResponseClassIfTrue;
  end;

begin
  AResponseClass := rcFailure; // default
  // NOTE:  A response class of Warning or Success indicates that the charge
  // went through.  It was processed by Vital.  For all AVS responses,
  // the charge goes through.  For the others, it means the charge
  // has failed.
  // Any '00' or '85' code means that the card was charged successfully,
  // even if a warning was issued.
  if _Eval(['85', '00'], rcSuccess) then
    Result := cc_rscstr.cTXT0000220 // 'Transaction Successful.'
  else if _Eval(['10'], rcSuccess) then
    // 'Transaction Successful. Partial approval for the authorized amount.'
    Result := cc_rscstr.cTXT0000334
  else if _Eval(['01']) then
    // 'Transaction Failed.  Refer to issuer.';
    Result := cc_rscstr.cTXT0000127
  else if _Eval(['02']) then
    // 'Transaction Failed.  Refer to issuer.  There is a special condition.';
    Result := cc_rscstr.cTXT0000128
  else if _Eval(['28'], rcError) then
    // 'Transaction Failed.  File is currently unavailable.  Please retry.'
    Result := cc_rscstr.cTXT0000129
  else if _Eval(['91'], rcError) then
    // 'Transaction Failed.  Issuer or switch is unavailable.  Please retry.'
    Result := cc_rscstr.cTXT0000130
  else if _Eval(['04'], rcSecurity) then
    // 'Security Warning! Pickup or hold card.'
    Result := cc_rscstr.cTXT0000131
  else if _Eval(['07'], rcSecurity) then
    // 'Security Warning! Pickup or hold card. There is a special condition.'
    Result := cc_rscstr.cTXT0000132
  else if _Eval(['41'], rcSecurity) then
    // 'Security Warning! Pickup or hold card. Card was reported as lost.';
    Result := cc_rscstr.cTXT0000133
  else if _Eval(['43'], rcSecurity) then
    // 'Security Warning! Pickup or hold card. Card was reported as stolen.';
    Result := cc_rscstr.cTXT0000134
  else if _Eval(['EA', 'EB', 'EC']) then
    // 'Transaction Failed. Verification error.'
    Result := cc_rscstr.cTXT0000135
  else if _Eval(['79']) then
    // 'Transaction Failed. Already reversed at switch.'
    Result := cc_rscstr.cTXT0000136
  else if _Eval(['13']) then
    // 'Transaction Failed. Invalid amount.'
    Result := cc_rscstr.cTXT0000137
  else if _Eval(['83', '86']) then
    // 'Transaction Failed. Cannot verify PIN.'
    Result := cc_rscstr.cTXT0000138
  else if _Eval(['14']) then
    // 'Transaction Failed. Invalid card number.'
    Result := cc_rscstr.cTXT0000139
  else if _Eval(['82']) then
    // 'Transaction Failed. Cashback limit exceeded.
    Result := cc_rscstr.cTXT0000140
  else if _Eval(['N3']) then
    // 'Transaction Failed. Cashback service is unavailable.'
    Result := cc_rscstr.cTXT0000141
  else if _Eval(['80']) then
    // 'Transaction Failed. Invalid expiration date.'
    Result := cc_rscstr.cTXT0000142
  else if _Eval(['05'], rcSecurity) then
    // 'Transaction Failed. Do not honor.'
    Result := cc_rscstr.cTXT0000143
  else if _Eval(['51']) then
    // 'Transaction Failed. Insufficient funds.'
    Result := cc_rscstr.cTXT0000144
  else if _Eval(['N4']) then
    // 'Transaction Failed. Exceeds issuer withdrawal limit.'
    Result := cc_rscstr.cTXT0000145
  else if _Eval(['61']) then
    // 'Transaction Failed. Exceeds withdrawal limit.'
    Result := cc_rscstr.cTXT0000146
  else if _Eval(['62']) then
    // 'Transaction Failed. Invalid service code.  Restricted.'
    Result := cc_rscstr.cTXT0000147
  else if _Eval(['65']) then
    // 'Transaction Failed. Activity limit exceeded.'
    Result := cc_rscstr.cTXT0000148
  else if _Eval(['93'], rcError) then
    // 'Transaction Failed.  The Address Verification System (AVS) has issued an unknown error.'
    Result := cc_rscstr.cTXT0000071
  else if _Eval(['81'], rcError) then
    // 'Encryption error.  Cannot proceed.'
    Result := cc_rscstr.cTXT0000149
  else if _Eval(['06'], rcError) then
    // 'Transaction Failed.  Error condition.'
    Result := cc_rscstr.cTXT0000150
  else if _Eval(['06*'], rcError) then
    // 'Transaction Failed.  Error response text from check service.'
    Result := cc_rscstr.cTXT0000335
  else if _Eval(['54']) then
    // 'Transaction Failed.  Failed!  Card is expired.'
    Result := cc_rscstr.cTXT0000151
  else if _Eval(['92']) then
    // 'Transaction Failed.  Destination not found.'
    Result := cc_rscstr.cTXT0000152
  else if _Eval(['12'], rcError) then
    // 'Transaction Failed.  Error:  Invalid transaction.'
    Result := cc_rscstr.cTXT0000153
  else if _Eval(['78']) then
    // 'Transaction Failed.  Cannot find account.'
    Result := cc_rscstr.cTXT0000154
  else if _Eval(['21']) then
    // 'Transaction Failed. Unable to back out transaction.'
    Result := cc_rscstr.cTXT0000155
  else if _Eval(['76']) then
    // 'Transaction Failed. Unable to locate matching account.'
    Result := cc_rscstr.cTXT0000156
  else if _Eval(['77']) then
    // 'Transaction Failed. Inconsistent data, revision or repeat.'
    Result := cc_rscstr.cTXT0000157
  else if _Eval(['52']) then
    // 'Transaction Failed. No checking account.'
    Result := cc_rscstr.cTXT0000158
  else if _Eval(['39']) then
    // 'Transaction Failed. No credit account.'
    Result := cc_rscstr.cTXT0000159
  else if _Eval(['53']) then
    // 'Transaction Failed. No savings account.'
    Result := cc_rscstr.cTXT0000160
  else if _Eval(['15']) then
    // 'Transaction Failed. User not found.'
    Result := cc_rscstr.cTXT0000161
  else if _Eval(['75']) then
    // 'Transaction Failed. PIN tries exceeded.'
    Result := cc_rscstr.cTXT0000162
  else if _Eval(['19']) then
    // 'Please re-enter transaction.'
    Result := cc_rscstr.cTXT0000163
  else if _Eval(['63'], rcSecurity) then
    // 'Warning! Security violation.'
    Result := cc_rscstr.cTXT0000164
  else if _Eval(['57']) then
    // 'Transaction Failed. Transactions not permitted with this card.'
    Result := cc_rscstr.cTXT0000165
  else if _Eval(['58']) then
    // 'Transaction Failed. Transactions not permitted with this terminal.'
    Result := cc_rscstr.cTXT0000166
  else if _Eval(['B1']) then
    // 'Surcharge amount not permitted on Visa cards or EBT food stamps.';
    Result := cc_rscstr.cTXT0000336
  else if _Eval(['B2']) then
    // 'Surcharge amount not supported by debit network issuer.';
    Result := cc_rscstr.cTXT0000337
  else if _Eval(['R0']) then
    // 'Customer requested stop of specific recurring payment.';
    Result := cc_rscstr.cTXT0000338
  else if _Eval(['R1']) then
    // 'Customer requested stop of all recurring payments.';
    Result := cc_rscstr.cTXT0000339
  else if _Eval(['96']) then
    // 'Error: System malfunction.'
    Result := cc_rscstr.cTXT0000167
  else if _Eval(['03']) then
    // 'Transaction Failed.  Invalid Merchant ID.'
    Result := cc_rscstr.cTXT0000168
  else if _Eval(['55']) then
    // 'Transaction Failed.  Invalid PIN number.'
    Result := cc_rscstr.cTXT0000169
  else if _Eval(['N7']) then
    // 'Transaction Failed.  Invalid CVV2 number.'
    Result := cc_rscstr.cTXT0000170
  else if _Eval(['xx']) then
    // 'Undefined response.'
    Result := cc_rscstr.cTXT0000340
  else if _Eval(['94']) then
    // 'Unable to locate.  No match.'
    Result := cc_rscstr.cTXT0000341
  else if _Eval(['T0'], rcSuccess) then
    // 'First check is OK and has been converted.'
    Result := cc_rscstr.cTXT0000350
  else if _Eval(['T1']) then
    // 'Check is OK but cannot be converted. This is a declined transaction.'
    Result := cc_rscstr.cTXT0000342
  else if _Eval(['T2']) then
    // 'Invalid ABA number.  Not an ACH participant.'
    Result := cc_rscstr.cTXT0000343
  else if _Eval(['T3']) then
    // 'Amount greater than the limit.'
    Result := cc_rscstr.cTXT0000344
  else if _Eval(['T4']) then
    // 'Unpaid items.  Failed negative file check.'
    Result := cc_rscstr.cTXT0000345
  else if _Eval(['T5']) then
    // 'Duplicate check number.'
    Result := cc_rscstr.cTXT0000346
  else if _Eval(['T6']) then
    // 'MICR error.'
    Result := cc_rscstr.cTXT0000347
  else if _Eval(['T7']) then
    // 'Too many checks (over merchant or bank limit)'
    Result := cc_rscstr.cTXT0000348
  else if _Eval(['11'], rcSuccess) then
    // 'VIP approval.'
    Result := cc_rscstr.cTXT0000349
  else if _Eval(['08'], rcSuccess) then
    // 'Honor MasterCard with ID.';
    Result := cc_rscstr.cTXT0000351
  else
    Result := '';
end;

function GetErrorText(ACode: Integer): string;
begin
  case ACode of
    100:
      Result := 'You cannot change the RemotePort at this time. A connection is in progress.';
    101:
      Result := 'You cannot change the RemoteHost (Server) at this time. A connection is in progress.';
    102:
      Result := 'The RemoteHost address is invalid (0.0.0.0).	';
    104:
      Result := 'Already connected. If you want to reconnect, close the current connection first.';
    106:
      Result := 'You cannot change the LocalPort at this time. A connection is in progress.';
    107:
      Result := 'You cannot change the LocalHost at this time. A connection is in progress.';
    109:
      Result := 'The component must be active for this operation.';
    112:
      Result := 'You cannot change MaxLineLength at this time. A connection is in progress.';
    116:
      Result := 'RemotePort cannot be zero. Please specify a valid service port number.';
    117:
      Result := 'Cannot change UseConnection option while the component is Active.';
    118:
      Result := 'Firewall Error. Error description contains detailed message.';
    135:
      Result := 'Operation would block.';
    143:
      Result := 'Busy performing current action.';
    151:
      Result := 'HTTP protocol error. The error message has the server response.';
    152:
      Result := 'No server specified in URL.';
    153:
      Result := 'Specified URLScheme is invalid.';
    155:
      Result := 'Range operation is not supported by server.';
    156:
      Result := 'Invalid cookie index (out of range).';
    159:
      Result := 'Invalid form variable index (out of range).';
    211:
      Result := 'Action impossible in present state of control.';
    212:
      Result := 'Action impossible while connected.';
    213:
      Result := 'Action impossible while listening.';
    270:
      Result := 'Cannot load specified security library.';
    271:
      Result := 'Cannot open certificate store.';
    272:
      Result := 'Cannot find specified certificate.';
    273:
      Result := 'Cannot acquire security credentials.';
    274:
      Result := 'Cannot find certificate chain.';
    275:
      Result := 'Cannot verify certificate chain.';
    276:
      Result := 'Error during handshake.';
    280:
      Result := 'Error verifying certificate.';
    281:
      Result := 'Could not find client certificate.';
    282:
      Result := 'Could not find server certificate.';
    283:
      Result := 'Error encrypting data.';
    284:
      Result := 'Error decrypting data.';
    301:
      Result := 'Operation interrupted (or timeout).';
    302:
      Result := 'Cannot open AttachedFile.';
    501:
      Result := 'Data field invalid length.';
    502:
      Result := 'Data field invalid format.';
    503:
      Result := 'Data field out of range.';
    504:
      Result := 'Luhn digit check failed.';
    505:
      Result := 'Card date invalid.';
    506:
      Result := 'Card expired.';
    507:
      Result := 'Card type unknown.';
    510:
      Result := 'No gateway specified.';
    511:
      Result := 'Invalid data entered.';
    512:
      Result := 'Truncated response.';
    513:
      Result := 'Invalid response.';
    514:
      Result := 'A Special Field is required for this transaction type.';
    542:
      Result := 'Error computing MD5 hash for Authorize.Net';
    1105:
      Result := 'Already connecting. If you want to reconnect, close the current connection first.';
    1117:
      Result := 'You need to connect first.';
    1119:
      Result := 'You cannot change the LocalHost at this time. A connection is in progress.';
    1120:
      Result := 'Connection dropped by remote host.';
    10004:
      Result := '[10004] Interrupted system call.';
    10009:
      Result := '[10009] Bad file number.';
    10013:
      Result := '[10013] Access denied.';
    10014:
      Result := '[10014] Bad address.';
    10022:
      Result := '[10022] Invalid argument.';
    10024:
      Result := '[10024] Too many open files.';
    10035:
      Result := '[10035] Operation would block.';
    10036:
      Result := '[10036] Operation now in progress.';
    10037:
      Result := '[10037] Operation already in progress.';
    10038:
      Result := '[10038] Socket operation on non-socket.';
    10039:
      Result := '[10039] Destination address required.';
    10040:
      Result := '[10040] Message too long.';
    10041:
      Result := '[10041] Protocol wrong type for socket.';
    10042:
      Result := '[10042] Bad protocol option.';
    10043:
      Result := '[10043] Protocol not supported.';
    10044:
      Result := '[10044] Socket type not supported.';
    10045:
      Result := '[10045] Operation not supported on socket.';
    10046:
      Result := '[10046] Protocol family not supported.';
    10047:
      Result := '[10047] Address family not supported by protocol family.';
    10048:
      Result := '[10048] Address already in use.';
    10049:
      Result := '[10049] Cannot assign requested address.';
    10050:
      Result := '[10050] Network is down.';
    10051:
      Result := '[10051] Network is unreachable.';
    10052:
      Result := '[10052] Net dropped connection or reset.';
    10053:
      Result := '[10053] Software caused connection abort.';
    10054:
      Result := '[10054] Connection reset by peer.';
    10055:
      Result := '[10055] No buffer space available.';
    10056:
      Result := '[10056] Socket is already connected.';
    10057:
      Result := '[10057] Socket is not connected.';
    10058:
      Result := '[10058] Cannot send after socket shutdown.';
    10059:
      Result := '[10059] Too many references.  Cannot splice.';
    10060:
      Result := '[10060] Connection timed out.';
    10061:
      Result := '[10061] Connection refused.';
    10062:
      Result := '[10062] Too many levels of symbolic links.';
    10063:
      Result := '[10063] File name too long.';
    10064:
      Result := '[10064] Host is down.';
    10065:
      Result := '[10065] No route to host.';
    10066:
      Result := '[10066] Directory not empty';
    10067:
      Result := '[10067] Too many processes.';
    10068:
      Result := '[10068] Too many users.';
    10069:
      Result := '[10069] Disc Quota Exceeded.';
    10070:
      Result := '[10070] Stale NFS file handle.';
    10071:
      Result := '[10071] Too many levels of remote in path.';
    10091:
      Result := '[10091] Network subsystem is unavailable.';
    10092:
      Result := '[10092] WINSOCK DLL Version out of range.';
    10093:
      Result := '[10093] Winsock not loaded yet.';
    11001:
      Result := '[11001] Host not found.';
    11002:
      Result := '[11002] Non-authoritative,  [Host not found],  error.  Try again or check DNS setup.';
    11003:
      Result := '[11003] Non-recoverable errors: FORMERR,  REFUSED,  NOTIMP.';
    11004:
      Result := '[11004] Valid name, but no data record.  Check DNS setup.';
  end; // end case
end;

function GetReceiptText(const AXML, ATag: string;
  var APrintText: string): Boolean;
var
  s: string;
begin
  if (AXML > '') and (ATag > '') then
    begin
      s := IQMS.Common.XML.GetXMLTagValue(AXML, ATag);
      APrintText := StringReplace(s, '\n', #13#0, [rfReplaceAll, rfIgnoreCase]);
    end;
end;

function GetReceiptText_API_1(const AXML: string; var ACustomerCopy,
  AMerchantCopy: string): Boolean;
var
  DOM: IXMLDocument;
  Node, ChildNode: IXMLNode;
  i: Integer;
begin
  Result := False;
  if (AXML > '') then
    begin
      DOM := TXMLDocument.Create(nil);
      DOM.LoadFromXML(AXML);
      if TIQWebXMLNodeHelper.FindNodeByName(DOM.DocumentElement, 'Receipt', Node)
      then
        begin
          for i := 0 to Node.ChildNodes.Count - 1 do
            begin
              ChildNode := Node.ChildNodes.Get(i);
              // Type="CustomerCopy"
              if ChildNode.HasAttribute('Type') then
                begin
                  if CompareText(ChildNode.Attributes['Type'], 'CustomerCopy') = 0
                  then
                    ACustomerCopy := ChildNode.Text;
                  if CompareText(ChildNode.Attributes['Type'], 'MerchantCopy') = 0
                  then
                    AMerchantCopy := ChildNode.Text;
                end;
            end;
        end;
      ACustomerCopy := StringReplace(ACustomerCopy, '\n', #13#10,
        [rfReplaceAll, rfIgnoreCase]);
      AMerchantCopy := StringReplace(AMerchantCopy, '\n', #13#10,
        [rfReplaceAll, rfIgnoreCase]);
      Result := (ACustomerCopy > '') or (AMerchantCopy > '');
    end;
end;

procedure PrintXmlReceipts(AOwner: TComponent; AXML: string;
  APrintPreview: Boolean);
var
  APrinter: String;
  ACustomerCopy, AMerchantCopy: string;
begin
  if AXML > '' then
    begin
      GetReceiptText(AXML, 'customerReceipt', ACustomerCopy);
      GetReceiptText(AXML, 'merchantReceipt', AMerchantCopy);
      if APrintPreview then
//        cc_print_receipt.TFrmCCPrintReceipt.DoPrintPreview(ACustomerCopy, AMerchantCopy)
      else
//        cc_print_receipt.TFrmCCPrintReceipt.DoPrint(ACustomerCopy, AMerchantCopy);
    end;
end;

procedure PrintXmlReceipts_API_1(AOwner: TComponent; AXML: string;
  APrintPreview: Boolean);
var
  ACustomerCopy, AMerchantCopy: string;
begin
  if AXML > '' then
    begin
      GetReceiptText_API_1(AXML, ACustomerCopy, AMerchantCopy);
      if APrintPreview then
//        cc_print_receipt.TFrmCCPrintReceipt.DoPrintPreview(ACustomerCopy, AMerchantCopy)
      else
//        cc_print_receipt.TFrmCCPrintReceipt.DoPrint(ACustomerCopy,AMerchantCopy);
    end;
end;

end.

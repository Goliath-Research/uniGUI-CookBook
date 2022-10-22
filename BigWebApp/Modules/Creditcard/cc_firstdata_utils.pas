unit cc_firstdata_utils;

interface

uses
  System.SysUtils,
  cc_types;

function GetResponseText(const AResponseCode: string;
  var AResponseClass: TResponseClass): string;
function GetStandardSecurityCode(const ASecurityResponse: string): string;

implementation

uses
  cc_rscstr,
  IQMS.Common.StringUtils;

function GetResponseText(const AResponseCode: string;
  var AResponseClass: TResponseClass): string;

  function _Eval(const Code: string;
    AResponseClassIfTrue: TResponseClass = rcFailure): Boolean;
  begin
    Result := CompareText(Code, AResponseCode) = 0;
    if Result then
      AResponseClass := AResponseClassIfTrue;
  end;

begin
  AResponseClass := rcFailure; // default

  if _Eval('000', rcSuccess) then
    Result := cc_rscstr.cTXT0000059 // 'Approved'
  else if _Eval('002', rcSuccess) then
    Result := cc_rscstr.cTXT0000514 // 'Approve for partial amount';
  else if _Eval('003', rcSuccess) then
    Result := cc_rscstr.cTXT0000515 // 'Approve VIP';
  else if _Eval('100', rcSecurity) then
    Result := cc_rscstr.cTXT0000516 // 'Do not honor';
  else if _Eval('101', rcFailure) then
    Result := cc_rscstr.cTXT0000517 // 'Expired card';
  else if _Eval('104', rcSecurity) then
    Result := cc_rscstr.cTXT0000518 // 'Restricted card';
  else if _Eval('105', rcSecurity) then
    Result := cc_rscstr.cTXT0000519 // 'Call acquirer''s security department';
  else if _Eval('106', rcFailure) then
    Result := cc_rscstr.cTXT0000520 // 'Allowable PIN tries exceeded';
  else if _Eval('107', rcFailure) then
    Result := cc_rscstr.cTXT0000521 // 'Call for authorization';
  else if _Eval('108', rcWarning) then
    Result := cc_rscstr.cTXT0000522 // 'Refer to issuer''s special conditions';
  else if _Eval('109', rcFailure) then
    // 'Invalid merchant. The merchant is not in the merchant database or
    // the merchant is not permitted to use this particular card.';
    Result := cc_rscstr.cTXT0000523
  else if _Eval('110', rcFailure) then
    Result := cc_rscstr.cTXT0000524 // 'Invalid amount';
  else if _Eval('116', rcFailure) then
    Result := cc_rscstr.cTXT0000525 // 'Not sufficient funds';
  else if _Eval('117', rcFailure) then
    Result := cc_rscstr.cTXT0000526 // 'Incorrect PIN';
  else if _Eval('118', rcFailure) then
    Result := cc_rscstr.cTXT0000527 // 'No card record';
  else if _Eval('119', rcFailure) then
    Result := cc_rscstr.cTXT0000528
    // 'Transaction not permitted to cardholder';
  else if _Eval('120', rcFailure) then
    Result := cc_rscstr.cTXT0000529 // 'Transaction not permitted to terminal';
  else if _Eval('121', rcFailure) then
    Result := cc_rscstr.cTXT0000530 // 'Exceeds withdrawal amount limit';
  else if _Eval('123', rcFailure) then
    Result := cc_rscstr.cTXT0000531 // 'Exceeds withdrawal frequency limit';
  else if _Eval('124', rcSecurity) then
    Result := cc_rscstr.cTXT0000532 // 'Violation of law';
  else if _Eval('130', rcError) then
    Result := cc_rscstr.cTXT0000533 // 'Invalid terminal';
  else if _Eval('131', rcError) then
    Result := cc_rscstr.cTXT0000534 // 'Invalid account number';
  else if _Eval('132', rcFailure) then
    Result := cc_rscstr.cTXT0000535 // 'Unmatched card expiry date';
  else if _Eval('208', rcSecurity) then
    Result := cc_rscstr.cTXT0000536 // 'Lost card';
  else if _Eval('209', rcSecurity) then
    Result := cc_rscstr.cTXT0000537 // 'Stolen card';
  else if _Eval('302', rcFailure) then
    // 'Account closed. The account was closed, probably because the
    // account balance was $0.00.';
    Result := cc_rscstr.cTXT0000538
  else if _Eval('303', rcFailure) then
    Result := cc_rscstr.cTXT0000539
    // 'Unknown account. The account could not be located in the account table.';
  else if _Eval('304', rcFailure) then
    Result := cc_rscstr.cTXT0000540
    // 'Inactive account. The account has not been activated by an approved location.';
  else if _Eval('308', rcFailure) then
    // 'Already active. The card is already active and does not need to be reactivated';
    Result := cc_rscstr.cTXT0000541
  else if _Eval('311', rcFailure) then
    Result := cc_rscstr.cTXT0000542 // 'Not lost or stolen';
  else if _Eval('315', rcError) then
    // 'Bad mag stripe. The mag stripe could not be parsed for account
    // information';
    Result := cc_rscstr.cTXT0000543
  else if _Eval('316', rcFailure) then
    Result := cc_rscstr.cTXT0000544
    // 'Incorrect location. There was a problem with the merchant location.';
  else if _Eval('317', rcFailure) then
    // 'Max balance exceeded. The transaction, if completed, would cause the
    // account balance to be exceeded by the max_balance as specified in the
    // promotion. Some merchants set the max_balance to a value twice the max
    // transaction amount.';
    Result := cc_rscstr.cTXT0000545
  else if _Eval('318', rcFailure) then
    // 'Invalid amount. There was a problem with the amount field in the
    // transaction format - more or less than min/max amounts specified in the
    // promotion for that transaction.';
    Result := cc_rscstr.cTXT0000546
  else if _Eval('319', rcFailure) then
    // 'Invalid clerk. The clerk field was either missing, when required, or
    // the content did not match the requirements';
    Result := cc_rscstr.cTXT0000547
  else if _Eval('320', rcError) then
    Result := cc_rscstr.cTXT0000548 // 'Invalid password';
  else if _Eval('321', rcError) then
    // 'Invalid new password. The new password does not meet the minimum
    // security criteria';
    Result := cc_rscstr.cTXT0000549
  else if _Eval('322', rcFailure) then
    // 'Exceeded account reloads. The clerk/user/location was only permitted
    // to reload some number of accounts. That number was exceeded. (See your
    // Business Manager in order to extend this limit.)';
    Result := cc_rscstr.cTXT0000550
  else if _Eval('323', rcSecurity) then
    // 'Password retry exceeded. The user account has been frozen because the
    // user attempted access and was denied. Seek management assistance.';
    Result := cc_rscstr.cTXT0000551
  else if _Eval('326', rcFailure) then
    // 'Incorrect transaction version or format number for POS transactions';
    Result := cc_rscstr.cTXT0000552
  else if _Eval('327', rcFailure) then
    Result := cc_rscstr.cTXT0000553 // 'Request not permitted by this account';
  else if _Eval('328', rcFailure) then
    // 'Request not permitted by this merchant location';
    Result := cc_rscstr.cTXT0000554
  else if _Eval('329', rcError) then
    Result := cc_rscstr.cTXT0000555 // 'Bad_repay_date';
  else if _Eval('330', rcError) then
    Result := cc_rscstr.cTXT0000556
    // 'Bad checksum. The checksum provided is incorrect.';
  else if _Eval('331', rcFailure) then
    // 'Balance not available (denial). Due to an internal First Data
    // Closed Loop Gift Card (CLGC) issue, information from this account
    // could not be retrieved.';
    Result := cc_rscstr.cTXT0000557
  else if _Eval('332', rcFailure) then
    Result := cc_rscstr.cTXT0000558 // 'Account locked';
  else if _Eval('333', rcFailure) then
    // 'No previous transaction. The void or reversal transaction could not
    // be matched to a previous (original) transaction. In the case of a
    // pre-auth redemption, the corresponding locking transaction could not be
    // identified.';
    Result := cc_rscstr.cTXT0000559
  else if _Eval('334', rcFailure) then
    Result := cc_rscstr.cTXT0000560 // 'Already reversed';
  else if _Eval('336', rcError) then
    // 'Bad authorization code. The authorization code test failed.';
    Result := cc_rscstr.cTXT0000561
  else if _Eval('337', rcFailure) then
    Result := cc_rscstr.cTXT0000562 // 'Too many transactions requested';
  else if _Eval('338', rcError) then
    // 'No transactions available/no more transactions available. There are
    // no transactions for this account or there are no transactions as
    // determined by the specified first transaction number.';
    Result := cc_rscstr.cTXT0000563
  else if _Eval('339', rcFailure) then
    Result := cc_rscstr.cTXT0000564 // 'Transaction history not available';
  else if _Eval('340', rcFailure) then
    Result := cc_rscstr.cTXT0000565 // 'New password required';
  else if _Eval('341', rcFailure) then
    // 'Invalid status change. The status change requested (e.g. lost/stolen,
    // freeze active card) cannot be performed.';
    Result := cc_rscstr.cTXT0000566
  else if _Eval('342', rcFailure) then
    Result := cc_rscstr.cTXT0000567
    // 'Void of activation after account activity';
  else if _Eval('343', rcFailure) then
    // 'No phone service. Attempted a calling card transaction on an account
    // which is not configured for calling card activity.';
    Result := cc_rscstr.cTXT0000568
  else if _Eval('344', rcError) then
    Result := cc_rscstr.cTXT0000569 // 'Internet access disabled';
  else if _Eval('345', rcError) then
    // 'Invalid EAN. The EAN is not correct for the provided account number.';
    Result := cc_rscstr.cTXT0000570
  else if _Eval('346', rcError) then
    // 'Invalid merchant key. The merchant key block provided is invalid.
    // (e.g. The working key provided in an Assign Merchant Working Key
    // transaction).';
    Result := cc_rscstr.cTXT0000571
  else if _Eval('347', rcFailure) then
    // 'Promotions for Internet virtual and physical cards do not match.
    // When enabling a physical card to a virtual card, both must be from the
    // same promotion. Cards for bulk activation request must be from the same
    // promotion';
    Result := cc_rscstr.cTXT0000572
  else if _Eval('348', rcFailure) then
    // 'Invalid transaction source. The provided source (field EA) is not
    // valid for this transaction.';
    Result := cc_rscstr.cTXT0000573
  else if _Eval('349', rcFailure) then
    // 'Account already linked. (e.g. Response when enabling a physical card,
    // when the two provided accounts have already been linked together.)';
    Result := cc_rscstr.cTXT0000574
  else if _Eval('350', rcFailure) then
    // 'Account not in inactive state. (e.g. Response when enabling a physical
    // card, when the physical card in not in an inactive state.)';
    Result := cc_rscstr.cTXT0000575
  else if _Eval('351', rcFailure) then
    // 'First Data Voice Services returns this response on Internet
    // transactions where the interface input parameter is not valid.';
    Result := cc_rscstr.cTXT0000576
  else if _Eval('352', rcFailure) then
    // 'First Data Voice Services returns this response on Internet
    // transactions where they did not receive a response from CLGC.';
    Result := cc_rscstr.cTXT0000577
  else if _Eval('353', rcFailure) then
    // 'First Data Voice Services returns this response on Internet
    // transactions where the client certificate is invalid.';
    Result := cc_rscstr.cTXT0000578
  else if _Eval('354', rcFailure) then
    // 'Merchant not configured as International although the account
    // requires it. (e.g. The account allows currency conversion but the
    // merchant is not configured for International.)';
    Result := cc_rscstr.cTXT0000579
  else if _Eval('355', rcFailure) then
    // 'Invalid currency. The provided currency is invalid.';
    Result := cc_rscstr.cTXT0000580
  else if _Eval('356', rcFailure) then
    // 'Request not International. Merchant configured to require currency
    // information for each financial transaction, however none was sent.';
    Result := cc_rscstr.cTXT0000581
  else if _Eval('357', rcError) then
    // 'Currency conversion error. Internal CLGC system error.';
    Result := cc_rscstr.cTXT0000582
  else if _Eval('359', rcFailure) then
    // 'The terminal transaction number did not match (on a void or reversal).';
    Result := cc_rscstr.cTXT0000583
  else if _Eval('360', rcFailure) then
    // 'First Data Voice Services added a layer of validation that checks the
    // data they receive from CLGC to make sure it is HTML friendly (i.e. no
    // binary data). First Data Voice Services will return this response on
    // Internet transactions if the check fails (the data is not HTML friendly).';
    Result := cc_rscstr.cTXT0000584
  else if _Eval('367', rcFailure) then
    // 'Target embossed card entered and Transaction count entered do not match';
    Result := cc_rscstr.cTXT0000585
  else if _Eval('368', rcFailure) then
    Result := cc_rscstr.cTXT0000586 // 'No account link';
  else if _Eval('369', rcFailure) then
    Result := cc_rscstr.cTXT0000587 // 'Invalid time zone';
  else if _Eval('370', rcFailure) then
    Result := cc_rscstr.cTXT0000588 // 'Account on hold';
  else if _Eval('372', rcFailure) then
    Result := cc_rscstr.cTXT0000589 // 'Promo location restricted';
  else if _Eval('373', rcFailure) then
    Result := cc_rscstr.cTXT0000590 // 'Invalid Card Account';
  else if _Eval('374', rcFailure) then
    Result := cc_rscstr.cTXT0000591 // 'Product code(s) restricted';
  else if _Eval('375', rcFailure) then
    // 'Bad Post Date. The Post Date is not a valid date.';
    Result := cc_rscstr.cTXT0000592
  else if _Eval('376', rcFailure) then
    Result := cc_rscstr.cTXT0000593 // 'Account status is void lock';
  else if _Eval('377', rcFailure) then
    Result := cc_rscstr.cTXT0000594 // 'Already active and reloadable';
  else if _Eval('378', rcFailure) then
    // 'Account is Purged. The Account record was purged from the database.';
    Result := cc_rscstr.cTXT0000595
  else if _Eval('380', rcError) then
    Result := cc_rscstr.cTXT0000596 // 'Bulk activation error';
  else if _Eval('381', rcError) then
    Result := cc_rscstr.cTXT0000597 // 'Bulk activation un-attempted error';
  else if _Eval('382', rcError) then
    Result := cc_rscstr.cTXT0000598 // 'Bulk activation package amount error';
  else if _Eval('383', rcFailure) then
    Result := cc_rscstr.cTXT0000599 // 'Store location zero not allowed';
  else if _Eval('384', rcError) then
    Result := cc_rscstr.cTXT0000600 // 'Account row locked';
  else if _Eval('385', rcFailure) then
    Result := cc_rscstr.cTXT0000601 // 'Accepted but not yet processed';
  else if _Eval('402', rcFailure) then
    Result := cc_rscstr.cTXT0000602 // 'TransArmor Service Unavailable';
  else if _Eval('403', rcFailure) then
    // 'TransArmor Invalid Token or Account Number';
    Result := cc_rscstr.cTXT0000603
  else if _Eval('404', rcError) then
    Result := cc_rscstr.cTXT0000604 // 'TransArmor Key Error';
  else if _Eval('500', rcFailure) then
    Result := cc_rscstr.cTXT0000605 // 'Decline';
  else if _Eval('501', rcFailure) then
    Result := cc_rscstr.cTXT0000606
    // 'Date of Birth Error for Check Processing';
  else if _Eval('502', rcError) then
    Result := cc_rscstr.cTXT0000607 // 'Invalid State Code';
  else if _Eval('503', rcFailure) then
    Result := cc_rscstr.cTXT0000608 // 'New Account Information';
  else if _Eval('504', rcFailure) then
    Result := cc_rscstr.cTXT0000609 // 'Do not try again';
  else if _Eval('505', rcError) then
    Result := cc_rscstr.cTXT0000610 // 'Please retry';
  else if _Eval('506', rcFailure) then
    Result := cc_rscstr.cTXT0000611 // 'Invalid Checking Account Number';
  else if _Eval('507', rcFailure) then
    Result := cc_rscstr.cTXT0000612 // 'New Account Information available';
  else if _Eval('508', rcError) then
    // 'Try again later - Declined: Association?s payment cancellation advice
    // code provided. Applies to recurring authorizations only. These are
    // examples of what may have occurred: the account is over the credit
    // limit try again in 72 hours.';
    Result := cc_rscstr.cTXT0000613
  else if _Eval('509', rcFailure) then
    // 'Do not try again - Applies to recurring authorizations only.
    // The card has expired';
    Result := cc_rscstr.cTXT0000614
  else if _Eval('510', rcFailure) then
    // 'New Account Information - Applies to recurring authorizations only.
    // The card has expired';
    Result := cc_rscstr.cTXT0000615
  else if _Eval('511', rcError) then
    // 'Try again later - Applies to recurring authorizations only. The card
    // has expired. Get the new expiration date and try again.';
    Result := cc_rscstr.cTXT0000616
  else if _Eval('512', rcFailure) then
    Result := cc_rscstr.cTXT0000617 // 'Service not allowed';
  else if _Eval('513', rcFailure) then
    Result := cc_rscstr.cTXT0000618
    // 'Decline. Transaction not permitted to acquirer or terminal';
  else if _Eval('514', rcFailure) then
    // 'Do not try again - Applies to recurring authorizations only.
    // There was security violation.';
    Result := cc_rscstr.cTXT0000619
  else if _Eval('515', rcFailure) then
    // 'Declined. No term record on First Data system';
    Result := cc_rscstr.cTXT0000620
  else if _Eval('516', rcError) then
    // 'Please retry - Reasons for this error are one of the following:
    // Format Error, Unable to route transaction, Switch or issuer
    // unavailable, System Busy, Timeout';
    Result := cc_rscstr.cTXT0000621
  else if _Eval('517', rcFailure) then
    Result := cc_rscstr.cTXT0000622 // 'CVV2 Declined';
  else if _Eval('518', rcFailure) then
    // 'Invalid account/date or sales date in future';
    Result := cc_rscstr.cTXT0000623
  else if _Eval('519', rcFailure) then
    Result := cc_rscstr.cTXT0000624 // 'Invalid Effective Date';
  else if _Eval('520', rcFailure) then
    Result := cc_rscstr.cTXT0000625 // 'Reversal Rejected. Do not try again.';
  else if _Eval('521', rcFailure) then
    Result := cc_rscstr.cTXT0000626 // 'Enter lesser amount';
  else if _Eval('522', rcFailure) then
    // 'Cash Back greater than total Transaction amount';
    Result := cc_rscstr.cTXT0000627
  else if _Eval('523', rcFailure) then
    Result := cc_rscstr.cTXT0000628 // 'Crypto box is offline';
  else if _Eval('524', rcFailure) then
    // 'Debit Switch unavailable Timeout Retry - Communications link to
    // debit/EBT network gateway is down or responded with a System
    // Malfunction (96) message';
    Result := cc_rscstr.cTXT0000629
  else if _Eval('525', rcFailure) then
    // 'Debit/EBT network gateway cannot get through to the ISSUER.';
    Result := cc_rscstr.cTXT0000630
  else if _Eval('526', rcFailure) then
    // 'Undefined Card - Debit/EBT network gateway cannot route card based on
    // Merchant Entitlement';
    Result := cc_rscstr.cTXT0000631
  else if _Eval('527', rcFailure) then
    // 'Network Response indicates that Merchant ID / SE is invalid';
    Result := cc_rscstr.cTXT0000632
  else if _Eval('528', rcFailure) then
    // 'Debit/EBT transaction count exceeds pre-determined limit in specified
    // time/ Withdrawal limit exceeded.';
    Result := cc_rscstr.cTXT0000633
  else if _Eval('529', rcFailure) then
    // 'Resubmission of transaction violates debit/EBT network frequency';
    Result := cc_rscstr.cTXT0000634
  else if _Eval('530', rcError) then
    // 'The authorizing network has a problem decrypting the cryptogram in
    // the request';
    Result := cc_rscstr.cTXT0000635
  else if _Eval('532', rcError) then
    // 'The DUKPT Base Derivation key is missing or incorrect in the PIN pad,
    // or PIN key synchronization error.';
    Result := cc_rscstr.cTXT0000636
  else if _Eval('540', rcFailure) then
    Result := cc_rscstr.cTXT0000637 // 'Edit Honor';
  else if _Eval('541', rcFailure) then
    Result := cc_rscstr.cTXT0000638 // 'No Savings Account';
  else if _Eval('542', rcFailure) then
    // 'DUKPT: An error while processing the PIN block that is not related
    // to the point- of-sale equipment. Contact the Help Desk for assistance.';
    Result := cc_rscstr.cTXT0000639
  else if _Eval('701', rcFailure) then
    Result := cc_rscstr.cTXT0000640 // 'Approved EMV Key Load';
  else if _Eval('702', rcError) then
    Result := cc_rscstr.cTXT0000641 // 'EMV Key Download Error';
  else if _Eval('703', rcFailure) then
    // 'Approved EMV Key Load, more key load data pending';
    Result := cc_rscstr.cTXT0000642
  else if _Eval('704', rcSecurity) then
    Result := cc_rscstr.cTXT0000643 // 'Pick Up Card';
  else if _Eval('708', rcWarning) then
    Result := cc_rscstr.cTXT0000644 // 'Honor With Authentication';
  else if _Eval('726', rcFailure) then
    Result := cc_rscstr.cTXT0000645 // 'Unable to Locate Record On File';
  else if _Eval('727', rcFailure) then
    Result := cc_rscstr.cTXT0000646
    // 'Refer - Call Authorization (Checks only)';
  else if _Eval('728', rcFailure) then
    Result := cc_rscstr.cTXT0000647 // 'Referred - Skip Trace Info';
  else if _Eval('729', rcFailure) then
    Result := cc_rscstr.cTXT0000648 // 'Hard Negative Info On File';
  else if _Eval('740', rcFailure) then
    Result := cc_rscstr.cTXT0000649 // 'Totals Unavailable';
  else if _Eval('767', rcFailure) then
    Result := cc_rscstr.cTXT0000650 // 'Hard Capture; Pick Up';
  else if _Eval('771', rcFailure) then
    Result := cc_rscstr.cTXT0000651 // 'Amount Too Large';
  else if _Eval('772', rcFailure) then
    Result := cc_rscstr.cTXT0000652 // 'Duplicate Return';
  else if _Eval('773', rcFailure) then
    Result := cc_rscstr.cTXT0000653 // 'Unsuccessful';
  else if _Eval('774', rcFailure) then
    Result := cc_rscstr.cTXT0000654 // 'Duplicate Reversal';
  else if _Eval('775', rcFailure) then
    Result := cc_rscstr.cTXT0000655 // 'Subsystem Unavailable';
  else if _Eval('776', rcFailure) then
    Result := cc_rscstr.cTXT0000656 // 'Duplicate Completion';
  else if _Eval('782', rcFailure) then
    Result := cc_rscstr.cTXT0000657 // 'Count Exceeds Limit';
  // 07/28/2015 According to FirstData, 785 is successful.
  else if _Eval('785', rcSuccess) then
    Result := cc_rscstr.cTXT0000658 // 'No reason to decline.';
  else if _Eval('790', rcFailure) then
    // 'Not approved. Used only in Visa bill/recurring payment. Merchant
    // must not resubmit same transaction but may continue billing process
    // in subsequent billing period.';
    Result := cc_rscstr.cTXT0000659
  else if _Eval('791', rcFailure) then
    // 'Not approved. Used only in Visa bill/recurring payment. Merchant must
    // stop recurring payment requests.';
    Result := cc_rscstr.cTXT0000660
  else if _Eval('902', rcFailure) then
    // 'Invalid transaction. This card or terminal is not permitted to perform
    // this transaction, or the transaction type is invalid, or First Data is
    // unable to route a refund request to the network.';
    Result := cc_rscstr.cTXT0000661
  else if _Eval('904', rcError) then
    Result := cc_rscstr.cTXT0000662 // 'Format error.';
  else if _Eval('906', rcError) then
    // 'System Error. There is a problem with the host processing system.
    // Call your helpdesk or operations support.';
    Result := cc_rscstr.cTXT0000663
  else if _Eval('908', rcError) then
    Result := cc_rscstr.cTXT0000664
    // 'Transaction destination not found for routing.';
  else if _Eval('909', rcError) then
    Result := cc_rscstr.cTXT0000665 // 'System malfunction.';
  else if _Eval('911', rcError) then
    Result := cc_rscstr.cTXT0000666 // 'Card issuer timed out.';
  else if _Eval('913', rcError) then
    Result := cc_rscstr.cTXT0000667 // 'Duplicate transaction.';
  else if _Eval('914', rcFailure) then
    // 'Void/Full Reversal requests in which the Original Authorization was
    // not found.';
    Result := cc_rscstr.cTXT0000668
  else if _Eval('940', rcError) then
    Result := cc_rscstr.cTXT0000669 // 'Error.';
  else if _Eval('941', rcFailure) then
    Result := cc_rscstr.cTXT0000670 // 'No such issuer.';
  else if _Eval('954', rcFailure) then
    Result := cc_rscstr.cTXT0000671; // 'CCV failed.';
end;

function GetStandardSecurityCode(const ASecurityResponse: string): string;
begin
  if CompareText(ASecurityResponse, 'MATCH') = 0 then
    Result := 'M'
  else if CompareText(ASecurityResponse, 'NOMTCH') = 0 then
    Result := 'N'
  else if CompareText(ASecurityResponse, 'NOTPRC') = 0 then
    Result := 'P'
  else if CompareText(ASecurityResponse, 'NOTPRV') = 0 then
    Result := 'S'
  else if CompareText(ASecurityResponse, 'NOTPRT') = 0 then
    Result := 'U'
  else
    Result := ASecurityResponse;
end;

end.

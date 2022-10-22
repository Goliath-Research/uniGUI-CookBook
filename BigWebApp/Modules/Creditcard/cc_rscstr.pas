unit cc_rscstr;

interface

resourcestring
  // cc_rscstr.cTXT0000501
  cTXT0000001 = 'Credit Cards - %s';
  cTXT0000002 = 'Visa';
  cTXT0000003 = 'MasterCard';
  cTXT0000004 = 'American Express';
  cTXT0000005 = 'Discover/Novus';
  cTXT0000006 = 'BankCard';
  cTXT0000007 = 'CarteBlanche';
  cTXT0000008 = 'Delta';
  cTXT0000009 = 'Diners Club';
  cTXT0000010 = 'Enroute';
  cTXT0000011 = 'EuroCard';
  cTXT0000012 = 'JCB';
  cTXT0000013 = 'Maestro';
  cTXT0000014 = 'The credit card type is already in the list.';
  cTXT0000015 = 'Credit card type required.';
  cTXT0000016 = 'The account number must be unique per customer.';
  cTXT0000017 = 'Credit Card number required.';
  cTXT0000018 = 'Credit Card type required.';
  cTXT0000019 = 'Expiration date required.';
  cTXT0000020 = 'Invalid credit card.';
  cTXT0000021 = 'Cannot delete.  This card type is currently associated ' +
    'with one or more customer credit cards.';
  cTXT0000022 = 'Add Credit Card - %s';
  cTXT0000023 = 'Save changes first?';
  cTXT0000024 = 'Please specify a Customer.';
  cTXT0000025 = 'Application Error:  Please specify a dataset.';
  cTXT0000026 = 'Please create a record before attempting to attach a ' +
    'credit card.';
  cTXT0000027 = 'Application Error:  The required dataset fields for ' +
    'attaching a credit card were not found.';
  cTXT0000028 = 'Invalid card expiration date.';
  cTXT0000029 = 'Invalid card type.  The card type does not match the ' +
    'credit card number.';
  cTXT0000030 = 'Invalid credit card number.';
  cTXT0000031 = 'Success';
  cTXT0000032 = 'Error';
  cTXT0000033 = 'Warning';
  cTXT0000034 = 'A transaction is being processed.  Are you sure you want ' +
   'to exit?';
  cTXT0000035 = 'Failed.';
  cTXT0000036 = 'Processing time-out reversal.  Please do not close this window.';
  cTXT0000037 = 'Reversal will be sent in %d seconds...';
  cTXT0000038 = 'Sending reversal ...';
  cTXT0000039 = 'The maximum number of reversal attempts have been made.  ' +
    'Please contact your gateway for assistance.';
  cTXT0000040 = 'Reversal attempt failed.  Waiting to resend.';
  cTXT0000041 = 'Reversal attempt failed.  Waiting to resend final attempt.';
  cTXT0000042 = 'Please enter a cardholder name.';
  // cTXT0000043 = '';
  // cTXT0000044 = '';
  // cTXT0000045 = '';
  // cTXT0000046 = '';
  // cTXT0000047 = '';
  cTXT0000048 = 'Please select a record.';
  cTXT0000049 = 'Your Credit Card Merchant account information has either ' +
    'not been completed, or a Credit Card Account is unavailable for ' +
    'the selected currency and EPlant.  Please set up Credit Card ' +
    'Merchant information in System Parameters.';
  cTXT0000050 = 'You are not licensed to use Credit Card Processing.';
  cTXT0000051 = 'Success!  The card is valid.';
  cTXT0000052 = 'Invalid number for Amount.';
  cTXT0000053 = 'Authorizing.  Please wait...';
  cTXT0000054 = 'Authorization error.';
  cTXT0000055 = 'Transaction approved.';
  cTXT0000056 = 'Transaction declined.';
  cTXT0000057 = 'Not a valid month (01 to 12).  Please check the ' +
    'Expiration Date.';
  cTXT0000058 = 'Not a valid year.  Please check the Expiration Date.';
  cTXT0000059 = 'Approved';
  cTXT0000060 = 'Declined';
  cTXT0000061 = 'Could not update database.  Invalid number for amount.';
  cTXT0000062 = 'Please enter a credit card number.';
  cTXT0000063 = 'Please enter an expiration date.';
  cTXT0000064 = 'Please enter a value for Amount.';
  cTXT0000065 = 'Invalid number for amount.';
  cTXT0000066 = 'Credit card information is missing.';
  cTXT0000067 = 'Void the current transaction?';
  cTXT0000068 = 'Transaction voided.';
  cTXT0000069 = 'Approval Response';
  cTXT0000070 = 'Customer address matches, but the postal code does not.';
  // AVS Warning
  cTXT0000071 = 'The Address Verification System (AVS) has issued an ' +
    'unknown error.';
  cTXT0000072 = 'No match for customer address or postal code.'; // AVS Warning
  cTXT0000073 = 'AVS is not applicable to this transaction.';
  cTXT0000074 = 'Please retry. The issuer system was unavailable.';
  cTXT0000075 = 'Address Verification Service is not supported by the issuer.'; // AVS Failed
  cTXT0000076 = 'Address information is unavailable.'; // AVS Warning
  cTXT0000077 = 'Nine-digit postal code matches, but the address does not.';
  // AVS Warning
  cTXT0000078 = 'Success!  Exact AVS match on the nine-digit postal code.';
  cTXT0000079 = 'Success!  Exact AVS match on the five-digit postal code.';
  cTXT0000080 = 'Five-digit postal code matches, but the address does not.';
  // AVS Warning
  cTXT0000081 = 'Although the street address was matched for this ' +
    'international transaction, the postal code could not be verified ' +
    'because of incompatible formats.'; // AVS Failed
  cTXT0000082 = 'The street address and postal code could not be verified ' +
    'for this international transaction because of incompatible formats.';
  // AVS Failed
  cTXT0000083 = 'Success!  Street addresses and postal codes match for ' +
    'this international transaction.';
  cTXT0000084 = 'The address information not be verified for this ' +
    'international transaction.'; // AVS Failed
  cTXT0000085 = 'Success! The street address and postal code match for ' +
    'this international transaction.';
  cTXT0000086 = 'Although the postal codes match for this international ' +
    'transaction, the street address could not be verified because of ' +
    'incompatible formats.'; // AVS Failed
  cTXT0000087 = 'Success!  CVV2 match.';
  cTXT0000088 = 'CVV2 no match.'; // CVV Failed
  cTXT0000089 = 'Not processed.';
  cTXT0000090 = 'Merchant has indicated that CVV2 is not present on ' +
    'this card.'; // CVV Warning
  cTXT0000091 = 'Issuer not certified and/or has not provided Visa ' +
    'encryption keys.'; // CVV Warning
  cTXT0000092 = 'The card did not pass validation check.'; //
  cTXT0000093 = 'Settle the batch now?';
  cTXT0000094 = 'Cannot reconcile batch.';
  // cTXT0000095 = 'Please visit the merchant Web site to resolve transactions.';
  cTXT0000096 = 'Invalid number returned for Batch Amount:  %s';
  cTXT0000097 = 'Invalid number returned for Batch Amount:  %s';
  cTXT0000098 = 'Cannot settle.  This batch is empty.';
  cTXT0000099 = 'Batch count values do not match.  %f was expected, ' +
    'but %f was returned.  Continue anyway?';
  cTXT0000100 = 'Batch amount values do not match.  %f was expected, ' +
    'but %f was returned.  Continue anyway?';
  cTXT0000101 = 'Cannot settle batch.';
  cTXT0000102 = 'Please select a credit card transaction.';
  cTXT0000103 = 'Credit card number is empty.';
  cTXT0000104 = 'Retrieval number not found.';
  cTXT0000105 = 'Void the current transaction?';
  cTXT0000106 = 'Voiding transaction.  Please wait...';
  cTXT0000107 = 'Transaction voided.';
  cTXT0000108 = 'Error voiding transaction.';
  cTXT0000109 = 'Permanently mark this batch as settled? ' +
    'This action is not recommended unless you are sure these ' +
    'transactions have already been settled by the merchant.'#13#13 +
    'Continue?';
  cTXT0000110 = 'About to mark this batch as settled.  Continue?';
  cTXT0000111 = 'Error updating database.';
  cTXT0000112 = 'Charge Back current transaction?';
  cTXT0000113 = 'STIP (Stand-In Processing): time-out response.';
  cTXT0000114 = 'STIP: amount below issuer limit.';
  cTXT0000115 = 'STIP: issuer in Suppress Inquiry mode.';
  cTXT0000116 = 'STIP: issuer unavailable.';
  cTXT0000117 = 'Issuer generated response.';
  cTXT0000118 = 'Off-line approval: POS device generated.';
  cTXT0000119 = 'Acquirer approval: Base I unavailable.';
  cTXT0000120 = 'Acquirer approval of a referral.';
  cTXT0000121 = 'Use for non-authorized transactions; such as credit ' +
    'card credits.';
  cTXT0000122 = 'Referral: authorization code manually keyed.';
  cTXT0000123 = 'Off-line approval: authorization code manually keyed.';
  cTXT0000124 = 'CAFIS Interface Off-Line Post-Authorization';
  cTXT0000125 = 'Issuer Approval: Post-Authorization';
  cTXT0000126 = 'Service is unsupported.'; // AVS Warning
  cTXT0000127 = 'Transaction Failed.  Refer to issuer.';
  cTXT0000128 = 'Transaction Failed.  Refer to issuer.  There is a ' +
    'special condition.';
  cTXT0000129 = 'Transaction Failed.  File is currently unavailable.  ' +
    'Please retry.';
  cTXT0000130 = 'Transaction Failed.  Issuer or switch is unavailable.  ' +
    'Please retry.';
  cTXT0000131 = 'Security Warning! Pickup or hold card.';
  cTXT0000132 =
    'Security Warning! Pickup or hold card. There is a special condition.';
  cTXT0000133 =
    'Security Warning! Pickup or hold card. Card was reported as lost.';
  cTXT0000134 =
    'Security Warning! Pickup or hold card. Card was reported as stolen.';
  cTXT0000135 = 'Transaction Failed. Verification error.';
  cTXT0000136 = 'Transaction Failed. Already reversed at switch.';
  cTXT0000137 = 'Transaction Failed. Invalid amount.';
  cTXT0000138 = 'Transaction Failed. Cannot verify PIN.';
  cTXT0000139 = 'Transaction Failed. Invalid card number.';
  cTXT0000140 = 'Transaction Failed. Cashback limit exceeded.';
  cTXT0000141 = 'Transaction Failed. Cashback service is unavailable.';
  cTXT0000142 = 'Transaction Failed. Invalid expiration date.';
  cTXT0000143 = 'Security Warning! Do not honor.';
  cTXT0000144 = 'Transaction Failed. Insufficient funds.';
  cTXT0000145 = 'Transaction Failed. Exceeds issuer withdrawal limit.';
  cTXT0000146 = 'Transaction Failed. Exceeds withdrawal limit.';
  cTXT0000147 = 'Transaction Failed. Invalid service code.  Restricted.';
  cTXT0000148 = 'Transaction Failed. Activity limit exceeded.';
  cTXT0000149 = 'Encryption error.  Cannot proceed.';
  cTXT0000150 = 'Transaction Failed.  Error condition.';
  cTXT0000151 = 'Transaction Failed.  Card is expired.';
  cTXT0000152 = 'Transaction Failed.  Routing Error:  Destination not found.';
  cTXT0000153 = 'Transaction Failed.  Error:  Invalid transaction.';
  cTXT0000154 = 'Transaction Failed.  No account.';
  cTXT0000155 = 'Transaction Failed. Unable to back out transaction.';
  cTXT0000156 = 'Transaction Failed. Unable to locate matching account.';
  cTXT0000157 = 'Transaction Failed. Inconsistent data, revision or repeat.';
  cTXT0000158 = 'Transaction Failed. No checking account.';
  cTXT0000159 = 'Transaction Failed. No credit account.';
  cTXT0000160 = 'Transaction Failed. No savings account.';
  cTXT0000161 = 'Transaction Failed. User not found.';
  cTXT0000162 = 'Transaction Failed. PIN tries exceeded.';
  cTXT0000163 = 'Transaction Failed.  Please re-enter transaction.';
  cTXT0000164 = 'Warning! Security violation.';
  cTXT0000165 = 'Transaction Failed. Transactions not permitted with ' +
    'this card.';
  cTXT0000166 = 'Transaction Failed. Transactions not permitted with ' +
    'this terminal.';
  cTXT0000167 = 'Transaction Failed.  Error: System malfunction.';
  cTXT0000168 = 'Transaction Failed.  Invalid Merchant ID.';
  cTXT0000169 = 'Transaction Failed.  Invalid PIN number.';
  cTXT0000170 = 'Transaction Failed.  Invalid CVV2 number.';
  cTXT0000171 = 'There are no transactions to settle.';
  cTXT0000172 = 'Settling batch ...';
  cTXT0000173 = 'Success!  Batch %s settlement accepted.';
  cTXT0000174 = 'Failed!  Batch %s settlement rejected.';
  cTXT0000175 = 'Duplicate Batch number, %s.  A Batch settlement with this ' +
    'Batch Number was sent on %s.';
  cTXT0000176 = 'Settling batch.  Please wait.';
  cTXT0000177 = 'The total amount value of unsettled transactions is 0.  ' +
    'Continue anyway?';
  cTXT0000178 = 'Application Error:  This record cannot be voided.';
  cTXT0000179 = 'Charge credit card?';
  cTXT0000180 = 'Some transactions could not be settled.  Please review ' +
    'each transaction error.';
  cTXT0000181 = 'Amount cannot be negative.';
  cTXT0000182 = 'Invalid number for Tax.';
  cTXT0000183 = 'Invalid number for Freight.';
  cTXT0000184 = 'Could not update database.  Invalid number for tax.';
  cTXT0000185 = 'Invalid expiration date.';
  cTXT0000186 = 'Charge back current transaction?  This will refund the ' +
    'customer credit card with this transaction amount.';
  cTXT0000187 = 'Transaction ID is 0.  Cannot void.';
  cTXT0000188 = 'This transaction has not been settled.  Would you like to ' +
    'void the transaction instead?';
  cTXT0000189 = 'This transaction has been voided.  Cannot charge back.';
  cTXT0000190 =
    'This transaction has already been charged back to the customer.';
  cTXT0000191 =
    'The customer street address as it appears on their monthly statement.  ' +
    'Only the street number, street name, and apartment number are ' +
    'required.  If the customer address is very long, include only ' +
    'the street number.';
  cTXT0000192 = 'Update card address and postal code?';
  cTXT0000193 = 'Blocked terminal';
  cTXT0000194 = 'Card type error';
  cTXT0000195 = 'Device error';
  cTXT0000196 = 'Error in Batch';
  cTXT0000197 = 'Sequence error';
  cTXT0000198 = 'Transmission error';
  cTXT0000199 = 'Unknown error';
  cTXT0000200 = 'Routing error';
  cTXT0000201 = 'Mark the selected transaction as settled?'#13#13 +
    'This action does not settle a transaction.  ' +
    'It is used to mark a transaction as settled, ' +
    'which has already been settled manually with the gateway.';
  cTXT0000202 = 'The current transaction has already been settled.';
  cTXT0000203 = 'The current transaction has been voided.  Cannot settle.';
  cTXT0000204 =
    'The current transaction has been charged back.  Cannot settle.';
  cTXT0000205 = 'Setting:  Transaction Key (See System Parameters)';
  cTXT0000206 = 'Setting:  Hash Value (See System Parameters)';
  cTXT0000207 = 'Please select an Invoice or a Sales Order';
  cTXT0000208 = 'Setting:  Login Name (See System Parameters)';
  cTXT0000209 = 'The Sales Order or the Invoice must have line items.';
  cTXT0000210 = 'To qualify for Level %d processing, the following fields ' +
    'or conditions must be met:';
  cTXT0000211 = 'Do you want to charge the card anyway?';
  cTXT0000212 = 'A separate first and last card holder name is recommended.';
  cTXT0000213 = 'A User ID is required for 3DSI charge back transactions.  ' +
    'This setting is different from the Merchant Login Name.  Please enter ' +
    'your User ID in System Parameters.';
  cTXT0000214 = 'Although the customer address information is optional, it is '
    + 'recommended that you supply complete data for address verification (AVS).  '
    + 'Transactions without an address may affect your interchange rates, and '
    + 'are not recommended because ' + 'of the high risk of fraud.'#13#13 +
    'Continue processing anyway?';
  cTXT0000215 = 'Invoice number is required.';
//  cTXT0000216 = 'A Response Approval Code was not provided for ' +
//    'Transaction # %.0f.  Cannot settle batch.';
  cTXT0000217 = 'Clear address information?';
  cTXT0000218 = 'This action tests the address information against the ' +
    'Address Verification System (AVS).  ' +
    'Please check the response below for the results.';
  cTXT0000219 = 'No address verification has been requested.';
  cTXT0000220 = 'Transaction Successful.';
  cTXT0000221 = 'Transaction Successful with AVS Warning.';
  cTXT0000222 = 'No transaction was made.  There is nothing to void.';
  cTXT0000223 = 'The transaction has already been voided.';
  cTXT0000224 = 'Status';
  cTXT0000225 = '%s [Code "%s"]';
  cTXT0000226 = 'Unknown [Code "%s"]';
  cTXT0000227 = 'Response Code';
  cTXT0000228 = 'AVS Response';
  cTXT0000229 = 'Approval Code';
  cTXT0000230 = 'Security Response';
  cTXT0000231 = 'Retrieval Number';
  cTXT0000232 = 'Transaction Number';
  cTXT0000233 = 'Transaction ID';
  cTXT0000234 = 'Response Invoice Number';
  cTXT0000235 = 'Response Approval Code is empty.  Cannot proceed.';
  cTXT0000236 = 'Error crediting transaction.';
  cTXT0000237 = 'Crediting transaction.  Please wait.';
  cTXT0000238 = 'Charge - %s';
  cTXT0000239 = 'Please enter an address.  Cannot proceed with test.';
  cTXT0000240 = 'Please enter a postal code.  Cannot proceed with test.';
  cTXT0000241 = 'Transaction #';
  cTXT0000242 = 'Transaction/Reference #';
  cTXT0000243 = 'A Retrieval Reference # is required to settle.  Do you want ' +
    'to enter an Retrieval Reference #?';
  cTXT0000244 = 'A Transaction/Reference # is required to settle.  Do you ' +
    'want to enter an Transaction/Reference #?';
  cTXT0000245 = 'An approval code is required to settle.  Do you want to ' +
    'enter an approval code?';
  cTXT0000246 = 'Please enter a credit card number.';
  cTXT0000247 = 'Please select a credit card type.';
  cTXT0000248 = 'Please enter an expiration date.';
  cTXT0000249 = 'Please enter an authorized amount.';
  cTXT0000250 = 'Settling transaction.  Please wait.';
  cTXT0000251 =
    'A customer is required for some pick lists to display.  Do you want ' +
    'to select a customer?';
  cTXT0000252 = 'Please select a customer.  Cannot display pick list.';
  cTXT0000253 = 'Toggle source of address information:'#13 +
    'Currently showing Customer address.'#13'Click to display Billing address.';
  cTXT0000254 = 'Toggle source of address information:'#13 +
    'Currently showing Billing address.'#13'Click to display Customer address.';
  cTXT0000255 = 'Complete data is required for address verification (AVS).';
  cTXT0000256 = 'Authorized Amount is 0.  Cannot proceed.';
  cTXT0000257 = 'Charge - Invoice # %s';
  cTXT0000258 = 'Charge - Order # %s';
  cTXT0000259 = 'Charge';
  cTXT0000260 = 'Attached Credit Card';
  cTXT0000261 = 'Invoice # %s';
  cTXT0000262 = 'Order # %s';
  cTXT0000263 = 'CRM Activity # %s';
  cTXT0000264 = 'Sales Quotation # %s';
  cTXT0000265 = 'A separate first and last name for the Cardholder, as it ' +
    'appears on the card, may be required by Bank of America.';
  cTXT0000266 = '%d Day(s), %d Hour(s)';
  cTXT0000267 = '%d Hour(s), %d Minute(s)';
  cTXT0000268 = '%s [TEST MODE]';
  cTXT0000269 = 'Response Data';
  cTXT0000270 = 'Invalid amount for Test Mode.  Values supplied in Test ' +
    'Mode must be less than 100.  Do you want to attempt a test transaction ' +
    'anyway?';
  cTXT0000271 = 'Accessing Customer Credit Cards.  Please wait.';
  cTXT0000272 = '%s (MM%sYY)'; // Expires (MM/YY)
  cTXT0000273 = 'Test transactions require a value of less than 100.  ' +
    'Do you want to use a test value of 1 instead?';
  cTXT0000274 = 'Your gateway does not support AVS testing.';
  cTXT0000275 = 'Unknown error';
  cTXT0000276 = 'AVS Result:';
  cTXT0000277 =
    'The Gateway, %s, cannot process the current credit card type, %s.';
  cTXT0000278 = 'Please select a currency.';
  cTXT0000279 = 'Clear all charge fields, and switch entry option?';
  cTXT0000280 = 'Access denied.  DBA status required.';
  cTXT0000281 = 'Insufficient rights.  Access denied.';
  cTXT0000282 = 'Currency of the original Sales Order or Invoice.'#13 +
    'All credit card transactions must be paid in %s.';
  cTXT0000283 = 'Spot rate used to convert original currency to U.S. Dollars.';
  cTXT0000284 = 'Do you want to set the PO number to the associated PO (%s)';
  cTXT0000285 = 'Clear Invoice number?';
  cTXT0000286 = 'Clear Sales Order number?';
  cTXT0000287 = 'Clear Purchase Order number?';
  cTXT0000288 = 'Clear shipping address?';
  cTXT0000289 = 'U.S. Dollars';
  cTXT0000290 = 'Address will be submitted to Moneris as follows:'#13 +
    ' Street #: %s'#13 + ' Street Name: %s';
  cTXT0000291 = 'The test credit card number you have ' +
    'supplied (5000300020003003) cannot be used with a live account.  ' +
    'It will void the entire batch of pending transactions.';
  cTXT0000292 = 'Credit Card Parameters could not be created.';
  cTXT0000293 = 'Error updating setting code, %s:';
  cTXT0000294 = 'Amounts converted to %s:';
  cTXT0000295 = 'A spot rate could not be found to convert %s to %s.  ' +
    'Please setup currency rates in System Parameters, ' +
    'Regional Settings.  Values will not be converted.';
  cTXT0000296 = 'Full transaction amount, including taxes.'#13 +
    'Amount has been converted from %s to %s.';
  cTXT0000297 = 'Full transaction amount, including taxes.';
  cTXT0000298 = 'Currency of the original Sales Order or Invoice.';
  cTXT0000299 = 'Amount previously charged against the Sales Order.'#13 +
    'This amount has been subtracted from the total amount.';
  cTXT0000300 = 'Amount previously charged against the Invoice.'#13 +
    'This amount has been subtracted from the total amount.';
  cTXT0000301 = 'PO # %s';
  cTXT0000302 = 'Transaction Failed.';
  cTXT0000303 = 'Transaction Successful with Warning.';
  cTXT0000304 = 'Error Condition. Authorization failed with warning.';
  cTXT0000305 = 'Custom code.';
  cTXT0000306 = 'Error settling batch.';
  cTXT0000307 = 'Error refunding transaction.';
  cTXT0000308 = 'Error voiding transaction.';
  cTXT0000309 = 'Your credit card gateway does not support "force" ' +
    'transactions.';
  cTXT0000310 = 'PayPal generated a 10002 internal error.  ' +
    'Here are possible causes and solutions:'#13 +
    '1.  The most common cause for this error is incorrect login ' +
    'information.  Please verify that the PayPal account information ' +
    'you entered in System Parameters is correct.'#13 +
    '2.  Your account may not be a Website Payments Pro account.  Log ' +
    'onto to the PayPal Web site, and verify that you have activated ' +
    'Website Payments Pro on your account.'#13 +
    '3.  Your account may have been deactivated.  Contact PayPal to ' +
    'determine the status of your account.';
  cTXT0000311 = 'The total amount (with tax) is less than the tax. ' +
    'Please check your values.';
  cTXT0000312 = 'The total amount is equal to the tax.  Are you charging ' +
    'only for tax?';
  cTXT0000313 = 'Settled at time of charge.';
  cTXT0000314 = 'Settlement Error Text';
  cTXT0000315 = 'Credit Card number not provided.';
  cTXT0000316 = 'Credit Card expiration date not provided.';
  cTXT0000317 = 'Error updating transaction history.';
  cTXT0000318 = 'Modify Settlement Amount';
  cTXT0000319 = 'Please enter a new settlement amount:';
  cTXT0000320 = 'Adjust settlement amounts?  This action will update ' +
    'the settlement amount for each unsettled transaction based on ' +
    'the associated invoice amount.  Previously modified settlement ' +
    'amounts will be overwritten.';
  cTXT0000321 = 'Done.';
  cTXT0000322 = 'Updating settlement amounts.  Please wait.';
  cTXT0000323 =
    'Restore settlement amounts to the original authorized amounts?  ' +
    'This action will only affect unsettled transactions.';
  cTXT0000324 =
    'This functionality is not supported by your credit card gateway.';
  cTXT0000325 = 'As part of the settlement process, settlement amounts may ' +
    'be adjusted based on current, pre-posted, Accounts ' +
    'Receivable Invoice amounts.  This optional functionality ' +
    'has been selected in System Parameters.  Please note that if ' +
    'there are multiple charges for an invoice, some transaction ' +
    'amounts may be adjusted to zero (0); if so, they will be ' +
    'voided automatically after the settlement process completes.';
  cTXT0000326 = 'PayPal generated a 10001 internal error.  ' +
    'Possible causes include the following:'#13#13 +
    ' 1. The transaction number does not exist on the gateway server.'#13 +
    ' 2. The card has failed a CVV2 check at least six times within a ' +
    '30-day period.'#13 +
    ' 3. The billing country in the request is different from the billing ' +
    'country on the card.'#13 +
    ' 4. The state name was not passed as a two-letter, U.S. state ' +
    'abbreviation.'#13 +
    ' 5. You have tried an authorization for a currency other than USD.'#13 +
    ' 6. Your account has been deactivated.'#13#13 +
    'If none of these conditions apply, contact IQMS or PayPal directly.  ' +
    'If contacting PayPal, you may need to provide the XML Request data ' +
    'from the Credit Card log.';
  cTXT0000327 = 'PayPal generated a 10501 internal error.  ' +
    'This error occurs when the billing agreement is disabled or inactive.  ' +
    'Here are possible causes and solutions:'#13#10 +
    '1.  WebSite Payments Pro must be enabled on the account.  Be sure ' +
    'WebSite Payments Pro has been activated for your account.'#13 +
    '2.  You have not accepted the billing agreement on the account.  Log ' +
    'into your account and click on the Accept Billing Agreement link to ' +
    'accept the billing agreement.';
  cTXT0000328 = 'Cannot refund transaction:';
  cTXT0000329 = 'Cannot refund transaction.  Encountered unspecified errors.';
  cTXT0000330 = 'Charge Back';
  cTXT0000331 = 'Enter the amount to charge back (refund) to the customer:';
  cTXT0000332 = 'Error settling transaction (force settlement).';
  cTXT0000333 = 'The Merchant Local Telephone must be set in ' +
    'System Parameters.';
  cTXT0000334 = 'Transaction Successful. Partial approval for the ' +
    'authorized amount.';
  cTXT0000335 = 'Transaction Failed.  Error response text from check service.';
  cTXT0000336 = 'Surcharge amount not permitted on Visa cards or ' +
    'EBT food stamps.';
  cTXT0000337 = 'Surcharge amount not supported by debit network issuer.';
  cTXT0000338 = 'Customer requested stop of specific recurring payment.';
  cTXT0000339 = 'Customer requested stop of all recurring payments.';
  cTXT0000340 = 'Undefined response.';
  cTXT0000341 = 'Unable to locate.  No match.';
  cTXT0000342 =
    'Check is OK but cannot be converted. This is a declined transaction.';
  cTXT0000343 = 'Invalid ABA number.  Not an ACH participant.';
  cTXT0000344 = 'Amount greater than the limit.';
  cTXT0000345 = 'Unpaid items.  Failed negative file check.';
  cTXT0000346 = 'Duplicate check number.';
  cTXT0000347 = 'MICR error.';
  cTXT0000348 = 'Too many checks (over merchant or bank limit)';
  cTXT0000349 = 'VIP approval.';
  cTXT0000350 = 'First check is OK and has been converted.';
  cTXT0000351 = 'Honor MasterCard with ID.';
  cTXT0000352 =
    'Address Verification Unavailable: Non-US Issuer does not participate.';
  cTXT0000353 = 'A number used to identify or track this purchase.  ' +
    'Although this field is optional, higher interchange rates ' +
    'may be charged if not provided.';
  cTXT0000354 = 'The total itemized amount does not match the ' +
    'total amount charged.  Please adjust either item quantity or unit ' +
    'price as needed.';
  cTXT0000355 = 'This action will overwrite any changes you may have ' +
    'made to the itemization.  Do you want to continue?';
  cTXT0000356 = 'Quantities and tax amounts will be adjusted so that ' +
    'the total, itemized amount will more closely equal the amount charged ' +
    'for this transaction.  You may need to make additional adjustments ' +
    'after the process is complete.  Quantity values must be provided ' +
    'in round numbers.  Do you want to continue?';
  cTXT0000357 = 'Neither a Sales Order nor an Invoice has been assigned to ' +
    'this charge.  Cannot add items.';
  cTXT0000358 = 'The Merchant Tax ID has not been set in System Parameters.  ' +
    'This value should be set for the main company record, or at the EPlant ' +
    'level.  A Merchant Tax ID may be required to take advantage of ' +
    'discounts available with Level 3 processing.  Do you want to continue?';
  cTXT0000359 = 'Itemized Commodity Codes should be provided when ' +
    'processing a Visa charge card.  One or more items do not have ' +
    'codes.  Do you want to continue anyway?';
  cTXT0000360 = 'Invalid number.';
  cTXT0000361 = 'PayPal generated a 10001 internal error.  ' +
    'Possible causes include the following:'#13#13 +
    ' 1. You are using an unregistered test card number.'#13 +
    ' 2. The transaction number does not exist on the gateway server.'#13 +
    ' 3. The state name was not passed as a two-letter, U.S. state ' +
    'abbreviation.'#13 +
    ' 4. You have tried an authorization for a currency other ' +
    'than USD.'#13 +
    ' 5. Your account has been deactivated.'#13#13 +
    'If none of these conditions apply, contact PayPal directly to ' +
    'determine why you are not able to perform a test authorization.  ' +
    'If contacting PayPal, you may need to provide the XML Request data ' +
    'from the Credit Card log.';
  cTXT0000362 = 'Discount Amount: %s';
  cTXT0000363 = 'Total Amount: %s';
  cTXT0000364 = 'List Unit Price: %s';
  cTXT0000365 = 'Tax Code: %s';
  cTXT0000366 = 'Level 2 Addendum';
  cTXT0000367 = 'Level 3 Addendum';
  cTXT0000368 = 'The Tax amount is %.15f%% of the authorized amount.  ' +
    'The Tax must be between 0.1%% and 22%% of the total amount.';
  cTXT0000369 = 'Miscellaneous Item';
  cTXT0000370 = 'The Federal Tax ID must be set in System Parameters to ' +
    'settle this transaction with Level 3 discounts.';
  cTXT0000371 = 'Remove all items from the list?';
  cTXT0000372 = 'Add all Sales Orders to the list?';
  cTXT0000373 = 'Add all Invoices to the list?';
  cTXT0000374 = 'Adding items ...';
  cTXT0000375 = 'Warning';
  cTXT0000376 = 'One or more items have already been charged in full, or ' +
    'have been overcharged.  Do you want to continue?';
  cTXT0000377 = 'Cannot remove the default item.';
  cTXT0000378 = 'The total amount is equal to the tax.';
  cTXT0000379 = 'The following items could not be authorized.';
  cTXT0000380 = 'Previously Charged:  %s';
  cTXT0000381 = 'Previously Charged Tax:  %s';
  cTXT0000382 = 'Total Amount:  %s';
  cTXT0000383 = 'Total Tax:  %s';
  cTXT0000384 = 'Level 3 Addendum';
  cTXT0000385 = 'Charge Amount';
  cTXT0000386 = 'Tax Amount';
  cTXT0000387 = 'Freight';
  cTXT0000388 = 'Charge amount is zero (0).';
  cTXT0000389 = 'Cannot obtain a total from the detail items on either the ' +
    'Sales Order or the Invoice.';
  cTXT0000390 = 'Credit Card Account ID not provided.';
  cTXT0000391 = 'Credit Card account not provided for transaction.';
  cTXT0000392 = 'The merchant account for this transaction does not permit ' +
    'changing settlement amounts manually.';
  cTXT0000393 = 'Process completed with errors.  One or more merchant ' +
    'accounts were not processed because account settings do not support ' +
    'adjusting amounts based on invoice:';
  cTXT0000394 = 'Credit Card Settlement';
  cTXT0000395 = 'The billing country appears to be invalid.  Please select ' +
    'from the "Country" list on the Address Verification tab.';
  cTXT0000396 = 'You have selected multiple Sales Orders.  ' +
    'If you select a different default order, the list will be cleared.  ' +
    'Do you want to continue?';
  cTXT0000397 = 'You have selected multiple Invoices.  ' +
    'If you select a different default invoice, the list will be cleared.  ' +
    'Do you want to continue?';
  cTXT0000398 = 'Reset selected list?  This action will clear the list of ' +
    'selected items, leaving only the default item.';
  cTXT0000399 = 'Multiple Invoices have been selected.'#13 +
    'Default Invoice #: %s';
  cTXT0000400 = 'Multiple Sales Orders have been selected.'#13 +
    'Default Order #: %s';
  cTXT0000401 = '<Unspecified>';
  cTXT0000402 = 'One or more transactions use an Authorize.Net test ' +
    'account.  Test transactions through Authorize.Net cannot be settled.  ' +
    'They will need to be marked manually as settled.';
  cTXT0000403 = 'The Customer has already been charged for the full ' +
    'amount of this order. Continue?';
  cTXT0000404 = 'The Customer has already been overcharged for this ' +
    'order.  Continue?';
  cTXT0000405 = 'An invoice has already been charged for this ' +
    'Sales Order.  Continue?';
  cTXT0000406 = 'The Customer has already been charged for the full ' +
    'amount of this invoice.  Continue?';
  cTXT0000407 = 'The Customer has already been overcharged for this ' +
    'invoice.  Continue?';
  cTXT0000408 = 'Application Error:  Record data unavailable.  ' +
    'Operation aborted.';
  cTXT0000409 = 'Tax amount previously charged against the Sales Order.'#13 +
    'This amount has been subtracted from the total tax amount.';
  cTXT0000410 = 'Tax amount previously charged against the Invoice.'#13 +
    'This amount has been subtracted from the total tax amount.';
  cTXT0000411 = 'Response Transaction ID not provided by gateway.  ' +
    'Please notify your credit card gateway.';
  cTXT0000412 = 'The Transaction ID sent by the gateway is not ' +
    'unique.  Please notify your credit card gateway.';
  cTXT0000413 = 'Process completed with %d error(s).';
  cTXT0000414 = 'Process completed successfully.';
  cTXT0000415 = 'Authorizing ...';
  cTXT0000416 = '%s [Error Code: %s]'#13'%s';
  cTXT0000417 = 'Response Code';
  cTXT0000418 = 'The CVV2 response from the gateway is invalid (%s).  ' +
    'Processing will continue.';
  cTXT0000419 = 'Error retrieving transaction values.';
  cTXT0000420 = 'Credit Card validation error.';
  cTXT0000421 = 'Error Code: %d';
  cTXT0000422 = 'Verifying address.  Please wait.';
  cTXT0000423 = 'Approved.';
  cTXT0000424 = 'Declined.';
  cTXT0000425 = 'Error: There is an error in the data received.';
  cTXT0000426 = 'Error.';
  cTXT0000427 = 'Call Authorization Center.';
  cTXT0000428 = 'Pick up card.';
  cTXT0000429 = 'Expired.';
  cTXT0000430 = 'Other Error.';
  cTXT0000431 = 'Possible Causes:'#13'1.) Your Merchange Account ' +
    'information is incorrect in System Parameters.  Verify the setting ' +
    'is correct.'#13'2.) The TSYS server server may be down temporarily.  ' +
    'Wait until the server is back up and then try again.'#13 +
    '3.) An unexpected, network disconnect from the server has occurred.';
  cTXT0000432 = 'Voice authorization number required.';
  cTXT0000433 = 'Not a MOTO order';
  cTXT0000434 = 'CVV2 not passed.';
  cTXT0000435 = 'Issuer does not support CardID verification';
  cTXT0000436 = 'Return Code';
  cTXT0000437 = 'Error processing transaction.';
  cTXT0000438 = 'Merchant login not provided.  Please specify a login name ' +
    'for the merchant account in System Parameters.';
  cTXT0000439 = 'Merchant password not provided.  Please specify a password ' +
    'for the merchant account in System Parameters.';
  cTXT0000440 = 'Application Error:  Gateway server not specified.';
  cTXT0000441 = 'Required setting must be supplied:';
  cTXT0000442 = 'China Union Pay';
  cTXT0000443 = 'Error';
  cTXT0000444 = 'Freight is required';
  cTXT0000445 = 'Duty amount is required.';
  cTXT0000446 = 'Transaction approved.';
  cTXT0000447 = 'Transaction failed.';
  cTXT0000448 = 'Transaction error.';
  cTXT0000449 = 'Transaction warning or referral';
  cTXT0000450 = 'Transaction security warning.';
  cTXT0000451 = 'Transaction ID not provided.';
  cTXT0000452 = 'Processing transaction.  Please wait...';
  cTXT0000453 = 'Authorization';
  cTXT0000454 = 'Settlement';
  cTXT0000455 = 'Refund';
  cTXT0000456 = 'Credit Card';
  cTXT0000457 = 'Currency';
  cTXT0000458 = 'Card Present';
  cTXT0000459 = 'Telephone (Card not present)';
  cTXT0000460 = 'Mail (Card not present)';
  cTXT0000461 = 'Internet';
  cTXT0000462 = 'Transaction aging indicator';
  cTXT0000463 = 'Response Text';
  cTXT0000464 = 'The transaction has already been refunded.';
  cTXT0000465 = 'No transaction was made.  There is nothing to refund.';
  cTXT0000466 = 'Refund the current transaction?';
  cTXT0000467 = 'Transaction refunded.';
  cTXT0000468 = 'Authorization';
  cTXT0000469 = 'Sale';
  cTXT0000470 = 'Response Transaction ID';
  cTXT0000471 = 'Response Invoice #';
  cTXT0000472 = 'Invoice #';
  cTXT0000473 = 'Invalid credit card:  %s';
  cTXT0000474 = 'Invalid credit card.';
  cTXT0000475 = 'Invalid number for Amount.  The total charge amount must ' +
   'contain the tax and freight.';
  cTXT0000476 = 'Merchant User ID not provided.  Please specify a User ID ' +
    'for the merchant account in System Parameters.';
  cTXT0000477 = 'Print receipt?';
  cTXT0000478 = 'Print receipts for each successful transaction?';
  cTXT0000479 = 'Authorize.Net generated a error code 13.  ' +
    'This error occurs when the merchant account is incorrect.  ' +
    'Possible cause and solution:'#13#10 +
    'The merchant account you entered in System Parameters is the Web site ' +
    'account, and not the API login.  Please enter the API login ' +
    'information into System Parameters, instead of the primary account ' +
    'login.';
  cTXT0000480 = 'Authorize.net does not allow you to refund a transaction ' +
   'that was charged on the same day.';
  cTXT0000481 = 'Reference #';
  cTXT0000482 = 'Approval';
  cTXT0000483 = 'Transaction Type';
  cTXT0000484 = 'Amount';
  cTXT0000485 = 'ISO Code';
  cTXT0000486 = 'Time Stamp';
  cTXT0000487 = 'Card Holder';
  cTXT0000488 = 'Merchant';
  cTXT0000489 = 'Merchant Web Site';

  cTXT0000490 = 'Authorized';
  cTXT0000491 = 'Settled';
  cTXT0000492 = 'Voided';
  cTXT0000493 = 'Refunded';
  cTXT0000494 = 'Settlement Error';
  cTXT0000495 = 'Declined';
  cTXT0000496 = 'Delete declined transaction records?';
  cTXT0000497 = 'Credit card record not found.';
  cTXT0000498 = 'This action will purge Customer Credit Cards that have ' +
   'expired.  Do you wish to continue?';
  cTXT0000499 = 'One or more customer credit cards have expired.  Do you ' +
   'want to purge expired customer credit cards now?';
  cTXT0000500 = 'This action will delete all credit card data for customer, ' +
   '%s.  This includes credit cards and transaction history.  Do you want ' +
   'to continue?';
  cTXT0000501 = 'Purge expired credit cards for customer, %s?';
  cTXT0000502 = 'Purging expired credit cards.  Please wait...';
  cTXT0000503 = 'Done.';
  cTXT0000504 = 'Purging customer credit card data.  Please wait...';
  cTXT0000505 = 'Customer credit card data is about to be deleted.  Are ' +
   'you sure you want to proceed?';
  cTXT0000506 = 'Purge Expired Cards for %s';
  cTXT0000507 = 'Purge Credit Card Data for %s';
  cTXT0000508 = 'Credit card encryption keys have passed the recommended ' +
   'duration.  Please change the credit card encryption keys.'#13#13 +
   'Encryption Date:  %s'#13'Days Elapsed:  %d';
  cTXT0000509 = 'Purge Log Data for %s';
  cTXT0000510 = 'Please configure the list of accepted credit cards ' +
   'before attempting to process credit cards.  Accepted Credit Cards ' +
   'may be configured from Customer Maintenance or System Parameters.';
  cTXT0000511 = 'Error Details';
  cTXT0000512 = 'Please select a Visa, Master Card, or American Express ' +
   'credit card before attempting to edit Level 3 options.';
  cTXT0000513 = 'EnterpriseIQ could not determine the credit card gateway.  ' +
   'Please verify that a credit card gateway has been configured.';
  cTXT0000514 = 'Approve for partial amount';
  cTXT0000515 = 'Approve VIP';
  cTXT0000516 = 'Do not honor';
  cTXT0000517 = 'Expired card';
  cTXT0000518 = 'Restricted card';
  cTXT0000519 = 'Call acquirer''s security department';
  cTXT0000520 = 'Allowable PIN tries exceeded';
  cTXT0000521 = 'Call for authorization';
  cTXT0000522 = 'Refer to issuer''s special conditions';
  cTXT0000523 = 'Invalid merchant. The merchant is not in the merchant ' +
   'database or the merchant is not permitted to use this particular card.';
  cTXT0000524 = 'Invalid amount';
  cTXT0000525 = 'Not sufficient funds';
  cTXT0000526 = 'Incorrect PIN';
  cTXT0000527 = 'No card record';
  cTXT0000528 = 'Transaction not permitted to cardholder';
  cTXT0000529 = 'Transaction not permitted to terminal';
  cTXT0000530 = 'Exceeds withdrawal amount limit';
  cTXT0000531 = 'Exceeds withdrawal frequency limit';
  cTXT0000532 = 'Violation of law';
  cTXT0000533 = 'Invalid terminal';
  cTXT0000534 = 'Invalid account number';
  cTXT0000535 = 'Unmatched card expiry date';
  cTXT0000536 = 'Lost card';
  cTXT0000537 = 'Stolen card';
  cTXT0000538 = 'Account closed. The account was closed, probably because ' +
   'the account balance was 0.00.';
  cTXT0000539 = 'Unknown account. The account could not be located in the ' +
   'account table.';
  cTXT0000540 = 'Inactive account. The account has not been activated by an ' +
   'approved location.';
  cTXT0000541 = 'Already active. The card is already active and does not ' +
   'need to be reactivated';
  cTXT0000542 = 'Not lost or stolen';
  cTXT0000543 = 'Bad mag stripe. The mag stripe could not be parsed for ' +
   'account information';
  cTXT0000544 = 'Incorrect location. There was a problem with the merchant ' +
   'location.';
  cTXT0000545 = 'Max balance exceeded. The transaction, if completed, ' +
   'would cause the account balance to be exceeded by the max_balance as ' +
    'specified in the promotion. Some merchants set the max_balance to a ' +
    'value twice the max transaction amount.';
  cTXT0000546 = 'Invalid amount. There was a problem with the amount field ' +
   'in the transaction format - more or less than min/max amounts specified ' +
   'in the promotion for that transaction.';
  cTXT0000547 = 'Invalid clerk. The clerk field was either missing, when ' +
   'required, or the content did not match the requirements';
  cTXT0000548 = 'Invalid password';
  cTXT0000549 = 'Invalid new password. The new password does not meet the ' +
   'minimum security criteria';
  cTXT0000550 = 'Exceeded account reloads. The clerk/user/location was only ' +
   'permitted to reload some number of accounts. That number was exceeded. ' +
   '(See your Business Manager in order to extend this limit.)';
  cTXT0000551 = 'Password retry exceeded. The user account has been frozen ' +
   'because the user attempted access and was denied. Seek management ' +
   'assistance.';
  cTXT0000552 = 'Incorrect transaction version or format number for POS ' +
   'transactions';
  cTXT0000553 = 'Request not permitted by this account';
  cTXT0000554 = 'Request not permitted by this merchant location';
  cTXT0000555 = 'Bad_repay_date';
  cTXT0000556 = 'Bad checksum. The checksum provided is incorrect.';
  cTXT0000557 = 'Balance not available (denial). Due to an internal First ' +
   'Data Closed Loop Gift Card (CLGC) issue, information from this account ' +
   'could not be retrieved.';
  cTXT0000558 = 'Account locked';
  cTXT0000559 = 'No previous transaction. The void or reversal transaction ' +
   'could not be matched to a previous (original) transaction. In the case ' +
   'of a pre-auth redemption, the corresponding locking transaction could ' +
   'not be identified.';
  cTXT0000560 = 'Already reversed';
  cTXT0000561 = 'Bad authorization code. The authorization code test ' +
   'failed.';
  cTXT0000562 = 'Too many transactions requested';
  cTXT0000563 = 'No transactions available/no more transactions available. ' +
   'There are no transactions for this account or there are no transactions ' +
   'as determined by the specified first transaction number.';
  cTXT0000564 = 'Transaction history not available';
  cTXT0000565 = 'New password required';
  cTXT0000566 = 'Invalid status change. The status change requested (e.g. ' +
   'lost/stolen, freeze active card) cannot be performed.';
  cTXT0000567 = 'Void of activation after account activity';
  cTXT0000568 = 'No phone service. Attempted a calling card transaction on ' +
   'an account which is not configured for calling card activity.';
  cTXT0000569 = 'Internet access disabled';
  cTXT0000570 = 'Invalid EAN. The EAN is not correct for the provided ' +
   'account number.';
  cTXT0000571 = 'Invalid merchant key. The merchant key block provided is ' +
   'invalid. (e.g. The working key provided in an Assign Merchant Working ' +
   'Key transaction).';
  cTXT0000572 = 'Promotions for Internet virtual and physical cards do not ' +
   'match. When enabling a physical card to a virtual card, both must be ' +
   'from the same promotion. Cards for bulk activation request must be from ' +
   'the same promotion';
  cTXT0000573 = 'Invalid transaction source. The provided source (field EA) ' +
   'is not valid for this transaction.';
  cTXT0000574 = 'Account already linked. (e.g. Response when enabling a ' +
   'physical card, when the two provided accounts have already been linked ' +
   'together.)';
  cTXT0000575 = 'Account not in inactive state. (e.g. Response when ' +
   'enabling a physical card, when the physical card in not in an inactive ' +
   'state.)';
  cTXT0000576 = 'First Data Voice Services returns this response on ' +
    'Internet transactions where the interface input parameter is not valid.';
  cTXT0000577 = 'First Data Voice Services returns this response on ' +
    'Internet transactions where they did not receive a response from CLGC.';
  cTXT0000578 = 'First Data Voice Services returns this response on ' +
    'Internet transactions where the client certificate is invalid.';
  cTXT0000579 = 'Merchant not configured as International although the ' +
    'account requires it. (e.g. The account allows currency conversion ' +
    'but the merchant is not configured for International.)';
  cTXT0000580 = 'Invalid currency. The provided currency is invalid.';
  cTXT0000581 = 'Request not International. Merchant configured to require ' +
   'currency information for each financial transaction, however none was sent.';
  cTXT0000582 = 'Currency conversion error. Internal CLGC system error.';
  cTXT0000583 = 'The terminal transaction number did not match (on a void ' +
   'or reversal).';
  cTXT0000584 = 'First Data Voice Services added a layer of validation ' +
   'that checks the data they receive from CLGC to make sure it is ' +
   'HTML friendly (i.e. no binary data). First Data Voice Services will ' +
   'return this response on Internet transactions if the check fails ' +
   '(the data is not HTML friendly).';
  cTXT0000585 = 'Target embossed card entered and Transaction count ' +
   'entered do not match';
  cTXT0000586 = 'No account link';
  cTXT0000587 = 'Invalid time zone';
  cTXT0000588 = 'Account on hold';
  cTXT0000589 = 'Promo location restricted';
  cTXT0000590 = 'Invalid Card Account';
  cTXT0000591 = 'Product code(s) restricted';
  cTXT0000592 = 'Bad Post Date. The Post Date is not a valid date.';
  cTXT0000593 = 'Account status is void lock';
  cTXT0000594 = 'Already active and reloadable';
  cTXT0000595 = 'Account is Purged. The Account record was purged from ' +
   'the database.';
  cTXT0000596 = 'Bulk activation error';
  cTXT0000597 = 'Bulk activation un-attempted error';
  cTXT0000598 = 'Bulk activation package amount error';
  cTXT0000599 = 'Store location zero not allowed';
  cTXT0000600 = 'Account row locked';
  cTXT0000601 = 'Accepted but not yet processed';
  cTXT0000602 = 'TransArmor Service Unavailable';
  cTXT0000603 = 'TransArmor Invalid Token or Account Number';
  cTXT0000604 = 'TransArmor Key Error';
  cTXT0000605 = 'Decline';
  cTXT0000606 = 'Date of Birth Error for Check Processing';
  cTXT0000607 = 'Invalid State Code';
  cTXT0000608 = 'New Account Information';
  cTXT0000609 = 'Do not try again';
  cTXT0000610 = 'Please retry';
  cTXT0000611 = 'Invalid Checking Account Number';
  cTXT0000612 = 'New Account Information available';
  cTXT0000613 = 'Try again later - Declined: Association?s payment ' +
   'cancellation advice code provided. Applies to recurring authorizations ' +
   'only. These are examples of what may have occurred: the account is ' +
   'over the credit limit try again in 72 hours.';
  cTXT0000614 = 'Do not try again - Applies to recurring authorizations ' +
   'only. The card has expired';
  cTXT0000615 = 'New Account Information - Applies to recurring ' +
   'authorizations only. The card has expired';
  cTXT0000616 = 'Try again later - Applies to recurring authorizations ' +
   'only. The card has expired. Get the new expiration date and try again.';
  cTXT0000617 = 'Service not allowed';
  cTXT0000618 = 'Decline. Transaction not permitted to acquirer or terminal';
  cTXT0000619 = 'Do not try again - Applies to recurring authorizations ' +
   'only. There was security violation.';
  cTXT0000620 = 'Declined. No term record on First Data system';
  cTXT0000621 = 'Please retry - Reasons for this error are one of the ' +
   'following: Format Error, Unable to route transaction, Switch or ' +
   'issuer unavailable, System Busy, Timeout';
  cTXT0000622 = 'CVV2 Declined';
  cTXT0000623 = 'Invalid account/date or sales date in future';
  cTXT0000624 = 'Invalid Effective Date';
  cTXT0000625 = 'Reversal Rejected. Do not try again.';
  cTXT0000626 = 'Enter lesser amount';
  cTXT0000627 = 'Cash Back greater than total Transaction amount';
  cTXT0000628 = 'Crypto box is offline';
  cTXT0000629 = 'Debit Switch unavailable Timeout Retry - Communications ' +
   'link to debit/EBT network gateway is down or responded with a ' +
    'System Malfunction (96) message';
  cTXT0000630 = 'Debit/EBT network gateway cannot get through to the ISSUER.';
  cTXT0000631 = 'Undefined Card - Debit/EBT network gateway cannot route ' +
   'card based on Merchant Entitlement';
  cTXT0000632 = 'Network Response indicates that Merchant ID / SE is invalid';
  cTXT0000633 = 'Debit/EBT transaction count exceeds pre-determined limit ' +
   'in specified time/ Withdrawal limit exceeded.';
  cTXT0000634 = 'Resubmission of transaction violates debit/EBT network ' +
   'frequency';
  cTXT0000635 = 'The authorizing network has a problem decrypting the ' +
   'cryptogram in the request';
  cTXT0000636 = 'The DUKPT Base Derivation key is missing or incorrect in ' +
   'the PIN pad, or PIN key synchronization error.';
  cTXT0000637 = 'Edit Honor';
  cTXT0000638 = 'No Savings Account';
  cTXT0000639 = 'DUKPT: An error while processing the PIN block that is ' +
   'not related to the point- of-sale equipment. Contact the Help Desk ' +
   'for assistance.';
  cTXT0000640 = 'Approved EMV Key Load';
  cTXT0000641 = 'EMV Key Download Error';
  cTXT0000642 = 'Approved EMV Key Load, more key load data pending';
  cTXT0000643 = 'Pick Up Card';
  cTXT0000644 = 'Honor With Authentication';
  cTXT0000645 = 'Unable to Locate Record On File';
  cTXT0000646 = 'Refer - Call Authorization (Checks only)';
  cTXT0000647 = 'Referred - Skip Trace Info';
  cTXT0000648 = 'Hard Negative Info On File';
  cTXT0000649 = 'Totals Unavailable';
  cTXT0000650 = 'Hard Capture; Pick Up';
  cTXT0000651 = 'Amount Too Large';
  cTXT0000652 = 'Duplicate Return';
  cTXT0000653 = 'Unsuccessful';
  cTXT0000654 = 'Duplicate Reversal';
  cTXT0000655 = 'Subsystem Unavailable';
  cTXT0000656 = 'Duplicate Completion';
  cTXT0000657 = 'Count Exceeds Limit';
  cTXT0000658 = 'No reason to decline.';
  cTXT0000659 = 'Not approved. Used only in Visa bill/recurring payment. ' +
   'Merchant must not resubmit same transaction but may continue billing ' +
   'process in subsequent billing period.';
  cTXT0000660 = 'Not approved. Used only in Visa bill/recurring payment. ' +
   'Merchant must stop recurring payment requests.';
  cTXT0000661 = 'Invalid transaction. This card or terminal is not ' +
   'permitted to perform this transaction, or the transaction type is ' +
   'invalid, or First Data is unable to route a refund request to the network.';
  cTXT0000662 = 'Format error.';
  cTXT0000663 = 'System Error. There is a problem with the host ' +
   'processing system. Call your helpdesk or operations support.';
  cTXT0000664 = 'Transaction destination not found for routing.';
  cTXT0000665 = 'System malfunction.';
  cTXT0000666 = 'Card issuer timed out.';
  cTXT0000667 = 'Duplicate transaction.';
  cTXT0000668 = 'Void/Full Reversal requests in which the Original ' +
   'Authorization was not found.';
  cTXT0000669 = 'Error.';
  cTXT0000670 = 'No such issuer.';
  cTXT0000671 = 'CCV failed.';
  cTXT0000672 = 'A Sales Order number is required.';
  cTXT0000673 = 'If charging for tax, a Sales Order # must also be provided.';
  cTXT0000674 = 'PO number is required.';
  cTXT0000675 = 'PO number must contain only digits (0 to 9).';
  cTXT0000676 = 'Sales Order number is required.';
  cTXT0000677 = 'Destination Country is required.';
  cTXT0000678 = 'Destination Postal Code is required';
  cTXT0000679 = 'Are you sure you want to close this form?  All changes ' +
   'will be lost.';
  cTXT0000680 = 'Tokenization Response';
  cTXT0000681 = 'Tokenization request failed.';
  cTXT0000682 = 'A credit card token was not created.';
  cTXT0000683 = 'Please select a Credit Card Merchant Account.';
  cTXT0000684 = 'You have not selected an Invoice number, ' +
    'Sales Order number, or PO number.  These values are used for ' +
    'the Purchase Identifier.  Failure to provide one of these values ' +
    'may result in a CPS downgrade and higher interchange rates.  ' +
    'Would you like to select a value before adding this charge?';
  cTXT0000685 = 'A PO number is required to qualify ' +
    'for corporate discounts.  Would you like to select a value ' +
    'before adding this charge?';
  cTXT0000686 = 'An Invoice number is required to qualify ' +
    'for corporate discounts.  Would you like to select a value ' +
    'before adding this charge?';
  cTXT0000687 = 'Value too large:';
  cTXT0000688 = 'Overwrite transaction amount values?';
  cTXT0000689 = 'Create a Cash Receipt for this Invoice?';
  cTXT0000690 = 'AVS Code';
  cTXT0000691 = 'Web Order # %d';
  cTXT0000692 = 'Invalid amount for Test Mode.  Values supplied in Test ' +
    'Mode must be less than 100.';
  cTXT0000693 = 'Invalid amount.  The total amount is equal to the tax.';
  cTXT0000694 = 'Original Authorization ID (OrigAuthID) not provided.';
  cTXT0000695 = 'AVS Approval';
  cTXT0000696 = 'Passed simple validation checks.';
  cTXT0000697 = 'Cannot delete token from gateway server:';
  cTXT0000698 = 'Cannot delete token from gateway server.';
  cTXT0000699 = 'Tokenization failed.';
  cTXT0000700 = 'Card is valid.';
  cTXT0000701 = 'Transaction # %d has been added.';
  cTXT0000702 = 'You have not selected a Customer.  You must enter the ' +
    'credit card information manually.';
  cTXT0000703 = 'The new manual transaction could not be found.  Please check your filter.';
  cTXT0000704 = 'Edit Credit Card';
  cTXT0000705 = 'Add Credit Card';
  cTXT0000706 = 'Charge - %s';
  cTXT0000707 = 'Encountered error for item, %s:';
  cTXT0000708 = 'Invalid Merchant account.';
  cTXT0000709 = 'The merchant account assigned to the attached credit card does not ' +
    'match the recommended merchant account for this Sales Order.  The ' +
    'merchant account assigned to the credit card will be used.';
  cTXT0000710 = 'The merchant account assigned to the attached credit card does not ' +
    'match the recommended merchant account for this Invoice.  The ' +
    'merchant account assigned to the credit card will be used.';
  cTXT0000711 = 'In order to test error codes, ' +
    'the Moneris test environment will decline transactions ' +
    'with penny values.  Transactions without penny values ' +
    'will be approved.  The current charge will be declined ' +
    'by design.';
  cTXT0000712 = 'In order to test error codes, ' +
    'the Sterling test environment decline some transactions ' +
    'with penny values.  Transactions without penny values ' +
    'will always be approved.  The current charge may be ' +
    'declined.';
  cTXT0000713 = 'Please select a source filter.';
  cTXT0000714 = 'Please select a class filter.';
  cTXT0000715 = '"%s" screen accessed.';
  cTXT0000716 = 'Error writing to log.';
  cTXT0000717 = 'Invalid screen access (%s) by user, %s.';
  cTXT0000718 = 'Gateway=%s';
  cTXT0000719 = 'Authorization';
  cTXT0000720 = 'Settlement';
  cTXT0000721 = 'Purge';
  cTXT0000722 = 'Card Types';
  cTXT0000723 = 'Attach Card';
  cTXT0000724 = 'Customer Cards';
  cTXT0000725 = 'Manual Settlement';
  cTXT0000726 = 'Credit Card Log';
  cTXT0000727 = 'Transaction';
  cTXT0000728 = 'Error';
  cTXT0000729 = 'Screen Access';
  cTXT0000730 = 'Access Denied';
  cTXT0000731 = 'Code';
  cTXT0000732 = 'Description';
  cTXT0000733 = 'Misc. Item';
  cTXT0000734 = 'Item #: %s';
  cTXT0000735 = 'Description: %s';
  cTXT0000736 = 'Extended Description: %s';
  cTXT0000737 = 'Class: %s';
  cTXT0000738 = 'Revision: %s';
  cTXT0000739 = 'Unit:  %s';
  cTXT0000740 = 'The quantity has changed.  Do you want to update the tax amount?';
  cTXT0000741 = 'Value for %s must contain digits only.';
  cTXT0000742 = '%d years';
  cTXT0000743 = '%d months';
  cTXT0000744 = '%d days';
  cTXT0000745 = '1 day';
  cTXT0000746 = '1 month';
  cTXT0000747 = '1 year';
  cTXT0000748 = 'Apply to records dated on or before today.';
  cTXT0000749 = 'Apply to records dated on or before yesterday.';
  cTXT0000750 = 'Apply to records older than 1 week.';
  cTXT0000751 = 'Apply to records older than 2 weeks.';
  cTXT0000752 = 'Apply to records older than 3 weeks.';
  cTXT0000753 = 'Apply to data older than %s';
  cTXT0000754 = 'Please select an archive date.';
  cTXT0000755 = 'Please select a purge date.';
  cTXT0000756 = 'Archived %d records.';
  cTXT0000757 = 'Purged %d records.';
  cTXT0000758 = 'Done.';
  cTXT0000759 = 'There are no records within the specified range.';
  cTXT0000760 = 'Archiving ...';
  cTXT0000761 = 'Purging ...';
  cTXT0000762 = 'Please select a date.';
  cTXT0000763 = 'There are no records to purge.';
  cTXT0000764 = 'Purging...';
  cTXT0000765 = 'Settled transactions purged.';
  cTXT0000766 = 'Date: %s';
  cTXT0000767 = 'Record count: %d';
  cTXT0000768 = 'Done.  Purged %d records.';
  cTXT0000769 = 'Transaction Log Files';
  cTXT0000770 = 'Please find attached the transaction request and response ' +
    'files from the log.';
  cTXT0000771 = 'Customer postal code is required.';
  cTXT0000772 = 'A voice authorization code is required.';
//  cTXT0000773 = '';
//  cTXT0000774 = '';
//  cTXT0000775 = '';
//  cTXT0000776 = '';
//  cTXT0000777 = '';
//  cTXT0000778 = '';
//  cTXT0000779 = '';
//  cTXT0000780 = '';
//  cTXT0000781 = '';
//  cTXT0000782 = '';
//  cTXT0000783 = '';
//  cTXT0000784 = '';
//  cTXT0000785 = '';
//  cTXT0000786 = '';
//  cTXT0000787 = '';
//  cTXT0000788 = '';
//  cTXT0000789 = '';
//  cTXT0000790 = '';
//  cTXT0000791 = '';
//  cTXT0000792 = '';
//  cTXT0000793 = '';
//  cTXT0000794 = '';
//  cTXT0000795 = '';
//  cTXT0000796 = '';
//  cTXT0000797 = '';
//  cTXT0000798 = '';
//  cTXT0000799 = '';
//  cTXT0000800 = '';
//  cTXT0000801 = '';
//  cTXT0000802 = '';
//  cTXT0000803 = '';
//  cTXT0000804 = '';
//  cTXT0000805 = '';
//  cTXT0000806 = '';
//  cTXT0000807 = '';
//  cTXT0000808 = '';
//  cTXT0000809 = '';
//  cTXT0000810 = '';
//  cTXT0000811 = '';
//  cTXT0000812 = '';
//  cTXT0000813 = '';
//  cTXT0000814 = '';
//  cTXT0000815 = '';
//  cTXT0000816 = '';
//  cTXT0000817 = '';
//  cTXT0000818 = '';
//  cTXT0000819 = '';
//  cTXT0000820 = '';
//  cTXT0000821 = '';
//  cTXT0000822 = '';
//  cTXT0000823 = '';
//  cTXT0000824 = '';
//  cTXT0000825 = '';
//  cTXT0000826 = '';
//  cTXT0000827 = '';
//  cTXT0000828 = '';
//  cTXT0000829 = '';
//  cTXT0000830 = '';
//  cTXT0000831 = '';
//  cTXT0000832 = '';
//  cTXT0000833 = '';
//  cTXT0000834 = '';
//  cTXT0000835 = '';
//  cTXT0000836 = '';
//  cTXT0000837 = '';
//  cTXT0000838 = '';
//  cTXT0000839 = '';
//  cTXT0000840 = '';
//  cTXT0000841 = '';
//  cTXT0000842 = '';
//  cTXT0000843 = '';
//  cTXT0000844 = '';
//  cTXT0000845 = '';
//  cTXT0000846 = '';
//  cTXT0000847 = '';
//  cTXT0000848 = '';
//  cTXT0000849 = '';
//  cTXT0000850 = '';
//  cTXT0000851 = '';
//  cTXT0000852 = '';
//  cTXT0000853 = '';
//  cTXT0000854 = '';
//  cTXT0000855 = '';
//  cTXT0000856 = '';
//  cTXT0000857 = '';
//  cTXT0000858 = '';
//  cTXT0000859 = '';
//  cTXT0000860 = '';
//  cTXT0000861 = '';
//  cTXT0000862 = '';
//  cTXT0000863 = '';
//  cTXT0000864 = '';
//  cTXT0000865 = '';
//  cTXT0000866 = '';
//  cTXT0000867 = '';
//  cTXT0000868 = '';
//  cTXT0000869 = '';
//  cTXT0000870 = '';
//  cTXT0000871 = '';
//  cTXT0000872 = '';
//  cTXT0000873 = '';
//  cTXT0000874 = '';
//  cTXT0000875 = '';
//  cTXT0000876 = '';
//  cTXT0000877 = '';
//  cTXT0000878 = '';
//  cTXT0000879 = '';
//  cTXT0000880 = '';
//  cTXT0000881 = '';
//  cTXT0000882 = '';
//  cTXT0000883 = '';
//  cTXT0000884 = '';
//  cTXT0000885 = '';
//  cTXT0000886 = '';
//  cTXT0000887 = '';
//  cTXT0000888 = '';
//  cTXT0000889 = '';
//  cTXT0000890 = '';
//  cTXT0000891 = '';
//  cTXT0000892 = '';
//  cTXT0000893 = '';
//  cTXT0000894 = '';
//  cTXT0000895 = '';
//  cTXT0000896 = '';
//  cTXT0000897 = '';
//  cTXT0000898 = '';
//  cTXT0000899 = '';
//  cTXT0000900 = '';
//  cTXT0000901 = '';
//  cTXT0000902 = '';
//  cTXT0000903 = '';
//  cTXT0000904 = '';
//  cTXT0000905 = '';
//  cTXT0000906 = '';
//  cTXT0000907 = '';
//  cTXT0000908 = '';
//  cTXT0000909 = '';
//  cTXT0000910 = '';
//  cTXT0000911 = '';
//  cTXT0000912 = '';
//  cTXT0000913 = '';
//  cTXT0000914 = '';
//  cTXT0000915 = '';
//  cTXT0000916 = '';
//  cTXT0000917 = '';
//  cTXT0000918 = '';
//  cTXT0000919 = '';
//  cTXT0000920 = '';
//  cTXT0000921 = '';
//  cTXT0000922 = '';
//  cTXT0000923 = '';
//  cTXT0000924 = '';
//  cTXT0000925 = '';
//  cTXT0000926 = '';
//  cTXT0000927 = '';
//  cTXT0000928 = '';
//  cTXT0000929 = '';
//  cTXT0000930 = '';
//  cTXT0000931 = '';
//  cTXT0000932 = '';
//  cTXT0000933 = '';
//  cTXT0000934 = '';
//  cTXT0000935 = '';
//  cTXT0000936 = '';
//  cTXT0000937 = '';
//  cTXT0000938 = '';
//  cTXT0000939 = '';
//  cTXT0000940 = '';
//  cTXT0000941 = '';
//  cTXT0000942 = '';
//  cTXT0000943 = '';
//  cTXT0000944 = '';
//  cTXT0000945 = '';
//  cTXT0000946 = '';
//  cTXT0000947 = '';
//  cTXT0000948 = '';
//  cTXT0000949 = '';
//  cTXT0000950 = '';
//  cTXT0000951 = '';
//  cTXT0000952 = '';
//  cTXT0000953 = '';
//  cTXT0000954 = '';
//  cTXT0000955 = '';
//  cTXT0000956 = '';
//  cTXT0000957 = '';
//  cTXT0000958 = '';
//  cTXT0000959 = '';
//  cTXT0000960 = '';
//  cTXT0000961 = '';
//  cTXT0000962 = '';
//  cTXT0000963 = '';
//  cTXT0000964 = '';
//  cTXT0000965 = '';
//  cTXT0000966 = '';
//  cTXT0000967 = '';
//  cTXT0000968 = '';
//  cTXT0000969 = '';
//  cTXT0000970 = '';
//  cTXT0000971 = '';
//  cTXT0000972 = '';
//  cTXT0000973 = '';
//  cTXT0000974 = '';
//  cTXT0000975 = '';
//  cTXT0000976 = '';
//  cTXT0000977 = '';
//  cTXT0000978 = '';
//  cTXT0000979 = '';
//  cTXT0000980 = '';
//  cTXT0000981 = '';
//  cTXT0000982 = '';
//  cTXT0000983 = '';
//  cTXT0000984 = '';
//  cTXT0000985 = '';
//  cTXT0000986 = '';
//  cTXT0000987 = '';
//  cTXT0000988 = '';
//  cTXT0000989 = '';
//  cTXT0000990 = '';
//  cTXT0000991 = '';
//  cTXT0000992 = '';
//  cTXT0000993 = '';
//  cTXT0000994 = '';
//  cTXT0000995 = '';
//  cTXT0000996 = '';
//  cTXT0000997 = '';
//  cTXT0000998 = '';
//  cTXT0000999 = '';
//  cTXT0001000 = '';
//  cTXT0001001 = '';
//  cTXT0001002 = '';
//  cTXT0001003 = '';
//  cTXT0001004 = '';
//  cTXT0001005 = '';
//  cTXT0001006 = '';
//  cTXT0001007 = '';
//  cTXT0001008 = '';
//  cTXT0001009 = '';
//  cTXT0001010 = '';
//  cTXT0001011 = '';
//  cTXT0001012 = '';
//  cTXT0001013 = '';
//  cTXT0001014 = '';
//  cTXT0001015 = '';
//  cTXT0001016 = '';
//  cTXT0001017 = '';
//  cTXT0001018 = '';
//  cTXT0001019 = '';
//  cTXT0001020 = '';
//  cTXT0001021 = '';
//  cTXT0001022 = '';
//  cTXT0001023 = '';
//  cTXT0001024 = '';
//  cTXT0001025 = '';
//  cTXT0001026 = '';
//  cTXT0001027 = '';
//  cTXT0001028 = '';
//  cTXT0001029 = '';
//  cTXT0001030 = '';
//  cTXT0001031 = '';
//  cTXT0001032 = '';
//  cTXT0001033 = '';
//  cTXT0001034 = '';
//  cTXT0001035 = '';
//  cTXT0001036 = '';
//  cTXT0001037 = '';
//  cTXT0001038 = '';
//  cTXT0001039 = '';
//  cTXT0001040 = '';
//  cTXT0001041 = '';
//  cTXT0001042 = '';
//  cTXT0001043 = '';
//  cTXT0001044 = '';
//  cTXT0001045 = '';
//  cTXT0001046 = '';
//  cTXT0001047 = '';
//  cTXT0001048 = '';
//  cTXT0001049 = '';
//  cTXT0001050 = '';
//  cTXT0001051 = '';
//  cTXT0001052 = '';
//  cTXT0001053 = '';
//  cTXT0001054 = '';
//  cTXT0001055 = '';
//  cTXT0001056 = '';
//  cTXT0001057 = '';
//  cTXT0001058 = '';
//  cTXT0001059 = '';
//  cTXT0001060 = '';
//  cTXT0001061 = '';
//  cTXT0001062 = '';
//  cTXT0001063 = '';
//  cTXT0001064 = '';
//  cTXT0001065 = '';
//  cTXT0001066 = '';
//  cTXT0001067 = '';
//  cTXT0001068 = '';
//  cTXT0001069 = '';
//  cTXT0001070 = '';
//  cTXT0001071 = '';
//  cTXT0001072 = '';
//  cTXT0001073 = '';
//  cTXT0001074 = '';
//  cTXT0001075 = '';
//  cTXT0001076 = '';
//  cTXT0001077 = '';
//  cTXT0001078 = '';
//  cTXT0001079 = '';
//  cTXT0001080 = '';
//  cTXT0001081 = '';
//  cTXT0001082 = '';
//  cTXT0001083 = '';
//  cTXT0001084 = '';
//  cTXT0001085 = '';
//  cTXT0001086 = '';
//  cTXT0001087 = '';
//  cTXT0001088 = '';
//  cTXT0001089 = '';
//  cTXT0001090 = '';
//  cTXT0001091 = '';
//  cTXT0001092 = '';
//  cTXT0001093 = '';
//  cTXT0001094 = '';
//  cTXT0001095 = '';
//  cTXT0001096 = '';
//  cTXT0001097 = '';
//  cTXT0001098 = '';
//  cTXT0001099 = '';
//  cTXT0001100 = '';
//  cTXT0001101 = '';
//  cTXT0001102 = '';
//  cTXT0001103 = '';
//  cTXT0001104 = '';
//  cTXT0001105 = '';
//  cTXT0001106 = '';
//  cTXT0001107 = '';
//  cTXT0001108 = '';
//  cTXT0001109 = '';
//  cTXT0001110 = '';
//  cTXT0001111 = '';
//  cTXT0001112 = '';
//  cTXT0001113 = '';
//  cTXT0001114 = '';
//  cTXT0001115 = '';
//  cTXT0001116 = '';
//  cTXT0001117 = '';
//  cTXT0001118 = '';
//  cTXT0001119 = '';
//  cTXT0001120 = '';
//  cTXT0001121 = '';
//  cTXT0001122 = '';
//  cTXT0001123 = '';
//  cTXT0001124 = '';
//  cTXT0001125 = '';
//  cTXT0001126 = '';
//  cTXT0001127 = '';
//  cTXT0001128 = '';
//  cTXT0001129 = '';
//  cTXT0001130 = '';
//  cTXT0001131 = '';
//  cTXT0001132 = '';
//  cTXT0001133 = '';
//  cTXT0001134 = '';
//  cTXT0001135 = '';
//  cTXT0001136 = '';
//  cTXT0001137 = '';
//  cTXT0001138 = '';
//  cTXT0001139 = '';
//  cTXT0001140 = '';
//  cTXT0001141 = '';
//  cTXT0001142 = '';
//  cTXT0001143 = '';
//  cTXT0001144 = '';
//  cTXT0001145 = '';
//  cTXT0001146 = '';
//  cTXT0001147 = '';
//  cTXT0001148 = '';
//  cTXT0001149 = '';
//  cTXT0001150 = '';
//  cTXT0001151 = '';
//  cTXT0001152 = '';
//  cTXT0001153 = '';
//  cTXT0001154 = '';
//  cTXT0001155 = '';
//  cTXT0001156 = '';
//  cTXT0001157 = '';
//  cTXT0001158 = '';
//  cTXT0001159 = '';
//  cTXT0001160 = '';
//  cTXT0001161 = '';
//  cTXT0001162 = '';
//  cTXT0001163 = '';
//  cTXT0001164 = '';
//  cTXT0001165 = '';
//  cTXT0001166 = '';
//  cTXT0001167 = '';
//  cTXT0001168 = '';
//  cTXT0001169 = '';
//  cTXT0001170 = '';
//  cTXT0001171 = '';
//  cTXT0001172 = '';
//  cTXT0001173 = '';
//  cTXT0001174 = '';
//  cTXT0001175 = '';
//  cTXT0001176 = '';
//  cTXT0001177 = '';
//  cTXT0001178 = '';
//  cTXT0001179 = '';
//  cTXT0001180 = '';
//  cTXT0001181 = '';
//  cTXT0001182 = '';
//  cTXT0001183 = '';
//  cTXT0001184 = '';
//  cTXT0001185 = '';
//  cTXT0001186 = '';
//  cTXT0001187 = '';
//  cTXT0001188 = '';
//  cTXT0001189 = '';
//  cTXT0001190 = '';
//  cTXT0001191 = '';
//  cTXT0001192 = '';
//  cTXT0001193 = '';
//  cTXT0001194 = '';
//  cTXT0001195 = '';
//  cTXT0001196 = '';
//  cTXT0001197 = '';
//  cTXT0001198 = '';
//  cTXT0001199 = '';
//  cTXT0001200 = '';


  // cc_rscstr.cTXT0000399

implementation

end.

unit iqsys_rscstr;

interface

resourcestring

   // iqsys_rscstr.cTXT0000089

   cTXT0000001 = 'Used in cost calculations.'#13 +
                 'Leave empty for calculations to start at the beginning of a fiscal year.';
   cTXT0000002 = 'Select the number of digits to be used when creating '#13+
                 'the unique serial number on the label. Default is 9.';
   cTXT0000003 = 'Assign procedure name';
   cTXT0000004 = 'Assign report name';
   cTXT0000005 = 'Accessing System Parameters.  Please wait...';
   cTXT0000006 = 'Processing ...'#13'%s';
   cTXT0000007 = 'Report names must be 50 characters or less.';
   cTXT0000008 = 'The number has been reset';
   cTXT0000009 = 'Cannot find file, %s';
   cTXT0000010 = 'Save changes before exit?';
   cTXT0000011 = 'Assign default report names?';
   cTXT0000012 = 'EPlant mismatch between Division and Company EPlant';
   cTXT0000013 = 'Database Connection is Valid';
   cTXT0000014 = 'Unable to login using alias %s';
   cTXT0000015 = 'To use the multi-currency feature, you must specify your Native Currency.';
   cTXT0000016 = 'To use multi-currency, your native currency spot rate must be set to 1.  Do you wish to set it to 1?';
   cTXT0000017 = 'Parent record not found.  Cannot save changes.';
   cTXT0000018 = 'Currency code, %s, could not be found.';
   cTXT0000019 = 'Suffix length must be 4 or less characters';
   cTXT0000020 = 'Copy company information into the plant record?';
   cTXT0000021 = 'EPlant must be assigned';
   cTXT0000022 = 'Reset Sequence';
   cTXT0000023 = 'New Value';
   cTXT0000024 = 'Value of Sequence %s has been changed to %s'; 
   cTXT0000025 = 'Unknown request for burned sequences'; 
   cTXT0000026 = 'Unable to insert new EPlant.'#13#13+
                 'You are licensed to use %0.f EPlants. Currently %0.f are found to be in use by the system.'#13+
                 'Please contact IQ Management Systems Inc to verify the license agreement.';
   cTXT0000027 = 'Email Address';
   cTXT0000028 = 'Enter email address';
   cTXT0000029 = 'Average Cost Calculated Range in days must be a positive integer or blank.';
   cTXT0000030 = 'The credit card gateway has been changed. ' +
        'Attempting to settle existing transactions made through the ' +
        'previous gateway may result in errors.'#13#13 +
        'It is recommended that you settle all pending transactions before ' +
        'switching to the new gateway.';
   // cTXT0000031 = '';
   cTXT0000032 = 'Access denied.  DBA status required.';
   cTXT0000033 = 'The key values have not changed.  Please either ' +
     'set new key values, or click Cancel.';
   cTXT0000034 = 'Clearing the key values will remove encryption.  ' +
     'Are you sure you want to continue?';
   cTXT0000035 = 'Encrypted data size (%d) exceeds field %s size (%d).';
   cTXT0000036 = 'Begin encryption process now?';
   cTXT0000037 = 'No credit card transaction records were found.  Operation aborted.';
   cTXT0000038 = 'The encryption process will now begin.  The ' +
    'process will take approximately %d minute(s) with %d records modified.  It ' +
    'is recommended that users stay out of areas where credit card data might ' +
    'be modified, such as Accounts Receivable, Sales Orders, Credit Card ' +
    'Charges, Customer Credit Cards and Credit Card Settlements.  Continue?';
   cTXT0000039 = 'Process completed successfully.';
   cTXT0000040 = 'Operation cancelled.';
   cTXT0000041 = 'Invalid value for key segment.  ' +
             'Key segment values must be between 1 and 120.';
   cTXT0000042 = 'This action will remove encryption from sensitive ' +
     'credit card data.  Encryption is required to be compliant with the PCI ' +
     'Credit Card Security Standard. Are you sure you want to continue?';
   cTXT0000043 = 'Encrypted values will now be decrypted.  This will ' +
     'present a serious security hazard.  Continue?';
   cTXT0000044 = 'Encrypting data.  Please wait.';
   cTXT0000045 = 'Decrypting data.  Please wait.';
   cTXT0000046 = 'Please enter a New Password value for Password %d.';
   cTXT0000047 = 'Please confirm the value for Password %d.';
   cTXT0000048 = 'New Password %d is incorrect.  ' +
     'It is not the same as your confirmation password.';
   cTXT0000049 = 'Entry for Old Password %d does not match the recorded password.';
   cTXT0000050 = 'Password %d is not unique.'; 
   cTXT0000051 = 'Have you stored your passwords in a secure location?  ' +
        'You will not be able to access them from this screen.';
   cTXT0000052 = 'Invalid character in password text.'; 
   cTXT0000053 = 'Validating new passwords.  Please wait.'; 
   cTXT0000054 = 'The following passwords have already been ' +
        'used, and have been revoked.  Please select different passwords:';
   cTXT0000055 = 'The gateway setting has changed.  You will need to ' +
        'supply account information for the selected gateway.';
   cTXT0000056 = 'Please enter an Account ID.';
   cTXT0000057 = 'Please enter a User ID.';
   cTXT0000058 = 'Please enter a PIN number.'; 
   cTXT0000059 = 'Boiler Plates [Type = %s]'; 
   cTXT0000060 = 'Save to Boiler Plate';
   cTXT0000061 = 'Enter boiler plate description';
   cTXT0000062 = 'Append to existing text?'; 
   cTXT0000063 = 'Custom';
   cTXT0000064 = 'ColorA=%.8x';
   cTXT0000065 = 'Please select a GL segment name.'; 
   cTXT0000066 = 'Please enter a GL Plug-In value.'; 
   cTXT0000067 = 'GL Plug-In value length must be %d'; 
   cTXT0000068 = 'Module:';
   cTXT0000069 = 'Topic:';
   cTXT0000070 = 'EPlant Profile. Report: %s'; 
   cTXT0000071 = 'N/A'; 
   cTXT0000072 = 'Cannot find file, %s.'; 
   cTXT0000073 = 'Please enter values for both accounts.'; 
   cTXT0000074 = 'Please enter a value for To EPlant ID.';
   cTXT0000075 = 'Skipped Sequences [Module = %s, Table = %s, Field = %s]'; 
   cTXT0000076 = 'You are attempting to reset the sequence(s) in the following module(s)'#13 +
    'to less than the maximum sequence number used.'#13#13 +
    'This could cause problems when appending new records or archiving old records.'#13 +
    'Do you still want to reset the sequence?';
   cTXT0000077 = 'Application Error: Validation for uniqueness ' +
     'encountered empty password value.';
   cTXT0000078 = 'Unknown error.'; 
   //cTXT0000079 = 'Please enter a transaction key.'; 
   cTXT0000080 = 'To communicate with Authorize.Net, the "Password required" ' +
   'setting on your account must be enabled.  Please verify that "Password ' +
   'required" has been enabled on your Authorize.Net account.';
   cTXT0000081 = 'Unavailable'; 
   cTXT0000082 = 'Currency record not found.  Multicurrency is enabled, but a ' +
    'corresponding record was not found for currency code, %s.  Please ' +
    'create a multicurrency record, or you will not be able to convert ' +
    'credit card charges made in a foreign currency.';
   cTXT0000083 = 'Invalid currency code.  Please select a currency code from the list.'; 
   cTXT0000084 = 'Please enter a value for %s'; 
   cTXT0000085 = 'Please enter a select for %s'; 
   cTXT0000086 = 'In order for your PayPal Business seller account to ' +
    'process credit card transactions in EnterpriseIQ, "Website Payments ' +
    'Pro" must be activated on the account.  Please verify that you have ' +
    'selected "Website Payments Pro" as the payment solution on your PayPal ' +
    'account.';
   cTXT0000087 = 'Hide archived accounts.'#13'Currently showing archived accounts only.';
   cTXT0000088 = 'Show archived accounts.'#13'Currently hiding archived accounts.';
   cTXT0000089 = 'Merchant ID, Device ID, User Name/Operator, and Password ' +
     'must all be entered.';
   cTXT0000090 = 'You are attempting to reset the sequence(s) in the following module(s)'#13 +
    'to less than the maximum sequence number used.'#13 +
    'This operation is not allowed.';
   cTXT0000091 = 'To send emails with TLS or SSL, your mail server must ' +
    'support TLS or SSL.   Please verify that your mail server supports ' +
    'either TLS or SSL.';
   cTXT0000092 = 'Invalid character ''%s'' in %s column.';
   cTXT0000093 = 'EnterpriseIQ Test email';
   cTXT0000094 = 'EnterpriseIQ test email settings test.';
   cTXT0000095 = 'A test email has been sent.';
   cTXT0000096 = 'Email could not be sent.';
   cTXT0000097 = 'Connecting.  Please wait...';
   cTXT0000098 = 'Success!  Connected to server successfully.';
   cTXT0000099 = 'Failed!  Could not connect to server:';
   cTXT0000100 = 'Recipient';
   cTXT0000101 = 'Please enter the recipient email address:';
   cTXT0000102 = 'Please enter Merchant Name.';
   cTXT0000103 = 'Please enter a Profile ID.';
   cTXT0000104 = 'Please enter a Profile Key.';
   cTXT0000105 = 'Invalid currency code.  Currency code must be a 3-character ISO code.';
   cTXT0000106 = 'Invalid printer delay interval entered.  This value must be 0 or greater.';
   cTXT0000107 = 'Passwords must be at least 7 characters long and ' +
    'include both numeric and alphabetic characters.  The following are ' +
    'not strong passwords:';
   cTXT0000108 = 'Invalid connection settings';
   cTXT0000109 = 'Field Account must have a value.'; 
   cTXT0000110 = 'Field Description must have a value.'; 
   cTXT0000111 = 'Field Type must have a value.'; 
   cTXT0000112 = 'Please enter a Merchant ID';
   cTXT0000113 = 'Please enter a Terminal ID';
   cTXT0000114 = 'Please enter a Group ID';
//   cTXT0000115 = '';
//   cTXT0000116 = '';
//   cTXT0000117 = '';
   cTXT0000118 = 'Cross reference detected - this %s shipping start time is within another %s shipping period.';
   cTXT0000119 = 'Cross reference detected - this %s shipping end time is within another %s shipping period.'; 
   cTXT0000120 = 'Cross reference detected - another %s shipping start time is within this %s shipping period.'; 
   cTXT0000121 = 'Cross reference detected - another %s shipping end time is within this %s shipping period.'; 
   cTXT0000122 = 'Shipping Hours [EPlant: %s]'; 
   cTXT0000123 = 'System Default';
   cTXT0000124 = 'Day must be assigned - operation aborted'; 
   cTXT0000125 = 'A transaction key has not been created.  Do you want to ' +
     'obtain a transaction key now?';
   cTXT0000126 = 'Could not create transaction key.';
   cTXT0000127 = 'Duplicate plant name.  Please enter a unique plant name.';
   cTXT0000128 = 'If initializing or switching costing methods please see the help files for information on initializing Costing Reports';
   cTXT0000129 = 'Select the number of digits to be used '#13'when scanning serial number. Defaults to 9.';
   cTXT0000130 = 'Invalid Employee Portal auto logout time specified.  The entered value must be zero or null (unlimited) or greater than or equal to 60.';
   cTXT0000131 = 'This will ensure all users are logged out of the Employee portal after the specified number of seconds (minimum 60). '+
                 'This will override the user''s Auto Shut Off time if it is lower.';
   cTXT0000132 = ''; 
   cTXT0000133 = ''; 
   cTXT0000134 = ''; 
   cTXT0000135 = ''; 
   cTXT0000136 = ''; 
   cTXT0000137 = ''; 
   cTXT0000138 = ''; 
   cTXT0000139 = ''; 
   cTXT0000140 = ''; 
   cTXT0000141 = ''; 
   cTXT0000142 = ''; 
   cTXT0000143 = ''; 
   cTXT0000144 = ''; 
   cTXT0000145 = ''; 
   cTXT0000146 = ''; 
   cTXT0000147 = ''; 
   cTXT0000148 = ''; 
   cTXT0000149 = ''; 
   cTXT0000150 = ''; 
   cTXT0000151 = ''; 
   cTXT0000152 = ''; 
   cTXT0000153 = ''; 
   cTXT0000154 = ''; 
   cTXT0000155 = ''; 
   cTXT0000156 = ''; 
   cTXT0000157 = ''; 
   cTXT0000158 = ''; 
   cTXT0000159 = ''; 
   cTXT0000160 = ''; 
   cTXT0000161 = ''; 
   cTXT0000162 = ''; 
   cTXT0000163 = ''; 
   cTXT0000164 = ''; 
   cTXT0000165 = ''; 
   cTXT0000166 = ''; 
   cTXT0000167 = ''; 
   cTXT0000168 = ''; 
   cTXT0000169 = ''; 
   cTXT0000170 = ''; 
   cTXT0000171 = ''; 
   cTXT0000172 = ''; 
   cTXT0000173 = ''; 
   cTXT0000174 = ''; 
   cTXT0000175 = ''; 
   cTXT0000176 = ''; 
   cTXT0000177 = ''; 
   cTXT0000178 = ''; 
   cTXT0000179 = ''; 
   cTXT0000180 = ''; 
   cTXT0000181 = ''; 
   cTXT0000182 = ''; 
   cTXT0000183 = ''; 
   cTXT0000184 = ''; 
   cTXT0000185 = ''; 
   cTXT0000186 = ''; 
   cTXT0000187 = ''; 
   cTXT0000188 = ''; 
   cTXT0000189 = ''; 
   cTXT0000190 = ''; 
   cTXT0000191 = ''; 
   cTXT0000192 = ''; 
   cTXT0000193 = ''; 
   cTXT0000194 = ''; 
   cTXT0000195 = ''; 
   cTXT0000196 = ''; 
   cTXT0000197 = ''; 
   cTXT0000198 = ''; 
   cTXT0000199 = ''; 
   cTXT0000200 = ''; 

implementation

end.


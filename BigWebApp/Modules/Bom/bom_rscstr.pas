unit bom_rscstr;

interface

// bom_rscstr.cTXT0000016

resourcestring

   cTXT0000001 = 'Field %s must be greater than 0';
   cTXT0000002 = '%s - invalid number';
   cTXT0000003 = 'Accessing BOM.  Please wait.';
   cTXT0000004 = 'Miscellaneous Parameters for %s';
   cTXT0000005 = 'Invalid Default Scheduling Scopes';
   cTXT0000006 = 'Invalid Manufacturing Run Size';
   cTXT0000007 = 'This Scheduling Scope (Time Horizon) must be greater than zero for the system to function.';
   cTXT0000008 = 'The Scheduling Scope (Time Horizon) should be at least as long as the longest raw material leadtime. '+
                'Sales release dates past the horizon will NOT be evaluated!  IQMS suggests at least 120 days.';
   cTXT0000009 = 'The Run Size Scope must be greater than one for the sytem to function properly. '+
               'IQMS suggests between 5 and 15 days for the Run Size Scope.';
   cTXT0000010 = 'The Run Size Scope should usually be less than 30 days. '+
               'The Run Size Scope is used to group sales releases together in one Manufacturing Run based on scope days. '+
               'The shorter the time the more setups - the longer time the more finished goods inventory you will build. '+
               'IQMS suggests between 5 and 15 days for the Run Size Scope.';
   cTXT0000011 = 'The Schedule Scope (Time Horizon) and the Run Size Scope '+
               'should not be equal. The Scheduling Scope (Time Horizon) should be at least as long as the longest raw material leadtime. '+
               'Sales release dates past the horizon will not be evaluated!  IQMS suggests at least 120 days. '+
               'The Run Size Scope is used to group sales releases together in one Manufacturing Run based on scope days. '+
               'The shorter the time the more setups - the longer time the more finished goods inventory you will build. '+
               'IQMS suggests between 5 and 15 days for the Run Size Scope.';
   cTXT0000012 = 'The Schedule Scope (Time Horizon) should not be less than the Run Size Scope. '+
                 'The Scheduling Scope (Time Horizon) should be at least as long as the longest raw material leadtime. '+
                 'Sales release dates past the horizon will not be evaluated!  IQMS suggests at least 120 days. '+
                 'The Run Size Scope is used to group sales releases together in one Manufacturing Run based on scope days. '+
                 'The shorter the time the more setups - the longer time the more finished goods inventory you will build. '+
                 'IQMS suggests between 5 and 15 days for the Run Size Scope.';
   cTXT0000013 = 'Percentage must be positive number';
   cTXT0000014 = 'User-Defined Conversions for %s';
   cTXT0000015 = 'Unable to establish manufacturing type [Appdef1.MfgType = %s]';
   cTXT0000016 = 'Invalid Field Name value. Please use the drop-down box to assign a field name.';
   cTXT0000017 = 'Process# %s already exists in the Mfg# %s - operation aborted'; 
   cTXT0000018 = 'Delete Record?';
   cTXT0000019 = 'Scrap %'; 
   cTXT0000020 = 'Yield %'; 
   cTXT0000021 = 'Backflush regrind from inventory'; 
   cTXT0000022 = 'Backflush waste material from inventory'; 
   cTXT0000023 = 'Total Cycles at Cycle Weight';
   cTXT0000024 = 'Total Cycles at Shot Weight'; 
   cTXT0000025 = 'Mfg# %s will be removed from Item# %s Manufacturing Load Split Percentage Calculation'; 
   cTXT0000026 = 'Convert BOM (MFGNO # %s)'; 
   cTXT0000027 = 'MFGNO # %s'; 
   cTXT0000028 = 'Conversion completed successfully.'; 
   cTXT0000029 = 'Do you wish to convert BOM(s) to Quote?'; 
   cTXT0000030 = 'Check Available Regrind % in lbs/k Calc'; 
   cTXT0000031 = 'Check Available Waste % in lbs/k Calc'; 
   cTXT0000032 = 'Field %s must have a value.';
   cTXT0000033 = 'Your security settings prevent access to this item.'#13#13'Please grant access to ''%s'' to continue.';
   cTXT0000034 = 'You are about to change the Expiration Date for this Lot#';
   cTXT0000035 = 'Actual work center selected was found among already calculated runs best records for this BOM.'#13#13'Operation aborted!';
   cTXT0000036 = 'Selected center type does not match mfg cell - continue?';
   cTXT0000037 = 'Unable to convert %s to %s.';
   cTXT0000038 = '';
   cTXT0000039 = '';
   cTXT0000040 = ''; 
   cTXT0000041 = ''; 
   cTXT0000042 = ''; 
   cTXT0000043 = ''; 
   cTXT0000044 = ''; 
   cTXT0000045 = ''; 
   cTXT0000046 = ''; 
   cTXT0000047 = ''; 
   cTXT0000048 = ''; 
   cTXT0000049 = ''; 
   cTXT0000050 = ''; 

implementation

end.

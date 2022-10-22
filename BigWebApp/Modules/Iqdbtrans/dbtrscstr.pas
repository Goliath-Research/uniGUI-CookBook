unit dbtrscstr;

interface

resourcestring

   // dbtrscstr.cTXT0000211

   cTXT0000001 = 'Process completed successfully.';
   cTXT0000002 = 'Import failed';
   cTXT0000003 = 'The data file may be corrupt or in an invalid format.';
   cTXT0000004 = 'Please specify a source data file to import.';
   cTXT0000005 = '<None>';        // used generally
   cTXT0000006 = 'Tab Character'; // as delimiter
   cTXT0000007 = 'Semicolon';     // as delimiter
   cTXT0000008 = 'Comma';         // as delimiter
   cTXT0000009 = 'Field Name';    // dataset field name
   cTXT0000010 = 'Size';          // field size
   cTXT0000011 = 'Offset';        // for fixed width files, what is the field spacing?
   cTXT0000012 = 'Sample Data';   // display of sample data
   cTXT0000013 = 'Application Error:  Temporary table not provided by calling method.';
   cTXT0000014 = 'The field, %s, is of an unknown or unsupported type.';
   cTXT0000015 = 'Could not create data definition.  Process aborted.';
   cTXT0000016 = 'File type not supported:  %s';
   cTXT0000017 = 'Application Error:  Database not supplied.';
   cTXT0000018 = 'Current version of Microsoft Access is not supported.';
   cTXT0000019 = 'Cannot connect to database, %s:';
   cTXT0000020 = 'Please select a table.';
   cTXT0000021 = 'Database contains no tables.';
   cTXT0000022 = 'Retrieving table definition...';
   cTXT0000023 = 'Abort import operation?';
   cTXT0000024 = 'Importing data...';
   cTXT0000025 = 'Sample data from file:  %s';
   cTXT0000026 = 'Cannot find file, %s';
   cTXT0000027 = 'Field name is required.';

   //Fixed
   cTXT0000028 = 'How are the fields spaced in the data file?';
   cTXT0000029 = 'The wizard has guessed how the fields are separated.  Please make any needed adjustments.';
   //Delimited
   cTXT0000030 = 'What are the field sizes?';
   cTXT0000031 = 'Please adjust field sizes if necessary.';

   cTXT0000032 = 'A schema already exists for this file.  Do you wish to import using the existing schema?'#13#13 +
                 'Note: The first record must not contain field names.';
   cTXT0000033 = 'Possible causes:'#13 +
                 '  • The schema configuration is incorrect.'#13 +
                 '  • The file format is invalid.'#13 +
                 '  • The file is opened exclusively by another user or application.'#13 +
                 '  • The file is corrupted.';
   cTXT0000034 = 'The Microsoft Access database is currently in use.  ' +
                 'Please close the database and any documents connected ' +
                 'to the database before merging records.';
   cTXT0000035 = 'Test Data created by IQMS';
   cTXT0000036 = 'Could not create ODBC Datasource (DSN).';
   cTXT0000037 = 'Could not create Microsoft Access Database:';
   cTXT0000038 = 'Abort export?';
   cTXT0000039 = 'Database file type not supported:  %s';
   cTXT0000040 = 'Table Name';
   cTXT0000041 = 'Export into this table:';
   cTXT0000042 = 'Export to %s';
   cTXT0000043 = 'Exporting to %s.  Please wait.';
   cTXT0000044 = 'Application Error:  Target table name not supplied.';
   cTXT0000045 = 'Application Error:  Source dataset not supplied.';
   cTXT0000046 = 'Could not open source dataset.  Please close the application (to disconnect from the database), and try again.';
   cTXT0000047 = 'Could not open source dataset:'#13'%s';
   cTXT0000048 = 'Parameters have either not been created, or have not been approved for SPC.  The import cannot continue.';
   cTXT0000049 = 'No tables found.';
   
   cTXT0000050 = 'Creating Microsoft Access database...';
   cTXT0000051 = 'There are no records to import.  Operation aborted.';
   cTXT0000052 = 'Cannot access data in selected table.';
   cTXT0000053 = 'Import Execution Error';
   cTXT0000054 = 'Clear list of recently used files?';
   cTXT0000055 = 'Import From Database';
   cTXT0000056 = 'Export To Database';
   cTXT0000057 = 'Import';
   cTXT0000058 = 'Export';
   cTXT0000059 = 'Current version of Microsoft Excel is not supported.';
   cTXT0000060 = 'Saving file ...';
   cTXT0000061 = 'There is no data to import.';
   cTXT0000062 = 'The file %s already exists.  Do you want to replace the existing file?';
   cTXT0000063 = 'Exporting %s.';
   cTXT0000064 = 'Please wait.';
   cTXT0000065 = 'Dataset contains excessive number of records.  Microsoft Excel can have a maxiumum of 65,536 rows.';
   cTXT0000066 = 'Could not replace file.';
   cTXT0000067 = 'There are an excessive number of records selected for processing.  Operation aborted.';
   cTXT0000068 = '%d records will be exported.  Do you want to continue?';
   cTXT0000069 = 'There are no records to export.  Operation aborted.';
   cTXT0000070 = 'Cannot connect to database';
   cTXT0000071 = 'Please log in to the source database.';
   cTXT0000072 = 'Please log in to the target database.';

   cTXT0000073 = 'Unknown';
   cTXT0000074 = 'Integer';
   cTXT0000075 = 'Yes/No';
   cTXT0000076 = 'Number';
   cTXT0000077 = 'Date and Time';
   cTXT0000078 = 'Text';
   cTXT0000079 = 'Blob';
   cTXT0000080 = 'Table not found: %s';

   cTXT0000081 = 'Export Execution Error';
   cTXT0000082 = 'Connection Error';
   cTXT0000083 = 'Data Error';

   cTXT0000084 = 'Table not found: %s [GetDataTypeStringIQ()]';
   cTXT0000085 = 'Please select items to link.';
   cTXT0000086 = 'This link has already been established.';
   cTXT0000087 = 'Field already used: %s';
   cTXT0000088 = 'Field size mismatch.  The source field is too large for the target field.';
   cTXT0000089 = 'You have linked a number field to a text field.';
   cTXT0000090 = 'The datatypes on these two fields do not match:'#13#13 +
                 '   · %s (%s)'#13 +
                 '   · %s (%s)'#13#13 +
                 'Please choose fields that have matching datatypes.';
   cTXT0000091 = 'Please select an item from the list.';
   cTXT0000092 = 'Date and time fields cannot be used as primary keys.';
   cTXT0000093 = 'Clear all linked fields?';
   cTXT0000094 = 'This action will search for fields that appear to match ' +
                 'and add them to your list of linked fields.'#13#13 +
                 'Do you want to continue?';
   cTXT0000095 = 'There were no fields found that appear to match.  Please match fields manually.';
   cTXT0000096 = 'Please select fields to export.';
   cTXT0000097 = 'User name and password required.';
   cTXT0000098 = 'Process completed.';
   cTXT0000099 = 'Rename Field';
   cTXT0000100 = 'Enter a name for the field:';
   cTXT0000101 = 'Field names must be thirty characters or less.';
   cTXT0000102 = 'That field name is already used.  Enter a different name.';
   cTXT0000103 = 'Please select a target database.';
   cTXT0000104 = 'Connected successfully.';
   cTXT0000105 = 'Connection failed.';
   cTXT0000106 = 'The login or password may be incorrect, or the system data ' +
    'source (alias, DSN, etc.) may not be configured.';
   cTXT0000107 = 'Error connecting to data source.';
   cTXT0000108 = 'Could not access Excel spreadsheet data.';
   cTXT0000109 = 'Could not validate all field names.  Operation aborted.';
   cTXT0000110 = 'Could not connect to datasource.';
   cTXT0000111 = 'Please specify a valid data file.';
   cTXT0000112 = 'Schema file not found.';
   cTXT0000113 = 'Please specify a source data file to import.';
   cTXT0000114 = 'Field names must be from 2 to 30 characters.';
   cTXT0000115 = 'The field name, %s, has invalid characters.';
   cTXT0000116 = 'The field name, %s, is a reserved word.';
   cTXT0000117 = 'Invalid field name.';
   cTXT0000118 = 'Field names can contain only letters, numbers and underscore marks';
   cTXT0000119 = 'Duplicate field name.';
   cTXT0000120 = 'The field, %s, is duplicated in the import dataset.  Please change the field name.';
   cTXT0000121 = 'Error creating table.';
   cTXT0000122 = 'Encountered problems attempting to import Microsoft Access data: %s';
   cTXT0000123 = 'Cannot open table.  Table name is empty.';
   cTXT0000124 = 'Error Log';
   cTXT0000125 = 'Unknown';       // refers to field type for display purposes
   cTXT0000126 = 'Integer';       // refers to field type for display purposes
   cTXT0000127 = 'Yes/No';        // refers to field type for display purposes
   cTXT0000128 = 'Number';        // refers to field type for display purposes
   cTXT0000129 = 'Date and Time'; // refers to field type for display purposes
   cTXT0000130 = 'Text';          // refers to field type for display purposes
   cTXT0000131 = 'Blob';          // refers to field type for display purposes
   cTXT0000132 = 'Table not found: %s [GetDataTypeStringIQ()]';
   cTXT0000133 = 'Unknown or invalid data type [Field name: %s][Type: %s]';
   cTXT0000134 = 'Blob fields are unsupported.  Cannot import.';
   cTXT0000135 = 'Could not create ODBC Datasource (DSN).'; 
   cTXT0000136 = 'Application Error:  Field is null.'; 
   cTXT0000137 = 'Select this option if you want the wizard to determine the ' +
                 'field data type based on the first few rows.  If this is unchecked, ' +
                 'then fields will be imported as text.';
   cTXT0000138 = 'The wizard will determine the data type of each field based on ' +
    'the first few values.  If the data type changes in subsequent rows, the ' +
    'values that do not match the determined data type will not be imported; ' +
    'they will be null.  Please review the data below to ensure all values will imported.';
   cTXT0000139 = 'Invalid file name.  Data file names cannot contain extra periods.';
   cTXT0000140 = 'Cannot import file.  There are too many fields (%d), or the combined field sizes is too large (%d). ' +
    'The recommended limit is 50 fields or less per data file.  Please remove unnecessary fields and try again.';
   cTXT0000141 = 'Data file has more than 50 fields, which exceeds the recommended limit.';
   cTXT0000142 = 'Could not reconcile field names and data.  Schema file not created.';
   cTXT0000143 = 'Field name is empty.';
   cTXT0000144 = 'The data file cannot be imported because the following fields are invalid:';
   cTXT0000145 = 'Importing to %s'; 
   cTXT0000146 = 'Abort operation?'; 
   cTXT0000147 = 'Operation aborted';
   cTXT0000148 = 'Invalid user name or password.';
   cTXT0000149 = 'Could not create ODBC Datasource (DSN).';
   cTXT0000150 = 'Could not create Microsoft Access Database:';
   cTXT0000151 = 'sec';
   cTXT0000152 = 'One or more fields were interpreted as Yes/No (Boolean) fields.  ' +
    'Yes/No data has been imported as "Y" (Yes) and "N" (No) for compatibility with IQMS Yes/No fields.';
   cTXT0000153 = 'Information';
   cTXT0000154 = 'Field Type: %s (%d)';
   cTXT0000155 = 'Field Type: %s';
   cTXT0000156 = 'Filter Field: %s';
   cTXT0000157 = 'Hide SQL';
   cTXT0000158 = 'Show SQL';
   cTXT0000159 = 'Execution Error';
   cTXT0000160 = 'Accessing data.  Please wait...';
   cTXT0000161 = 'Exporting to table, %s...'; 
   cTXT0000162 = 'Please enter at least 2 characters for a field name.'; 
   cTXT0000163 = 'Field name must begin with a character (A to Z).'; 
   cTXT0000164 = 'You have selected FoxPro as the target data type.  ' +
    'One or more field names exceed the maximum, 10-character limit ' +
    'supported by FoxPro.  Do you want to edit the field names?';
   cTXT0000165 = 'No source fields were found.';
   cTXT0000166 = 'Invalid schema file.'; 
   cTXT0000167 = 'Tables';
   cTXT0000168 = 'Table'; 
   cTXT0000169 = 'Cannot find schema file.';
   cTXT0000170 = 'Encountered problems attempting to import XML data:'; 
   cTXT0000171 = 'Invalid XML table format.'; 
   cTXT0000172 = 'XML Schema could not be created.  Operation aborted.'; 
   cTXT0000173 = 'Accessing file.  Please wait...'; 
   cTXT0000174 = 'XML document has errors:'; 
   cTXT0000175 = 'The number of fields exceeds requested limit (%d):'#13'%s'; 
   cTXT0000176 = 'Drop table %s?';
   cTXT0000177 = 'Done. Table %s has been dropped.'; 
   cTXT0000178 = 'Could not drop table, %s.'; 
   cTXT0000179 = 'Importing data ...'; 
   cTXT0000180 = 'Disable trigger?';
   cTXT0000181 = 'Enable trigger?';
   cTXT0000182 = 'Accessing Excel data.  Please wait.';
   cTXT0000183 = 'Field names must be %d characters or less.'; 
   cTXT0000184 = 'Database:  %s'; 
   cTXT0000185 = 'SQL expression:'; 
   cTXT0000186 = 'DLL Script for %s'; 
   cTXT0000187 = 'Extracting DDL.  Please wait.'; 
   cTXT0000188 = 'Run script?'; 
   cTXT0000189 = 'Invalid field count (0) in schema.  ' +
     'Cannot evaluate this file as fixed text.';
   cTXT0000190 = 'Malformed schema text.  Could not parse.'; 
   cTXT0000191 = 'The selected data type, %s, has been deprecated.  ' +
    'Are you sure you want to use this data type?';
   cTXT0000192 = 'Encountered error configuring target dataset:'#13#13'%s';
   cTXT0000193 = 'Could not access data file:  %s';
   cTXT0000194 = 'Please specify a source data file to import.';
   cTXT0000195 = 'Could not create DSN:'#13'%s';
   cTXT0000196 = 'Driver Name: %s'#13'Attributes: %s';
   cTXT0000197 = 'Encountered error while retrieving record count:'#13#13'%s'; 
   cTXT0000198 = 'The table, %s, was not found in the database.  ' +
    'It may have been renamed or deleted.';
   cTXT0000199 = 'The table fields have changed since this ' +
     'import was last configured.  Please reconfigure the import for this ' +
     'file.';
   cTXT0000200 = 'The table, %s, already exists.  Do you wish to replace it?';
   cTXT0000201 = 'The field name, %s, is a Microsoft Jet reserved word.  Please select a different field name.'; 
   cTXT0000202 = 'The DSN is invalid or incomplete.  The Microsoft Jet database has not been specified in the DSN.'; 
   cTXT0000203 = 'The target database, %s, referenced by the DSN could not be found.'; 
   cTXT0000204 = 'Loading data preview.  Please wait.'; 
   cTXT0000205 = 'You are not logged in.  You must be logged ' +
      'into an IQMS database to proceed.';
   cTXT0000206 = 'Done.';
   cTXT0000207 = 'Accessing database.  Please wait.'; 
   cTXT0000208 = 'Connected successfully to database.'#13 +
    'Accessing table list.  Please wait.';
   cTXT0000209 = 'Accessing source data. Please wait.'; 
   cTXT0000210 = 'Please enter a configuration name.'; 
   cTXT0000211 = 'The field, %s, is of an unknown or unsupported type (%s).';
   cTXT0000212 = 'Please enter a unique table name:';
   cTXT0000213 = 'Invalid character in table name.';
   cTXT0000214 = 'Table name must not be longer than 30 characters.';
   cTXT0000215 = 'Table already exists.  Please enter a unique table name.';
   cTXT0000216 = 'Please enter a table name.';
   cTXT0000217 = 'The table name you entered is a reserved word.  Please ' +
    'enter a different table name.';
   cTXT0000218 = 'Connecting to Microsoft Excel.  Please wait.';
   cTXT0000219 = 'Cannot connect to Microsoft Excel.';
   cTXT0000220 = 'Could not access table fields.';
   cTXT0000221 = 'Please select an item from the list.';
   cTXT0000222 = 'Please verify that fields were correctly mapped.';
   cTXT0000223 = 'Cannot retrieve table names:';
   cTXT0000224 = 'Exporting to Microsoft Excel.  Please wait...';
   cTXT0000225 = 'Processing sheet, "%s"';
   cTXT0000226 = 'Field, %s, already exists.  Please enter a unique field name.';
   cTXT0000227 = 'Field name:  %s';
   cTXT0000228 = 'Field index:  %d';
   cTXT0000229 = 'Byte';
   cTXT0000230 = 'Integer';
   cTXT0000231 = 'Currency';
   cTXT0000232 = 'Single';
   cTXT0000233 = 'Double';
   cTXT0000234 = 'Date/Time';
   cTXT0000235 = 'Text';
   cTXT0000236 = 'Memo';
   cTXT0000237 = 'Field list is empty.';
   cTXT0000238 = 'Encountered an error creating the table.';
   cTXT0000239 = 'A field separator is required for delimited text files.';
   cTXT0000240 = 'Malformed text file.  Inconsistent field count for row %d.  ' +
     'Expected %d fields, but found %d.';
   cTXT0000241 = 'Encountered an error adding a table record.';
   cTXT0000242 = 'Row Number: %d';
   cTXT0000243 = 'Please specify a field separator.';
   cTXT0000244 = ''; 
   cTXT0000245 = ''; 
   cTXT0000246 = ''; 
   cTXT0000247 = ''; 
   cTXT0000248 = ''; 
   cTXT0000249 = ''; 
   cTXT0000250 = ''; 

   // dbtrscstr.cTXT0000205


implementation

end.

unit Qc_rscstr;

interface

// Qc_rscstr.cTXT000003

resourcestring
  cTXT000001 = 'Are you sure you want to archive this record?';
  cTXT000002 = 'Are you sure you want to restore this record?';
  cTXT000003 = 'This record is archived.  Changes are not allowed.';
  cTXT000004 = 'Jump To';
  cTXT000005 = 'Update Subsequent Required Dates?';
  cTXT000006 = 'This document is referenced by SPC.  Do you want to remove the references?';
  cTXT000007 = 'This option resets the record so it can be re-evaluated again.'#13#13 +
    ' Are you sure you wish to proceed?';
  cTXT000008 = 'This option resets ALL records so it can be re-evaluated again.'#13#13 +
    ' Are you sure you wish to proceed?';
  cTXT000009 = 'Finished processing.'#13#13 +
      'Number of processed Workflow/approval records: %d';
  cTXT000010 = 'This option resets the element completion date and its ' +
    'Workflow approval records so it can be evaluated again.'#13#13 +
    ' Are you sure you wish to proceed?';
  cTXT000011 = 'This option resets the completion date for all elements ' +
    'along with all Workflow approval records so it can be evaluated ' +
    'again.'#13#13' Are you sure you wish to proceed?';
  cTXT000012 = 'Duplicated template name found.  Please provide a unique ' +
    'template name.';
  cTXT000013 = 'Template not found.  Cannot clone non-existing template.';
  cTXT000014 = 'Invalid template.  Cannot clone.';
  cTXT000015 = 'Active is checked.  Changes to elements are not allowed.';
  cTXT000016 = 'Complete date is assigned.  Changes to elements are not allowed.';
  cTXT000017 = 'No outstanding Workflows were found.';
  cTXT000018 = 'Application Server URL is not assigned.';
  cTXT000019 = 'Element is marked as ''Completed''.  Operation aborted.';
  cTXT000020 = 'Exception encountered while processing a Workflow:';
  cTXT000021 = 'Workflow header table: %s';
  cTXT000022 = 'Header ID: %.0f';
  cTXT000023 = 'Workflow Element table: %s';
  cTXT000024 = 'Element ID: %.0f';
  cTXT000025 = 'The Workflow has been submitted.  Operation is not allowed.';
  cTXT000026 = 'The Workflow is in either progress or is finished. ' +
    'The team member cannot be changed.';
  cTXT000027 = 'Invalid Team Member ID.';
  cTXT000028 = 'The pending approval record signoff link is blank.  ' +
    'Operation aborted.';
  cTXT000029 = 'Document # %s: New idea submitted.';
  cTXT000030 = 'Document #: %s';
  cTXT000031 = 'Document Description: %s';
  cTXT000032 = 'Status: %s';
  cTXT000033 = 'Last Modified: %s';
  cTXT000034 = 'Submitted By: %s';
  cTXT000035 = 'The Idea: %s';
  cTXT000036 = 'Thank you.';
  cTXT000037 = 'A team member with a User ID of, %s, already exists.';
  cTXT000038 = 'Email Address';
  cTXT000039 = 'Enter Email Address';
  cTXT000040 = 'You are about to delete a team member.'#13#13+
    'Before removing the team member from the master list the system is going to cross-reference '+
    'every template and Workflow to allow this member to either be deleted, replaced with another or skipped.'#13#13+
    'Are you sure you want to delete this team member?';
  cTXT000041 = 'Team Member %s is marked as ''Out Of Office''.'#13#13 +
    'Start redirecting %s''s Workflows to designated delegate?';
  cTXT000042 = 'Team Member %s status ''Out Of Office'' is about to be ' +
    'cancelled.'#13#13'Stop redirecting %s''s Workflows to designated delegate?';
  cTXT000043 = '''Out Of Office'' status change was not confirmed.  ' +
    'Aborting operation.';
  cTXT000044 = 'Notice that %s will be out of the office. %s will be processing %s in %s''s absence.';
  cTXT000045 =  'Notice that %s has returned to the office. %s will no longer receive %s intended for %s.';
  cTXT000046 = '''Out of office'' status change notice';
  cTXT000047 = 'Thank you.';
  cTXT000048 = 'Document # %s, %s [ Rev: %s ]%s %s';
  cTXT000049 = 'Processing.  Please wait ...';
  cTXT000050 = 'Error encountered while attempting to convert file, ''%s'', ' +
    'to PDF format.'#13'Error: %s';
  cTXT000051 = 'Initializing the PDF convertor...';
  cTXT000052 = 'Failed to initialize NovaPDF COM. A call to ' +
    'ActiveX.CoInitialize has failed.';
  cTXT000053 = 'Failed to create NovaPDF COM Object. A call to ' +
    'ActiveX.CoCreateInstance has failed.';
  cTXT000054 = 'Preparing to convert to PDF ...';
  cTXT000055 = 'Cannot convert source file, %s, to PDF. The file does ' +
    'not exist.';
  cTXT000056 = 'Cannot convert source file, %s, to PDF.  The directory, %s, ' +
    'does not exist.';
  cTXT000057 = 'Cannot delete file, %s. Error Code = %d.';
  cTXT000058 = 'Converting document to PDF ...';
  cTXT000059 = 'Failed to add Private Nova Profile';
  cTXT000060 = 'Timed out waiting for file, %s, to be converted to PDF.';
  cTXT000061 = 'Encountered error while processing Microsoft Word: %s';
  cTXT000062 = 'Encountered error while processing Microsoft Excel: %s';
  cTXT000063 = 'Failure attempting to call ShellExecuteExA. Error Code = %d.';
  cTXT000064 = 'Error saving temporary file on printer server';
  cTXT000065 = 'Error reading license information';
  cTXT000066 = 'Error saving PDF file';
  cTXT000067 = 'Print job was canceled';
  cTXT000068 = 'PDF Converter Error: %s.';
  cTXT000069 = 'Publish this document to the Web?';
  cTXT000070 = 'Unpublish this document?';
  cTXT000071 = 'Define %s Column Title';
  cTXT000072 = 'Edit Document #';
  cTXT000073 = 'Enter new document number:';
  cTXT000074 = 'Unable to locate Document # %s.  Please check the filter and try again.';
  cTXT000075 = 'Converting to PDF';
  cTXT000076 = 'Unable to locate external Document ID = %s';
  cTXT000077 = 'Converting ''%s'' (%d/%d) ...';
  cTXT000078 = 'Processing %d/%d.  Please wait ...';
  cTXT000079 = 'Create Certification Test';
  cTXT000080 = 'Edit Certification Test';
  cTXT000081 = 'Are you sure you want to create a Certification Test for ' +
    'the selected document?';
  cTXT000082 = 'Cannot find file, %s';
  cTXT000083 = 'The Watermark Text will be added to the PDF'#13+
    'when a document is checked in if '#13+
    '''Convert to PDF for Module Display'' or'#13+
    '''Convert to PDF for Publishing'' is enabled.';
  cTXT000084 = 'Please enter a PDF target UNC path.';
  cTXT000085 = 'You have selected to convert documents to PDF format for ' +
    'module display. Convert existing documents now?';
  cTXT000086 = 'The database alias must point to a remote instance other than %s';
  cTXT000087 = 'Default library cannot be deleted.';
  cTXT000088 = 'Failed - file %s is already associated with the ' +
    'document %s in ''%s''';
  cTXT000089 = 'This is a secured library. Owner name can only be changed ' +
    'when the document does not have file assigned or status is ''Released''';
  cTXT000090 = 'The document is in the Pending Review/Authorization stage.'#13 +
    'Unable to proceed.';
  cTXT000091 = 'No previous version was found.  Unable to proceed.  The ' +
    'document must have ''Released'' status.';
  cTXT000092 = 'Are you sure you want to check-in this document?';
  cTXT000093 = 'Document is pending review/authorization';
  cTXT000094 = 'Document is released';
  cTXT000095 = 'Failed to acquire exclusive lock.'#13#13'Please try again later.';
  cTXT000096 = ' - Unable to unlock existing lock. Please terminate to ' +
    'allow other users to run the same application.';
  cTXT000097 = 'Document status must be ''New'' or ''Checked Out'' in order ' +
    'to be able to check it in.';
  cTXT000098 = 'Authorization/Review required. Workflow with a minimum of one ' +
    'authorizer must be assigned.';
  cTXT000099 = 'Authorization/Review required. Team Members must be assigned.';
  cTXT000100 = 'Unable to Check In.  File, %s, does not exist in the ' +
    'library, ''%s''.';
  cTXT000101 = 'Are you sure you wish to check-out/edit this document?';
  cTXT000102 = 'New Document is registered.';
  cTXT000103 = 'Document is checked out for changes.';
  cTXT000104 = 'Document was pending review/authorization and was checked ' +
    'out again.';
  cTXT000105 = 'This document is already checked out.';
  cTXT000106 = 'This is a secured library. The current user must either ' +
    'be the document owner or be a DBA.';
  cTXT000107 = 'The system has reached maximum calculated revision ' +
    'capacity and is unable to acquire the next revision number.'#13#13 +
    'Would you like to enter the next revision number manually?';
  cTXT000108 = 'New Revision';
  cTXT000109 = 'Please enter the new revision number:';
  cTXT000110 = 'Revision cannot be blank.';
  cTXT000111 = 'Revision cannot exceed 20 characters.';
  cTXT000112 = '%s Rev %s%s';
  cTXT000113 = 'Failed to assign next available filename. Path = %s, ' +
    'FileName = %s';
  cTXT000114 = 'Document is assigned to library. File name is assigned.';
  cTXT000115 = 'Describe Changes to Document';
  cTXT000116 = 'Failed to open file. Error Code = %d';
  cTXT000117 = 'Unable to delete existing file %s. Error Code = %d.';
  cTXT000118 = 'Unable to delete existing temporary work file %s. Error ' +
    'Code = %d.';
  cTXT000119 = 'Unable to delete internal work file %s. Error Code = %d';
  cTXT000120 = 'This is a secured library. Please assign valid, temporary, ' +
  'working directory to the document owner.';
  cTXT000121 = 'Unable to rename file, %s, to, %s. Error Code = %d.';
  cTXT000122 = 'File in use, check with administrator.';
  cTXT000123 = 'File already exists in UNC Path of Library.';
  cTXT000124 = 'Access is denied.';
  cTXT000125 = 'The system cannot find the file specified.';
  cTXT000126 = 'Unable to copy file, %s, to, %s. Error Code = %d.';
  cTXT000127 = 'Unable to move file, %s, to, %s. Error Code = %d.';
  cTXT000128 = 'Routing';
  cTXT000129 = 'Unable to identify logged-in user as a team member.';
  cTXT000130 = 'You cannot modify an idea that belongs to somebody else.';
  cTXT000131 = 'You are sure you want to respond to the idea?';
  cTXT000132 = 'Respond';
  cTXT000133 = 'Cannot delete an idea.  One or more responses were found.';
  cTXT000134 = 'You cannot delete an idea that belongs to somebody else.';
  cTXT000135 = 'New Idea';
  cTXT000136 = 'Document must have a minimum of one (1) Authorizer. ' +
    'Unable to proceed.';
  cTXT000137 = 'Evaluation completed.';
  cTXT000138 = 'Are you sure you want to revert all changes and restore the ' +
    'previous version of this document?';
  cTXT000139 = 'Unable to delete file, %s. Error Code = %d.';
  cTXT000140 = 'Unable to Check In.  File, %s, does not exist.';
  cTXT000141 = 'Document is ''Released''.  This record cannot be re-evaluated.';
  cTXT000142 = 'Document is ''Released''.  Records cannot be re-evaluated.';
  cTXT000143 = 'Locating library...';
  cTXT000144 = 'Unable to locate library [ID = %.0f].';
  cTXT000145 = 'Locating and appending document...';
  cTXT000146 = 'Application Error:  Invalid new external document (ID = 0).  ' +
    'Operation aborted.';
  cTXT000147 = 'Appending new document...';
  cTXT000148 = 'Linking new document...';
  cTXT000149 = 'Updating Registry...';
  cTXT000150 = 'Processing %s (%d / %d)';
  cTXT000151 = 'Error processing file %s:'#13+
    '%s'#13+
    'Continue processing?';
  cTXT000152 = 'Workflow is either in progress or is finished. Cannot change ' +
    'team member.';
  cTXT000153 = 'Application Error:  Invalid Team Member ID';
  cTXT000154 = 'Please enter a value for, ''Type''.';
  cTXT000155 = 'The document is ''Released''.  Cannot modify team members.';
  cTXT000156 = 'A type of ''Review'' or ''Authorize'' cannot be set once a ' +
    'document has been submitted and is pending.';
  cTXT000157 = 'The team member has been reset for evaluation because the ' +
    'Type has changed. Please evaluate the Workflow.';
  cTXT000158 = 'You have selected %d file(s) for comparision.'#13#13 +
    'Please use the column, ''Compare'', to select two (2) files to compare ' +
    'and try again.';
  cTXT000159 = 'The file name is unknown.  Unable to select file for comparison.';
  cTXT000160 = 'Cannot find file.  Unable to select file for comparison.';
  cTXT000161 = 'Do you want to check-in all documents?';
  cTXT000162 = 'You must describe changes made to the document in order to ' +
    'continue. Would you like to enter a description now?';
  cTXT000163 = 'Checking %s ...';
  cTXT000164 = 'Encountered the following error while processing document, %s:'#13 +
    '%s'#13#13'Execution will continue normally from here.';
  cTXT000165 = 'Processing document, %s ...';
  cTXT000166 = 'Not Connected';
  cTXT000167 = 'Connected Successfully [Version: %s]';
  cTXT000168 = 'Invalid library path.  Access is denied.';
  cTXT000169 = 'Linked Documents of %s';
  cTXT000170 = 'Unlink document?';
  cTXT000171 = 'Show linked documents?';
  cTXT000172 = 'The document has expired.  Would you like to continue and ' +
    'open the document?';
  cTXT000173 = 'Where Document Used - %s';
  cTXT000174 = 'Jump to %s';
  cTXT000175 = 'Jump information is unavailable.  Cannot jump to ' +
    'source.'#13#13'[%s, %d%s]';
  cTXT000176 = 'No cross references found for this team member in any template or Workflow.';
  cTXT000177 =  'Please review element, make necessary corrections and re-evaluate Workflow.'#13#13+
          'Thank you';
  cTXT000178 = 'This is a secured library document that has never been approved and therefore cannot be reverted - operation aborted.';
//  cTXT000179 = '';
//  cTXT000180 = '';
//  cTXT000181 = '';
//  cTXT000182 = '';
//  cTXT000183 = '';
//  cTXT000184 = '';
//  cTXT000185 = '';
//  cTXT000186 = '';
//  cTXT000187 = '';
//  cTXT000188 = '';
//  cTXT000189 = '';
//  cTXT000190 = '';
//  cTXT000191 = '';
//  cTXT000192 = '';
//  cTXT000193 = '';
//  cTXT000194 = '';
//  cTXT000195 = '';
//  cTXT000196 = '';
//  cTXT000197 = '';
//  cTXT000198 = '';
//  cTXT000199 = '';
//  cTXT000200 = '';


implementation

end.

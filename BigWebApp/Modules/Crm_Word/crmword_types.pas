unit crmword_types;


(* -----------------------------------------------------------------------------

                        *** CRM Mail Merge Types ***

    This unit contains type declarations for units in the \IQWin\crm_word
    directory.

 ---------------------------------------------------------------------------- *)


interface

uses
  System.Classes,
  System.SysUtils,
  System.Variants,
  Data.DB,
  Data.FMTBcd,
  Data.SqlExpr,
  IQMS.DBTrans.dbttypes,
  MainModule;

type
  { TMergeKind - Merge dataset type }
  TMergeKind = (mkUnknown, mkCustomers, mkContacts, mkVendors,
                mkVendorContacts, mkPartners, mkPartnerContacts,
                mkEmployees, mkCRMGroups, mkApplicants);

const
  OracleTableName: array[TMergeKind] of String =
   ('TEMPORARY',       // nothing - temporary table
    'CUSTOMERS',       // customers and prospects
    'CONTACTS',        // contacts
    'VENDORS',         // vendors
    'VENDOR_CONTACTS', // vendor contacts
    'PARTNERS',        // partners
    'PARTNER_CONTACTS',// partner contacts
    'EMPLOYEES',       // employees
    'CRM_GROUPS',      // crm groups
    'HR_APP');         // training applicants

  OracleViewName: array[TMergeKind] of String =
   ('',                       // nothing
    'V_MM_ARCUSTO',           // v_mm_arcusto.  includes arcusto.id
    'V_MM_ARCUSTO_CONTACT',   // v_mm_arcusto_contact.  includes arcusto_id and contact.id
    'V_MM_VENDOR',            // v_mm_vendor.  includes vendor.id
    'V_MM_VENDOR_CONTACT',    // v_mm_vendor_contact. includes vendor.id and vendor_contact.id
    'V_MM_PARTNER',           // v_mm_partner. includes partner.id
    'V_MM_PARTNER_CONTACTS',  // v_mm_partner_contacts. includes partner.id and partner_contacts.id
    'V_MM_PR_EMP',            // includes pr_emp.id
    'V_MM_CRM_GROUP',         //
    'V_MM_HR_APP');           // includes hr_apps.id

  MergeDescriptionStr: array[TMergeKind] of String =
   ('Unknown',         // nothing - temporary table
    'Customers',       // customers and prospects
    'Contacts',        // contacts
    'Vendors',         // vendors
    'Vendor_Contacts', // vendor contacts
    'Partners',        // partners
    'Partner_Contacts',// partner contacts
    'Employees',       // employees
    'CRM Groups',      // crm groups
    'Applicants');     // training applicants

{ Record object contains data for a given CRM Mail Merge record}
type
  TCRMMergeDocumentRecord = packed record
   ID: Real;
   UserID,
   Name,
   Description,
   FileName: String;
   DataSetIndex: Integer;
   TemplateName,
   DataFileName,
   DataTableName: String;
   DataTableType: Byte;
   MergeKind: TMergeKind;
   MergeDescription,
   MergeTableName,
   MergeViewName: String;
   CustomTableType: TCustomTableType;
   DataFileExt: String;
end;

  procedure ClearMergeDocumentRecord
   (var ACRMMergeDocumentRecord: TCRMMergeDocumentRecord);

  procedure CopyMergeDocumentRecord
   (const ASource: TCRMMergeDocumentRecord;
    var ATarget: TCRMMergeDocumentRecord);

  function GetCRMMergeDocumentRecord(const ADocumentID: Real;
   var ACRMMergeDocumentRecord: TCRMMergeDocumentRecord): Boolean;


implementation

procedure ClearMergeDocumentRecord
 (var ACRMMergeDocumentRecord: TCRMMergeDocumentRecord);
begin
  with ACRMMergeDocumentRecord do
  begin
   ID := 0;
   UserID := '';
   Name := '';
   Description := '';
   FileName := '';
   DataSetIndex := 0;
   TemplateName := '';
   DataFileName := '';
   DataTableName := '';
   DataTableType := 0;
   MergeKind := TMergeKind(0);
   MergeDescription := '';
   MergeTableName := '';
   MergeViewName := '';
   CustomTableType := dttMSAccess; // default to Microsoft Access
   DataFileExt := '.mdb';
  end;
end;

procedure CopyMergeDocumentRecord
 (const ASource: TCRMMergeDocumentRecord;
  var ATarget: TCRMMergeDocumentRecord);
begin
   ATarget.ID                 := ASource.ID            ;
   ATarget.UserID             := ASource.UserID        ;
   ATarget.Name               := ASource.Name          ;
   ATarget.Description        := ASource.Description   ;
   ATarget.FileName           := ASource.FileName      ;
   ATarget.DataSetIndex       := ASource.DataSetIndex  ;
   ATarget.TemplateName       := ASource.TemplateName  ;
   ATarget.DataFileName       := ASource.DataFileName  ;
   ATarget.DataTableName      := ASource.DataTableName ;
   ATarget.DataTableType      := ASource.DataTableType ;
   ATarget.MergeKind          := ASource.MergeKind     ;
   ATarget.MergeDescription   := ASource.MergeDescription;
   ATarget.MergeTableName     := ASource.MergeTableName;
   ATarget.MergeViewName      := ASource.MergeViewName ;
   ATarget.CustomTableType    := ASource.CustomTableType;
   ATarget.DataFileExt        := ASource.DataFileExt   ;
end;

function GetCRMMergeDocumentRecord(const ADocumentID: Real;
  var ACRMMergeDocumentRecord: TCRMMergeDocumentRecord): Boolean;
begin
  // First, clear the record
  ClearMergeDocumentRecord(ACRMMergeDocumentRecord);

  // Get the data
  with TSQLQuery.Create(NIL) do
  try
     { TODO -oathite -cWebConvert : Undeclared identifier: 'SQLConnection'
     SQLConnection := MainModule.UniMainModule.SQLConnection;
     SQL.Add('select id, userid, name, description, filename,');
     SQL.Add('     last_printed, dataset_index, templatename, datafilename,');
     SQL.Add('     datatablename, massmail, email_field_name, published,');
     SQL.Add('     datatabletype');
     SQL.Add('from crm_word_doc');
     SQL.Add(Format('where id = %.0f', [ADocumentID]));
     Open; }

     Result := not (BOF and EOF);
     if not Result then Exit;

     // Fill the record
     with ACRMMergeDocumentRecord do
      begin
        ID := ADocumentID;
        UserID := FieldByName('userid').AsString;
        Name := FieldByName('name').AsString;
        Description := FieldByName('description').AsString;
        FileName := FieldByName('filename').AsString;
        DataSetIndex := FieldByName('dataset_index').AsInteger;
        TemplateName := FieldByName('templatename').AsString;
        DataFileName := FieldByName('datafilename').AsString;
        DataTableName := FieldByName('datatablename').AsString;
        DataTableType := FieldByName('datatabletype').AsInteger;
        MergeKind := TMergeKind(DataSetIndex);
        MergeDescription := MergeDescriptionStr[MergeKind];
        MergeTableName := OracleTableName[TMergeKind(DataSetIndex)];
        MergeViewName := OracleViewName[TMergeKind(DataSetIndex)];
        CustomTableType := TCustomTableType(DataTableType);
        DataFileExt := IQMS.DBTrans.dbttypes.CustomTableExt[CustomTableType];
      end;

 finally
    Free; // free TSQLQuery
 end;
end;

end.

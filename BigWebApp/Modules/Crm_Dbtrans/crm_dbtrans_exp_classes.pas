unit crm_dbtrans_exp_classes;

interface

uses
  System.SysUtils,
  System.Classes,
  crm_rscstr,
  IQMS.DBTrans.dbtdb,
  MainModule;

type
  { TTargetDataSetType }
  TTargetDataSetType = (tdsCustomers, tdsContacts, tdsPartners,
    tdsPartnerContacts, tdsVendors, tdsVendorContacts, tdsCalls, tdsTasks,
    tdsMeetings, tdsNotes);

const
  ActivityDataSetTypes = [tdsCalls, tdsTasks, tdsMeetings, tdsNotes];
  ParentChildDataSetTypes = [tdsContacts, tdsPartnerContacts,
    tdsVendorContacts];

  // String conversion for type, TTargetDataSetType.
  TargetDataSetType: array [TTargetDataSetType] of string =
    (crm_rscstr.cTXT0001739, // 'Customers'
    crm_rscstr.cTXT0001740, // 'Contacts'
    crm_rscstr.cTXT0001741, // 'Partners'
    crm_rscstr.cTXT0001742, // 'Partner Contacts'
    crm_rscstr.cTXT0001743, // 'Vendors'
    crm_rscstr.cTXT0001744, // 'Vendor Contacts'
    crm_rscstr.cTXT0000459, // 'Calls'
    crm_rscstr.cTXT0000458, // 'Tasks'
    crm_rscstr.cTXT0000460, // 'Meetings'
    crm_rscstr.cTXT0000455 // 'Notes'
    );

type
  { TCRMImportSettings }
  TCRMExportSettings = class(TComponent)
    private
      { Private declarations }
      FEndDate: TDateTime;
      FTargetDataSetType: TTargetDataSetType;
      FStartDate: TDateTime;
      FSQL: TStrings;
      FByDateRange: Boolean;
      FFieldCatalog: TFieldCatalog;
      procedure SetTargetDataSetType(const Value: TTargetDataSetType);
    protected
      { Protected declarations }
      procedure UpdatePropertyValues;
    public
      { Public declarations }
      constructor Create(AOwner: TComponent;
        ATargetDataSetType: TTargetDataSetType);
      destructor Destroy; override;
      procedure BuildQuery(var ASQL: string);
    published
      { Published declarations }
      property TargetDataSetType: TTargetDataSetType
        read FTargetDataSetType
        write SetTargetDataSetType;
      property ByDateRange: Boolean
        read FByDateRange
        write FByDateRange;
      property StartDate: TDateTime
        read FStartDate
        write FStartDate;
      property EndDate: TDateTime
        read FEndDate
        write FEndDate;
      property SQL: TStrings
        read FSQL;
      property FieldCatalog: TFieldCatalog
        read FFieldCatalog
        write FFieldCatalog;
  end;

implementation

uses
  crm_dbtrans_const,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  IQMS.Common.DataConst,
  Data.SqlExpr;

{ TCRMExportSettings }

constructor TCRMExportSettings.Create( AOwner: TComponent;
  ATargetDataSetType: TTargetDataSetType);

begin
  inherited Create(AOwner);
  TargetDataSetType := ATargetDataSetType;
  FSQL := TStringList.Create;
//  FFieldCatalog := TFieldCatalog.Create(db_dm.DB_DataModule.SQLConnection);

end;

destructor TCRMExportSettings.Destroy;
begin
  if Assigned(FSQL) then
    FreeAndNil(FSQL);
  if Assigned(FFieldCatalog) then
    FreeAndNil(FFieldCatalog);
  inherited;
end;

procedure TCRMExportSettings.BuildQuery(var ASQL: string);
var
  AFieldList, AWhereList: TStringList;
  i: Integer;
  ATempStr, AWhere: string;
  AHasCRMUserDefined: Boolean;
  hMsg: TPanelMesg;
begin
  // Initialization and preparation
  hMsg := nil;
  AHasCRMUserDefined := False;
  if not Assigned(FSQL) then
    FSQL := TStringList.Create;
  FSQL.Clear;

  try
    // crm_rscstr.cTXT0001772 = 'Building query ...';
    hMsg := hPleaseWait(crm_rscstr.cTXT0001772);
    // Build temporary string lists
    AFieldList := TStringList.Create;
    AWhereList := TStringList.Create;

    FSQL.Clear;
    FSQL.Add('SELECT');

    for i := 0 to FFieldCatalog.Count - 1 do
      begin
        // Checked items = output fields
        if FFieldCatalog.Items[i].Checked then
          begin
            AFieldList.Add(Format(#9'%s.%s AS %s',
              [FFieldCatalog.Items[i].TableName,
              FFieldCatalog.Items[i].FieldName,
              FFieldCatalog.Items[i].CustomText1]));

            if not AHasCRMUserDefined then
              AHasCRMUserDefined :=
                CompareText(FFieldCatalog.Items[i].TableName,
                crm_dbtrans_const.TABLE_NAME_CRM_USER_DEFINED) = 0;
          end;

        // A field doesn't have to be in the output to be used in the filter
        if (FFieldCatalog.Items[i].CustomText2 > '') then
          AWhereList.Add(Format('(%s %s)', [FFieldCatalog.Items[i].FieldName,
            FFieldCatalog.Items[i].CustomText2]));
      end;
    ATempStr := StrTran(AFieldList.CommaText, '"', '');
    ATempStr := LowerCase(ATempStr);
    ATempStr := StrTran(ATempStr, ',', ', '#13#10);
    FSQL.Add(ATempStr);

    AWhere := StrTran(AWhereList.CommaText, '","', ' AND ');
    AWhere := Trim(StrTran(AWhere, '"', ''));

    case TargetDataSetType of
      tdsCustomers:
        begin
          if AHasCRMUserDefined then
            begin
              FSQL.Add('FROM arcusto, crm_user_defined '); // customers
              FSQL.Add('WHERE (crm_user_defined.arcusto_id(+) = arcusto.id) ');
              if (AWhere > '') then
                FSQL.Add(' AND ' + AWhere);
            end
          else begin
              FSQL.Add('FROM arcusto '); // customers
              if (AWhere > '') then
                FSQL.Add('WHERE ' + AWhere);
            end;
        end;
      tdsContacts:
        begin
          if AHasCRMUserDefined then
            begin
              FSQL.Add('FROM arcusto, contact, crm_user_defined ');
              // customers
              FSQL.Add('WHERE (contact.arcusto_id(+) = arcusto.id) ');
              FSQL.Add(' AND (crm_user_defined.arcusto_id(+) = arcusto.id) ');
              if (AWhere > '') then
                FSQL.Add(' AND ' + AWhere);
            end
          else begin
              FSQL.Add('FROM arcusto, contact '); // customers
              FSQL.Add('WHERE (contact.arcusto_id(+) = arcusto.id) ');
              if (AWhere > '') then
                FSQL.Add(' AND ' + AWhere);
            end;
        end;
      tdsPartners:
        begin
          FSQL.Add('FROM partner'); // partners
          if (AWhere > '') then
            FSQL.Add('WHERE ' + AWhere);
        end;
      tdsPartnerContacts:
        begin
          FSQL.Add('FROM partner, partner_contacts'); // partners
          FSQL.Add('WHERE (partner_contacts.partner_id(+) = partner.id) ');
          if (AWhere > '') then
            FSQL.Add(' AND ' + AWhere);
        end;
      tdsVendors:
        begin
          FSQL.Add('FROM vendor'); // vendors
          if (AWhere > '') then
            FSQL.Add('WHERE ' + AWhere);
        end;
      tdsVendorContacts:
        begin
          FSQL.Add('FROM vendor, vendor_contact'); // vendors
          FSQL.Add('WHERE (vendor_contact.vendor_id(+) = vendor.id) ');
          if (AWhere > '') then
            FSQL.Add(' AND ' + AWhere);
        end;
      tdsCalls .. tdsNotes:
        begin
          case TargetDataSetType of
            tdsCalls:
              FSQL.Add('FROM v_crm_calls');
            tdsTasks:
              FSQL.Add('FROM v_crm_tasks');
            tdsMeetings:
              FSQL.Add('FROM v_crm_meetings');
            tdsNotes:
              FSQL.Add('FROM v_crm_notes');
          end;

          FSQL.Add('WHERE id > 0');
          // make sure we have a "WHERE" clause started, in case

          if ByDateRange then
            begin
              FSQL.Add(Format
                (' AND startdate BETWEEN TO_DATE(''%s'', ''MM/DD/RRRR'') AND TO_DATE(''%s'', ''MM/DD/RRRR'')',
                [FormatDateTime('mm/dd/yyyy', StartDate),
                FormatDateTime('mm/dd/yyyy', EndDate)]));
            end;

          if (AWhere > '') then
            FSQL.Add(' AND ' + AWhere);

          FSQL.Add('ORDER BY startdate');
        end;
    end;

    ASQL := FSQL.Text;

  finally
    if Assigned(AFieldList) then
      FreeAndNil(AFieldList);
    if Assigned(AWhereList) then
      FreeAndNil(AWhereList);
    if Assigned(hMsg) then
      FreeAndNil(hMsg);
  end;
end;

procedure TCRMExportSettings.SetTargetDataSetType
  (const Value: TTargetDataSetType);
begin
  FTargetDataSetType := Value;
  UpdatePropertyValues;
end;

procedure TCRMExportSettings.UpdatePropertyValues;
begin
  if not Assigned(FSQL) then
    FSQL := TStringList.Create;
  FSQL.Clear;
end;

end.

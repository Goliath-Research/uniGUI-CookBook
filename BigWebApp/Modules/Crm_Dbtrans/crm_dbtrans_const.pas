unit crm_dbtrans_const;

{ Constants used when call CRM Data Transfer (DBTRANS) }

interface

const

  DBT_IMPORT = $0078;
  DBT_EXPORT = $0090;

  // crm_dbtrans_const.TABLE_NAME_ARCUSTO

  TABLE_NAME_ARCUSTO = 'arcusto';
  TABLE_NAME_CONTACT = 'contact';
  TABLE_NAME_VENDOR = 'vendor';
  TABLE_NAME_VENDOR_CONTACT = 'vendor_contact';
  TABLE_NAME_PARTNER = 'partner';
  TABLE_NAME_PARTNER_CONTACT = 'partner_contacts';
  TABLE_NAME_CRM_ACTIVITY = 'crm_activity';
  TABLE_NAME_CRM_USER_DEFINED = 'crm_user_defined';

  // NOTE: We use the view, V_CRM_ACTIVITY_SIMPLE, because it shows only
  // the fields we want to display for importing.  Also, we can
  // supply it for any of the types, because it is simply used
  // to display a field list.
  FIELD_LIST_CRM_ACTIVITY = 'v_crm_activity_simple';

  FIELD_LIST_CRM_CALLS = 'v_crm_calls';
  FIELD_LIST_CRM_TASKS = 'v_crm_tasks';
  FIELD_LIST_CRM_MEETINGS = 'v_crm_meetings';
  FIELD_LIST_CRM_NOTES = 'v_crm_notes';

implementation

end.

object FrmCRMActivityProperties: TFrmCRMActivityProperties
  Left = 336
  Top = 245
  ClientHeight = 375
  ClientWidth = 302
  Caption = 'Properties'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object diData: TwwDataInspector
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 296
    Height = 369
    DisableThemes = False
    Align = alClient
    TabOrder = 0
    DataSource = SrcActivity
    Items = <
      item
        DataSource = SrcActivity
        DataField = 'ID'
        Caption = 'Record ID'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'STARTDATE'
        Caption = 'Start Date'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'FINISHDATE'
        Caption = 'Finish Date'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'SUBJECT'
        Caption = 'Subject'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'REGARDING'
        Caption = 'Regarding'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'LOCATION'
        Caption = 'Location'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'CREATED'
        Caption = 'Created'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'USER_ID'
        Caption = 'Created By'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'CHANGED'
        Caption = 'Last Changed'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'CHANGEDBY'
        Caption = 'Last Changed By'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'LOCKEDDATETIME'
        Caption = 'Last Viewed'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'LOCKEDBY'
        Caption = 'Last Viewed By'
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'TYPE'
        Caption = 'Type'
        PickList.Items.Strings = (
          'Call'#9'1'
          'Task'#9'2'
          'Meeting'#9'3'
          'Note'#9'4'
          'Support'#9'5'
          'Event'#9'6')
        PickList.MapList = True
        PickList.Style = csSimple
        Items = <
          item
            DataSource = SrcActivity
            DataField = 'TYPE'
            Caption = 'Type (Numeric)'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'PRIORITY'
        Caption = 'Priority'
        PickList.Items.Strings = (
          'Low'#9'3'
          'Medium'#9'2'
          'High'#9'1')
        PickList.MapList = True
        PickList.Style = csSimple
        Items = <
          item
            DataSource = SrcActivity
            DataField = 'PRIORITY'
            Caption = 'Priority (Numeric)'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'PERSONAL'
        Caption = 'Personal?'
        PickList.Items.Strings = (
          'Yes'#9'Y'
          'No'#9'N')
        PickList.MapList = True
        PickList.Style = csSimple
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'ALLDAY'
        Caption = 'All-day?'
        PickList.Items.Strings = (
          'Yes'#9'Y'
          'No'#9'N')
        PickList.MapList = True
        PickList.Style = csSimple
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'ASSIGNEDTO'
        Caption = 'Assigned To'
        Items = <
          item
            DataSource = SrcActivity
            DataField = 'ASSIGNEDTO_DISPLAY'
            Caption = 'Assigned To Display Name'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PR_EMP_ID'
            Caption = 'Assigned To Employee ID'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'ASSIGNEDBY'
            Caption = 'Assigned By'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'ASSIGNEDBY_DISPLAY'
            Caption = 'Assigned By Display Name'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'ASSIGNEDDATE'
            Caption = 'Assigned Date'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'ARCHIVED'
        Caption = 'Closed?'
        Expanded = True
        PickList.Items.Strings = (
          'Yes'#9'Y'
          'No'#9'N')
        PickList.MapList = True
        PickList.Style = csSimple
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        Caption = 'Principal'
        EditText = '<Principal>'
        Items = <
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_FIRST_NAME'
            Caption = 'First Name'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_LAST_NAME'
            Caption = 'Last Name'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_TITLE'
            Caption = 'Title'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_CONTACT_PHONE'
            Caption = 'Contact Telephone'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_CONTACT_EXT'
            Caption = 'Contact Extension'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_CONTACT_FAX'
            Caption = 'Contact Fax'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_CONTACT_EMAIL'
            Caption = 'Contact Email'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_COMPANYNO'
            Caption = 'Company #'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_COMPANY'
            Caption = 'Company'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_ADDR1'
            Caption = 'Address 1'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_ADDR2'
            Caption = 'Address 2'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_ADDR3'
            Caption = 'Address 3'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_CITY'
            Caption = 'City'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_STATE'
            Caption = 'State or Region'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_ZIP'
            Caption = 'Postal Code'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_COUNTRY'
            Caption = 'Country'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_COMPANY_PHONE'
            Caption = 'Company Telephone'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_COMPANY_EXT'
            Caption = 'Company Extension'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_COMPANY_FAX'
            Caption = 'Company Fax'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_COMPANY_URL'
            Caption = 'Web Site'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_CRM_PROSPECT'
            Caption = 'CRM Prospect?'
            PickList.Items.Strings = (
              'Yes'#9'Y'
              'No'#9'N')
            PickList.MapList = True
            PickList.Style = csSimple
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PRINCIPLE_PK_HIDE'
            Caption = 'Inactive?'
            PickList.Items.Strings = (
              'Yes'#9'Y'
              'No'#9'N')
            PickList.MapList = True
            PickList.Style = csSimple
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'USE_USA_MASK'
            Caption = 'USA Mask?'
            PickList.Items.Strings = (
              'Yes'#9'Y'
              'No'#9'N')
            PickList.MapList = True
            PickList.Style = csSimple
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            Caption = 'Record Data'
            EditText = '<Record Data>'
            Items = <
              item
                DataSource = SrcActivity
                DataField = 'PRINCIPLE_SOURCE'
                Caption = 'Principal Source'
                WordWrap = False
              end
              item
                DataSource = SrcActivity
                DataField = 'PRINCIPLE_SOURCE_ID'
                Caption = 'Principal Source ID'
                WordWrap = False
              end
              item
                DataSource = SrcActivity
                DataField = 'PRINCIPLE_SOURCE_DISP'
                Caption = 'Default Display'
                WordWrap = False
              end
              item
                DataSource = SrcActivity
                DataField = 'CONTACT_ID'
                Caption = 'Contact Record ID'
                WordWrap = False
              end>
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'SETALARM'
        Caption = 'Send Notification?'
        PickList.Items.Strings = (
          'Yes'#9'Y'
          'No'#9'N')
        PickList.MapList = True
        PickList.Style = csSimple
        Items = <
          item
            DataSource = SrcActivity
            DataField = 'ALERT_DATETIME'
            Caption = 'Alert Date'
            Items = <
              item
                DataSource = SrcActivity
                DataField = 'LEADDISPLAYUNITS'
                Caption = 'Lead Display Units'
                WordWrap = False
              end
              item
                DataSource = SrcActivity
                DataField = 'LEADDURATION'
                Caption = 'Lead Duration'
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'SEND_MAIL'
            Caption = 'Send Mail'
            PickList.Items.Strings = (
              'Yes'#9'Y'
              'No'#9'N')
            PickList.MapList = True
            PickList.Style = csSimple
            Items = <
              item
                DataSource = SrcActivity
                DataField = 'EMAIL'
                Caption = 'Email'
                WordWrap = False
              end
              item
                DataSource = SrcActivity
                DataField = 'MAIL_SENT_DATE'
                Caption = 'Mail Sent Date'
                WordWrap = False
              end>
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'TOSCREEN'
            Caption = 'To Screen'
            PickList.Items.Strings = (
              'Yes'#9'Y'
              'No'#9'N')
            PickList.MapList = True
            PickList.Style = csSimple
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'HYPERLINK'
        Caption = 'Hyperlink'
        Items = <
          item
            DataSource = SrcActivity
            DataField = 'HYPERLINKADDRESS'
            Caption = 'Address'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'HYPERLINKSUBADDRESS'
            Caption = 'Sub-address'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        Caption = 'Lookup ID Values'
        EditText = '<Lookup ID Values>'
        Items = <
          item
            DataSource = SrcActivity
            DataField = 'EPLANT_ID'
            Caption = 'EPlant ID'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'PARENT_ID'
            Caption = 'Recurrence Parent ID'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'ACTIVITY_TYPE_ID'
            Caption = 'Activity Type ID'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'CAMPAIGN_ID'
            Caption = 'Campaign ID'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'CRM_WARRANTY_ID'
            Caption = 'Service Record ID'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'CRM_OPPORTUNITY_ID'
            Caption = 'Opportunity ID'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'CRM_QUOTE_ID'
            Caption = 'Sales Quotation ID'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcActivity
        DataField = 'LOCKED'
        Caption = 'Record Is Locked?'
        PickList.Items.Strings = (
          'Yes'#9'Y'
          'No'#9'N')
        PickList.MapList = True
        PickList.Style = csSimple
        Items = <
          item
            DataSource = SrcActivity
            DataField = 'LOCKEDBY'
            Caption = 'Locked By'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'LOCKEDDATETIME'
            Caption = 'Locked Date'
            WordWrap = False
          end
          item
            DataSource = SrcActivity
            DataField = 'LOCKISMANUAL'
            Caption = 'Is Manual?'
            PickList.Items.Strings = (
              'Yes'#9'Y'
              'No'#9'N')
            PickList.MapList = True
            PickList.Style = csSimple
            WordWrap = False
          end>
        WordWrap = False
      end>
    CaptionWidth = 140
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
    ReadOnly = True
  end
  object SrcActivity: TDataSource
    DataSet = QryActivity
    Left = 128
    Top = 64
  end
  object QryActivity: TFDQuery
    BeforeOpen = QryActivityBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'SELECT id, alert_datetime, startdate, finishdate, time_elapsed, ' +
        'pr_emp_id,'
      '       user_id, assignedto, assignedby, assigneddate, closedby,'
      
        '       closed_datetime, type, activity_type_id, queue_type_id, q' +
        'ueue_id,'
      
        '       regarding, setalarm, email, send_mail, mail_sent_date, le' +
        'adduration,'
      
        '       leaddisplayunits, toscreen, priority, contact_id, source_' +
        'display,'
      '       source_id, source, archived, hyperlink, hyperlinkaddress,'
      
        '       hyperlinksubaddress, eplant_id, principle_source, princip' +
        'le_source_id,'
      
        '       principle_source_disp, locked, lockedby, lockeddatetime, ' +
        'lockismanual,'
      
        '       principle_first_name, principle_last_name, principle_titl' +
        'e,'
      
        '       principle_contact_phone, principle_contact_fax, principle' +
        '_contact_ext,'
      
        '       principle_contact_email, principle_company, principle_add' +
        'r1,'
      
        '       principle_addr2, principle_addr3, principle_city, princip' +
        'le_state,'
      
        '       principle_zip, principle_company_phone, principle_company' +
        '_fax,'
      
        '       principle_company_ext, principle_crm_prospect, principle_' +
        'company_url,'
      '       principle_pk_hide, principle_country, use_usa_mask,'
      
        '       arcusto_credit_card_id, bill_to_id, ship_to_id, fob, frei' +
        'ght_id,'
      
        '       principle_companyno, personal, allday, time_as, location,' +
        ' subject,'
      
        '       campaign_id, crm_warranty_id, crm_opportunity_id, assigne' +
        'dto_flag,'
      
        '       order_dtl_id, parent_id, created, duser1, crm_quote_id, q' +
        'c_audit_id,'
      
        '       principle_contact_cell, cuser1, nuser1, html_summary, pub' +
        'lish, changed,'
      
        '       changedby, assignedto_display, cuser2, cuser3, cuser4, cu' +
        'ser5, cuser6,'
      
        '       nuser2, nuser3, nuser4, nuser5, nuser6, principle_middle_' +
        'name,'
      '       principle_nickname, assignedby_display'
      '  FROM crm_activity'
      ' WHERE id = :ID')
    Left = 136
    Top = 72
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryActivityID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CRM_ACTIVITY.ID'
      Size = 0
    end
    object QryActivityALERT_DATETIME: TDateTimeField
      FieldName = 'ALERT_DATETIME'
      Origin = 'IQ.CRM_ACTIVITY.ALERT_DATETIME'
    end
    object QryActivitySTARTDATE: TDateTimeField
      FieldName = 'STARTDATE'
      Origin = 'IQ.CRM_ACTIVITY.STARTDATE'
    end
    object QryActivityFINISHDATE: TDateTimeField
      FieldName = 'FINISHDATE'
      Origin = 'IQ.CRM_ACTIVITY.FINISHDATE'
    end
    object QryActivityTIME_ELAPSED: TFMTBCDField
      FieldName = 'TIME_ELAPSED'
      Origin = 'IQ.CRM_ACTIVITY.TIME_ELAPSED'
      Size = 6
    end
    object QryActivityPR_EMP_ID: TBCDField
      FieldName = 'PR_EMP_ID'
      Origin = 'IQ.CRM_ACTIVITY.PR_EMP_ID'
      Size = 0
    end
    object QryActivityUSER_ID: TStringField
      FieldName = 'USER_ID'
      Origin = 'IQ.CRM_ACTIVITY.USER_ID'
      Size = 35
    end
    object QryActivityASSIGNEDTO: TStringField
      FieldName = 'ASSIGNEDTO'
      Origin = 'IQ.CRM_ACTIVITY.ASSIGNEDTO'
      Size = 35
    end
    object QryActivityASSIGNEDBY: TStringField
      FieldName = 'ASSIGNEDBY'
      Origin = 'IQ.CRM_ACTIVITY.ASSIGNEDBY'
      Size = 35
    end
    object QryActivityASSIGNEDDATE: TDateTimeField
      FieldName = 'ASSIGNEDDATE'
      Origin = 'IQ.CRM_ACTIVITY.ASSIGNEDDATE'
    end
    object QryActivityCLOSEDBY: TStringField
      FieldName = 'CLOSEDBY'
      Origin = 'IQ.CRM_ACTIVITY.CLOSEDBY'
      Size = 35
    end
    object QryActivityCLOSED_DATETIME: TDateTimeField
      FieldName = 'CLOSED_DATETIME'
      Origin = 'IQ.CRM_ACTIVITY.CLOSED_DATETIME'
    end
    object QryActivityTYPE: TBCDField
      FieldName = 'TYPE'
      Origin = 'IQ.CRM_ACTIVITY.TYPE'
      Size = 0
    end
    object QryActivityACTIVITY_TYPE_ID: TBCDField
      FieldName = 'ACTIVITY_TYPE_ID'
      Origin = 'IQ.CRM_ACTIVITY.ACTIVITY_TYPE_ID'
      Size = 0
    end
    object QryActivityQUEUE_TYPE_ID: TBCDField
      FieldName = 'QUEUE_TYPE_ID'
      Origin = 'IQ.CRM_ACTIVITY.QUEUE_TYPE_ID'
      Size = 0
    end
    object QryActivityQUEUE_ID: TBCDField
      FieldName = 'QUEUE_ID'
      Origin = 'IQ.CRM_ACTIVITY.QUEUE_ID'
      Size = 0
    end
    object QryActivityREGARDING: TStringField
      FieldName = 'REGARDING'
      Origin = 'IQ.CRM_ACTIVITY.REGARDING'
      Size = 2000
    end
    object QryActivitySETALARM: TStringField
      FieldName = 'SETALARM'
      Origin = 'IQ.CRM_ACTIVITY.SETALARM'
      FixedChar = True
      Size = 1
    end
    object QryActivityEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'IQ.CRM_ACTIVITY.EMAIL'
      Size = 2000
    end
    object QryActivitySEND_MAIL: TStringField
      FieldName = 'SEND_MAIL'
      Origin = 'IQ.CRM_ACTIVITY.SEND_MAIL'
      FixedChar = True
      Size = 1
    end
    object QryActivityMAIL_SENT_DATE: TDateTimeField
      FieldName = 'MAIL_SENT_DATE'
      Origin = 'IQ.CRM_ACTIVITY.MAIL_SENT_DATE'
    end
    object QryActivityLEADDURATION: TBCDField
      FieldName = 'LEADDURATION'
      Origin = 'IQ.CRM_ACTIVITY.LEADDURATION'
      Size = 0
    end
    object QryActivityLEADDISPLAYUNITS: TBCDField
      FieldName = 'LEADDISPLAYUNITS'
      Origin = 'IQ.CRM_ACTIVITY.LEADDISPLAYUNITS'
      Size = 0
    end
    object QryActivityTOSCREEN: TStringField
      FieldName = 'TOSCREEN'
      Origin = 'IQ.CRM_ACTIVITY.TOSCREEN'
      FixedChar = True
      Size = 1
    end
    object QryActivityPRIORITY: TBCDField
      FieldName = 'PRIORITY'
      Origin = 'IQ.CRM_ACTIVITY.PRIORITY'
      Size = 0
    end
    object QryActivitySOURCE_DISPLAY: TStringField
      FieldName = 'SOURCE_DISPLAY'
      Origin = 'IQ.CRM_ACTIVITY.SOURCE_DISPLAY'
      Size = 250
    end
    object QryActivitySOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.CRM_ACTIVITY.SOURCE_ID'
      Size = 0
    end
    object QryActivitySOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'IQ.CRM_ACTIVITY.SOURCE'
      Size = 250
    end
    object QryActivityARCHIVED: TStringField
      FieldName = 'ARCHIVED'
      Origin = 'IQ.CRM_ACTIVITY.ARCHIVED'
      FixedChar = True
      Size = 1
    end
    object QryActivityHYPERLINK: TStringField
      FieldName = 'HYPERLINK'
      Origin = 'IQ.CRM_ACTIVITY.HYPERLINK'
      Size = 255
    end
    object QryActivityHYPERLINKADDRESS: TStringField
      FieldName = 'HYPERLINKADDRESS'
      Origin = 'IQ.CRM_ACTIVITY.HYPERLINKADDRESS'
      Size = 255
    end
    object QryActivityHYPERLINKSUBADDRESS: TStringField
      FieldName = 'HYPERLINKSUBADDRESS'
      Origin = 'IQ.CRM_ACTIVITY.HYPERLINKSUBADDRESS'
      Size = 255
    end
    object QryActivityEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.CRM_ACTIVITY.EPLANT_ID'
      Size = 0
    end
    object QryActivityPRINCIPLE_SOURCE: TStringField
      FieldName = 'PRINCIPLE_SOURCE'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_SOURCE'
      Size = 250
    end
    object QryActivityPRINCIPLE_SOURCE_ID: TBCDField
      FieldName = 'PRINCIPLE_SOURCE_ID'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_SOURCE_ID'
      Size = 0
    end
    object QryActivityPRINCIPLE_SOURCE_DISP: TStringField
      FieldName = 'PRINCIPLE_SOURCE_DISP'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_SOURCE_DISP'
      Size = 250
    end
    object QryActivityLOCKED: TStringField
      FieldName = 'LOCKED'
      Origin = 'IQ.CRM_ACTIVITY.LOCKED'
      FixedChar = True
      Size = 1
    end
    object QryActivityLOCKEDBY: TStringField
      FieldName = 'LOCKEDBY'
      Origin = 'IQ.CRM_ACTIVITY.LOCKEDBY'
      Size = 35
    end
    object QryActivityLOCKEDDATETIME: TDateTimeField
      FieldName = 'LOCKEDDATETIME'
      Origin = 'IQ.CRM_ACTIVITY.LOCKEDDATETIME'
    end
    object QryActivityLOCKISMANUAL: TStringField
      FieldName = 'LOCKISMANUAL'
      Origin = 'IQ.CRM_ACTIVITY.LOCKISMANUAL'
      FixedChar = True
      Size = 1
    end
    object QryActivityPRINCIPLE_FIRST_NAME: TStringField
      FieldName = 'PRINCIPLE_FIRST_NAME'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_FIRST_NAME'
      Size = 30
    end
    object QryActivityPRINCIPLE_LAST_NAME: TStringField
      FieldName = 'PRINCIPLE_LAST_NAME'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_LAST_NAME'
      Size = 30
    end
    object QryActivityPRINCIPLE_TITLE: TStringField
      FieldName = 'PRINCIPLE_TITLE'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_TITLE'
      Size = 60
    end
    object QryActivityPRINCIPLE_CONTACT_PHONE: TStringField
      FieldName = 'PRINCIPLE_CONTACT_PHONE'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_CONTACT_PHONE'
      Size = 25
    end
    object QryActivityPRINCIPLE_CONTACT_FAX: TStringField
      FieldName = 'PRINCIPLE_CONTACT_FAX'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_CONTACT_FAX'
      Size = 25
    end
    object QryActivityPRINCIPLE_CONTACT_EXT: TStringField
      FieldName = 'PRINCIPLE_CONTACT_EXT'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_CONTACT_EXT'
      Size = 25
    end
    object QryActivityPRINCIPLE_CONTACT_EMAIL: TStringField
      FieldName = 'PRINCIPLE_CONTACT_EMAIL'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_CONTACT_EMAIL'
      Size = 250
    end
    object QryActivityPRINCIPLE_COMPANY: TStringField
      FieldName = 'PRINCIPLE_COMPANY'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_COMPANY'
      Size = 60
    end
    object QryActivityPRINCIPLE_ADDR1: TStringField
      FieldName = 'PRINCIPLE_ADDR1'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_ADDR1'
      Size = 60
    end
    object QryActivityPRINCIPLE_ADDR2: TStringField
      FieldName = 'PRINCIPLE_ADDR2'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_ADDR2'
      Size = 60
    end
    object QryActivityPRINCIPLE_ADDR3: TStringField
      FieldName = 'PRINCIPLE_ADDR3'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_ADDR3'
      Size = 60
    end
    object QryActivityPRINCIPLE_CITY: TStringField
      FieldName = 'PRINCIPLE_CITY'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_CITY'
      Size = 30
    end
    object QryActivityPRINCIPLE_STATE: TStringField
      FieldName = 'PRINCIPLE_STATE'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_STATE'
    end
    object QryActivityPRINCIPLE_ZIP: TStringField
      FieldName = 'PRINCIPLE_ZIP'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_ZIP'
      FixedChar = True
      Size = 10
    end
    object QryActivityPRINCIPLE_COMPANY_PHONE: TStringField
      FieldName = 'PRINCIPLE_COMPANY_PHONE'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_COMPANY_PHONE'
      Size = 25
    end
    object QryActivityPRINCIPLE_COMPANY_FAX: TStringField
      FieldName = 'PRINCIPLE_COMPANY_FAX'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_COMPANY_FAX'
      Size = 25
    end
    object QryActivityPRINCIPLE_COMPANY_EXT: TStringField
      FieldName = 'PRINCIPLE_COMPANY_EXT'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_COMPANY_EXT'
      FixedChar = True
      Size = 5
    end
    object QryActivityPRINCIPLE_CRM_PROSPECT: TStringField
      FieldName = 'PRINCIPLE_CRM_PROSPECT'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_CRM_PROSPECT'
      FixedChar = True
      Size = 1
    end
    object QryActivityPRINCIPLE_PK_HIDE: TStringField
      FieldName = 'PRINCIPLE_PK_HIDE'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object QryActivityPRINCIPLE_COMPANY_URL: TStringField
      FieldName = 'PRINCIPLE_COMPANY_URL'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_COMPANY_URL'
      Size = 255
    end
    object QryActivityPRINCIPLE_COUNTRY: TStringField
      FieldName = 'PRINCIPLE_COUNTRY'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_COUNTRY'
      Size = 100
    end
    object QryActivityUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      Origin = 'IQ.CRM_ACTIVITY.USE_USA_MASK'
      FixedChar = True
      Size = 1
    end
    object QryActivityARCUSTO_CREDIT_CARD_ID: TBCDField
      FieldName = 'ARCUSTO_CREDIT_CARD_ID'
      Origin = 'IQ.CRM_ACTIVITY.ARCUSTO_CREDIT_CARD_ID'
      Size = 0
    end
    object QryActivitySHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Origin = 'IQ.CRM_ACTIVITY.SHIP_TO_ID'
      Size = 0
    end
    object QryActivityBILL_TO_ID: TBCDField
      FieldName = 'BILL_TO_ID'
      Origin = 'IQ.CRM_ACTIVITY.BILL_TO_ID'
      Size = 0
    end
    object QryActivityFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Origin = 'IQ.CRM_ACTIVITY.FREIGHT_ID'
      Size = 0
    end
    object QryActivityFOB: TStringField
      FieldName = 'FOB'
      Origin = 'IQ.CRM_ACTIVITY.FOB'
      Size = 60
    end
    object QryActivityPRINCIPLE_COMPANYNO: TStringField
      FieldName = 'PRINCIPLE_COMPANYNO'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_COMPANYNO'
      Size = 25
    end
    object QryActivityPERSONAL: TStringField
      FieldName = 'PERSONAL'
      Origin = 'IQ.CRM_ACTIVITY.PERSONAL'
      FixedChar = True
      Size = 1
    end
    object QryActivityALLDAY: TStringField
      FieldName = 'ALLDAY'
      Origin = 'IQ.CRM_ACTIVITY.ALLDAY'
      FixedChar = True
      Size = 1
    end
    object QryActivityTIME_AS: TBCDField
      FieldName = 'TIME_AS'
      Origin = 'IQ.CRM_ACTIVITY.TIME_AS'
      Size = 0
    end
    object QryActivityLOCATION: TStringField
      FieldName = 'LOCATION'
      Origin = 'IQ.CRM_ACTIVITY.LOCATION'
      Size = 60
    end
    object QryActivitySUBJECT: TStringField
      FieldName = 'SUBJECT'
      Origin = 'IQ.CRM_ACTIVITY.SUBJECT'
      Size = 250
    end
    object QryActivityCAMPAIGN_ID: TBCDField
      FieldName = 'CAMPAIGN_ID'
      Origin = 'IQ.CRM_ACTIVITY.CAMPAIGN_ID'
      Size = 0
    end
    object QryActivityCRM_WARRANTY_ID: TBCDField
      FieldName = 'CRM_WARRANTY_ID'
      Origin = 'IQ.CRM_ACTIVITY.CRM_WARRANTY_ID'
      Size = 0
    end
    object QryActivityCRM_OPPORTUNITY_ID: TBCDField
      FieldName = 'CRM_OPPORTUNITY_ID'
      Origin = 'IQ.CRM_ACTIVITY.CRM_OPPORTUNITY_ID'
      Size = 0
    end
    object QryActivityASSIGNEDTO_FLAG: TBCDField
      FieldName = 'ASSIGNEDTO_FLAG'
      Origin = 'IQ.CRM_ACTIVITY.ASSIGNEDTO_FLAG'
      Size = 0
    end
    object QryActivityORDER_DTL_ID: TBCDField
      FieldName = 'ORDER_DTL_ID'
      Origin = 'IQ.CRM_ACTIVITY.ORDER_DTL_ID'
      Size = 0
    end
    object QryActivityPARENT_ID: TBCDField
      FieldName = 'PARENT_ID'
      Origin = 'IQ.CRM_ACTIVITY.PARENT_ID'
      Size = 0
    end
    object QryActivityCONTACT_ID: TBCDField
      FieldName = 'CONTACT_ID'
      Origin = 'IQ.CRM_ACTIVITY.CONTACT_ID'
      Size = 0
    end
    object QryActivityCREATED: TDateTimeField
      FieldName = 'CREATED'
      Origin = 'IQ.CRM_ACTIVITY.CREATED'
    end
    object QryActivityCRM_QUOTE_ID: TBCDField
      FieldName = 'CRM_QUOTE_ID'
      Origin = 'IQ.CRM_ACTIVITY.CRM_QUOTE_ID'
      Size = 0
    end
    object QryActivityDUSER1: TDateTimeField
      FieldName = 'DUSER1'
      Origin = 'IQ.CRM_ACTIVITY.DUSER1'
    end
    object QryActivityQC_AUDIT_ID: TBCDField
      FieldName = 'QC_AUDIT_ID'
      Origin = 'IQ.CRM_ACTIVITY.QC_AUDIT_ID'
      Size = 0
    end
    object QryActivityPRINCIPLE_CONTACT_CELL: TStringField
      FieldName = 'PRINCIPLE_CONTACT_CELL'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_CONTACT_CELL'
      Size = 25
    end
    object QryActivityCUSER1: TStringField
      FieldName = 'CUSER1'
      Origin = 'IQ.CRM_ACTIVITY.CUSER1'
      Size = 60
    end
    object QryActivityNUSER1: TFMTBCDField
      FieldName = 'NUSER1'
      Origin = 'IQ.CRM_ACTIVITY.NUSER1'
      Size = 6
    end
    object QryActivityHTML_SUMMARY: TMemoField
      FieldName = 'HTML_SUMMARY'
      Origin = 'IQ.CRM_ACTIVITY.HTML_SUMMARY'
      BlobType = ftMemo
    end
    object QryActivityPUBLISH: TStringField
      FieldName = 'PUBLISH'
      Origin = 'IQ.CRM_ACTIVITY.PUBLISH'
      Size = 1
    end
    object QryActivityCHANGED: TDateTimeField
      FieldName = 'CHANGED'
      Origin = 'IQ.CRM_ACTIVITY.CHANGED'
    end
    object QryActivityCHANGEDBY: TStringField
      FieldName = 'CHANGEDBY'
      Origin = 'IQ.CRM_ACTIVITY.CHANGEDBY'
      Size = 30
    end
    object QryActivityASSIGNEDTO_DISPLAY: TStringField
      FieldName = 'ASSIGNEDTO_DISPLAY'
      Origin = 'IQ.CRM_ACTIVITY.ASSIGNEDTO_DISPLAY'
      Size = 255
    end
    object QryActivityCUSER2: TStringField
      FieldName = 'CUSER2'
      Origin = 'IQ.CRM_ACTIVITY.CUSER2'
      Size = 60
    end
    object QryActivityCUSER3: TStringField
      FieldName = 'CUSER3'
      Origin = 'IQ.CRM_ACTIVITY.CUSER3'
      Size = 60
    end
    object QryActivityCUSER4: TStringField
      FieldName = 'CUSER4'
      Origin = 'IQ.CRM_ACTIVITY.CUSER4'
      Size = 60
    end
    object QryActivityCUSER5: TStringField
      FieldName = 'CUSER5'
      Origin = 'IQ.CRM_ACTIVITY.CUSER5'
      Size = 60
    end
    object QryActivityCUSER6: TStringField
      FieldName = 'CUSER6'
      Origin = 'IQ.CRM_ACTIVITY.CUSER6'
      Size = 60
    end
    object QryActivityNUSER2: TFMTBCDField
      FieldName = 'NUSER2'
      Origin = 'IQ.CRM_ACTIVITY.NUSER2'
      Size = 6
    end
    object QryActivityNUSER3: TFMTBCDField
      FieldName = 'NUSER3'
      Origin = 'IQ.CRM_ACTIVITY.NUSER3'
      Size = 6
    end
    object QryActivityNUSER4: TFMTBCDField
      FieldName = 'NUSER4'
      Origin = 'IQ.CRM_ACTIVITY.NUSER4'
      Size = 6
    end
    object QryActivityNUSER5: TFMTBCDField
      FieldName = 'NUSER5'
      Origin = 'IQ.CRM_ACTIVITY.NUSER5'
      Size = 6
    end
    object QryActivityNUSER6: TFMTBCDField
      FieldName = 'NUSER6'
      Origin = 'IQ.CRM_ACTIVITY.NUSER6'
      Size = 6
    end
    object QryActivityPRINCIPLE_MIDDLE_NAME: TStringField
      FieldName = 'PRINCIPLE_MIDDLE_NAME'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_MIDDLE_NAME'
      Size = 30
    end
    object QryActivityPRINCIPLE_NICKNAME: TStringField
      FieldName = 'PRINCIPLE_NICKNAME'
      Origin = 'IQ.CRM_ACTIVITY.PRINCIPLE_NICKNAME'
      Size = 30
    end
    object QryActivityASSIGNEDBY_DISPLAY: TStringField
      FieldName = 'ASSIGNEDBY_DISPLAY'
      Origin = 'IQ.CRM_ACTIVITY.ASSIGNEDBY_DISPLAY'
      Size = 255
    end
  end
  object PMain: TUniPopupMenu
    Left = 176
    Top = 64
    object Refresh1: TUniMenuItem
      Caption = 'Refresh'
      ShortCut = 116
      OnClick = Refresh1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object ExpandAll1: TUniMenuItem
      Caption = 'Expand All'
      OnClick = ExpandAll1Click
    end
    object CollapseAll1: TUniMenuItem
      Caption = 'Collapse All'
      OnClick = CollapseAll1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object CopytoClipboard1: TUniMenuItem
      Caption = 'Copy Properties to Clipboard'
      OnClick = CopytoClipboard1Click
    end
  end
end

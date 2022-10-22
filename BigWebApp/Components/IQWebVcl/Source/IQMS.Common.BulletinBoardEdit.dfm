object BulletinBoardEdit: TBulletinBoardEdit
  Left = 0
  Top = 0
  HelpContext = 25516
  ClientHeight = 485
  ClientWidth = 718
  Caption = 'Bulletin Board Editor'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 718
    Height = 30
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object NavMain: TUniDBNavigator
      Left = 493
      Top = 1
      Width = 225
      Height = 28
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = srcBulletinBoardEdit
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 30
    Width = 718
    Height = 455
    Hint = ''
    DataSource = srcBulletinBoardEdit
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Columns = <
      item
        FieldName = 'Src'
        Title.Caption = 'Source'
        Width = 171
        CheckBoxField.FieldValues = 'true;false'
        GroupHeader = 'Related To'
      end
      item
        FieldName = 'TAG_NAME'
        Title.Caption = 'Name'
        Width = 375
        Editor = CmDlgTag
        CheckBoxField.FieldValues = 'true;false'
        GroupHeader = 'Related To'
      end
      item
        FieldName = 'MESSAGE_DATE'
        Title.Caption = 'Date'
        Width = 135
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MESSAGE'
        Title.Caption = 'Message'
        Width = 604
        Editor = cmbDlgMessage
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USER_NAME'
        Title.Caption = 'User'
        Width = 214
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object UniHiddenPanel1: TUniHiddenPanel
    Left = 368
    Top = 80
    Width = 209
    Height = 137
    Hint = ''
    Visible = True
    object wwDBLookupComboSource: TUniDBLookupComboBox
      Left = 41
      Top = 28
      Width = 121
      Height = 21
      Hint = ''
      ListSource = srcBulletinBoardEdit
      ListFieldIndex = 0
      TabOrder = 1
      Color = clWindow
      AutoEdit = False
    end
    object CmDlgTag: TUniDBLookupComboBox
      Left = 40
      Top = 55
      Width = 121
      Hint = ''
      ListFieldIndex = 0
      DataField = 'TAG_NAME'
      DataSource = srcBulletinBoardEdit
      TabOrder = 2
      Color = clWindow
      OnDropDown = cmbDlgTagCustomDlg
    end
    object cmbDlgMessage: TUniDBLookupComboBox
      Left = 40
      Top = 83
      Width = 121
      Hint = ''
      ListFieldIndex = 0
      DataField = 'MESSAGE'
      DataSource = srcBulletinBoardEdit
      TabOrder = 3
      Color = clWindow
      OnDropDown = cmbDlgMessageCustomDlg
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 208
    Top = 120
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object srcBulletinBoardEdit: TDataSource
    DataSet = qryBulletinBoardEdit
    Left = 208
    Top = 176
  end
  object qryBulletinBoardEdit: TFDQuery
    BeforePost = qryBulletinBoardEditBeforePost
    AfterPost = qryBulletinBoardEditAfterPost
    OnNewRecord = qryBulletinBoardEditNewRecord
    IndexFieldNames = 'ID'
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.RefreshMode = rmManual
    UpdateOptions.CheckRequired = False
    UpdateOptions.CheckReadOnly = False
    UpdateOptions.CheckUpdatable = False
    UpdateOptions.UpdateTableName = 'BULLETIN_CONV'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = updtBulletinBoardEdit
    SQL.Strings = (
      'SELECT'
      '  C.ID,'
      '  C.USER_NAME,'
      '  C.MESSAGE,'
      '  C.MESSAGE_DATE,'
      '  A.SOURCE,'
      '  A.SOURCE_ID,'
      '  rt_misc.GetTagName(a.source, a.source_id) as TAG_NAME'
      'FROM'
      '  BULLETIN_CONV_TAG B,'
      '  BULLETIN_TAG A,'
      '  BULLETIN_CONV C'
      'WHERE'
      '  A.ID   = B.BULLETIN_TAG_ID'
      'AND C.ID = B.BULLETIN_CONV_ID'
      'order by C.MESSAGE_DATE DESC')
    Left = 80
    Top = 120
    object qryBulletinBoardEditMESSAGE_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 18
      FieldName = 'MESSAGE_DATE'
      Origin = 'MESSAGE_DATE'
      ReadOnly = True
    end
    object qryBulletinBoardEditMESSAGE: TStringField
      DisplayLabel = 'Message'
      DisplayWidth = 100
      FieldName = 'MESSAGE'
      Origin = 'MESSAGE'
      Size = 2000
    end
    object qryBulletinBoardEditUSER_NAME: TStringField
      DisplayLabel = 'User'
      DisplayWidth = 35
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      ReadOnly = True
      Size = 35
    end
    object qryBulletinBoardEditSOURCE: TStringField
      DisplayWidth = 30
      FieldName = 'SOURCE'
      LookupKeyFields = 'SOURCE'
      LookupResultField = 'DISPLAY_NAME'
      Origin = 'IQ.BULLETIN_TAG.DISPLAY_NAME'
      Required = True
      OnChange = qryBulletinBoardEditSOURCEChange
      Size = 30
    end
    object qryBulletinBoardEditSOURCE_ID: TBCDField
      DisplayWidth = 16
      FieldName = 'SOURCE_ID'
      Origin = 'SOURCE_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object qryBulletinBoardEditID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object qryBulletinBoardEditTAG_NAME: TStringField
      DisplayWidth = 4000
      FieldName = 'TAG_NAME'
      Origin = 'TAG_NAME'
      Size = 4000
    end
    object qryBulletinBoardEditSrc: TStringField
      FieldKind = fkLookup
      FieldName = 'Src'
      LookupDataSet = qrySources
      LookupKeyFields = 'SOURCE'
      LookupResultField = 'DISPLAY_NAME'
      KeyFields = 'SOURCE'
      Size = 35
      Lookup = True
    end
  end
  object updtBulletinBoardEdit: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'begin '
      '  RT_MISC.update_bulletin'
      '  (:NEW_ID,'
      '   :NEW_MESSAGE,'
      '   :NEW_USER_NAME,'
      '   :NEW_SOURCE,'
      '   :NEW_SOURCE_ID );'
      'end;')
    ModifySQL.Strings = (
      'begin '
      '  RT_MISC.update_bulletin'
      '  (:OLD_ID,'
      '   :NEW_MESSAGE,'
      '   :NEW_USER_NAME,'
      '   :NEW_SOURCE,'
      '   :NEW_SOURCE_ID );'
      'end;')
    DeleteSQL.Strings = (
      'DELETE FROM BULLETIN_CONV'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT'
      '  C.ID,'
      '  C.USER_NAME,'
      '  C.MESSAGE,'
      '  C.MESSAGE_DATE'
      '  A.SOURCE,'
      '  A.SOURCE_ID'
      'FROM'
      '  BULLETIN_CONV_TAG B,'
      '  BULLETIN_TAG A,'
      '  BULLETIN_CONV C'
      'WHERE'
      '  A.ID   = B.BULLETIN_TAG_ID'
      'AND C.ID = B.BULLETIN_CONV_ID'
      'AND C.ID = :ID'
      '')
    Left = 80
    Top = 80
  end
  object PKEplant: TFDQuery
    SQL.Strings = (
      'SELECT'
      '  ECODE,'
      '  COMPANY_NAME,'
      '  ID,'
      '  PLANT_NAME'
      'FROM'
      '  V_EPLANT_USER')
    Left = 80
    Top = 192
    object PKEplantCOMPANY_NAME: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY_NAME'
      Origin = 'COMPANY_NAME'
      Size = 60
    end
    object PKEplantECODE: TStringField
      FieldName = 'ECODE'
      Origin = 'ECODE'
      Visible = False
      Size = 10
    end
    object PKEplantID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object PKEplantPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      FieldName = 'PLANT_NAME'
      Origin = 'PLANT_NAME'
      Required = True
      Size = 30
    end
  end
  object qrySources: TFDQuery
    SQL.Strings = (
      'select display_name, source from v_bulletin_source')
    Left = 80
    Top = 160
    object qrySourcesDISPLAY_NAME: TStringField
      FieldName = 'DISPLAY_NAME'
      Origin = 'DISPLAY_NAME'
      Size = 14
    end
    object qrySourcesSOURCE: TStringField
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Size = 11
    end
  end
  object PkMfg: TFDQuery
    Filtered = True
    SQL.Strings = (
      'select STANDARD.MFGNO          as MfgNo,'
      '       standard.descrip        as standard_descrip,'
      '       STANDARD.MFG_TYPE       as Mfg_TYPE,'
      '       ARINVT.ITEMNO           as ITEMNO,'
      '       ARINVT.REV              as REV,'
      '       ARINVT.DESCRIP          as DESCRIP,'
      '       ARINVT.DESCRIP2         as DESCRIP2,'
      '       ARCUSTO.COMPANY         as COMPANY,'
      '       STANDARD.ID             as ID,'
      '       standard.eplant_id      as eplant_id,'
      '       standard.route_seq      as route_seq,'
      '       standard.effect_date    as effect_date,'
      '       standard.deactive_date  as deactive_date,'
      '       standard.pk_hide        as pk_hide,'
      '       standard.cuser1         as cuser1,'
      '       standard.cuser2         as cuser2,'
      '       standard.cuser3         as cuser3,'
      '       standard.cuser4         as cuser4,'
      '       standard.cuser5         as cuser5,'
      '       standard.cuser6         as cuser6'
      '       '
      '  from IQMS.STANDARD, IQMS.PARTNO, IQMS.ARINVT, IQMS.ARCUSTO'
      ' where IQMS.STANDARD.ID = IQMS.PARTNO.STANDARD_ID(+)'
      '   and IQMS.PARTNO.ARINVT_ID = IQMS.ARINVT.ID(+)'
      '   and IQMS.ARCUSTO.ID(+) = IQMS.STANDARD.ARCUSTO_ID '
      ' '
      '-- HPICK_EMPTY_DATASET_FILTER_START'
      '-- and 1 < 0'
      '-- HPICK_EMPTY_DATASET_FILTER_END'
      ' ')
    Left = 80
    Top = 240
    object PkMfgMFGNO: TStringField
      DisplayLabel = 'MFG #'
      FieldName = 'MFGNO'
      Origin = 'MFGNO'
      Required = True
      Size = 50
    end
    object PkMfgITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkMfgREV: TStringField
      DisplayLabel = 'Revision'
      FieldName = 'REV'
      Origin = 'REV'
      FixedChar = True
      Size = 15
    end
    object PkMfgDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object PkMfgCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 60
    end
    object PkMfgID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object PkMfgMFG_TYPE: TStringField
      DisplayLabel = 'MFG Type'
      FieldName = 'MFG_TYPE'
      Origin = 'MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object PkMfgDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Size = 100
    end
    object PkMfgEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object PkMfgEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      FieldName = 'EFFECT_DATE'
      Origin = 'EFFECT_DATE'
    end
    object PkMfgDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      FieldName = 'DEACTIVE_DATE'
      Origin = 'DEACTIVE_DATE'
    end
    object PkMfgROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Origin = 'ROUTE_SEQ'
      Precision = 4
      Size = 0
    end
    object PkMfgSTANDARD_DESCRIP: TStringField
      DisplayLabel = 'Mfg Description'
      FieldName = 'STANDARD_DESCRIP'
      Origin = 'STANDARD_DESCRIP'
      Visible = False
      Size = 50
    end
    object PkMfgPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object PkMfgCUSER1: TStringField
      DisplayLabel = 'CUser1'
      FieldName = 'CUSER1'
      Origin = 'CUSER1'
      Size = 60
    end
    object PkMfgCUSER2: TStringField
      DisplayLabel = 'CUser2'
      FieldName = 'CUSER2'
      Origin = 'CUSER2'
      Size = 60
    end
    object PkMfgCUSER3: TStringField
      DisplayLabel = 'CUser3'
      FieldName = 'CUSER3'
      Origin = 'CUSER3'
      Size = 60
    end
    object PkMfgCUSER4: TStringField
      DisplayLabel = 'CUser4'
      FieldName = 'CUSER4'
      Origin = 'CUSER4'
      Size = 60
    end
    object PkMfgCUSER5: TStringField
      DisplayLabel = 'CUser5'
      FieldName = 'CUSER5'
      Origin = 'CUSER5'
      Size = 60
    end
    object PkMfgCUSER6: TStringField
      DisplayLabel = 'CUser6'
      FieldName = 'CUSER6'
      Origin = 'CUSER6'
      Size = 60
    end
  end
  object PkArinvt: TFDQuery
    SQL.Strings = (
      'select a.itemno    as itemno,'
      '       a.descrip   as descrip,'
      '       a.descrip2  as descrip2,'
      '       a.rev       as rev,'
      '       a.class     as class,'
      '       a.onhand    as onhand,'
      '       a.ID        as ID,'
      '       a.eplant_id as eplant_id,'
      '       c.company   as customer_name,'
      '       a.pk_hide   as pk_hide,'
      '       a.non_material as non_material,'
      '       a.NON_CONFORM_TOTAL as NON_CONFORM_TOTAL,'
      '       a.NON_ALLOCATE_TOTAL as NON_ALLOCATE_TOTAL,'
      '       a.unit as unit,'
      '       a.config_code as config_code,'
      '       p.code as prod_code,'
      
        '       round(inv_misc.GetNonCommited( a.id ), 2) as non_committe' +
        'd'
      '  from arinvt a,'
      '       v_arcusto c,'
      '       prod_code p'
      ' where a.arcusto_id = c.id(+)'
      '   and a.prod_code_id = p.id(+)')
    Left = 80
    Top = 288
    object PkArinvtITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'ITEMNO'
      Required = True
      FixedChar = True
      Size = 50
    end
    object PkArinvtDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Required = True
      Size = 100
    end
    object PkArinvtDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Origin = 'DESCRIP2'
      Size = 100
    end
    object PkArinvtREV: TStringField
      FieldName = 'REV'
      Origin = 'REV'
      Required = True
      FixedChar = True
      Size = 15
    end
    object PkArinvtCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'CLASS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object PkArinvtONHAND: TBCDField
      FieldName = 'ONHAND'
      Origin = 'ONHAND'
      Precision = 14
    end
    object PkArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object PkArinvtEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object PkArinvtCUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Origin = 'CUSTOMER_NAME'
      Size = 60
    end
    object PkArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object PkArinvtNON_MATERIAL: TStringField
      FieldName = 'NON_MATERIAL'
      Origin = 'NON_MATERIAL'
      FixedChar = True
      Size = 1
    end
    object PkArinvtNON_CONFORM_TOTAL: TBCDField
      FieldName = 'NON_CONFORM_TOTAL'
      Origin = 'NON_CONFORM_TOTAL'
      Precision = 14
    end
    object PkArinvtNON_ALLOCATE_TOTAL: TBCDField
      FieldName = 'NON_ALLOCATE_TOTAL'
      Origin = 'NON_ALLOCATE_TOTAL'
      Precision = 14
    end
    object PkArinvtUNIT: TStringField
      FieldName = 'UNIT'
      Origin = 'UNIT'
      Required = True
      Size = 10
    end
    object PkArinvtCONFIG_CODE: TStringField
      FieldName = 'CONFIG_CODE'
      Origin = 'CONFIG_CODE'
      Size = 255
    end
    object PkArinvtPROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Origin = 'PROD_CODE'
      Size = 25
    end
    object PkArinvtNON_COMMITTED: TFMTBCDField
      FieldName = 'NON_COMMITTED'
      Origin = 'NON_COMMITTED'
      Precision = 38
      Size = 38
    end
  end
  object PkMfgCell: TFDQuery
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'SELECT'
      '  id,'
      '  mfgcell,'
      '  descrip,'
      '  mfgtype,'
      '  division_id,'
      '  eplant_id'
      'FROM'
      '  mfgcell')
    Left = 80
    Top = 336
  end
  object PkArcusto: TFDQuery
    SQL.Strings = (
      'select custno as custno,'
      '       company as company,'
      '       addr1 as addr1,'
      '       addr2 as addr2,'
      '       addr3 as addr3,'
      '       city as city,'
      '       state as state,'
      '       country as country,'
      '       zip as zip,'
      '       phone_number as phone_number,'
      '       prime_contact as prime_contact,'
      '       id as id,'
      '       eplant_id as eplant_id,'
      
        '       decode(NVL(pk_hide, '#39'N'#39'), '#39'N'#39', '#39'Active'#39', '#39'InActive'#39') as a' +
        'ctive_type'
      '  from IQMS.v_arcusto'
      ' ')
    Left = 80
    Top = 384
    object PkArcustoCUSTNO: TStringField
      FieldName = 'CUSTNO'
      Origin = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'COMPANY'
      Size = 60
    end
    object PkArcustoADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'ADDR1'
      Size = 60
    end
    object PkArcustoADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'ADDR2'
      Size = 60
    end
    object PkArcustoADDR3: TStringField
      FieldName = 'ADDR3'
      Origin = 'ADDR3'
      Size = 60
    end
    object PkArcustoCITY: TStringField
      FieldName = 'CITY'
      Origin = 'CITY'
      FixedChar = True
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
    end
    object PkArcustoCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'COUNTRY'
      FixedChar = True
      Size = 100
    end
    object PkArcustoZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object PkArcustoPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Origin = 'PHONE_NUMBER'
      Size = 25
    end
    object PkArcustoPRIME_CONTACT: TStringField
      FieldName = 'PRIME_CONTACT'
      Origin = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object PkArcustoID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Precision = 15
      Size = 0
    end
    object PkArcustoEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object PkArcustoACTIVE_TYPE: TStringField
      FieldName = 'ACTIVE_TYPE'
      Origin = 'ACTIVE_TYPE'
      Size = 8
    end
  end
  object PkWorkCntr: TFDQuery
    SQL.Strings = (
      'select w.eqno as eqno,'
      '       w.cntr_desc as cntr_desc,'
      '       w.cntr_type as cntr_type,'
      '       w.ID as id,'
      '       w.eplant_id as eplant_id,'
      '       e.name as eplant_name,'
      '       m.mfgcell as mfgcell,'
      '       d.name as division_name,'
      '       w.pk_hide as pk_hide,'
      '       w.mfg_type  as mfg_type'
      ' from work_center w,'
      '      mfgcell m,'
      '      division d,'
      '      eplant e'
      'where w.mfgcell_id = m.id(+)'
      '  and m.division_id = d.id(+)'
      '  and e.id(+) = w.eplant_id'
      
        '  and ( parent_id is null or mfg.work_center_belong_to_complex(w' +
        '.id) = 1)'
      
        '  and mfg.lookup_mfgtype( w.mfg_type ) not in ('#39'ASSY2'#39', '#39'ASSY3'#39',' +
        ' '#39'COMPLEX'#39')'
      '  ')
    Left = 152
    Top = 384
    object PkWorkCntrEQNO: TStringField
      DisplayLabel = 'Work Center #'
      FieldName = 'EQNO'
      Origin = 'EQNO'
      Required = True
      Size = 60
    end
    object PkWorkCntrCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      FieldName = 'CNTR_DESC'
      Origin = 'CNTR_DESC'
      Size = 250
    end
    object PkWorkCntrCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'CNTR_TYPE'
      Origin = 'CNTR_TYPE'
      Required = True
    end
    object PkWorkCntrEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      FieldName = 'EPLANT_NAME'
      Origin = 'e.name'
      Size = 30
    end
    object PkWorkCntrEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object PkWorkCntrID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object PkWorkCntrMFGCELL: TStringField
      DisplayLabel = 'Manufacturing Cell'
      FieldName = 'MFGCELL'
      Origin = 'm.mfgcell'
      FixedChar = True
      Size = 15
    end
    object PkWorkCntrPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'PK_HIDE'
      Visible = False
      Size = 1
    end
    object PkWorkCntrDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object PkWorkCntrMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      Origin = 'MFG_TYPE'
      Visible = False
      Size = 10
    end
  end
end

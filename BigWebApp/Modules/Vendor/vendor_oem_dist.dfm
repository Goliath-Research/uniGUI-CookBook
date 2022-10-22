object FrmVendorOEMDistributor: TFrmVendorOEMDistributor
  Left = 367
  Top = 298
  ClientHeight = 244
  ClientWidth = 537
  Caption = 'Distributors'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
  end
  object Grid: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 537
    Height = 217
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 320
    IQComponents.Grid.Height = 131
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcVendorOEMDist
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcVendorOEMDist
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.Navigator.BeforeAction = CheckRefresh
    IQComponents.HiddenPanel.Left = 320
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 131
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcVendorOEMDist
    Columns = <
      item
        FieldName = 'VENDORNO'
        Title.Caption = 'Vendor #'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Vendor'
        Width = 210
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CITY'
        Title.Caption = 'City'
        Width = 210
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STATE'
        Title.Caption = 'State or Region'
        Width = 140
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ZIP'
        Title.Caption = 'Zip/Postal Code'
        Width = 70
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR1'
        Title.Caption = 'Address 1'
        Width = 140
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR2'
        Title.Caption = 'Address 2'
        Width = 140
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR3'
        Title.Caption = 'Address 3'
        Width = 140
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSER1'
        Title.Caption = 'User Text'
        Width = 210
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QA_RATING'
        Title.Caption = 'Q.A. Rating'
        Width = 70
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'VEN_RATING'
        Title.Caption = 'Vendor Rating'
        Width = 70
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STATUS_ID'
        Title.Caption = 'Status'
        Width = 140
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FED_TAX_ID'
        Title.Caption = 'Tax ID'
        Width = 140
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'IS_OEM'
        Title.Caption = 'OEM'
        Width = 7
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 33
    Marker = 0
  end
  object wwDBComboDlgVendorNo: TUniEdit
    Left = 16
    Top = 96
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object SrcVendorOEMDist: TDataSource
    DataSet = QryVendorOEMDist
    Left = 200
    Top = 80
  end
  object QryVendorOEMDist: TFDQuery
    BeforeOpen = QryVendorOEMDistBeforeOpen
    BeforePost = QryVendorOEMDistBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnNewRecord = QryVendorOEMDistNewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLVendorOEMDist
    SQL.Strings = (
      'select o.id,'
      '       o.oem_vendor_id,'
      '       o.dist_vendor_id,'
      '       v.vendorno,'
      '       v.company,'
      '       v.city,'
      '       v.state,'
      '       v.zip,'
      '       v.addr1,'
      '       v.addr2,'
      '       v.addr3,'
      '       v.cuser1,'
      '       v.qa_rating,'
      '       v.ven_rating,'
      '       v.status_id,'
      '       v.fed_tax_id,'
      '       v.is_OEM'
      '  from vendor_oem_dist o,'
      '       vendor v'
      ' where o.oem_vendor_id = :vendor_id'
      '   and o.dist_vendor_id = v.id'
      ' order by v.vendorno'
      ''
      '')
    Left = 216
    Top = 136
    ParamData = <
      item
        Name = 'vendor_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryVendorOEMDistVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Size = 10
    end
    object QryVendorOEMDistCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      ReadOnly = True
      Size = 60
    end
    object QryVendorOEMDistCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 30
      FieldName = 'CITY'
      ReadOnly = True
      Size = 30
    end
    object QryVendorOEMDistSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 20
      FieldName = 'STATE'
      ReadOnly = True
    end
    object QryVendorOEMDistZIP: TStringField
      DisplayLabel = 'Zip/Postal Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      ReadOnly = True
      Size = 10
    end
    object QryVendorOEMDistADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'VENDOR.ADDR1'
      ReadOnly = True
      Size = 60
    end
    object QryVendorOEMDistADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'VENDOR.ADDR2'
      ReadOnly = True
      Size = 60
    end
    object QryVendorOEMDistADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Origin = 'IQ.VENDOR.ADDR3'
      ReadOnly = True
      FixedChar = True
      Size = 60
    end
    object QryVendorOEMDistCUSER1: TStringField
      DisplayLabel = 'User Text'
      DisplayWidth = 30
      FieldName = 'CUSER1'
      Origin = 'IQ.VENDOR.CUSER1'
      ReadOnly = True
      Size = 60
    end
    object QryVendorOEMDistQA_RATING: TStringField
      DisplayLabel = 'Q.A. Rating'
      DisplayWidth = 10
      FieldName = 'QA_RATING'
      Origin = 'IQ.V_VENDOR.QA_RATING'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object QryVendorOEMDistVEN_RATING: TStringField
      DisplayLabel = 'Vendor Rating'
      DisplayWidth = 10
      FieldName = 'VEN_RATING'
      Origin = 'IQ.V_VENDOR.VEN_RATING'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object QryVendorOEMDistSTATUS_ID: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'STATUS_ID'
      Origin = 'IQ.V_VENDOR.STATUS_ID'
      ReadOnly = True
      FixedChar = True
    end
    object QryVendorOEMDistFED_TAX_ID: TStringField
      DisplayLabel = 'Tax ID'
      DisplayWidth = 20
      FieldName = 'FED_TAX_ID'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object QryVendorOEMDistIS_OEM: TStringField
      DisplayLabel = 'OEM'
      DisplayWidth = 1
      FieldName = 'IS_OEM'
      Origin = 'IQ.VENDOR.IS_OEM'
      ReadOnly = True
      Size = 1
    end
    object QryVendorOEMDistID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.VENDOR_OEM_DIST.ID'
      Visible = False
      Size = 0
    end
    object QryVendorOEMDistOEM_VENDOR_ID: TBCDField
      FieldName = 'OEM_VENDOR_ID'
      Origin = 'IQ.VENDOR_OEM_DIST.OEM_VENDOR_ID'
      Visible = False
      Size = 0
    end
    object QryVendorOEMDistDIST_VENDOR_ID: TBCDField
      DisplayLabel = 'Vendor #'
      FieldName = 'DIST_VENDOR_ID'
      Origin = 'IQ.VENDOR_OEM_DIST.DIST_VENDOR_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryVendorOEMDist')
    SecurityCode = 'FRMVENDOROEMDISTRIBUTOR'
    AfterApply = SRAfterApply
    Left = 160
    Top = 80
  end
  object PkVendor: TIQWebHpick
    BeforeOpen = PkVendorBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select v.id as id,'
      '       v.vendorno as vendorno,'
      '       v.company as company,'
      '       v.city as city,'
      '       v.state as state,'
      '       v.zip as zip,'
      '       v.addr1 as addr1,'
      '       v.addr2 as addr2,'
      '       v.addr3 as addr3,'
      '       v.cuser1 as cuser1,'
      '       v.qa_rating as qa_rating,'
      '       v.ven_rating as ven_rating,'
      '       v.status_id as status_id,'
      '       v.fed_tax_id as fed_tax_id,'
      '       v.is_oem as is_oem'
      '  from v_vendor v'
      ' where v.id <> :vendor_id '
      '           '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 280
    Top = 112
    ParamData = <
      item
        Name = 'vendor_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      FieldName = 'VENDORNO'
      Origin = 'v.vendorno'
      Size = 10
    end
    object PkVendorCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Origin = 'v.COMPANY'
      Size = 60
    end
    object PkVendorCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Origin = 'v.city'
      Size = 30
    end
    object PkVendorSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = 'v.state'
    end
    object PkVendorZIP: TStringField
      DisplayLabel = 'Zip/Postal Code'
      FieldName = 'ZIP'
      Origin = 'v.zip'
      Size = 10
    end
    object PkVendorID: TBCDField
      FieldName = 'ID'
      Origin = 'v.id'
      Visible = False
      Size = 0
    end
    object PkVendorADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'v.ADDR1'
      Size = 60
    end
    object PkVendorADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'v.ADDR2'
      Size = 60
    end
    object PkVendorADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Origin = 'v.ADDR3'
      FixedChar = True
      Size = 60
    end
    object PkVendorCUSER1: TStringField
      DisplayLabel = 'User Text'
      DisplayWidth = 30
      FieldName = 'CUSER1'
      Origin = 'v.CUSER1'
      Size = 60
    end
    object PkVendorQA_RATING: TStringField
      DisplayLabel = 'Q.A. Rating'
      FieldName = 'QA_RATING'
      Origin = 'v.QA_RATING'
      FixedChar = True
      Size = 10
    end
    object PkVendorVEN_RATING: TStringField
      DisplayLabel = 'Vendor Rating'
      FieldName = 'VEN_RATING'
      Origin = 'v.VEN_RATING'
      FixedChar = True
      Size = 10
    end
    object PkVendorSTATUS_ID: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS_ID'
      Origin = 'v.STATUS_ID'
      FixedChar = True
    end
    object PkVendorFED_TAX_ID: TStringField
      DisplayLabel = 'Tax ID'
      FieldName = 'FED_TAX_ID'
      Origin = 'v.FED_TAX_ID'
      FixedChar = True
      Size = 30
    end
    object PkVendorIS_OEM: TStringField
      DisplayLabel = 'OEM'
      FieldName = 'IS_OEM'
      Origin = 'v.IS_OEM'
      Size = 1
    end
  end
  object UpdateSQLVendorOEMDist: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into vendor_oem_dist'
      '  (ID, OEM_VENDOR_ID, DIST_VENDOR_ID)'
      'values'
      '  (:ID, :OEM_VENDOR_ID, :DIST_VENDOR_ID)')
    ModifySQL.Strings = (
      'update vendor_oem_dist'
      'set'
      '  ID = :ID,'
      '  OEM_VENDOR_ID = :OEM_VENDOR_ID,'
      '  DIST_VENDOR_ID = :DIST_VENDOR_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from vendor_oem_dist'
      'where'
      '  ID = :OLD_ID')
    Left = 96
    Top = 136
  end
end

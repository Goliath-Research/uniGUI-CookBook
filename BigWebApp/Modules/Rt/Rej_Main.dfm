object FrmRejectsCode: TFrmRejectsCode
  Left = 87
  Top = 147
  HelpContext = 1096892
  ClientHeight = 428
  ClientWidth = 740
  Caption = 'Reject Codes'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object IQUserDefLabelCUser1: TIQWebUserDefLabel
      Left = 160
      Top = 8
      Width = 56
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'User Text 1'
      TabOrder = 2
      ParentAppName = 'IQWIN32.EXE'
    end
    object IQUserDefLabelCUser2: TIQWebUserDefLabel
      Left = 288
      Top = 8
      Width = 56
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'User Text 2'
      TabOrder = 3
      ParentAppName = 'IQWIN32.EXE'
    end
    object DBNavigator1: TUniDBNavigator
      Left = 515
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcRejectCodes
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 27
    Width = 740
    Height = 401
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Panel2'
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 738
      Height = 399
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 521
      IQComponents.Grid.Height = 313
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcRejectCodes
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
      IQComponents.Navigator.DataSource = SrcRejectCodes
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 521
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 313
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcRejectCodes
      Columns = <
        item
          FieldName = 'REJECT_CODE'
          Title.Caption = 'Code'
          Width = 77
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ATTRIBUTE'
          Title.Caption = 'Description'
          Width = 196
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MfgCell'
          Title.Caption = 'Mfg Cell'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PK_HIDE'
          Title.Caption = 'Inactive'
          Width = 56
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'CUSER1'
          Title.Caption = 'CUser1'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER2'
          Title.Caption = 'CUser2'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'GlAcct'
          Title.Caption = 'GL Acct'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NonConformLocDesc'
          Title.Caption = 'Non Conform Location'
          Width = 210
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object wwDBLookupComboMfgCell: TUniDBLookupComboBox
      Left = 88
      Top = 142
      Width = 121
      Height = 21
      Hint = ''
      Visible = False
      ListFieldIndex = 0
      TabOrder = 1
      Color = clWindow
      OnKeyDown = wwDBLookupComboMfgCellKeyDown
    end
    object wwDBComboDlgEPlant: TUniEdit
      Left = 88
      Top = 182
      Width = 121
      Height = 21
      Hint = ''
      Visible = False
      Text = ''
      TabOrder = 2
    end
    object IQUDComboBoxCUser1: TIQWebUDComboBox
      Left = 88
      Top = 220
      Width = 121
      Height = 21
      Hint = 'Right click to edit the list'
      Visible = False
      ShowHint = True
      ParentShowHint = False
      TabOrder = 3
      KeyTableName = 'REJECT_CODE'
      KeyFieldName = 'CUSER1'
    end
    object IQUDComboBoxCUser2: TIQWebUDComboBox
      Left = 88
      Top = 260
      Width = 121
      Height = 21
      Hint = 'Right click to edit the list'
      Visible = False
      ShowHint = True
      ParentShowHint = False
      TabOrder = 4
      KeyTableName = 'REJECT_CODE'
      KeyFieldName = 'CUSER2'
    end
    object wwDBComboDlgGlacct: TUniEdit
      Left = 88
      Top = 294
      Width = 121
      Height = 21
      Hint = ''
      Visible = False
      Text = ''
      TabOrder = 5
    end
    object wwDBComboDlgNonConformLoc: TUniEdit
      Left = 88
      Top = 336
      Width = 121
      Height = 21
      Hint = ''
      Visible = False
      Text = ''
      TabOrder = 6
      OnKeyDown = wwDBComboDlgNonConformLocKeyDown
    end
  end
  object TblRejectCodes: TFDTable
    BeforeOpen = TblRejectCodesBeforeOpen
    BeforePost = TblRejectCodesBeforePost
    OnCalcFields = TblRejectCodesCalcFields
    Filtered = True
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'REJECT_CODE'
    TableName = 'REJECT_CODE'
    Left = 157
    Top = 138
    object TblRejectCodesREJECT_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 11
      FieldName = 'REJECT_CODE'
      Size = 5
    end
    object TblRejectCodesATTRIBUTE: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 28
      FieldName = 'ATTRIBUTE'
      Size = 100
    end
    object TblRejectCodesEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 12
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object TblRejectCodesMfgCell: TStringField
      DisplayLabel = 'Mfg Cell '
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'MfgCell'
      LookupDataSet = QryMfgcell
      LookupKeyFields = 'ID'
      LookupResultField = 'MFGCELL'
      KeyFields = 'MFGCELL_ID'
      Size = 15
      Lookup = True
    end
    object TblRejectCodesPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      DisplayWidth = 8
      FieldName = 'PK_HIDE'
      Size = 1
    end
    object TblRejectCodesCUSER1: TStringField
      DisplayLabel = 'User Text 1'
      DisplayWidth = 25
      FieldName = 'CUSER1'
      Size = 60
    end
    object TblRejectCodesCUSER2: TStringField
      DisplayLabel = 'User Text 2'
      DisplayWidth = 30
      FieldName = 'CUSER2'
      Size = 60
    end
    object TblRejectCodesGlAcct: TStringField
      DisplayLabel = 'GL Acct'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'GlAcct'
      Size = 30
      Calculated = True
    end
    object TblRejectCodesNonConformLocDesc: TStringField
      DisplayLabel = 'Non Conform Location'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'NonConformLocDesc'
      Size = 30
      Calculated = True
    end
    object TblRejectCodesACCT_ID_REJECT: TBCDField
      DisplayWidth = 10
      FieldName = 'ACCT_ID_REJECT'
      Visible = False
      Size = 0
    end
    object TblRejectCodesMFGCELL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MFGCELL_ID'
      Visible = False
      Size = 0
    end
    object TblRejectCodesID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object TblRejectCodesNON_CONFORM_LOCATIONS_ID: TBCDField
      FieldName = 'NON_CONFORM_LOCATIONS_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcRejectCodes: TDataSource
    DataSet = TblRejectCodes
    Left = 45
    Top = 125
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmRejectsCode')
    SecurityItems.Strings = (
      'TblRejectCodesEPLANT_ID'
      'IQUDComboBoxCUser1'
      'IQUDComboBoxCUser2')
    SecurityCode = 'FRMREJECTSCODE'
    Left = 207
    Top = 138
  end
  object QryMfgcell: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       mfgcell,'
      '       descrip,'
      '       mfgtype,'
      '       eplant_id'
      '  from mfgcell'
      ' where misc.eplant_filter( eplant_id ) = 1'
      'order by mfgcell')
    Left = 409
    Top = 162
    object QryMfgcellMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Origin = 'IQ.MFGCELL.MFGCELL'
      FixedChar = True
      Size = 15
    end
    object QryMfgcellDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'IQ.MFGCELL.DESCRIP'
      FixedChar = True
      Size = 25
    end
    object QryMfgcellMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFGTYPE'
      Origin = 'IQ.MFGCELL.MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object QryMfgcellEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.MFGCELL.EPLANT_ID'
      Size = 0
    end
    object QryMfgcellID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.MFGCELL.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object PkAcct: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          acct,'
      '          descrip,'
      '          type'
      '  from V_GLACCT_GLSUB_ACCT_TYPE'
      ' where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 265
    Top = 132
    object PkAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkAcctACCT: TStringField
      DisplayLabel = 'Account #'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkAcctTYPE: TStringField
      DisplayLabel = 'Account Type'
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 35
    end
  end
  object PMClearGlAcct: TUniPopupMenu
    Left = 344
    Top = 128
    object ClearGlAcct1: TUniMenuItem
      Caption = 'Clear GL Acct'
      OnClick = ClearGlAcct1Click
    end
  end
  object PkLocation: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select l.id as id,'
      '       l.loc_desc as location,'
      '       l.descrip as description,'
      '       l.eplant_id,'
      '       d.name as division'
      '  from locations l,'
      '       division d'
      ' where '
      '       l.division_id = d.id(+)'
      '   and misc.eplant_filter(l.eplant_id) = 1'
      '   and nvl(l.non_conform, '#39'N'#39') = '#39'Y'#39
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 472
    Top = 135
    object PkLocationID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkLocationLOCATION: TStringField
      DisplayLabel = 'Location'
      DisplayWidth = 25
      FieldName = 'LOCATION'
      FixedChar = True
      Size = 30
    end
    object PkLocationDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object PkLocationEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant _ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkLocationDIVISION: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 20
      FieldName = 'DIVISION'
      Size = 25
    end
  end
  object SrcQryMfgcell: TDataSource
    DataSet = QryMfgcell
    Left = 413
    Top = 213
  end
end

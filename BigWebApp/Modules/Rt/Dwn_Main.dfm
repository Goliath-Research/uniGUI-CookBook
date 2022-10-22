object FrmDownCodes: TFrmDownCodes
  Left = 175
  Top = 134
  HelpContext = 1096961
  ClientHeight = 382
  ClientWidth = 511
  Caption = 'Down Codes'
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
    Width = 511
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object IQUserDefLabelCUser1: TIQWebUserDefLabel
      Left = 88
      Top = 8
      Width = 35
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'CUser1'
      TabOrder = 1
      ParentAppName = 'IQWIN32.EXE'
    end
    object IQUserDefLabelCUser2: TIQWebUserDefLabel
      Left = 136
      Top = 8
      Width = 35
      Height = 13
      Hint = ''
      Visible = False
      Caption = 'CUser2'
      TabOrder = 2
      ParentAppName = 'IQWIN32.EXE'
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 27
    Width = 511
    Height = 355
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 509
      Height = 353
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 292
      IQComponents.Grid.Height = 267
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcDownCodes
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
      IQComponents.Navigator.DataSource = SrcDownCodes
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 292
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 267
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcDownCodes
      Columns = <
        item
          FieldName = 'DOWN_CODE'
          Title.Caption = 'Code'
          Width = 91
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DOWN_DESCRIP'
          Title.Caption = 'Description'
          Width = 140
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_ID'
          Title.Caption = 'EPlant ID'
          Width = 70
          Editor = wwDBGrid1.wwDBComboDlgEPlant
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'IS_CHARGEABLE'
          Title.Caption = 'Is Chargeable'
          Width = 70
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'IS_PLANNED'
          Title.Caption = 'Planned ~Down'
          Width = 56
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'IS_SETUP'
          Title.Caption = 'Setup'
          Width = 7
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'PK_HIDE'
          Title.Caption = 'Inactive'
          Width = 49
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'CUSER1'
          Title.Caption = 'CUSER1'
          Width = 175
          Editor = wwDBGrid1.IQUDComboBoxCUser1
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CUSER2'
          Title.Caption = 'CUSER2'
          Width = 182
          Editor = wwDBGrid1.IQUDComboBoxCUser2
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      IQControlCount = 3
      IQParents = (
        'wwDBComboDlgEPlant=GridEditorsPanel'
        'IQUDComboBoxCUser1=GridEditorsPanel'
        'IQUDComboBoxCUser2=GridEditorsPanel')
      Marker = 0
      object IQUDComboBoxCUser2: TUniDBLookupComboBox
        Left = 8
        Top = 56
        Width = 145
        Hint = ''
        ListField = 'CUSER2'
        ListSource = SrcDownCodes
        ListFieldIndex = 0
        TabOrder = 3
        Color = clWindow
      end
      object IQUDComboBoxCUser1: TUniDBLookupComboBox
        Left = 8
        Top = 32
        Width = 145
        Hint = ''
        ListField = 'CUSER1'
        ListSource = SrcDownCodes
        ListFieldIndex = 0
        TabOrder = 2
        Color = clWindow
      end
      object wwDBComboDlgEPlant: TUniComboBox
        Left = 8
        Top = 8
        Width = 145
        Hint = ''
        Text = 'wwDBComboDlgEPlant'
        TabOrder = 1
        OnDropDown = wwDBComboDlgEPlantCustomDlg
      end
    end
  end
  object SrcDownCodes: TDataSource
    DataSet = TblDownCodes
    Left = 24
    Top = 140
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmDownCodes')
    SecurityItems.Strings = (
      'TblDownCodesEPLANT_ID'
      'IQUDComboBoxCUser1'
      'IQUDComboBoxCUser2')
    SecurityCode = 'FRMDOWNCODES'
    Left = 66
    Top = 144
  end
  object FDUpdateSQLDownCode: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO DOWN_CODE'
      '(DOWN_CODE, DOWN_DESCRIP, EPLANT_ID, IS_CHARGEABLE, '
      '  PK_HIDE, CUSER1, CUSER2, IS_PLANNED, '
      '  IS_SETUP)'
      
        'VALUES (:NEW_DOWN_CODE, :NEW_DOWN_DESCRIP, :NEW_EPLANT_ID, :NEW_' +
        'IS_CHARGEABLE, '
      '  :NEW_PK_HIDE, :NEW_CUSER1, :NEW_CUSER2, :NEW_IS_PLANNED, '
      '  :NEW_IS_SETUP)')
    ModifySQL.Strings = (
      'UPDATE DOWN_CODE'
      
        'SET DOWN_CODE = :NEW_DOWN_CODE, DOWN_DESCRIP = :NEW_DOWN_DESCRIP' +
        ', '
      
        '  EPLANT_ID = :NEW_EPLANT_ID, IS_CHARGEABLE = :NEW_IS_CHARGEABLE' +
        ', '
      
        '  PK_HIDE = :NEW_PK_HIDE, CUSER1 = :NEW_CUSER1, CUSER2 = :NEW_CU' +
        'SER2, '
      '  IS_PLANNED = :NEW_IS_PLANNED, IS_SETUP = :NEW_IS_SETUP'
      'WHERE rtrim(DOWN_CODE) = rtrim(:OLD_DOWN_CODE)')
    DeleteSQL.Strings = (
      'DELETE FROM DOWN_CODE'
      'WHERE rtrim(DOWN_CODE) = rtrim(:OLD_DOWN_CODE)')
    FetchRowSQL.Strings = (
      
        'SELECT DOWN_CODE, DOWN_DESCRIP, EPLANT_ID, IS_CHARGEABLE, PK_HID' +
        'E, '
      '  CUSER1, CUSER2, IS_PLANNED, IS_SETUP'
      'FROM DOWN_CODE'
      'WHERE rtrim(DOWN_CODE) = rtrim(:DOWN_CODE)')
    Left = 24
    Top = 203
  end
  object TblDownCodes: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateObject = FDUpdateSQLDownCode
    SQL.Strings = (
      'select down_code,'
      '       down_descrip,'
      '       eplant_id,'
      '       is_chargeable,'
      '       is_planned,'
      '       is_setup,'
      '       pk_hide,'
      '       cuser1,'
      '       cuser2'
      '  from down_code       '
      'order by down_code'
      '')
    Left = 24
    Top = 171
    object TblDownCodesDOWN_CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 13
      FieldName = 'DOWN_CODE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object TblDownCodesDOWN_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DOWN_DESCRIP'
    end
    object TblDownCodesEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object TblDownCodesIS_CHARGEABLE: TStringField
      DisplayLabel = 'Is Chargeable'
      DisplayWidth = 10
      FieldName = 'IS_CHARGEABLE'
      FixedChar = True
      Size = 1
    end
    object TblDownCodesIS_PLANNED: TStringField
      DisplayLabel = 'Planned ~Down'
      DisplayWidth = 8
      FieldName = 'IS_PLANNED'
      Size = 1
    end
    object TblDownCodesIS_SETUP: TStringField
      DisplayLabel = 'Setup'
      DisplayWidth = 1
      FieldName = 'IS_SETUP'
      Size = 1
    end
    object TblDownCodesPK_HIDE: TStringField
      DisplayLabel = 'Inactive'
      DisplayWidth = 7
      FieldName = 'PK_HIDE'
      Size = 1
    end
    object TblDownCodesCUSER1: TStringField
      DisplayWidth = 25
      FieldName = 'CUSER1'
      Size = 60
    end
    object TblDownCodesCUSER2: TStringField
      DisplayWidth = 26
      FieldName = 'CUSER2'
      Size = 60
    end
  end
end

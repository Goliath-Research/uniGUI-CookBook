object FrmAuxiliaryEquipment: TFrmAuxiliaryEquipment
  Left = 355
  Top = 285
  ClientHeight = 355
  ClientWidth = 487
  Caption = 'Auxiliary Equipment'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 355
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 485
      Height = 353
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = 'pnlIQSearchAux'
      object srchAux: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 483
        Height = 351
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 266
        IQComponents.Grid.Height = 265
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcAux
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
        IQComponents.Navigator.DataSource = SrcAux
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 266
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 265
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcAux
        Columns = <
          item
            FieldName = 'AUX_DESC'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'AUX_RATE'
            Title.Caption = 'Rate'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'HOW_MANY'
            Title.Caption = 'How Many'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EPLANT_ID'
            Title.Caption = 'EPlant ID'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DivisionName'
            Title.Caption = 'Division Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
        object wwDBLookupComboDivision: TUniDBLookupComboBox
          Left = 123
          Top = 21
          Width = 121
          Height = 21
          Hint = ''
          Visible = False
          ListField = 'NAME'
          ListSource = SrcQryDivisionLookup
          KeyField = 'ID'
          ListFieldIndex = 0
          TabOrder = 2
          Color = clWindow
        end
      end
    end
  end
  object SrcAux: TDataSource
    DataSet = wwQryAux
    Left = 34
    Top = 128
  end
  object wwQryAux: TFDQuery
    BeforePost = wwQryAuxBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateObject = UpdateSQLAux
    SQL.Strings = (
      'select aux.id,'
      '       aux.aux_desc,'
      '       aux.aux_rate,'
      '       aux.how_many,'
      '       aux.eplant_id,'
      '       aux.division_id,'
      '       div.name as division_name'
      '  from aux,'
      '       division div'
      ' where aux.division_id = div.id(+)'
      '   and misc.eplant_filter( aux.eplant_id ) = 1'
      '  '
      ' '
      ' '
      ' '
      ' ')
    Left = 35
    Top = 179
    object wwQryAuxAUX_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'AUX_DESC'
      Origin = 'AUX.AUX_DESC'
      FixedChar = True
      Size = 50
    end
    object wwQryAuxAUX_RATE: TBCDField
      DisplayLabel = 'Rate'
      DisplayWidth = 10
      FieldName = 'AUX_RATE'
      Origin = 'AUX.AUX_RATE'
      Size = 2
    end
    object wwQryAuxHOW_MANY: TBCDField
      DisplayLabel = 'How Many'
      DisplayWidth = 10
      FieldName = 'HOW_MANY'
      Origin = 'AUX.HOW_MANY'
      Size = 0
    end
    object wwQryAuxEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 8
      FieldName = 'EPLANT_ID'
      Origin = 'AUX.EPLANT_ID'
      Size = 0
    end
    object wwQryAuxDivisionName: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'DivisionName'
      LookupDataSet = QryDivisionLookup
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'DIVISION_ID'
      Origin = 'div.name'
      Size = 25
      Lookup = True
    end
    object wwQryAuxEPLant_ID_Disp: TFloatField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'EPLant_ID_Disp'
      Origin = 'aux.eplant_id'
      Visible = False
      Calculated = True
    end
    object wwQryAuxDIVISION_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'DIVISION_ID'
      Origin = 'IQ.AUX.DIVISION_ID'
      Visible = False
      Size = 0
    end
    object wwQryAuxID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'AUX.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object wwQryAuxDIVISION_NAME: TStringField
      DisplayWidth = 25
      FieldName = 'DIVISION_NAME'
      Origin = 'div.name'
      Visible = False
      Size = 25
    end
  end
  object UpdateSQLAux: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into aux'
      '  (ID, AUX_DESC, AUX_RATE, HOW_MANY, EPLANT_ID, DIVISION_ID)'
      'values'
      
        '  (:ID, :AUX_DESC, :AUX_RATE, :HOW_MANY, :EPLANT_ID, :DIVISION_I' +
        'D)')
    ModifySQL.Strings = (
      'update aux'
      'set'
      '  ID = :ID,'
      '  AUX_DESC = :AUX_DESC,'
      '  AUX_RATE = :AUX_RATE,'
      '  HOW_MANY = :HOW_MANY,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  DIVISION_ID = :DIVISION_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from aux'
      'where'
      '  ID = :OLD_ID')
    Left = 35
    Top = 206
  end
  object QryDivisionLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, name, descrip from division'
      'order by name')
    Left = 132
    Top = 182
    object QryDivisionLookupNAME: TStringField
      DisplayLabel = 'Division Name'
      DisplayWidth = 25
      FieldName = 'NAME'
      Origin = 'IQ.DIVISION.NAME'
      Size = 25
    end
    object QryDivisionLookupDESCRIP: TStringField
      DisplayLabel = 'Division Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.DIVISION.DESCRIP'
      Size = 50
    end
    object QryDivisionLookupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.DIVISION.ID'
      Visible = False
      Size = 0
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 211
    Top = 153
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmAuxiliaryEquipment'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 241
    Top = 153
  end
  object SrcQryDivisionLookup: TDataSource
    DataSet = QryDivisionLookup
    Left = 128
    Top = 112
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'wwQryAux')
    SecurityCode = 'FRMAUXILIARYEQUIPMENT'
    Left = 282
    Top = 153
  end
end

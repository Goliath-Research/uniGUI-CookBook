object FrmAssignReworkNonConformLoc: TFrmAssignReworkNonConformLoc
  Left = 446
  Top = 168
  ClientHeight = 285
  ClientWidth = 521
  Caption = 'Rework Order Non Conforming Locations'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel9: TUniPanel
    Left = 0
    Top = 0
    Width = 521
    Height = 285
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 366
    ExplicitHeight = 170
    object GridRework: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 519
      Height = 283
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 302
      IQComponents.Grid.Height = 197
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcRework
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
      IQComponents.Navigator.DataSource = SrcRework
      IQComponents.Navigator.VisibleButtons = [nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.Navigator.BeforeAction = CheckRefresh
      IQComponents.HiddenPanel.Left = 302
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 197
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitLeft = 147
      IQComponents.HiddenPanel.ExplicitHeight = 54
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitWidth = 356
      IQComponents.FormTab.ExplicitHeight = 83
      DataSource = SrcRework
      Columns = <
        item
          FieldName = 'Loc_Desc'
          Title.Caption = 'Non Conforming Location'
          Width = 182
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LotNo'
          Title.Caption = 'Lot #'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OnHand'
          Title.Caption = 'On Hand'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitTop = 29
      ExplicitWidth = 364
      ExplicitHeight = 140
      Marker = 0
    end
    object wwDBComboDlgReworkNonConformingLoc: TUniEdit
      Left = 14
      Top = 63
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
      ReadOnly = True
    end
  end
  object SrcRework: TDataSource
    DataSet = QryRework
    Left = 147
    Top = 91
  end
  object QryRework: TFDQuery
    BeforeOpen = QryReworkBeforeOpen
    BeforePost = QryReworkBeforePost
    AfterPost = ApplyUpdateToTable
    AfterDelete = ApplyUpdateToTable
    OnCalcFields = QryReworkCalcFields
    OnNewRecord = QryReworkNewRecord
    CachedUpdates = True
    ConnectionName = 'IQFD'
    UpdateObject = UpdateSQLRework
    SQL.Strings = (
      'select id, '
      '       ptorder_id,'
      '       fgmulti_id'
      '  from rework_ptorder_fgmulti'
      ' where ptorder_id = :ptorder_id')
    Left = 99
    Top = 145
    ParamData = <
      item
        Name = 'ptorder_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryReworkLoc_Desc: TStringField
      DisplayLabel = 'Non Conforming Location'
      DisplayWidth = 26
      FieldKind = fkCalculated
      FieldName = 'Loc_Desc'
      Size = 30
      Calculated = True
    end
    object QryReworkLotNo: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 18
      FieldKind = fkCalculated
      FieldName = 'LotNo'
      ReadOnly = True
      Size = 25
      Calculated = True
    end
    object QryReworkOnHand: TFloatField
      DisplayLabel = 'On Hand'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'OnHand'
      ReadOnly = True
      Calculated = True
    end
    object QryReworkID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.WF_REWORK_USE.ID'
      Visible = False
      Size = 0
    end
    object QryReworkFGMULTI_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FGMULTI_ID'
      Origin = 'IQ.WF_REWORK_USE.FGMULTI_ID'
      Visible = False
      Size = 0
    end
    object QryReworkPTORDER_ID: TBCDField
      FieldName = 'PTORDER_ID'
      Origin = 'IQ.REWORK_PTORDER_FGMULTI.PTORDER_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLRework: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into rework_ptorder_fgmulti'
      '  (ID, PTORDER_ID, FGMULTI_ID)'
      'values'
      '  (:ID, :PTORDER_ID, :FGMULTI_ID)')
    ModifySQL.Strings = (
      'update rework_ptorder_fgmulti'
      'set'
      '  ID = :ID,'
      '  PTORDER_ID = :PTORDER_ID,'
      '  FGMULTI_ID = :FGMULTI_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from rework_ptorder_fgmulti'
      'where'
      '  ID = :OLD_ID')
    Left = 203
    Top = 170
  end
  object PkFgMultiNonConform: TIQWebHpick
    BeforeOpen = PkFgMultiNonConformBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select f.id as fgmulti_id,'
      '       loc.loc_desc as loc_desc,'
      '       f.lotno as lotno,'
      '       f.onhand as onhand,'
      '       f.rg_onhand as rg_onhand,'
      '       nc.descrip as non_conform,'
      '       f.eplant_id as eplant_id,'
      '       f.division_id as division_id,'
      '       f.in_date as in_date'
      '  from fgmulti f, '
      '       locations loc,'
      '       non_conform nc'
      ' where f.loc_id = loc.id'
      '   and arinvt_id = :arinvt_id'
      '   and f.non_conform_id = nc.id'
      '   and NVL(loc.vmi, '#39'N'#39') = '#39'N'#39
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 277
    Top = 114
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object FloatField2: TBCDField
      FieldName = 'FGMULTI_ID'
      Visible = False
      Size = 0
    end
    object StringField2: TStringField
      DisplayLabel = 'Location'
      FieldName = 'LOC_DESC'
      Size = 30
    end
    object StringField3: TStringField
      DisplayLabel = 'Lot#'
      FieldName = 'LOTNO'
      Size = 25
    end
    object FloatField3: TBCDField
      DisplayLabel = 'OnHand'
      FieldName = 'ONHAND'
    end
    object FloatField8: TBCDField
      DisplayLabel = 'RG OnHand'
      FieldName = 'RG_ONHAND'
    end
    object StringField4: TStringField
      DisplayLabel = 'Non Conform'
      FieldName = 'NON_CONFORM'
      Size = 30
    end
    object FloatField9: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object FloatField10: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = 'In Date'
      FieldName = 'IN_DATE'
    end
  end
end

object FrmReleasesActivity: TFrmReleasesActivity
  Left = 448
  Top = 186
  HelpContext = 1081299
  ClientHeight = 273
  ClientWidth = 374
  Caption = 'Releases Activity'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 374
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnFilter: TUniSpeedButton
      Left = 2
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Filter'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF5A5857404040202820000800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF58585840
        4040252525050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF606060706870404040000800FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6060606A
        6A6A404040050505FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF605860909090606060302830FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5B5B5B90
        90906060602A2A2AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF505850B0A8B0808080404840FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF555555AB
        ABAB808080464646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFE0C9B9605850C0C0C0A0A0A0404040CEB3A0FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8C8C8575757C0
        C0C0A0A0A0404040B2B2B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFE0CABA505850A0A0A0D0D0D0B0B0B0707070201820CCAE9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C9C9555555A0A0A0D0
        D0D0B0B0B07070701A1A1AADADADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFE1CCBC706870C0B8C0E0E8E0E0E0E0C0C0C0909890605860201820CBAB
        96FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCB6A6A6ABBBBBBE6E6E6E0
        E0E0C0C0C09696965B5B5B1A1A1AA9A9A9FF00FFFF00FFFF00FFFF00FFFF00FF
        E1CDBE707070C0C0C0F0E8F0FFF8FFF0F0F0D0D8D0C0C0C0A098A06058601018
        10C9A791FF00FFFF00FFFF00FFFF00FFCCCCCC707070C0C0C0EBEBEBFAFAFAF0
        F0F0D6D6D6C0C0C09B9B9B5B5B5B161616A5A5A5FF00FFFF00FFFF00FFE1CDC0
        808080D0D0D0F0F0F0FFFFFFFFFFFFFFF8FFE0E8E0D0D8D0C0B8C09090905050
        50201820C8A38CFF00FFFF00FFCCCCCC808080D0D0D0F0F0F0FFFFFFFFFFFFFA
        FAFAE6E6E6D6D6D6BBBBBB9090905050501A1A1AA2A2A2FF00FFFF00FF808080
        D0D0D0F0F0F0FFF8FFFFF8FFF0F8F0F0F0F0E0E8E0D0D0D0C0C0C0A098A06068
        60505850101810FF00FFFF00FF808080D0D0D0F0F0F0FAFAFAFAFAFAF6F6F6F0
        F0F0E6E6E6D0D0D0C0C0C09B9B9B656565555555161616FF00FFFF00FFB0B8B0
        C0C8C0D0D0D0D0D0D0C0C0C0C0B8C0B0B0B0A0A8A0A0A0A0A098A09090907078
        70606060504850FF00FFFF00FFB6B6B6C6C6C6D0D0D0D0D0D0C0C0C0BBBBBBB0
        B0B0A6A6A6A0A0A09B9B9B9090907575756060604A4A4AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnFilterClick
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 374
    Height = 246
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 157
    IQComponents.Grid.Height = 160
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcActivity
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
    IQComponents.Navigator.DataSource = SrcActivity
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 157
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 160
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcActivity
    Columns = <
      item
        FieldName = 'COL_NAME'
        Title.Caption = 'Column Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'OLD_VALUE'
        Title.Caption = 'Old Value'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NEW_VALUE'
        Title.Caption = 'New Value'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ACTION'
        Title.Caption = 'Action'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TIME_STAMP'
        Title.Caption = 'Time Stamp'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 184
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
    end
  end
  object SrcActivity: TDataSource
    DataSet = QryActivity
    Left = 24
    Top = 110
  end
  object QryActivity: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v1.id as tr_value_id,'
      '       v1.tr_batch_id,'
      '       v1.col_name,'
      '       v1.old_value,'
      '       v1.new_value,'
      '       b1.table_name,'
      '       b1.action,'
      '       b1.time_stamp,'
      '       b1.user_name,'
      '       b1.parent_id'
      ''
      '  from '
      '       tr_batch b1,'
      '       tr_value v1,'
      ''
      '       tr_value v3,'
      ''
      '       tr_value v2,'
      '       tr_batch b2'
      ''
      ' where '
      
        '       -- all batches of inserts into releases associated with o' +
        'rd_detail_id in focus'
      '       v2.tr_batch_id = b2.id'
      '   and b2.table_name = '#39'RELEASES'#39
      '   and b2.action = '#39'INSERT'#39
      '   and v2.col_name = '#39'ORD_DETAIL_ID'#39
      '   and v2.new_value = :AID'
      ''
      
        '       -- all releases.id that where inserted for ord_detail_id ' +
        'in focus'
      '   and v3.tr_batch_id = v2.tr_batch_id'
      '   and v3.col_name = '#39'ID'#39
      ''
      
        '       -- link all activity in releases associated with order_dt' +
        'l_id in focus based on releases.id'
      '   and b1.table_name = '#39'RELEASES'#39
      '   and v1.tr_batch_id = b1.id'
      '   and b1.parent_id = v3.new_value'
      '')
    Left = 40
    Top = 112
    ParamData = <
      item
        Name = 'AID'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object QryActivityCOL_NAME: TStringField
      DisplayLabel = 'Column Name'
      DisplayWidth = 30
      FieldName = 'COL_NAME'
      Origin = 'v1.col_name'
      Size = 30
    end
    object QryActivityACTION: TStringField
      DisplayLabel = 'Action'
      DisplayWidth = 10
      FieldName = 'ACTION'
      Origin = 'b1.action'
      Size = 10
    end
    object QryActivityTIME_STAMP: TDateTimeField
      DisplayLabel = 'Time Stamp'
      DisplayWidth = 18
      FieldName = 'TIME_STAMP'
      Origin = 'b1.time_stamp'
    end
    object QryActivityTABLE_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'TABLE_NAME'
      Origin = 'b1.table_name'
      Visible = False
      Size = 30
    end
    object QryActivityUSER_NAME: TStringField
      DisplayWidth = 35
      FieldName = 'USER_NAME'
      Origin = 'b1.user_name'
      Visible = False
      Size = 35
    end
    object QryActivityTR_VALUE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TR_VALUE_ID'
      Origin = 'v1.id'
      Visible = False
      Size = 0
    end
    object QryActivityTR_BATCH_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TR_BATCH_ID'
      Origin = 'v1.tr_batch_id'
      Visible = False
      Size = 0
    end
    object QryActivityPARENT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ID'
      Origin = 'b1.parent_id'
      Visible = False
      Size = 0
    end
    object QryActivityOLD_VALUE: TStringField
      DisplayLabel = 'Old Value'
      FieldName = 'OLD_VALUE'
      Origin = 'v1.old_value'
      Size = 4000
    end
    object QryActivityNEW_VALUE: TStringField
      DisplayLabel = 'New Value'
      FieldName = 'NEW_VALUE'
      Origin = 'v1.new_value'
      Size = 4000
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Releases Activity'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 197402 $'
    BuildVersion = '176554'
    Left = 227
  end
  object wwFilterDialog1: TwwFilterDialog
    DataSource = SrcActivity
    SortBy = fdSortByFieldNo
    FilterMethod = fdByFilter
    DefaultMatchType = fdMatchStart
    DefaultFilterBy = fdSmartFilter
    FieldOperators.OrChar = 'or'
    FieldOperators.AndChar = 'and'
    FieldOperators.NullChar = 'null'
    Rounding.Epsilon = 0.000100000000000000
    Rounding.RoundingMethod = fdrmFixed
    FilterPropertyOptions.LikeWildcardChar = '%'
    SelectedFields.Strings = (
      'ACTION'
      'COL_NAME'
      'TIME_STAMP')
    FilterOptimization = fdNone
    QueryFormatDateMode = qfdMonthDayYear
    SQLTables = <>
    Left = 153
  end
end

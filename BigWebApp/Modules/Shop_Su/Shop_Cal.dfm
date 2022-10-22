object FrmShopCalendar: TFrmShopCalendar
  Left = 173
  Top = 173
  ClientHeight = 200
  ClientWidth = 416
  Caption = 'Shop Calendar'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 416
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnAssignDefault: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Assign default working days & shifts'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000232E0000232E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        800000FF00FFFF00FFFF00FFFF00FFFF00FFB0A0906048306048306048306048
        30604830604830604830FF00FFFF00FF212121FF00FFFF00FFFF00FFFF00FFFF
        00FF9E9E9E464646464646464646464646464646464646464646FF00FF800000
        800000800000FF00FFFF00FFFF00FFFF00FFB0A090D0B8B0D0B8B0C0B0A0C0A8
        A0B0A090B0A090604830FF00FF212121212121212121FF00FFFF00FFFF00FFFF
        00FF9E9E9EB8B8B8B8B8B8AEAEAEA8A8A89E9E9E9E9E9E464646800000800000
        800000800000800000FF00FFFF00FFFF00FFB0A090FFF8FFD0B8B0E0C8C0C0A8
        A0F0D0B0B0A090604830212121212121212121212121212121FF00FFFF00FFFF
        00FF9E9E9EFAFAFAB8B8B8C9C9C9A8A8A8CDCDCD9E9E9E464646FF00FFFF00FF
        800000FF00FFFF00FFFF00FFB0A090604830B0A090D0C0C0D0C0B0B0A8A0B0A0
        90C0A8A0C0A890604830FF00FFFF00FF212121FF00FFFF00FFFF00FF9E9E9E46
        46469E9E9EC2C2C2BEBEBEA7A7A79E9E9EA8A8A8A5A5A5464646FF00FFFF00FF
        800000FF00FFFF00FFFF00FFB0A090D0B8B0C0A890FFFFFFD0C8C0FFFFFFC0B0
        A0FFE0D0C0A8A0604830FF00FFFF00FF212121FF00FFFF00FFFF00FF9E9E9EB8
        B8B8A5A5A5FFFFFFC7C7C7FFFFFFAEAEAEE0E0E0A8A8A8464646FF00FFFF00FF
        800000FF00FFFF00FFFF00FFB0A090FFF8FFC0B0A0E0D0C0A09890C0B0A0C0B0
        A0C0B0A0C0B0A0604830FF00FFFF00FF212121FF00FFFF00FFFF00FF9E9E9EFA
        FAFAAEAEAECECECE979797AEAEAEAEAEAEAEAEAEAEAEAE464646FF00FFFF00FF
        800000FF00FFFF00FFFF00FFB0A090D0C0C0C0B0A0FFFFFFE0D0C0FFFFFFD0C8
        C0FFF8F0D0B8B0604830FF00FFFF00FF212121FF00FFFF00FFFF00FF9E9E9EC2
        C2C2AEAEAEFFFFFFCECECEFFFFFFC7C7C7F7F7F7B8B8B8464646FF00FFFF00FF
        800000FF00FFFF00FFFF00FFC0A890FFFFFFF0A880F0A880F0A080E08850E080
        50E07040E07040D06030FF00FFFF00FF212121FF00FFFF00FFFF00FFA5A5A5FF
        FFFFA8A8A8A8A8A8A2A2A2888888828282767676767676676767FF00FFFF00FF
        800000FF00FFFF00FFFF00FFC0B0A0E0D0C0F0A880FFC0A0FFB890FFA880FFA8
        80F09870F09860D06830FF00FFFF00FF212121FF00FFFF00FFFF00FFAEAEAECE
        CECEA8A8A8C0C0C0B8B8B8A9A9A9A9A9A99A9A9A9898986C6C6CFF00FFFF00FF
        800000FF00FFFF00FFFF00FFC0B0A0FFFFFFF0A880F0A890F0A880E09870E090
        60E07840E07840E07040FF00FFFF00FF212121FF00FFFF00FFFF00FFAEAEAEFF
        FFFFA8A8A8AAAAAAA8A8A89898989090907B7B7B7B7B7B767676FF00FFFF00FF
        800000FF00FFFF00FFFF00FFF0A880F0A880F0A080E08850E08050E07040E070
        40D06030FF00FFFF00FFFF00FFFF00FF212121FF00FFFF00FFFF00FFA8A8A8A8
        A8A8A2A2A2888888828282767676767676676767FF00FFFF00FFFF00FFFF00FF
        800000FF00FFFF00FFFF00FFF0A880FFC0A0FFB890FFA880FFA880F09870F098
        60D06830FF00FFFF00FFFF00FFFF00FF212121FF00FFFF00FFFF00FFA8A8A8C0
        C0C0B8B8B8A9A9A9A9A9A99A9A9A9898986C6C6CFF00FFFF00FFFF00FFFF00FF
        800000FF00FFFF00FFFF00FFF0A880F0A890F0A880E09870E09060E07840E078
        40E07040FF00FFFF00FFFF00FFFF00FF212121FF00FFFF00FFFF00FFA8A8A8AA
        AAAAA8A8A89898989090907B7B7B7B7B7B767676FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnAssignDefaultClick
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 416
    Height = 173
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 199
    IQComponents.Grid.Height = 87
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcV_ShopCalendar
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
    IQComponents.Navigator.DataSource = SrcV_ShopCalendar
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.Navigator.BeforeAction = CheckRefresh
    IQComponents.HiddenPanel.Left = 199
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 87
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcV_ShopCalendar
    Columns = <
      item
        FieldName = 'SHIFT'
        Title.Caption = 'Shift #'
        Width = 42
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SUN_WORKING'
        Title.Caption = 'Sun'
        Width = 42
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'MON_WORKING'
        Title.Caption = 'Mon'
        Width = 42
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'TUE_WORKING'
        Title.Caption = 'Tue'
        Width = 42
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'WED_WORKING'
        Title.Caption = 'Wed'
        Width = 42
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'THU_WORKING'
        Title.Caption = 'Thu'
        Width = 42
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'FRI_WORKING'
        Title.Caption = 'Fri'
        Width = 42
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'SAT_WORKING'
        Title.Caption = 'Sat'
        Width = 42
        CheckBoxField.FieldValues = 'Y;N'
      end>
    Marker = 0
  end
  object SrcV_ShopCalendar: TDataSource
    DataSet = QryV_ShopCalendar
    Left = 140
    Top = 54
  end
  object QryV_ShopCalendar: TFDQuery
    BeforeOpen = QryV_ShopCalendarBeforeOpen
    BeforeInsert = DoAbortOnBefore
    BeforePost = QryV_ShopCalendarBeforePost
    BeforeDelete = DoAbortOnBefore
    AfterScroll = QryV_ShopCalendarAfterScroll
    OnUpdateRecord = QryV_ShopCalendarUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select source,'
      '       source_id,'
      '       shift,'
      '       sun_working,'
      '       mon_working,'
      '       tue_working,'
      '       wed_working,'
      '       thu_working,'
      '       fri_working,'
      '       sat_working'
      '  from       '
      '       v_shop_calendar'
      ' where'
      '       source = :source'
      '   and source_id = :source_id'
      ' order by'
      '       shift'
      ' ')
    Left = 140
    Top = 87
    ParamData = <
      item
        Name = 'source'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'source_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryV_ShopCalendarSHIFT: TBCDField
      DisplayLabel = 'Shift #'
      DisplayWidth = 6
      FieldName = 'SHIFT'
      Origin = 'IQ.V_SHOP_CALENDAR.SHIFT'
      ReadOnly = True
      Size = 0
    end
    object QryV_ShopCalendarSUN_WORKING: TStringField
      DisplayLabel = 'Sun'
      DisplayWidth = 6
      FieldName = 'SUN_WORKING'
      Origin = 'IQ.V_SHOP_CALENDAR.SUN_WORKING'
      Size = 1
    end
    object QryV_ShopCalendarMON_WORKING: TStringField
      DisplayLabel = 'Mon'
      DisplayWidth = 6
      FieldName = 'MON_WORKING'
      Origin = 'IQ.V_SHOP_CALENDAR.MON_WORKING'
      Size = 1
    end
    object QryV_ShopCalendarTUE_WORKING: TStringField
      DisplayLabel = 'Tue'
      DisplayWidth = 6
      FieldName = 'TUE_WORKING'
      Origin = 'IQ.V_SHOP_CALENDAR.TUE_WORKING'
      Size = 1
    end
    object QryV_ShopCalendarWED_WORKING: TStringField
      DisplayLabel = 'Wed'
      DisplayWidth = 6
      FieldName = 'WED_WORKING'
      Origin = 'IQ.V_SHOP_CALENDAR.WED_WORKING'
      Size = 1
    end
    object QryV_ShopCalendarTHU_WORKING: TStringField
      DisplayLabel = 'Thu'
      DisplayWidth = 6
      FieldName = 'THU_WORKING'
      Origin = 'IQ.V_SHOP_CALENDAR.THU_WORKING'
      Size = 1
    end
    object QryV_ShopCalendarFRI_WORKING: TStringField
      DisplayLabel = 'Fri'
      DisplayWidth = 6
      FieldName = 'FRI_WORKING'
      Origin = 'IQ.V_SHOP_CALENDAR.FRI_WORKING'
      Size = 1
    end
    object QryV_ShopCalendarSAT_WORKING: TStringField
      DisplayLabel = 'Sat'
      DisplayWidth = 6
      FieldName = 'SAT_WORKING'
      Origin = 'IQ.V_SHOP_CALENDAR.SAT_WORKING'
      Size = 1
    end
    object QryV_ShopCalendarSOURCE: TStringField
      DisplayWidth = 30
      FieldName = 'SOURCE'
      Origin = 'IQ.V_SHOP_CALENDAR.SOURCE'
      ReadOnly = True
      Visible = False
      Size = 30
    end
    object QryV_ShopCalendarSOURCE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Origin = 'IQ.V_SHOP_CALENDAR.SOURCE_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
  end
end

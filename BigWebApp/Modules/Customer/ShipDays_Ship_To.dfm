inherited FrmShipmentDaysShipTo: TFrmShipmentDaysShipTo
  ClientHeight = 329
  ClientWidth = 439
  Caption = 'Shipping Days'
  OnShow = FormShow
  OldCreateOrder = True
  ExplicitWidth = 445
  ExplicitHeight = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 439
    Height = 121
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    ExplicitLeft = 0
    ExplicitTop = 27
    ExplicitWidth = 439
    ExplicitHeight = 121
  end
  object Label1: TUniLabel [1]
    Left = 8
    Top = 36
    Width = 70
    Height = 13
    Hint = ''
    Caption = 'Valid ship days'
    TabOrder = 13
  end
  object Label2: TUniLabel [2]
    Left = 187
    Top = 38
    Width = 91
    Height = 13
    Hint = ''
    Caption = 'Preferred Ship Day'
    TabOrder = 14
  end
  object Bevel2: TUniPanel [3]
    Left = 0
    Top = 291
    Width = 439
    Height = 38
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 15
    Caption = ''
  end
  inherited btnOK: TUniButton
    Left = 232
    Top = 299
    Anchors = [akRight, akBottom]
    ExplicitLeft = 232
    ExplicitTop = 299
  end
  inherited Cancel: TUniButton
    Left = 333
    Top = 299
    Anchors = [akRight, akBottom]
    TabOrder = 12
    ExplicitLeft = 333
    ExplicitTop = 299
  end
  inherited chkSun: TUniDBCheckBox
    Left = 90
    Top = 34
    ExplicitLeft = 90
    ExplicitTop = 34
  end
  inherited chkMon: TUniDBCheckBox
    Left = 90
    Top = 49
    ExplicitLeft = 90
    ExplicitTop = 49
  end
  inherited chkTue: TUniDBCheckBox
    Left = 90
    Top = 64
    ExplicitLeft = 90
    ExplicitTop = 64
  end
  inherited chkWed: TUniDBCheckBox
    Left = 90
    Top = 80
    ExplicitLeft = 90
    ExplicitTop = 80
  end
  inherited chkThu: TUniDBCheckBox
    Left = 90
    Top = 95
    ExplicitLeft = 90
    ExplicitTop = 95
  end
  inherited chkFri: TUniDBCheckBox
    Left = 90
    Top = 110
    ExplicitLeft = 90
    ExplicitTop = 110
  end
  inherited chkSat: TUniDBCheckBox
    Left = 90
    Top = 125
    ExplicitLeft = 90
    ExplicitTop = 125
  end
  inherited Panel1: TUniPanel
    Width = 439
    Alignment = taLeftJustify
    ExplicitWidth = 439
    object sbtnRecalcMustShipDate: TUniSpeedButton [0]
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Recalculate Must Ship Date for all sales orders'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFB0A0906048306048306048306048306048306048306048
        30604830604830604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9E46464646
        4646464646464646464646464646464646464646464646464646FF00FFFF00FF
        FF00FFFF00FFFF00FFB0A090E0C8C0D0B8B0D0B8B0C0B0A0C0B0A0C0A8A0C0A8
        90B0A090B0A090604830FF00FFFF00FFFF00FFFF00FFFF00FF9E9E9EC9C9C9B8
        B8B8B8B8B8AEAEAEAEAEAEA8A8A8A5A5A59E9E9E9E9E9E464646B0A090604830
        604830604830604830B0A090FFFFFFFFF8FFD0B8B0404040E0C8C0C0A8A0F0D8
        D0F0D0B0B0A0906048309E9E9E4646464646464646464646469E9E9EFFFFFFFA
        FAFAB8B8B8404040C9C9C9A8A8A8D9D9D9CDCDCD9E9E9E464646B0A090E0C8C0
        D0B8B0D0B8B0C0B0A0B0A090FFFFFFFFFFFFD0C0B0606060605850C0B0A0FFE0
        D0F0D8C0C0A8906048309E9E9EC9C9C9B8B8B8B8B8B8AEAEAE9E9E9EFFFFFFFF
        FFFFBEBEBE606060575757AEAEAEE0E0E0D5D5D5A5A5A5464646B0A090FFFFFF
        FFF8FFD0B8B0FFF0F0B0A090E0D0D0D0C0C0D0C0B0B0A8A0000000B0A090C0B0
        A0C0A8A0C0A8906048309E9E9EFFFFFFFAFAFAB8B8B8F2F2F29E9E9ED2D2D2C2
        C2C2BEBEBEA7A7A70000009E9E9EAEAEAEA8A8A8A5A5A5464646B0A090FFFFFF
        C0B8C0000000000000C0A890FFFFFFFFFFFFD0C8C0FFFFFF807880504840FFF0
        E0FFE0D0C0A8A06048309E9E9EFFFFFFBBBBBB000000000000A5A5A5FFFFFFFF
        FFFFC7C7C7FFFFFF7B7B7B474747EEEEEEE0E0E0A8A8A8464646B0A090E0D0D0
        403830605850D0C0B0C0A8A0FFFFFFFFFFFFD0C8C0FFFFFFF0E8F0100810E0D8
        D0FFE8E0C0A8A06048309E9E9ED2D2D2373737575757BEBEBEA8A8A8FFFFFFFF
        FFFFC7C7C7FFFFFFEBEBEB0B0B0BD7D7D7E9E9E9A8A8A8464646C0A890FFFFFF
        A098A0302820707870C0B0A0E0D8D0E0D0C0A098907060607060602020206060
        50C0B0A0C0B0A0604830A5A5A5FFFFFF9B9B9B272727757575AEAEAED7D7D7CE
        CECE9797976161616161612020205C5C5CAEAEAEAEAEAE464646C0A8A0FFFFFF
        E0E0E0000000606860D0B0A0FFFFFFFFFFFFA09890808080808080706060C0C0
        C0FFF0F0C0B0A0604830A8A8A8FFFFFFE0E0E0000000656565AFAFAFFFFFFFFF
        FFFF979797808080808080616161C0C0C0F2F2F2AEAEAE464646C0B0A0E0D8D0
        707060302820D0C8C0D0B8A0FFFFFFFFFFFFE0D0C0FFFFFFFFFFFFD0C8C0FFFF
        FFFFF8F0D0B8B0604830AEAEAED7D7D76D6D6D272727C7C7C7B5B5B5FFFFFFFF
        FFFFCECECEFFFFFFFFFFFFC7C7C7FFFFFFF7F7F7B8B8B8464646D0B0A0FFFFFF
        FFFFFF403830000000F0A890F0A890F0A880F0A080E09870E08850E08050E078
        40E07040E07040D06030AFAFAFFFFFFFFFFFFF373737000000AAAAAAAAAAAAA8
        A8A8A2A2A29898988888888282827B7B7B767676767676676767D0B8A0FFFFFF
        FFFFFFE0D0C0FFFFFFF0A890FFC0A0FFC0A0FFB890FFB890FFA880FFA880F0A0
        70F09870F09860D06830B5B5B5FFFFFFFFFFFFCECECEFFFFFFAAAAAAC0C0C0C0
        C0C0B8B8B8B8B8B8A9A9A9A9A9A9A0A0A09A9A9A9898986C6C6CF0A890F0A890
        F0A880F0A080E09870F0A890F0A890F0A890F0A880F0A080E09870E09060E088
        60E07840E07840E07040AAAAAAAAAAAAA8A8A8A2A2A2989898AAAAAAAAAAAAAA
        AAAAA8A8A8A2A2A29898989090908A8A8A7B7B7B7B7B7B767676F0A890FFC0A0
        FFC0A0FFB890FFB890FFA880FFA880F0A070F09870F09860D06830FF00FFFF00
        FFFF00FFFF00FFFF00FFAAAAAAC0C0C0C0C0C0B8B8B8B8B8B8A9A9A9A9A9A9A0
        A0A09A9A9A9898986C6C6CFF00FFFF00FFFF00FFFF00FFFF00FFF0A890F0A890
        F0A890F0A880F0A080E09870E09060E08860E07840E07840E07040FF00FFFF00
        FFFF00FFFF00FFFF00FFAAAAAAAAAAAAAAAAAAA8A8A8A2A2A29898989090908A
        8A8A7B7B7B7B7B7B767676FF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnRecalcMustShipDateClick
    end
    object Bevel3: TUniPanel [1]
      Left = 28
      Top = 3
      Width = 2
      Height = 21
      Hint = ''
      TabOrder = 5
      Caption = ''
    end
    inherited sbtnChkAll: TUniSpeedButton
      Left = 31
      ExplicitLeft = 31
    end
    inherited sbtnUnchAll: TUniSpeedButton
      Left = 56
      ExplicitLeft = 56
    end
    inherited DBNavigator1: TUniDBNavigator
      Left = 389
      Width = 50
      VisibleButtons = [nbPost, nbCancel]
      ExplicitLeft = 389
      ExplicitWidth = 50
    end
  end
  object wwComboPreferredShipday: TUniDBComboBox [14]
    Left = 287
    Top = 34
    Width = 143
    Height = 21
    Hint = ''
    DataField = 'PREFERRED_SHIP_DAY'
    DataSource = DataSource1
    Style = csDropDownList
    Items.Strings = (
      'Sunday'#9'1'
      'Monday'#9'2'
      'Tuesday'#9'3'
      'Wednesday'#9'4'
      'Thursday'#9'5'
      'Friday'#9'6'
      'Saturday'#9'7')
    TabOrder = 10
    OnChange = wwComboPreferredShipdayChange
    OnDropDown = wwComboPreferredShipdayDropDown
  end
  object wwDBGrid1: TIQUniGridControl [15]
    Left = 0
    Top = 148
    Width = 439
    Height = 143
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 11
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 222
    IQComponents.Grid.Height = 57
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcShipToCalendar
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
    IQComponents.Navigator.DataSource = SrcShipToCalendar
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 222
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 57
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcShipToCalendar
    TabsVisible = True
    Marker = 0
  end
  inherited DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 178
    Top = 155
  end
  object SrcShipToCalendar: TDataSource
    DataSet = QryShipToCalendar
    Left = 168
    Top = 161
  end
  object QryShipToCalendar: TFDQuery
    Active = True
    BeforeInsert = CheckParentPosted
    BeforeEdit = CheckParentPosted
    BeforePost = QryShipToCalendarBeforePost
    AfterPost = ApplyUpdateToTable
    AfterDelete = ApplyUpdateToTable
    MasterSource = DataSource1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ship_to_calendar'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       ship_to_id,'
      '       descrip,'
      '       start_time,'
      '       end_time,'
      '       exclude_transit'
      '  from ship_to_calendar'
      ' where ship_to_id = :id'
      ' order by start_time'
      ' ')
    Left = 208
    Top = 159
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryShipToCalendarDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 29
      FieldName = 'DESCRIP'
      Origin = 'IQ.SHIP_TO_CALENDAR.DESCRIP'
      Size = 50
    end
    object QryShipToCalendarSTART_TIME: TDateTimeField
      DisplayLabel = 'From'
      DisplayWidth = 18
      FieldName = 'START_TIME'
      Origin = 'IQ.SHIP_TO_CALENDAR.START_TIME'
    end
    object QryShipToCalendarEND_TIME: TDateTimeField
      DisplayLabel = 'To'
      DisplayWidth = 18
      FieldName = 'END_TIME'
      Origin = 'IQ.SHIP_TO_CALENDAR.END_TIME'
    end
    object QryShipToCalendarEXCLUDE_TRANSIT: TStringField
      DisplayLabel = 'Exclude Transit'
      DisplayWidth = 1
      FieldName = 'EXCLUDE_TRANSIT'
      Origin = 'IQ.SHIP_TO_CALENDAR.EXCLUDE_TRANSIT'
      FixedChar = True
      Size = 1
    end
    object QryShipToCalendarID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.SHIP_TO_CALENDAR.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryShipToCalendarSHIP_TO_ID: TBCDField
      FieldName = 'SHIP_TO_ID'
      Origin = 'IQ.SHIP_TO_CALENDAR.SHIP_TO_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ship_to_calendar'
      
        '  (ID, SHIP_TO_ID, DESCRIP, START_TIME, END_TIME, EXCLUDE_TRANSI' +
        'T)'
      'values'
      
        '  (:ID, :SHIP_TO_ID, :DESCRIP, :START_TIME, :END_TIME, :EXCLUDE_' +
        'TRANSIT)')
    ModifySQL.Strings = (
      'update ship_to_calendar'
      'set'
      '  ID = :ID,'
      '  SHIP_TO_ID = :SHIP_TO_ID,'
      '  DESCRIP = :DESCRIP,'
      '  START_TIME = :START_TIME,'
      '  END_TIME = :END_TIME,'
      '  EXCLUDE_TRANSIT = :EXCLUDE_TRANSIT'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ship_to_calendar'
      'where'
      '  ID = :OLD_ID')
    Left = 184
    Top = 165
  end
end

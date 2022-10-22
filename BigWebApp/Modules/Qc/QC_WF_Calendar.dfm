object FrmQCWorkflowCalendar: TFrmQCWorkflowCalendar
  Left = 261
  Top = 224
  HelpContext = 16211
  ClientHeight = 425
  ClientWidth = 307
  Caption = 'Workflow Calendar Days Off'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 307
    Height = 27
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnAssignWeekendsOff: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Assign weekends off...'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFDECABDBF9576C7A083B48A6CC8A183C7A082B78D
        6FC79E7DBA8A66B1866AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80
        8080808080808080808080808080808080808080808080858585FF00FFD3D3D3
        C9C9C9DDDDDDFCFCFCFF00FFE3D2C7E7D2BAF8EBD5CAB39CF7E9D2F5E6D0D3BE
        ABF8E8CDDAB792B08568FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80
        8080FF00FF808080FFFFFFFF00FF808080FF00FF808080848484FF00FF959595
        AAAAAA8F8F8FDFDFDFFF00FFE2D1C6CAB29ED1BFAFAD927FC3B0A2BEAAA0B8A0
        91C9B4A1C6A588AA7E62FF00FF8080808080808F8F8FFF00FFFF00FFFF00FF80
        80808080808080808080808080808080808080808080807D7D7DFF00FFA8A8A8
        FFFFFFFFFFFFA8A8A8F1F1F1E3D2C7E1CFBFEFE6DABCA695EEE8DFEEE7DFC8B4
        A8F1E8DDE1C9B3A87C60FF00FF808080FFFFFFFF00FFA8A8A8FF00FFFF00FF80
        8080FF00FF808080FFFFFFFF00FF808080FF00FF8080807B7B7BFF00FFC7C7C7
        FFFFFFFFFFFF9A9A9AB9B9B9DECEC5C9B5A9D2C5BDB7A295CFC2BAD1C1B9B89E
        91D4C3BAC9AE9BA4785DFF00FF808080808080FFFFFF808080B9B9B9FF00FF80
        8080808080808080808080808080808080808080808080777777FF00FFFF00FF
        EEEEEEB4B4B4FFFFFF9B9B9BB8AEADE1CFBFEFE6DAB7A295EFE6DAEFE6DAB7A2
        95EFE6DAE1C9B38D6B6BFF00FFFF00FFFF00FF808080FFFFFF808080AFAFAF80
        8080FF00FF808080FFFFFFFF00FF808080FF00FF8080806E6E6EFF00FFFF00FF
        FF00FFF9F9F9B4B4B4FFFFFF8885A34543B23A39BA3635B93230B52020AF1B1A
        AD1616AB1313A92B278FFF00FFFF00FFFF00FFFF00FF808080FFFFFF80808068
        68686767676565656262625A5A5A5858585656565454544D4D4DFF00FFFF00FF
        ECECECD3D3D3EBEBEBAAAAAAD8D7E75959A46363915B5B915D5D985C5C8F5150
        965B5A8C3F3E996766B4FF00FFFF00FFFF00FFFF00FFFF00FF808080DBDBDB6F
        6F6F6F6F6F6969696D6D6D6969696464646767675B5B5B7C7C7CFF00FFF9F9F9
        BCBCBC787878B1B1B1A1A0A043547D367DDD9595969E9E9F8D8D8E9F9FA28F8F
        909C9C9EA8A8ACF2F2F6FF00FFFF00FF8080807878788080808080805E5E5E96
        96969595958080808D8D8DFF00FFFF00FFFF00FFFF00FFFF00FFF8F8F8BFBFBF
        828282A8A8A88C8C8B88837D2049931195FB39CFFF1F88FF316DBE9A9DA1EEEE
        EEFF00FFFF00FFFF00FFFF00FF808080828282A8A8A88C8C8C8282825D5D5DAE
        AEAED5D5D58080808080809E9E9EFF00FFFF00FFFF00FFFF00FFD8D8D8ACACAC
        D0D0D0D5D5D5A7A7A78B8B87999697355AA01B99FE39CFFF1F88FF2B6BBF9B9D
        A1EBEBEBFF00FFFF00FF808080ACACACD0D0D0D5D5D5A7A7A78A8A8A97979780
        8080B1B1B1D5D5D58080808080809E9E9EFF00FFFF00FFFF00FFBEBEBED1D1D1
        AAAAAAA4A4A4D1D1D1DBDCDCBAB9B6CECECE6D89BB1A9BFF39CFFF1F88FF2E6B
        BF9B9FA3F2F2F2FF00FF808080D1D1D1808080808080D1D1D1808080808080FF
        00FF808080B2B2B2D5D5D5808080818181A0A0A0FF00FFFF00FFE2E2E2D1D1D1
        F4F4F49D9D9DE7E7E7FFFFFFAEAEAEFF00FFE4E4E46786B9199BFF39CFFF1884
        FF376FC0CFD0D1FF00FF808080808080FF00FF808080E7E7E7808080808080FF
        00FFFF00FF808080B2B2B2D5D5D5808080808080FF00FFFF00FFFF00FFF1F1F1
        B8B8B8A1A1A1F8F8F8EFEFEFC7C7C7FF00FFFF00FFE4E4E46786BA2BA7FF2596
        FF3580E0CECFD1FF00FFFF00FFFF00FF808080808080F8F8F8808080808080FF
        00FFFF00FFFF00FF808080BABABAB0B0B0808080FF00FFFF00FFFF00FFD9D9D9
        B0B0B0E7E7E7EEEEEEBFBFBFF8F8F8FF00FFFF00FFFF00FFE0E0E17595C15E98
        DB859BB6E2E2E2FF00FFFF00FFFF00FF808080E7E7E7808080808080FF00FFFF
        00FFFF00FFFF00FFFF00FF808080808080808080FF00FFFF00FFFF00FFF7F7F7
        CFCFCFBBBBBBBFBFBFECECECFF00FFFF00FFFF00FFFF00FFFF00FFE3E3E4D6D7
        DBDEDEDEF8F8F8FF00FFFF00FFFF00FFFF00FF808080808080FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnAssignWeekendsOffClick
    end
    object NavMain: TUniDBNavigator
      Left = 82
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcWFCalendar
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TUniPanel
    Tag = 1999
    Left = 0
    Top = 27
    Width = 307
    Height = 398
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 305
      Height = 396
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object IQSearch1: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 303
        Height = 394
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 86
        IQComponents.Grid.Height = 308
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcWFCalendar
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
        IQComponents.Navigator.DataSource = SrcWFCalendar
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 86
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 308
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        IQComponents.FormTab.ExplicitLeft = 0
        IQComponents.FormTab.ExplicitTop = 0
        IQComponents.FormTab.ExplicitWidth = 256
        IQComponents.FormTab.ExplicitHeight = 128
        DataSource = SrcWFCalendar
        Columns = <
          item
            FieldName = 'START_TIME'
            Title.Caption = 'Start Time'
            Width = 136
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'END_TIME'
            Title.Caption = 'End Time'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 120
    Top = 72
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = 'Options'
      object DeleteObsolete1: TUniMenuItem
        Caption = 'Delete Obsolete'
        OnClick = DeleteObsolete1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmQCWorkflowCalendar'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 191144 $'
    BuildVersion = '176554'
    Left = 152
    Top = 72
  end
  object SrcWFCalendar: TDataSource
    DataSet = QryWFCalendar
    Left = 32
    Top = 72
  end
  object QryWFCalendar: TFDQuery
    BeforePost = AssignIDBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnNewRecord = QryWFCalendarNewRecord
    CachedUpdates = True
    UpdateObject = UpdateSQLWFCalendar
    SQL.Strings = (
      'select id,'
      '       start_time,'
      '       end_time'
      '  from wf_calendar'
      ' order by start_time')
    Left = 32
    Top = 88
    object QryWFCalendarSTART_TIME: TDateTimeField
      DisplayLabel = 'Start Time'
      DisplayWidth = 22
      FieldName = 'START_TIME'
      Origin = 'START_TIME'
    end
    object QryWFCalendarEND_TIME: TDateTimeField
      DisplayLabel = 'End Time'
      DisplayWidth = 22
      FieldName = 'END_TIME'
      Origin = 'END_TIME'
    end
    object QryWFCalendarID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.WF_CALENDAR.ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLWFCalendar: TFDUpdateSQL
    InsertSQL.Strings = (
      'insert into wf_calendar'
      '  (ID, START_TIME, END_TIME)'
      'values'
      '  (:ID, :START_TIME, :END_TIME)')
    ModifySQL.Strings = (
      'update wf_calendar'
      'set'
      '  ID = :ID,'
      '  START_TIME = :START_TIME,'
      '  END_TIME = :END_TIME'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from wf_calendar'
      'where'
      '  ID = :OLD_ID')
    Left = 32
    Top = 100
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'FRMQCWORKFLOWCALENDAR'
    Left = 192
    Top = 72
  end
end

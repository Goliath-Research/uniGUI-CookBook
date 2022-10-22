object RTDwnQryEntry: TRTDwnQryEntry
  Left = 268
  Top = 189
  HelpContext = 1067416
  ClientHeight = 242
  ClientWidth = 458
  Caption = 'RT Downtime - Select Query'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  OnKeyDown = FormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 15
    Top = 17
    Width = 43
    Height = 13
    Hint = ''
    Caption = 'Intervals'
    TabOrder = 0
  end
  object Label2: TUniLabel
    Left = 15
    Top = 71
    Width = 72
    Height = 13
    Hint = ''
    Caption = 'Work Center #'
    TabOrder = 2
  end
  object Label3: TUniLabel
    Left = 15
    Top = 98
    Width = 48
    Height = 13
    Hint = ''
    Caption = 'Prod Date'
    TabOrder = 12
  end
  object Label4: TUniLabel
    Left = 15
    Top = 125
    Width = 22
    Height = 13
    Hint = ''
    Caption = 'Shift'
    TabOrder = 13
  end
  object Label5: TUniLabel
    Left = 15
    Top = 152
    Width = 29
    Height = 13
    Hint = ''
    Caption = 'Mfg #'
    TabOrder = 14
  end
  object sbtnSelectMfgNo: TUniSpeedButton
    Left = 332
    Top = 148
    Width = 23
    Height = 22
    Hint = ''
    Glyph.Data = {
      36060000424D3606000000000000360000002800000020000000100000000100
      1800000000000006000000000000000000000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
      90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
      40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
      00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
      E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
      90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
      00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
      E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
      B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
      00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
      E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
      B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
      00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
      F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
      B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
      00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
      A068509050308048308048208038108F4C26B08870A068509058309048308040
      20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
      4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
      FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
      50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
      B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
      F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
      50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
      57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
      C09880B08060A068509050309058409D6842B07860B08870A070508048308048
      20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
      67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
      C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
      20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
      00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
      CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
      37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
      00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
      00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
      00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Caption = ''
    ParentColor = False
    Color = clWindow
    OnClick = sbtnSelectMfgNoClick
  end
  object Label6: TUniLabel
    Left = 15
    Top = 44
    Width = 45
    Height = 13
    Hint = ''
    Caption = 'Mfg Type'
    TabOrder = 16
  end
  object cboxInterval: TUniComboBox
    Left = 101
    Top = 13
    Width = 230
    Height = 21
    Hint = ''
    Style = csDropDownList
    Text = ''
    Items.Strings = (
      'Current Shift Intervals'
      'Current Shift Open Intervals'
      'Current Shift Closed Intervals'
      'Past Shift Intervals')
    TabOrder = 17
    OnChange = cboxIntervalChange
  end
  object cboxMach: TUniComboBox
    Left = 101
    Top = 67
    Width = 230
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 18
    OnChange = cboxMachChange
  end
  object eMfgNo: TUniEdit
    Left = 101
    Top = 148
    Width = 230
    Height = 21
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    TabOrder = 5
    ReadOnly = True
    OnChange = eMfgNoChange
  end
  object eShift: TUniEdit
    Left = 101
    Top = 121
    Width = 28
    Height = 21
    Hint = ''
    MaxLength = 1
    Text = ' '
    TabOrder = 4
    OnChange = eShiftChange
    OnExit = eShiftExit
  end
  object eProdDate: TUniDateTimePicker
    Left = 101
    Top = 94
    Width = 230
    Height = 21
    Hint = ''
    DateTime = 42683.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 3
    OnChange = eProdDateChange
  end
  object rbtnMach: TUniCheckBox
    Left = 370
    Top = 69
    Width = 74
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Include All'
    TabOrder = 7
    OnClick = rbtnMachClick
  end
  object rbtnProdDate: TUniCheckBox
    Left = 370
    Top = 96
    Width = 74
    Height = 16
    Hint = ''
    Checked = True
    Caption = 'Include All'
    TabOrder = 8
    OnClick = rbtnProdDateClick
  end
  object rbtnShift: TUniCheckBox
    Left = 370
    Top = 123
    Width = 73
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Include All'
    TabOrder = 9
    OnClick = rbtnShiftClick
  end
  object rbtnMfgNo: TUniCheckBox
    Left = 370
    Top = 150
    Width = 74
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Include All'
    TabOrder = 10
    OnClick = rbtnMfgNoClick
  end
  object wwDBComboBoxMfgType: TUniDBLookupComboBox
    Left = 101
    Top = 40
    Width = 230
    Height = 21
    Hint = ''
    ListFieldIndex = 0
    TabOrder = 1
    Color = clWindow
    OnChange = wwDBComboBoxMfgTypeChange
  end
  object chkMfgType: TUniCheckBox
    Left = 370
    Top = 42
    Width = 74
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Include All'
    TabOrder = 6
    OnClick = chkMfgTypeClick
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 201
    Width = 458
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 11
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 249
      Top = 1
      Width = 208
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BitBtn1: TUniBitBtn
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        Caption = 'OK'
        TabOrder = 0
        Default = True
        OnClick = BitBtn1Click
      end
      object BitBtn2: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 1
      end
    end
  end
  object QryParams: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select prod_date, prod_shift from params')
    Left = 27
    Top = 193
  end
  object PkMfg: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select mfgNo as mfgno, '
      '       id    as id '
      '  from standard')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 60
    Top = 193
    object PkMfgMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkMfgID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.STANDARD.ID'
      Visible = False
      Size = 0
    end
  end
  object Timer1: TUniTimer
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = Timer1Timer
    Left = 96
    Top = 193
  end
  object QryMfgType: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select mfgtype,'
      '       descrip'
      '  from mfgtype'
      'order by mfgtype')
    Left = 129
    Top = 193
    object QryMfgTypeMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 12
      FieldName = 'MFGTYPE'
      Origin = 'IQ.MFGTYPE.MFGTYPE'
      FixedChar = True
      Size = 10
    end
    object QryMfgTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.MFGTYPE.DESCRIP'
      FixedChar = True
    end
  end
end

object FrmW2: TFrmW2
  Left = 21
  Top = 175
  ClientHeight = 438
  ClientWidth = 592
  Caption = 'W2 Wage and Tax Statement'
  BorderStyle = bsSingle
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 104
    Width = 592
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 107
    Width = 592
    Height = 331
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel7: TUniPanel
      Left = 1
      Top = 56
      Width = 281
      Height = 94
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 44
      Caption = ''
    end
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 101
      Height = 31
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 45
      Caption = ''
    end
    object Bevel2: TUniPanel
      Left = 99
      Top = 1
      Width = 73
      Height = 31
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 46
      Caption = ''
    end
    object Bevel3: TUniPanel
      Left = 170
      Top = 1
      Width = 33
      Height = 31
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 47
      Caption = ''
    end
    object Bevel4: TUniPanel
      Left = 200
      Top = 1
      Width = 391
      Height = 31
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 48
      Caption = ''
    end
    object Bevel5: TUniPanel
      Left = 1
      Top = 29
      Width = 281
      Height = 29
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 49
      Caption = ''
    end
    object Bevel6: TUniPanel
      Left = 279
      Top = 29
      Width = 151
      Height = 29
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 50
      Caption = ''
    end
    object Bevel8: TUniPanel
      Left = 279
      Top = 56
      Width = 151
      Height = 35
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 51
      Caption = ''
    end
    object Bevel9: TUniPanel
      Left = 279
      Top = 89
      Width = 151
      Height = 32
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 52
      Caption = ''
    end
    object Bevel10: TUniPanel
      Left = 279
      Top = 119
      Width = 151
      Height = 31
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 53
      Caption = ''
    end
    object Bevel11: TUniPanel
      Left = 279
      Top = 148
      Width = 151
      Height = 34
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 54
      Caption = ''
    end
    object Bevel12: TUniPanel
      Left = 1
      Top = 148
      Width = 281
      Height = 34
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 55
      Caption = ''
    end
    object Bevel13: TUniPanel
      Left = 279
      Top = 180
      Width = 151
      Height = 31
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 56
      Caption = ''
    end
    object Bevel14: TUniPanel
      Left = 1
      Top = 180
      Width = 281
      Height = 120
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 57
      Caption = ''
    end
    object Bevel16: TUniPanel
      Left = 498
      Top = 298
      Width = 93
      Height = 33
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 58
      Caption = ''
    end
    object Bevel18: TUniPanel
      Left = 410
      Top = 298
      Width = 90
      Height = 33
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 59
      Caption = ''
    end
    object Bevel20: TUniPanel
      Left = 321
      Top = 298
      Width = 91
      Height = 33
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 60
      Caption = ''
    end
    object Bevel22: TUniPanel
      Left = 239
      Top = 298
      Width = 84
      Height = 33
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 61
      Caption = ''
    end
    object Bevel24: TUniPanel
      Left = 151
      Top = 298
      Width = 90
      Height = 33
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 62
      Caption = ''
    end
    object Bevel26: TUniPanel
      Left = 1
      Top = 298
      Width = 153
      Height = 33
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 63
      Caption = ''
    end
    object Label1: TUniLabel
      Left = 3
      Top = 3
      Width = 6
      Height = 13
      Hint = ''
      Caption = 'a'
      TabOrder = 64
    end
    object Label2: TUniLabel
      Left = 117
      Top = 8
      Width = 35
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '22222'
      ParentFont = False
      Font.Style = [fsBold]
      TabOrder = 65
    end
    object Label3: TUniLabel
      Left = 3
      Top = 32
      Width = 6
      Height = 13
      Hint = ''
      Caption = 'b'
      TabOrder = 66
    end
    object Label4: TUniLabel
      Left = 3
      Top = 59
      Width = 5
      Height = 13
      Hint = ''
      Caption = 'c'
      TabOrder = 67
    end
    object Label5: TUniLabel
      Left = 3
      Top = 151
      Width = 6
      Height = 13
      Hint = ''
      Caption = 'd'
      TabOrder = 68
    end
    object Label6: TUniLabel
      Left = 3
      Top = 183
      Width = 6
      Height = 13
      Hint = ''
      Caption = 'e'
      TabOrder = 69
    end
    object Label7: TUniLabel
      Left = 3
      Top = 301
      Width = 12
      Height = 13
      Hint = ''
      Caption = '15'
      TabOrder = 70
    end
    object Label8: TUniLabel
      Left = 282
      Top = 32
      Width = 6
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '1'
      TabOrder = 71
    end
    object Bevel30: TUniPanel
      Left = 428
      Top = 29
      Width = 163
      Height = 29
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 72
      Caption = ''
    end
    object Bevel31: TUniPanel
      Left = 428
      Top = 56
      Width = 163
      Height = 35
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 73
      Caption = ''
    end
    object Bevel32: TUniPanel
      Left = 428
      Top = 89
      Width = 163
      Height = 32
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 74
      Caption = ''
    end
    object Bevel33: TUniPanel
      Left = 428
      Top = 119
      Width = 163
      Height = 31
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 75
      Caption = ''
    end
    object Bevel34: TUniPanel
      Left = 428
      Top = 148
      Width = 163
      Height = 34
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 76
      Caption = ''
    end
    object Label9: TUniLabel
      Left = 433
      Top = 32
      Width = 6
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '2'
      TabOrder = 77
    end
    object Label10: TUniLabel
      Left = 282
      Top = 59
      Width = 6
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '3'
      TabOrder = 78
    end
    object Label11: TUniLabel
      Left = 433
      Top = 59
      Width = 6
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '4'
      TabOrder = 79
    end
    object Label12: TUniLabel
      Left = 282
      Top = 92
      Width = 6
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '5'
      TabOrder = 80
    end
    object Label13: TUniLabel
      Left = 433
      Top = 92
      Width = 6
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '6'
      TabOrder = 81
    end
    object Label14: TUniLabel
      Left = 282
      Top = 122
      Width = 6
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '7'
      TabOrder = 82
    end
    object Label15: TUniLabel
      Left = 433
      Top = 122
      Width = 6
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '8'
      TabOrder = 83
    end
    object Label16: TUniLabel
      Left = 282
      Top = 151
      Width = 6
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '9'
      TabOrder = 84
    end
    object Label17: TUniLabel
      Left = 433
      Top = 151
      Width = 12
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '10'
      TabOrder = 85
    end
    object Label18: TUniLabel
      Left = 282
      Top = 183
      Width = 12
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '11'
      TabOrder = 86
    end
    object Bevel36: TUniPanel
      Left = 428
      Top = 180
      Width = 163
      Height = 120
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 87
      Caption = ''
    end
    object Label20: TUniLabel
      Left = 282
      Top = 211
      Width = 12
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '13'
      TabOrder = 88
    end
    object Label21: TUniLabel
      Left = 282
      Top = 237
      Width = 12
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '14'
      TabOrder = 89
    end
    object Label23: TUniLabel
      Left = 154
      Top = 301
      Width = 12
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '16'
      TabOrder = 90
    end
    object Label24: TUniLabel
      Left = 242
      Top = 301
      Width = 12
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '17'
      TabOrder = 91
    end
    object Label25: TUniLabel
      Left = 323
      Top = 301
      Width = 12
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '18'
      TabOrder = 92
    end
    object Label26: TUniLabel
      Left = 414
      Top = 301
      Width = 12
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '19'
      TabOrder = 93
    end
    object Label27: TUniLabel
      Left = 501
      Top = 301
      Width = 12
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '20'
      TabOrder = 94
    end
    object Bevel28: TUniPanel
      Left = 1
      Top = 180
      Width = 281
      Height = 31
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 95
      Caption = ''
    end
    object Label28: TUniLabel
      Left = 5
      Top = 214
      Width = 4
      Height = 13
      Hint = ''
      Caption = 'f'
      TabOrder = 96
    end
    object sbSearchEmp: TUniSpeedButton
      Left = 205
      Top = 3
      Width = 25
      Height = 25
      Hint = 'Search employee... '
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
      OnClick = sbSearchEmpClick
    end
    object Bevel15: TUniPanel
      Left = 279
      Top = 209
      Width = 151
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      TabOrder = 98
      Caption = ''
    end
    object Label19: TUniLabel
      Left = 433
      Top = 187
      Width = 12
      Height = 13
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Caption = '12'
      TabOrder = 99
    end
    object edControlnumber: TUniDBEdit
      Left = 16
      Top = 5
      Width = 73
      Height = 21
      Hint = 'Control Number'
      ShowHint = True
      ParentShowHint = False
      DataField = 'CONTROL_NO'
      DataSource = SrcDetail
      TabOrder = 0
      OnEnter = grid13Enter
    end
    object editVoid: TUniDBCheckBox
      Left = 180
      Top = 7
      Width = 15
      Height = 17
      Hint = 'Void'
      ShowHint = True
      ParentShowHint = False
      DataField = 'VOID'
      DataSource = SrcDetail
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = ''
      TabOrder = 1
    end
    object ed15a: TUniDBCheckBox
      Left = 298
      Top = 213
      Width = 15
      Height = 17
      Hint = 'Statutory Employee'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX15A'
      DataSource = SrcDetail
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = ''
      TabOrder = 32
    end
    object ed15c: TUniDBCheckBox
      Left = 353
      Top = 213
      Width = 15
      Height = 17
      Hint = 'Retirement Plan'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX15B'
      DataSource = SrcDetail
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = ''
      TabOrder = 33
    end
    object ed15d: TUniDBCheckBox
      Left = 408
      Top = 213
      Width = 15
      Height = 17
      Hint = 'Third-party sick pay'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX15C'
      DataSource = SrcDetail
      ValueChecked = 'Y'
      ValueUnchecked = 'N'
      Caption = ''
      TabOrder = 34
    end
    object edEIN: TUniDBEdit
      Left = 16
      Top = 33
      Width = 121
      Height = 21
      Hint = 'Employer Identification number'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EIN'
      DataSource = SrcDetail
      TabOrder = 2
      OnEnter = grid13Enter
    end
    object editAddr1: TUniDBEdit
      Left = 16
      Top = 215
      Width = 257
      Height = 21
      Hint = 'Address1'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EMP_ADDR1'
      DataSource = SrcDetail
      TabOrder = 14
      OnEnter = grid13Enter
    end
    object editAddr2: TUniDBEdit
      Left = 16
      Top = 242
      Width = 257
      Height = 21
      Hint = 'Address2'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EMP_ADDR2'
      DataSource = SrcDetail
      TabOrder = 15
      OnEnter = grid13Enter
    end
    object editCity: TUniDBEdit
      Left = 16
      Top = 270
      Width = 141
      Height = 21
      Hint = 'City'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EMP_CITY'
      DataSource = SrcDetail
      TabOrder = 16
      OnEnter = grid13Enter
    end
    object editState: TUniDBEdit
      Left = 176
      Top = 270
      Width = 25
      Height = 21
      Hint = 'State'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EMP_STATE'
      DataSource = SrcDetail
      TabOrder = 17
      OnEnter = grid13Enter
    end
    object editZip: TUniDBEdit
      Left = 212
      Top = 270
      Width = 60
      Height = 21
      Hint = 'Zip'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EMP_ZIP'
      DataSource = SrcDetail
      TabOrder = 18
      OnEnter = grid13Enter
    end
    object editFName: TUniDBEdit
      Left = 16
      Top = 186
      Width = 118
      Height = 21
      Hint = 'First Name'
      ShowHint = True
      ParentShowHint = False
      DataField = 'FIRST_NAME'
      DataSource = SrcDetail
      TabOrder = 10
      OnEnter = grid13Enter
    end
    object editMName: TUniDBEdit
      Left = 137
      Top = 186
      Width = 20
      Height = 21
      Hint = 'Middle Initial'
      ShowHint = True
      ParentShowHint = False
      DataField = 'MIDDLE_INIT'
      DataSource = SrcDetail
      TabOrder = 11
      OnEnter = grid13Enter
    end
    object editLName: TUniDBEdit
      Left = 160
      Top = 186
      Width = 81
      Height = 21
      Hint = 'Last Name'
      ShowHint = True
      ParentShowHint = False
      DataField = 'LAST_NAME'
      DataSource = SrcDetail
      TabOrder = 12
      OnEnter = grid13Enter
    end
    object edEmpAddr1: TUniDBEdit
      Left = 16
      Top = 81
      Width = 257
      Height = 21
      Hint = 'Employers Address1'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EMPLOYERS_ADDR1'
      DataSource = SrcDetail
      TabOrder = 4
      OnEnter = grid13Enter
    end
    object edEmpAddr2: TUniDBEdit
      Left = 16
      Top = 102
      Width = 257
      Height = 21
      Hint = 'Employers Address2'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EMPLOYERS_ADDR2'
      DataSource = SrcDetail
      TabOrder = 5
      OnEnter = grid13Enter
    end
    object edEmpCity: TUniDBEdit
      Left = 16
      Top = 123
      Width = 141
      Height = 21
      Hint = 'Employers City'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EMPLOYERS_CITY'
      DataSource = SrcDetail
      TabOrder = 6
      OnEnter = grid13Enter
    end
    object edEmpState: TUniDBEdit
      Left = 176
      Top = 124
      Width = 25
      Height = 21
      Hint = 'Employers State'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EMPLOYERS_STATE'
      DataSource = SrcDetail
      TabOrder = 7
      OnEnter = grid13Enter
    end
    object edEmpZip: TUniDBEdit
      Left = 213
      Top = 124
      Width = 60
      Height = 21
      Hint = 'Employers Zip'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EMPLOYERS_ZIP'
      DataSource = SrcDetail
      TabOrder = 8
      OnEnter = grid13Enter
    end
    object edEmpName: TUniDBEdit
      Left = 16
      Top = 60
      Width = 257
      Height = 21
      Hint = 'Employers Name'
      ShowHint = True
      ParentShowHint = False
      DataField = 'EMPLOYERS_NAME'
      DataSource = SrcDetail
      TabOrder = 3
      OnEnter = grid13Enter
    end
    object editSSN: TUniDBEdit
      Left = 17
      Top = 155
      Width = 118
      Height = 21
      Hint = 'Social Security Number'
      ShowHint = True
      ParentShowHint = False
      DataField = 'SSNMBR'
      DataSource = SrcDetail
      TabOrder = 9
      OnEnter = grid13Enter
    end
    object ed1: TUniDBEdit
      Left = 298
      Top = 33
      Width = 125
      Height = 21
      Hint = 'Wages, tips, other compensation'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX1'
      DataSource = SrcDetail
      TabOrder = 19
      OnEnter = grid13Enter
    end
    object ed2: TUniDBEdit
      Left = 448
      Top = 33
      Width = 134
      Height = 21
      Hint = 'Federal income tax withheld'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX2'
      DataSource = SrcDetail
      TabOrder = 20
      OnEnter = grid13Enter
    end
    object ed3: TUniDBEdit
      Left = 298
      Top = 64
      Width = 125
      Height = 21
      Hint = 'Social security wages'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX3'
      DataSource = SrcDetail
      TabOrder = 21
      OnEnter = grid13Enter
    end
    object ed4: TUniDBEdit
      Left = 448
      Top = 64
      Width = 134
      Height = 21
      Hint = 'Social security tax withheld'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX4'
      DataSource = SrcDetail
      TabOrder = 22
      OnEnter = grid13Enter
    end
    object ed5: TUniDBEdit
      Left = 298
      Top = 95
      Width = 125
      Height = 21
      Hint = 'Medicare wages and tips'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX5'
      DataSource = SrcDetail
      TabOrder = 23
      OnEnter = grid13Enter
    end
    object ed6: TUniDBEdit
      Left = 448
      Top = 95
      Width = 134
      Height = 21
      Hint = 'Medicare tax withheld'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX6'
      DataSource = SrcDetail
      TabOrder = 24
      OnEnter = grid13Enter
    end
    object ed7: TUniDBEdit
      Left = 297
      Top = 125
      Width = 125
      Height = 21
      Hint = 'Social security tips'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX7'
      DataSource = SrcDetail
      TabOrder = 25
      OnEnter = grid13Enter
    end
    object ed8: TUniDBEdit
      Left = 448
      Top = 125
      Width = 134
      Height = 21
      Hint = 'Allocated tips'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX8'
      DataSource = SrcDetail
      TabOrder = 26
      OnEnter = grid13Enter
    end
    object ed9: TUniDBEdit
      Left = 297
      Top = 155
      Width = 125
      Height = 21
      Hint = 'Advanced EIC payment'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX9'
      DataSource = SrcDetail
      TabOrder = 27
      OnEnter = grid13Enter
    end
    object ed10: TUniDBEdit
      Left = 448
      Top = 155
      Width = 134
      Height = 21
      Hint = 'Dependant care benefits'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX10'
      DataSource = SrcDetail
      TabOrder = 28
      OnEnter = grid13Enter
    end
    object ed11: TUniDBEdit
      Left = 297
      Top = 186
      Width = 125
      Height = 21
      Hint = 'Nonqualified plans'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX11'
      DataSource = SrcDetail
      TabOrder = 29
      OnEnter = grid13Enter
    end
    object ed16state: TUniDBEdit
      Left = 25
      Top = 304
      Width = 35
      Height = 21
      Hint = 'Employers State'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX16_STATE'
      DataSource = SrcDetail
      TabOrder = 35
      OnEnter = grid13Enter
    end
    object ed17: TUniDBEdit
      Left = 168
      Top = 304
      Width = 67
      Height = 21
      Hint = 'State wages, tips, etc.'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX17'
      DataSource = SrcDetail
      TabOrder = 37
      OnEnter = grid13Enter
    end
    object ed18: TUniDBEdit
      Left = 255
      Top = 304
      Width = 63
      Height = 21
      Hint = 'State income tax'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX18'
      DataSource = SrcDetail
      TabOrder = 38
      OnEnter = grid13Enter
    end
    object ed19: TUniDBEdit
      Left = 516
      Top = 304
      Width = 65
      Height = 21
      Hint = 'Locality name'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX19'
      DataSource = SrcDetail
      TabOrder = 41
      OnEnter = grid13Enter
    end
    object ed20: TUniDBEdit
      Left = 337
      Top = 304
      Width = 70
      Height = 21
      Hint = 'Local wages, tips, etc.'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX20'
      DataSource = SrcDetail
      TabOrder = 39
      OnEnter = grid13Enter
    end
    object ed21: TUniDBEdit
      Left = 429
      Top = 304
      Width = 65
      Height = 21
      Hint = 'Local income tax'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX21'
      DataSource = SrcDetail
      TabOrder = 40
      OnEnter = grid13Enter
    end
    object ed14: TUniDBMemo
      Left = 298
      Top = 236
      Width = 124
      Height = 58
      Hint = 'Other'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX14'
      DataSource = SrcDetail
      TabOrder = 31
      OnEnter = grid13Enter
    end
    object grid13: TUniDBGrid
      Left = 450
      Top = 184
      Width = 132
      Height = 110
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcBox13
      Options = [dgEditing, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgTabs, dgCancelOnExit]
      LoadMask.Message = 'Loading data...'
      OnEnter = grid13Enter
      TabOrder = 30
      Columns = <
        item
          FieldName = 'BOX13_C'
          Title.Caption = 'Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BOX13_N'
          Title.Caption = 'Value'
          Width = 58
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
    object ed16id: TUniDBEdit
      Left = 81
      Top = 304
      Width = 62
      Height = 21
      Hint = 'Employers State ID'
      ShowHint = True
      ParentShowHint = False
      DataField = 'BOX16_ID'
      DataSource = SrcDetail
      TabOrder = 36
      OnEnter = grid13Enter
    end
    object NavDetail: TUniDBNavigator
      Left = 364
      Top = 3
      Width = 225
      Height = 25
      Hint = ''
      DataSource = SrcDetail
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      TabOrder = 42
    end
    object DBSuffix: TUniDBEdit
      Left = 243
      Top = 186
      Width = 35
      Height = 21
      Hint = 'Suffix'
      ShowHint = True
      ParentShowHint = False
      DataField = 'SUFFIX'
      DataSource = SrcDetail
      TabOrder = 13
      OnEnter = grid13Enter
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 104
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 590
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object SBSearch: TUniSpeedButton
        Left = 2
        Top = 1
        Width = 25
        Height = 25
        Hint = 'Search year... '
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
        OnClick = SBSearchClick
      end
      object DBNavigator1: TUniDBNavigator
        Left = 365
        Top = 1
        Width = 225
        Height = 25
        Hint = ''
        DataSource = SrcHeader
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object gridHeader: TUniDBGrid
      Left = 1
      Top = 27
      Width = 590
      Height = 77
      Hint = ''
      DataSource = SrcHeader
      LoadMask.Message = 'Loading data...'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Columns = <
        item
          FieldName = 'PRW2_YEAR_STRING'
          Title.Caption = 'Year'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 200
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'FedTaxId'
          Title.Caption = 'Fed Tax Id'
          Width = 124
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EMAIL'
          Title.Caption = 'Email Address'
          Width = 1504
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NAME'
          Title.Caption = 'Contact Name'
          Width = 184
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NOTIFICATION'
          Title.Caption = 'Preferred Method of Notification'
          Width = 159
          PickList.Strings = (
            '1'
            '2'
            '3'
            '4')
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PHONE'
          Title.Caption = 'Contact Phone#'
          Width = 154
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PHONE_EXT'
          Title.Caption = 'Contact Phone Ext.'
          Width = 98
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PIN'
          Title.Caption = 'PIN'
          Width = 106
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TLCN'
          Title.Caption = 'TLCN'
          Width = 40
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INCL_STATE_RS'
          Title.Caption = 'Include State RS Record'
          Width = 121
          PickList.Strings = (
            'Y'
            'N')
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 288
    Top = 1
    object File1: TUniMenuItem
      Caption = '&File'
      object Recalculate1: TUniMenuItem
        Caption = '&Recalculate Employee'
        OnClick = Recalculate1Click
      end
      object RecalculateYear1: TUniMenuItem
        Caption = 'Recalculate &Year'
        OnClick = RecalculateYear1Click
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object QuickAddEditBenefit1: TUniMenuItem
        Caption = 'Quick Add/Edit Benefit'
        OnClick = QuickAddEditBenefit1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrintSetUp1: TUniMenuItem
        Caption = '&Print &Setup'
        OnClick = PrintSetUp1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object W2reportfile1: TUniMenuItem
        Caption = 'W2 report file'
        object CustomSqlScript1: TUniMenuItem
          Caption = 'Custom Sql Script'
          OnClick = CustomSqlScript1Click
        end
        object ClearCustomSqlScript1: TUniMenuItem
          Caption = 'Clear Custom Sql Script'
          OnClick = ClearCustomSqlScript1Click
        end
        object CreateW2reportfile1: TUniMenuItem
          Caption = '&Create W2 report file'
          OnClick = CreateW2reportfile1Click
        end
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
    object Debug1: TUniMenuItem
      Caption = '&Debug'
      Visible = False
      object Show1: TUniMenuItem
        Caption = '&Show'
        OnClick = Show1Click
      end
      object Clear1: TUniMenuItem
        Caption = '&Clear'
        OnClick = Clear1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'W2'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192284 $'
    BuildVersion = '176554'
    Left = 256
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmW2'
    WebUse = False
    TouchScreen = False
    Left = 224
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 192
  end
  object tblHeader: TFDTable
    AfterInsert = tblHeaderAfterInsert
    BeforePost = tblHeaderBeforePost
    OnCalcFields = tblHeaderCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'PRW2_HEADER'
    TableName = 'PRW2_HEADER'
    Left = 152
    Top = 40
    object tblHeaderID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object tblHeaderPRW2_YEAR: TDateTimeField
      FieldName = 'PRW2_YEAR'
    end
    object tblHeaderDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblHeaderPRW2_YEAR_STRING: TStringField
      FieldName = 'PRW2_YEAR_STRING'
      Size = 4
    end
    object tblHeaderEIN_ID: TBCDField
      FieldName = 'EIN_ID'
      Size = 0
    end
    object tblHeaderEin: TStringField
      FieldKind = fkLookup
      FieldName = 'Ein'
      LookupDataSet = QryEin
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'EIN_ID'
      Lookup = True
    end
    object tblHeaderFedTaxId: TStringField
      FieldKind = fkCalculated
      FieldName = 'FedTaxId'
      Calculated = True
    end
    object tblHeaderPIN: TStringField
      FieldName = 'PIN'
      Size = 17
    end
    object tblHeaderNAME: TStringField
      FieldName = 'NAME'
      FixedChar = True
      Size = 30
    end
    object tblHeaderPHONE: TStringField
      FieldName = 'PHONE'
      Size = 25
    end
    object tblHeaderPHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Size = 10
    end
    object tblHeaderEMAIL: TStringField
      DisplayWidth = 250
      FieldName = 'EMAIL'
      Size = 255
    end
    object tblHeaderNOTIFICATION: TStringField
      FieldName = 'NOTIFICATION'
      Size = 1
    end
    object tblHeaderINCL_STATE_RS: TStringField
      FieldName = 'INCL_STATE_RS'
      FixedChar = True
      Size = 1
    end
    object tblHeaderTLCN: TStringField
      FieldName = 'TLCN'
      Size = 6
    end
  end
  object SrcHeader: TDataSource
    DataSet = tblHeader
    Left = 136
    Top = 40
  end
  object SrcDetail: TDataSource
    DataSet = tblDetail
    Left = 192
    Top = 40
  end
  object tblDetail: TFDTable
    BeforeInsert = tblDetailBeforeEdit
    BeforeEdit = tblDetailBeforeEdit
    BeforePost = tblDetailBeforePost
    IndexFieldNames = 'PRW2_HEADER_ID'
    MasterSource = SrcHeader
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PRW2_DETAIL'
    TableName = 'PRW2_DETAIL'
    Left = 208
    Top = 40
    object tblDetailID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object tblDetailPRW2_HEADER_ID: TBCDField
      FieldName = 'PRW2_HEADER_ID'
      Size = 0
    end
    object tblDetailPR_EMP_ID: TBCDField
      FieldName = 'PR_EMP_ID'
      Size = 0
    end
    object tblDetailCONTROL_NO: TStringField
      FieldName = 'CONTROL_NO'
      Size = 25
    end
    object tblDetailVOID: TStringField
      FieldName = 'VOID'
      Size = 1
    end
    object tblDetailEMPLOYERS_NAME: TStringField
      FieldName = 'EMPLOYERS_NAME'
      Size = 30
    end
    object tblDetailEMPLOYERS_ADDR1: TStringField
      FieldName = 'EMPLOYERS_ADDR1'
      Size = 60
    end
    object tblDetailEMPLOYERS_ADDR2: TStringField
      FieldName = 'EMPLOYERS_ADDR2'
      Size = 60
    end
    object tblDetailEMPLOYERS_CITY: TStringField
      FieldName = 'EMPLOYERS_CITY'
      Size = 30
    end
    object tblDetailEMPLOYERS_STATE: TStringField
      FieldName = 'EMPLOYERS_STATE'
    end
    object tblDetailEMPLOYERS_ZIP: TStringField
      FieldName = 'EMPLOYERS_ZIP'
      Size = 10
    end
    object tblDetailSSNMBR: TStringField
      FieldName = 'SSNMBR'
      Size = 11
    end
    object tblDetailFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object tblDetailMIDDLE_INIT: TStringField
      FieldName = 'MIDDLE_INIT'
      Size = 1
    end
    object tblDetailLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object tblDetailEMP_ADDR1: TStringField
      FieldName = 'EMP_ADDR1'
      Size = 60
    end
    object tblDetailEMP_ADDR2: TStringField
      FieldName = 'EMP_ADDR2'
      Size = 60
    end
    object tblDetailEMP_CITY: TStringField
      FieldName = 'EMP_CITY'
      Size = 30
    end
    object tblDetailEMP_STATE: TStringField
      FieldName = 'EMP_STATE'
    end
    object tblDetailEMP_ZIP: TStringField
      FieldName = 'EMP_ZIP'
      Size = 10
    end
    object tblDetailBOX1: TBCDField
      FieldName = 'BOX1'
      currency = True
      Size = 2
    end
    object tblDetailBOX2: TBCDField
      FieldName = 'BOX2'
      currency = True
      Size = 2
    end
    object tblDetailBOX3: TBCDField
      FieldName = 'BOX3'
      currency = True
      Size = 2
    end
    object tblDetailBOX4: TBCDField
      FieldName = 'BOX4'
      currency = True
      Size = 2
    end
    object tblDetailBOX5: TBCDField
      FieldName = 'BOX5'
      currency = True
      Size = 2
    end
    object tblDetailBOX6: TBCDField
      FieldName = 'BOX6'
      currency = True
      Size = 2
    end
    object tblDetailBOX7: TBCDField
      FieldName = 'BOX7'
      currency = True
      Size = 2
    end
    object tblDetailBOX8: TBCDField
      FieldName = 'BOX8'
      currency = True
      Size = 2
    end
    object tblDetailBOX9: TBCDField
      FieldName = 'BOX9'
      currency = True
      Size = 2
    end
    object tblDetailBOX10: TBCDField
      FieldName = 'BOX10'
      currency = True
      Size = 2
    end
    object tblDetailBOX11: TBCDField
      FieldName = 'BOX11'
      currency = True
      Size = 2
    end
    object tblDetailBOX12: TBCDField
      FieldName = 'BOX12'
      currency = True
      Size = 2
    end
    object tblDetailBOX14: TStringField
      FieldName = 'BOX14'
      Size = 250
    end
    object tblDetailBOX15A: TStringField
      FieldName = 'BOX15A'
      Size = 1
    end
    object tblDetailBOX15B: TStringField
      FieldName = 'BOX15B'
      Size = 1
    end
    object tblDetailBOX15C: TStringField
      FieldName = 'BOX15C'
      Size = 1
    end
    object tblDetailBOX15D: TStringField
      FieldName = 'BOX15D'
      Size = 1
    end
    object tblDetailBOX15E: TStringField
      FieldName = 'BOX15E'
      Size = 1
    end
    object tblDetailBOX16_STATE: TStringField
      FieldName = 'BOX16_STATE'
    end
    object tblDetailBOX17: TBCDField
      FieldName = 'BOX17'
      currency = True
      Size = 2
    end
    object tblDetailBOX18: TBCDField
      FieldName = 'BOX18'
      currency = True
      Size = 2
    end
    object tblDetailBOX19: TStringField
      FieldName = 'BOX19'
      Size = 10
    end
    object tblDetailBOX20: TBCDField
      FieldName = 'BOX20'
      currency = True
      Size = 2
    end
    object tblDetailBOX21: TBCDField
      FieldName = 'BOX21'
      currency = True
      Size = 2
    end
    object tblDetailEIN: TStringField
      FieldName = 'EIN'
      Size = 15
    end
    object tblDetailBOX16_ID: TStringField
      FieldName = 'BOX16_ID'
      Size = 15
    end
    object tblDetailPR_TAX_ID: TBCDField
      FieldName = 'PR_TAX_ID'
      Size = 0
    end
    object tblDetailSUFFIX: TStringField
      FieldName = 'SUFFIX'
      Size = 4
    end
  end
  object SrcBox13: TDataSource
    DataSet = tblBox13
    Left = 264
    Top = 40
  end
  object tblBox13: TFDTable
    BeforeInsert = tblDetailBeforeEdit
    BeforeEdit = tblDetailBeforeEdit
    BeforePost = tblDetailBeforePost
    IndexFieldNames = 'PRW2_DETAIL_ID'
    MasterSource = SrcDetail
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PRW2_BOX13'
    TableName = 'PRW2_BOX13'
    Left = 280
    Top = 40
    object tblBox13ID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object tblBox13PRW2_DETAIL_ID: TBCDField
      FieldName = 'PRW2_DETAIL_ID'
      Size = 0
    end
    object tblBox13BOX13_N: TBCDField
      FieldName = 'BOX13_N'
      currency = True
      Size = 2
    end
    object tblBox13BOX13_C: TStringField
      FieldName = 'BOX13_C'
      FixedChar = True
      Size = 2
    end
  end
  object PKYear: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct this_year as this_year,'
      '       To_char(this_year, '#39'YYYY'#39') as year'
      '  from v_emp_distinct_emp_year')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 320
    Top = 40
    object PKYearYEAR: TStringField
      DisplayLabel = 'Year'
      FieldName = 'YEAR'
      Size = 4
    end
  end
  object PKW2: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '          TO_Char(prW2_year, '#39'YYYY'#39') as year,'
      '          NVL(descrip, '#39' '#39') as descrip'
      '  from prW2_header')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 352
    Top = 40
    object PKW2ID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PKW2YEAR: TStringField
      DisplayLabel = 'Year'
      FieldName = 'YEAR'
      Size = 4
    end
    object PKW2DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
  object PkEmp: TIQWebHpick
    BeforeOpen = PkEmpBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       NVL(ssnmbr, '#39' '#39') as ssnmbr,'
      '       NVL(first_name, '#39' '#39') as first_name,'
      '       NVL(middle_init, '#39' '#39') as middle_init,'
      '       NVL(last_name, '#39' '#39') as last_name,'
      '       NVL(emp_addr1, '#39' '#39') as emp_addr1,'
      '       NVL(emp_addr2, '#39' '#39') as emp_addr2,'
      '       NVL(emp_city, '#39' '#39') as emp_city,'
      '       NVL(emp_state, '#39' '#39') as emp_state,'
      '       NVL(emp_zip, '#39' '#39') as emp_zip'
      '  from prw2_detail'
      ' where prw2_header_id = :nId'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 384
    Top = 40
    ParamData = <
      item
        Name = 'nId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkEmpID: TBCDField
      FieldName = 'ID'
      Origin = 'PRW2_DETAIL.ID'
      Visible = False
      Size = 0
    end
    object PkEmpSSNMBR: TStringField
      DisplayLabel = 'SSN'
      FieldName = 'SSNMBR'
      Origin = 'PRW2_DETAIL.SSNMBR'
      Size = 11
    end
    object PkEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'PRW2_DETAIL.FIRST_NAME'
      Size = 30
    end
    object PkEmpMIDDLE_INIT: TStringField
      DisplayLabel = 'Middle Init.'
      FieldName = 'MIDDLE_INIT'
      Origin = 'PRW2_DETAIL.MIDDLE_INIT'
      Size = 1
    end
    object PkEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'PRW2_DETAIL.LAST_NAME'
      Size = 30
    end
    object PkEmpEMP_ADDR1: TStringField
      DisplayLabel = 'Address1'
      FieldName = 'EMP_ADDR1'
      Origin = 'PRW2_DETAIL.EMP_ADDR1'
      Size = 60
    end
    object PkEmpEMP_ADDR2: TStringField
      DisplayLabel = 'Address2'
      FieldName = 'EMP_ADDR2'
      Origin = 'PRW2_DETAIL.EMP_ADDR2'
      Size = 60
    end
    object PkEmpEMP_CITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'EMP_CITY'
      Origin = 'PRW2_DETAIL.EMP_CITY'
      Size = 30
    end
    object PkEmpEMP_STATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'EMP_STATE'
      Origin = 'PRW2_DETAIL.EMP_STATE'
    end
    object PkEmpEMP_ZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'EMP_ZIP'
      Origin = 'PRW2_DETAIL.EMP_ZIP'
      Size = 10
    end
  end
  object QryInsertDetails: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into prw2_detail (prw2_header_id,'
      '                         pr_emp_id,'
      '                         void,'
      '                         ein,'
      '                         employers_name,'
      '                         employers_addr1,'
      '                         employers_addr2,'
      '                         employers_city,'
      '                         employers_state,'
      '                         employers_zip,'
      '                         ssnmbr,'
      '                         first_name,'
      '                         middle_init,'
      '                         last_name,'
      '                         emp_addr1,'
      '                         emp_addr2,'
      '                         emp_city,'
      '                         emp_state,'
      '                         emp_zip,'
      '                         box1,'
      '                         box2,'
      '                         box3,'
      '                         box4,'
      '                         box5,'
      '                         box6,'
      '                         box17,'
      '                         box18,'
      '                         box19,'
      '                         box20,'
      '                         box21,'
      '                         box15a,'
      '                         box15b,'
      '                         box15c,'
      '                         box15d,'
      '                         box15e,'
      '                         box9,'
      '                         pr_tax_id,'
      '                         local_pr_tax_id)'
      '                  select :nId,'
      '                         v.pr_emp_id,'
      '                         '#39'N'#39','
      '                         i.fed_id,'
      '                         i.company,'
      '                         i.address1,'
      '                         i.address2,'
      '                         i.city,'
      '                         i.state,'
      '                         i.zip,'
      '                         e.ssnmbr,'
      '                         e.first_name,'
      '                         SubStr(NVL(e.middle_name, '#39' '#39'), 1, 1),'
      '                         e.last_name,'
      '                         e.addr1,'
      '                         e.addr2,'
      '                         e.city,'
      '                         e.state,'
      '                         e.zip,'
      '                         v.field_1,'
      '                         v.field_2,'
      '                         v.field_3,'
      '                         v.field_4,'
      '                         v.field_5,'
      '                         v.field_6,'
      '                         v.field_17,'
      '                         v.field_18,'
      '                         v.field_19,'
      '                         v.field_20,'
      '                         v.field_21,'
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         v.field_9,'
      '                         v.pr_tax_id,'
      '                         v.loc_pr_tax_id'
      '                    from pr_emp e,'
      '                         iqsys i,'
      '                         v_emp_w2_report v'
      '                   where v.this_year = :This_year'
      '                     and v.pr_emp_id = e.id'
      ''
      '')
    Left = 424
    Top = 40
    ParamData = <
      item
        Name = 'nId'
        DataType = ftFloat
      end
      item
        Name = 'This_year'
        DataType = ftDateTime
      end>
  end
  object QryInsertDetailsEmp: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into prw2_detail (prw2_header_id,'
      '                         id,'
      '                         pr_emp_id,'
      '                         void,'
      '                         ein,'
      '                         employers_name,'
      '                         employers_addr1,'
      '                         employers_addr2,'
      '                         employers_city,'
      '                         employers_state,'
      '                         employers_zip,'
      '                         ssnmbr,'
      '                         first_name,'
      '                         middle_init,'
      '                         last_name,'
      '                         emp_addr1,'
      '                         emp_addr2,'
      '                         emp_city,'
      '                         emp_state,'
      '                         emp_zip,'
      '                         box1,'
      '                         box2,'
      '                         box3,'
      '                         box4,'
      '                         box5,'
      '                         box6,'
      '                         box17,'
      '                         box18,'
      '                         box19,'
      '                         box20,'
      '                         box21,'
      '                         box15a,'
      '                         box15b,'
      '                         box15c,'
      '                         box15d,'
      '                         box15e,'
      '                         suffix)'
      '                  select :nHeaderId,'
      '                         S_PRW2_DETAIL.NextVal,'
      '                         v.pr_emp_id,'
      '                         '#39'N'#39','
      '                         i.fed_id,'
      '                         i.company,'
      '                         i.address1,'
      '                         i.address2,'
      '                         i.city,'
      '                         i.state,'
      '                         i.zip,'
      '                         e.ssnmbr,'
      '                         e.first_name,'
      '                         SubStr(NVL(e.middle_name, '#39' '#39'), 1, 1),'
      '                         e.last_name,'
      '                         e.addr1,'
      '                         e.addr2,'
      '                         e.city,'
      '                         e.state,'
      '                         e.zip,'
      '                         v.field_1,'
      '                         v.field_2,'
      '                         v.field_3,'
      '                         v.field_4,'
      '                         v.field_5,'
      '                         v.field_6,'
      '                         v.field_17,'
      '                         v.field_18,'
      '                         v.field_19,'
      '                         v.field_20,'
      '                         v.field_21,'
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         e.suffix'
      '                    from pr_emp e,'
      '                         iqsys i,'
      '                         v_emp_w2_report v'
      '                   where v.this_year = :This_year'
      '                     and v.pr_emp_id = e.id'
      '                     and v.pr_emp_id = :nEmpId'
      ''
      ''
      '')
    Left = 504
    Top = 40
    ParamData = <
      item
        Name = 'nHeaderId'
        DataType = ftFloat
      end
      item
        Name = 'This_year'
        DataType = ftDateTime
      end
      item
        Name = 'nEmpId'
        DataType = ftFloat
      end>
  end
  object SaveDialog1: TSaveDialog
    FileName = 'W2REPORT'
    Left = 160
  end
  object IQTiming1: TIQWebTiming
    Left = 545
    Top = 44
  end
  object PKYearEin: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct v.this_year as this_year,'
      '       To_char(v.this_year, '#39'YYYY'#39') as year,'
      '       e.id as ein_id,'
      '       e.descrip as fed_tax_id'
      '  from v_emp_distinct_emp_year v,'
      '       ein e'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 320
    object StringField1: TStringField
      DisplayLabel = 'Year'
      DisplayWidth = 30
      FieldName = 'YEAR'
      Size = 4
    end
    object PKYearEinFED_TAX_ID: TStringField
      DisplayLabel = 'Fed Tax ID'
      FieldName = 'FED_TAX_ID'
      Size = 15
    end
    object PKYearEinEIN_ID: TBCDField
      FieldName = 'EIN_ID'
      Visible = False
      Size = 0
    end
  end
  object QryInsertDetailsEin: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into prw2_detail (prw2_header_id,'
      '                         pr_emp_id,'
      '                         void,'
      '                         ein,'
      '                         employers_name,'
      '                         employers_addr1,'
      '                         employers_addr2,'
      '                         employers_city,'
      '                         employers_state,'
      '                         employers_zip,'
      '                         ssnmbr,'
      '                         first_name,'
      '                         middle_init,'
      '                         last_name,'
      '                         emp_addr1,'
      '                         emp_addr2,'
      '                         emp_city,'
      '                         emp_state,'
      '                         emp_zip,'
      '                         box1,'
      '                         box2,'
      '                         box3,'
      '                         box4,'
      '                         box5,'
      '                         box6,'
      '                         box17,'
      '                         box18,'
      '                         box19,'
      '                         box20,'
      '                         box21,'
      '                         box15a,'
      '                         box15b,'
      '                         box15c,'
      '                         box15d,'
      '                         box15e,'
      '                         box9,'
      '                         pr_tax_id,'
      '                         local_pr_tax_id,'
      '                         suffix)'
      '                  select :nId,'
      '                         v.pr_emp_id,'
      '                         '#39'N'#39','
      '                         :fed_id,'
      '                         t.company,'
      '                         t.address1,'
      '                         t.address2,'
      '                         t.city,'
      '                         t.state,'
      '                         t.zip,'
      '                         e.ssnmbr,'
      '                         e.first_name,'
      '                         SubStr(NVL(e.middle_name, '#39' '#39'), 1, 1),'
      '                         e.last_name,'
      '                         e.addr1,'
      '                         e.addr2,'
      '                         e.city,'
      '                         e.state,'
      '                         e.zip,'
      '                         v.field_1,'
      '                         v.field_2,'
      '                         v.field_3,'
      '                         v.field_4,'
      '                         v.field_5,'
      '                         v.field_6,'
      '                         v.field_17,'
      '                         v.field_18,'
      '                         v.field_19,'
      '                         v.field_20,'
      '                         v.field_21,'
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         '#39'N'#39','
      '                         v.field_9,'
      '                         v.pr_tax_id,'
      '                         v.loc_pr_tax_id,'
      '                         e.suffix'
      '                    from pr_emp e,'
      '                         pr_paygroup g,'
      '                         eplant t,'
      '                         (select q.pr_emp_id,'
      '                             q.this_year,'
      '                             p.totalpay,'
      '                             d.totaldeductions,'
      '                             fwt_f1.grosstotax as field_1,'
      '                             fwt.totalfwt as field_2,'
      '                             f.grosstotax as field_3,'
      '                             f.fica_withheld as field_4,'
      '                             m.grosstotax as field_5,'
      '                             m.mcare_withheld as field_6,'
      
        '                             NVL(p.totalpay, 0) - NVL(sd.totalde' +
        'ductions, 0) as field_17,'
      '                             swt.swt_withheld as field_18,'
      '                             loc.tax_code as field_19,'
      '                             loc.grosstotax as field_20,'
      '                             loc.local_withheld as field_21,'
      '                             eic.totaleic as field_9,'
      '                             swt.pr_tax_id,'
      '                             loc.pr_tax_id as loc_pr_tax_id'
      '                        from v_emp_distinct_emp_year q,'
      '                             v_emp_totpay_by_emp_year p,'
      '                             v_emp_totdeduct_empyear_no_fwt d,'
      '                             v_emp_totdeduct_empyear_no_swt sd,'
      '                             v_emp_gross_tax_mcare_empyear m,'
      '                             v_emp_gross_tax_fica_empyear f,'
      '                             v_emp_total_fwt_by_emp_year fwt,'
      '                             v_emp_gross_tax_swt_empyear swt,'
      '                             v_emp_gross_tax_local_empyear loc,'
      '                             v_emp_total_eic_by_emp_year eic,'
      '                             v_emp_gross_tax_FWT_empyear fwt_f1'
      '                       where p.pr_emp_id = q.pr_emp_id'
      '                         and p.this_year = q.this_year'
      '                         and d.pr_emp_id = q.pr_emp_id'
      '                         and sd.pr_emp_id = q.pr_emp_id'
      '                         and d.this_year = q.this_year'
      '                         and sd.this_year = q.this_year'
      '                         and m.pr_emp_id = q.pr_emp_id'
      '                         and m.this_year = q.this_year'
      '                         and f.pr_emp_id = q.pr_emp_id'
      '                         and f.this_year = q.this_year'
      '                         and fwt.pr_emp_id = q.pr_emp_id'
      '                         and fwt.this_year = q.this_year'
      '                         and swt.pr_emp_id = q.pr_emp_id'
      '                         and swt.this_year = q.this_year'
      '                         and loc.pr_emp_id(+) = q.pr_emp_id'
      '                         and loc.this_year(+) = q.this_year'
      '                         and eic.pr_emp_id = q.pr_emp_id'
      '                         and eic.this_year = q.this_year'
      '                         and fwt_f1.pr_emp_id = q.pr_emp_id '
      '                         and fwt_f1.this_year = q.this_year '
      '                         and q.ein_id = :AEin_Id2'
      '                         and p.ein_id(+) = :AEin_Id3'
      '                         and d.ein_id(+) = :AEin_Id4'
      '                         and sd.ein_id(+) = :AEin_Id5'
      '                         and m.ein_id(+) = :AEin_Id6'
      '                         and f.ein_id(+) = :AEin_Id7'
      '                         and fwt.ein_id(+) = :AEin_Id8'
      '                         and swt.ein_id(+) = :AEin_Id9'
      '                         and loc.ein_id(+) = :AEin_Id10'
      '                         and eic.ein_id(+) = :AEin_Id11'
      
        '                         and fwt_f1.ein_id(+) = :AEin_Id12      ' +
        '                                    '
      '                         ) v'
      '                   where v.this_year = :This_year'
      '                     and v.pr_emp_id = e.id'
      '                     and e.pr_paygroup_id = g.id'
      '                     and g.ein_id = :Aein_id'
      '                     and g.eplant_id = t.id'
      ''
      ''
      ' ')
    Left = 464
    Top = 40
    ParamData = <
      item
        Name = 'nId'
        DataType = ftFloat
      end
      item
        Name = 'fed_id'
        DataType = ftString
      end
      item
        Name = 'AEin_Id2'
        DataType = ftFloat
      end
      item
        Name = 'AEin_Id3'
        DataType = ftFloat
      end
      item
        Name = 'AEin_Id4'
        DataType = ftFloat
      end
      item
        Name = 'AEin_Id5'
        DataType = ftFloat
      end
      item
        Name = 'AEin_Id6'
        DataType = ftFloat
      end
      item
        Name = 'AEin_Id7'
        DataType = ftFloat
      end
      item
        Name = 'AEin_Id8'
        DataType = ftFloat
      end
      item
        Name = 'AEin_Id9'
        DataType = ftFloat
      end
      item
        Name = 'AEin_Id10'
        DataType = ftFloat
      end
      item
        Name = 'AEin_Id11'
        DataType = ftFloat
      end
      item
        Name = 'AEin_Id12'
        DataType = ftFloat
      end
      item
        Name = 'This_year'
        DataType = ftDateTime
      end
      item
        Name = 'Aein_id'
        DataType = ftFloat
      end>
  end
  object QryEin: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, descrip from ein')
    Left = 92
    Top = 41
  end
  object OpenDialogScript: TOpenDialog
    DefaultExt = 'sql'
    FileName = 'W2_Output.sql'
    Filter = 'SQL|*.sql|any file|*.*'
    Title = 'Load Sql Script'
    Left = 236
    Top = 57
  end
  object PkRSState: TIQWebHpick
    BeforeOpen = PkRSStateBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct box16_state as state '
      '  from PRW2_DETAIL'
      ' where PRW2_HEADER_ID = :AID '
      '   and box16_state is not null'
      '  ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 56
    Top = 40
    ParamData = <
      item
        Name = 'AID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkRSStateSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'IQ.PRW2_DETAIL.BOX16_STATE'
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMW2')
    SecurityCode = 'FRMW2'
    Left = 304
    Top = 115
  end
end

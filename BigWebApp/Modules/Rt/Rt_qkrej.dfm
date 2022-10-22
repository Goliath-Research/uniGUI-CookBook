object RTQuickReject: TRTQuickReject
  Left = 26
  Top = 116
  ClientHeight = 540
  ClientWidth = 982
  Caption = 'RT Quick Machine Reject'
  OnShow = FormShow
  OnResize = FormResize
  WindowState = wsMaximized
  OldCreateOrder = True
  OnClose = FormClose
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  Font.Charset = ANSI_CHARSET
  Font.Height = -13
  Font.Style = [fsBold]
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 982
    Height = 540
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 525
      Top = 1
      Width = 6
      Height = 538
      Hint = ''
      Align = alRight
      ParentColor = False
      Color = clBtnFace
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 1
      Width = 524
      Height = 538
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 1
        Top = 261
        Width = 522
        Height = 3
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object PnlProduction: TUniPanel
        Left = 1
        Top = 1
        Width = 522
        Height = 260
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object PnlNavProd: TUniPanel
          Left = 1
          Top = 1
          Width = 520
          Height = 41
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Alignment = taLeftJustify
          Caption = ''
          DesignSize = (
            520
            41)
          object sbtnCurrentWorkCenterOnly: TUniSpeedButton
            Left = 1
            Top = 2
            Width = 39
            Height = 39
            Hint = 'Current Work Center Only'
            ShowHint = True
            ParentShowHint = False
            GroupIndex = 1
            Down = True
            Glyph.Data = {
              C6050000424DC605000000000000360400002800000014000000140000000100
              0800000000009001000000000000000000000001000000010000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A600808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
              FF0027272700292929002E2E2E00BBBBBB000707070008080800090909000A0A
              0A000B0B0B000C0C0C000D0D0D000E0E0E000F0F0F0010101000111111001212
              1200131313001414140015151500161616001717170018181800191919001A1A
              1A001B1B1B001C1C1C001D1D1D001E1E1E001F1F1F0020202000212121002222
              220023232300242424002525250026262600303030002828280000FF00002A2A
              2A002B2B2B002C2C2C002D2D2D00B2B2B200B4B4B40000FFFF00313131003232
              3200333333003434340035353500BFBFBF003737370038383800393939003A3A
              3A003B3B3B003C3C3C003D3D3D003E3E3E003F3F3F0040404000414141004242
              42004343430044444400454545004646460047474700494949004A4A4A004B4B
              4B004C4C4C004D4D4D004E4E4E004F4F4F005050500051515100525252005353
              53005454540055555500565656005757570058585800595959005A5A5A005B5B
              5B005C5C5C005D5D5D005E5E5E005F5F5F006060600061616100626262006363
              63006464640065656500666666006767670068686800696969006A6A6A006B6B
              6B006C6C6C006D6D6D006E6E6E006F6F6F007171710072727200737373007474
              740075757500767676007777770078787800797979007A7A7A007B7B7B007C7C
              7C007D7D7D007E7E7E007F7F7F00818181008282820083838300848484008585
              8500868686008787870088888800898989008A8A8A008B8B8B008C8C8C008D8D
              8D008E8E8E008F8F8F0090909000919191009292920093939300949494009595
              9500969696009797970098989800999999009A9A9A009B9B9B009C9C9C009D9D
              9D009E9E9E009F9F9F00A0A0A000A1A1A100A2A2A200A3A3A300A4A4A400A5A5
              A500A6A6A600A7A7A700A8A8A800A9A9A900AAAAAA00ABABAB00ACACAC00ADAD
              AD00AEAEAE00AFAFAF00B0B0B000B1B1B100B8B8B800B3B3B300FF000000B5B5
              B500B6B6B600B7B7B700B9B9B900E7E7E700BABABA00FF00FF00BCBCBC00BDBD
              BD00BEBEBE00E8E8E800C1C1C100C2C2C200C3C3C300C4C4C400C5C5C500C6C6
              C600C7C7C700C8C8C800C9C9C900CACACA00CBCBCB00CCCCCC00CDCDCD00CECE
              CE00CFCFCF004848480070707000D0D0D000D1D1D100D2D2D200D3D3D300D4D4
              D400D5D5D500D6D6D600D7D7D700D8D8D800D9D9D900DADADA00DBDBDB00DCDC
              DC00DDDDDD00DEDEDE00DFDFDF00E0E0E000E1E1E100E2E2E200E3E3E300E4E4
              E400E5E5E500E6E6E6002F2F2F0036363600F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707000000
              0000000000000000000000070707070707000606060606000600060600060007
              0707000000000606060606000600060600060000000000060606060606060600
              0600060600060006060000000000000000000000060006060006000606000010
              101010101010100000000000000000060600001010000000000000000A0A0A0A
              0A0A000C0B0000101000070707070700000000000000000B0100001010000707
              070707000A070A070A0A00000000001010000000000000000A0D0D0D0D0A0007
              0707001010101010101010000D0D0D0D0A001100070700000000000000000000
              0D0D0D0A001111070007000D0D0D0D0D0D0D000D0D0D0A00000000000000000D
              0D0D0D0D0D0D0B0D0D0D0D0D0D0D000A07070000000000000D0D0D0D0D0D0D0D
              0D0D000A0707000303030303000D0D0D0D0D0D0D0D0D000A0707001111111111
              000000000000000000000A0707070A0011111111110007070707070707070707
              0707070000000000000A07070707070707070707070707070707070707070707
              07070707070707070707}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnCurrentWorkCenterOnlyClick
          end
          object sbtnAllWorkCenters: TUniSpeedButton
            Left = 40
            Top = 1
            Width = 39
            Height = 39
            Hint = 'All Work Centers for Current Production Date and Shift'
            ShowHint = True
            ParentShowHint = False
            GroupIndex = 1
            Glyph.Data = {
              C6050000424DC605000000000000360400002800000014000000140000000100
              0800000000009001000000000000000000000001000000010000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707000000
              0000000000000000000000070707070707000606060606000600060600060007
              0707000000000606060606000600060600060000000000060606060606060600
              06000606000600060600000000000000000000000600060600060006060000FE
              FEFEFEFEFEFEFE000000000000000006060000FEFE00000000000000A4A4A4A4
              A4A400FAF90000FEFE0007070707070000000000000000F9010000FEFE000707
              07070700A407A407A4A40000000000FEFE00000000000000A4FBFBFBFBA40007
              070700FEFEFEFEFEFEFEFE00FBFBFBFBA400FF000707000000FFFFFF00000000
              FBFBFBA400FFFF07000700FBFB0101FFFBFB00FBFBFBA40000000000000000FB
              FB0101FFFBFBF9FBFBFBFBFBFBFB00A40707FFFFFF0101FFFFFFFFFBFBFBFBFB
              FBFB00A407070101010101010101FFFBFBFBFBFBFBFB00A40707010101010101
              0101FF00000000000000A4070707A400FF0101FFFF0007070707070707070707
              07070700000101FF00A40707070707070707070707070707070101FF07070707
              07070707070707070707}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnAllWorkCentersClick
          end
          object sbtnAllProductionDatesAndShifts: TUniSpeedButton
            Left = 79
            Top = 1
            Width = 39
            Height = 39
            Hint = 'All Production Dates and Shifts for All Work Centers'
            ShowHint = True
            ParentShowHint = False
            GroupIndex = 1
            Glyph.Data = {
              C6050000424DC605000000000000360400002800000014000000140000000100
              0800000000009001000000000000000000000001000000010000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707000000
              0000000000000000000000070707070707000606060606000600060600060007
              0707000000000606060606000600060600060000000000060606060606060600
              06000606000600060600000000000000000000000600060600060006060000FE
              FEFEFEFEFEFEFE000000000000000006060000FEFE00000000000000A4A4A4A4
              A4A400FAF90000FEFE0007070707070000000000000000F9010000FEFE000707
              07070700A407A407A4A40000000000FEFE00000000000000A4FBFBFBFBA40007
              070700FEFEFEFEFEFEFEFE00FBFBFBFBA400FF000707000007FFFFFF00000000
              FBFB07FFFFFFFF07000700FB070101FFFBFB00FBFBFB070101FF0000000000FB
              070101FFFBFBF9FBFBFB070101FF00A40707FFFFFF0101FFFFFFFF07FFFFFF01
              01FFFFFFFF070101010101010101FF070101010101010101FF07010101010101
              0101FF070101010101010101FF070707070101FFFF0007070707070101FF0707
              07070700070101FF00A407070707070101FF070707070707070101FF07070707
              0707070101FF07070707}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnAllProductionDatesAndShiftsClick
          end
          object edtIllum_RT_ID: TUniEdit
            Left = 398
            Top = 12
            Width = 116
            Height = 24
            Hint = ''
            Visible = False
            Text = '0'
            Anchors = [akRight, akBottom]
            TabOrder = 1
            ReadOnly = True
            OnChange = edtIllum_RT_IDChange
          end
          object NavProd: TUniDBNavigator
            Left = 363
            Top = 1
            Width = 156
            Height = 39
            Hint = ''
            DataSource = SrcCurrentProductionDate
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
        object dbGridProductionDate: TUniDBGrid
          Left = 1
          Top = 42
          Width = 520
          Height = 217
          Hint = ''
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Height = -13
          TitleFont.Style = [fsBold]
          DataSource = SrcCurrentProductionDate
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTabs, dgCancelOnExit]
          LoadMask.Message = 'Loading data...'
          OnDblClick = dbGridProductionDateDblClick
          OnKeyDown = dbGridProductionDateKeyDown
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Columns = <
            item
              FieldName = 'PROD_DATE'
              Title.Caption = 'Production Date'
              Width = 64
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIFT'
              Title.Caption = 'Shift'
              Width = 138
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EQNO'
              Title.Caption = 'Work Center'
              Width = 102
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CNTR_DESC'
              Title.Caption = 'Work Center Description'
              Width = 178
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object Panel2: TUniPanel
        Left = 1
        Top = 264
        Width = 522
        Height = 273
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = 'Panel2'
        object dbGridParts: TUniDBGrid
          Left = 1
          Top = 42
          Width = 520
          Height = 230
          Hint = ''
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Height = -13
          TitleFont.Style = [fsBold]
          DataSource = SrcHist_illum_rt
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTabs, dgCancelOnExit]
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'ITEMNO'
              Title.Caption = 'Inventory Item #'
              Width = 64
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP'
              Title.Caption = 'Description'
              Width = 178
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'FG_LOTNO'
              Title.Caption = 'Lot #'
              Width = 71
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ACTCAV'
              Title.Caption = 'Act Cav'
              Width = 70
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'REV'
              Title.Caption = 'Rev '
              Width = 78
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DESCRIP2'
              Title.Caption = 'Ext Description '
              Width = 284
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        object PnlNavParts: TUniPanel
          Left = 1
          Top = 1
          Width = 520
          Height = 41
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = ''
          object NavParts: TUniDBNavigator
            Left = 363
            Top = 1
            Width = 156
            Height = 39
            Hint = ''
            DataSource = SrcHist_illum_rt
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
    object PnlEnterRejectQty2: TUniPanel
      Left = 531
      Top = 1
      Width = 450
      Height = 538
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter3: TUniSplitter
        Left = 1
        Top = 490
        Width = 448
        Height = 3
        Cursor = crVSplit
        Hint = ''
        Align = alBottom
        ParentColor = False
        Color = clBtnFace
      end
      object PnlRejects: TUniPanel
        Left = 1
        Top = 1
        Width = 448
        Height = 489
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object dbGridRejects: TUniDBGrid
          Left = 1
          Top = 42
          Width = 446
          Height = 446
          Hint = ''
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Height = -13
          TitleFont.Style = [fsBold]
          DataSource = SrcRejects
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTabs, dgCancelOnExit]
          ReadOnly = True
          LoadMask.Message = 'Loading data...'
          OnDblClick = btnChangeClick
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'REJECTS'
              Title.Caption = 'Rejects'
              Width = 64
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ATTRIBUTE'
              Title.Caption = 'Reason '
              Width = 129
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'PROD_DATE'
              Title.Caption = 'Date'
              Width = 148
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'CAVITY_NO'
              Title.Caption = 'Cavity #'
              Width = 84
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'COMMENT1'
              Title.Caption = 'Comment'
              Width = 2004
              Font.Charset = ANSI_CHARSET
              Font.Height = -13
              Font.Style = [fsBold]
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
        object PnlNavRejects: TUniPanel
          Left = 1
          Top = 1
          Width = 446
          Height = 41
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = ''
          object NavRejects: TUniDBNavigator
            Left = 289
            Top = 1
            Width = 156
            Height = 39
            Hint = ''
            DataSource = SrcRejects
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
      object pnlButtons: TUniPanel
        Left = 1
        Top = 493
        Width = 448
        Height = 44
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object btnNew: TUniBitBtn
          Left = 5
          Top = 1
          Width = 77
          Height = 39
          Hint = 'Add New Reject'
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          Caption = '&Add'
          TabOrder = 0
          OnClick = btnNewClick
        end
        object btnChange: TUniBitBtn
          Left = 82
          Top = 1
          Width = 77
          Height = 39
          Hint = 'Enter New Quantity and Reason'
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          Caption = '&Change'
          TabOrder = 1
          OnClick = btnChangeClick
        end
        object btnDelete: TUniBitBtn
          Left = 159
          Top = 1
          Width = 77
          Height = 39
          Hint = 'Delete Selected Reason'
          ParentShowHint = False
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            300033FFFFFF3333377739999993333333333777777F3333333F399999933333
            3300377777733333337733333333333333003333333333333377333333333333
            3333333333333333333F333333333333330033333F33333333773333C3333333
            330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
            333333377F33333333FF3333C333333330003333733333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          Caption = '&Delete'
          TabOrder = 2
          OnClick = btnDeleteClick
        end
        object btnClose: TUniBitBtn
          Left = 236
          Top = 1
          Width = 77
          Height = 39
          Hint = ''
          ParentShowHint = False
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
            F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
            000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
            338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
            45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
            3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
            F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
            000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
            338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
            4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
            8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
            333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
            0000}
          Caption = 'Close'
          TabOrder = 3
          OnClick = btnCloseClick
        end
      end
    end
  end
  object SrcHist_illum_rt: TDataSource
    DataSet = QryHist_Illum_rt
    OnDataChange = SrcHist_illum_rtDataChange
    Left = 106
    Top = 368
  end
  object QryHist_Illum_rt: TFDQuery
    MasterSource = SrcCurrentProductionDate
    MasterFields = 'ILLUM_RT_ID;PROD_DATE;SHIFT;MFGCELL;WHEN_COMPLETED'
    DetailFields = 'HIST_ILLUM_RT_ID;PROD_DATE;SHIFT;MFGCELL;WHEN_COMPLETED'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id,'
      '       a.class,            '
      '       a.itemno,'
      '       a.descrip,'
      '       a.descrip2,  '
      '       a.rev,  '
      '       a.actcav,'
      '       a.hist_illum_rt_id,'
      '       b.day_part_id,'
      '       v.xdayprod_id,'
      '       v.fg_lotno,'
      '       v.prod_date,'
      '       v.shift'
      '  from hist_illum_part a,'
      '       illum_part b,'
      '       ( select'
      '               hist_illum_rt_id,'
      '               fg_lotno,'
      '               prod_date,'
      '               shift,'
      '               xdayprod_id'
      '         from       '
      '               v_xdayprod_hist'
      '         where hist_illum_rt_id        = :illum_rt_id'
      '           and prod_date               = :prod_date'
      '           and shift                   = :shift'
      
        '           and NVL(RTrim(mfgcell),'#39'^'#39') = NVL(RTrim(:mfgcell),'#39'^'#39 +
        ')'
      '           and when_completed          = :when_completed ) v'
      '  '
      ' where a.hist_illum_rt_id = v.hist_illum_rt_id'
      '   and v.xdayprod_id = 0'
      '   and a.id = b.id'
      ''
      'UNION ALL'
      ''
      'select h.id,'
      '       h.class,'
      '       h.itemno,'
      '       h.descrip,'
      '       h.descrip2,  '
      '       h.rev,  '
      '       x.actcav,        '
      '       h.hist_illum_rt_id,'
      '       x.id as day_part_id,'
      '       v.xdayprod_id,'
      '       v.fg_lotno,'
      '       v.prod_date,'
      '       v.shift'
      '  from hist_illum_part h,'
      '       xday_part x,'
      '       ( select'
      '               hist_illum_rt_id,'
      '               fg_lotno,'
      '               prod_date,'
      '               shift,'
      '               xdayprod_id'
      '         from       '
      '               v_xdayprod_hist'
      '         where hist_illum_rt_id        = :illum_rt_id'
      '           and prod_date               = :prod_date'
      '           and shift                   = :shift'
      
        '           and NVL(RTrim(mfgcell),'#39'^'#39') = NVL(RTrim(:mfgcell),'#39'^'#39 +
        ')'
      '           and when_completed          = :when_completed ) v'
      '       '
      ' where '
      '       x.xdayprod_id = v.xdayprod_id and v.xdayprod_id > 0'
      '   and x.hist_illum_part_id = h.id'
      '   '
      ' ')
    Left = 107
    Top = 390
    ParamData = <
      item
        Name = 'illum_rt_id'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 554070000c
      end
      item
        Name = 'prod_date'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = 42389d
      end
      item
        Name = 'shift'
        DataType = ftFMTBcd
        NumericScale = 38
        ParamType = ptInput
        Size = 34
        Value = '1'
      end
      item
        Name = 'mfgcell'
        DataType = ftString
        ParamType = ptInput
        Size = 16
        Value = 'INJECTION'
      end
      item
        Name = 'when_completed'
        DataType = ftFMTBcd
        NumericScale = 38
        ParamType = ptInput
        Size = 34
        Value = '2'
      end>
    object QryHist_Illum_rtID: TBCDField
      FieldName = 'ID'
      Origin = 'HIST_ILLUM_PART.ID'
      Size = 0
    end
    object QryHist_Illum_rtCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'HIST_ILLUM_PART.CLASS'
      Size = 2
    end
    object QryHist_Illum_rtITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'HIST_ILLUM_PART.ITEMNO'
      Size = 50
    end
    object QryHist_Illum_rtDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'HIST_ILLUM_PART.DESCRIP'
      Size = 100
    end
    object QryHist_Illum_rtFG_LOTNO: TStringField
      FieldName = 'FG_LOTNO'
      FixedChar = True
      Size = 25
    end
    object QryHist_Illum_rtPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
    end
    object QryHist_Illum_rtSHIFT: TFMTBCDField
      FieldName = 'SHIFT'
      Size = 38
    end
    object QryHist_Illum_rtACTCAV: TFMTBCDField
      FieldName = 'ACTCAV'
      Size = 6
    end
    object QryHist_Illum_rtHIST_ILLUM_RT_ID: TBCDField
      FieldName = 'HIST_ILLUM_RT_ID'
      Size = 0
    end
    object QryHist_Illum_rtDAY_PART_ID: TBCDField
      FieldName = 'DAY_PART_ID'
      Size = 0
    end
    object QryHist_Illum_rtXDAYPROD_ID: TFMTBCDField
      FieldName = 'XDAYPROD_ID'
      Size = 38
    end
    object QryHist_Illum_rtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object QryHist_Illum_rtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
  end
  object SrcRejects: TDataSource
    DataSet = TblRejects
    OnDataChange = SrcRejectsDataChange
    Left = 479
    Top = 59
  end
  object TblRejects: TFDTable
    BeforePost = AssignIDBeforePost
    IndexFieldNames = 'HIST_ILLUM_PART_ID;PROD_DATE;SHIFT;FG_LOTNO'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'REJECTS'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'REJECTS'
    Left = 479
    Top = 72
    object TblRejectsID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object TblRejectsHIST_ILLUM_PART_ID: TBCDField
      FieldName = 'HIST_ILLUM_PART_ID'
      Size = 0
    end
    object TblRejectsPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
    end
    object TblRejectsSHIFT: TBCDField
      FieldName = 'SHIFT'
      Size = 0
    end
    object TblRejectsREJECTS: TBCDField
      FieldName = 'REJECTS'
    end
    object TblRejectsREJECT_CODE: TStringField
      FieldName = 'REJECT_CODE'
      Size = 5
    end
    object TblRejectsSOURCE: TStringField
      FieldName = 'SOURCE'
      Size = 2
    end
    object TblRejectsATTRIBUTE: TStringField
      DisplayLabel = 'Reason'
      FieldName = 'ATTRIBUTE'
      Size = 100
    end
    object TblRejectsFG_LOTNO: TStringField
      FieldName = 'FG_LOTNO'
      FixedChar = True
      Size = 25
    end
    object TblRejectsDAY_PART_ID: TBCDField
      FieldName = 'DAY_PART_ID'
      Size = 0
    end
    object TblRejectsCAVITY_NO: TStringField
      FieldName = 'CAVITY_NO'
      Size = 10
    end
    object TblRejectsCOMMENT1: TStringField
      DisplayLabel = 'Comment'
      FieldName = 'COMMENT1'
      Size = 250
    end
  end
  object SrcCurrentProductionDate: TDataSource
    DataSet = QryCurrentProductionDate
    OnDataChange = SrcCurrentProductionDateDataChange
    Left = 92
    Top = 52
  end
  object QryCurrentProductionDate: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select DISTINCT '
      '   comb.prod_date, '
      '   comb.shift, '
      '   HIST_ILLUM_RT.id as illum_rt_id,'
      '   HIST_ILLUM_RT.mfgcell, '
      '   HIST_ILLUM_RT.work_center_id,'
      '   hist_illum_rt.eqno,'
      '   comb.When_Completed '
      'from '
      '   v_xdayprod_combined comb, '
      '   HIST_ILLUM_RT,'
      '   v_mfgcell_param_all params'
      'where '
      '   comb.hist_illum_rt_id = HIST_ILLUM_RT.id '
      '   and comb.prod_date = params.prod_date'
      '   and comb.shift = params.prod_shift'
      '  '
      ' ')
    Left = 104
    Top = 68
    object QryCurrentProductionDatePROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
      Origin = 'V_XDAYPROD_DISTINCT.PROD_DATE'
    end
    object QryCurrentProductionDateSHIFT: TFMTBCDField
      FieldName = 'SHIFT'
      Origin = 'V_XDAYPROD_DISTINCT.SHIFT'
      Size = 38
    end
    object QryCurrentProductionDateMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Origin = 'V_XDAYPROD_DISTINCT.MFGCELL'
      Size = 15
    end
    object QryCurrentProductionDateWHEN_COMPLETED: TFMTBCDField
      FieldName = 'WHEN_COMPLETED'
      Origin = 'V_XDAYPROD_DISTINCT.WHEN_COMPLETED'
      Size = 38
    end
    object QryCurrentProductionDateWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Origin = 'HIST_ILLUM_RT.WORK_CENTER_ID'
      Size = 0
    end
    object QryCurrentProductionDateILLUM_RT_ID: TBCDField
      FieldName = 'ILLUM_RT_ID'
      Origin = 'HIST_ILLUM_RT.ID'
      Size = 0
    end
    object QryCurrentProductionDateEQNO: TStringField
      FieldName = 'EQNO'
      Origin = 'HIST_ILLUM_RT.EQNO'
      Size = 60
    end
  end
  object SD: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnNew'
      'btnChange'
      'btnDelete'
      'btnClose'
      'dbGridProductionDate')
    SecurityCode = 'RTQUICKREJECT'
    Left = 408
    Top = 96
  end
  object QryAllProductionDatesAndShifts: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select DISTINCT '
      '   comb.prod_date, '
      '   comb.shift, '
      '   HIST_ILLUM_RT.id as illum_rt_id,'
      '   HIST_ILLUM_RT.mfgcell, '
      '   HIST_ILLUM_RT.work_center_id,'
      '   hist_illum_rt.eqno,'
      '   comb.When_Completed '
      'from '
      '   v_xdayprod_combined comb, '
      '   HIST_ILLUM_RT '
      'where '
      '   comb.hist_illum_rt_id = HIST_ILLUM_RT.id ')
    Left = 200
    Top = 72
    object DateTimeField1: TDateTimeField
      FieldName = 'PROD_DATE'
      Origin = 'V_XDAYPROD_DISTINCT.PROD_DATE'
    end
    object FloatField1: TFMTBCDField
      FieldName = 'SHIFT'
      Origin = 'V_XDAYPROD_DISTINCT.SHIFT'
      Size = 38
    end
    object StringField1: TStringField
      FieldName = 'MFGCELL'
      Origin = 'V_XDAYPROD_DISTINCT.MFGCELL'
      Size = 15
    end
    object FloatField2: TFMTBCDField
      FieldName = 'WHEN_COMPLETED'
      Origin = 'V_XDAYPROD_DISTINCT.WHEN_COMPLETED'
      Size = 38
    end
    object FloatField3: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Origin = 'HIST_ILLUM_RT.WORK_CENTER_ID'
      Size = 0
    end
    object FloatField4: TBCDField
      FieldName = 'ILLUM_RT_ID'
      Origin = 'HIST_ILLUM_RT.ID'
      Size = 0
    end
    object StringField2: TStringField
      FieldName = 'EQNO'
      Origin = 'HIST_ILLUM_RT.EQNO'
      Size = 60
    end
  end
  object SrcAllProductionDatesAndShifts: TDataSource
    DataSet = QryAllProductionDatesAndShifts
    Left = 193
    Top = 49
  end
  object QryCurrentOnly: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select DISTINCT '
      '   comb.prod_date, '
      '   comb.shift, '
      '   HIST_ILLUM_RT.id as illum_rt_id,'
      '   HIST_ILLUM_RT.mfgcell, '
      '   HIST_ILLUM_RT.work_center_id,'
      '   hist_illum_rt.eqno,'
      '   comb.When_Completed,'
      
        '   (select cntr_desc from work_center where id = hist_illum_rt.w' +
        'ork_center_id) as cntr_desc'
      'from '
      '   v_xdayprod_combined comb, '
      '   HIST_ILLUM_RT,'
      '   -- params'
      '   v_mfgcell_param_all params'
      'where '
      '   comb.hist_illum_rt_id = HIST_ILLUM_RT.id '
      '   and comb.prod_date = params.prod_date'
      '   and comb.shift = params.prod_shift'
      '   and HIST_ILLUM_RT.id = :illum_rt_id'
      ' ')
    Left = 103
    Top = 125
    ParamData = <
      item
        Name = 'illum_rt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object DateTimeField2: TDateTimeField
      FieldName = 'PROD_DATE'
      Origin = 'V_XDAYPROD_DISTINCT.PROD_DATE'
    end
    object FloatField5: TFMTBCDField
      FieldName = 'SHIFT'
      Origin = 'V_XDAYPROD_DISTINCT.SHIFT'
      Size = 38
    end
    object StringField3: TStringField
      FieldName = 'MFGCELL'
      Origin = 'V_XDAYPROD_DISTINCT.MFGCELL'
      Size = 15
    end
    object FloatField6: TFMTBCDField
      FieldName = 'WHEN_COMPLETED'
      Origin = 'V_XDAYPROD_DISTINCT.WHEN_COMPLETED'
      Size = 38
    end
    object FloatField7: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Origin = 'HIST_ILLUM_RT.WORK_CENTER_ID'
      Size = 0
    end
    object FloatField8: TBCDField
      FieldName = 'ILLUM_RT_ID'
      Origin = 'HIST_ILLUM_RT.ID'
      Size = 0
    end
    object StringField4: TStringField
      FieldName = 'EQNO'
      Origin = 'HIST_ILLUM_RT.EQNO'
      Size = 60
    end
    object QryCurrentOnlyCNTR_DESC: TStringField
      DisplayLabel = 'Work Center Description'
      FieldName = 'CNTR_DESC'
      FixedChar = True
      Size = 250
    end
  end
  object SrcCurrentOnly: TDataSource
    DataSet = QryCurrentOnly
    OnDataChange = SrcCurrentProductionDateDataChange
    Left = 92
    Top = 108
  end
  object SrcReject_Code: TDataSource
    DataSet = TblReject_Code
    Left = 570
    Top = 188
  end
  object TblReject_Code: TFDTable
    Filtered = True
    Filter = 'PK_HIDE = NULL or PK_HIDE <> '#39'Y'#39
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'REJECT_CODE'
    TableName = 'REJECT_CODE'
    Left = 570
    Top = 200
    object TblReject_CodeREJECT_CODE: TStringField
      FieldName = 'REJECT_CODE'
      Required = True
      FixedChar = True
      Size = 5
    end
    object TblReject_CodeATTRIBUTE: TStringField
      FieldName = 'ATTRIBUTE'
      Size = 100
    end
    object TblReject_CodeEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object TblReject_CodeMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Size = 0
    end
    object TblReject_CodeID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblReject_CodePK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Size = 1
    end
    object TblReject_CodeCUSER1: TStringField
      FieldName = 'CUSER1'
      Size = 60
    end
    object TblReject_CodeCUSER2: TStringField
      FieldName = 'CUSER2'
      Size = 60
    end
    object TblReject_CodeACCT_ID_REJECT: TBCDField
      FieldName = 'ACCT_ID_REJECT'
      Size = 0
    end
    object TblReject_CodeNON_CONFORM_LOCATIONS_ID: TBCDField
      FieldName = 'NON_CONFORM_LOCATIONS_ID'
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'RTQuickReject'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 441
    Top = 97
  end
  object PopupMenu1: TUniPopupMenu
    Left = 302
    Top = 95
    object About1: TUniMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
end

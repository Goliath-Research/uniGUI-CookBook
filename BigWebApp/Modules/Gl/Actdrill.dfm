object FrmActDrillDown: TFrmActDrillDown
  Left = 230
  Top = 130
  HelpContext = 1022271
  Caption = 'Activity Drill Down'
  ClientHeight = 559
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  object Splitter1: TUniSplitter
    Left = 0
    Top = 224
    Width = 761
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 526
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 27
    Align = alTop
    TabOrder = 0
    object BtnDrillDown: TUniSpeedButton
      Left = 0
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Drill Down'
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        0800000000000002000000000000000000000001000000000000000000000000
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
        FDFD525BFDFDFDFDFDFDFDFDFDFDFDFDFDFDA4A4FFFDFDFDFDFDFDFDFDFDFDFD
        FD52EDA45BFDFDFDFDFDFDFDFDFDFDFDFDA4FFA4A4FFFDFDFDFDFDFDFDFDFDFD
        5208FFED525BFDFDFDFDFDFDFDFDFDFDA4FFFDFDA4A4FFFDFDFDFDFDFDFDFDFD
        52ED08FFED525BFDFDFDFDFDFDFDFDFDA4A4FFFDFDA4A4FFFDFDFDFDFDFDFDFD
        FD52ED08FF01525BFDFDFDFDFDFDFDFDFDA4A4FFFDA4A4A4FFFDFDFDFDFDFDFD
        FDFD5BEDFF01015BFDFDFDFDFDFDFDFDFDFDA4A4FFA4A4A4FFFDFDFDFDFDFDFD
        FDFD01151615015BFDFDFDFDFDFDFDFDFDFDA4A4A4A4A4A4FFFDFDFDFDFDFDFD
        FD52ED0708165D5DFDFDFDFDFDFDFDFDFDA4A4FDFDA4A4A4FDFDFDFDFDFDFDFD
        52ED0708FF5D5DFDFDFDFDFDFDFDFDFDA4A4FFFDFDA4A4FDFDFDFDFDFDFDFD00
        A45208FFFF5DFDFDFDFDFDFDFDFDFDA4A4A4FFFDFDA4FDFDFDFDFDFDFDFDFDA4
        ADA565FF65FDFDFDFDFDFDFDFDFDFDA4FFA4A4FFA4FDFDFDFDFDFDFDFDFDFD00
        AFAFA465FDFDFDFDFDFDFDFDFDFDFDA4FFFFA4A4FDFDFDFDFDFDFDFDFDFDFD9B
        005D65FDFDFDFDFDFDFDFDFDFDFDFDA4A4A4A4FDFDFDFDFDFDFDFDFDFDFD9BFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDA4FDFDFDFDFDFDFDFDFDFDFDFDFDFD9BFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDA4FDFDFDFDFDFDFDFDFDFDFDFDFDFD9BFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDA4FDFDFDFDFDFDFDFDFDFDFDFDFD}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnDrillDownClick
    end
    object sbtnPITDrillDown: TUniSpeedButton
      Left = 24
      Top = 1
      Width = 25
      Height = 25
      Hint = 'PIT Drill Down'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FF00FF9DBBA5
        65A676449A5A449A5A449A5A449A5A449A5A69A77965A676449A5A449A5A449A
        5A44876A43717D79AA8AFF00FFAFAFAF8B8B8B77777777777777777777777777
        77778D8D8D8B8B8B777777777777777777707070696969FF00FF95B89E4AA161
        89E3A4BFFDD1A1FBBDA0FBBCA0FBBCA0FBBC449A5A89E3A4BFFDD1A1FBBD86CA
        B246559A848DC7436983AAAAAA7E7E7EC1C1C1EEEEEEDADADAD9D9D9D9D9D9D9
        D9D9777777C1C1C1EEEEEEDADADAB6B6B66767679B9B9B6767675DA36F69E58D
        71F799D0FDDC71F79971F79971F79971F799449A5A71F799D0FDDC63C4994453
        99A1A9DECBD2FD435297868686BDBDBDCDCDCDFAFAFACDCDCDCDCDCDCDCDCDCD
        CDCD777777CDCDCDFAFAFAAAAAAA666666B6B6B6DCDCDC6565654C9D614CE578
        4DEA7ACCFCD94DEA7A5BD37778A37289866F897B6B75A7739BB3B44351999DA7
        E0CBD2FD43539844836D7C7C7CB8B8B8BCBCBCF9F9F9BCBCBCAFAFAF92929280
        8080777777949494B6B6B6656565B5B5B5DCDCDC6666666E6E6E4C9D613AD260
        39D560CAFAD663A866997E73CEBEB1EDE5DBF3EAE2DDCEC69D837A827A9BCBD2
        FD4354973CAF70449A5A7C7C7CA7A7A7AAAAAAF7F7F79292927E7E7EBDBDBDE3
        E3E3E9E9E9CECECE838383828282DCDCDC6666669393937777774C9D6129BA47
        27BC46BEE2C197796DD5C4A7EFE8D7F9F2E8FDF4ECFFF5EEF4EAE39B80764D58
        902EA05B27BC46449A5A7C7C7C939393949494DFDFDF797979C0C0C0E5E5E5F0
        F0F0F3F3F3F5F5F5E9E9E98080806666668484849494947777774C9D6126A83C
        90DB9E9EA78DB19570DBCAA9EDE4D1F6EFE4FCF4EBFDF5EEFCF5EDD4C6BD8F97
        877ED38D4DBC60479B5D7C7C7C878787CDCDCDA3A3A3919191C5C5C5E2E2E2EE
        EEEEF3F3F3F4F4F4F4F4F4C5C5C5959595C1C1C1A0A0A07979797DB28BA4E0B0
        48A759847C69C3A97EDCCBAAE8DFC9F1EADAF9F2E9FAF4EDF9F4EBE8DFD3857C
        6A449A5A449A5A5DA36F9D9D9DD5D5D5898989777777A3A3A3C6C6C6DCDCDCE8
        E8E8F1F1F1F3F3F3F3F3F3DEDEDE777777777777777777868686AFC2B460A572
        50B26B8F8975D5C1A1E7DAC5E9DFCAEBE2CFF0EBDBF6F1E8F6F0E7E4D9CA958D
        7BA0FBBCA0FBBC449A5ABABABA8888888B8B8B828282BDBDBDD8D8D8DCDCDCDF
        DFDFE9E9E9F0F0F0EFEFEFD7D7D7888888D9D9D9D9D9D9777777C9CBC9449C5B
        52E37C82B07FCBB69CEFE6D7F1EADDE7DBC3E1D2B5F0E9DBF4EFE3CCBBAB82B6
        8371F79971F799449A5ACACACA797979ACACAC999999B3B3B3E4E4E4E8E8E8D8
        D8D8CECECEE7E7E7ECECECB9B9B9A1A1A1CDCDCDCDCDCD7777778BB49542B45F
        43E16F9AE4AB9C8075E5D9C5EFE6D7E9DEC9D4BF97CAB180D9C9B0987C7254DF
        794DEA7A4DEA7A449A5AA3A3A3868686A2A2A2CDCDCD808080D6D6D6E4E4E4DB
        DBDBB9B9B9AAAAAAC7C7C77C7C7CB5B5B5BCBCBCBCBCBC777777439B5A31C454
        3FD362AFF3C063B16B9A7E73C4AE94CBB38EBDA176A98A6694766C5CB06539D5
        6039D56039D560449A5A787878878787979797E3E3E38F8F8F7E7E7EABABABAE
        AEAE9B9B9B878787767676969696AAAAAAAAAAAAAAAAAA77777741A25788DD9A
        ACEDBA76DD8D31CB553FC95F68A769808F6D7E8B6B61925EC4F1CD32C05027BC
        4627BC4627BC46449A5A7C7C7CC2C2C2DDDDDDB7B7B78E8E8E9292928A8A8A81
        81817E7E7E7E7E7EEDEDED9B9B9B949494949494949494777777439A5950B263
        5DC670A5E8B462CF7929BF492EC65034CB58439E5A87D396ADE9B9A2E4AF9EE2
        AB7ED38D4DBC60479B5D777777909090A2A2A2D8D8D8A8A8A88484848B8B8B92
        92927A7A7AC3C3C3E0E0E0D9D9D9D7D7D7C1C1C1A0A0A0797979BBC6BE81B08D
        3E9A54279E3C60C57193DFA23EBE5634AB4F70BA814BB4591197221197221997
        2B46A85852A8657FB08CC2C2C29C9C9C777777757575A5A5A5CACACA8F8F8F7D
        7D7DA2A2A29B9B9B7676767676767676768B8B8B8A8A8A9C9C9CFF00FFFF00FF
        ADC0B275AC83409A563C9E5054B067429B5872AB81449A5A449A5A449A5A5BA3
        6D85B291B3C3B7FF00FFFF00FFFF00FFB8B8B89595957777777B7B7B90909078
        78789494947777777777777777778585859F9F9FBCBCBCFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbtnPITDrillDownClick
    end
    object NavBatch: TUniDBNavigator
      Left = 660
      Top = 1
      Width = 100
      Height = 25
      DataSource = FrmActivity.SrcTblBatchId
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      TabOrder = 0
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 47
    Width = 761
    Height = 177
    Align = alTop
    TabOrder = 1
    UseTFields = True
    DataSource = FrmActivity.SrcTblBatchId
              Columns = <
                item
                  FieldName = 'BATCH_ID'
                  Title.Caption = 'GLBatchID ID'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'BATCH_DATE'
                  Title.Caption = 'Date'
                  Width = 42
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'BATCHNUMBER'
                  Title.Caption = 'Batch'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'SOURCE'
                  Title.Caption = 'Src'
                  Width = 14
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TOTAL_DEBIT'
                  Title.Caption = 'Debit'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'TOTAL_CREDIT'
                  Title.Caption = 'Credit'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'BALANCE'
                  Title.Caption = 'Batch Total'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'OnHand'
                  Title.Caption = 'Balance'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'USERID'
                  Title.Caption = 'UserID'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'RunningTotal'
                  Title.Caption = 'Running Balance'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end>
    AfterSortChange = IQSearch1AfterSortChange
    PopupMenu = PopupMenu1
  end
  object Panel3: TUniPanel
    Tag = 1999
    Left = 0
    Top = 27
    Width = 761
    Height = 20
    Align = alTop
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object LblAccount: TUniLabel
      Left = 3
      Top = 3
      Width = 202
      Height = 13
      Align = alLeft
      Caption = 'Transaction Summary for Account : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 227
    Width = 761
    Height = 20
    Align = alTop
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    object LblBatch: TUniLabel
      Left = 3
      Top = 3
      Width = 142
      Height = 13
      Align = alLeft
      Caption = 'Batch Detail for Account :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGridBatch: TIQUniGridControl
    Left = 0
    Top = 247
    Width = 761
    Height = 312
              Columns = <
                item
                  FieldName = 'DESCRIP'
                  Title.Caption = 'Description'
                  Width = 140
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DEBIT'
                  Title.Caption = 'Debit'
                  Width = 112
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'CREDIT'
                  Title.Caption = 'Credit'
                  Width = 112
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'REFERENCE'
                  Title.Caption = 'Reference'
                  Width = 140
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'REF_CODE'
                  Title.Caption = 'Ref Code'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'Cost_Source'
                  Title.Caption = 'Cost Source'
                  Width = 140
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'STAT_VALUE'
                  Title.Caption = 'Stat. Value'
                  Width = 112
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end>
    Align = alClient
    DataSource = FrmActivity.SrcTblBatch
    TabOrder = 4
    OnCalcTitleAttributes = DBGridBatchCalcTitleAttributes
  end
  object MainMenu1: TUniMainMenu
    Left = 304
    object File1: TUniMenuItem
      Caption = '&File'
      object Configure1: TUniMenuItem
        Caption = '&Configure'
        OnClick = Configure1Click
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
      object PrinterSetUp1: TUniMenuItem
        Caption = 'Printer &SetUp'
        OnClick = PrinterSetUp1Click
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
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Activity Drill Down'
    Version = 'DEV.181121'
    ChangeListNumber = '$Change: 197190 $'
    BuildVersion = '181121'
    Left = 336
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmActDrillDown'
    WebUse = False
    TouchScreen = False
    Left = 272
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 240
  end
  object PopupMenu1: TUniPopupMenu
    Left = 232
    Top = 104
    object DocumentAccess1: TUniMenuItem
      Caption = 'Batch Access'
      OnClick = DocumentAccess1Click
    end
  end
  object PopupMenu2: TUniPopupMenu
    Left = 232
    Top = 232
    object BatchAccess1: TUniMenuItem
      Caption = 'Drill Down'
      OnClick = BtnDrillDownClick
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object CostSource1: TUniMenuItem
      Caption = 'Cost Source'
      object ProjectManager1: TUniMenuItem
        Caption = 'Project Manager'
      end
      object PreventativeMaintenance1: TUniMenuItem
        Caption = 'MRO'
      end
      object FixedAssets1: TUniMenuItem
        Caption = 'Fixed Assets'
      end
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMACTDRILLDOWN')
    SecurityCode = 'FRMACTDRILLDOWN'
    Left = 280
    Top = 111
  end
end

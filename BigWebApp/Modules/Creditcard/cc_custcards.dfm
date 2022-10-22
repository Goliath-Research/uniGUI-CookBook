object FrmCustCredCard: TFrmCustCredCard
  Left = 385
  Top = 216
  HelpContext = 5663
  ClientHeight = 234
  ClientWidth = 363
  Caption = 'Customer Credit Cards'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnCreditCards: TUniSpeedButton
      Left = 26
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Accepted Credit Cards'
      ShowHint = True
      ParentShowHint = False
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FD0000000000
        00000000000000FDFDFDFDA4A4A4A4A4A4A4A4A4A4A4A4FDFDFD0007070707FF
        FFFFFFFFFFFF00FDFDFDA4FFFDFFFDFDFDFFFFFFFFFFA4FDFDFD0007000007FF
        0707070707FF00FDFDFDA4FFA4A4FDFDA4A4A4A4A4FDA4FDFDFD0007070707FF
        FFFFFFFFFFFF00FDFDFDA4FFFDFFFDFDFDFFFFFFFFFFA4FDFDFD0007000007FF
        0707070707FF00FDFDFDA4FFA4A4FDFDA4A4A4A4A4FDA4FDFDFD0007070707FF
        FFFFFFFFFFFF00FDFDFDA4FFFFFFFFFFFFFFFFFFFFFFA4FDFDFD000000000000
        00000000000000FDFDFDA4A4A4A4A4A4A4A4A4A4A4A4A4FFFDFDFDFDA4FFFFFF
        26262626FFFFA4A4FDFDFDFDA4FFFDFDFDFDFDFDFDFDA4A4FFFFFDFDA4FF04FF
        FFFF26262626FFFFA4A4FDFDA4FFFDFDFDFDFDFDFDFDFDFDA4A4FDA4FF040404
        FFFFFFFF26262626FFA4FDA4FFFDFDFDFDFDFDFDFDFDFDFDFDA4FDA4FFFF0404
        0404FFFFFFFF2626A4A4FDA4FFFFFDFDFDFDFDFDFDFDFDFDA4A4FDFDA4A4FFFF
        04040404FFFFFFFFA4FDFDFDA4A4FFFFFDFDFDFDFDFDFDFDA4FDFDFDFDFDA4A4
        FFFF04040404FFA4FDFDFDFDFDFDA4A4FFFFFDFDFDFDFDA4FDFDFDFDFDFDFDFD
        A4A4FFFF0404FFA4FDFDFDFDFDFDFDFDA4A4FFFFFDFDFDA4FDFDFDFDFDFDFDFD
        FDFDA4A4FFFFA4FDFDFDFDFDFDFDFDFDFDFDA4A4FFFFA4FDFDFDFDFDFDFDFDFD
        FDFDFDFDA4A4FDFDFDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = DoAcceptedCreditCardsClick
    end
    object sbtnTableForm: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Toggle Table / Form View'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000A0860100A08601000001000000000000000000001212
        1200282828003E3E3E006A6A6A006F6F6F00800000008B09020097130300A21C
        0500AA230600AD250700B52C0800B92F0900C0340A00C4380A00CA3D0B00CF41
        0C00D5460D00D8511900DA5A2400DD663100E06E3A00E37C4900E5825000F08C
        6800E9916100EA966700EFAB7E00FF00FF00808080008A8A8A008F8F8F009494
        9400999999009F9F9F00A4A4A400A9A9A900ADADAD00AEAEAE00B0B0B000B3B3
        B300B4B4B400B7B7B700B8B8B800BABABA00BDBDBD00F4BF9400FAD3AA00C0C0
        C000C2C2C200C3C3C300C6C6C600C8C8C800C9C9C900CDCDCD00E0E0E000F9F9
        FB00FFFFFF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001D1D1D1D0505
        050505050505050505051D1D1D1D0505050505050505050505051D1D1D1D1E2C
        29272524232221201F051D1D1D1D1E2C29272524232221201F051D1D1D1D1E2E
        2C2927250302010020051D1D1D1D1E2E2C2927250302010020051D1D1D1D1E32
        2E2C29271E3A3A0021051D1D1D1D1E322E2C29271E3A3A0021051D1D1D1D1E35
        2A2004291E1E1E1E22051D1D1D1D1E352A2004291E1E1E1E22051D1D1D1D1E37
        35322E2C2927252423051D1D1D1D1E3735322E2C2927252423051E1E1E1E1A17
        1513110F0D0B090807061E1E1E1E211E050403030303030202021E3838381A19
        191919191919191919061E3838382120202020202020202020021E3939391A17
        1513110F0D0B090807061E393939211E050403030303030202021E393331392D
        2B392826391E1D1D1D1D1E393331392D2B392826391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D1E3936343931
        2E392B2A391E1D1D1D1D1E39363439312E392B2A391E1D1D1D1D1E3939393939
        39393939391E1D1D1D1D1E393939393939393939391E1D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D301919191919
        19191919190A1D1D1D1D3720202020202020202020031D1D1D1D302F1C1B1816
        1412100E0C0A1D1D1D1D372E25211E050404030303031D1D1D1D}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnTableFormClick
    end
    object sbtnValidate: TUniSpeedButton
      Left = 56
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Validate card'
      ShowHint = True
      ParentShowHint = False
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
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFD00FD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDA4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD00FD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDA4FDFDFDFDFDFDFDFDFDFDFDFDFDFD00FDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDA4FDFDFDFDFDFDFDFDFDFDFDFDFDFDFD0000FD
        FDFDFDFDFDFDFDFDFDFDFDFDFDA4A4FDFDFDFDFDFDFDFDFDFDFDFDFD00F900A4
        A40000000000000000FDFDFDA4FFA4A4A4FFA4A4A4A4A4A4A4FDFDFD00F90100
        00BFBFBFBFBFBFBFFF00FDFDA4FFA4A4A4FFFFFFFFFFFFFFFFA4FD00F90101F9
        01A42F2F2F2F2F2FBF00FDA4FFA4A4FFA4A4FFA4A4A4A4A4FFA4FD00F901F901
        0101003737373737BF00FDA4FFA4FFA4A4A4A4FFA4A4A4A4FFA400F90000F901
        00000000FFFFFFFFFF00A4FFA4A4FFA4A4A4A4A4FFFDFDFDFDA40000FDA40000
        FFFFFFFFFFFFFFFFFF00A4A4FDA4A4A4FFFFFFFFFFFFFFFFFFA4FDFDFDA40990
        90909090909090900900FDFDFDA4FFA4A4A4A4A4A4A4A4A4FFA4FDFDFDA40990
        90909090909090900900FDFDFDA4FFA4A4A4A4A4A4A4A4A4FDA4FDFDFDA4FF09
        0909090909090909FF00FDFDFDA4FFFFFFFFFFFFFFFFFFFFFFA4FDFDFDFDA4A4
        A4A4A4A4A4A4A4A4A4FDFDFDFDFDA4A4A4A4A4A4A4A4A4A4A4FDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
        FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnValidateClick
    end
    object Bevel2: TUniPanel
      Left = 53
      Top = 3
      Width = 2
      Height = 21
      Hint = ''
      TabOrder = 5
      Caption = ''
    end
    object sbtnTokenize: TUniSpeedButton
      Left = 81
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Tokenize current Credit Card'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004080004080
        0040800040800040800040800040800040800040800040800040800040800040
        8000408000408000408052525252525252525252525252525252525252525252
        5252525252525252525252525252525252525252525252525252004080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF004080525252FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF525252004080FFFFFF
        66B6FF3A0000FFDB900066B63A0000FFDB9066B6FF3A0000FFDB900066B63A00
        00FFDB90FFFFFF004080525252FFFFFFC7C7C7080808D1D1D17B7B7B080808D1
        D1D1C7C7C7080808D1D1D17B7B7B080808D1D1D1FFFFFF525252004080FFFFFF
        DBFFFFB69090DBFFFFB69090B6FFFFFFB6B6DBFFFFB69090DBFFFFB69090B6FF
        FFFFB6B6FFFFFF004080525252FFFFFFFDFDFD939393FDFDFD939393FCFCFCBC
        BCBCFDFDFD939393FDFDFD939393FCFCFCBCBCBCFFFFFF525252004080FFFFFF
        3A90DBB66600FFFFFF0066B6000000FFB6663A90DBB66600FFFFFF0066B60000
        00FFB666FFFFFF004080525252FFFFFFA2A2A2626262FFFFFF7B7B7B000000AF
        AFAFA2A2A2626262FFFFFF7B7B7B000000AFAFAFFFFFFF525252004080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF004080525252FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF525252004080004080
        0040800040800040800040800040800040800040800040800040800040800040
        8000408000408000408052525252525252525252525252525252525252525252
        5252525252525252525252525252525252525252525252525252FF00FF808080
        80E0E000A0E000A0E000A0E000A0E000A0E000A0E000A0E000A0E000A0E080E0
        E0000000FF00FFFF00FFFF00FF808080DCDCDCADADADADADADADADADADADADAD
        ADADADADADADADADADADADADADADDCDCDC000000FF00FFFF00FFFF00FF808080
        00C0E000C0E000C0E000C0E000C0E000C0E000C0E000C0E000C0E000C0E080E0
        E0000000FF00FFFF00FFFF00FF808080C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
        C3C3C3C3C3C3C3C3C3C3C3C3C3C3DCDCDC000000FF00FFFF00FFFF00FF808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000FF00FFFF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000FF00FFFF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF808080
        F0CAA6804000804000804000804000804000804000804000804000804000F0CA
        A6000000FF00FFFF00FFFF00FF808080C5C5C53F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3FC5C5C5000000FF00FFFF00FFFF00FF808080
        F0CAA6804000804000804000804000804000804000804000804000804000F0CA
        A6000000FF00FFFF00FFFF00FF808080C5C5C53F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3F3FC5C5C5000000FF00FFFF00FFFF00FF808080
        FFFFFFF0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6F0CAA6FFFF
        FF000000FF00FFFF00FFFF00FF808080FFFFFFC5C5C5C5C5C5C5C5C5C5C5C5C5
        C5C5C5C5C5C5C5C5C5C5C5C5C5C5FFFFFF000000FF00FFFF00FFFF00FFC0C0C0
        8080808080808080808080808080808080808080808080808080808080808080
        80FF00FFFF00FFFF00FFFF00FFC0C0C080808080808080808080808080808080
        8080808080808080808080808080808080FF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = TokenizeCurrentCreditCard1Click
    end
    object NavMain: TUniDBNavigator
      Left = 138
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      DataSource = SrcArcustoCredCard
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 27
    Width = 363
    Height = 207
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object pcMain: TUniPageControl
      Left = 1
      Top = 1
      Width = 361
      Height = 205
      Hint = ''
      ActivePage = tabGrid
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tabForm: TUniTabSheet
        Tag = 1999
        Hint = ''
        ImageIndex = 1
        Caption = 'tabForm'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object PnlFormView: TUniPanel
          Tag = 1999
          Left = 0
          Top = 0
          Width = 353
          Height = 177
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Splitter1: TUniSplitter
            Left = 103
            Top = 31
            Width = 6
            Height = 146
            Hint = ''
            Align = alLeft
            ParentColor = False
            Color = clBtnFace
          end
          object Bevel1: TUniPanel
            Left = 1
            Top = 1
            Width = 351
            Height = 8
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            Caption = ''
          end
          object PnlLabels: TUniPanel
            Tag = 1999
            Left = 1
            Top = 31
            Width = 103
            Height = 146
            Hint = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            object Label1: TUniLabel
              Left = 8
              Top = 51
              Width = 82
              Height = 13
              Hint = ''
              Caption = 'Credit Card Type'
              TabOrder = 1
            end
            object Label2: TUniLabel
              Left = 8
              Top = 27
              Width = 50
              Height = 13
              Hint = ''
              Caption = 'Account #'
              TabOrder = 2
            end
            object Label3: TUniLabel
              Left = 8
              Top = 3
              Width = 68
              Height = 13
              Hint = ''
              Caption = 'Name on Card'
              TabOrder = 3
            end
            object Label4: TUniLabel
              Left = 8
              Top = 75
              Width = 74
              Height = 13
              Hint = ''
              Caption = 'Expiration Date'
              TabOrder = 4
            end
          end
          object PnlEditControls: TUniPanel
            Tag = 1999
            Left = 109
            Top = 31
            Width = 244
            Height = 146
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            ExplicitLeft = 106
            ExplicitWidth = 249
            ExplicitHeight = 148
            DesignSize = (
              244
              146)
            object Label5: TUniLabel
              Left = 54
              Top = 75
              Width = 40
              Height = 13
              Hint = ''
              Caption = '(MM/YY)'
              TabOrder = 6
            end
            object lblToken: TUniLabel
              Left = 152
              Top = 27
              Width = 37
              Height = 13
              Hint = 'This credit card number is a token assigned by the gateway'
              ShowHint = True
              ParentShowHint = False
              Caption = '(Token)'
              TabOrder = 7
            end
            object cmbCreditCardTypeForm: TUniDBLookupComboBox
              Left = 1
              Top = 48
              Width = 242
              Height = 21
              Hint = ''
              ListFieldIndex = 0
              DataField = 'CREDIT_CARD_ID'
              DataSource = SrcArcustoCredCard
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clWindow
            end
            object chkDefault: TUniDBCheckBox
              Left = 1
              Top = 96
              Width = 57
              Height = 17
              Hint = ''
              DataField = 'IS_DEFAULT'
              DataSource = SrcArcustoCredCard
              ValueChecked = 'Y'
              ValueUnchecked = 'N'
              Caption = 'Default'
              TabOrder = 4
            end
            object edtAccount: TUniEdit
              Left = 1
              Top = 24
              Width = 145
              Height = 21
              Hint = ''
              MaxLength = 20
              Text = '0000-0000-0000-0000'
              TabOrder = 1
              OnChange = DoEditControlChange
              OnExit = edtAccountExit
              OnKeyPress = DoNonDBAwareNumericOnlyKeyPress
            end
            object edtName: TUniEdit
              Left = 1
              Top = 1
              Width = 242
              Height = 21
              Hint = ''
              CharCase = ecUpperCase
              MaxLength = 62
              Text = ''
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              OnChange = DoEditControlChange
              OnKeyPress = DoNonDBAwareKeyPress
            end
            object mskExpDate: TUniEdit
              Left = 1
              Top = 72
              Width = 40
              Height = 21
              Hint = ''
              MaxLength = 5
              Text = ''
              TabOrder = 3
              OnChange = DoEditControlChange
            end
          end
          object PnlGateway: TUniPanel
            Tag = 1999
            Left = 1
            Top = 8
            Width = 351
            Height = 23
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Caption = ''
            object Splitter2: TUniSplitter
              Left = 103
              Top = 0
              Width = 6
              Height = 23
              Hint = ''
              Align = alLeft
              ParentColor = False
              Color = clBtnFace
            end
            object PnlTokenOptionsLeft01: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 103
              Height = 21
              Hint = ''
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 0
              Caption = ''
              object lblGateway: TUniLabel
                Left = 8
                Top = 3
                Width = 43
                Height = 13
                Hint = ''
                Caption = 'Gateway'
                TabOrder = 1
              end
            end
            object PnlTokenOptionsClient01: TUniPanel
              Tag = 1999
              Left = 109
              Top = 1
              Width = 242
              Height = 21
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
              Caption = ''
              DesignSize = (
                242
                21)
              object dbeGatewayDescrip: TUniDBEdit
                Left = 1
                Top = 1
                Width = 239
                Height = 19
                Hint = ''
                DataField = 'GATEWAY_DESCRIP'
                DataSource = SrcArcustoCredCard
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                Color = clBtnFace
                ReadOnly = True
              end
            end
          end
        end
      end
      object tabGrid: TUniTabSheet
        Hint = ''
        Caption = 'tabGrid'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object Grid: TIQUniGridControl
          Left = 0
          Top = 0
          Width = 353
          Height = 177
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 136
          IQComponents.Grid.Height = 91
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcArcustoCredCard
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
          IQComponents.Navigator.DataSource = SrcArcustoCredCard
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 136
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 91
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcArcustoCredCard
          Columns = <
            item
              FieldName = 'ImageIndex'
              Title.Caption = 'Update this Blank Field'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DecryptedName'
              Title.Caption = 'Name on Card'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LAST_FOUR_MASKED'
              Title.Caption = 'Account #'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'TypeDisplay'
              Title.Caption = 'Credit Card Type'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DecryptedExp'
              Title.Caption = 'Expires (MMYY)'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'IS_DEFAULT'
              Title.Caption = 'Default'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'GATEWAY_DESCRIP'
              Title.Caption = 'Gateway'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'IS_TOKEN'
              Title.Caption = 'Token'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object cmbCreditCardTypeGrid: TUniDBLookupComboBox
          Left = 31
          Top = 37
          Width = 119
          Height = 21
          Hint = ''
          ListField = 'DESCRIP'
          ListSource = SrcCredCard
          KeyField = 'ID'
          ListFieldIndex = 0
          DataSource = SrcCredCard
          TabOrder = 1
          Color = clWindow
        end
      end
    end
  end
  object SrcArcustoCredCard: TDataSource
    DataSet = QryArcustoCredCard
    OnDataChange = SrcArcustoCredCardDataChange
    Left = 224
    Top = 136
  end
  object QryArcustoCredCard: TFDQuery
    BeforeOpen = QryArcustoCredCardBeforeOpen
    AfterOpen = QryArcustoCredCardAfterOpen
    BeforeInsert = QryArcustoCredCardBeforeInsert
    AfterInsert = QryArcustoCredCardAfterInsert
    BeforePost = QryArcustoCredCardBeforePost
    AfterPost = QryArcustoCredCardAfterPost
    AfterCancel = QryArcustoCredCardAfterCancel
    BeforeDelete = QryArcustoCredCardBeforeDelete
    AfterScroll = QryArcustoCredCardAfterScroll
    OnCalcFields = QryArcustoCredCardCalcFields
    OnNewRecord = QryArcustoCredCardNewRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARCUSTO_CREDIT_CARD'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLArcustoCredCard
    SQL.Strings = (
      
        '  SELECT a.id, a.arcusto_id, a.credit_card_id, a.acctno, a.name_' +
        'on, a.exp_mmyy,'
      
        '         a.expiration_date, a.is_token, a.credit_card_account_id' +
        ', a.is_default,'
      '         b.descrip, c.gateway, c.description AS gateway_descrip,'
      '         a.last_four, a.last_four_masked'
      
        '    FROM arcusto_credit_card a, credit_card b, credit_card_accou' +
        'nt c'
      '   WHERE b.id = a.credit_card_id AND'
      '         c.id(+) = a.credit_card_account_id AND'
      '         a.arcusto_id = :ARCUSTO_ID'
      'ORDER BY a.id')
    Left = 224
    Top = 152
    ParamData = <
      item
        Name = 'ARCUSTO_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArcustoCredCardImageIndex: TBCDField
      DisplayLabel = ' '
      DisplayWidth = 4
      FieldKind = fkCalculated
      FieldName = 'ImageIndex'
      Calculated = True
    end
    object QryArcustoCredCardDecryptedName: TStringField
      DisplayLabel = 'Name on Card'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'DecryptedName'
      Size = 60
      Calculated = True
    end
    object QryArcustoCredCardLAST_FOUR_MASKED: TStringField
      DisplayLabel = 'Account #'
      DisplayWidth = 20
      FieldName = 'LAST_FOUR_MASKED'
    end
    object QryArcustoCredCardTypeDisplay: TStringField
      DisplayLabel = 'Credit Card Type'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'TypeDisplay'
      LookupDataSet = QryCredCardLookup
      LookupKeyFields = 'ID'
      LookupResultField = 'CardType'
      KeyFields = 'CREDIT_CARD_ID'
      Size = 60
      Lookup = True
    end
    object QryArcustoCredCardDecryptedExp: TStringField
      DisplayLabel = 'Expires (MMYY)'
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'DecryptedExp'
      Size = 5
      Calculated = True
    end
    object QryArcustoCredCardIS_DEFAULT: TStringField
      DisplayLabel = 'Default'
      DisplayWidth = 8
      FieldName = 'IS_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object QryArcustoCredCardGATEWAY_DESCRIP: TStringField
      DisplayLabel = 'Gateway'
      DisplayWidth = 18
      FieldName = 'GATEWAY_DESCRIP'
      Size = 60
    end
    object QryArcustoCredCardIS_TOKEN: TStringField
      DisplayLabel = 'Token'
      DisplayWidth = 1
      FieldName = 'IS_TOKEN'
      Origin = 'IQ.ARCUSTO_CREDIT_CARD.IS_TOKEN'
      Size = 1
    end
    object QryArcustoCredCardDecryptedAccount: TStringField
      DisplayLabel = 'Account #'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'DecryptedAccount'
      Visible = False
      Size = 25
      Calculated = True
    end
    object QryArcustoCredCardACCTNO: TStringField
      DisplayLabel = 'Account #'
      DisplayWidth = 17
      FieldName = 'ACCTNO'
      Required = True
      Visible = False
      Size = 255
    end
    object QryArcustoCredCardNAME_ON: TStringField
      DisplayLabel = 'Name on Card'
      DisplayWidth = 21
      FieldName = 'NAME_ON'
      Visible = False
      Size = 255
    end
    object QryArcustoCredCardEXP_MMYY: TStringField
      DisplayLabel = 'Expires (MMYY)'
      DisplayWidth = 12
      FieldName = 'EXP_MMYY'
      Required = True
      Visible = False
      Size = 100
    end
    object QryArcustoCredCardCREDIT_CARD_ID: TBCDField
      DisplayLabel = 'Credit Card Type'
      DisplayWidth = 10
      FieldName = 'CREDIT_CARD_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object QryArcustoCredCardID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryArcustoCredCardARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryArcustoCredCardDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'CREDIT_CARD.DESCRIP'
      Visible = False
      Size = 25
    end
    object QryArcustoCredCardEXPIRATION_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'EXPIRATION_DATE'
      Origin = 'IQ.ARCUSTO_CREDIT_CARD.EXPIRATION_DATE'
      Visible = False
    end
    object QryArcustoCredCardCREDIT_CARD_ACCOUNT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CREDIT_CARD_ACCOUNT_ID'
      Origin = 'IQ.ARCUSTO_CREDIT_CARD.CREDIT_CARD_ACCOUNT_ID'
      Visible = False
      Size = 0
    end
    object QryArcustoCredCardGATEWAY: TBCDField
      FieldName = 'GATEWAY'
      Visible = False
      Size = 0
    end
    object QryArcustoCredCardLAST_FOUR: TStringField
      FieldName = 'LAST_FOUR'
      Visible = False
      Size = 4
    end
  end
  object QryCredCardLookup: TFDQuery
    OnCalcFields = DoBasicCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, descrip'
      'from credit_card'
      'order by descrip')
    Left = 296
    Top = 168
    object QryCredCardLookupImageIndex: TBCDField
      Alignment = taLeftJustify
      DisplayLabel = ' '
      DisplayWidth = 4
      FieldKind = fkCalculated
      FieldName = 'ImageIndex'
      Calculated = True
    end
    object QryCredCardLookupCardType: TStringField
      DisplayLabel = 'Credit Card Type'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CardType'
      Size = 50
      Calculated = True
    end
    object QryCredCardLookupDESCRIP: TStringField
      DisplayLabel = 'Card Type'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'IQ.CREDIT_CARD.DESCRIP'
      Visible = False
      Size = 25
    end
    object QryCredCardLookupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.CREDIT_CARD.ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLArcustoCredCard: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into arcusto_credit_card'
      '  (ID, ARCUSTO_ID, CREDIT_CARD_ID, ACCTNO, NAME_ON, EXP_MMYY, '
      'EXPIRATION_DATE, IS_TOKEN, IS_DEFAULT)'
      'values'
      
        '  (:ID, :ARCUSTO_ID, :CREDIT_CARD_ID, :ACCTNO, :NAME_ON, :EXP_MM' +
        'YY, '
      ':EXPIRATION_DATE, :IS_TOKEN, :IS_DEFAULT)')
    ModifySQL.Strings = (
      'update arcusto_credit_card'
      'set'
      '  ARCUSTO_ID = :ARCUSTO_ID,'
      '  CREDIT_CARD_ID = :CREDIT_CARD_ID,'
      '  ACCTNO = :ACCTNO,'
      '  NAME_ON = :NAME_ON,'
      '  EXP_MMYY = :EXP_MMYY,'
      '  IS_DEFAULT = :IS_DEFAULT,'
      '  EXPIRATION_DATE = :EXPIRATION_DATE,'
      '  IS_TOKEN = :IS_TOKEN'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from arcusto_credit_card'
      'where'
      '  ID = :OLD_ID')
    Left = 224
    Top = 168
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'sbtnCreditCards'
      'AcceptedCreditCards1'
      'PurgeCreditCardData1'
      'PurgeExpiredCards1'
      'PurgeLogData1')
    SecurityCode = 'FRMCUSTCREDCARD'
    Left = 250
    Top = 1
  end
  object ImageList1: TUniImageList
    Left = 278
    Top = 1
    Bitmap = {
      494C01010D0011000C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008060400080202000802020008040
      2000C0402000C040200080402000802020008020200080204000402060004020
      6000400020004000000040000000804040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008040200080202000C0402000C040
      2000C0402000C0402000C0402000C04020004020A0004020E0004020E0000020
      E0000020E0004000800040000000802020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080404000C0402000C0602000C060
      2000C0602000C0602000C0602000804060008020A0004020E0004020E0000020
      E0000020E0000020E00000008000802020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0604000C0602000C0602000C060
      2000C0602000C0602000C060400080408000804080004020C0004020E0004020
      E0000020E0000020E0000020E000402040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0604000C0602000C0C0A000C0C0
      A000C0DCC000C0DCC000C0C0A000C0C0A000C0A08000C0C0C0008080C0008080
      C00080A0C00080A0C0000020E000404080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0604000C0602000C0DCC000C0C0
      A000C0DCC000C0C0A000C0A08000C0C0A000C0A080008080800080A0C00080A0
      C00080A0C0008080C0000020E000402080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080402000C0602000C0604000C060
      2000C0804000C0602000C040400080408000802080004020C0004020E0000020
      E0000020E0000020E0000020E000402040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080404000C0402000C0602000C060
      2000C0602000C0402000C0402000804060004020A0004020E0004020E0000020
      E0000020E0000020E00000008000802020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008040400080402000C0402000C060
      2000C0602000C0602000C0602000C0402000802080004020E0004020E0004020
      E0004020E0004000800040000000802020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C080600080604000C0604000C060
      4000C0604000C0604000C0604000C04040008040200080404000804060008040
      6000802020008020200080200000804040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080808000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000080808000FFFFFF00C0C0
      C000406060008080800080A08000406060008060600040606000406060004060
      6000FFFFFF00FFFFFF00808080000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C0404000C0404000C0404000C040
      6000806060008060800080606000C06060008060600080606000808080008060
      6000806040008040400080404000C08080000000000080808000FFFFFF00FFFF
      FF00808080008080600080A08000406060008080600080806000C0C0C00080A0
      8000FFFFFF00FFFFFF00808080000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C040400080202000802040004020
      C0000020E0000020E0000020E0004020A00040A0A00040E0E00040E0E00040E0
      E00040A0A0004020200040000000804040000000000080808000FFFFFF00F0FB
      FF0080E0E000C0DCC000C0DCC000C0DCC000F0FBFF00C0C0C000C0C0C000F0FB
      FF00FFFFFF00FFFFFF00808080000000000000000000C6C6C600C6C6C600C6C6
      C600840000008400000084000000840000008400000084000000840000008400
      0000C6C6C600C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C0404000802020004020C0004020
      E0004020E0004020E0000020E0004060E00040A0E00040E0E00040E0E00040E0
      E00040E0E00040A0A00040000000804040000000000080808000FFFFFF00C0DC
      C000C0600000C06000008080E0004040C0004040C00080806000808000008080
      0000FFFFFF00FFFFFF00808080000000000000000000C6C6C600C6C6C6008400
      0000FFFFFF00FFFFFF00FFFFFF00840000008400000084000000840000008400
      000084000000C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C0404000802060004040E0004040
      E0004040E0004040E0004040E0004080E0004080E00080C0E00080E0E00080E0
      E00040E0E00040E0E00040404000804040000000000080808000FFFFFF00C0DC
      C000C0600000C0600000808060004040C0004040C00080806000808000008080
      0000F0FBFF00FFFFFF00808080000000000000000000C6C6C60084000000FFFF
      FF0084000000FFFFFF0084000000FFFFFF008400000084000000840000008400
      00008400000084000000C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C040400080208000C0C0C000C0C0
      C000C0C0C000C0A0C000C080C000C0A0C000C0A0C000C0C0C000C0DCC000C0DC
      C000C0DCC000C0DCC00040606000804040000000000080808000FFFFFF00C0DC
      C000C0600000C0600000808060004040C0004040C00080806000808000008080
      0000F0FBFF00FFFFFF00808080000000000000000000C6C6C60084000000FFFF
      FF0084000000FFFFFF0084000000FFFFFF008400000084000000840000008400
      00008400000084000000C6C6C60000000000000000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600FFFFFF0000000000C040400080208000C0A0E000C0A0
      E0008060E0008060E0008080E0008080E0008080E000C0C0C000C0DCC00080E0
      E00080E0E000C0DCC00040606000804040000000000080808000FFFFFF00C0DC
      C000C0C0A000FFFFFF0080806000FFFFFF004040C00080A0800040800000FFFF
      FF00F0FBFF00FFFFFF00808080000000000000000000C6C6C60084000000FFFF
      FF0084000000FFFFFF0084000000FFFFFF008400000084000000840000008400
      00008400000084000000C6C6C60000000000000000000000FF000000FF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF0000000000C0404000802040000020E0000020
      E0000020E0000020E0000020E0004080E0004080E00040E0E00040E0E00040E0
      E00040E0E00040E0E00040202000804040000000000080808000FFFFFF00C0DC
      C000C0600000C0A0800080A08000FFFFFF004060C00080A0800040802000FFFF
      FF00F0FBFF00FFFFFF00808080000000000000000000C6C6C600C6C6C6008400
      0000FFFFFF00FFFFFF00FFFFFF00840000008400000084000000840000008400
      000084000000C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF00FFFFFF0000000000C040200080202000402080004020
      E0004020E0000020E0000020E0000040E00040C0E00040E0E00040E0E00040E0
      E00040E0E0004060600040000000804040000000000080808000FFFFFF00C0DC
      C000C0600000C0600000808060004040C0004040C00080806000808000008080
      0000F0FBFF00FFFFFF00808080000000000000000000C6C6C600C6C6C600C6C6
      C600840000008400000084000000840000008400000084000000840000008400
      0000C6C6C600C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C040200080202000802020008020
      60008020A0004020C0004020A000802040008040400080A0A00080C0C00040A0
      A000404040004000000040000000804040000000000080808000FFFFFF00C0DC
      C000C0600000C0600000808060004040C0004040C00080806000808000008080
      0000F0FBFF00FFFFFF00808080000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000C0404000C0402000C0808000C060
      6000C0806000C0606000C0606000C0606000C0606000C0606000C0606000C060
      6000C0606000C060400080202000804040000000000080808000FFFFFF00F0FB
      FF00C0600000C0600000808060004040C0004040C00080A08000808000008080
      0000F0FBFF00FFFFFF0080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0806000C0604000C0808000C080
      6000C0808000C0808000C0808000C0806000C0806000C0606000C0606000C080
      6000C0806000C060600080202000C0606000000000000000000080808000FFFF
      FF00F0FBFF00C0DCC000C0DCC000F0FBFF00C0DCC000F0FBFF00C0DCC000C0DC
      C000FFFFFF008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600848484000000000000000000000000000000
      8400000084000000840000008400000084000000840000000000000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00008400000084
      0000008400000084000000840000008400000084000000840000008400000084
      0000848400008484000000840000C6C6C6000000000000000000000084000000
      FF000000FF000000FF000000FF000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000808080008080800000000000FFFFFF00840084008484
      8400848484008484840000840000008400000084000084840000848484000084
      0000008400008484000000840000C6C6C6000000000000000000000084000000
      FF00000084000000000000000000000084000000FF0000008400000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF0080808000F0FBFF008060E0004000
      C000C0A0E000F0FBFF0040C0E00000A0E000F0FBFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A0A000806020008080600000000000C6C6C600000000000000
      0000000000000000000084000000840000008400840084848400008400000084
      0000008400000000000000840000C6C6C6000000000000000000000084000000
      FF00000084000000000000000000000084000000FF0000008400000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF00808080008080E0008060E0008060
      E00080A0E00040C0E00000A0E00000A0E000F0FBFF00FFFFFF00FFFFFF00F0CA
      A600808040008040000080400000808060000000000084008400000084000000
      8400000084000000000000000000000000000000000000000000000000000000
      0000840084008484000084848400C6C6C6000000000000000000000084000000
      FF00000084000000000000000000000084000000FF0000008400000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF0080808000FFFFFF0080E0E00040C0
      E00000A0E00000A0E00000A0E00000A0E000F0FBFF00F0FBFF00C0A060008040
      0000804000008040000080400000808060000000000084008400000084000000
      8400000084000000FF0000008400008400000000FF0000000000000000000000
      0000000000000000000084008400C6C6C6000000000000000000000084000000
      FF000000840000008400000084000000FF000000FF0000008400000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF008080800080C0E00040C0E00040C0
      E00040C0E00040C0E00040C0E00040C0E000C0C0A00080602000804000008040
      0000804000008040000080400000808060000000000000000000000084000000
      8400000084000000840000008400008484000084840000008400000084000000
      8400000084000000840084840000C6C6C6000000000000000000000084000000
      FF00000084000000FF000000FF000000FF000000840000000000000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF0080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F0FBFF00808040008040000080400000804000008040
      0000804000008040000080400000808060000000000084848400000000000000
      0000000000000000000000000000000000000000840000008400000084000000
      84000000840000008400C6C6C600C6C6C6000000000000000000000084000000
      FF00000084000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF00FFFFFF00848484008484
      8400C6C6C60084848400848484008484840084848400FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF000000FF0080808000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0A08000C0804000C080600080804000C0806000C08060008060
      4000C0804000C0804000C08060008080600000000000FFFFFF00FFFFFF00FFFF
      FF00C6C6C600C6C6C60084848400840000000000000000000000000000000000
      00000000840000000000FFFFFF00C6C6C6000000000000000000000084000000
      FF00000084008484840084840000848400008484840084848400848400008484
      8400848400000084000000000000000000000000FF00FFFFFF00848484008484
      8400C6C6C600C6C6C60084848400C6C6C600C6C6C600FFFFFF000000FF000000
      FF000000FF000000FF00FFFFFF000000FF0080808000FFFFFF00FFFFFF00C0C0
      A0008060400080400000C0806000C0A08000C0806000C0A08000C08060008060
      0000C0A0800080602000C08060008080600000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008400
      84008400840000000000FFFFFF00C6C6C6000000000000000000000084000000
      FF00000084000084000000848400848484008484000000848400848400000084
      0000008484008484000000840000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF0080808000F0FBFF00C08060008040
      0000804000008040000080400000804000008040000080400000804000008040
      0000804000008040000080400000808060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0DCC000C0DCC000C0DCC000C0DC
      C000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DCC000C0DC
      C000C0DCC000C0DCC000C0DCC000C0DCC0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004080C00000A0E00000A0E00000A0
      E00000A0E00000A0E00000A0E00000A0E00000A0E00000A0E00000A0E00000A0
      E00000A0E00000A0E00000A0E0004080C0004040200040200000402000004020
      0000402020004020200040200000402000004020000040200000404020004020
      200040200000402000004020000040402000C0DCC00040402000404020004040
      2000404020004040200040402000404020004040200040402000404020004040
      2000404020004040200040402000404020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004080C00000C0E00000C0E00000C0
      E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0E00000C0
      E00000C0E00000C0E00000C0E0004080C0004040200040200000402040004000
      A0004000C0004000C0004000C00040008000406080000080E00000A0E00000A0
      E0000080C000404060004020000040402000C0DCC00040402000808020008080
      6000000000004040200080A0600080A0400080A0600080A06000808040008080
      400080A0400080A0400080A06000404000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000F0FBFF00F0FBFF00C0C0
      C000C0DCC000F0FBFF00C0C0C000C0C0C000C0A08000C0DCC000C0C0C000F0FB
      FF00C0C0C000F0FBFF00F0FBFF008080800040402000402040004000C0004000
      C0004000C0004000C0004000C0004020C0000060E00000A0E00000A0E00000A0
      E00000A0E00000A0E0004060600040402000C0DCC0004040200080A0400080A0
      400080A0400080A0400080A0600040400000000000004040200080A0600080C0
      600080A0400080A0400080A04000404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF008080
      4000C0804000C0DCC00080602000F0CAA600F0CAA60080602000C0804000C0A0
      600080602000FFFFFF00FFFFFF0080808000404020004040A0004040C0008060
      C0008060C0008060C0008060C00080A0C0004080C0004080C00080A0E00080A0
      C00040A0E00080A0E00040A0E00040402000C0DCC00040402000808020008080
      2000808040008080400040604000404000004060400040402000808040004040
      200080A0400080A0400080A04000404020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF008060
      4000C0A06000C0C0A00080602000C0DCC00080602000C0806000F0CAA600C0A0
      600080604000FFFFFF00FFFFFF0080808000404020008060C000C0C0C000C0C0
      C000C0C0C000C0A0C000C0A0C000C0C0C000C0A0C000C0C0C00040A0E000C0DC
      C000C0C0C00080C0E00080C0E00040404000C0DCC0004040200080A040008080
      20004060400080A040000000000000000000C0C08000C0C08000808060004040
      2000404020004040200080C06000404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000FFFFFF00FFFFFF008060
      2000C0DCC000C0804000C0806000C0A0800080602000F0CAA600F0FBFF00C080
      600080804000FFFFFF00FFFFFF0080808000404020004020A0004040C0004040
      C0004000C0004000C0004020C0004040E0004040E0004080E00040A0E00000A0
      E00000A0E00000A0E00040A0E00040402000C0DCC0004040000080C0600080A0
      400080C0600080C060008080400000000000406040004040400080A0400080C0
      600080A040008080200040402000404020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000080808000F0FBFF00C0DCC000C0C0
      A000F0FBFF00F0CAA600F0CAA600F0CAA600C0C0A000C0A08000F0CAA600F0CA
      A600F0CAA600F0FBFF00F0FBFF008080800040402000402040004000C0004000
      C0004000C0004000C0004000C0004020C0000060E00000A0E00000A0E00000A0
      E00000A0E00000A0E0004040600040402000C0DCC0004040200080A0400080C0
      600080A0400080A0400080C060008080400040604000808060008080400080A0
      400080C0600080A0600080C06000404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080400000804000008040
      0000804000008040000080400000804000008040000080400000804000008040
      0000804000008040000080400000800000004040200040200000402020004000
      80004000C0004000C0004000A00040206000404060000080C00000A0E0000080
      E0000080C000404040004020000040402000C0DCC0004040200080A0600080A0
      40008080400080A0400080A04000808040008080400080A0400080A0400080A0
      6000808060008080400080804000404020000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080400000804000008040
      0000804000008040000080400000804000008040000080400000804000008040
      0000804000008040000080400000800000004040200040200000402000004020
      0000402000004020200040200000402000004020000040200000402020004020
      000040200000402000004020000040402000C0DCC0004040400080A0600080A0
      40008080400080A040008080400080A0400080A0400080A0400080A0400080A0
      40008080400080A0400080804000404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0DCC00040402000404020004040
      2000404020004040200040402000404020004040200040402000404020004040
      2000404020004040200040404000404040000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FFFF000000000000FFFFFFFFFFFFE007FFFFFFFFFFFFC003
      8001800100008001000000000000800100000000000080010000000000008001
      0000000000008001000000000000800100000000000080010000000000008001
      000000000000800100000000000080010000000000008001800180010000C003
      FFFFFFFF0000E007FFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      000000008001FFFF000000000000000000000000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000080010000
      FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object MainMenu1: TUniMainMenu
    Left = 166
    Top = 1
    object File1: TUniMenuItem
      Caption = '&File'
      object race1: TUniMenuItem
        Caption = 'Trace'
        OnClick = race1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Close1: TUniMenuItem
        Caption = '&Close'
        OnClick = Close1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      OnClick = Options1Click
      object PurgeExpiredCards1: TUniMenuItem
        Caption = 'Purge Expired Cards'
        OnClick = PurgeExpiredCards1Click
      end
      object PurgeCreditCardData1: TUniMenuItem
        Caption = 'Purge Credit Card Data'
        OnClick = PurgeCreditCardData1Click
      end
      object PurgeLogData1: TUniMenuItem
        Caption = 'Purge Log Data'
        OnClick = PurgeLogData1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object TokenizeCurrentCreditCard1: TUniMenuItem
        Caption = 'Tokenize Current Credit Card'
        OnClick = TokenizeCurrentCreditCard1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object PCardType: TUniPopupMenu
    Left = 194
    Top = 1
    object AcceptedCreditCards1: TUniMenuItem
      Caption = 'Accepted Credit Cards'
      OnClick = DoAcceptedCreditCardsClick
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Customer Credit Cards'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194757 $'
    BuildVersion = '176554'
    Left = 222
    Top = 1
  end
  object SrcCredCard: TDataSource
    DataSet = QryCredCardLookup
    Left = 248
    Top = 64
  end
end

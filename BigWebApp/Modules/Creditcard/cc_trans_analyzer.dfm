object FrmCCTransAnalyzer: TFrmCCTransAnalyzer
  Left = 0
  Top = 0
  ClientHeight = 462
  ClientWidth = 839
  Caption = 'Transaction Analyzer'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlInput: TUniPanel
    Tag = 1999
    Left = 0
    Top = 193
    Width = 839
    Height = 269
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 425
      Top = 0
      Width = 6
      Height = 269
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlRequest: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 425
      Height = 267
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object memInput: TUniMemo
        Left = 1
        Top = 47
        Width = 423
        Height = 220
        Hint = ''
        ScrollBars = ssBoth
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
      end
      object PnlToolbarRequest: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 423
        Height = 47
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object PnlToolbarCaptionRequest: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 421
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object lblCaptionLabelRequest: TUniLabel
            Left = 1
            Top = 1
            Width = 142
            Height = 13
            Hint = ''
            Caption = 'Input Request/Response'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object PnlToolbarInnerRequest: TUniPanel
          Tag = 1999
          Left = 1
          Top = 20
          Width = 421
          Height = 27
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object sbtnOpen: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = ''
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF708890608090
              6078805070805060704058604048503038402030302020301018201010101010
              20FF00FFFF00FFFF00FF88888882828278787872727263636358585849494939
              39392F2F2F242424191919101010141414FF00FFFF00FFFF00FF70889090A0B0
              70B0D00090D00090D00090D00090C01088C01080B01080B02078A02070902048
              60AE9783FF00FFFF00FF888888A3A3A3B4B4B49D9D9D9D9D9D9D9D9D98989892
              92928888888888887E7E7E7474744C4C4C959595FF00FFFF00FF80889080C0D0
              90A8B080E0FF60D0FF50C8FF50C8FF40C0F030B0F030A8F020A0E01090D02068
              80615A57FF00FFFF00FF898989C0C0C0A8A8A8E2E2E2D6D6D6D1D1D1D1D1D1C6
              C6C6BBBBBBB6B6B6ACACAC9D9D9D6B6B6B5A5A5AFF00FFFF00FF8090A080D0F0
              90A8B090C0D070D8FF60D0FF60D0FF50C8FF50C0FF40B8F030B0F030A8F01088
              D0204860D8BBA5FF00FF939393D3D3D3A8A8A8C1C1C1DCDCDCD6D6D6D6D6D6D1
              D1D1CBCBCBC1C1C1BBBBBBB6B6B69797974C4C4CB9B9B9FF00FF8090A080D8F0
              80C8E090A8B080E0FF70D0FF60D8FF60D0FF60D0FF50C8FF40C0F040B8F030B0
              F0206880748588FF00FF939393D9D9D9CACACAA8A8A8E2E2E2D7D7D7DCDCDCD6
              D6D6D6D6D6D1D1D1C6C6C6C1C1C1BBBBBB6B6B6B858585FF00FF8098A090E0F0
              90E0FF90A8B090B8C070D8FF60D8FF60D8FF60D8FF60D0FF50D0FF50C8FF40B8
              F030A0E04A6774D9C3B4989898E0E0E0E3E3E3A8A8A8B7B7B7DCDCDCDCDCDCDC
              DCDCDCDCDCD6D6D6D6D6D6D1D1D1C1C1C1ACACAC686868C2C2C28098A090E0F0
              A0E8FF80C8E090A8B080E0FF80E0FF80E0FF80E0FF80E0FF80E0FF80E0FF70D8
              FF70D8FF50A8D0909091989898E0E0E0E9E9E9CACACAA8A8A8E2E2E2E2E2E2E2
              E2E2E2E2E2E2E2E2E2E2E2E2E2E2DCDCDCDCDCDCAEAEAE90909090A0A0A0E8F0
              A0E8FFA0E8FF90B0C090B0C090A8B090A8B080A0B080A0B08098A08098A08090
              A08090A08088907088909F9F9FE6E6E6E9E9E9E9E9E9B2B2B2B2B2B2A8A8A8A8
              A8A8A2A2A2A2A2A298989898989893939393939389898988888890A0B0A0E8F0
              A0F0FFA0E8FFA0E8FF80D8FF60D8FF60D8FF60D8FF60D8FF60D8FF60D8FF7088
              90FF00FFFF00FFFF00FFA3A3A3E6E6E6EFEFEFE9E9E9E9E9E9DDDDDDDCDCDCDC
              DCDCDCDCDCDCDCDCDCDCDCDCDCDC888888FF00FFFF00FFFF00FF90A0B0A0F0F0
              B0F0F0A0F0FFA0E8FFA0E8FF70D8FF90A0A08098A08098A08090A08090907088
              90FF00FFFF00FFFF00FFA3A3A3ECECECEDEDEDEFEFEFE9E9E9E9E9E9DCDCDC9F
              9F9F9898989898989393938F8F8F888888FF00FFFF00FFFF00FF90A8B0A0D0E0
              B0F0F0B0F0F0A0F0FFA0E8FF90A0B0BDC5BFFF00FFFF00FFFF00FFFF00FFFF00
              FF906850906850906850A8A8A8D1D1D1EDEDEDEDEDEDEFEFEFE9E9E9A3A3A3C4
              C4C4FF00FFFF00FFFF00FFFF00FFFF00FF676767676767676767DAD1C690A8B0
              90A8B090A8B090A8B090A8B0BFC2BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFDFC2B2906850906850D0D0D0A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8C1C1C1FF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1676767676767FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF907860D3B6A1FF00FFF7DF
              CCA09080DFC8B3907860FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FF757575B4B4B4FF00FFDEDEDE8E8E8EC6C6C6757575FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE5D3BFA09080A08880B098
              80CEBBAAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFD1D1D18E8E8E888888959595B9B9B9FF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = OpenDataFile1Click
          end
          object sbtnClear: TUniSpeedButton
            Left = 25
            Top = 1
            Width = 25
            Height = 25
            Hint = ''
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000C21E0000C21E00000001000000000000473E7D005050
              500051515100535353005555550057575700585858005D5D5D005E5E5E005F5F
              5F004D4E63004E486B00504D6D004E4C760049417E004E457E00606060006565
              650066666600696969006A6A6A006B6B6B006C6C6C006E6E6E006F6F6F006363
              7B0070707000717171007272720076767600473C800049388200533D8F004B40
              84004C448500534F83005655810059568D005B568D0054449700554598005D54
              93005E5294005C5A9500625E9900665B9F0062618B00636693005451A7005C4E
              B3005F4FB4005C4FBB005D4DBC006153A100695EAE007474A4007978A2007D7E
              A0007D7DB3007C7BBB007E7CBE005B4BC0007C72CC00FF00FF00808080008282
              8200868686008B8B8B008C8C8C008D8D8D008E8E8E008C949B00909090009191
              910093939300959595009696960097979700949C9B0098989800999999009B9B
              9B009D9D9D009F9F9F009BA49A009BA69C00A1AE9E009E9FA3009F99AA008386
              B3008184B7008F8EB000898EB5008882BD008885BC00888CBC009492B0009B9F
              B8009EA9A1009FA0B500A0A0A000A2A2A200A3A3A300A4A4A400A5A5A500A7A7
              A700A0ACA000A6AAAB00A9A9A900AAAAAA00ACACAC00A1A5B000B3B3B300B5B5
              B500B7B7B700B9B9B900BABABA00BBBBBB00BCBCBC00BDBDBD00BEBEBE00BFBF
              BF00888AC4008487CB008C8EC8009191C100928BD400968FD800979AD7009CA2
              CD009CA0D100A0A3C200AFBCCC00A6A7DA00B3A9D800AEB1D700B0B1D300B6B8
              D600BABBD500B2B5DB00B2B3DF00B1B8DF0097AAE3009FB1E0009CB3E100AAAD
              E000AAA9E700ACAEE400B1A7ED00A3B0E800B2B2E000B2B3E500B9BFE800BCBD
              E900A3AEF200B4B5F200BBB5F600B7BBF000B9BDF000B8BCF100BBBEF100B5B7
              F800B8B5FA00B7BCF900BDB9FF00BFC6ED00C1C1C100C4C4C400C6C6C600C7C7
              C700C8C8C800C9C9C900CACACA00CBCBCB00C9CFCE00CECECE00CFCFCF00C3C5
              D700CACCD400D0D0D000D2D2D200D3D3D300D4D4D400D5D5D500D6D6D600D4DB
              D400D8D8D800D9D9D900DCDDD900DCDCDC00DDDDDD00DEDEDE00DFDFDF00C3C9
              E600C7C8EA00C7CCEB00D2D2E000D3D2E200DCDCEA00C6C5F100C1C1F700C7C3
              F400C2C6F700C6CAF300C5C8F400CBCAF200C8C9F500C6C6FF00CBC7F800CCC5
              FF00D0CAFF00CED6F300D7D3F700D7D6F600D7D8F200D1DAF500D8D4FD00DADC
              FA00DADDFC00DDDDFF00E4DCFB00DFE3F600D9E8F100DAE0FF00E0E0E000E3E3
              E300E1E5E600E4E4E400E5E5E500E6E6E600E7E7E700E2E8EF00E9E9E900EAEA
              EA00E0E2F400EFECFF00ECF6FF00F1F1F100F6F6F600F4FFF000F3F4FF00F8F7
              FF00F2F8FF00F2FBFF00F3FFFC00F4FFFE00F4FEFF00F6FFFF00F8F8F800F9F9
              F900FAFAFA00FCFCFC00FEFEFE00FFFFFF0000000000000000003F3F3F3F3F3F
              3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FB26F58575455
              4E6BBC3F3F3F3F3F3F3FAF6952646567516DBD3F3F3F3F3F3F3F39373231333D
              343660B93F3F3F3F3F3F42401A181C1C1C1D50BB3F3F3F3F3F3F2CA4958F908E
              9A7B2F61BD3F3F3F3F3F17AD7776777279501B68BD3F3F3F3F3F38A2A39B9899
              9C5A803063C53F3F3F3F41A9ADA7ABAAA8486C1568B83F3F3F3F882BD3C3D1D0
              C994598D2A62C43F3F3F7314BEB5B6B6B37449A61169B73F3F3F3F2E89D8EAD4
              E7D55D838B286AC63F3F3F1679BFE5BDE9BE496D78096CC03F3F3F8A0FF7F2EF
              F5F4875E81962756DC3F3FA604FDFAFBFDFC744A6E77086DE33F3F3F2DD28C97
              9192933E7C828735AE3F3F3F18BA787973737545526E7414B03F3F3F3F22D7A0
              9EA19D9F3B5F852647E23F3F3F05E0ACABA9AAAB444F70114BE43F3F3F3F0EDE
              CFCAC8CCCB3A7E8424B13F3F3F3F03E8B6B4AFB5B643537910AB3F3F3F3F3F00
              DBC7CDC2C1CE5C7F255B3F3F3F3F3F02E4B3B6B3B3B64D66114C3F3F3F3F3F3F
              0BEBD6DDD9DAA57A3C233F3F3F3F3F3F02EDBFE6E1E3B05046073F3F3F3F3F3F
              3F0AF1F0F3F6ECDF7D0D3F3F3F3F3F3F3F03F9EEFBFCF8E652053F3F3F3F3F3F
              3F3F190C201F211E29863F3F3F3F3F3F3F3F13040601040212713F3F3F3F3F3F
              3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F}
            Caption = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = ClearRequest1Click
          end
          object sbtnExpandRequest: TUniSpeedButton
            Left = 50
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Expand'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36050000424D3605000000000000360400002800000010000000100000000100
              08000000000000010000C21E0000C21E00000001000000000000403020005038
              300060483000605040007050400090787000FF00FF00A0908000C0A8A000C0B0
              A000D0B0A000D0B8A000E0B8A000E0B8B000E0C0B000E0C8B000E0C8C000E0D0
              C000FFD8C000F0D8D000F0E0D000FFE0D000FFE8D000FFE8E000FFF0E000FFF0
              F000FFF8F000FFFFFF0000000000000000000000000000000000000000000000
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
              0000000000000000000000000000000000000000000000000000060606060606
              0606060606060606060602020202020202020606060606060606081A1A1A1612
              12020606060606060606081B1A1A1A1612020606060606060606081B1B1A1A1A
              16020202020202020202081B1B1B1B1A1A0211100E0E0D0C0C02080808080808
              08021818171716150C020606060606091A190418171717170E02060606060609
              1A1A1904180017170E020606060606091A1A1A19040117170E02060606060609
              1A1A1A07050218180E0206060606060A1B1A1A1A1A1A18180F0206060606060A
              1B1B1A1A1A1A1817100206060606060B1B1B1B1A1A1A1917130406060606060B
              1B1B1B1B1A1A1A19140306060606060B0B0B0A0A090908080808}
            Caption = ''
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnExpandRequestClick
          end
        end
      end
    end
    object PnlResults: TUniPanel
      Tag = 1999
      Left = 431
      Top = 1
      Width = 408
      Height = 267
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object PnlToolbarCaptionResults: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 406
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object lblCaptionLabelResults: TUniLabel
          Left = 1
          Top = 1
          Width = 42
          Height = 13
          Hint = ''
          Caption = 'Results'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object PageControl1: TUniPageControl
        Left = 1
        Top = 20
        Width = 406
        Height = 247
        Hint = ''
        ActivePage = TabDisplay
        TabBarVisible = True
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        object TabDisplay: TUniTabSheet
          Hint = ''
          Caption = 'Display'
          object PnlDisplayOuterClient: TUniPanel
            Left = 0
            Top = 0
            Width = 398
            Height = 219
            Hint = ''
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Caption = ''
            object PnlDisplay: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 396
              Height = 217
              Hint = ''
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 0
              Caption = ''
              Color = clWhite
              object PnlImage: TUniPanel
                Tag = 1999
                Left = 1
                Top = 1
                Width = 59
                Height = 215
                Hint = ''
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                TabOrder = 0
                Caption = ''
                ParentColor = True
                object imgResponse: TUniImage
                  Left = 5
                  Top = 4
                  Width = 48
                  Height = 48
                  Hint = ''
                  Center = True
                end
              end
              object rtfStatus: TRichEdit
                Left = 59
                Top = 0
                Width = 337
                Height = 217
                Align = alClient
                BorderStyle = bsNone
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 2
                WantTabs = True
                Zoom = 100
              end
            end
          end
        end
        object TabLog: TUniTabSheet
          Hint = ''
          ImageIndex = 1
          Caption = 'Log'
          object memResults: TUniMemo
            Left = 0
            Top = 0
            Width = 398
            Height = 219
            Hint = ''
            ScrollBars = ssVertical
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  object PnlOptions: TUniPanel
    Tag = 1999
    Left = 0
    Top = 73
    Width = 839
    Height = 120
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object PnlClient01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 399
      Height = 118
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object PnlLeft01: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 134
        Height = 116
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object lblMerchantAccount: TUniLabel
          Left = 8
          Top = 19
          Width = 87
          Height = 13
          Hint = ''
          Caption = 'Merchant Account'
          TabOrder = 1
        end
        object lblTransactionType: TUniLabel
          Left = 8
          Top = 43
          Width = 83
          Height = 13
          Hint = ''
          Caption = 'Transaction Type'
          TabOrder = 2
        end
        object Label1: TUniLabel
          Left = 8
          Top = 72
          Width = 57
          Height = 13
          Hint = ''
          Caption = 'Evaluate As'
          TabOrder = 3
        end
      end
      object PnlClient02: TUniPanel
        Tag = 1999
        Left = 134
        Top = 1
        Width = 265
        Height = 116
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        ExplicitHeight = 120
        DesignSize = (
          265
          116)
        object cmbMerchantAccount: TUniDBLookupComboBox
          Left = 1
          Top = 16
          Width = 260
          Height = 21
          Hint = ''
          ListFieldIndex = 0
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Color = clWindow
        end
        object cmbTransactionType: TUniComboBox
          Left = 1
          Top = 40
          Width = 260
          Height = 21
          Hint = ''
          Style = csDropDownList
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object rbResponse: TUniRadioButton
          Left = 1
          Top = 95
          Width = 68
          Height = 17
          Hint = ''
          Caption = 'Response'
          TabOrder = 2
        end
        object rbRequest: TUniRadioButton
          Left = 1
          Top = 72
          Width = 120
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Request (Test Mode)'
          TabOrder = 3
        end
      end
    end
    object Panel1: TUniPanel
      Tag = 1999
      Left = 399
      Top = 1
      Width = 440
      Height = 118
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnAnalyzeRequest: TUniButton
        Left = 8
        Top = 16
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Analyze'
        TabOrder = 1
        OnClick = Analyze1Click
      end
    end
  end
  object CaptionPanel1: TIQWebCaptionPanel
    Left = 0
    Top = 0
    Width = 839
    Height = 73
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = 'Analyze Transactions'
    ParentColor = True
    Text = 
      'This utility analyzes request and response data provided by cust' +
      'omers in order for IQMS developers to evaluate for possible erro' +
      'r conditions within the code.  This utility will be useless to a' +
      'nyone else.  To begin testing, load either the request or respon' +
      'se data, and set the following analysis parameters (all are requ' +
      'ired).  Click the Analyze button to display the results.'
    PictureLayout = plImageRight
    LayoutStyle = lsBasic
    DesignSize = (
      839
      73)
  end
  object MainMenu1: TUniMainMenu
    Left = 424
    Top = 40
    object File1: TUniMenuItem
      Caption = '&File'
      object OpenDataFile1: TUniMenuItem
        Caption = 'Open Input Data Request/Response File'
        OnClick = OpenDataFile1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Actions1: TUniMenuItem
      Caption = '&Actions'
      object ClearRequest1: TUniMenuItem
        Caption = 'Clear Input Request/Response'
        OnClick = ClearRequest1Click
      end
      object ClearResults1: TUniMenuItem
        Caption = 'Clear Results'
        OnClick = ClearResults1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object Analyze1: TUniMenuItem
        Caption = 'Analyze'
        OnClick = Analyze1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object QryAccount: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT id,'
      '         description,'
      '         gateway,'
      '         SUBSTRB(cc.gateway_descrip(gateway),'
      '                 1,'
      '                 60)'
      '            AS gateway_descrip,'
      '         eplant_id,'
      '         is_default,'
      '         archived,'
      '         merchant_name'
      '    FROM credit_card_account'
      'ORDER BY description')
    Left = 520
    Top = 48
    object QryAccountDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 60
    end
    object QryAccountGATEWAY_DESCRIP: TStringField
      DisplayLabel = 'Gateway'
      DisplayWidth = 30
      FieldName = 'GATEWAY_DESCRIP'
      Origin = 'GATEWAY_DESCRIP'
      Size = 60
    end
    object QryAccountMERCHANT_NAME: TStringField
      DisplayLabel = 'Merchant Name'
      DisplayWidth = 25
      FieldName = 'MERCHANT_NAME'
      Origin = 'MERCHANT_NAME'
      Size = 50
    end
    object QryAccountIS_DEFAULT: TStringField
      DisplayLabel = 'Is Default?'
      DisplayWidth = 10
      FieldName = 'IS_DEFAULT'
      Origin = 'IS_DEFAULT'
      Size = 1
    end
    object QryAccountEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Precision = 15
      Size = 0
    end
    object QryAccountARCHIVED: TStringField
      DisplayLabel = 'Archived?'
      DisplayWidth = 10
      FieldName = 'ARCHIVED'
      Origin = 'ARCHIVED'
      Size = 1
    end
    object QryAccountID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryAccountGATEWAY: TBCDField
      FieldName = 'GATEWAY'
      Origin = 'GATEWAY'
      Visible = False
      Precision = 3
      Size = 0
    end
  end
  object SrcAccount: TDataSource
    DataSet = QryAccount
    Left = 512
    Top = 40
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmCCTransAnalyzer'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194760 $'
    BuildVersion = '176554'
    Left = 480
    Top = 40
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.txt'
    Filter = 'Text Files (*.txt; *.xml)|*.txt; *.xml|Any File (*.*)|*.*'
    Left = 452
    Top = 40
  end
end

object FrmCrgMain: TFrmCrgMain
  Left = 227
  Top = 156
  ClientHeight = 273
  ClientWidth = 753
  Caption = 'Registered IQMS DCOM Applications'
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    000000000000000000000000000000060000000030000066E0FFFF0BB30006EE
    07777770BB3000E0888888880B00070788888888700007F7888888887F0007F7
    888788887F0007F7887078887F0007F7870207887F0007F770AA20777F0007FF
    FF0AA20FFF0007777770A077777000000000000000000000000000000000FFFF
    0000EFF700008001000080010000000000008001000080010000800100008001
    00008001000080010000800100008001000080010000FF7F0000FFFF0000}
  OnShow = FormShow
  Position = poDesktopCenter
  OldCreateOrder = False
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 27
    Width = 753
    Height = 246
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 180
      Top = 3
      Width = 6
      Height = 243
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 751
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Caption = ''
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 3
      Width = 180
      Height = 243
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel6: TUniPanel
        Left = 1
        Top = 1
        Width = 178
        Height = 241
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object lvMenu: TUniListBox
          Left = 1
          Top = 20
          Width = 176
          Height = 221
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          OnClick = lvMenuClick
          OnKeyDown = lvMenuKeyDown
          OnMouseDown = lvMenuMouseDown
        end
        object PnlCaption: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 176
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 1
          Caption = ''
          Color = clBtnShadow
          object lblCaption: TUniLabel
            Left = 1
            Top = 1
            Width = 44
            Height = 13
            Hint = ''
            Caption = 'Servers'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
    end
    object Panel3: TUniPanel
      Left = 186
      Top = 3
      Width = 567
      Height = 243
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        567
        243)
      object Label1: TUniLabel
        Left = 8
        Top = 28
        Width = 65
        Height = 13
        Hint = ''
        Caption = 'Registry Path'
        TabOrder = 7
      end
      object Label2: TUniLabel
        Left = 8
        Top = 52
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'GUID'
        TabOrder = 8
      end
      object Label3: TUniLabel
        Left = 8
        Top = 100
        Width = 61
        Height = 13
        Hint = ''
        Caption = 'Startup Path'
        TabOrder = 9
      end
      object sbtnChangeStartup: TUniSpeedButton
        Left = 540
        Top = 95
        Width = 22
        Height = 22
        Hint = 'Change Startup Path'
        ShowHint = True
        ParentShowHint = False
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
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Style = [fsBold]
        ParentColor = False
        Color = clWindow
        OnClick = sbtnChangeStartupClick
      end
      object Label4: TUniLabel
        Left = 8
        Top = 124
        Width = 52
        Height = 13
        Hint = ''
        Caption = 'File Exists?'
        TabOrder = 11
      end
      object Label7: TUniLabel
        Left = 10
        Top = 76
        Width = 104
        Height = 13
        Hint = ''
        Caption = 'Startup Registry Path'
        TabOrder = 12
      end
      object edtRegPath: TUniEdit
        Left = 128
        Top = 24
        Width = 433
        Height = 21
        Hint = ''
        Text = 'Unknown'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clBtnFace
      end
      object edtGUID: TUniEdit
        Left = 128
        Top = 48
        Width = 433
        Height = 21
        Hint = ''
        Text = 'Unknown'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clBtnFace
      end
      object edtStartupPath: TUniEdit
        Left = 128
        Top = 96
        Width = 410
        Height = 21
        Hint = ''
        Text = 'Unknown'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Color = clBtnFace
      end
      object edtFileExists: TUniEdit
        Left = 128
        Top = 120
        Width = 29
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 4
        Color = clBtnFace
      end
      object edtStartupRegPath: TUniEdit
        Left = 128
        Top = 72
        Width = 433
        Height = 21
        Hint = ''
        Text = 'Unknown'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clBtnFace
      end
      object btnUnregisterSelected: TUniButton
        Left = 10
        Top = 152
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Unregister'
        TabOrder = 13
        OnClick = Unregister1Click
      end
      object Panel4: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 565
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 6
        Caption = ''
        Color = clBtnShadow
        object Label5: TUniLabel
          Left = 1
          Top = 1
          Width = 39
          Height = 13
          Hint = ''
          Caption = 'Details'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
  end
  object TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 27
    Align = alTop
    TabOrder = 1
    object sbtnUnregisterAll: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 135
      Height = 25
      Hint = ''
      Caption = 'Unregister All'
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = UnregisterAll1Click
    end
    object sbtnRefresh: TUniSpeedButton
      Left = 727
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Refresh'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        7A040000424D7A0400000000000036000000280000001C0000000D0000000100
        18000000000044040000130B0000130B00000000000000000000008080008080
        008080008080008080DBDBDBDADADADBDBDB0080800080800080800080800080
        80008080008080008080008080008080008080DBDBDBDADADADBDBDB00808000
        8080008080008080008080008080008080008080008080008080D9D9D9CEB591
        D4C7B4DCDCDC0080800080800080800080800080800080800080800080800080
        80008080D9D9D9BABABAC9C9C9DCDCDC00808000808000808000808000808000
        8080008080008080008080D7D4CEC58E40CBA97ADADADA008080008080008080
        008080008080008080008080008080008080008080D4D4D4999999B0B0B0DADA
        DA008080008080008080008080008080008080008080008080008080DAD8D5C4
        8A37C58F42D6D6D6DCDCDC008080008080008080008080008080008080008080
        008080008080D8D8D8969696999999D6D6D6DCDCDC0080800080800080800080
        80008080008080008080008080008080C7944CBF7103CEC4B5DADADA008080DC
        DCDCDADADAD8D8D8D8D8D8D8D8D8DADADA0080800080800080809E9E9E818181
        C6C6C6DADADA008080DCDCDCDADADAD8D8D8D8D8D8D8D8D8DADADA0080800080
        80D8CCBABF7103C38B3AD2D2D2DBDBDB008080DBDBDBD4D4D4D0D0D0CDCDCDCD
        CDCDD1D1D1008080008080CECECE818181969696D2D2D2DBDBDB008080DBDBDB
        D4D4D4D0D0D0CDCDCDCDCDCDD1D1D1008080008080D1B48BBF7000C5995BD0D0
        D0DADADA008080BF7000BF7000BF7000BF7000BF7000CDCDCD008080008080BA
        BABA808080A2A2A2D0D0D0DADADA008080808080808080808080808080808080
        CDCDCD008080008080D0AC7ABF7000C4944FCDCDCDD5D5D5DADADADADADACAA3
        6CBF7000BF7000BF7000CDCDCD008080008080B3B3B38080809E9E9ECDCDCDD5
        D5D5DADADADADADAABABAB808080808080808080CDCDCD008080008080D4BD9C
        BF7000C0760CC9BEAECDCDCDD1D1D1CFC7BDC38732BF7000BF7000BF7000CFCF
        CF008080008080C1C1C1808080848484C0C0C0CDCDCDD1D1D1C9C9C993939380
        8080808080808080CFCFCF008080008080DDDBD9C37E1DBF7000C27B18C69E65
        C4934DBF750ABF7000BF7307C68F41BF7000D4D4D4008080008080DCDCDC8C8C
        8C808080898989A6A6A69D9D9D8383838080808282829A9A9A808080D4D4D400
        8080008080008080D9CCB9C48122BF7000BF7000BF7000BF7000C17A14D1BA99
        DBDAD9BF7000DBDBDB008080008080008080CFCFCF8E8E8E8080808080808080
        80808080888888BFBFBFDADADA808080DBDBDB00808000808000808000808000
        8080D4BC99D0AC7ACEAA76D3BC9BDAD6CF008080008080DEDDDB008080008080
        008080008080008080008080C0C0C0B3B3B3B1B1B1C0C0C0D7D7D70080800080
        80DDDDDD00808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080008080008080
        008080008080008080008080008080008080008080008080008080008080}
      Caption = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = Refresh1Click
    end
  end
  object PServerList: TUniPopupMenu
    Left = 55
    Top = 126
    object Refresh2: TUniMenuItem
      Caption = 'Refresh'
      ShortCut = 116
      OnClick = Refresh1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object Unregister2: TUniMenuItem
      Caption = 'Unregister'
      OnClick = Unregister1Click
    end
    object UnregisterAll1: TUniMenuItem
      Caption = 'Unregister All'
      OnClick = UnregisterAll1Click
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 35
    Top = 62
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Server1: TUniMenuItem
      Caption = '&Server'
      object Unregister1: TUniMenuItem
        Caption = '&Unregister'
        OnClick = Unregister1Click
      end
    end
    object View1: TUniMenuItem
      Caption = '&View'
      object Refresh1: TUniMenuItem
        Caption = '&Refresh'
        ShortCut = 116
        OnClick = Refresh1Click
      end
    end
  end
  object PUnreg: TUniPopupMenu
    Left = 107
    Top = 110
    object Unregister3: TUniMenuItem
      Caption = 'Unregister'
      OnClick = Unregister1Click
    end
    object UnregisterAll3: TUniMenuItem
      Caption = 'Unregister All'
      OnClick = UnregisterAll1Click
    end
  end
end

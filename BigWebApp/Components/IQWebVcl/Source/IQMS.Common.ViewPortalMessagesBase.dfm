object FrmViewPortalMsgBase: TFrmViewPortalMsgBase
  Left = 0
  Top = 0
  ClientHeight = 570
  ClientWidth = 635
  Caption = 'View Portal Messages'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 25
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object sbtnNewMessage: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 23
      Height = 23
      Hint = 'Send Message To Vendor'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCDCD47E8
        F4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFCCCCCCA8A8A8FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCCCCB2E0E083ECF626EA
        FF9CEAEBC4D2D1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFCCCCCCCDCDCDC5C5C59F9F9FCACACACCCCCCFF00FFFF00FFFF00FF
        FF00FFFF00FFCCC0BACAB0A2CAA796C79881AE998639DAED2CD2FC0E28FF22E3
        FF2B59FD3FE2F744E0F5FF00FFFF00FFFF00FFFF00FFC5C5C5BBBBBBB6B6B6AC
        ACACA4A4A49F9F9FA0A0A09595959D9D9DA0A0A0A7A7A7A6A6A6CAA492CA9B80
        C79371C6906CCB9C75D1A783D8B590DBB995DBBD998BDFE00970FF1DDBFF15CA
        FF0063FF47B5FCBED4D6B5B5B5AFAFAFA8A8A8A5A5A5ACACACB5B5B5BEBEBEC3
        C3C3C4C4C4BFBFBF9292929B9B9B9898988E8E8EADADADCBCBCBC89378E4BFA6
        FAE7D5F3DBC3EED8BAEED8BDF0D8C0F3DBC3F3DCC48CE6EE0C40FF1EDCFF02A5
        FF006CFF4CA5FCBED7D7ABABABCECECEEFEFEFE3E3E3DBDBDBDDDDDDE0E0E0E3
        E3E3E3E3E3C7C7C79393939C9C9C8F8F8F8E8E8EAFAFAFCDCDCDCDA089E8C7AD
        E7C3ABFFFFF7FFF7E7FFF0DFFFEEDEFFEEDEFFEEDE5EE9F625CDFE0230FF0086
        FF1757FD28E7FE6FDEE9B3B3B3D3D3D3D2D2D2FFFFFFF8F8F8F5F5F5F5F5F5F5
        F5F5F5F5F5B5B5B59E9E9E8F8F8F8E8E8E9898989F9F9FB3B3B3CAA492FFF0DF
        F7DBC7EECBB5FFFFF9FFFAEEF4D5C3FFFAEDFFFCEEDFB99EA0CFB570CBE42FE3
        F797D3CAB2B29EFF00FFB5B5B5F5F5F5E6E6E6D9D9D9FFFFFFFBFBFBE3E3E3FB
        FBFBFBFBFBC8C8C8C2C2C2B6B6B6A0A0A0BFBFBFB1B1B1FF00FFCAADA0FFF0E2
        FFF9EAFFF9E8E2B59DDEAD8FDFBD91D5A283DEAE94EACEAFE7CBA9DEC399D2B9
        8BD2B181C99C85FF00FFBABABAF6F6F6FAFAFAF9F9F9C9C9C9C0C0C0C2C2C2B7
        B7B7C4C4C4D5D5D5D1D1D1C6C6C6B9B9B9B5B5B5B0B0B0FF00FFCBBAB1F9DECE
        FFFFF4FFFDF3E7BDA6E4AF8BD8AE84CFA77BD2A080F9E4CEF0DBBDE7CEABDFC3
        99D8B98BC89D84FF00FFC1C1C1EAEAEAFFFFFFFFFFFFD0D0D0C2C2C2B9B9B9B0
        B0B0B4B4B4EAEAEADFDFDFD2D2D2C6C6C6BCBCBCB0B0B0FF00FFCCC8C6EECAB6
        FFFFFDFAE4D2E4B190F4D8BFEED8BADFBA95D2A97CDFB598FCEDD5F3DFC3E8D1
        AEE2C79DCB9D85FF00FFCACACADADADAFFFFFFECECECC4C4C4E2E2E2DBDBDBC4
        C4C4B3B3B3C5C5C5EFEFEFE3E3E3D4D4D4C9C9C9B1B1B1FF00FFFF00FFE3BBA4
        FFFFFAE4AF93FFE4CAFDEAD8FDEAD8F9E4CBE4C4A0D8AF84EECFB6FDEEDBF4E2
        C4EAD2AFCB9F86FF00FFFF00FFCCCCCCFFFFFFC6C6C6EBEBEBF1F1F1F1F1F1E9
        E9E9CBCBCBB9B9B9DADADAF2F2F2E4E4E4D5D5D5B1B1B1FF00FFFF00FFDAAF9A
        E7B9A1FFE7CFFFF7E8FFF9EAFFF9EAFFF9E8FDEEDCEACEA9D5AD81F0D5BFFDF0
        DBF4E2C4CDA087FF00FFFF00FFC3C3C3CDCDCDEEEEEEF9F9F9FAFAFAFAFAFAF9
        F9F9F3F3F3D3D3D3B6B6B6E0E0E0F2F2F2E4E4E4B3B3B3FF00FFFF00FFC9957C
        FFD8BDFFFCEDFFFFF4FFFFF9FFFFFAFFFFFAFFFFF9FFFAEAEED5B1D2A97FF3D5
        C0FDF0DCCEA189FF00FFFF00FFADADADE5E5E5FBFBFBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFAFAFAD8D8D8B4B4B4E2E2E2F3F3F3B4B4B4FF00FFFF00FFCCBFB9
        C9A28FCE9D84DAA48AEAB69CFDDBC4FFFCEEFFFFFAFFFFFDFFFFFAFCE4CAD8AE
        87F4DBC4D0A58CFF00FFFF00FFC4C4C4B3B3B3B3B3B3BCBCBCCCCCCCE7E7E7FB
        FBFBFFFFFFFFFFFFFFFFFFE9E9E9BABABAE4E4E4B6B6B6FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFCCCBCACBB5AAC9A593CD9C84D8A38AE5B49AFAD2BDFFE8
        CEE4B99DCD9C83FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCBCBCBBEBEBEB5
        B5B5B1B1B1BBBBBBC9C9C9E3E3E3EEEEEECACACAB2B2B2FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCAAFA2C594
        7DCA8B6FC6967EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFBBBBBBAAAAAAA9A9A9ACACACFF00FF}
      Caption = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnNewMessageClick
    end
  end
  object pcMain: TUniPageControl
    Left = 0
    Top = 25
    Width = 635
    Height = 545
    Hint = ''
    ActivePage = tabReceived
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    OnChange = pcMainChange
    object tabReceived: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Received Messages'
      object Panel5: TUniPanel
        Left = 0
        Top = 200
        Width = 627
        Height = 317
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Splitter3: TUniSplitter
          Left = 0
          Top = 0
          Width = 627
          Height = 3
          Cursor = crVSplit
          Hint = ''
          Align = alTop
          ParentColor = False
          Color = clBtnFace
        end
        object memReceivedBody: TUniMemo
          Left = 1
          Top = 3
          Width = 625
          Height = 314
          Hint = ''
          ScrollBars = ssVertical
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object Panel8: TUniPanel
        Left = 0
        Top = 0
        Width = 627
        Height = 200
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object dbgridReceivedMsg: TIQUniGridControl
          Left = 1
          Top = 27
          Width = 625
          Height = 173
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 408
          IQComponents.Grid.Height = 87
          IQComponents.Grid.Hint = ''
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
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 408
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
          Columns = <
            item
              FieldName = 'SENT_DATE'
              Title.Caption = 'Received Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SENT_TO'
              Title.Caption = 'From'
              Width = 350
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SUBJECT'
              Title.Caption = 'Subject'
              Width = 350
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'OPENED'
              Title.Caption = 'Opened'
              Width = 7
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ATTACHMENTS'
              Title.Caption = 'Attachments'
              Width = 7
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ARCHIVED'
              Title.Caption = 'Archived'
              Width = 7
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object Panel9: TUniPanel
          Left = 1
          Top = 1
          Width = 625
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object sbtnPkReceived: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = ''
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
              90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
              40905030773818FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
              00FFFF00FFB08060F0E8E0E0C8C0D0A890B07850804820FF00FFB09080FFF8FF
              E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
              B0C08870804830FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
              00FFFF00FFB08060F0E8E0F0E0E0E0C0B0C08870804830FF00FFC09880FFFFFF
              F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
              B0C08870804830FF00FFC3A494B08870A068509050308048308048208038108F
              4C26B08870A06850905830904830804020703810905830FF00FFDEC4B4B08870
              FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
              50803820CFA98AFF00FFFF00FFC09080F0F0F0FFF8F0F0D8C0B0806080482096
              5732B09070FFFFFFFFF8F0F0D0C0B07850804820FF00FFFF00FFFF00FFF8E2D2
              C09880B08060A068509050309058409D6842B07860B08870A070508048308048
              20ECC4A7FF00FFFF00FFFF00FFFF00FFC09880FFF8FFE0C0B0C09070804820FF
              00FFC09880FFF8FFE0C8B0D0A080804820FF00FFFF00FFFF00FFFF00FFFF00FF
              CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
              37FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1836DFFF8F0814527FF00FFFF
              00FFFF00FFB08068FFF8F0804324FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnSearchMessagesClick
          end
          object sbtnRefreshReceived: TUniSpeedButton
            Left = 600
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Refresh'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000C21E0000C21E00000001000000000000000000000084
              840084848400FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC660000FF66
              000000990000339900006699000099990000CC990000FF99000000CC000033CC
              000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
              0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
              330000333300333333006633330099333300CC333300FF333300006633003366
              33006666330099663300CC663300FF6633000099330033993300669933009999
              3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
              330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
              66006600660099006600CC006600FF0066000033660033336600663366009933
              6600CC336600FF33660000666600336666006666660099666600CC666600FF66
              660000996600339966006699660099996600CC996600FF99660000CC660033CC
              660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
              6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
              990000339900333399006633990099339900CC339900FF339900006699003366
              99006666990099669900CC669900FF6699000099990033999900669999009999
              9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
              990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
              CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
              CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
              CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
              CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
              CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
              FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
              FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
              FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
              FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0200020303030303030303030303040403030302020303030303030303030200
              0002030303030303030303030302030303030203030303030303030303030000
              0203030303030303030303030302030303020303030303030303030303020002
              0303030303030303030303030203030304030303030303030303030303000003
              0303030303030303030303030203030304030404040404040303030303000003
              0303000000000003030303030203030304020303030303040303030303000002
              0303030200000003030303030203030304010203030303040303030303020000
              0203020000000003030303030203030303040303030303040303030303030000
              0000000000020003030303030302030303030303030203040303030303030302
              0000000203030003030303030303020303030303020203040303030303030303
              0303030303030303030303030303030202020202030302030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303}
            Caption = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnRefreshReceivedClick
          end
          object DBNavigator3: TUniDBNavigator
            Left = 500
            Top = 1
            Width = 100
            Height = 25
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataSource = Src_Msg
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
    object tabSent: TUniTabSheet
      Hint = ''
      Caption = 'Sent Messages'
      object Splitter1: TUniSplitter
        Left = 0
        Top = 200
        Width = 627
        Height = 3
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object pnlTop: TUniPanel
        Left = 0
        Top = 0
        Width = 627
        Height = 200
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object wwdbGridSentMsg: TIQUniGridControl
          Left = 1
          Top = 27
          Width = 625
          Height = 173
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 408
          IQComponents.Grid.Height = 87
          IQComponents.Grid.Hint = ''
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
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 408
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
          Columns = <
            item
              FieldName = 'SENT_DATE'
              Title.Caption = 'Sent Date'
              Width = 126
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SENT_TO'
              Title.Caption = 'Sent To'
              Width = 350
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SUBJECT'
              Title.Caption = 'Subject'
              Width = 350
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'OPENED'
              Title.Caption = 'Opened'
              Width = 7
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ATTACHMENTS'
              Title.Caption = 'Attachments'
              Width = 7
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'ARCHIVED'
              Title.Caption = 'Archived'
              Width = 7
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object Panel2: TUniPanel
          Left = 1
          Top = 1
          Width = 625
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object sbtnPkSent: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = ''
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
              90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
              40905030773818FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
              00FFFF00FFB08060F0E8E0E0C8C0D0A890B07850804820FF00FFB09080FFF8FF
              E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
              B0C08870804830FF00FFB09080FFF8FFE0C8C0D0A090C08060804020FF00FFFF
              00FFFF00FFB08060F0E8E0F0E0E0E0C0B0C08870804830FF00FFC09880FFFFFF
              F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
              B0C08870804830FF00FFC3A494B08870A068509050308048308048208038108F
              4C26B08870A06850905830904830804020703810905830FF00FFDEC4B4B08870
              FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
              50803820CFA98AFF00FFFF00FFC09080F0F0F0FFF8F0F0D8C0B0806080482096
              5732B09070FFFFFFFFF8F0F0D0C0B07850804820FF00FFFF00FFFF00FFF8E2D2
              C09880B08060A068509050309058409D6842B07860B08870A070508048308048
              20ECC4A7FF00FFFF00FFFF00FFFF00FFC09880FFF8FFE0C0B0C09070804820FF
              00FFC09880FFF8FFE0C8B0D0A080804820FF00FFFF00FFFF00FFFF00FFFF00FF
              CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
              37FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1836DFFF8F0814527FF00FFFF
              00FFFF00FFB08068FFF8F0804324FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnSearchMessagesClick
          end
          object sbtnRefreshSent: TUniSpeedButton
            Left = 600
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Refresh'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360400002800000020000000100000000100
              08000000000000020000C21E0000C21E00000001000000000000000000000084
              840084848400FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CC660000FF66
              000000990000339900006699000099990000CC990000FF99000000CC000033CC
              000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
              0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
              330000333300333333006633330099333300CC333300FF333300006633003366
              33006666330099663300CC663300FF6633000099330033993300669933009999
              3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
              330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
              66006600660099006600CC006600FF0066000033660033336600663366009933
              6600CC336600FF33660000666600336666006666660099666600CC666600FF66
              660000996600339966006699660099996600CC996600FF99660000CC660033CC
              660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
              6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
              990000339900333399006633990099339900CC339900FF339900006699003366
              99006666990099669900CC669900FF6699000099990033999900669999009999
              9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
              990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
              CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
              CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
              CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
              CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
              CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
              FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
              FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
              FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
              FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0200020303030303030303030303040403030302020303030303030303030200
              0002030303030303030303030302030303030203030303030303030303030000
              0203030303030303030303030302030303020303030303030303030303020002
              0303030303030303030303030203030304030303030303030303030303000003
              0303030303030303030303030203030304030404040404040303030303000003
              0303000000000003030303030203030304020303030303040303030303000002
              0303030200000003030303030203030304010203030303040303030303020000
              0203020000000003030303030203030303040303030303040303030303030000
              0000000000020003030303030302030303030303030203040303030303030302
              0000000203030003030303030303020303030303020203040303030303030303
              0303030303030303030303030303030202020202030302030303030303030303
              0303030303030303030303030303030303030303030303030303030303030303
              0303030303030303030303030303030303030303030303030303}
            Caption = ''
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = sbtnRefreshReceivedClick
          end
          object navEmp: TUniDBNavigator
            Left = 500
            Top = 1
            Width = 100
            Height = 25
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataSource = Src_Msg
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
      object pnlMid: TUniPanel
        Left = 0
        Top = 203
        Width = 627
        Height = 185
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object pnlBody: TUniPanel
          Left = 1
          Top = 1
          Width = 625
          Height = 183
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object memSentBody: TUniMemo
            Left = 1
            Top = 1
            Width = 623
            Height = 181
            Hint = ''
            ScrollBars = ssVertical
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object pnlBottom: TUniPanel
        Left = 0
        Top = 388
        Width = 627
        Height = 129
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 0
          Top = 27
          Width = 627
          Height = 1
          Cursor = crVSplit
          Hint = ''
          Align = alTop
          ParentColor = False
          Color = clBtnFace
        end
        object pnlAttachments: TUniPanel
          Left = 1
          Top = 28
          Width = 625
          Height = 101
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object grpAttachments: TUniGroupBox
            Left = 1
            Top = 1
            Width = 623
            Height = 99
            Hint = ''
            Caption = 'Attachments'
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            object wwgridSentAttach: TIQUniGridControl
              Left = 2
              Top = 15
              Width = 619
              Height = 82
              Layout = 'border'
              ParentAlignmentControl = False
              AlignmentControl = uniAlignmentClient
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              Font.Color = clBlue
              Font.Style = [fsUnderline]
              TabOrder = 0
              ParentFont = False
              IQComponents.Grid.Left = 0
              IQComponents.Grid.Top = 29
              IQComponents.Grid.Width = 402
              IQComponents.Grid.Height = 434
              IQComponents.Grid.Hint = ''
              IQComponents.Grid.DataSource = Src_MsgAttach
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
              IQComponents.Navigator.DataSource = Src_MsgAttach
              IQComponents.Navigator.LayoutConfig.Region = 'east'
              IQComponents.Navigator.TabOrder = 3
              IQComponents.HiddenPanel.Left = 402
              IQComponents.HiddenPanel.Top = 29
              IQComponents.HiddenPanel.Width = 209
              IQComponents.HiddenPanel.Height = 434
              IQComponents.HiddenPanel.Hint = ''
              IQComponents.HiddenPanel.Visible = True
              IQComponents.HiddenPanel.Align = alRight
              IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
              IQComponents.FormTab.Hint = ''
              IQComponents.FormTab.ImageIndex = 1
              IQComponents.FormTab.Caption = 'Form'
              IQComponents.FormTab.Layout = 'border'
              DataSource = Src_MsgAttach
              Columns = <
                item
                  FieldName = 'FILE_NAME'
                  Title.Caption = 'Filename'
                  Width = 1785
                  CheckBoxField.FieldValues = 'true;false'
                end>
              Marker = 0
            end
          end
        end
        object Panel13: TUniPanel
          Left = 1
          Top = 1
          Width = 625
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Caption = ''
          object sbtnOpenAttachment: TUniSpeedButton
            Left = 1
            Top = 1
            Width = 25
            Height = 25
            Hint = 'Open Attachment'
            Enabled = False
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF404040404040FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF40404040
              4040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800000E00000C020404040FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1A6
              A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800000E00000E00000C020404040FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1C1
              C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800000E00000E00000E00000C020404040FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1C1
              C1C1C1C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800000E00000FF0000E00000E00000C020404040FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC1C1C1DC
              DCDCC1C1C1C1C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800000E02000E00000FF0000E00000E00000C0204040
              40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC2C2C2C1
              C1C1DCDCDCC1C1C1C1C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800040E00000E02000E00000FF0000E00000E00000C0
              20404040FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC2C2C2C2
              C2C2C1C1C1DCDCDCC1C1C1C1C1C1A6A6A6404040FF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800040E0A000FF0000E02000E00000FF0000E00000E0
              00008000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DCDCDCDDC
              DCDCC2C2C2C1C1C1DCDCDCC1C1C1C1C1C16D6D6DFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800040E0A000FF0000FF0000E02000E00040E0A00080
              00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DCDCDCDDC
              DCDCDCDCDCC2C2C2C1C1C1CDCDCD6D6D6DFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800080E02000FF0000FF0000FF0000E020008000FF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC4C4C4DC
              DCDCDCDCDCDCDCDCC2C2C26D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF00800080E02000FF0000FF0080E020008000FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DC4C4C4DC
              DCDCDCDCDCC4C4C46D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF008000C0DCC000FF0080E020008000FF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DD5D5D5DC
              DCDCC4C4C46D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF008000C0DCC0C0DCC0008000FF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DD5D5D5D5
              D5D56D6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF008000C0DCC0008000FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DD5D5D56D
              6D6DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF008000FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D6D6DFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnOpenAttachmentClick
          end
          object DBNavigator1: TUniDBNavigator
            Left = 525
            Top = 1
            Width = 100
            Height = 25
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataSource = Src_MsgAttach
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
          end
        end
      end
    end
  end
  object Src_Msg: TDataSource
    OnDataChange = Src_MsgDataChange
    Left = 493
    Top = 87
  end
  object MainMenu1: TUniMainMenu
    Left = 392
    Top = 141
    object File1: TUniMenuItem
      Caption = 'File'
      object RecallMessage1: TUniMenuItem
        Caption = '&Recall Message'
        OnClick = RecallMessage1Click
      end
      object ArchiveMessage1: TUniMenuItem
        Caption = 'Archive Message'
        OnClick = ArchiveMessage1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = 'Options'
      object ViewArchived1: TUniMenuItem
        Caption = 'View Archived'
        OnClick = ViewArchived1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmViewSentMsgs'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 190894 $'
    BuildVersion = '176554'
    Left = 152
    Top = 182
  end
  object Src_MsgAttach: TDataSource
    DataSet = Qry_USER_MESSAGE_ATTACH
    OnDataChange = Src_MsgAttachDataChange
    Left = 498
    Top = 314
  end
  object QryUSER_MESSAGE: TFDQuery
    BeforeOpen = QryPR_EMP_MESSAGEBeforeOpen
    BeforeScroll = QryUSER_MESSAGEBeforeScroll
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select m.id as id,'
      '       case'
      '        when'
      '          (1 = :receivedflag) then'
      '          ( m.sent_by )'
      '          else'
      '          ( select v.company'
      '           from vendor v, vendor_rma r'
      '          where v.id = r.vendor_id'
      '            and r.id = :source_id )'
      '       end as SENT_TO,'
      '       m.sent_by as SENT_FROM,'
      '       m.sent_date as SENT_DATE,'
      '       m.subject as SUBJECT,'
      '       m.message as MESSAGE,'
      '       nvl(m.opened, '#39'N'#39') as OPENED,'
      '       nvl(m.archived, '#39'N'#39') as ARCHIVED,'
      '       (select count(id)'
      '            from user_message_attach a'
      '           where user_message_id = m.id'
      '             and a.file_name is not null'
      '             and m.id = a.user_message_id) as NUMATTACHMENTS,'
      '       case'
      '         when'
      '         ( select count(id)'
      '            from user_message_attach a'
      '           where user_message_id = m.id'
      '             and a.file_name is not null'
      '             and m.id = a.user_message_id ) > 0 then '#39'Y'#39
      '         else '#39'N'#39
      '       end as ATTACHMENTS'
      '  from USER_MESSAGE M,'
      '       USER_MESSAGE_ATTACH AT'
      ' where m.source_id = :source_id'
      '   and m.id = at.user_message_id(+)'
      '   and nvl(m.archived, '#39'N'#39') = :archived'
      '   and ((sent_by != :currentuser and 1 = :receivedflag )'
      '        or'
      '        (sent_by = :currentuser and  1 = :sentflag ))'
      ' order by m.id desc')
    Left = 560
    Top = 149
    ParamData = <
      item
        Name = 'source_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'archived'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'receivedflag'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'currentuser'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'sentflag'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryUSER_MESSAGEID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryUSER_MESSAGESENT_TO: TStringField
      FieldName = 'SENT_TO'
      Size = 60
    end
    object QryUSER_MESSAGESENT_FROM: TStringField
      FieldName = 'SENT_FROM'
      Size = 35
    end
    object QryUSER_MESSAGESENT_DATE: TDateTimeField
      FieldName = 'SENT_DATE'
    end
    object QryUSER_MESSAGESUBJECT: TStringField
      FieldName = 'SUBJECT'
      Size = 250
    end
    object QryUSER_MESSAGEMESSAGE: TStringField
      FieldName = 'MESSAGE'
      Size = 2000
    end
    object QryUSER_MESSAGEOPENED: TStringField
      FieldName = 'OPENED'
      Size = 1
    end
    object QryUSER_MESSAGEATTACHMENTS: TStringField
      FieldName = 'ATTACHMENTS'
      FixedChar = True
      Size = 1
    end
    object QryUSER_MESSAGEARCHIVED: TStringField
      FieldName = 'ARCHIVED'
      Size = 1
    end
    object QryUSER_MESSAGENUMATTACHMENTS: TFMTBCDField
      FieldName = 'NUMATTACHMENTS'
      Size = 38
    end
  end
  object PkReceivedMsg: TIQWebHpick
    BeforeOpen = QryPR_EMP_MESSAGEBeforeOpen
    SQL.Strings = (
      'select m.id as id,'
      '       ( select company from iqsys ) as SENT_TO,'
      '       m.sent_date as SENT_DATE,'
      '       m.subject as SUBJECT,'
      '       m.message as MESSAGE,'
      '       nvl(m.opened, '#39'N'#39') as OPENED,'
      '       nvl(m.archived, '#39'N'#39') as ARCHIVED,'
      '       (select count(id)'
      '            from user_message_attach a'
      '           where user_message_id = m.id'
      '             and a.file_name is not null'
      '             and m.id = a.user_message_id) as NUMATTACHMENTS,'
      '       case'
      '         when'
      '         ( select count(id)'
      '            from user_message_attach a'
      '           where user_message_id = m.id'
      '             and a.file_name is not null'
      '             and m.id = a.user_message_id ) > 0 then '#39'Y'#39
      '         else '#39'N'#39
      '       end as ATTACHMENTS'
      '-- HPICK_FROM_START'
      '  from USER_MESSAGE M,'
      '       USER_MESSAGE_ATTACH AT'
      ''
      '-- HPICK_WHERE_START'
      ' where m.source_id = :source_id'
      '   and m.id = at.user_message_id(+)'
      '   and nvl(m.archived, '#39'N'#39') = :archived'
      '   and ((sent_by != :currentuser and 1 = :receivedflag )'
      '        or'
      '        (sent_by = :currentuser and  1 = :sentflag ))'
      ' order by m.id desc')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 260
    Top = 119
    ParamData = <
      item
        Name = 'source_id'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'archived'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'receivedflag'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'currentuser'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'sentflag'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object PkReceivedMsgID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkReceivedMsgSENT_TO: TStringField
      DisplayLabel = 'Recipient'
      FieldName = 'SENT_TO'
      Size = 60
    end
    object PkReceivedMsgSENT_DATE: TDateTimeField
      DisplayLabel = 'Received Date'
      FieldName = 'SENT_DATE'
    end
    object PkReceivedMsgSUBJECT: TStringField
      DisplayLabel = 'Subject'
      FieldName = 'SUBJECT'
      Size = 250
    end
    object PkReceivedMsgOPENED: TStringField
      DisplayLabel = 'Opened'
      FieldName = 'OPENED'
      Size = 1
    end
    object PkReceivedMsgARCHIVED: TStringField
      DisplayLabel = 'Archived'
      FieldName = 'ARCHIVED'
      Size = 1
    end
    object PkReceivedMsgNUMATTACHMENTS: TFMTBCDField
      DisplayLabel = 'Number of Attachments'
      FieldName = 'NUMATTACHMENTS'
      Size = 38
    end
    object PkReceivedMsgATTACHMENTS: TStringField
      DisplayLabel = 'Has Attachments'
      FieldName = 'ATTACHMENTS'
      FixedChar = True
      Size = 1
    end
  end
  object Qry_USER_MESSAGE_ATTACH: TFDQuery
    BeforeOpen = Qry_USER_MESSAGE_ATTACHBeforeOpen
    MasterSource = Src_Msg
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.id,'
      '       a.user_message_id,'
      '       a.file_name,'
      '       a.file_data'
      ' from user_message_attach a'
      'where a.user_message_id = :id'
      '')
    Left = 546
    Top = 466
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object StringField11: TStringField
      DisplayWidth = 255
      FieldName = 'FILE_NAME'
      Origin = 'IQ.PR_EMP_MESSAGE_ATTACH.FILE_NAME'
      Size = 255
    end
    object FloatField4: TBCDField
      DisplayLabel = 'Attachment ID'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.PR_EMP_MESSAGE_ATTACH.ID'
      Visible = False
      Size = 0
    end
    object BlobField1: TBlobField
      FieldName = 'FILE_DATA'
      Origin = 'IQ.PR_EMP_MESSAGE_ATTACH.FILE_DATA'
    end
  end
  object PkSentMsg: TIQWebHpick
    BeforeOpen = QryPR_EMP_MESSAGEBeforeOpen
    SQL.Strings = (
      'select m.id as id,'
      '       ( select company from iqsys ) as SENT_TO,'
      '       m.sent_date as SENT_DATE,'
      '       m.subject as SUBJECT,'
      '       m.message as MESSAGE,'
      '       nvl(m.opened, '#39'N'#39') as OPENED,'
      '       nvl(m.archived, '#39'N'#39') as ARCHIVED,'
      '       (select count(id)'
      '            from user_message_attach a'
      '           where user_message_id = m.id'
      '             and a.file_name is not null'
      '             and m.id = a.user_message_id) as NUMATTACHMENTS,'
      '       case'
      '         when'
      '         ( select count(id)'
      '            from user_message_attach a'
      '           where user_message_id = m.id'
      '             and a.file_name is not null'
      '             and m.id = a.user_message_id ) > 0 then '#39'Y'#39
      '         else '#39'N'#39
      '       end as ATTACHMENTS'
      '-- HPICK_FROM_START'
      '  from USER_MESSAGE M,'
      '       USER_MESSAGE_ATTACH AT'
      ''
      '-- HPICK_WHERE_START'
      ' where m.source_id = :source_id'
      '   and m.id = at.user_message_id(+)'
      '   and nvl(m.archived, '#39'N'#39') = :archived'
      '   and ((sent_by != :currentuser and 1 = :receivedflag )'
      '        or'
      '        (sent_by = :currentuser and  1 = :sentflag ))'
      ' order by m.id desc')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 308
    Top = 119
    ParamData = <
      item
        Name = 'source_id'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'archived'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'receivedflag'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'currentuser'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'sentflag'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object PkSentMsgID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkSentMsgSENT_TO: TStringField
      DisplayLabel = 'Sent To'
      FieldName = 'SENT_TO'
      Size = 60
    end
    object PkSentMsgSENT_DATE: TDateTimeField
      DisplayLabel = 'Sent Date'
      FieldName = 'SENT_DATE'
    end
    object PkSentMsgSUBJECT: TStringField
      DisplayLabel = 'Subject'
      FieldName = 'SUBJECT'
      Size = 250
    end
    object PkSentMsgOPENED: TStringField
      DisplayLabel = 'Opened'
      FieldName = 'OPENED'
      Size = 1
    end
    object PkSentMsgARCHIVED: TStringField
      DisplayLabel = 'Archived'
      FieldName = 'ARCHIVED'
      Size = 1
    end
    object PkSentMsgNUMATTACHMENTS: TFMTBCDField
      DisplayLabel = 'Number of Attachments'
      FieldName = 'NUMATTACHMENTS'
      Size = 38
    end
    object PkSentMsgATTACHMENTS: TStringField
      DisplayLabel = 'Has Attachments'
      FieldName = 'ATTACHMENTS'
      FixedChar = True
      Size = 1
    end
  end
end

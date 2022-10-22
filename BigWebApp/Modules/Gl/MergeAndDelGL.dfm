object FrmMergeAndDelGL: TFrmMergeAndDelGL
  Left = 0
  Top = 0
  ClientHeight = 617
  ClientWidth = 903
  Caption = 'Merge & Delete GL Account'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 903
    Height = 73
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 901
      Height = 71
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object GroupBoxSelect: TUniGroupBox
        Left = 1
        Top = 1
        Width = 899
        Height = 69
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '  GL Account to Merge Into  '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          899
          69)
        object sbtnSearch: TUniSpeedButton
          Left = 860
          Top = 13
          Width = 28
          Height = 25
          Hint = 'Search...'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
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
          Anchors = [akTop, akRight]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnSearchClick
        end
        object Label4: TUniLabel
          Left = 10
          Top = 22
          Width = 54
          Height = 13
          Hint = ''
          Caption = 'GL Account'
          TabOrder = 4
        end
        object Label5: TUniLabel
          Left = 10
          Top = 46
          Width = 54
          Height = 13
          Hint = ''
          Caption = 'Major Type'
          TabOrder = 5
        end
        object EdGlAcct: TUniEdit
          Left = 73
          Top = 16
          Width = 780
          Height = 19
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Color = clBtnFace
        end
        object EditMajorType: TUniEdit
          Left = 73
          Top = 41
          Width = 780
          Height = 19
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clBtnFace
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 73
    Width = 903
    Height = 525
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel7: TUniPanel
      Left = 1
      Top = 1
      Width = 901
      Height = 44
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Shape4: TUniPanel
        Left = 273
        Top = 15
        Width = 13
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ShowHint = True
        ParentShowHint = False
        TabOrder = 1
        Caption = ''
      end
      object Label1: TUniLabel
        Left = 292
        Top = 15
        Width = 307
        Height = 13
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '- Different EPlant Plug-in values in Merge/Merge Into account(s)'
        TabOrder = 2
      end
      object BtnClear: TUniButton
        Left = 130
        Top = 5
        Width = 117
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Clear Selection'
        TabOrder = 3
        OnClick = BtnClearClick
      end
      object BtnApply: TUniButton
        Left = 5
        Top = 5
        Width = 117
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Apply Selection'
        TabOrder = 4
        OnClick = BtnApplyClick
      end
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 45
      Width = 901
      Height = 479
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel4: TUniPanel
        Left = 1
        Top = 436
        Width = 899
        Height = 42
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = ''
        object Panel8: TUniPanel
          Left = 604
          Top = 1
          Width = 294
          Height = 40
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object BtnMerge: TUniBitBtn
            Left = 6
            Top = 5
            Width = 148
            Height = 31
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Merge and Delete'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -13
            TabOrder = 0
            OnClick = BtnMergeClick
          end
          object BtnClose: TUniButton
            Left = 166
            Top = 5
            Width = 120
            Height = 31
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Caption = 'Close'
            TabOrder = 2
            OnClick = Exit1Click
          end
        end
      end
      object Panel14: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 899
        Height = 435
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 495
          Top = 1
          Width = 6
          Height = 433
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object Panel9: TUniPanel
          Left = 1
          Top = 1
          Width = 494
          Height = 433
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Panel13: TUniPanel
            Tag = 1999
            Left = 1
            Top = 1
            Width = 492
            Height = 25
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -13
            TabOrder = 0
            Caption = ''
            Color = clBtnShadow
            object Label3: TUniLabel
              Left = 1
              Top = 1
              Width = 155
              Height = 16
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Caption = 'Available GL Account(s)'
              Align = alLeft
              Anchors = [akLeft, akTop, akBottom]
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -13
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
          object ListViewSelect: TUniListView
            Left = 1
            Top = 26
            Width = 492
            Height = 406
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            RowCount = 1
            ColCount = 4
            Options = [goVertLine, goHorzLine, goRangeSelect]
            Columns = <
              item
                Title.Caption = 'Account'
                Caption = 'Account'
                AutoSize = False
                Width = 185
              end
              item
                Title.Caption = 'Description'
                Caption = 'Description'
                AutoSize = False
                Width = 185
              end
              item
                Title.Caption = 'EPlant ID'
                Caption = 'EPlant ID'
                AutoSize = False
                Width = 123
              end>
            Items = <>
            MultiSelect = True
            OnColumnClick = ListViewSelectColumnClick
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
          end
        end
        object Panel15: TUniPanel
          Tag = 1999
          Left = 501
          Top = 1
          Width = 397
          Height = 433
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Panel10: TUniPanel
            Left = 1
            Top = 1
            Width = 39
            Height = 431
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 0
            Caption = ''
            DesignSize = (
              39
              431)
            object Panel12: TUniPanel
              Left = -2
              Top = 103
              Width = 43
              Height = 159
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Anchors = [akLeft, akRight]
              TabOrder = 0
              Caption = ''
              object BtnRight: TUniSpeedButton
                Left = 6
                Top = 0
                Width = 31
                Height = 31
                Hint = 'Add'
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001A0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  88888888F8888800000088888808888888888887FF8888000000888888008888
                  8888888778F8880000008888880608888888FFF7F78F88000000880000066088
                  888777778878F80000008806666666088887F88888878F000000880666666660
                  8887F8888888780000008806666666088887FFFFF88788000000880000066088
                  88877777F8788800000088888806088888888887F78888000000888888008888
                  8888888778888800000088888808888888888887888888000000888888888888
                  88888888888888000000}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = BtnRightClick
              end
              object BtnAllRight: TUniSpeedButton
                Left = 6
                Top = 39
                Width = 31
                Height = 31
                Hint = 'Add All'
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001C0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDDDDDDDDDDDD0000DDDDD0DD0DDDDDDDDD7FD7FDDDDD0000DDDDD00D00DD
                  DDDDDD77F77FDDDD0000DDDDD060060DDDDDDD787787FDDD0000D00000660660
                  DD77777F87F87FDD0000D066666660660D78FFF8F87F87FD0000D06666666606
                  607888888F87F87D0000D066666660660D788888887887DD0000D00000660660
                  DD77777887887DDD0000DDDDD060060DDDDDDD787787DDDD0000DDDDD00D00DD
                  DDDDDD77D77DDDDD0000DDDDD0DD0DDDDDDDDD7DD7DDDDDD0000DDDDDDDDDDDD
                  DDDDDDDDDDDDDDDD0000}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = BtnAllRightClick
              end
              object BtnLeft: TUniSpeedButton
                Left = 6
                Top = 90
                Width = 31
                Height = 31
                Hint = 'Remove'
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  46010000424D460100000000000076000000280000001A0000000D0000000100
                  040000000000D000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888888800000088888808888888888887F88888000000888880088888
                  88888877F8888800000088880608888888888787FFFFF8000000888066000008
                  888878877777F8000000880666666608888788888887F8000000806666666608
                  8878F8888887F800000088066666660888878F88FFF7F8000000888066000008
                  888878F777778800000088880608888888888787F88888000000888880088888
                  88888877F8888800000088888808888888888887888888000000888888888888
                  88888888888888000000}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = BtnLeftClick
              end
              object BtnAllLeft: TUniSpeedButton
                Left = 6
                Top = 128
                Width = 31
                Height = 31
                Hint = 'Remove All'
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ShowHint = True
                ParentShowHint = False
                Glyph.Data = {
                  56010000424D560100000000000076000000280000001C0000000E0000000100
                  040000000000E000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                  DDDDDDDDDDDDDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDD0000DDDDD0DD0DDD
                  DDDDDDD7FD7FDDDD0000DDDD00D00DDDDDDDDD77F77FDDDD0000DDD060060DDD
                  DDDDD787787FFFFF0000DD06606600000DDD78878877777F0000D06606666666
                  0DD788788888887F00000660666666660D78F78F8888887F0000D06606666666
                  0DD78F78F88FFF7F0000DD06606600000DDD78F78F77777D0000DDD060060DDD
                  DDDDD787787FDDDD0000DDDD00D00DDDDDDDDD77F77FDDDD0000DDDDD0DD0DDD
                  DDDDDDD7DD7DDDDD0000DDDDDDDDDDDDDDDDDDDDDDDDDDDD0000}
                Caption = ''
                ParentColor = False
                Color = clWindow
                OnClick = BtnAllLeftClick
              end
            end
          end
          object Panel16: TUniPanel
            Left = 40
            Top = 1
            Width = 356
            Height = 431
            Hint = ''
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            Caption = ''
            object Panel17: TUniPanel
              Tag = 1999
              Left = 1
              Top = 1
              Width = 354
              Height = 25
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -13
              TabOrder = 0
              Caption = ''
              Color = clBtnShadow
              object Label2: TUniLabel
                Left = 1
                Top = 1
                Width = 196
                Height = 16
                Hint = ''
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Selected Account(s) to Merge'
                Align = alLeft
                Anchors = [akLeft, akTop, akBottom]
                ParentFont = False
                Font.Color = clWhite
                Font.Height = -13
                Font.Style = [fsBold]
                TabOrder = 1
              end
            end
            object ListViewMerge: TUniListView
              Left = 1
              Top = 26
              Width = 354
              Height = 404
              Hint = ''
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              RowCount = 1
              ColCount = 4
              Options = [goVertLine, goHorzLine, goRangeSelect]
              Columns = <
                item
                  Title.Caption = 'Account'
                  Caption = 'Account'
                  AutoSize = False
                  Width = 185
                end
                item
                  Title.Caption = 'Description'
                  Caption = 'Description'
                  AutoSize = False
                  Width = 185
                end
                item
                  Title.Caption = 'EPlant ID'
                  Caption = 'EPlant ID'
                  AutoSize = False
                  Width = 123
                end>
              Items = <>
              MultiSelect = True
              PopupMenu = PopupMenuMerge
              Align = alClient
              Anchors = [akLeft, akTop, akRight, akBottom]
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 598
    Width = 903
    Height = 19
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object MainMenu1: TUniMainMenu
    Left = 696
    Top = 80
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'Merge & Delete GL Account'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196863 $'
    BuildVersion = '176554'
    Left = 720
    Top = 72
  end
  object PkGLAcct: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select    g.id as id,'
      '          g.Acct as Acct,'
      '          g.Descrip as Descrip,'
      '          s.Descrip as Type,'
      '          g.eplant_id as eplant_id,'
      '         g.majortype as majortype'
      '     from glacct g, '
      '          glsub_acct_type s'
      '    where g.gl_subacct_type_id = s.id'
      '    order by '
      '         g.acct'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 744
    Top = 72
    object PkGLAcctACCT: TStringField
      DisplayLabel = 'Account #'
      FieldName = 'ACCT'
      Size = 50
    end
    object PkGLAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
    object PkGLAcctID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkGLAcctTYPE: TStringField
      DisplayLabel = 'Account Type'
      FieldName = 'TYPE'
      Origin = 'GLSUB_ACCT_TYPE.DESCRIP'
      Size = 35
    end
    object PkGLAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object PkGLAcctMAJORTYPE: TStringField
      DisplayLabel = 'Major Type'
      FieldName = 'MAJORTYPE'
      Origin = 'IQ.GLACCT.MAJORTYPE'
      Size = 35
    end
  end
  object QryAcct: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from GLACCT'
      '')
    Left = 776
    Top = 74
    object QryAcctID: TBCDField
      FieldName = 'ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.ID'
      Size = 0
    end
    object QryAcctACCT: TStringField
      FieldName = 'ACCT'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.ACCT'
      Size = 50
    end
    object QryAcctDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.DESCRIP'
      Size = 50
    end
    object QryAcctTYPE: TStringField
      FieldName = 'TYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.TYPE'
      Size = 25
    end
    object QryAcctGL_SUBACCT_TYPE_ID: TBCDField
      FieldName = 'GL_SUBACCT_TYPE_ID'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.GL_SUBACCT_TYPE_ID'
      Size = 0
    end
    object QryAcctMAJORTYPE: TStringField
      FieldName = 'MAJORTYPE'
      Origin = 'V_GLACCT_GLSUB_ACCT_TYPE.MAJORTYPE'
      Size = 35
    end
    object QryAcctEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.V_GLACCT_GLSUB_ACCT_TYPE.EPLANT_ID'
      Size = 0
    end
  end
  object PopupMenuMerge: TUniPopupMenu
    Left = 795
    Top = 75
    object SelectAll3: TUniMenuItem
      Caption = 'Select All'
      OnClick = SelectAll3Click
    end
    object DeselectAll3: TUniMenuItem
      Caption = 'Deselect All'
      OnClick = DeselectAll3Click
    end
    object InvertSelection2: TUniMenuItem
      Caption = 'Invert Selection'
      OnClick = InvertSelection2Click
    end
  end
end

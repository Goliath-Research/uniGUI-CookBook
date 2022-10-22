object RTAddress: TRTAddress
  Left = 196
  Top = 180
  HelpContext = 5082
  ClientHeight = 436
  ClientWidth = 811
  Caption = 'RealTime Addresses Board'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  Font.Color = clBlack
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 429
    Top = 0
    Width = 6
    Height = 413
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 435
    Top = 0
    Width = 376
    Height = 413
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = 'Panel1'
    object Bevel2: TUniPanel
      Left = 1
      Top = 47
      Width = 374
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Caption = ''
    end
    object Splitter2: TUniSplitter
      Left = 0
      Top = 294
      Width = 376
      Height = 4
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Panel8: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 374
      Height = 47
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Panel9: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 372
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label3: TUniLabel
          Left = 1
          Top = 1
          Width = 101
          Height = 13
          Hint = ''
          Caption = 'Available Address'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel10: TUniPanel
        Tag = 1999
        Left = 1
        Top = 20
        Width = 372
        Height = 27
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object sbtnSearchAvailAddr: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 25
          Height = 23
          Hint = 'Search'
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
          OnClick = sbtnSearchAvailAddrClick
        end
        object NavAvailable: TUniDBNavigator
          Left = 197
          Top = 1
          Width = 175
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataSource = SrcRT_Address
          VisibleButtons = [nbFirst, nbPrior, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
        object Panel4: TUniPanel
          Left = 176
          Top = 1
          Width = 21
          Height = 25
          Hint = ''
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object Shape3: TUniPanel
            Left = 1
            Top = 7
            Width = 10
            Height = 11
            Hint = 'Address is assigned to a work center'
            ShowHint = True
            ParentShowHint = False
            TabOrder = 1
            Caption = ''
          end
        end
      end
    end
    object Panel5: TUniPanel
      Left = 1
      Top = 298
      Width = 374
      Height = 115
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Panel6: TUniPanel
        Left = 1
        Top = 1
        Width = 372
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = '  Assigned To'
        object NavAssignedTo: TUniDBNavigator
          Left = 254
          Top = 1
          Width = 118
          Height = 26
          Hint = ''
          DataSource = SrcAssignedTo
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object wwDBGridAssignedTo: TIQUniGridControl
        Left = 1
        Top = 28
        Width = 372
        Height = 87
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Color = clBlack
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 155
        IQComponents.Grid.Height = 1
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcAssignedTo
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
        IQComponents.Navigator.DataSource = SrcAssignedTo
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 155
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 1
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcAssignedTo
        Columns = <
          item
            FieldName = 'EQNO'
            Title.Caption = 'Work Center'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CNTR_DESC'
            Title.Caption = 'Description'
            Width = 315
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
    object pnlGrid: TUniPanel
      Left = 1
      Top = 50
      Width = 374
      Height = 244
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      object grdAvail: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 372
        Height = 242
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Color = clBlack
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 155
        IQComponents.Grid.Height = 156
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcRT_Address
        IQComponents.Grid.LoadMask.Message = 'Loading data...'
        IQComponents.Grid.Align = alClient
        IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
        IQComponents.Grid.TabOrder = 0
        IQComponents.Grid.OnDrawColumnCell = grdAvailDBGridDrawColumnCell
        IQComponents.Navigator.Left = 410
        IQComponents.Navigator.Top = 0
        IQComponents.Navigator.Width = 241
        IQComponents.Navigator.Height = 25
        IQComponents.Navigator.Hint = ''
        IQComponents.Navigator.ShowHint = True
        IQComponents.Navigator.DataSource = SrcRT_Address
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 155
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 156
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcRT_Address
        Columns = <
          item
            FieldName = 'BOARD_POSITION'
            Title.Caption = 'Board'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'ADDRESS'
            Title.Caption = 'Address'
            Width = 84
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Logical Work Center Description'
            Width = 231
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 413
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    Caption = 'Panel2'
    object Bevel1: TUniPanel
      Left = 1
      Top = 47
      Width = 427
      Height = 3
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
      Caption = ''
    end
    object Panel7: TUniPanel
      Left = 398
      Top = 50
      Width = 31
      Height = 363
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      DesignSize = (
        31
        363)
      object PnlButtons: TUniPanel
        Left = 1
        Top = 148
        Width = 29
        Height = 84
        Hint = ''
        Anchors = [akLeft]
        TabOrder = 0
        Caption = ''
        object sbtnLeft: TUniSpeedButton
          Left = 3
          Top = 16
          Width = 25
          Height = 25
          Hint = ''
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
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Style = [fsBold]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnLeftClick
        end
        object sbtnRight: TUniSpeedButton
          Left = 3
          Top = 43
          Width = 25
          Height = 25
          Hint = ''
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
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Style = [fsBold]
          ParentColor = False
          Color = clWindow
          OnClick = sbtnRightClick
        end
      end
    end
    object grdCurrent: TIQUniGridControl
      Left = 1
      Top = 50
      Width = 398
      Height = 363
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Color = clBlack
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 181
      IQComponents.Grid.Height = 277
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcILLUM_RT
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
      IQComponents.Navigator.DataSource = SrcILLUM_RT
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 181
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 277
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcILLUM_RT
      Columns = <
        item
          FieldName = 'EQNO'
          Title.Caption = 'Work Center #'
          Width = 77
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'RT_ADDRESS'
          Title.Caption = 'RT Address'
          Width = 49
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SCRAP_ADDRESS'
          Title.Caption = 'Scrap Address'
          Width = 63
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Cntr_Desc'
          Title.Caption = 'Center Description'
          Width = 175
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
    object PnlToolbar: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 427
      Height = 47
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      object PnlToolbarCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 425
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object lblCaptionLabel: TUniLabel
          Left = 1
          Top = 1
          Width = 113
          Height = 13
          Hint = ''
          Caption = 'Current Assignment'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object PnlToolbarInner: TUniPanel
        Tag = 1999
        Left = 1
        Top = 20
        Width = 425
        Height = 27
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object sbtnSearchCurrAddr: TUniSpeedButton
          Left = 1
          Top = 1
          Width = 25
          Height = 23
          Hint = 'Search Current Assignment'
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
          OnClick = sbtnSearchCurrAddrClick
        end
        object NavCurrent: TUniDBNavigator
          Left = 275
          Top = 1
          Width = 150
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataSource = SrcILLUM_RT
          VisibleButtons = [nbFirst, nbLast, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 413
    Width = 811
    Height = 4
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 417
    Width = 811
    Height = 19
    Hint = ''
    Panels = <
      item
        Text = 'Count:'
        Width = 75
      end
      item
        Text = 'Licensed:'
        Width = 85
      end
      item
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object SrcRT_Address: TDataSource
    DataSet = TblRT_Address
    OnDataChange = SrcRT_AddressDataChange
    Left = 197
    Top = 139
  end
  object TblIllum_Rt: TFDTable
    BeforePost = TblIllum_RtBeforePost
    AfterPost = TblIllum_RtAfterPost
    AfterDelete = TblIllum_RtAfterPost
    OnCalcFields = TblIllum_RtCalcFields
    OnFilterRecord = TblIllum_RtFilterRecord
    IndexFieldNames = 'WORK_CENTER_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'ILLUM_RT'
    TableName = 'ILLUM_RT'
    Left = 40
    Top = 195
    object TblIllum_RtEQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 11
      FieldKind = fkLookup
      FieldName = 'EQNO'
      LookupDataSet = TblWorkCenter
      LookupKeyFields = 'ID'
      LookupResultField = 'EQNO'
      KeyFields = 'WORK_CENTER_ID'
      Size = 25
      Lookup = True
    end
    object TblIllum_RtRT_ADDRESS: TStringField
      DisplayLabel = 'RT Address'
      DisplayWidth = 7
      FieldName = 'RT_ADDRESS'
    end
    object TblIllum_RtSCRAP_ADDRESS: TStringField
      DisplayLabel = 'Scrap Address'
      DisplayWidth = 9
      FieldName = 'SCRAP_ADDRESS'
    end
    object TblIllum_RtCntr_Desc: TStringField
      DisplayLabel = 'Center Description'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'Cntr_Desc'
      Size = 50
      Calculated = True
    end
    object TblIllum_RtWORK_CENTER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORK_CENTER_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblIllum_RtID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object TblIllum_RtIS_VIRTUAL: TStringField
      FieldName = 'IS_VIRTUAL'
      Visible = False
      Size = 1
    end
    object TblIllum_RtPARENT_WORK_CENTER_ID: TBCDField
      FieldName = 'PARENT_WORK_CENTER_ID'
      Visible = False
      Size = 0
    end
    object TblIllum_RtCOMPLEX_CHILD: TStringField
      FieldName = 'COMPLEX_CHILD'
      Visible = False
      Size = 1
    end
  end
  object SrcILLUM_RT: TDataSource
    DataSet = TblIllum_Rt
    OnDataChange = SrcILLUM_RTDataChange
    Left = 40
    Top = 163
  end
  object TblWorkCenter: TFDTable
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'WORK_CENTER'
    TableName = 'WORK_CENTER'
    Left = 96
    Top = 179
  end
  object pkCurrAddr: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select i.id,'
      '       w.eqno,'
      '       w.cntr_desc,'
      '       i.rt_address,'
      '       i.scrap_address'
      '  from illum_rt i,'
      '       work_center w'
      ' where i.work_center_id = w.id')
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = SrcILLUM_RT
    ForceShowWaitForPrompt = False
    Left = 104
    Top = 131
    object pkCurrAddrID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ILLUM_RT.ID'
      Visible = False
      Size = 0
    end
    object pkCurrAddrEQNO: TStringField
      DisplayLabel = 'Work Center #'
      FieldName = 'EQNO'
      Origin = 'IQ.WORK_CENTER.EQNO'
      FixedChar = True
      Size = 60
    end
    object pkCurrAddrCNTR_DESC: TStringField
      DisplayLabel = 'Center Description'
      FieldName = 'CNTR_DESC'
      Origin = 'IQ.WORK_CENTER.CNTR_DESC'
      FixedChar = True
      Size = 250
    end
    object pkCurrAddrRT_ADDRESS: TStringField
      DisplayLabel = 'RT Address'
      FieldName = 'RT_ADDRESS'
      Origin = 'IQ.ILLUM_RT.RT_ADDRESS'
    end
    object pkCurrAddrSCRAP_ADDRESS: TStringField
      DisplayLabel = 'Scrap Address'
      FieldName = 'SCRAP_ADDRESS'
      Origin = 'IQ.ILLUM_RT.SCRAP_ADDRESS'
    end
  end
  object pkAvailAddr: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select a.board_position as board_position,'
      '       a.address as address,'
      '       '
      '       case (select count(*)'
      '               from illum_rt rt'
      
        '              where (rtrim(rt.rt_address) = rtrim(a.address) or ' +
        'rtrim(rt.scrap_address) = rtrim(a.address)))'
      '         when 0 then '
      '                    null'
      '         when 1 then        '
      '                    (select w.eqno '
      '                      from illum_rt rt, work_center w '
      
        '                     where (rtrim(rt.rt_address) = rtrim(a.addre' +
        'ss) or rtrim(rt.scrap_address) = rtrim(a.address))'
      '                       and rt.work_center_id = w.id)'
      '         else  '#39'<Multiple>'#39
      '       end as Assigned_To'
      '       '
      '       '
      '-- HPICK_FROM_START'
      '  from rt_address a'
      ''
      ''
      '  '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = SrcRT_Address
    ForceShowWaitForPrompt = False
    Left = 468
    Top = 140
    object pkAvailAddrBOARD_POSITION: TStringField
      DisplayLabel = 'Board'
      FieldName = 'BOARD_POSITION'
      Origin = 'IQ.RT_ADDRESS.BOARD_POSITION'
      FixedChar = True
      Size = 4
    end
    object pkAvailAddrADDRESS: TStringField
      DisplayLabel = 'Address'
      FieldName = 'ADDRESS'
      Origin = 'IQ.RT_ADDRESS.ADDRESS'
    end
    object pkAvailAddrASSIGNED_TO: TStringField
      DisplayLabel = 'Assigned To'
      DisplayWidth = 30
      FieldName = 'ASSIGNED_TO'
      FixedChar = True
      Size = 60
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 200
    Top = 181
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
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
    ModuleName = 'RTAddress'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196014 $'
    BuildVersion = '176554'
    Left = 236
    Top = 181
  end
  object SrcAssignedTo: TDataSource
    DataSet = QryAssignedTo
    Left = 248
    Top = 120
  end
  object QryAssignedTo: TFDQuery
    MasterSource = SrcRT_Address
    MasterFields = 'ADDRESS'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select w.eqno,'
      '       w.cntr_desc'
      '  from illum_rt rt, work_center w'
      
        ' where (rtrim(rt.rt_address) = rtrim(:address) or rtrim(rt.scrap' +
        '_address) = rtrim(:address))'
      '   and rt.work_center_id = w.id'
      ' order by w.eqno')
    Left = 248
    Top = 136
    ParamData = <
      item
        Name = 'address'
        DataType = ftString
        ParamType = ptInput
        Size = 21
        Value = '599'
      end>
    object QryAssignedToEQNO: TStringField
      DisplayLabel = 'Work Center'
      DisplayWidth = 10
      FieldName = 'EQNO'
      FixedChar = True
      Size = 60
    end
    object QryAssignedToCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 45
      FieldName = 'CNTR_DESC'
      FixedChar = True
      Size = 250
    end
  end
  object TblRT_Address: TFDQuery
    OnCalcFields = TblRT_AddressCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'RT_ADDRESS'
    UpdateOptions.KeyFields = 'ADDRESS'
    SQL.Strings = (
      'select board_position,'
      '       address,'
      '       descrip'
      '  from rt_address')
    Left = 196
    Top = 104
    object TblRT_AddressBOARD_POSITION: TStringField
      DisplayLabel = 'Board'
      DisplayWidth = 10
      FieldName = 'BOARD_POSITION'
      Size = 4
    end
    object TblRT_AddressADDRESS: TStringField
      DisplayLabel = 'Address'
      DisplayWidth = 12
      FieldName = 'ADDRESS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TblRT_AddressDESCRIP: TStringField
      DisplayLabel = 'Logical Work Center Description'
      DisplayWidth = 33
      FieldName = 'DESCRIP'
      Size = 50
    end
    object TblRT_AddressIsAssignedToWorkCenter: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'IsAssignedToWorkCenter'
      Visible = False
      Size = 1
      Calculated = True
    end
  end
end

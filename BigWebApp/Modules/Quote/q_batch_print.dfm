object FrmQ_Batch_Print: TFrmQ_Batch_Print
  Left = 253
  Top = 171
  HelpContext = 1253011
  ClientHeight = 429
  ClientWidth = 739
  Caption = 'RFQ Batch Print'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 320
    Top = 0
    Width = 6
    Height = 388
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object pnlAvail: TUniPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 388
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 21
      Width = 318
      Height = 366
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 101
      IQComponents.Grid.Height = 280
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcQuote
      IQComponents.Grid.LoadMask.Message = 'Loading data...'
      IQComponents.Grid.Align = alClient
      IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
      IQComponents.Grid.TabOrder = 0
      IQComponents.Grid.OnDrawColumnCell = IQSearch1DBGridDrawColumnCell
      IQComponents.Navigator.Left = 410
      IQComponents.Navigator.Top = 0
      IQComponents.Navigator.Width = 241
      IQComponents.Navigator.Height = 25
      IQComponents.Navigator.Hint = ''
      IQComponents.Navigator.ShowHint = True
      IQComponents.Navigator.DataSource = SrcQuote
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 101
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 280
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcQuote
      Columns = <
        item
          FieldName = 'RFQ'
          Title.Caption = 'RFQ #'
          Width = 140
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QUOTE_REV'
          Title.Caption = 'Rev'
          Width = 49
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'QUOTE_DATE'
          Title.Caption = 'Date IN'
          Width = 126
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMPANY'
          Title.Caption = 'Customer Name'
          Width = 210
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object PnlAvailableQuotes: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 318
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 1
      Caption = ''
      Color = clBtnShadow
      object lblAvailableQuotes: TUniLabel
        Left = 1
        Top = 1
        Width = 95
        Height = 13
        Hint = ''
        Caption = 'Available Quotes'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
  object pnlSelected: TUniPanel
    Left = 358
    Top = 0
    Width = 381
    Height = 388
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 1
      Top = 266
      Width = 379
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alBottom
      ParentColor = False
      Color = clBtnFace
    end
    object wwDBGridSelected: TIQUniGridControl
      Left = 1
      Top = 21
      Width = 379
      Height = 245
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 162
      IQComponents.Grid.Height = 159
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcQuoteBatchDetail
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
      IQComponents.Navigator.DataSource = SrcQuoteBatchDetail
      IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.Navigator.BeforeAction = CheckRefresh
      IQComponents.HiddenPanel.Left = 162
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 159
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcQuoteBatchDetail
      Columns = <
        item
          FieldName = 'RFQ'
          Title.Caption = 'RFQ #'
          Width = 252
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object pnlNotes: TUniPanel
      Left = 1
      Top = 269
      Width = 379
      Height = 118
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object DBMemo1: TUniDBMemo
        Left = 1
        Top = 48
        Width = 377
        Height = 69
        Hint = ''
        DataField = 'NOTE1'
        DataSource = SrcQuoteBatch
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
      object Panel2: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 377
        Height = 47
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        object PnlNoteCaption: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 375
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          TabOrder = 0
          Caption = ''
          Color = clBtnShadow
          object lblNote: TUniLabel
            Left = 1
            Top = 1
            Width = 26
            Height = 13
            Hint = ''
            Caption = 'Note'
            Align = alLeft
            Anchors = [akLeft, akTop, akBottom]
            ParentFont = False
            Font.Color = clWhite
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object Panel8: TUniPanel
          Tag = 1999
          Left = 1
          Top = 21
          Width = 375
          Height = 25
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          object sbtnEditNote: TUniSpeedButton
            Left = 0
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Edit Note'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFFFFFFFDDDDD00000000
              00DDDDDD7777777777FDDDDD0FFFFFFFF0DDDDDD7FDDDDDDD7FDDDDD0FFFFFFF
              F0DDDDDD7FDDDDDDD7FDDDDD0FF80FFFF0DDDDDD7FD87FDDD7FDDDDD0F800FFF
              F0DDDDDD7F877FDDD7FDDDDD080B0FFFF0DDDDDD787F7DDDD7FDDDDD00B0FFFF
              F0DDDDDD77F7DDDDD7FDDDDD0B0FFFFFF0DDDDDD7F7DDDDDD7FDDDD0B0FFFFFF
              F0DDDDD7F7DDDDDDD7FDDD0B0FFFFFFFF0DDDD7F7FDDDDDDD7FDD0B07FFFFFFF
              F0DDD7F77FFFFFFFF7FDD90D0000000000DDD77D7777777777DDDDDDDDDDDDDD
              DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
            Caption = ''
            ParentColor = False
            Color = clWindow
            OnClick = sbtnEditNoteClick
          end
          object DBNavigator2: TUniDBNavigator
            Left = 299
            Top = 1
            Width = 75
            Height = 23
            Hint = ''
            DataSource = SrcQuoteBatch
            VisibleButtons = [nbPost, nbCancel, nbRefresh]
            Align = alRight
            Anchors = [akTop, akRight, akBottom]
            TabOrder = 0
            BeforeAction = CheckRefresh
          end
        end
      end
    end
    object PnlToolbar: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 379
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      object PnlToolbarCaption: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 377
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object lblSelectedQuotes: TUniLabel
          Left = 1
          Top = 1
          Width = 92
          Height = 13
          Hint = ''
          Caption = 'Selected Quotes'
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
    Left = 0
    Top = 388
    Width = 739
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel4: TUniPanel
      Left = 407
      Top = 1
      Width = 331
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnProperties: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Properties'
        TabOrder = 1
        OnClick = btnPropertiesClick
      end
      object btnPrint: TUniButton
        Left = 120
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Print'
        TabOrder = 2
        OnClick = btnPrintClick
      end
      object btnCancel: TUniButton
        Left = 224
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 3
      end
    end
  end
  object Panel5: TUniPanel
    Left = 326
    Top = 0
    Width = 32
    Height = 388
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 3
    Caption = ''
    object SBRight: TUniSpeedButton
      Left = 3
      Top = 113
      Width = 25
      Height = 25
      Hint = 'Add'
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
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF809080D5C1ADFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C
        8C8CBFBFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF809080202020B4A690FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C
        8C8C202020A3A3A3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF809080407850202020B8A791FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C
        8C8C6E6E6E202020A4A4A4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF809880202820303830304030404840509060407850202020B7A48DFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2525253535353B3B3B46
        46468484846E6E6E202020A1A1A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF80A090B0E8C070B08070A88060A07060987060A870407850202020B5A1
        89FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B9B9BDDDDDDA3A3A39D9D9D94
        94948D8D8D9A9A9A6E6E6E2020209E9E9EFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF90A890B0F0C090E0B090D8A080D0A070C09070B88060A8705090606078
        60FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA2A2A2E3E3E3D2D2D2C9C9C9C2
        C2C2B3B3B3AAAAAA9A9A9A848484717171FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF90B8A0B0F0D0B0F0C0B0E8C0A0E8C0A0E0B070C09070B080809880CDC2
        ABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1E6E6E6E3E3E3DDDDDDDC
        DCDCD3D3D3B3B3B3A3A3A3919191BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF90C0A090B8A090A89080A090809880B0E8C080C890809880CEC5AEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB7B7B7B1B1B1A2A2A29B9B9B91
        9191DDDDDDBABABA919191C1C1C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF80A090A0E0C0809880D0C8B2FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9B
        9B9BD6D6D6919191C5C5C5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF90A890809880D1CBB6FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA2
        A2A2919191C8C8C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF90B8A0DFD6BDFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1
        B1B1D2D2D2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentFont = False
      Font.Color = clBlack
      Font.Style = [fsBold]
      ParentColor = False
      Color = clWindow
      OnClick = SBRightClick
    end
    object SBLeft: TUniSpeedButton
      Left = 3
      Top = 140
      Width = 25
      Height = 25
      Hint = 'Remove'
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
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFD5C1AD303830FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBF
        BFBF353535FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFD5C2AF304030304030FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0C0C03B
        3B3B3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFD8C8B7607860508060304030FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C671717177
        77773B3B3BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFD8C9B850605060987070A8804048403040303038302028202020
        20FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC7C7C75B5B5B8D8D8D9D
        9D9D4646463B3B3B353535252525202020FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFCDC2AE50685070A88090D8A070C09060A8806098705090604080503038
        30FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBF6262629D9D9DC9C9C9B3
        B3B39C9C9C8D8D8D848484747474353535FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF90B8A0C0F0D0B0F0C090E0B090D8A080C89070B88060B0705088603040
        30FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1E7E7E7E3E3E3D2D2D2C9
        C9C9BABABAAAAAAAA1A1A17D7D7D3B3B3BFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFDFDAC3A0D0B0C0F8D0B0E8C090E0B0A0E0C0A0D8B090C8A090C0904048
        40FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6D6D6C7C7C7EDEDEDDDDDDDD2
        D2D2D6D6D6CDCDCDBDBDBDB4B4B4464646FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFDFD8C1A0C8B0C0F8D0B0E8C040584090A89080A09080A0908098
        80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4D4D4C1C1C1EDEDEDDD
        DDDD525252A2A2A29B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFDFD8C0A0C8B0C0F0D0505850FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4D4D4C1C1C1E7
        E7E7555555FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFDFD7BEA0C0A0507060FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3D3D3B8
        B8B86A6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFDFD6BCA0C0A0FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD2
        D2D2B8B8B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentFont = False
      Font.Color = clBlack
      Font.Style = [fsBold]
      ParentColor = False
      Color = clWindow
      OnClick = SBLeftClick
    end
  end
  object SrcQuote: TDataSource
    DataSet = QryQuote
    Left = 22
    Top = 101
  end
  object QryQuote: TFDQuery
    BeforeOpen = QryQuoteBeforeOpen
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      '       q.id,'
      '       q.rfq,'
      '       q.tool_status,'
      '       q.primary_mat_status,'
      '       q.component_status,'
      '       q.packaging_status,'
      '       q.quote_status,'
      '       q.quote_date,'
      '       q.due_date,'
      '       q.out_date,'
      '       q.sales_engineer,'
      '       a.company,'
      '       q.tool_type,'
      '       q.part_type,'
      '       q.follow_up_date,'
      '       q.quote_rev,'
      '       decode( d.id, null, '#39'N'#39', '#39'Y'#39') as is_selected'
      '  from quote q, '
      '       arcusto a,'
      '       quote_batch_detail d'
      ' where q.arcusto_id = a.id(+)'
      '   and misc.eplant_filter( q.eplant_id ) = 1     '
      '   '
      '   and d.quote_batch_id(+) = :quote_batch_id'
      '   and q.id = d.quote_id(+)'
      '           ')
    Left = 23
    Top = 120
    ParamData = <
      item
        Name = 'quote_batch_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryQuoteRFQ: TStringField
      DisplayLabel = 'RFQ #'
      DisplayWidth = 20
      FieldName = 'RFQ'
      Origin = 'q.rfq'
      ReadOnly = True
      FixedChar = True
    end
    object QryQuoteQUOTE_REV: TBCDField
      DisplayLabel = 'Rev'
      DisplayWidth = 7
      FieldName = 'QUOTE_REV'
      Origin = 'q.quote_rev'
      Size = 0
    end
    object QryQuoteQUOTE_DATE: TDateTimeField
      DisplayLabel = 'Date IN'
      DisplayWidth = 18
      FieldName = 'QUOTE_DATE'
      Origin = 'q.quote_date'
    end
    object QryQuoteCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'a.company'
      ReadOnly = True
      Size = 60
    end
    object QryQuoteID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryQuoteIS_SELECTED: TStringField
      FieldName = 'IS_SELECTED'
      Visible = False
      Size = 1
    end
  end
  object SrcQuoteBatch: TDataSource
    DataSet = QryQuoteBatch
    Left = 77
    Top = 102
  end
  object QryQuoteBatch: TFDQuery
    BeforeOpen = QryQuoteBatchBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLQuoteBatch
    SQL.Strings = (
      'select id,'
      '       userid,'
      '       timestamp,'
      '       note1    '
      '  from quote_batch'
      ' where id = :quote_batch_id'
      '')
    Left = 77
    Top = 120
    ParamData = <
      item
        Name = 'quote_batch_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryQuoteBatchID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryQuoteBatchUSERID: TStringField
      FieldName = 'USERID'
      Size = 35
    end
    object QryQuoteBatchTIMESTAMP: TDateTimeField
      FieldName = 'TIMESTAMP'
    end
    object QryQuoteBatchNOTE1: TStringField
      FieldName = 'NOTE1'
      Size = 4000
    end
  end
  object SrcQuoteBatchDetail: TDataSource
    DataSet = QryQuoteBatchDetail
    Left = 121
    Top = 102
  end
  object QryQuoteBatchDetail: TFDQuery
    BeforePost = QryQuoteBatchDetailBeforePost
    OnNewRecord = QryQuoteBatchDetailNewRecord
    MasterSource = SrcQuoteBatch
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLQuoteBatchDetail
    SQL.Strings = (
      'select d.id,'
      '       d.quote_batch_id,'
      '       d.quote_id,'
      '       q.rfq'
      '  from quote_batch_detail d, quote q'
      ' where d.quote_batch_id = :id'
      '   and d.quote_id = q.id'
      ' order by q.rfq'
      '')
    Left = 121
    Top = 122
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryQuoteBatchDetailRFQ: TStringField
      DisplayLabel = 'RFQ #'
      DisplayWidth = 36
      FieldName = 'RFQ'
      Origin = 'IQ.QUOTE.RFQ'
      FixedChar = True
    end
    object QryQuoteBatchDetailID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.QUOTE_BATCH_DETAIL.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryQuoteBatchDetailQUOTE_BATCH_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'QUOTE_BATCH_ID'
      Origin = 'IQ.QUOTE_BATCH_DETAIL.QUOTE_BATCH_ID'
      Visible = False
      Size = 0
    end
    object QryQuoteBatchDetailQUOTE_ID: TBCDField
      DisplayLabel = 'RFQ #'
      DisplayWidth = 10
      FieldName = 'QUOTE_ID'
      Origin = 'IQ.QUOTE_BATCH_DETAIL.QUOTE_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQLQuoteBatchDetail: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into quote_batch_detail'
      '  (ID, QUOTE_BATCH_ID, QUOTE_ID)'
      'values'
      '  (:ID, :QUOTE_BATCH_ID, :QUOTE_ID)')
    ModifySQL.Strings = (
      'update quote_batch_detail'
      'set'
      '  ID = :ID,'
      '  QUOTE_BATCH_ID = :QUOTE_BATCH_ID,'
      '  QUOTE_ID = :QUOTE_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from quote_batch_detail'
      'where'
      '  ID = :OLD_ID')
    Left = 121
    Top = 198
  end
  object UpdateSQLQuoteBatch: TFDUpdateSQL
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'insert into quote_batch'
      '  (TIMESTAMP, NOTE1)'
      'values'
      '  (:TIMESTAMP, :NOTE1)')
    ModifySQL.Strings = (
      'update quote_batch'
      'set'
      '  TIMESTAMP = :TIMESTAMP,'
      '  NOTE1 = :NOTE1'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from quote_batch'
      'where'
      '  ID = :OLD_ID')
    Left = 77
    Top = 149
  end
  object MainMenu1: TUniMainMenu
    Left = 164
    Top = 101
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
    ModuleName = 'RFQ Batch Print'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 197
    Top = 101
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnPrint'
      'btnProperties')
    SecurityCode = 'FRMQ_BATCH_PRINT'
    Left = 231
    Top = 101
  end
end

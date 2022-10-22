object FrmXMLSetup: TFrmXMLSetup
  Left = 8
  Top = 180
  HelpContext = 13166
  ClientHeight = 388
  ClientWidth = 462
  Caption = 'XML Setup'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PC: TUniPageControl
    Left = 0
    Top = 0
    Width = 462
    Height = 388
    Hint = ''
    ActivePage = TabSet
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object TabData: TUniTabSheet
      Hint = ''
      Caption = 'Data'
      object Splitter1: TUniSplitter
        Left = 0
        Top = 140
        Width = 454
        Height = 3
        Cursor = crVSplit
        Hint = ''
        Align = alTop
        ParentColor = False
        Color = clBtnFace
      end
      object IQSearchDtl: TIQUniGridControl
        Left = 0
        Top = 170
        Width = 454
        Height = 190
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 237
        IQComponents.Grid.Height = 104
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcDtl
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
        IQComponents.Navigator.DataSource = SrcDtl
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 237
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 104
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcDtl
        Columns = <
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SCHEMA_NO'
            Title.Caption = 'Schema#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EXECUTE_PROC'
            Title.Caption = 'Proc. to Execute'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'XSLT_FILE_NAME'
            Title.Caption = 'XSLT File Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SCHEMA_TYPE'
            Title.Caption = 'Schema Type'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'XSLTAssigned'
            Title.Caption = 'XSLT Assigned'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DATE_PROCESSED'
            Title.Caption = 'Last Process Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
        object DBProc: TUniEdit
          Left = 136
          Top = 64
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
        end
      end
      object Panel1: TUniPanel
        Left = 0
        Top = 0
        Width = 454
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = '  XML partners'
        object NavHdr: TUniDBNavigator
          Left = 213
          Top = 1
          Width = 240
          Height = 25
          Hint = ''
          DataSource = SrcHdr
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object IQSearchHdr: TIQUniGridControl
        Left = 0
        Top = 27
        Width = 454
        Height = 113
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 237
        IQComponents.Grid.Height = 27
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcHdr
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
        IQComponents.Navigator.DataSource = SrcHdr
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 237
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 27
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcHdr
        Columns = <
          item
            FieldName = 'DESCRIP'
            Title.Caption = 'Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PARTNER_NO'
            Title.Caption = 'Partner#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PARTNER_TYPE'
            Title.Caption = 'Partner Type'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PARTNERNO'
            Title.Caption = 'Vendor/Customer#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PARTNER'
            Title.Caption = 'Vendor/Customer'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        TabsVisible = True
        Marker = 0
        object DBPartnerType: TUniDBComboBox
          Left = 136
          Top = 40
          Width = 121
          Height = 21
          Hint = ''
          Style = csDropDownList
          Items.Strings = (
            'CUSTOMER'
            'VENDOR')
          TabOrder = 3
        end
        object DBPartner: TUniEdit
          Left = 128
          Top = 80
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 2
        end
      end
      object Panel2: TUniPanel
        Left = 0
        Top = 143
        Width = 454
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Alignment = taLeftJustify
        Caption = '  XML Schemas'
        object SBStoreToDataBase: TUniSpeedButton
          Left = 80
          Top = 4
          Width = 23
          Height = 22
          Hint = 'Store XSLT to database'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            7E010000424D7E01000000000000760000002800000016000000160000000100
            0400000000000801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888008888888888888888888888008888888888888888888888008880
            00000000000088888800888877777777777088888800888F8888888888708888
            8800888F88888888887088888800888F89988888887088888800888FFFFFFFFF
            FF88888888008888088888888888888888008880008888800000008888008800
            0008880FBFBFBF08880088870888880BFBFBFB08880088870788880FBFBFBF08
            880088870000000BFBFBFB08880088877777770000BFBF08880088888888880B
            FB00008888008888888888800088888888008888888888888888888888008888
            8888888888888888880088888888888888888888880088888888888888888888
            8800}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = StoreXSLTtodatabase1Click
        end
        object SBExtractToFile: TUniSpeedButton
          Left = 103
          Top = 4
          Width = 23
          Height = 22
          Hint = 'Extract XSLT to file'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            7E010000424D7E01000000000000760000002800000016000000160000000100
            0400000000000801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888008888888888888888888888008888888888888888888888008880
            00000000000088888800888877777777777088888800888F8888888888708888
            8800888F88888888887088888800888F89988888887088888800888FFFFFFFFF
            FF88888888008888888888888888888888008880088888800000008888008880
            0888880FBFBFBF08880088800880880BFBFBFB08880088800780080FBFBFBF08
            880088870000000BFBFBFB08880088888880080000BFBF08880088888880880B
            FB00008888008888888888800088888888008888888888888888888888008888
            8888888888888888880088888888888888888888880088888888888888888888
            8800}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = ExtractXSLTRtofile1Click
        end
        object SBViewXSL: TUniSpeedButton
          Left = 126
          Top = 4
          Width = 23
          Height = 22
          Hint = 'View XSLT'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            7E010000424D7E01000000000000760000002800000016000000160000000100
            0400000000000801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888008888888888888888888888008888888888888888888888008888
            8888888888888000880088888888888888888088880088888888888888888088
            88008000000000008888808888007888888888880888808888007FFFFFFFFFF8
            0888888888007FFFFFFFFFF80888870788007888888888880888808088007FFF
            FFFFFFFF0888880088007FFFFFFFFFFF08888008880078888888888808888080
            88007FFFFFFFFFFF0888870788007FFFFFFFFFF8088888888800788888888888
            0888808088007FFFFFFFFFF80888807088007FFFFFFFFFF80888880888007F0F
            0F0F0F0F08888808880080F7F7F7F7F088888070880088080808080888888080
            8800}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = ViewXSLTR1Click
        end
        object SBViewXML: TUniSpeedButton
          Left = 149
          Top = 4
          Width = 23
          Height = 22
          Hint = 'Display output XML'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            7E010000424D7E01000000000000760000002800000016000000160000000100
            0400000000000801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888008888888888888888888888008888888888888888888888008888
            8888888888888000880088888888888888888088880088888888888888888088
            88008000000000008888808888007888888888880888808888007FFFFFFFFFF8
            0888888888007FFFFFFFFFF80888080808007888888888880888080808007FFF
            FFFFFFFF0888080808007FFFFFFFFFFF08880707080078888888888808880080
            08007FFFFFFFFFFF0888008008007FFFFFFFFFF8088888888800788888888888
            0888808088007FFFFFFFFFF80888807088007FFFFFFFFFF80888880888007F0F
            0F0F0F0F08888808880080F7F7F7F7F088888070880088080808080888888080
            8800}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = DisplayoutputXML1Click
        end
        object SBProcessXML: TUniSpeedButton
          Left = 172
          Top = 4
          Width = 23
          Height = 22
          Hint = 'Process XML'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            7E010000424D7E01000000000000760000002800000016000000160000000100
            0400000000000801000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888008888888888888888888888008888888888888888888888008888
            8888888888888888880088888888888888888888880088888888880008888888
            880088888800880B088008888800888883B03033000330888800888883B0333F
            0B3330888800888700BB0338303F8008880088803303FFBBFBB3033088008880
            333FB000008B033088008883F3FB77F7703FBFB088008883333F77F8707B8008
            88008888803FF7F770FB30888800888883FBB7F8703FB0888800888880337787
            7073788888008888888887FF8088888888008888888888777888888888008888
            8888888888888888880088888888888888888888880088888888888888888888
            8800}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = ProcessXML1Click
        end
        object NavDtl: TUniDBNavigator
          Left = 213
          Top = 1
          Width = 240
          Height = 25
          Hint = ''
          DataSource = SrcDtl
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
    end
    object TabSet: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Settings'
      DesignSize = (
        454
        360)
      object Panel7: TUniPanel
        Left = 0
        Top = 0
        Width = 454
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = ''
        object Splitter2: TUniSplitter
          Left = 133
          Top = 1
          Width = 6
          Height = 26
          Hint = ''
          Align = alRight
          ParentColor = False
          Color = clBtnFace
        end
        object Panel9: TUniPanel
          Left = 139
          Top = 1
          Width = 314
          Height = 26
          Hint = ''
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            314
            26)
          object SpeedButton1: TUniSpeedButton
            Left = 285
            Top = 0
            Width = 25
            Height = 25
            Hint = 'Collector Dir. UNC Path'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              1800000000000006000000000000000000000000000000000000FF00FF94949C
              736B5A848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FF969696686868848484FF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFADA5B56B738C
              A584946B636B847B84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFA9A9A97878788B8B8B6666667E7E7EFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF94ADCE5A8CCE
              7373AD9C8C9C736373847B84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFB3B3B39B9B9B8282829191916868687E7E7EFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB5DEFF4AB5FF
              4284D6947B949C8C9C73636B848484FF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFE4E4E4C3C3C3989898838383919191666666848484FF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB5DEFF
              4AB5F74284D6737BA5B58C8C736B63A59CA5FF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFE4E4E4C2C2C29898988585859090906A6A6A9F
              9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              9CD6FF52B5FF4A84D67373AD947B94848494ADA5B56B7B7B6B63637363637373
              6BB5ADADFF00FFFF00FFFF00FFFF00FFDDDDDDC4C4C498989882828283838388
              8888A9A9A97A7A7A646464646464717171AEAEAEFF00FFFF00FFFF00FFFF00FF
              FF00FF8CCEF74AB5FF5A94CE8C8C949C7B73B5948CCEAD9CDEC6ADCEB5A58C84
              73736363949494FF00FFFF00FFFF00FFFF00FFD4D4D4C3C3C3A0A0A08E8E8E7C
              7C7C959595ACACACC3C3C3B4B4B4818181646464949494FF00FFFF00FFFF00FF
              FF00FFFF00FFA5DEF7BDC6DEAD8C84F7CEADFFF7C6FFFFCEFFFFDEFFF7E7F7EF
              DE9C8C846B6363B5B5B5FF00FFFF00FFFF00FFFF00FFE1E1E1CBCBCB8D8D8DCB
              CBCBEFEFEFEDEDEDEDEDEDEDEDEDEDEDED8C8C8C646464B5B5B5FF00FFFF00FF
              FF00FFFF00FFFF00FFEFD6CEE7C6A5FFF7C6F7F7BDFFFFDEFFFFE7FFFFFFFFFF
              F7F7E7DE7B6B637B7B73FF00FFFF00FFFF00FFFF00FFFF00FFD6D6D6C3C3C3EF
              EFEFECECECEDEDEDEDEDEDEDEDEDEDEDEDE7E7E76A6A6A797979FF00FFFF00FF
              FF00FFFF00FFFF00FFDEBDB5F7EFC6F7E7ADFFF7C6FFFFDEFFFFE7F7FFFFFFFF
              F7FFF7E7B59C8C6B6B63FF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEE8E8E8DE
              DEDEEFEFEFEDEDEDEDEDEDEDEDEDEDEDEDEDEDED9B9B9B696969FF00FFFF00FF
              FF00FFFF00FFFF00FFEFB5A5FFF7C6FFD6A5FFFFCEFFFFD6F7FFDEFFFFEFFFFF
              E7FFFFDECEAD9C5A635AFF00FFFF00FFFF00FFFF00FFFF00FFB7B7B7EDEDEDD1
              D1D1EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDACACAC606060FF00FFFF00FF
              FF00FFFF00FFFF00FFDEBDA5FFF7C6FFE7BDF7E7BDFFFFCEFFFFDEFFFFD6FFFF
              D6FFF7CECEAD94737B73FF00FFFF00FFFF00FFFF00FFFF00FFBBBBBBEDEDEDE1
              E1E1E1E1E1EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDABABAB787878FF00FFFF00FF
              FF00FFFF00FFFF00FFCEC6ADFFF7CEFFEFD6F7DEBDFFF7BDFFF7BDF7FFB5FFF7
              BDFFEFCEB59484BDB5ADFF00FFFF00FFFF00FFFF00FFFF00FFC2C2C2EDEDEDEC
              ECECDADADAEDEDEDEDEDEDEDEDEDEDEDEDEAEAEA949494B4B4B4FF00FFFF00FF
              FF00FFFF00FFFF00FFF7D6D6E7CEC6FFFFF7F7F7DEF7EFBDFFDEADF7E7ADFFE7
              BDEFCEB59C847BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD9D9D9CFCFCFED
              EDEDF2F2F2E6E6E6D8D8D8DEDEDEE1E1E1CCCCCC848484FF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFCEBDBDEFE7E7FFF7E7FFFFCEFFEFB5FFEFCEEFCE
              B5AD948CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFE8
              E8E8EDEDEDEDEDEDE6E6E6EAEAEACCCCCC959595FF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFDEC6C6D6ADADC6A58CE7BD9CCEADA5DEC6
              BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8
              C8C8B1B1B1A3A3A3BBBBBBAEAEAEC7C7C7FF00FFFF00FFFF00FF}
            Caption = ''
            Anchors = [akRight, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = SpeedButton1Click
          end
          object EditUNCPath: TUniEdit
            Left = 3
            Top = 5
            Width = 279
            Height = 17
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Color = clBtnFace
            ReadOnly = True
          end
        end
        object Panel10: TUniPanel
          Left = 1
          Top = 1
          Width = 132
          Height = 26
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Collector Dir. UNC Path'
        end
      end
      object Panel11: TUniPanel
        Left = 0
        Top = 28
        Width = 454
        Height = 28
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Alignment = taLeftJustify
        Caption = ''
        object Splitter3: TUniSplitter
          Left = 133
          Top = 1
          Width = 6
          Height = 26
          Hint = ''
          Align = alRight
          ParentColor = False
          Color = clBtnFace
        end
        object Panel12: TUniPanel
          Left = 139
          Top = 1
          Width = 314
          Height = 26
          Hint = ''
          Align = alRight
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            314
            26)
          object SpeedButton2: TUniSpeedButton
            Left = 286
            Top = 3
            Width = 23
            Height = 22
            Hint = ''
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C21E0000C21E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFD575CF7040EFD2E33FEA1A4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEA1A4FD2E33FD4B50FD2E33F7
              040EFFC1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFD383EFD4B50FD4B50FD4B50FD2E33FD3A3FFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7A7EFD4B50FE666AFD4B50FE666AFD
              4B50FD2E33FEA1A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0E1
              FD3A3FFE666AFE666AFE666AFE666AFD4B50FD4B50FD3A3FFFF0F0FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFD3C42FD575BFE666AFE666AFE666AFE666AFE
              666AFE666AFD2E33FE7A7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE999CFD3A3F
              FE777BFE7074FE7176FE666AFE666AFE666AFE666AFD4B50FD3A3FFFE5E6FFFF
              FFFFFFFFFFFFFFFFFFFFFD3A3FFE777BFE7C7FFE777BFE777BFE7074FD4B50FD
              2E33FE666AFE666AFD4B50FD575CFFFFFFFFFFFFFFFFFFFFFFFFFD3A3FFE8589
              FE8589FE8589FE7C7FFE7074FD3A3FFD575CFD4B50FE666AFE666AFD2E33FFC1
              C3FFFFFFFFFFFFFFFFFFFE7A7EFE676BFEA3A6FE8D90FE8589FD3A3FFFAFB2FF
              F0F0FD2E33FE666AFE666AFD4B50FD383EFFFFFFFFFFFFFFFFFFFFF0F0FD383E
              FE676BFEA3A6FD575CFE7A7EFFFFFFFFFFFFFFC1C3FD2E33FE666AFD4B50FD2E
              33FEA1A4FFFFFFFFFFFFFFFFFFFFF0F0FE7A7EFD3A3FFD383EFFFFFFFFFFFFFF
              FFFFFFFFFFFE8B8EFD4B50FE666AFD4B50FD2E33FFF0F0FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C42FD4B50FD4B
              50FD2E33FD575CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFF0F0FD2E33FD4B50FD4B50FD2E33FEA1A4FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D3EB04
              0EFD2E33FD2E33FD2E33FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF0FE7A7EF7040EEB040E}
            Caption = ''
            Anchors = [akRight, akBottom]
            ParentColor = False
            Color = clWindow
            OnClick = SpeedButton2Click
          end
          object EditLocalPath: TUniEdit
            Left = 3
            Top = 5
            Width = 279
            Height = 19
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 0
            Color = clBtnHighlight
          end
        end
        object Panel13: TUniPanel
          Left = 1
          Top = 1
          Width = 132
          Height = 26
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = 'Collector Dir. Local Path'
        end
      end
      object Memo1: TUniMemo
        Left = 3
        Top = 64
        Width = 452
        Height = 61
        Hint = ''
        Lines.Strings = (
          
            'Both UNC and Local paths point to the same directory on Oracle s' +
            'erver. '
          
            'The UNC path is the network representation of the path (ex: \\co' +
            'mputer\directory). '
          
            'The Local path is the path to the same directory as the Oracle s' +
            'erver '#39'sees'#39' it (ex: c:\directory).'
          '')
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        Color = clBtnFace
        TabOrder = 2
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 208
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object StoreXSLTtodatabase1: TUniMenuItem
        Caption = '&Store XSLT to database'
        OnClick = StoreXSLTtodatabase1Click
      end
      object ExtractXSLTRtofile1: TUniMenuItem
        Caption = '&Extract XSLT to file'
        OnClick = ExtractXSLTRtofile1Click
      end
      object ViewXSLTR1: TUniMenuItem
        Caption = '&View XSLT'
        OnClick = ViewXSLTR1Click
      end
      object DisplayoutputXML2: TUniMenuItem
        Caption = 'Display output XML'
        OnClick = DisplayoutputXML1Click
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object ProcessXML1: TUniMenuItem
        Caption = '&Process XML'
        OnClick = ProcessXML1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Deletefileafterprocess1: TUniMenuItem
        Caption = '&Delete file after process'
        OnClick = Deletefileafterprocess1Click
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
    ModuleName = 'XML Setup'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196079 $'
    BuildVersion = '176554'
    Left = 152
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavHdr'
      'NavDtl'
      'IQSearchHdr'
      'IQSearchDtl'
      'StoreXSLTtodatabase1'
      'ExtractXSLTtofile1'
      'ViewXSLT1'
      'StoreXSLTtodatabase2'
      'ExtractXSLTtofile2'
      'ViewXSLT2'
      'ProcessXML1'
      'ProcessXML2'
      'Deletefileafterprocess1'
      'DisplayoutputXML1'
      'DisplayoutputXML2'
      'SBProcessXML'
      'SBStoreToDataBase'
      'SBExtractToFile'
      'SBViewXSL'
      'SBViewXML'
      'AssignPickList1'
      'ViewEditPickList1')
    SecurityCode = 'FRMXMLSETUP'
    Left = 168
  end
  object SrcHdr: TDataSource
    DataSet = QryHdr
    Left = 56
    Top = 91
  end
  object QryHdr: TFDQuery
    BeforePost = QryHdrBeforePost
    AfterPost = QryHdrAfterPost
    AfterDelete = QryHdrAfterPost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'xml_hdr'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLHdr
    SQL.Strings = (
      'select x.id,'
      '       x.descrip,'
      '       x.partner_no,'
      '       x.partner_type,'
      '       x.partner_id,'
      '       decode(a.id, null, v.vendorno, a.custno) as partnerno,'
      '       decode(a.id, null, v.company, a.company) as partner'
      '  from xml_hdr x,'
      '       v_arcusto a,'
      '       v_vendor v'
      ' where x.partner_id = a.id(+)'
      '   and x.partner_id = v.id(+)')
    Left = 72
    Top = 96
    object QryHdrDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'x.descrip'
      Size = 100
    end
    object QryHdrPARTNER_NO: TStringField
      DisplayLabel = 'Partner#'
      DisplayWidth = 10
      FieldName = 'PARTNER_NO'
      Origin = 'x.partner_no'
      Required = True
      Size = 10
    end
    object QryHdrPARTNER_TYPE: TStringField
      DisplayLabel = 'Partner Type'
      DisplayWidth = 10
      FieldName = 'PARTNER_TYPE'
      Origin = 'x.partner_type'
      Required = True
      Size = 10
    end
    object QryHdrPARTNERNO: TStringField
      DisplayLabel = 'Vendor/Customer#'
      DisplayWidth = 10
      FieldName = 'PARTNERNO'
      Origin = 'decode(a.id, null, v.vendorno, a.custno)'
      Size = 10
    end
    object QryHdrPARTNER: TStringField
      DisplayLabel = 'Vendor/Customer'
      DisplayWidth = 20
      FieldName = 'PARTNER'
      Origin = 'decode(a.id, null, v.company, a.company)'
      Size = 60
    end
    object QryHdrID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object QryHdrPARTNER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARTNER_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcDtl: TDataSource
    DataSet = QryDtl
    Left = 24
    Top = 255
  end
  object QryDtl: TFDQuery
    BeforeInsert = QryDtlBeforeEdit
    BeforeEdit = QryDtlBeforeEdit
    BeforePost = QryDtlBeforePost
    AfterPost = QryDtlAfterPost
    AfterDelete = QryDtlAfterPost
    OnCalcFields = QryDtlCalcFields
    CachedUpdates = True
    MasterSource = SrcHdr
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'xml_schema'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQLDtl
    SQL.Strings = (
      'select id,'
      
        '       decode(instr(execute_proc, '#39'XML_IMP'#39'), 0, '#39'EXPORT'#39', '#39'IMPO' +
        'RT'#39') as schema_type,'
      '       xml_hdr_id,'
      '       descrip,'
      '       schema_no,'
      '       execute_proc,'
      '       xslt_file_name,'
      '      date_processed,'
      '     dom_out'
      '  from xml_schema'
      ' where xml_hdr_id = :ID'
      '')
    Left = 40
    Top = 256
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDtlDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'DESCRIP'
      Size = 100
    end
    object QryDtlSCHEMA_NO: TStringField
      DisplayLabel = 'Schema#'
      DisplayWidth = 10
      FieldName = 'SCHEMA_NO'
      Origin = 'SCHEMA_NO'
      Required = True
      Size = 10
    end
    object QryDtlEXECUTE_PROC: TStringField
      DisplayLabel = 'Proc. to Execute'
      DisplayWidth = 30
      FieldName = 'EXECUTE_PROC'
      Origin = 'EXECUTE_PROC'
      Required = True
      Size = 30
    end
    object QryDtlXSLT_FILE_NAME: TStringField
      DisplayLabel = 'XSLT File Name'
      DisplayWidth = 20
      FieldName = 'XSLT_FILE_NAME'
      Origin = 'XSLT_FILE_NAME'
      ReadOnly = True
      Size = 250
    end
    object QryDtlSCHEMA_TYPE: TStringField
      DisplayLabel = 'Schema Type'
      DisplayWidth = 6
      FieldName = 'SCHEMA_TYPE'
      Size = 6
    end
    object QryDtlXSLTAssigned: TStringField
      DisplayLabel = 'XSLT Assigned'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'XSLTAssigned'
      Calculated = True
    end
    object QryDtlDATE_PROCESSED: TDateTimeField
      DisplayLabel = 'Last Process Date'
      DisplayWidth = 18
      FieldName = 'DATE_PROCESSED'
      Origin = 'IQ.XML_SCHEMA.DATE_PROCESSED'
      ReadOnly = True
    end
    object QryDtlID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object QryDtlXML_HDR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'XML_HDR_ID'
      Origin = 'XML_HDR_ID'
      Visible = False
      Size = 0
    end
    object QryDtlDOM_OUT: TMemoField
      FieldName = 'DOM_OUT'
      Origin = 'IQ.XML_SCHEMA.DOM_OUT'
      Visible = False
      BlobType = ftMemo
    end
  end
  object PkVendor: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select Id as id, '
      '       vendorno as vendorno, '
      '       Company as company, '
      '       Addr1 as addr1, '
      '       Addr2 as addr2, '
      '       City as city, '
      '       State as state, '
      '       Zip as zip,'
      '      pk_hide'
      '  from v_vendor'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 352
    Top = 80
    object PkVendorID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkVendorCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkVendorADDR1: TStringField
      DisplayLabel = 'Address1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkVendorADDR2: TStringField
      DisplayLabel = 'Address2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PkVendorCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkVendorSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PkVendorZIP: TStringField
      FieldName = 'ZIP'
      Size = 10
    end
    object PkVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor#'
      FieldName = 'VENDORNO'
      Origin = 'VENDOR.VENDORNO'
      Size = 10
    end
    object PkVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.VENDOR.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object UpdateSQLHdr: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into xml_hdr'
      '  (ID, DESCRIP, PARTNER_NO, PARTNER_TYPE, PARTNER_ID)'
      'values'
      '  (:ID, :DESCRIP, :PARTNER_NO, :PARTNER_TYPE, :PARTNER_ID)')
    ModifySQL.Strings = (
      'update xml_hdr'
      'set'
      '  ID = :ID,'
      '  DESCRIP = :DESCRIP,'
      '  PARTNER_NO = :PARTNER_NO,'
      '  PARTNER_TYPE = :PARTNER_TYPE,'
      '  PARTNER_ID = :PARTNER_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from xml_hdr'
      'where'
      '  ID = :OLD_ID')
    Left = 88
    Top = 112
  end
  object UpdateSQLDtl: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into xml_schema'
      '  (ID, XML_HDR_ID, DESCRIP, SCHEMA_NO, EXECUTE_PROC, '
      'XSLT_FILE_NAME, DATE_PROCESSED)'
      'values'
      '  (:ID, :XML_HDR_ID, :DESCRIP, :SCHEMA_NO, :EXECUTE_PROC, '
      ':XSLT_FILE_NAME, '
      '   :DATE_PROCESSED)')
    ModifySQL.Strings = (
      'update xml_schema'
      'set'
      '  ID = :ID,'
      '  XML_HDR_ID = :XML_HDR_ID,'
      '  DESCRIP = :DESCRIP,'
      '  SCHEMA_NO = :SCHEMA_NO,'
      '  EXECUTE_PROC = :EXECUTE_PROC,'
      '  XSLT_FILE_NAME = :XSLT_FILE_NAME,'
      '  DATE_PROCESSED = :DATE_PROCESSED'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from xml_schema'
      'where'
      '  ID = :OLD_ID')
    Left = 56
    Top = 264
  end
  object PkProcs: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select distinct package_name as object_name'
      '  from all_arguments'
      ' where'
      '       owner = '#39'IQMS'#39
      
        '   and (package_name like '#39'XML_IMP%'#39' or package_name like '#39'XML_E' +
        'XP%'#39')'
      ''
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 136
    Top = 296
    object PkProcsOBJECT_NAME: TStringField
      DisplayLabel = 'Procedure to execute'
      FieldName = 'OBJECT_NAME'
      Size = 30
    end
  end
  object PkCustomer: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'Select  a.ID          as id,'
      '        a.CustNo      as custno,'
      '        a.Company     as company,'
      '        a.Addr1       as addr1,'
      '        a.Addr2       as addr2,'
      '        a.Addr3       as addr3,'
      '        a.City        as city,'
      '        a.State       as state,'
      '        a.Zip         as Zip,'
      '        a.terms_id    as Terms_ID,'
      '        a.status_id   as Status,'
      '        pk_hide as pk_hide'
      'from v_Arcusto a'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 320
    Top = 80
    object PkCustomerCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkCustomerCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkCustomerADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkCustomerADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 'ARCUSTO.ADDR2'
      Size = 60
    end
    object PkCustomerADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 30
      FieldName = 'ADDR3'
      Origin = 'ARCUSTO.ADDR3'
      Size = 60
    end
    object PkCustomerCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkCustomerSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PkCustomerZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkCustomerID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkCustomerTERMS_ID: TBCDField
      DisplayLabel = 'Terms'
      FieldName = 'TERMS_ID'
      Visible = False
      Size = 0
    end
    object PkCustomerSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'ARCUSTO.STATUS_ID'
    end
    object PkCustomerPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 272
    Top = 255
    object StoreXSLTtodatabase2: TUniMenuItem
      Caption = '&Store XSLT to database'
      OnClick = StoreXSLTtodatabase1Click
    end
    object ExtractXSLTtofile2: TUniMenuItem
      Caption = '&Extract XSLT to file'
      OnClick = ExtractXSLTRtofile1Click
    end
    object ViewXSLT2: TUniMenuItem
      Caption = '&View XSLT'
      OnClick = ViewXSLTR1Click
    end
    object DisplayoutputXML1: TUniMenuItem
      Caption = 'Display output XML'
      OnClick = DisplayoutputXML1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object ProcessXML2: TUniMenuItem
      Caption = '&Process XML'
      OnClick = ProcessXML1Click
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object AssignPickList1: TUniMenuItem
      Caption = 'Assign Pick List'
      OnClick = AssignPickList1Click
    end
    object ViewEditPickList1: TUniMenuItem
      Caption = 'View/Edit Pick List'
      OnClick = ViewEditPickList1Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'XSL'
    Filter = 'XSL|*.XSL|All Files|*.*'
    Left = 384
    Top = 83
  end
  object wwMemoDialog1: TwwMemoDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    MemoAttributes = [mSizeable, mViewOnly]
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    Left = 168
    Top = 299
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = 'XML'
    Filter = 'XML|*.XML|All Files|*.*'
    Left = 384
    Top = 115
  end
  object OpenDialog3: TOpenDialog
    DefaultExt = 'XSL'
    Filter = 'SQL|*.SQL|All Files|*.*'
    Left = 424
    Top = 83
  end
  object wwMemoDialog2: TwwMemoDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    MemoAttributes = [mSizeable]
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    OnCloseDialog = wwMemoDialog2CloseDialog
    Left = 208
    Top = 299
  end
  object PickList: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 308
    Top = 258
  end
end

object FrmRTHistogramBase: TFrmRTHistogramBase
  Left = 324
  Top = 239
  HelpContext = 1210643
  ClientHeight = 182
  ClientWidth = 737
  Caption = 'RealTime Histogram'
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  OnMouseUp = FormMouseUp
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCarrier: TUniPanel
    Left = 0
    Top = 0
    Width = 737
    Height = 182
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pnlClient01: TUniPanel
      Left = 1
      Top = 32
      Width = 735
      Height = 130
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object pnlGraph: TUniPanel
        Left = 1
        Top = 1
        Width = 733
        Height = 128
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object DBChart1: TDBChart
          Left = 1
          Top = 1
          Width = 731
          Height = 126
          AllowPanning = pmHorizontal
          LeftWall.Color = 13417653
          MarginBottom = 5
          MarginLeft = 1
          MarginRight = 1
          MarginTop = 7
          Title.Text.Strings = (
            'TDBChart')
          Title.Visible = False
          BottomAxis.EndPosition = 99.000000000000000000
          LeftAxis.Automatic = False
          LeftAxis.AutomaticMaximum = False
          LeftAxis.AutomaticMinimum = False
          LeftAxis.ExactDateTime = False
          LeftAxis.Increment = 1.000000000000000000
          LeftAxis.Labels = False
          LeftAxis.LabelsFormat.Visible = False
          LeftAxis.Maximum = 1.000000000000000000
          LeftAxis.Minimum = 1.000000000000000000
          Legend.Visible = False
          RightAxis.Automatic = False
          RightAxis.AutomaticMaximum = False
          RightAxis.AutomaticMinimum = False
          Zoom.Allow = False
          Align = alClient
          TabOrder = 0
          DefaultCanvas = 'TGDIPlusCanvas'
          PrintMargins = (
            15
            40
            15
            40)
          ColorPaletteIndex = 0
          object Series1: TGanttSeries
            ColorSource = 'COLOR'
            Depth = 15
            DataSource = QryHistogram
            XLabelsSource = 'Y_ANCHOR'
            OnClick = Series1Click
            ClickableLine = False
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.VertSize = 12
            XValues.Name = 'Start'
            XValues.Order = loAscending
            XValues.ValueSource = 'START_TIME'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'Y_ANCHOR'
            Callout.Style = psRightTriangle
            Callout.Arrow.Visible = False
            StartValues.Name = 'Start'
            StartValues.Order = loAscending
            StartValues.ValueSource = 'START_TIME'
            EndValues.Name = 'End'
            EndValues.Order = loNone
            EndValues.ValueSource = 'END_TIME'
            NextTask.DateTime = True
            NextTask.Name = 'NextTask'
            NextTask.Order = loNone
            NextTask.ValueSource = 'START_TIME'
          end
        end
      end
    end
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 735
      Height = 31
      Hint = ''
      ShowHint = True
      ParentShowHint = False
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object sbtnApply: TUniSpeedButton
        Left = 148
        Top = 3
        Width = 23
        Height = 22
        Hint = 'Apply'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C21E0000C21E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF034464034464FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF0344640ED1FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A14D3FF03
          4464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF0099CC1BD5FF1BD5FF034464FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A22
          D7FF22D7FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF00669A00669A00669A29DAFF034464034464034464FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A30DCFF30
          DCFF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF00669A37DEFF37DEFF034464FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A3D
          E0FF3DE0FF3DE0FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF00669A00669A00669A00669A44E3FF034464034464034464034464FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00669A4BE5FF4BE5FF4B
          E5FF4BE5FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF00669A5CEBFE5CEBFE5CEBFE5CEBFE034464FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0099CC00669A70
          F1FE70F1FE70F1FE70F1FE034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF0099CC0344640344640344640344640344640344
          64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnApplyClick
      end
      object Bevel1: TUniPanel
        Left = 1
        Top = 28
        Width = 733
        Height = 2
        Hint = ''
        ShowHint = True
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 4
        Caption = ''
      end
      object sbtnZoomIn: TUniSpeedButton
        Left = 189
        Top = 3
        Width = 23
        Height = 22
        Hint = 'Zoom In'
        ShowHint = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000C21E0000C21E00000001000000000000303040003040
          50002048600030506000685F56005A60570069605700686665006E736E007977
          6B0080605000806850009070600090786000847B7300837D7000858275008E83
          7B0090807000A0807000A0887000FF00FF003080A0003088B0003090B0006088
          90004088A0006090A0006098B00040B8E0008785840087868500968685009088
          8300968D84009B8F8400998F88009B959000A0908000A5968A00A2988B00A69E
          8B00B49E8F00A0909000A6A09000B3A39100B1A49900B1A59A00B1A59B00B1A6
          9B00B0A8A000B8ABA000B8ACA000B0B0A000B9B0A400BCB3A900B0B0B000C0A8
          9000C0B0A000C7B2A000C5B6A300C2B1A400C3B4A800C6B7AB00C4B8AC00CDBC
          AE00D5BDAA00C0B0B000CDBEB200D9C9BD00EFC4A600E4C4AC00E0C0B000E0C8
          B000E9CFB900F0D0B00080C0D00090D0E000A0D8F00090E0F000C0C0C000D0D0
          D000D0D8D000E1CFC100E9D7C600EFDBCA00EDDACC00EFDCCE00F0D0C000F0D8
          C000E0D8D000FFE0D000FFE8E000FFF0E000F0F0F000FFF8F000FFF8FF00FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000151515151515
          15151515153402002A461515151515151515151536031A18013B151515151515
          1515153703171D4F4D1B15151554332106051008161D4F4F1C3D151545232B3A
          494839120E4C4E1C3E15155625355C5B59584B4B260919401515153F325F5D5C
          0A0A584B4B1228151515152C51605F5D0B0A59584B390F151515151F5E611413
          0D0C0B0A58480415151515205E61262614120C0B59490715151515315A616161
          26145D5C5B3A1115151515443861616126265F5D5C2B2D151515155730506161
          6161605F4324471515151515532F385A5E5E523227421515151515151555412E
          221E293C4A151515151515151515151515151515151515151515}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = TimerZoomInTimer
      end
      object sbtnZoomOut: TUniSpeedButton
        Left = 212
        Top = 3
        Width = 23
        Height = 22
        Hint = 'Zoom Out'
        ShowHint = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000C21E0000C21E00000001000000000000303040003040
          50002048600030506000685F56005A60570069605700686665006E736E007977
          6B0080605000806850009070600090786000847B7300837D7000858275008E83
          7B0090807000A0807000A0887000FF00FF003080A0003088B0003090B0006088
          90004088A0006090A0006098B00040B8E0008785840087868500968685009088
          8300968D84009B8F8400998F88009B959000A0908000A5968A00A2988B00A69E
          8B00B49E8F00A0909000A6A09000B3A39100B1A49900B1A59A00B1A59B00B1A6
          9B00B0A8A000B8ABA000B8ACA000B0B0A000B9B0A400BCB3A900B0B0B000C0A8
          9000C0B0A000C7B2A000C5B6A300C2B1A400C3B4A800C6B7AB00C4B8AC00CDBC
          AE00D5BDAA00C0B0B000CDBEB200D9C9BD00EFC4A600E4C4AC00E0C0B000E0C8
          B000E9CFB900F0D0B00080C0D00090D0E000A0D8F00090E0F000C0C0C000D0D0
          D000D0D8D000E1CFC100E9D7C600EFDBCA00EDDACC00EFDCCE00F0D0C000F0D8
          C000E0D8D000FFE0D000FFE8E000FFF0E000F0F0F000FFF8F000FFF8FF00FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000151515151515
          15151515153402002A461515151515151515151536031A18013B151515151515
          1515153703171D4F4D1B15151554332106051008161D4F4F1C3D151545232B3A
          494839120E4C4E1C3E15155625355C5B59584B4B260919401515153F325F5D5C
          5B59584B4B1228151515152C51605F5D5C5B59584B390F151515151F5E611413
          0D0C0B0A58480415151515205E61262614120C0B59490715151515315A616161
          605F5D5C5B3A1115151515443861616161605F5D5C2B2D151515155730506161
          6161605F4324471515151515532F385A5E5E523227421515151515151555412E
          221E293C4A151515151515151515151515151515151515151515}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = TimerZoomOutTimer
      end
      object Bevel2: TUniPanel
        Left = 180
        Top = 0
        Width = 7
        Height = 29
        Hint = ''
        ShowHint = True
        TabOrder = 7
        Caption = ''
      end
      object sbtnReset: TUniSpeedButton
        Left = 235
        Top = 3
        Width = 23
        Height = 22
        Hint = 'Reset Zoom'
        ShowHint = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000C40E0000C40E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFC8C4C1BFB4AAB7A392B7A392BFB4AAC8C4C1FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC4C4C4B3B3B3A1
          A1A1A1A1A1B3B3B3C4C4C4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC6C0BBAE937AA77A59AC7656B27858B3795AB17C5CA87C5BAE937BC6C0
          BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0C0C090909078787875757578
          78787979797B7B7B7A7A7A919191C0C0C0FF00FFFF00FFFF00FFFF00FFFF00FF
          C2B8AFA58262B8714EC56F4DA98563B08E6EB08E6EA97B59BB7A59BC7A59A582
          62C2B9B0FF00FFFF00FFFF00FFFF00FFB7B7B77F7F7F7272727272728282828B
          8B8B8B8B8B7979797B7B7B7B7B7B7F7F7FB8B8B8FF00FFFF00FFFF00FFC7C2BD
          A48160C1744ED37B56CE8261AD8969B18F70C3A78BDFCCB7BFA286B77E5BC67F
          5CA58162C7C2BDFF00FFFF00FFC2C2C27E7E7E7575757E7E7E8484848686868C
          8C8CA4A4A4CACACA9F9F9F7D7D7D8080807F7F7FC2C2C2FF00FFFF00FFAE937A
          C17850DB7F56DE8C69DF8C69D68A66D28865C38461B39273ECDECCBEA184BE82
          5EC5805BAF947CFF00FFFF00FF9090907979798282828E8E8E8E8E8E8B8B8B89
          89898484848F8F8FDCDCDC9E9E9E828282808080919191FF00FFC6C0BAAC7B55
          E07E50E48E67C88865AC7E5BC78865E6936FCA8965AB8767ECDFCCE7D7C4A27B
          58E28B62AB7B55C6C0BBC0C0C07979798181819090908888887C7C7C88888895
          9595898989848484DCDCDCD5D5D57878788D8D8D797979C0C0C0BAAB9DBD7D54
          E68556E79067A27B59ECE0D4AA8666C88B66A98464E3D2C0EFE3D3EDDFCFAD8A
          6ADC885FBE7D56BAAB9DAAAAAA7C7C7C888888929292797979DFDFDF8383838A
          8A8A828282D0D0D0E1E1E1DDDDDD8787878989897D7D7DAAAAAAB6A391C68157
          EA8B5CD88B61BA9C81FCF7F1DFCFC0B29172EDE1D4F5ECE0F3E8DAF0E5D6AD8A
          6AE08D61C78358B6A391A1A1A18080808D8D8D8B8B8B999999F7F7F7CDCDCD8E
          8E8EE0E0E0EBEBEBE6E6E6E3E3E38787878E8E8E828282A1A1A1B6A391CA8C65
          EF9A70C08862D9C6B5FEF9F3FDF8F3FBF5EEFAF4ECF8F1E8F7EEE3DDCAB8B783
          5EEE996EC98961B6A391A1A1A18B8B8B9B9B9B878787C4C4C4F9F9F9F8F8F8F4
          F4F4F3F3F3F0F0F0EDEDEDC8C8C88181819A9A9A888888A1A1A1BCAC9FC5926F
          F2AD89A27B59F7F0E8FEF9F3FEF9F3FEF9F3FDF8F2FCF6EFE6D9CCA88463DA9D
          78F3A982C18964BCAC9FABABAB909090ADADAD797979EFEFEFF9F9F9F9F9F9F9
          F9F9F8F8F8F5F5F5D8D8D88181819C9C9CA9A9A9888888ABABABC7C3BFA27D5B
          E0A785B8997EFEF9F3FEF9F3FEF9F3FEF9F3F4ECE2C6AD95A37D5BD6A180F6BB
          9BF4B391A17B58C8C4C1C3C3C37A7A7AA6A6A6969696F9F9F9F9F9F9F9F9F9F9
          F9F9EBEBEBABABAB7A7A7A9F9F9FBABABAB3B3B3787878C4C4C4FF00FFB09780
          CA9B79AC8969E7DACCFEF9F3FEF9F3FEF9F3BDA187CE9E7EF6BD9EF8BD9EF7BF
          9FCF9E7CB09881FF00FFFF00FF949494999999868686D8D8D8F9F9F9F9F9F9F9
          F9F99E9E9E9C9C9CBCBCBCBCBCBCBEBEBE9C9C9C959595FF00FFFF00FFC8C4C1
          A58263C69C7DB78E6CAC8969CFB9A4F0E6DBF0E6DBAE8664FAC8A9F9C8A9D9AC
          8DA68465C8C4C1FF00FFFF00FFC4C4C47F7F7F9A9A9A8C8C8C868686B7B7B7E5
          E5E5E5E5E5848484C7C7C7C6C6C6AAAAAA818181C4C4C4FF00FFFF00FFFF00FF
          C4BDB6A78669CBA686EFC9ADCFA98AAF8866B08F71D4AF8FFBD7BBD2AD8FA582
          63C3BBB4FF00FFFF00FFFF00FFFF00FFBCBCBC838383A4A4A4C7C7C7A7A7A786
          86868C8C8CACACACD5D5D5AAAAAA7F7F7FBABABAFF00FFFF00FFFF00FFFF00FF
          FF00FFCBC9C8B49E8BA88261C29F80CCAB8EC6A385C3A082A98462B19A84C8C4
          C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC9C9C99C9C9C8080809C9C9CA8
          A8A8A1A1A19E9E9E818181979797C4C4C4FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFC8C5C2BDAFA3B8A696B8A696BDAFA3C8C5C2FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5C5C5AEAEAEA4
          A4A4A4A4A4AEAEAEC5C5C5FF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnResetClick
      end
      object wwDBComboBoxCriteria: TUniDBComboBox
        Left = 4
        Top = 4
        Width = 143
        Height = 21
        Hint = ''
        ShowHint = True
        Style = csDropDownList
        Items.Strings = (
          'Current Shift'
          'Entire Run'
          'Production Date')
        ItemIndex = 0
        TabStop = False
        TabOrder = 0
        OnCloseUp = wwDBComboBoxCriteriaCloseUp
      end
      object Panel3: TUniPanel
        Left = 675
        Top = 1
        Width = 59
        Height = 27
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Shape1: TUniPanel
          Left = 1
          Top = 9
          Width = 10
          Height = 11
          Hint = 'Work center is running within std cycle threshold'
          ShowHint = True
          TabOrder = 1
          Caption = ''
        end
        object Shape2: TUniPanel
          Left = 14
          Top = 9
          Width = 10
          Height = 11
          Hint = 'Work center is running slower than std cycle threshold'
          ShowHint = True
          TabOrder = 2
          Caption = ''
        end
        object Shape4: TUniPanel
          Left = 40
          Top = 9
          Width = 10
          Height = 11
          Hint = 'Work center is down'
          ShowHint = True
          TabOrder = 3
          Caption = ''
        end
        object Shape5: TUniPanel
          Left = 27
          Top = 9
          Width = 10
          Height = 11
          Hint = 'Work center is running faster than std cycle threshold'
          ShowHint = True
          TabOrder = 4
          Caption = ''
        end
      end
    end
    object StatusBar1: TUniStatusBar
      Left = 1
      Top = 162
      Width = 735
      Height = 19
      Hint = ''
      Panels = <
        item
          Text = 'ID'
          Width = 120
        end
        item
          Text = 'Date'
          Width = 120
        end
        item
          Text = 'Shift'
          Width = 120
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
  end
  object SrcHistogram: TDataSource
    DataSet = QryHistogram
    Left = 49
    Top = 35
  end
  object QryHistogram: TFDQuery
    BeforeOpen = QryHistogramBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       hist_illum_rt_id,'
      '       dayprod_id,'
      '       prod_date,'
      '       shift,'
      '       start_time,'
      '       end_time,'
      '       raw_end_time,'
      '       event,'
      '       state,'
      '       color,'
      '       Y_anchor,'
      '       rownum'
      'from       '
      '    ( select log.id,'
      '             log.hist_illum_rt_id,'
      '             log.dayprod_id,'
      '             log.prod_date,'
      '             log.shift,'
      '             log.start_time,'
      '             nvl(log.end_time, sysdate) as end_time,'
      '             log.end_time as raw_end_time,'
      '             log.event,'
      '             log.state,'
      '             decode( log.state, '
      '                     '#39'SLOW'#39', 255,'
      '                     '#39'FAST'#39', 5329233,'
      '                     '#39'NORM'#39', 32768,'
      '                     '#39'DOWN'#39', 65535,'
      '                     13554646) as color,'
      '             1 as Y_Anchor'
      '        from '
      '             hist_illum_log log'
      '       where '
      '             log.hist_illum_rt_id = :illum_rt_id'
      '             '
      '         and (:entire_run = 1'
      '              or'
      
        '              :entire_run = 0 and prod_date = :prod_date and (:s' +
        'hift = 0 or shift = :shift))'
      '       order by '
      '             log.start_time ) x'
      '')
    Left = 48
    Top = 52
    ParamData = <
      item
        Name = 'illum_rt_id'
        DataType = ftBCD
        ParamType = ptInput
        Value = '51131'
      end
      item
        Name = 'entire_run'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'prod_date'
        DataType = ftDateTime
        ParamType = ptInput
        Value = '10/08/2009'
      end
      item
        Name = 'shift'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryHistogramID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryHistogramDAYPROD_ID: TBCDField
      FieldName = 'DAYPROD_ID'
      Size = 0
    end
    object QryHistogramPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
    end
    object QryHistogramSHIFT: TBCDField
      FieldName = 'SHIFT'
      Size = 0
    end
    object QryHistogramSTART_TIME: TDateTimeField
      FieldName = 'START_TIME'
    end
    object QryHistogramEND_TIME: TDateTimeField
      FieldName = 'END_TIME'
    end
    object QryHistogramEVENT: TStringField
      FieldName = 'EVENT'
      Size = 30
    end
    object QryHistogramSTATE: TStringField
      FieldName = 'STATE'
    end
    object QryHistogramCOLOR: TFMTBCDField
      FieldName = 'COLOR'
      Size = 38
    end
    object QryHistogramHIST_ILLUM_RT_ID: TBCDField
      FieldName = 'HIST_ILLUM_RT_ID'
      Size = 0
    end
    object QryHistogramY_ANCHOR: TFMTBCDField
      FieldName = 'Y_ANCHOR'
      Size = 38
    end
    object QryHistogramRAW_END_TIME: TDateTimeField
      FieldName = 'RAW_END_TIME'
    end
    object QryHistogramROWNUM: TFMTBCDField
      FieldName = 'ROWNUM'
      Size = 38
    end
  end
  object TimerZoomIn: TUniTimer
    Interval = 200
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = TimerZoomInTimer
    Left = 93
    Top = 36
  end
  object TimerZoomOut: TUniTimer
    Interval = 200
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = TimerZoomOutTimer
    Left = 124
    Top = 36
  end
end

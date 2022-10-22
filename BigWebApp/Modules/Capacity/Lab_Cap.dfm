object FrmLaborCapacity: TFrmLaborCapacity
  Left = 324
  Top = 162
  HelpContext = 1072321
  ClientHeight = 543
  ClientWidth = 901
  Caption = '0'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 297
    Top = 27
    Width = 6
    Height = 516
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object pnlMfgType: TUniPanel
    Left = 0
    Top = 27
    Width = 297
    Height = 516
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 295
      Height = 514
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 78
      IQComponents.Grid.Height = 428
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcMfgType
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
      IQComponents.Navigator.DataSource = SrcMfgType
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 78
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 428
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcMfgType
      Columns = <
        item
          FieldName = 'MFGTYPE'
          Title.Caption = 'Mfg Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'MFGCELL'
          Title.Caption = 'Mfg Cell'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EMP_LEVEL_CODE'
          Title.Caption = 'Employee Level'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object Panel2: TUniPanel
    Left = 303
    Top = 27
    Width = 598
    Height = 516
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 0
      Top = 157
      Width = 598
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object Splitter3: TUniSplitter
      Left = 0
      Top = 329
      Width = 598
      Height = 3
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object pgctrlDetails: TUniPageControl
      Left = 1
      Top = 332
      Width = 596
      Height = 184
      Hint = ''
      ActivePage = TabSheet1
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      OnChange = pgctrlDetailsChange
      object TabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Details'
        object gridDetail: TUniDBGrid
          Left = 0
          Top = 0
          Width = 588
          Height = 156
          Hint = ''
          DataSource = SrcDetail
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'SHIFT'
              Title.Caption = 'Shift'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LABOR_HRS'
              Title.Caption = 'Labor Hours'
              Width = 77
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'AVAIL_LABOR_HRS'
              Title.Caption = 'Available Hours'
              Width = 84
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Percent'
              Title.Caption = 'Percentage Used'
              Width = 93
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIFT_HRS'
              Title.Caption = 'Production Hours'
              Width = 90
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SETUPHRS'
              Title.Caption = 'Setup Hours'
              Width = 75
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object TabSheet6: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Graph'
        object chartDetails: TDBChart
          Left = 0
          Top = 0
          Width = 588
          Height = 156
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = clWhite
          Gradient.StartColor = 15921906
          Gradient.Visible = True
          LeftWall.Brush.Gradient.EndColor = clWhite
          LeftWall.Brush.Gradient.StartColor = clYellow
          LeftWall.Brush.Gradient.Visible = True
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'TDBChart')
          Title.Visible = False
          BottomAxis.DateTimeFormat = 'MM/dd/yyyy'
          Chart3DPercent = 10
          TopAxis.Visible = False
          Zoom.Animated = True
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            588
            156)
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 0
          object Label3: TUniLabel
            Left = 570
            Top = 145
            Width = 22
            Height = 13
            Hint = ''
            Caption = 'Shift'
            Anchors = [akRight, akBottom]
            TabOrder = 0
          end
          object LineSeries6: TLineSeries
            DataSource = QryDetail
            SeriesColor = 13311
            Title = 'Available'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'SHIFT'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'AVAIL_LABOR_HRS'
          end
          object LineSeries7: TLineSeries
            DataSource = QryDetail
            SeriesColor = 4051807
            Title = 'Labor'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'SHIFT'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'LABOR_HRS'
          end
          object LineSeries8: TLineSeries
            DataSource = QryDetail
            SeriesColor = 13986304
            Title = 'Production'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'SHIFT'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'SHIFT_HRS'
          end
        end
      end
    end
    object pgctrlWeekly: TUniPageControl
      Left = 1
      Top = 1
      Width = 596
      Height = 157
      Hint = ''
      ActivePage = TabSheet5
      TabBarVisible = True
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnChange = pgctrlWeeklyChange
      object TabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Weekly'
        object gridWeek: TUniDBGrid
          Left = 0
          Top = 0
          Width = 588
          Height = 129
          Hint = ''
          DataSource = SrcLabor_Week
          LoadMask.Message = 'Loading data...'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'WEEK'
              Title.Caption = 'Week'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'WEEK_START'
              Title.Caption = 'Starts On'
              Width = 112
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LABOR_HRS'
              Title.Caption = 'Labor Hours'
              Width = 76
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'AVAIL_LABOR_HRS'
              Title.Caption = 'Available Hours'
              Width = 80
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Percent'
              Title.Caption = 'Percentage Used'
              Width = 97
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIFT_HRS'
              Title.Caption = 'Production Hours'
              Width = 92
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SETUPHRS'
              Title.Caption = 'Setup Hours'
              Width = 70
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object TabSheet5: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Graph'
        object chartWeekTot: TDBChart
          Left = 0
          Top = 0
          Width = 588
          Height = 129
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = clWhite
          Gradient.StartColor = 15921906
          Gradient.Visible = True
          LeftWall.Brush.Gradient.EndColor = clWhite
          LeftWall.Brush.Gradient.StartColor = clYellow
          LeftWall.Brush.Gradient.Visible = True
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'TDBChart')
          Title.Visible = False
          BottomAxis.DateTimeFormat = 'c'
          Chart3DPercent = 10
          TopAxis.Visible = False
          Zoom.Animated = True
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitLeft = 1
          DesignSize = (
            588
            129)
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 0
          object Label1: TUniLabel
            Left = 540
            Top = 115
            Width = 54
            Height = 13
            Hint = ''
            Caption = 'Week Start'
            Anchors = [akRight, akBottom]
            TabOrder = 0
          end
          object LineSeries3: TLineSeries
            DataSource = QryLabor_Week
            SeriesColor = 13311
            Title = 'Available'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'WEEK_START'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'AVAIL_LABOR_HRS'
          end
          object LineSeries4: TLineSeries
            DataSource = QryLabor_Week
            SeriesColor = 4051807
            Title = 'Labor'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'WEEK_START'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'LABOR_HRS'
          end
          object LineSeries5: TLineSeries
            DataSource = QryLabor_Week
            SeriesColor = 13986304
            Title = 'Production'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'WEEK_START'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'SHIFT_HRS'
          end
        end
      end
    end
    object pgctrlDaily: TUniPageControl
      Left = 1
      Top = 160
      Width = 596
      Height = 169
      Hint = ''
      ActivePage = TabSheet3
      TabBarVisible = True
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnChange = pgctrlDailyChange
      object TabSheet3: TUniTabSheet
        Hint = ''
        Caption = 'Daily'
        object gridDay: TUniDBGrid
          Left = 0
          Top = 0
          Width = 588
          Height = 141
          Hint = ''
          DataSource = SrcLabor_Day
          LoadMask.Message = 'Loading data...'
          OnDblClick = gridDayDblClick
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Columns = <
            item
              FieldName = 'PROD_DATE'
              Title.Caption = 'Production Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'LABOR_HRS'
              Title.Caption = 'Labor Hours'
              Width = 76
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'AVAIL_LABOR_HRS'
              Title.Caption = 'Available Hours'
              Width = 83
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'Percent'
              Title.Caption = 'Percentage Used'
              Width = 95
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SHIFT_HRS'
              Title.Caption = 'Production Hours'
              Width = 91
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'SETUPHRS'
              Title.Caption = 'Setup Hours'
              Width = 73
              CheckBoxField.FieldValues = 'true;false'
            end>
        end
      end
      object TabSheet4: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Graph'
        object chartDaysTot: TDBChart
          Left = 0
          Top = 0
          Width = 588
          Height = 141
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = clWhite
          Gradient.StartColor = 15921906
          Gradient.Visible = True
          LeftWall.Brush.Gradient.EndColor = clWhite
          LeftWall.Brush.Gradient.StartColor = clYellow
          LeftWall.Brush.Gradient.Visible = True
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'TDBChart')
          Title.Visible = False
          BottomAxis.DateTimeFormat = 'c'
          Chart3DPercent = 10
          TopAxis.Visible = False
          Zoom.Animated = True
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            588
            141)
          DefaultCanvas = 'TGDIPlusCanvas'
          ColorPaletteIndex = 0
          object Label2: TUniLabel
            Left = 546
            Top = 127
            Width = 48
            Height = 13
            Hint = ''
            Caption = 'Prod Date'
            Anchors = [akRight, akBottom]
            TabOrder = 0
          end
          object LineSeries1: TLineSeries
            DataSource = QryLabor_Day
            SeriesColor = 13311
            Title = 'Available'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'PROD_DATE'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'AVAIL_LABOR_HRS'
          end
          object LineSeries2: TLineSeries
            DataSource = QryLabor_Day
            SeriesColor = 4051807
            Title = 'Labor'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'PROD_DATE'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'LABOR_HRS'
          end
          object Series1: TLineSeries
            DataSource = QryLabor_Day
            SeriesColor = 13986304
            Title = 'Production'
            Brush.BackColor = clDefault
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            XValues.ValueSource = 'PROD_DATE'
            YValues.Name = 'Y'
            YValues.Order = loNone
            YValues.ValueSource = 'SHIFT_HRS'
          end
        end
      end
    end
  end
  object pnlTopToolBar: TUniPanel
    Left = 0
    Top = 0
    Width = 901
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object sbtnOnlyScheduledWorkorder: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Show Only Scheduled Workorders'
      ShowHint = True
      ParentShowHint = False
      GroupIndex = 1
      AllowAllUp = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000232E0000232E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF859ADD1020E0FF00FFFF00FFFF00
        FFFF00FFFF00FF5098F0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFAAAAAA727272FF00FFFF00FFFF00FFFF00FFFF00FFADADADFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFB1B6E90028FF1028F04050D0FF00FFFF00
        FFFF00FF2048E00010B0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC2
        C2C28383837C7C7C7A7A7AFF00FFFF00FFFF00FF7D7D7D575757FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2048FF1038FF0028FFFF00FFFF00
        FF4080F00018C03070F0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF8C8C8C878787838383FF00FFFF00FF9F9F9F606060959595FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B6E93050FF2040FF6098FF70B0
        FF0028F04058F0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFC2C2C28E8E8E898989B3B3B3C2C2C27B7B7B8B8B8BFF00FF7090A0304860
        304860304860304860304860304860304860304860B1B6E94060FF3050FF2040
        FF3050FFFF00FFFF00FF9292924D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D
        4D4D4D4D4DC2C2C29595958E8E8E8989898E8E8EFF00FFFF00FF7090A070D0F0
        60B8E040A8D040A8D040A8D040A8D030A0D030A0D0304860B1B6E94068FF4060
        FFD0C2D8FF00FFFF00FF929292D3D3D3BDBDBDADADADADADADADADADADADADA7
        A7A7A7A7A74D4D4DC2C2C2989898959595C8C8C8FF00FFFF00FF7098A080D0F0
        70D0F070C8E070C8F060C8F060C0F050B0E040A8D0B1B6E96078FF6078FF5078
        F05068FFD0C2D8FF00FF979797D3D3D3D3D3D3C9C9C9CDCDCDCDCDCDC7C7C7B7
        B7B7ADADADC2C2C2A1A1A1A1A1A19A9A9A999999C8C8C8FF00FF70A0B080D8F0
        70C0D000101060A0C070C8F0204050000000B1B6E95078FF5078FFBBBBE2FF00
        FF6484F85A76FBD0C2D8A1A1A1D9D9D9C0C0C00F0F0FA4A4A4CDCDCD42424200
        0000C2C2C2A0A0A0A0A0A0C4C4C4FF00FFA5A5A59E9E9EC8C8C880A0B090E0F0
        30586070C0E01010105098B070C8F0859BF35078FF5078FFD1CADEFF00FFFF00
        FFFF00FFB0B2E17A91F2A2A2A2E0E0E0585858C4C4C41010109A9A9ACDCDCDB1
        B1B1A0A0A0A0A0A0CFCFCFFF00FFFF00FFFF00FFBDBDBDABABAB80A8C090E0F0
        90E0F090D8F080C8E030485070C8E0859BF36585FADCD2DCFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFABABABE0E0E0E0E0E0DADADACACACA484848C9C9C9B1
        B1B1A6A6A6D5D5D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80B0C0A0E8F0
        A0E8F090D8F090E0F080D8F080D8F080D8F040B0D0304860FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFB1B1B1E6E6E6E6E6E6DADADAE0E0E0D9D9D9D9D9D9D9
        D9D9B3B3B34D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF80B8C0B0F0F0
        90C8D000000090D0E090E0F030485000080050B8E0304860FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFB7B7B7EDEDEDC7C7C7000000D0D0D0E0E0E048484805
        0505BDBDBD4D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90B8D0B0F0F0
        305050A0D8E000081090D0E090E0F090E0F060C0E0304860FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFBBBBBBEDEDED4E4E4ED7D7D7090909D0D0D0E0E0E0E0
        E0E0C3C3C34D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90C0D0B0F8F0
        B0F0F0B0F0F0A0E0F030384090E0F090E0F080D0F0304860FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFC1C1C1F2F2F2EDEDEDEDEDEDE0E0E0393939E0E0E0E0
        E0E0D3D3D34D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90C0D0C0F8F0
        B0F8F0B0F0F0B0F0F0A0E8F0A0E8F0A0E8F090E0F0304860FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFC1C1C1F3F3F3F2F2F2EDEDEDEDEDEDE6E6E6E6E6E6E6
        E6E6E0E0E04D4D4DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF90C8D090C0D0
        90C0D090B8C080B0C080A8C080A0B07098B07098A07090A0FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFC7C7C7C1C1C1C1C1C1B7B7B7B1B1B1ABABABA2A2A29B
        9B9B979797929292FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnOnlyScheduledWorkorderClick
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 165
    Top = 279
    object File1: TUniMenuItem
      Caption = '&File'
      object QueryByMfgTypeMfgCellEmployeeLevel1: TUniMenuItem
        Caption = 'Query By Mfg Type + Mfg Cell + Employee Level'
        Checked = True
        GroupIndex = 1
        RadioItem = True
        OnClick = QueryByMfgTypeMfgCellEmployeeLevel1Click
      end
      object QueryByMfgTypeEmployeeLevel1: TUniMenuItem
        Caption = 'Query By Mfg Type + Employee Level'
        GroupIndex = 1
        RadioItem = True
        OnClick = QueryByMfgTypeEmployeeLevel1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
        GroupIndex = 1
      end
      object STDLabourCapacity1: TUniMenuItem
        Caption = 'Standard Labor Capacity'
        GroupIndex = 1
        OnClick = STDLabourCapacity1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
        GroupIndex = 1
        Visible = False
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        GroupIndex = 1
        OnClick = Exit1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrintSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrintSetup1Click
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
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 193
    Top = 175
  end
  object SrcMfgType: TDataSource
    DataSet = QryMfgType
    OnDataChange = SrcMfgTypeDataChange
    Left = 42
    Top = 84
  end
  object QryMfgType: TFDQuery
    OnCalcFields = QryMfgTypeCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct '
      '       RTrim(v.mfgtype) as mfgtype,'
      '       RTrim(v.mfgcell) as mfgcell,'
      '       l.id as emp_level_id,'
      '       l.code as emp_level_code'
      '  from '
      '       v_day_labor v,'
      '       emp_level l,'
      '       mfgcell m'
      ' where '
      '       v.emp_level_id = l.id(+)'
      '   and v.mfgcell_id = m.id(+)'
      '   and misc.eplant_filter_include_nulls( m.eplant_id ) = 1'
      ' order by '
      '       RTrim(v.mfgtype),'
      '       RTrim(v.mfgcell) '
      ' '
      ' ')
    Left = 24
    Top = 112
    object QryMfgTypeMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 15
      FieldName = 'MFGTYPE'
      Origin = 'RTrim(v.mfgtype)'
      Size = 10
    end
    object QryMfgTypeMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Origin = 'RTrim(v.mfgcell)'
      Size = 15
    end
    object QryMfgTypeEMP_LEVEL_CODE: TStringField
      DisplayLabel = 'Employee Level'
      DisplayWidth = 15
      FieldName = 'EMP_LEVEL_CODE'
      Origin = 'l.code '
      Size = 10
    end
    object QryMfgTypeEMP_LEVEL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EMP_LEVEL_ID'
      Origin = 'l.id'
      Visible = False
      Size = 0
    end
    object QryMfgTypeSched_Only: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'Sched_Only'
      Visible = False
      Size = 1
      Calculated = True
    end
  end
  object SrcLabor_Week: TDataSource
    DataSet = QryLabor_Week
    OnDataChange = SrcLabor_WeekDataChange
    Left = 43
    Top = 149
  end
  object QryLabor_Week: TFDQuery
    OnCalcFields = QryLabor_WeekCalcFields
    MasterSource = SrcMfgType
    MasterFields = 'Sched_Only;MFGTYPE;MFGCELL;EMP_LEVEL_ID'
    DetailFields = 'Sched_Only;MFGTYPE;MFGCELL;EMP_LEVEL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.mfgtype,'
      '       v.mfgcell,'
      '       v.week,'
      '       v.week_start,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_shift_hrs, v.shift_hrs ' +
        ') as shift_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_labor_hrs, v.labor_hrs ' +
        ') as labor_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_setuphrs,  v.setuphrs  ' +
        ') as setuphrs,'
      '       v.emp_level_id,'
      ''
      '       ( select Sum(NVL(a.labor_hrs,0)) from std_labor a'
      '          where v.mfgtype = RTrim(a.mfgtype)'
      '            and NVL(v.mfgcell,'#39'*'#39') = NVL(RTrim(a.mfgcell), '#39'*'#39')'
      '            and v.emp_level_id = a.emp_level_id'
      
        '            and decode( Sign( Trunc(v.week_start) - Trunc(IQCale' +
        'ndar.SundayOf( sysdate )) ),            /* include only current ' +
        'date and on */'
      '                        NULL, 0,'
      '                          -1, 0,'
      '                           0, a.week_day,'
      
        '                           1, 7 ) >= IQCalendar.Day_Of_Week( sys' +
        'date )) as avail_labor_hrs'
      '  from'
      '       v_day_labor_week v'
      ' where'
      '       v.mfgtype = :mfgtype'
      '   and NVL(v.mfgcell,'#39'*'#39') = NVL(:mfgcell, '#39'*'#39')'
      '   and NVL(v.emp_level_id,0) = NVL(:emp_level_id,0)'
      ' order by'
      '       week_start'
      ''
      ''
      ''
      ' ')
    Left = 24
    Top = 178
    ParamData = <
      item
        Name = 'sched_only'
        DataType = ftString
        ParamType = ptInput
        Size = 2
        Value = Null
      end
      item
        Name = 'MFGTYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 11
        Value = 'ARIK'
      end
      item
        Name = 'MFGCELL'
        DataType = ftString
        ParamType = ptInput
        Size = 16
        Value = Null
      end
      item
        Name = 'EMP_LEVEL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryLabor_WeekMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Origin = 'V_DAY_LABOR.MFGTYPE'
      Size = 10
    end
    object QryLabor_WeekMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Origin = 'V_DAY_LABOR.MFGCELL'
      Size = 15
    end
    object QryLabor_WeekWEEK: TBCDField
      DisplayLabel = 'Week'
      FieldName = 'WEEK'
      Origin = 'V_DAY_LABOR.WEEK'
      Size = 0
    end
    object QryLabor_WeekWEEK_START: TDateTimeField
      DisplayLabel = 'Starts On'
      FieldName = 'WEEK_START'
      Origin = 'V_DAY_LABOR.WEEK_START'
    end
    object QryLabor_WeekSHIFT_HRS: TFMTBCDField
      DisplayLabel = 'Prod Hrs'
      FieldName = 'SHIFT_HRS'
      Origin = 'V_DAY_LABOR.SHIFT_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_WeekLABOR_HRS: TFMTBCDField
      DisplayLabel = 'Labor Hrs'
      FieldName = 'LABOR_HRS'
      Origin = 'V_DAY_LABOR.LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_WeekSETUPHRS: TFMTBCDField
      DisplayLabel = 'SU'
      FieldName = 'SETUPHRS'
      Origin = 'V_DAY_LABOR.SETUPHRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_WeekAVAIL_LABOR_HRS: TFMTBCDField
      DisplayLabel = 'Avail Hrs'
      FieldName = 'AVAIL_LABOR_HRS'
      Origin = 'V_DAY_LABOR_COMB.AVAIL_LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_WeekPercent: TFloatField
      DisplayLabel = 'Used %'
      FieldKind = fkCalculated
      FieldName = 'Percent'
      DisplayFormat = '#####0.00'
      Calculated = True
    end
    object QryLabor_WeekEMP_LEVEL_ID: TBCDField
      FieldName = 'EMP_LEVEL_ID'
      Size = 0
    end
    object QryLabor_WeekSched_Only: TStringField
      FieldKind = fkCalculated
      FieldName = 'Sched_Only'
      Visible = False
      Size = 1
      Calculated = True
    end
  end
  object SrcLabor_Day: TDataSource
    DataSet = QryLabor_Day
    OnDataChange = SrcLabor_DayDataChange
    Left = 42
    Top = 212
  end
  object SrcDetail: TDataSource
    DataSet = QryDetail
    Left = 41
    Top = 279
  end
  object QryDetail: TFDQuery
    OnCalcFields = QryLabor_WeekCalcFields
    MasterSource = SrcLabor_Day
    MasterFields = 'Sched_Only;MFGTYPE;MFGCELL;PROD_DATE;EMP_LEVEL_ID'
    DetailFields = 'Sched_Only;EMP_LEVEL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.shift,'
      '       v.emp_level_id,'
      ''
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_shift_hrs, v.shift_hrs ' +
        ') as shift_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_labor_hrs, v.labor_hrs ' +
        ') as labor_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_setuphrs,  v.setuphrs  ' +
        ') as setuphrs,'
      ''
      '       a.labor_hrs as avail_labor_hrs'
      '  from'
      '       v_day_labor_shift v,'
      '       std_labor a'
      ' where'
      '       v.mfgtype = :mfgtype'
      '   and NVL(v.mfgcell,'#39'*'#39') = NVL(:mfgcell, '#39'*'#39')'
      '   and v.prod_date = :prod_date'
      '   and NVL(v.emp_level_id,0) = NVL(:emp_level_id,0)'
      ''
      '   and v.mfgtype = RTrim(a.mfgtype(+))'
      '   and NVL(v.mfgcell,'#39'*'#39') = NVL(RTrim(a.mfgcell(+)), '#39'*'#39')'
      '   and v.shift = a.shift(+)'
      '   and to_char(v.prod_date,'#39'D'#39') = a.week_day(+)'
      '   and NVL(v.emp_level_id,0) = NVL(a.emp_level_id(+),0)'
      '   '
      ' order by v.shift'
      ' '
      ' '
      ' ')
    Left = 24
    Top = 308
    ParamData = <
      item
        Name = 'sched_only'
        DataType = ftString
        ParamType = ptInput
        Size = 2
        Value = Null
      end
      item
        Name = 'MFGTYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 11
        Value = 'ARIK'
      end
      item
        Name = 'MFGCELL'
        DataType = ftString
        ParamType = ptInput
        Size = 16
        Value = Null
      end
      item
        Name = 'PROD_DATE'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = 42385.2916666667d
      end
      item
        Name = 'EMP_LEVEL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryDetailSHIFT: TBCDField
      DisplayLabel = 'Shift'
      FieldName = 'SHIFT'
      Origin = 'V_DAY_LABOR.SHIFT'
      Size = 0
    end
    object QryDetailSHIFT_HRS: TFMTBCDField
      DisplayLabel = 'Prod Hrs'
      FieldName = 'SHIFT_HRS'
      Origin = 'V_DAY_LABOR.SHIFT_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryDetailLABOR_HRS: TFMTBCDField
      DisplayLabel = 'Labor Hrs'
      FieldName = 'LABOR_HRS'
      Origin = 'V_DAY_LABOR.LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryDetailSETUPHRS: TFMTBCDField
      DisplayLabel = 'SU'
      FieldName = 'SETUPHRS'
      Origin = 'V_DAY_LABOR.SETUPHRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryDetailAVAIL_LABOR_HRS: TFMTBCDField
      DisplayLabel = 'Avail Hrs'
      FieldName = 'AVAIL_LABOR_HRS'
      Origin = 'V_DAY_LABOR_COMB.AVAIL_LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 6
    end
    object QryDetailPercent: TFloatField
      DisplayLabel = 'Used %'
      FieldKind = fkCalculated
      FieldName = 'Percent'
      DisplayFormat = '#####0.00'
      Calculated = True
    end
    object QryDetailEMP_LEVEL_ID: TBCDField
      FieldName = 'EMP_LEVEL_ID'
      Size = 0
    end
    object QryDetailSched_Only: TStringField
      FieldKind = fkCalculated
      FieldName = 'Sched_Only'
      Visible = False
      Size = 1
      Calculated = True
    end
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmLaborCapacity'
    WebUse = False
    TouchScreen = False
    Left = 141
    Top = 383
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmLaborCapacity'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192069 $'
    BuildVersion = '176554'
    Left = 104
    Top = 367
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'STDLabourCapacity1'
      'Print1'
      'Recalculate1')
    SecurityCode = 'FRMLABORCAPACITY'
    Left = 185
    Top = 359
  end
  object QryLabor_Day: TFDQuery
    OnCalcFields = QryLabor_WeekCalcFields
    MasterSource = SrcLabor_Week
    MasterFields = 'Sched_Only;MFGTYPE;MFGCELL;WEEK_START;EMP_LEVEL_ID'
    DetailFields = 'Sched_Only;MFGTYPE;MFGCELL;EMP_LEVEL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.mfgtype,'
      '       v.mfgcell,'
      '       v.prod_date,'
      '       v.emp_level_id,'
      ''
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_shift_hrs, v.shift_hrs ' +
        ') as shift_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_labor_hrs, v.labor_hrs ' +
        ') as labor_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_setuphrs,  v.setuphrs  ' +
        ') as setuphrs,'
      ''
      '       ( select Sum(NVL(a.labor_hrs,0)) from std_labor a'
      '          where v.mfgtype = RTrim(a.mfgtype)'
      '            and NVL(v.mfgcell,'#39'*'#39') = NVL(RTrim(a.mfgcell), '#39'*'#39')'
      '            and to_char(v.prod_date,'#39'D'#39') = a.week_day'
      
        '            and v.emp_level_id = a.emp_level_id ) as avail_labor' +
        '_hrs'
      '  from'
      '       v_day_labor_day v'
      ' where'
      '       v.mfgtype = :mfgtype'
      '   and NVL(v.mfgcell,'#39'*'#39') = NVL(:mfgcell, '#39'*'#39')'
      
        '   and v.prod_date >= :week_start and v.prod_date - 7 < :week_st' +
        'art'
      '   and NVL(v.emp_level_id,0) = NVL(:emp_level_id,0)'
      ''
      ' order by v.prod_date'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 24
    Top = 240
    ParamData = <
      item
        Name = 'sched_only'
        DataType = ftString
        ParamType = ptInput
        Size = 2
        Value = Null
      end
      item
        Name = 'MFGTYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 11
        Value = 'ARIK'
      end
      item
        Name = 'MFGCELL'
        DataType = ftString
        ParamType = ptInput
        Size = 16
        Value = Null
      end
      item
        Name = 'week_start'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = 42379d
      end
      item
        Name = 'EMP_LEVEL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryLabor_DayMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Size = 10
    end
    object QryLabor_DayMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Size = 15
    end
    object QryLabor_DayPROD_DATE: TDateTimeField
      DisplayLabel = 'Prod Date'
      FieldName = 'PROD_DATE'
      DisplayFormat = 'c'
    end
    object QryLabor_DaySHIFT_HRS: TFMTBCDField
      DisplayLabel = 'Prod Hrs'
      FieldName = 'SHIFT_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_DayLABOR_HRS: TFMTBCDField
      DisplayLabel = 'Labor Hrs'
      FieldName = 'LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_DaySETUPHRS: TFMTBCDField
      DisplayLabel = 'SU'
      FieldName = 'SETUPHRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_DayAVAIL_LABOR_HRS: TFMTBCDField
      DisplayLabel = 'Avail Hrs'
      FieldName = 'AVAIL_LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_DayPercent: TFloatField
      DisplayLabel = 'Used %'
      FieldKind = fkCalculated
      FieldName = 'Percent'
      DisplayFormat = '#####0.00'
      Calculated = True
    end
    object QryLabor_DayEMP_LEVEL_ID: TBCDField
      FieldName = 'EMP_LEVEL_ID'
      Size = 0
    end
    object QryLabor_DaySched_Only: TStringField
      FieldKind = fkCalculated
      FieldName = 'Sched_Only'
      Visible = False
      Size = 1
      Calculated = True
    end
  end
  object QryMfgTypeEx: TFDQuery
    Tag = 1
    OnCalcFields = QryMfgTypeCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct '
      '       RTrim(v.mfgtype) as mfgtype,'
      '       '#39'*'#39' as mfgcell,'
      '       l.id as emp_level_id,'
      '       l.code as emp_level_code'
      '  from '
      '       v_day_labor v,'
      '       emp_level l'
      ' where '
      '       v.emp_level_id = l.id(+)'
      '   and misc.eplant_filter_include_nulls( v.eplant_id ) = 1'
      ' order by '
      '       RTrim(v.mfgtype)'
      ' '
      ' ')
    Left = 57
    Top = 112
    object QryMfgTypeExMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 14
      FieldName = 'MFGTYPE'
      Origin = 'RTrim(v.mfgtype)'
      Size = 10
    end
    object QryMfgTypeExMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Size = 1
    end
    object QryMfgTypeExEMP_LEVEL_CODE: TStringField
      DisplayLabel = 'Employee Level'
      DisplayWidth = 12
      FieldName = 'EMP_LEVEL_CODE'
      Origin = 'l.code '
      Size = 10
    end
    object QryMfgTypeExEMP_LEVEL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EMP_LEVEL_ID'
      Origin = 'l.id'
      Visible = False
      Size = 0
    end
    object QryMfgTypeExSched_Only: TStringField
      DisplayWidth = 1
      FieldKind = fkCalculated
      FieldName = 'Sched_Only'
      Visible = False
      Size = 1
      Calculated = True
    end
  end
  object QryLabor_WeekEx: TFDQuery
    Tag = 1
    OnCalcFields = QryLabor_WeekCalcFields
    MasterSource = SrcMfgType
    MasterFields = 'Sched_Only;MFGTYPE;EMP_LEVEL_ID'
    DetailFields = 'Sched_Only;MFGTYPE;EMP_LEVEL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.mfgtype,'
      '       '#39'*'#39' as mfgcell,'
      '       v.week,'
      '       v.week_start,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_shift_hrs, v.shift_hrs ' +
        ') as shift_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_labor_hrs, v.labor_hrs ' +
        ') as labor_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_setuphrs,  v.setuphrs  ' +
        ') as setuphrs,'
      '       v.emp_level_id,'
      ''
      '       ( select Sum(NVL(a.labor_hrs,0)) from std_labor a'
      '          where v.mfgtype = RTrim(a.mfgtype)'
      '            and v.emp_level_id = a.emp_level_id'
      
        '            and decode( Sign( Trunc(v.week_start) - Trunc(IQCale' +
        'ndar.SundayOf( sysdate )) ),            /* include only current ' +
        'date and on */'
      '                        NULL, 0,'
      '                          -1, 0,'
      '                           0, a.week_day,'
      
        '                           1, 7 ) >= IQCalendar.Day_Of_Week( sys' +
        'date )) as avail_labor_hrs'
      '  from'
      '       v_day_labor_week_ex v'
      ' where'
      '       v.mfgtype = :mfgtype'
      '   and NVL(v.emp_level_id,0) = NVL(:emp_level_id,0)'
      ' order by'
      '       week_start'
      ''
      ''
      ''
      ' ')
    Left = 57
    Top = 178
    ParamData = <
      item
        Name = 'sched_only'
        DataType = ftString
        ParamType = ptInput
        Size = 2
        Value = Null
      end
      item
        Name = 'MFGTYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 11
        Value = 'ARIK'
      end
      item
        Name = 'EMP_LEVEL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryLabor_WeekExMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Origin = 'V_DAY_LABOR.MFGTYPE'
      Size = 10
    end
    object QryLabor_WeekExMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Size = 1
    end
    object QryLabor_WeekExWEEK: TBCDField
      DisplayLabel = 'Week'
      FieldName = 'WEEK'
      Origin = 'V_DAY_LABOR.WEEK'
      Size = 0
    end
    object QryLabor_WeekExWEEK_START: TDateTimeField
      DisplayLabel = 'Starts On'
      FieldName = 'WEEK_START'
      Origin = 'V_DAY_LABOR.WEEK_START'
    end
    object QryLabor_WeekExSHIFT_HRS: TFMTBCDField
      DisplayLabel = 'Prod Hrs'
      FieldName = 'SHIFT_HRS'
      Origin = 'V_DAY_LABOR.SHIFT_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_WeekExLABOR_HRS: TFMTBCDField
      DisplayLabel = 'Labor Hrs'
      FieldName = 'LABOR_HRS'
      Origin = 'V_DAY_LABOR.LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_WeekExSETUPHRS: TFMTBCDField
      DisplayLabel = 'SU'
      FieldName = 'SETUPHRS'
      Origin = 'V_DAY_LABOR.SETUPHRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_WeekExAVAIL_LABOR_HRS: TFMTBCDField
      DisplayLabel = 'Avail Hrs'
      FieldName = 'AVAIL_LABOR_HRS'
      Origin = 'V_DAY_LABOR_COMB.AVAIL_LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_WeekExPercent: TFloatField
      DisplayLabel = 'Used %'
      FieldKind = fkCalculated
      FieldName = 'Percent'
      DisplayFormat = '#####0.00'
      Calculated = True
    end
    object QryLabor_WeekExEMP_LEVEL_ID: TBCDField
      FieldName = 'EMP_LEVEL_ID'
      Size = 0
    end
    object QryLabor_WeekExSched_Only: TStringField
      FieldKind = fkCalculated
      FieldName = 'Sched_Only'
      Visible = False
      Size = 1
      Calculated = True
    end
  end
  object QryLabor_DayEx: TFDQuery
    OnCalcFields = QryLabor_WeekCalcFields
    MasterSource = SrcLabor_Week
    MasterFields = 'Sched_Only;MFGTYPE;WEEK_START;EMP_LEVEL_ID'
    DetailFields = 'Sched_Only;MFGTYPE;EMP_LEVEL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.mfgtype,'
      '       '#39'*'#39' as mfgcell,'
      '       v.prod_date,'
      '       v.emp_level_id,'
      ''
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_shift_hrs, v.shift_hrs ' +
        ') as shift_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_labor_hrs, v.labor_hrs ' +
        ') as labor_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_setuphrs,  v.setuphrs  ' +
        ') as setuphrs,'
      ''
      '       ( select Sum(NVL(a.labor_hrs,0)) from std_labor a'
      '          where v.mfgtype = RTrim(a.mfgtype)'
      '            and to_char(v.prod_date,'#39'D'#39') = a.week_day'
      
        '            and v.emp_level_id = a.emp_level_id ) as avail_labor' +
        '_hrs'
      '  from'
      '       v_day_labor_day_ex v'
      ' where'
      '       v.mfgtype = :mfgtype'
      
        '   and v.prod_date >= :week_start and v.prod_date - 7 < :week_st' +
        'art'
      '   and NVL(v.emp_level_id,0) = NVL(:emp_level_id,0)'
      ''
      ' order by v.prod_date'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 56
    Top = 240
    ParamData = <
      item
        Name = 'sched_only'
        DataType = ftString
        ParamType = ptInput
        Size = 2
        Value = Null
      end
      item
        Name = 'MFGTYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 11
        Value = 'ARIK'
      end
      item
        Name = 'week_start'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = 42379d
      end
      item
        Name = 'EMP_LEVEL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryLabor_DayExMFGTYPE: TStringField
      FieldName = 'MFGTYPE'
      Size = 10
    end
    object QryLabor_DayExMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Size = 1
    end
    object QryLabor_DayExPROD_DATE: TDateTimeField
      DisplayLabel = 'Prod Date'
      FieldName = 'PROD_DATE'
      DisplayFormat = 'c'
    end
    object QryLabor_DayExSHIFT_HRS: TFMTBCDField
      DisplayLabel = 'Prod Hrs'
      FieldName = 'SHIFT_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_DayExLABOR_HRS: TFMTBCDField
      DisplayLabel = 'Labor Hrs'
      FieldName = 'LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_DayExSETUPHRS: TFMTBCDField
      DisplayLabel = 'SU'
      FieldName = 'SETUPHRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_DayExAVAIL_LABOR_HRS: TFMTBCDField
      DisplayLabel = 'Avail Hrs'
      FieldName = 'AVAIL_LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryLabor_DayExPercent: TFloatField
      DisplayLabel = 'Used %'
      FieldKind = fkCalculated
      FieldName = 'Percent'
      DisplayFormat = '#####0.00'
      Calculated = True
    end
    object QryLabor_DayExEMP_LEVEL_ID: TBCDField
      FieldName = 'EMP_LEVEL_ID'
      Size = 0
    end
    object QryLabor_DayExSched_Only: TStringField
      FieldKind = fkCalculated
      FieldName = 'Sched_Only'
      Visible = False
      Size = 1
      Calculated = True
    end
  end
  object QryDetailEx: TFDQuery
    OnCalcFields = QryLabor_WeekCalcFields
    MasterSource = SrcLabor_Day
    MasterFields = 'Sched_Only;MFGTYPE;PROD_DATE;EMP_LEVEL_ID'
    DetailFields = 'Sched_Only;EMP_LEVEL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.shift,'
      '       v.emp_level_id,'
      ''
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_shift_hrs, v.shift_hrs ' +
        ') as shift_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_labor_hrs, v.labor_hrs ' +
        ') as labor_hrs,'
      
        '       decode( :sched_only, '#39'Y'#39', v.sched_setuphrs,  v.setuphrs  ' +
        ') as setuphrs,'
      ''
      '       (select sum( a.labor_hrs ) '
      '          from std_labor a '
      '         where v.mfgtype = RTrim(a.mfgtype)'
      '           and v.shift = a.shift'
      '           and to_char(v.prod_date,'#39'D'#39') = a.week_day'
      
        '           and NVL(v.emp_level_id,0) = NVL(a.emp_level_id,0)) as' +
        ' avail_labor_hrs'
      '  from'
      '       v_day_labor_shift_ex v'
      ' where'
      '       v.mfgtype = :mfgtype'
      '   and v.prod_date = :prod_date'
      '   and NVL(v.emp_level_id,0) = NVL(:emp_level_id,0)'
      '   '
      ' order by v.shift'
      ' '
      ' '
      ' ')
    Left = 56
    Top = 308
    ParamData = <
      item
        Name = 'sched_only'
        DataType = ftString
        ParamType = ptInput
        Size = 2
        Value = Null
      end
      item
        Name = 'MFGTYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 11
        Value = 'ARIK'
      end
      item
        Name = 'PROD_DATE'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = 42385.2916666667d
      end
      item
        Name = 'EMP_LEVEL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryDetailExSHIFT: TBCDField
      DisplayLabel = 'Shift'
      FieldName = 'SHIFT'
      Origin = 'V_DAY_LABOR.SHIFT'
      Size = 0
    end
    object QryDetailExSHIFT_HRS: TFMTBCDField
      DisplayLabel = 'Prod Hrs'
      FieldName = 'SHIFT_HRS'
      Origin = 'V_DAY_LABOR.SHIFT_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryDetailExLABOR_HRS: TFMTBCDField
      DisplayLabel = 'Labor Hrs'
      FieldName = 'LABOR_HRS'
      Origin = 'V_DAY_LABOR.LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryDetailExSETUPHRS: TFMTBCDField
      DisplayLabel = 'SU'
      FieldName = 'SETUPHRS'
      Origin = 'V_DAY_LABOR.SETUPHRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryDetailExAVAIL_LABOR_HRS: TFMTBCDField
      DisplayLabel = 'Avail Hrs'
      FieldName = 'AVAIL_LABOR_HRS'
      Origin = 'V_DAY_LABOR_COMB.AVAIL_LABOR_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryDetailExPercent: TFloatField
      DisplayLabel = 'Used %'
      FieldKind = fkCalculated
      FieldName = 'Percent'
      DisplayFormat = '#####0.00'
      Calculated = True
    end
    object QryDetailExEMP_LEVEL_ID: TBCDField
      FieldName = 'EMP_LEVEL_ID'
      Size = 0
    end
    object QryDetailExSched_Only: TStringField
      FieldKind = fkCalculated
      FieldName = 'Sched_Only'
      Visible = False
      Size = 1
      Calculated = True
    end
  end
end

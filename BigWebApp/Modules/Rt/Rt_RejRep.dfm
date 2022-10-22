object FrmRT_RejRep: TFrmRT_RejRep
  Left = 87
  Top = 117
  HelpContext = 1173763
  ClientHeight = 595
  ClientWidth = 663
  Caption = 'RT Rejects Reporting'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 131
    Width = 663
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Splitter2: TUniSplitter
    Left = 0
    Top = 350
    Width = 663
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 663
    Height = 131
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 661
      Height = 129
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Splitter3: TUniSplitter
        Left = 373
        Top = 0
        Width = 6
        Height = 129
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel9: TUniPanel
        Left = 379
        Top = 1
        Width = 282
        Height = 127
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Bevel4: TUniPanel
          Left = 1
          Top = 1
          Width = 2
          Height = 125
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
          Caption = ''
        end
        object Panel10: TUniPanel
          Left = 2
          Top = 1
          Width = 280
          Height = 125
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          DesignSize = (
            280
            125)
          object Label1: TUniLabel
            Left = 5
            Top = 31
            Width = 48
            Height = 13
            Hint = ''
            Caption = 'Prod Date'
            TabOrder = 5
          end
          object Label2: TUniLabel
            Left = 5
            Top = 54
            Width = 22
            Height = 13
            Hint = ''
            Caption = 'Shift'
            TabOrder = 6
          end
          object Label4: TUniLabel
            Left = 5
            Top = 77
            Width = 29
            Height = 13
            Hint = ''
            Caption = 'Mfg #'
            TabOrder = 7
          end
          object Label6: TUniLabel
            Left = 5
            Top = 100
            Width = 61
            Height = 13
            Hint = ''
            Caption = 'Work Center'
            TabOrder = 8
          end
          object wwDBDateTimePickerProdDate: TUniDBDateTimePicker
            Left = 77
            Top = 27
            Width = 139
            Height = 21
            Hint = ''
            DateTime = 42682.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 0
          end
          object ComboBoxShift: TUniComboBox
            Left = 77
            Top = 50
            Width = 139
            Height = 21
            Hint = ''
            Text = ''
            Items.Strings = (
              '1'
              '2'
              '3'
              '4')
            TabOrder = 9
          end
          object wwDBComboDlgMfg: TUniEdit
            Left = 77
            Top = 73
            Width = 187
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ReadOnly = True
            OnKeyDown = CheckDeleteKey
          end
          object wwDBComboDlgWorkCenter: TUniEdit
            Left = 77
            Top = 96
            Width = 187
            Height = 21
            Hint = ''
            Text = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
            ReadOnly = True
            OnKeyDown = CheckDeleteKey
          end
          object Panel11: TUniPanel
            Left = 1
            Top = 1
            Width = 278
            Height = 28
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
            Caption = ''
            object Bevel2: TUniPanel
              Left = 1
              Top = 25
              Width = 276
              Height = 3
              Hint = ''
              Align = alBottom
              Anchors = [akLeft, akRight, akBottom]
              TabOrder = 1
              Caption = ''
            end
            object Label7: TUniLabel
              Left = 4
              Top = 6
              Width = 114
              Height = 13
              Hint = ''
              Caption = 'Additional Filter Options'
              TabOrder = 2
            end
            object sbtnApply: TUniSpeedButton
              Left = 253
              Top = 1
              Width = 25
              Height = 25
              Hint = 'Apply'
              ShowHint = True
              ParentShowHint = False
              Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000C21E0000C21E00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF034464034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A4A4A4A4A4AFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF0344640ED1FF034464FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A4A4AD6D6D64A4A4AFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF00669A14D3FF034464FF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070D7D7D74A
                4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF0099CC1BD5FF1BD5FF034464FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1D9D9D9D9
                D9D94A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF00669A22D7FF22D7FF034464FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DA
                DADADADADA4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF00669A00669A00669A29DAFF034464034464034464FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070707070DC
                DCDC4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF00669A30DCFF30DCFF034464FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DEDEDEDE
                DEDE4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF00669A37DEFF37DEFF034464FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070DF
                DFDFDFDFDF4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF00669A3DE0FF3DE0FF3DE0FF034464FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E1
                E1E1E1E1E1E1E1E14A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF00669A00669A00669A00669A44E3FF034464034464034464034464FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070707070707070707070E3
                E3E34A4A4A4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF00669A4BE5FF4BE5FF4BE5FF4BE5FF034464FF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E5E5E5E5E5E5E5
                E5E5E5E5E54A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF00669A5CEBFE5CEBFE5CEBFE5CEBFE034464FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF707070E9E9E9E9
                E9E9E9E9E9E9E9E94A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF0099CC00669A70F1FE70F1FE70F1FE70F1FE034464FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A1707070EE
                EEEEEEEEEEEEEEEEEEEEEE4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FF0099CC0344640344640344640344640344640344
                64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1A1A14A
                4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4AFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              Caption = ''
              Align = alRight
              Anchors = [akTop, akRight, akBottom]
              ParentColor = False
              Color = clWindow
              OnClick = sbtnApplyClick
            end
          end
        end
      end
      object Panel7: TUniPanel
        Left = 1
        Top = 1
        Width = 373
        Height = 127
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        Caption = ''
        object Bevel1: TUniPanel
          Left = 1
          Top = 28
          Width = 16
          Height = 99
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 2
          Caption = ''
        end
        object Panel8: TUniPanel
          Left = 1
          Top = 1
          Width = 371
          Height = 28
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
          object Bevel3: TUniPanel
            Left = 1
            Top = 25
            Width = 369
            Height = 3
            Hint = ''
            Align = alBottom
            Anchors = [akLeft, akRight, akBottom]
            TabOrder = 2
            Caption = ''
          end
          object chkFilterOneItem: TUniCheckBox
            Left = 1
            Top = 5
            Width = 113
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Filter Selected Item'
            TabOrder = 0
          end
        end
        object wwDataInspector1: TwwDataInspector
          Left = 16
          Top = 28
          Width = 357
          Height = 99
          DisableThemes = False
          Align = alClient
          BorderStyle = bsNone
          TabOrder = 3
          DataSource = SrcHeader
          Items = <
            item
              DataSource = SrcHeader
              DataField = 'ITEMNO'
              Caption = 'Item #'
              Items = <
                item
                  DataSource = SrcHeader
                  DataField = 'DESCRIP'
                  Caption = 'Description'
                  WordWrap = False
                end
                item
                  DataSource = SrcHeader
                  DataField = 'DESCRIP2'
                  Caption = 'Ext Description'
                  WordWrap = False
                end
                item
                  DataSource = SrcHeader
                  DataField = 'REV'
                  Caption = 'Rev'
                  WordWrap = False
                end
                item
                  DataSource = SrcHeader
                  DataField = 'CLASS'
                  Caption = 'Class'
                  WordWrap = False
                end>
              WordWrap = False
            end
            item
              DataSource = SrcHeader
              DataField = 'EQNO'
              Caption = 'Work Center'
              Expanded = True
              Items = <
                item
                  DataSource = SrcHeader
                  DataField = 'CNTR_DESC'
                  Caption = 'Work Center Description'
                  WordWrap = False
                end>
              WordWrap = False
            end
            item
              DataSource = SrcHeader
              DataField = 'MFGNO'
              Caption = 'Mfg #'
              WordWrap = False
            end
            item
              DataSource = SrcHeader
              WordWrap = False
            end>
          DefaultRowHeight = 19
          CaptionWidth = 161
          Options = [ovColumnResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
          CaptionFont.Charset = DEFAULT_CHARSET
          CaptionFont.Color = clWindowText
          CaptionFont.Height = -11
          CaptionFont.Name = 'Tahoma'
          CaptionFont.Style = []
          LineStyleCaption = ovDottedLine
          LineStyleData = ovDottedLine
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 134
    Width = 663
    Height = 216
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Panel5: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 661
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 0
      Caption = ''
      Color = clBtnShadow
      object Label5: TUniLabel
        Left = 1
        Top = 1
        Width = 113
        Height = 13
        Hint = ''
        Caption = 'Rejects Trend Chart'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object DBChartTrend: TDBChart
      Left = 0
      Top = 20
      Width = 663
      Height = 196
      BackWall.Brush.Style = bsClear
      BackWall.Brush.Gradient.Direction = gdBottomTop
      BackWall.Brush.Gradient.EndColor = clWhite
      BackWall.Brush.Gradient.StartColor = 15395562
      BackWall.Brush.Gradient.Visible = True
      BackWall.Transparent = False
      Foot.Font.Color = clBlue
      Foot.Font.Name = 'Verdana'
      Gradient.Direction = gdBottomTop
      Gradient.EndColor = clWhite
      Gradient.MidColor = 15395562
      Gradient.StartColor = 15395562
      Gradient.Visible = True
      LeftWall.Color = 14745599
      MarginRight = 1
      RightWall.Color = 14745599
      Title.Font.Color = clBlack
      Title.Font.Name = 'Verdana'
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'Trend Chart')
      Title.Visible = False
      BottomAxis.Axis.Color = 4210752
      BottomAxis.Grid.Color = 11119017
      BottomAxis.LabelsFormat.Font.Name = 'Verdana'
      BottomAxis.TicksInner.Color = 11119017
      BottomAxis.Title.Font.Name = 'Verdana'
      DepthAxis.Axis.Color = 4210752
      DepthAxis.Grid.Color = 11119017
      DepthAxis.LabelsFormat.Font.Name = 'Verdana'
      DepthAxis.TicksInner.Color = 11119017
      DepthAxis.Title.Font.Name = 'Verdana'
      DepthTopAxis.Axis.Color = 4210752
      DepthTopAxis.Grid.Color = 11119017
      DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
      DepthTopAxis.TicksInner.Color = 11119017
      DepthTopAxis.Title.Font.Name = 'Verdana'
      LeftAxis.Axis.Color = 4210752
      LeftAxis.Grid.Color = 11119017
      LeftAxis.LabelsFormat.Font.Name = 'Verdana'
      LeftAxis.TicksInner.Color = 11119017
      LeftAxis.Title.Font.Name = 'Verdana'
      Legend.Font.Name = 'Verdana'
      Legend.Shadow.Transparency = 0
      Legend.Visible = False
      RightAxis.Axis.Color = 4210752
      RightAxis.Grid.Color = 11119017
      RightAxis.LabelsFormat.Font.Name = 'Verdana'
      RightAxis.TicksInner.Color = 11119017
      RightAxis.Title.Font.Name = 'Verdana'
      TopAxis.Axis.Color = 4210752
      TopAxis.Grid.Color = 11119017
      TopAxis.LabelsFormat.Font.Name = 'Verdana'
      TopAxis.TicksInner.Color = 11119017
      TopAxis.Title.Font.Name = 'Verdana'
      View3D = False
      Zoom.Animated = True
      Zoom.Brush.Color = 14408667
      Zoom.Brush.Style = bsSolid
      Zoom.Pen.Color = clGray
      Zoom.Pen.Style = psDot
      Zoom.Pen.Width = 1
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        39
        15
        39)
      ColorPaletteIndex = 0
      object Series1: TLineSeries
        ColorEachLine = False
        Marks.Style = smsValue
        DataSource = QryTrend
        SeriesColor = 16744448
        Title = 'Rejects Trend'
        XLabelsSource = 'TimeDisp'
        Brush.BackColor = clDefault
        Dark3D = False
        Pointer.HorizSize = 3
        Pointer.InflateMargins = True
        Pointer.Style = psDiamond
        Pointer.VertSize = 3
        Pointer.Visible = True
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        XValues.ValueSource = 'TIME_STAMP'
        YValues.Name = 'Y'
        YValues.Order = loNone
        YValues.ValueSource = 'TOTAL_REJECTS'
      end
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 576
    Width = 663
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 353
    Width = 663
    Height = 223
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Panel6: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 661
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
        Width = 118
        Height = 13
        Hint = ''
        Caption = 'Rejects Pareto Chart'
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object DBChartPareto: TDBChart
      Left = 0
      Top = 20
      Width = 663
      Height = 203
      BackWall.Brush.Style = bsClear
      BackWall.Brush.Gradient.Direction = gdBottomTop
      BackWall.Brush.Gradient.EndColor = clWhite
      BackWall.Brush.Gradient.StartColor = 15395562
      BackWall.Brush.Gradient.Visible = True
      BackWall.Transparent = False
      Foot.Font.Color = clBlue
      Foot.Font.Name = 'Verdana'
      Gradient.Direction = gdBottomTop
      Gradient.EndColor = clWhite
      Gradient.MidColor = 15395562
      Gradient.StartColor = 15395562
      Gradient.Visible = True
      LeftWall.Color = 14745599
      MarginRight = 1
      RightWall.Color = 14745599
      Title.Font.Color = clBlack
      Title.Font.Name = 'Verdana'
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        'Pareto Chart')
      Title.Visible = False
      BottomAxis.Axis.Color = 4210752
      BottomAxis.Grid.Color = 11119017
      BottomAxis.LabelsFormat.Font.Name = 'Verdana'
      BottomAxis.TicksInner.Color = 11119017
      BottomAxis.Title.Font.Name = 'Verdana'
      DepthAxis.Axis.Color = 4210752
      DepthAxis.Grid.Color = 11119017
      DepthAxis.LabelsFormat.Font.Name = 'Verdana'
      DepthAxis.TicksInner.Color = 11119017
      DepthAxis.Title.Font.Name = 'Verdana'
      DepthTopAxis.Axis.Color = 4210752
      DepthTopAxis.Grid.Color = 11119017
      DepthTopAxis.LabelsFormat.Font.Name = 'Verdana'
      DepthTopAxis.TicksInner.Color = 11119017
      DepthTopAxis.Title.Font.Name = 'Verdana'
      LeftAxis.Axis.Color = 4210752
      LeftAxis.Grid.Color = 11119017
      LeftAxis.LabelsFormat.Font.Name = 'Verdana'
      LeftAxis.TicksInner.Color = 11119017
      LeftAxis.Title.Font.Name = 'Verdana'
      Legend.Font.Name = 'Verdana'
      Legend.Shadow.Transparency = 0
      Legend.Visible = False
      RightAxis.Axis.Color = 4210752
      RightAxis.Grid.Color = 11119017
      RightAxis.LabelsFormat.Font.Name = 'Verdana'
      RightAxis.TicksInner.Color = 11119017
      RightAxis.Title.Font.Name = 'Verdana'
      TopAxis.Axis.Color = 4210752
      TopAxis.Grid.Color = 11119017
      TopAxis.LabelsFormat.Font.Name = 'Verdana'
      TopAxis.TicksInner.Color = 11119017
      TopAxis.Title.Font.Name = 'Verdana'
      View3D = False
      Zoom.Animated = True
      Zoom.Brush.Color = 14408667
      Zoom.Brush.Style = bsSolid
      Zoom.Pen.Color = clGray
      Zoom.Pen.Style = psDot
      Zoom.Pen.Width = 1
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        38
        15
        38)
      ColorPaletteIndex = 0
      object Series2: TBarSeries
        BarBrush.Gradient.EndColor = clRed
        BarBrush.Gradient.StartColor = clMaroon
        BarBrush.Gradient.Visible = True
        ConePercent = 100
        Marks.Visible = False
        Marks.Style = smsValue
        DataSource = QryPareto
        Title = 'Pareto'
        XLabelsSource = 'REJECT_CODE'
        Gradient.EndColor = clRed
        Gradient.StartColor = clMaroon
        Gradient.Visible = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Bar'
        YValues.Order = loNone
        YValues.ValueSource = 'TOTAL_REJECTS'
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 71
    Top = 179
    object File2: TUniMenuItem
      Caption = 'File'
      object Exit2: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit2Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = 'Reports'
      object Print1: TUniMenuItem
        Caption = 'Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer Setup'
        OnClick = PrinterSetup1Click
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
  object SrcHeader: TDataSource
    DataSet = QryHeader
    Left = 129
    Top = 179
  end
  object QryHeader: TFDQuery
    BeforeOpen = QryHeaderBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select rt.itemno, '
      '       rt.descrip, '
      '       a.descrip2,'
      '       rt.eqno,'
      '       rt.cntr_desc,'
      '       rt.mfgno,'
      '       a.class, '
      '       a.rev'
      '  from V_RT_PART_NUMBERS rt, arinvt a'
      ' where rt.illum_part_id = :illum_part_id'
      '   and rt.arinvt_id = a.id'
      ' ')
    Left = 129
    Top = 192
    ParamData = <
      item
        Name = 'illum_part_id'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object QryHeaderITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.V_RT_PART_NUMBERS.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryHeaderDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.V_RT_PART_NUMBERS.DESCRIP'
      Size = 100
    end
    object QryHeaderEQNO: TStringField
      FieldName = 'EQNO'
      Origin = 'IQ.V_RT_PART_NUMBERS.EQNO'
      FixedChar = True
      Size = 60
    end
    object QryHeaderCNTR_DESC: TStringField
      FieldName = 'CNTR_DESC'
      Origin = 'IQ.V_RT_PART_NUMBERS.CNTR_DESC'
      Size = 250
    end
    object QryHeaderMFGNO: TStringField
      FieldName = 'MFGNO'
      Origin = 'IQ.V_RT_PART_NUMBERS.MFGNO'
      Size = 50
    end
    object QryHeaderCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryHeaderREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object QryHeaderDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
  end
  object QryTrend: TFDQuery
    BeforeOpen = QryTrendBeforeOpen
    OnCalcFields = QryTrendCalcFields
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evItems, evCache, evUnidirectional, evCursorKind, evAutoFetchAll]
    FetchOptions.Items = []
    FetchOptions.Cache = []
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       r1.time_stamp,'
      '       sum(r2.rejects) as total_rejects'
      '  from '
      '       v_report_rejects r1,'
      '       v_report_rejects r2'
      ' where '
      '      /* filter on v_report_rejects r1 */'
      '      (:illum_part_id = 0'
      '        or'
      
        '        :illum_part_id > 0 and r1.hist_illum_part_id = :illum_pa' +
        'rt_id)'
      ''
      '   and (:prod_date = to_date('#39'12/30/1899'#39', '#39'mm/dd/yyyy'#39')'
      '        or'
      
        '        :prod_date > to_date('#39'12/30/1899'#39', '#39'mm/dd/yyyy'#39') and r1.' +
        'prod_date = :prod_date)'
      '        '
      '   and (:shift = 0'
      '        or'
      '        :shift > 0 and r1.shift = :shift)'
      '        '
      '   and (:standard_id = 0'
      '        or'
      '        :standard_id > 0 and r1.standard_id = :standard_id)'
      ''
      '   and (:work_center_id = 0'
      '        or     '
      
        '        :work_center_id > 0 and :work_center_id = r1.work_center' +
        '_id )'
      ''
      '       /* filter on v_report_rejects r2 */'
      '   and (:illum_part_id = 0'
      '        or'
      
        '       :illum_part_id > 0 and r2.hist_illum_part_id = :illum_par' +
        't_id)'
      ''
      '   and (:prod_date = to_date('#39'12/30/1899'#39', '#39'mm/dd/yyyy'#39')'
      '        or'
      
        '        :prod_date > to_date('#39'12/30/1899'#39', '#39'mm/dd/yyyy'#39') and r2.' +
        'prod_date = :prod_date)'
      '        '
      '   and (:shift = 0'
      '        or'
      '        :shift > 0 and r2.shift = :shift)'
      '        '
      '   and (:standard_id = 0'
      '        or'
      '        :standard_id > 0 and r2.standard_id = :standard_id)'
      ''
      '   and (:work_center_id = 0'
      '        or     '
      
        '        :work_center_id > 0 and :work_center_id = r2.work_center' +
        '_id )'
      ''
      '   and r2.time_stamp <= r1.time_stamp'
      ''
      '   and misc.eplant_filter( r1.eplant_id ) = 1'
      '   and misc.eplant_filter( r2.eplant_id ) = 1'
      ''
      'group by '
      '       r1.time_stamp'
      '')
    Left = 166
    Top = 192
    ParamData = <
      item
        Name = 'ILLUM_PART_ID'
        DataType = ftLargeint
        ParamType = ptInput
      end
      item
        Name = 'PROD_DATE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'SHIFT'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'STANDARD_ID'
        DataType = ftLargeint
        ParamType = ptInput
      end
      item
        Name = 'WORK_CENTER_ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object QryTrendTIME_STAMP: TDateTimeField
      FieldName = 'TIME_STAMP'
      Origin = 'IQ.REJECTS.TIME_STAMP'
    end
    object QryTrendTOTAL_REJECTS: TFMTBCDField
      FieldName = 'TOTAL_REJECTS'
      Origin = 'IQ.REJECTS.REJECTS'
      Size = 38
    end
    object QryTrendTimeDisp: TStringField
      FieldKind = fkCalculated
      FieldName = 'TimeDisp'
      Calculated = True
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Reject Reporting'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195796 $'
    BuildVersion = '176554'
    Left = 70
    Top = 211
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmRT_RejRep'
    WebUse = False
    TouchScreen = False
    Left = 70
    Top = 246
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 70
    Top = 280
  end
  object QryPareto: TFDQuery
    BeforeOpen = QryParetoBeforeOpen
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evItems, evCache]
    FetchOptions.Items = []
    FetchOptions.Cache = []
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       r.reject_code,'
      '       sum(r.rejects) as total_rejects'
      '  from hist_illum_rt rt, '
      '       hist_illum_part p, '
      '       rejects r, '
      '       work_center w /* to get eplant_id */'
      ' where '
      '       rt.id = p.hist_illum_rt_id'
      '   and p.id = r.hist_illum_part_id'
      '   and rt.work_center_id = w.id(+)'
      '   '
      '   and (:illum_part_id = 0'
      '        or'
      
        '        :illum_part_id > 0 and r.hist_illum_part_id = :illum_par' +
        't_id)'
      ''
      '   and (:prod_date = to_date('#39'12/30/1899'#39', '#39'mm/dd/yyyy'#39')'
      '        or'
      
        '        :prod_date > to_date('#39'12/30/1899'#39', '#39'mm/dd/yyyy'#39') and r.p' +
        'rod_date = :prod_date)'
      '        '
      '   and (:shift = 0'
      '        or'
      '        :shift > 0 and r.shift = :shift)'
      '        '
      '   and (:standard_id = 0'
      '        or'
      '        :standard_id > 0 and rt.standard_id = :standard_id)'
      ''
      '   and (:work_center_id = 0'
      '        or     '
      
        '        :work_center_id > 0 and :work_center_id = rt.work_center' +
        '_id )'
      '        '
      '   and misc.eplant_filter( w.eplant_id ) = 1      '
      'group by '
      '       r.reject_code'
      'order by 2 desc')
    Left = 200
    Top = 193
    ParamData = <
      item
        Name = 'ILLUM_PART_ID'
        DataType = ftLargeint
        ParamType = ptInput
      end
      item
        Name = 'PROD_DATE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'SHIFT'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'STANDARD_ID'
        DataType = ftLargeint
        ParamType = ptInput
      end
      item
        Name = 'WORK_CENTER_ID'
        DataType = ftLargeint
        ParamType = ptInput
      end>
    object QryParetoREJECT_CODE: TStringField
      FieldName = 'REJECT_CODE'
      Origin = 'IQ.REJECTS.REJECT_CODE'
      FixedChar = True
      Size = 5
    end
    object QryParetoTOTAL_REJECTS: TFMTBCDField
      FieldName = 'TOTAL_REJECTS'
      Origin = 'IQ.REJECTS.REJECTS'
      Size = 38
    end
  end
  object tmRefresh: TUniTimer
    Interval = 10000
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = tmRefreshTimer
    Left = 237
    Top = 193
  end
  object PkMfg: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select STANDARD.MFGNO     as MfgNo,'
      '       standard.descrip   as standard_descrip,'
      '       STANDARD.MFG_TYPE  as Mfg_TYPE,'
      '       ARINVT.ITEMNO      as ITEMNO,'
      '       ARINVT.REV         as REV,'
      '       ARINVT.DESCRIP     as DESCRIP,'
      '       ARINVT.DESCRIP2    as DESCRIP2,'
      '       ARCUSTO.COMPANY    as COMPANY,'
      '       STANDARD.ID        as ID,'
      '       m.division_id      as division_id,'
      '       standard.eplant_id as eplant_id,'
      '       standard.pk_hide   as pk_hide'
      '  from STANDARD,'
      '       PARTNO, '
      '       ARINVT, '
      '       ARCUSTO,'
      '       mfgcell m'
      ' where STANDARD.ID = PARTNO.STANDARD_ID(+)'
      '   and PARTNO.ARINVT_ID = ARINVT.ID(+)'
      '   and ARCUSTO.ID(+) = STANDARD.ARCUSTO_ID '
      '   and standard.mfgcell_id = m.id(+)'
      '                       '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 132
    Top = 253
    object PkMfgMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkMfgITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkMfgREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object PkMfgDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkMfgCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 15
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkMfgID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkMfgMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      FieldName = 'MFG_TYPE'
      Size = 10
    end
    object PkMfgDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkMfgDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object PkMfgEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkMfgPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkMfgSTANDARD_DESCRIP: TStringField
      DisplayLabel = 'Mfg Description'
      DisplayWidth = 30
      FieldName = 'STANDARD_DESCRIP'
      Size = 50
    end
  end
  object PkWorkCenter: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       eqno,'
      '       cntr_desc'
      '  from work_center'
      ' where misc.eplant_filter( eplant_id ) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 167
    Top = 253
    object PkWorkCenterID: TBCDField
      FieldName = 'ID'
      Origin = 'WORK_CENTER.ID'
      Visible = False
      Size = 0
    end
    object PkWorkCenterEQNO: TStringField
      DisplayLabel = 'Work Center'
      FieldName = 'EQNO'
      Origin = 'WORK_CENTER.EQNO'
      Size = 60
    end
    object PkWorkCenterCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'CNTR_DESC'
      Origin = 'IQ.WORK_CENTER.CNTR_DESC'
      FixedChar = True
      Size = 250
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMRT_REJREP')
    SecurityCode = 'FRMRT_REJREP'
    Left = 292
    Top = 199
  end
end

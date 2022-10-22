object FrmRTCyclesArchive: TFrmRTCyclesArchive
  Left = 158
  Top = 184
  HelpContext = 1174457
  ClientHeight = 352
  ClientWidth = 667
  Caption = 'RT Cycles Log'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 207
    Top = 27
    Width = 6
    Height = 325
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
    ExplicitHeight = 305
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 27
    Width = 207
    Height = 325
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 305
    object wwDataInspector1: TwwDataInspector
      Left = 0
      Top = 0
      Width = 207
      Height = 325
      DisableThemes = False
      Align = alClient
      BorderStyle = bsNone
      Color = clWindow
      Ctl3D = True
      CaptionColor = clWindow
      ParentCtl3D = False
      TabOrder = 1
      DataSource = SrcDayprod
      Items = <
        item
          DataSource = SrcDayprod
          DataField = 'PROD_DATE'
          Caption = 'Prod Date'
          WordWrap = False
        end
        item
          DataSource = SrcDayprod
          DataField = 'SHIFT'
          Caption = 'Shift'
          WordWrap = False
        end
        item
          DataSource = SrcDayprod
          DataField = 'FG_LOTNO'
          Caption = 'Lot #'
          WordWrap = False
        end
        item
          DataSource = SrcDayprod
          DataField = 'MFG_TYPE'
          Caption = 'Mfg Type'
          WordWrap = False
        end
        item
          DataSource = SrcDayprod
          DataField = 'MFGCELL'
          Caption = 'Mfg Cell'
          WordWrap = False
        end
        item
          DataSource = SrcDayprod
          DataField = 'MFGNO'
          Caption = 'Mfg #'
          WordWrap = False
        end
        item
          DataSource = SrcDayprod
          DataField = 'DAYPROD_ID'
          Caption = 'Prod Rep ID'
          WordWrap = False
        end>
      CaptionWidth = 91
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      ReadOnly = True
      ExplicitHeight = 305
    end
  end
  object Panel2: TUniPanel
    Left = 213
    Top = 27
    Width = 454
    Height = 325
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 500
    ExplicitHeight = 305
    object DBChart1: TDBChart
      Left = 0
      Top = 0
      Width = 454
      Height = 325
      BackWall.Brush.Style = bsClear
      BackWall.Brush.Gradient.Direction = gdBottomTop
      BackWall.Brush.Gradient.EndColor = 11118482
      BackWall.Brush.Gradient.StartColor = 15395562
      BackWall.Brush.Gradient.Visible = True
      BackWall.Transparent = False
      Border.Color = 14645801
      Border.Width = 7
      BottomWall.Brush.Gradient.EndColor = 16580349
      BottomWall.Brush.Gradient.StartColor = 3114493
      BottomWall.Brush.Gradient.Visible = True
      Foot.Font.Color = clBlue
      Foot.Font.Name = 'Verdana'
      Gradient.Direction = gdDiagonalDown
      Gradient.EndColor = 11645361
      Gradient.MidColor = 15395562
      Gradient.StartColor = 15395562
      Gradient.Visible = True
      LeftWall.Brush.Gradient.EndColor = 2413052
      LeftWall.Brush.Gradient.StartColor = 900220
      LeftWall.Brush.Gradient.Visible = True
      LeftWall.Color = 14745599
      RightWall.Color = 14745599
      Title.Alignment = taLeftJustify
      Title.Font.Charset = ANSI_CHARSET
      Title.Font.Name = 'Verdana'
      Title.Text.Strings = (
        'Archived cyles / times')
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
      Legend.Brush.Gradient.Direction = gdTopBottom
      Legend.Brush.Gradient.EndColor = clYellow
      Legend.Brush.Gradient.StartColor = clWhite
      Legend.Brush.Gradient.Visible = True
      Legend.Font.Name = 'Verdana'
      Legend.Shadow.Transparency = 0
      Pages.MaxPointsPerPage = 30
      Pages.ScaleLastPage = False
      RightAxis.Axis.Color = 4210752
      RightAxis.Grid.Color = 11119017
      RightAxis.LabelsFormat.Font.Name = 'Verdana'
      RightAxis.TicksInner.Color = 11119017
      RightAxis.Title.Font.Name = 'Verdana'
      Shadow.Color = clBlack
      Shadow.HorizSize = 10
      Shadow.VertSize = 10
      TopAxis.Axis.Color = 4210752
      TopAxis.Grid.Color = 11119017
      TopAxis.LabelsFormat.Font.Name = 'Verdana'
      TopAxis.TicksInner.Color = 11119017
      TopAxis.Title.Font.Name = 'Verdana'
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 500
      ExplicitHeight = 305
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        22
        15
        22)
      ColorPaletteIndex = 9
      object Series1: TBarSeries
        Legend.Visible = False
        Marks.Brush.Gradient.Visible = True
        Marks.Visible = False
        Marks.Style = smsValue
        Marks.Clip = True
        DataSource = QryIllmCyclesHist
        SeriesColor = 33023
        ShowInLegend = False
        BarStyle = bsRectGradient
        XValues.Name = 'X'
        XValues.Order = loAscending
        XValues.ValueSource = 'SEQ'
        YValues.Name = 'Bar'
        YValues.Order = loNone
        YValues.ValueSource = 'CYCLE_TIME'
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 667
    Height = 27
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    ExplicitTop = -6
    DesignSize = (
      667
      27)
    object sbtnPage1: TUniSpeedButton
      Left = 549
      Top = 1
      Width = 25
      Height = 25
      Hint = 'First page'
      ShowHint = True
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8000888880880888800088880080088880008880E00608888000880EE0660000
        000080EE0666666600000EE066666666000080EE066666660000880EE0660000
        00008880E0060888800088880080088880008888808808888000888888888888
        8000}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnPage1Click
      ExplicitLeft = 595
    end
    object sbtnPagePrev: TUniSpeedButton
      Left = 574
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Prev page'
      ShowHint = True
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        80008888880888888000888880088888800088880E08888880008880EE000008
        8000880EEEEEEE08800080EEEEEEEE088000880EEEEEEE0880008880EE000008
        800088880E088888800088888008888880008888880888888000888888888888
        8000}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnPagePrevClick
      ExplicitLeft = 620
    end
    object sbtnPageNext: TUniSpeedButton
      Left = 599
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Next page'
      ShowHint = True
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8000888888088888800088888800888880008888880E088880008800000EE088
        8000880EEEEEEE088000880EEEEEEEE08000880EEEEEEE0880008800000EE088
        80008888880E0888800088888800888880008888880888888000888888888888
        8000}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnPageNextClick
      ExplicitLeft = 645
    end
    object sbtnPageLast: TUniSpeedButton
      Left = 624
      Top = 1
      Width = 25
      Height = 25
      Hint = 'Last page'
      ShowHint = True
      Glyph.Data = {
        DE000000424DDE0000000000000076000000280000000D0000000D0000000100
        0400000000006800000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        80008888088088888000888800800888800088880600E088800000000660EE08
        8000066666660EE080000666666660EE0000066666660EE0800000000660EE08
        800088880600E088800088880080088880008888088088888000888888888888
        8000}
      Caption = ''
      Anchors = [akTop, akRight]
      ParentColor = False
      Color = clWindow
      OnClick = sbtnPageLastClick
      ExplicitLeft = 670
    end
    object Panel4: TUniPanel
      Left = 642
      Top = 1
      Width = 25
      Height = 25
      Hint = ''
      ShowHint = True
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitLeft = 688
      object sbtnRefresh: TUniSpeedButton
        Left = 1
        Top = 1
        Width = 23
        Height = 23
        Hint = 'Refresh chart'
        ShowHint = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888800008888888887777778888800008888888000006777888800008888
          880EEEE06077788800008888880EEEE0607778880000888880EEEE0666077888
          0000888880EEEE06660778880000888880000006660778880000888888887066
          6607788800008888888000666607788800008888880EE0666607788800008888
          80EEEE0666077888000088880EEEEEE06607788800008880EEEEEEEE06077888
          0000888000EEEE00060778880000888880EEEE066607888800008888880EEEE0
          6078888800008888880EEEE06088888800008888888000006888888800008888
          88888888888888880000}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnRefreshClick
      end
    end
  end
  object SrcIllmCyclesHist: TDataSource
    DataSet = QryIllmCyclesHist
    Left = 308
    Top = 64
  end
  object QryIllmCyclesHist: TFDQuery
    BeforeOpen = QryIllmCyclesHistBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       seq,'
      '       cycle_time'
      '  from'
      '      ( select  cycle_time,'
      '                rownum as seq'
      '          from illm_cycle_hist'
      '         where dayprod_id = :dayprod_id )'
      ' order by seq'
      '')
    Left = 308
    Top = 81
    ParamData = <
      item
        Name = 'dayprod_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryIllmCyclesHistSEQ: TFMTBCDField
      FieldName = 'SEQ'
      Size = 38
    end
    object QryIllmCyclesHistCYCLE_TIME: TBCDField
      FieldName = 'CYCLE_TIME'
      Size = 3
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 170
    Top = 65534
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmRTCyclesArchive'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192951 $'
    BuildVersion = '176554'
    Left = 198
    Top = 65534
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmRTCyclesArchive'
    WebUse = False
    TouchScreen = False
    Left = 226
    Top = 65534
  end
  object SrcDayprod: TDataSource
    DataSet = QryDayprod
    Left = 20
    Top = 176
  end
  object QryDayprod: TFDQuery
    Tag = 1
    BeforeOpen = QryIllmCyclesHistBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select x.hist_illum_rt_id,       '
      '       x.id as dayprod_id,'
      '       x.prod_date,              '
      '       x.shift,                         '
      '       h.mfg_type,                      '
      '       h.mfgcell,                       '
      '       h.mfgno,                         '
      '       x.fg_lotno                       '
      '  from dayprod x,                       '
      '       hist_illum_rt h             '
      ' where                                  '
      '       x.hist_illum_rt_id = h.id  '
      '   and x.id = :dayprod_id')
    Left = 21
    Top = 190
    ParamData = <
      item
        Name = 'dayprod_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDayprodHIST_ILLUM_RT_ID: TBCDField
      FieldName = 'HIST_ILLUM_RT_ID'
      Origin = 'IQ.DAYPROD.HIST_ILLUM_RT_ID'
      Size = 0
    end
    object QryDayprodDAYPROD_ID: TBCDField
      FieldName = 'DAYPROD_ID'
      Origin = 'IQ.DAYPROD.ID'
      Size = 0
    end
    object QryDayprodPROD_DATE: TDateTimeField
      FieldName = 'PROD_DATE'
      Origin = 'IQ.DAYPROD.PROD_DATE'
    end
    object QryDayprodSHIFT: TBCDField
      FieldName = 'SHIFT'
      Origin = 'SHIFT'
      Precision = 1
      Size = 0
    end
    object QryDayprodMFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
      Origin = 'IQ.HIST_ILLUM_RT.MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object QryDayprodMFGCELL: TStringField
      FieldName = 'MFGCELL'
      Origin = 'IQ.HIST_ILLUM_RT.MFGCELL'
      FixedChar = True
      Size = 15
    end
    object QryDayprodMFGNO: TStringField
      FieldName = 'MFGNO'
      Origin = 'IQ.HIST_ILLUM_RT.MFGNO'
      Size = 50
    end
    object QryDayprodFG_LOTNO: TStringField
      FieldName = 'FG_LOTNO'
      Origin = 'IQ.DAYPROD.FG_LOTNO'
      FixedChar = True
      Size = 25
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmRTCyclesArchive')
    SecurityCode = 'FRMRTCYCLESARCHIVE'
    Left = 284
    Top = 65534
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 254
    Top = 65534
  end
end

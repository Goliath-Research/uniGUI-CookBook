object FrmEDIManager: TFrmEDIManager
  Left = 244
  Top = 155
  Caption = 'EDI Monitor'
  ClientHeight = 341
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 199
    Width = 549
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 187
    ExplicitWidth = 531
  end
  object PnlMain: TPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 199
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 531
    ExplicitHeight = 185
    object PnlToolbar: TPanel
      Left = 0
      Top = 0
      Width = 549
      Height = 27
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 531
      DesignSize = (
        549
        27)
      object Shape4: TShape
        Left = 431
        Top = 8
        Width = 12
        Height = 12
        Hint = 'Rejected/Failed/Not Parsed'
        Anchors = [akTop, akRight]
        Brush.Color = clRed
        ParentShowHint = False
        ShowHint = True
        ExplicitLeft = 413
      end
      object Shape5: TShape
        Left = 417
        Top = 8
        Width = 12
        Height = 12
        Hint = 'Awaiting Acknowledgement/Parsed'
        Anchors = [akTop, akRight]
        Brush.Color = clYellow
        ParentShowHint = False
        ShowHint = True
        ExplicitLeft = 399
      end
      object Shape6: TShape
        Left = 403
        Top = 8
        Width = 12
        Height = 12
        Hint = 'Sent/Accepted/Converted/Complete'
        Anchors = [akTop, akRight]
        Brush.Color = clLime
        ParentShowHint = False
        ShowHint = True
        ExplicitLeft = 385
      end
      object sbtnStart: TSpeedButton
        Left = 1
        Top = 1
        Width = 26
        Height = 25
        Hint = 'Start Timer'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888EEEEEEEEEEEEEEE888FFFFFFFFFFFFF8E00000000000
          00E887777777777777F8E0F77777777770E887F88888888887F8E0F888888888
          70E887F88888888887F8E0F88888888870E887F88FFF888887F8E0F888088888
          70E887F88F7FF88887F8E0F88800888870E887F88F77F88887F8E0F888000888
          70E887F88F77788887F8E0F88800888870E887F88F77888887F8E0F888088888
          70E887F88F78888887F8E0F88888888870E887F88888888887F8E0F888888888
          70E887F88888888887F8E0FFFFFFFFFFF0E887FFFFFFFFFFF7F8E00000000000
          00E88777777777777788EEEEEEEEEEEEEEE88888888888888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = StartTimer1Click
      end
      object sbtnStop: TSpeedButton
        Left = 27
        Top = 1
        Width = 26
        Height = 25
        Hint = 'Stop Timer'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888EEEEEEEEEEEEEEE888FFFFFFFFFFFFF8E00000000000
          00E887777777777777F8E0F77777777770E887F88888888887F8E0F888888888
          70E887F88888888887F8E0F88888888870E887F888FFFF8887F8E0F888000888
          70E887F888777F8887F8E0F88800088870E887F888777F8887F8E0F888000888
          70E887F888777F8887F8E0F88800088870E887F888777F8887F8E0F888000888
          70E887F888777F8887F8E0F88888888870E887F88888888887F8E0F888888888
          70E887F88888888887F8E0FFFFFFFFFFF0E887FFFFFFFFFFF7F8E00000000000
          00E88777777777777788EEEEEEEEEEEEEEE88888888888888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = StopTimer1Click
      end
      object Shape7: TShape
        Left = 445
        Top = 8
        Width = 12
        Height = 12
        Hint = 'In Process'
        Anchors = [akTop, akRight]
        Brush.Color = clAqua
        ParentShowHint = False
        ShowHint = True
        ExplicitLeft = 427
      end
    end
    object PnlGrid: TPanel
      Left = 0
      Top = 27
      Width = 549
      Height = 172
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 531
      ExplicitHeight = 158
      object Grid: TIQSearch
        Left = 0
        Top = 0
        Width = 549
        Height = 172
        SaveFilter = True
        SortDirection = sdAscending
        ShowFilter = True
        ShowRecordView = True
        Align = alClient
        BevelOuter = bvNone
        ComponentParentFont = True
        DefaultDrawing = True
        RowHeightPercent = 100
        FixedCols = 0
        TitleAlignment = taLeftJustify
        TitleLines = 1
        MemoAttributes = [mSizeable, mWordWrap, mGridShow]
        DBNavVisible = True
        DBNavWidth = 204
        TabOrder = 0
        UseTFields = True
        DataSource = SrcData
        Selected.Strings = (
          'TRADING_PARTNER'#9'20'#9'Trading Partner'#9'F'
          'TYPE'#9'16'#9'Type'#9'F'
          'TRANS_DATE_TIME'#9'18'#9'Trans. Date/Time'#9'F'
          'FILE_NAME'#9'50'#9'File'#9'F'
          'TRANSACTION_SET_ID'#9'50'#9'Transaction Set ID'#9'F'
          'FILE_STATUS'#9'12'#9'File Status'#9'F'
          'DATE_ACK'#9'19'#9'Date Acknowledged and/or Rejected'#9'F')
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OnCalcCellColors = GridCalcCellColors
        PopupMenu = PM1
        ExplicitWidth = 531
        ExplicitHeight = 158
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 322
    Width = 549
    Height = 19
    Panels = <
      item
        Width = 240
      end
      item
        Width = 240
      end
      item
        Width = 50
      end>
    ExplicitTop = 308
    ExplicitWidth = 531
  end
  object Panel1: TPanel
    Left = 0
    Top = 202
    Width = 549
    Height = 120
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 188
    ExplicitWidth = 531
    object Bevel1: TBevel
      Left = 0
      Top = 27
      Width = 549
      Height = 3
      Align = alTop
      Shape = bsSpacer
      ExplicitWidth = 531
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 549
      Height = 27
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 531
      object DBNavigator1: TDBNavigator
        Left = 448
        Top = 1
        Width = 100
        Height = 25
        DataSource = SrcDtl
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alRight
        Flat = True
        TabOrder = 0
        ExplicitLeft = 430
      end
      object Panel4: TPanel
        Left = 384
        Top = 1
        Width = 64
        Height = 25
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 366
        object Shape1: TShape
          Left = 18
          Top = 8
          Width = 12
          Height = 12
          Hint = 'Sent/Accepted/Converted/Complete'
          Brush.Color = clLime
          ParentShowHint = False
          ShowHint = True
        end
        object Shape2: TShape
          Left = 32
          Top = 8
          Width = 12
          Height = 12
          Hint = 'Awaiting Acknowledgement/Parsed'
          Brush.Color = clYellow
          ParentShowHint = False
          ShowHint = True
        end
        object Shape3: TShape
          Left = 46
          Top = 8
          Width = 12
          Height = 12
          Hint = 'Rejected/Failed/Not Parsed'
          Brush.Color = clRed
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 30
      Width = 549
      Height = 90
      Align = alClient
      BevelInner = bvLowered
      BevelOuter = bvNone
      PopupMenu = PM1
      TabOrder = 1
      ExplicitWidth = 531
      object wwDBGrid1: TwwDBGrid
        Left = 1
        Top = 1
        Width = 547
        Height = 88
        Selected.Strings = (
          'DOCUMENTNO'#9'16'#9'Document #'
          'TRANSACTION_SET_ID'#9'10'#9'Transaction Set'
          'Status'#9'15'#9'Status'
          'USER_NAME'#9'35'#9'User'
          'ITEMNO'#9'10'#9'Item#')
        IniAttributes.Delimiter = ';;'
        IniAttributes.UnicodeIniFile = False
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        BorderStyle = bsNone
        DataSource = SrcDtl
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        PopupMenu = PM2
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = wwDBGrid1CalcCellColors
        ExplicitWidth = 529
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 184
    Top = 1
    object File1: TMenuItem
      Caption = '&File'
      object Exit1: TMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Options1: TMenuItem
      Caption = '&Options'
      object StartTimer1: TMenuItem
        Caption = '&Start Timer'
        OnClick = StartTimer1Click
      end
      object StopTimer1: TMenuItem
        Caption = 'Stop &Timer'
        OnClick = StopTimer1Click
      end
      object SetInterval1: TMenuItem
        Caption = 'Set &Interval'
        OnClick = SetInterval1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Refresh1: TMenuItem
        Caption = '&Refresh'
        OnClick = Refresh1Click
      end
    end
    object Reports1: TMenuItem
      Caption = '&Reports'
      object Print1: TMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object About1: TMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQAbout
    ModuleName = 'EDI Monitor'
    Version = 'DEV.182211'
    ChangeListNumber = '$Change: 189470 $'
    BuildVersion = '182211'
    Left = 240
    Top = 1
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 296
    Top = 1
  end
  object IQRepDef1: TIQRepDef
    App_ID = 'EDI Manager'
    WebUse = False
    TouchScreen = False
    Left = 268
    Top = 1
  end
  object SrcData: TwwDataSource
    OnDataChange = SrcDataDataChange
    Left = 248
    Top = 115
  end
  object SrcDtl: TwwDataSource
    Left = 336
    Top = 115
  end
  object PM1: TPopupMenu
    OnPopup = PM1Popup
    Left = 304
    Top = 67
    object JumptoOutboundLog1: TMenuItem
      Caption = 'Jump to Outbound Log'
      OnClick = JumptoOutboundLog1Click
    end
    object JumptoTradingPartner2: TMenuItem
      Caption = 'Jump to Trading Partner'
      OnClick = JumptoTradingPartner2Click
    end
    object ViewFile1: TMenuItem
      Caption = 'View File'
      OnClick = ViewFile1Click
    end
    object ShowErrors1: TMenuItem
      Caption = '&Show Errors'
      OnClick = ShowErrors1Click
    end
  end
  object SrcRej: TwwDataSource
    Left = 408
    Top = 115
  end
  object PM2: TPopupMenu
    OnPopup = PM2Popup
    Left = 304
    Top = 254
    object ShowRejects1: TMenuItem
      Caption = 'Show Rejects'
      OnClick = ShowRejects1Click
    end
  end
  object MD: TwwMemoDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MemoAttributes = [mSizeable, mWordWrap, mViewOnly]
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    UserButton1Caption = '&Print'
    Left = 208
    Top = 112
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 208
    Top = 75
  end
  object SrcErr: TwwDataSource
    Left = 472
    Top = 115
  end
  object wwFilterDialog1: TwwFilterDialog
    SortBy = fdSortByFieldNo
    FilterMethod = fdByFilter
    DefaultMatchType = fdMatchStart
    DefaultFilterBy = fdSmartFilter
    FieldOperators.OrChar = 'or'
    FieldOperators.AndChar = 'and'
    FieldOperators.NullChar = 'null'
    Rounding.Epsilon = 0.000100000000000000
    Rounding.RoundingMethod = fdrmFixed
    FilterPropertyOptions.LikeWildcardChar = '%'
    FilterOptimization = fdNone
    QueryFormatDateMode = qfdMonthDayYear
    SQLTables = <>
    Left = 176
    Top = 163
  end
  object SR: TSecurityRegister
    ForceAccessItems.Strings = (
      'FRMEDIMANAGER')
    SecurityCode = 'FRMEDIMANAGER'
    Left = 152
    Top = 99
  end
end

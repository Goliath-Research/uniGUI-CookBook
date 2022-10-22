object FrmQueryInfo: TFrmQueryInfo
  Left = 142
  Top = 214
  ClientHeight = 602
  ClientWidth = 776
  Caption = 'Dataset Information'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 260
    Top = 3
    Width = 4
    Height = 513
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 776
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Caption = ''
  end
  object PnlSQL: TUniPanel
    Left = 264
    Top = 3
    Width = 512
    Height = 513
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object pcSQL: TUniPageControl
      Left = 1
      Top = 1
      Width = 510
      Height = 511
      Hint = ''
      ActivePage = TabParsedSQL
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabParsedSQL: TUniTabSheet
        Hint = ''
        ImageIndex = 1
        Caption = 'Parsed SQL'
        object rtfParsedSQL: TUniMemo
          Left = 0
          Top = 0
          Width = 502
          Height = 483
          Hint = ''
          ScrollBars = ssBoth
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Height = -13
          Font.Name = 'Courier New'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
        end
      end
      object TabOriginalSQL: TUniTabSheet
        Hint = ''
        Caption = 'Original SQL'
        object rtfOriginalSQL: TUniMemo
          Left = 0
          Top = 0
          Width = 502
          Height = 483
          Hint = ''
          ScrollBars = ssBoth
          Lines.Strings = (
            '')
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Height = -13
          Font.Name = 'Courier New'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
        end
      end
    end
  end
  object PnlFilter: TUniPanel
    Left = 0
    Top = 516
    Width = 776
    Height = 67
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Alignment = taLeftJustify
    Caption = ''
    object PnlFilterCaption: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 774
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 0
      Caption = ''
      Color = clBtnShadow
      object lblFilterCaption: TUniLabel
        Left = 1
        Top = 1
        Width = 78
        Height = 13
        Hint = ''
        Caption = 'DataSet Filter'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rtfFilter: TUniMemo
      Left = 1
      Top = 20
      Width = 774
      Height = 47
      Hint = ''
      ScrollBars = ssBoth
      Lines.Strings = (
        '')
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Name = 'Courier New'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      ReadOnly = True
      Color = clBtnFace
      TabOrder = 1
      WordWrap = False
    end
  end
  object PnlParams: TUniPanel
    Left = 0
    Top = 3
    Width = 260
    Height = 513
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 2
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 0
      Top = 229
      Width = 260
      Height = 5
      Cursor = crVSplit
      Hint = ''
      Align = alTop
      ParentColor = False
      Color = clBtnFace
    end
    object PnlParamsCaptionBar: TUniPanel
      Tag = 1999
      Left = 1
      Top = 234
      Width = 258
      Height = 20
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Color = clWhite
      TabOrder = 0
      Caption = ''
      Color = clBtnShadow
      object lblParamsCaption: TUniLabel
        Left = 1
        Top = 1
        Width = 84
        Height = 13
        Hint = ''
        Caption = 'Parameter List'
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object Panel1: TUniPanel
      Left = 1
      Top = 1
      Width = 258
      Height = 229
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object InfoValueList: TValueListEditor
        Left = 0
        Top = 20
        Width = 258
        Height = 209
        Align = alClient
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
        TabOrder = 0
        TitleCaptions.Strings = (
          'Name'
          'Value')
        ColWidths = (
          127
          125)
        RowHeights = (
          18
          18)
      end
      object Panel2: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 256
        Height = 20
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Info'
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object ParamsValueList: TValueListEditor
      Left = 0
      Top = 254
      Width = 260
      Height = 259
      Align = alClient
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
      PopupMenu = PParameters
      TabOrder = 2
      TitleCaptions.Strings = (
        'Parameter'
        'Value')
      ColWidths = (
        125
        129)
      RowHeights = (
        18
        18)
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 583
    Width = 776
    Height = 19
    Hint = ''
    Visible = False
    Panels = <
      item
        Text = 'Execution Time:'
        Width = 200
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
  object MainMenu1: TUniMainMenu
    Left = 300
    Top = 60
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object PEditor: TUniPopupMenu
    Left = 328
    Top = 60
    object CopyAllToClipboard1: TUniMenuItem
      Caption = 'Copy All to Clipboard'
      ShortCut = 24643
      OnClick = CopyAllToClipboard1Click
    end
    object CopyToClipboard1: TUniMenuItem
      Caption = 'Copy to Clipboard'
      ShortCut = 16451
      OnClick = CopyToClipboard1Click
    end
  end
  object PParameters: TUniPopupMenu
    Left = 356
    Top = 60
    object CopyParameter1: TUniMenuItem
      Caption = 'Copy'
      ShortCut = 16451
      OnClick = CopyParameter1Click
    end
    object CopyParameterListtoClipboard1: TUniMenuItem
      Caption = 'Copy Parameter List to Clipboard'
      ShortCut = 24643
      OnClick = CopyParameterListtoClipboard1Click
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmQueryInfo'
    Version = 'DEV.176554'
    BuildVersion = '176554'
    Left = 304
    Top = 111
  end
end

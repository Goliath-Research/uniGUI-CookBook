object FrmCharDlg: TFrmCharDlg
  Left = 295
  Top = 242
  ClientHeight = 277
  ClientWidth = 382
  Caption = 'Select Character'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 238
    Width = 382
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 358
    DesignSize = (
      382
      39)
    object btnOk: TUniBitBtn
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Hint = ''
      Caption = '&OK'
      ModalResult = 1
      Anchors = [akTop, akRight]
      TabOrder = 0
      OnClick = btnOkClick
      ExplicitLeft = 208
    end
    object btnCancel: TUniBitBtn
      Left = 312
      Top = 8
      Width = 75
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 1
      ExplicitLeft = 288
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 132
    Width = 382
    Height = 106
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 144
    ExplicitWidth = 366
    object Panel8: TUniPanel
      Left = 1
      Top = 1
      Width = 380
      Height = 74
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitWidth = 356
      object GroupBox1: TUniGroupBox
        Left = 1
        Top = 1
        Width = 378
        Height = 72
        Hint = ''
        Caption = ' Character Entry Options '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 360
        ExplicitHeight = 68
        object Label1: TUniLabel
          Left = 8
          Top = 20
          Width = 112
          Height = 13
          Hint = ''
          Caption = 'Enter from list selection'
          TabOrder = 3
        end
        object sbtnCopy: TUniSpeedButton
          Left = 172
          Top = 15
          Width = 22
          Height = 22
          Hint = 'Append to current'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            5A010000424D5A01000000000000760000002800000013000000130000000100
            040000000000E400000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDD
            DDDDDDDDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDD000DDDDDDDDDDDDD0
            0000DDD0F0DDDD0000000DD00000DD0FE0DDDDD0EFEF0DD00000DD0E0DDDDDDD
            0EFE0DD00000DD0F0DDDDDDD0FEF0DD00000DD0E0DDDDDD0FE0E0DD00000DD0F
            E0DDD00FE0D00DD00000DDD0FE000EFE0DDD0DD00000DDDD0FEFEF00DDDDDDD0
            0000DDDDD00000DDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDDDDDDDDDD
            DDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnCopyClick
        end
        object Label3: TUniLabel
          Left = 8
          Top = 44
          Width = 99
          Height = 13
          Hint = ''
          Caption = 'Enter from keyboard'
          TabOrder = 5
        end
        object sbtnCopyFromKeyboard: TUniSpeedButton
          Left = 236
          Top = 39
          Width = 22
          Height = 22
          Hint = 'Append to current'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            5A010000424D5A01000000000000760000002800000013000000130000000100
            040000000000E400000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDD
            DDDDDDDDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDD000DDDDDDDDDDDDD0
            0000DDD0F0DDDD0000000DD00000DD0FE0DDDDD0EFEF0DD00000DD0E0DDDDDDD
            0EFE0DD00000DD0F0DDDDDDD0FEF0DD00000DD0E0DDDDDD0FE0E0DD00000DD0F
            E0DDD00FE0D00DD00000DDD0FE000EFE0DDD0DD00000DDDD0FEFEF00DDDDDDD0
            0000DDDDD00000DDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDDDDDDDDDD
            DDDDDDD00000DDDDDDDDDDDDDDDDDDD00000DDDDDDDDDDDDDDDDDDD00000}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = sbtnCopyFromKeyboardClick
        end
        object edtSelected: TUniEdit
          Left = 136
          Top = 16
          Width = 33
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 0
        end
        object edtKeyboard: TUniEdit
          Left = 136
          Top = 40
          Width = 97
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 1
        end
      end
    end
    object Panel9: TUniPanel
      Left = 1
      Top = 74
      Width = 380
      Height = 32
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 356
      object Label2: TUniLabel
        Left = 8
        Top = 5
        Width = 74
        Height = 13
        Hint = ''
        Caption = 'Encoded Result'
        TabOrder = 2
      end
      object sbtnClear: TUniSpeedButton
        Left = 263
        Top = 1
        Width = 22
        Height = 22
        Hint = 'Clear'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnClearClick
      end
      object edtCurrent: TUniEdit
        Left = 139
        Top = 1
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
      end
    end
  end
  object Panel7: TUniPanel
    Left = 0
    Top = 0
    Width = 382
    Height = 132
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitWidth = 358
    object Splitter1: TUniSplitter
      Left = 152
      Top = 0
      Width = 3
      Height = 132
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 152
      Height = 130
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = 'Panel3'
      object lstFonts: TUniListBox
        Left = 1
        Top = 21
        Width = 150
        Height = 109
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        OnClick = lstFontsClick
      end
      object Panel6: TUniPanel
        Left = 1
        Top = 1
        Width = 150
        Height = 21
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        object Fonts: TUniLabel
          Left = 1
          Top = 1
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Fonts'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
    object Panel2: TUniPanel
      Left = 155
      Top = 1
      Width = 227
      Height = 130
      Hint = ''
      Constraints.MinHeight = 100
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 203
      object Grid1: TUniStringGrid
        Left = 1
        Top = 21
        Width = 225
        Height = 109
        Hint = ''
        FixedCols = 0
        FixedRows = 0
        RowCount = 1
        ColCount = 2
        DefaultColWidth = 100
        DefaultRowHeight = 19
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goAlwaysShowEditor]
        Columns = <>
        OnDblClick = Grid1DblClick
        OnClick = Grid1Click
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Height = -13
        Font.Name = 'System'
        Font.Style = [fsBold]
        ExplicitWidth = 201
      end
      object Panel5: TUniPanel
        Left = 1
        Top = 1
        Width = 225
        Height = 21
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Caption = ''
        Color = clBtnShadow
        ExplicitWidth = 201
        object Label4: TUniLabel
          Left = 1
          Top = 1
          Width = 62
          Height = 13
          Hint = ''
          Caption = 'Characters'
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
    end
  end
end

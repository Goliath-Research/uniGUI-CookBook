object FrmNewPoReleasesDialog: TFrmNewPoReleasesDialog
  Left = 203
  Top = 163
  HelpContext = 1016102
  ClientHeight = 232
  ClientWidth = 592
  Caption = 'Generate Releases'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 592
    Height = 160
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 394
      Top = 1
      Width = 6
      Height = 158
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      ParentColor = False
      Color = clBtnFace
    end
    object PnlRight1: TUniPanel
      Tag = 1999
      Left = 400
      Top = 1
      Width = 191
      Height = 158
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object chkBlanket: TUniCheckBox
        Left = 5
        Top = 40
        Width = 166
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Use Blanket Quantity'
        TabOrder = 0
        OnClick = chkBlanketClick
      end
    end
    object PnlClient01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 393
      Height = 158
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 155
        Top = 1
        Width = 4
        Height = 156
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlClient02: TUniPanel
        Tag = 1999
        Left = 159
        Top = 1
        Width = 233
        Height = 156
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        DesignSize = (
          233
          156)
        object btnedtInterval: TUniSpeedButton
          Left = 211
          Top = 88
          Width = 18
          Height = 22
          Hint = 'Advanced Interval Options'
          ShowHint = True
          ParentShowHint = False
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            1800000000000006000000000000000000000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000
            FF00FF000000000000FF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF000000000000FF00FF000000000000FF00FF00000000
            0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000
            FF00FF000000000000FF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF000000000000FF00FF000000000000FF00FF00000000
            0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFD2AF96000000A1836DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFADADAD000000818181FF00FFFF00FF
            FF00FFFF00FFDD9D90000000CCB7A6FF00FFFF00FFFF00FFFF00FFFF00FFD4B4
            9B000000808080000000FF00FFFF00FFFF00FFFF00FFA0A0A0000000B6B6B6FF
            00FFFF00FFFF00FFFF00FFFF00FFB2B2B2000000808080000000DEA094000000
            CDBBACFF00FFC06050FFC0C0000000FF00FFFF00FFFF00FFFF00FFD6B7A00000
            00808080000000DDB395A3A3A3000000BABABAFF00FF686868C6C6C6000000FF
            00FFFF00FFFF00FFFF00FFB5B5B5000000808080000000B1B1B1C06050FFC0C0
            000000FF00FFEA9B94C06050E9B9AAFF00FFFF00FFFF00FFD8BCA60000008080
            80000000E0B79BFF00FF686868C6C6C6000000FF00FFA1A1A1686868BABABAFF
            00FFFF00FFFF00FFBABABA000000808080000000B5B5B5FF00FFEA9D97C06050
            E9BCB0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD9C0AB0000008080800000
            00E1BCA1FF00FFFF00FFA3A3A3686868BEBEBEFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFBEBEBE000000808080000000BABABAFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDCC4B1000000808080000000E3C1
            A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFC2C2C2000000808080000000BFBFBFFF00FFFF00FFFF00FFFF00FFFF00FF
            DE9F92000000CCB9A9FF00FFFF00FFDCC4B0000000808080000000E5C4ACFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFA2A2A2000000B7B7B7FF00FFFF00FFC2
            C2C2000000808080000000C2C2C2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            C06050FFC0C0000000FF00FFDCC5B300000040D8F0000000E7C9B2FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF686868C6C6C6000000FF00FFC3C3C300
            0000D8D8D8000000C7C7C7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            EA9C95C06050E9BAADDCC6B500000040D8F0000000E9CEB7FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFA2A2A2686868BCBCBCC4C4C4000000D8
            D8D8000000CCCCCCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF000000F0F8F0000000ECD2BEFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FF00
            0000D0D0D0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFECD4C2000000ECD2BDFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3D3D3000000D0
            D0D0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          Caption = ''
          ParentColor = False
          Color = clWindow
          OnClick = btnedtIntervalRightButtonClick
        end
        object edtCount: TUniEdit
          Left = 0
          Top = 16
          Width = 229
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object edtQty: TUniEdit
          Left = 0
          Top = 40
          Width = 229
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object dtpStartDate: TUniDateTimePicker
          Left = 0
          Top = 64
          Width = 229
          Height = 24
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          DateTime = 42678.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object chkForecast: TUniCheckBox
          Left = 0
          Top = 112
          Width = 89
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Forecast'
          TabOrder = 4
          OnClick = chkBlanketClick
        end
        object edInterval: TUniEdit
          Left = 0
          Top = 88
          Width = 203
          Height = 21
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Text = '7'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
      end
      object PnlLeft01: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 154
        Height = 156
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        Caption = ''
        object Label3: TUniLabel
          Left = 8
          Top = 20
          Width = 96
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Number of Releases'
          TabOrder = 1
        end
        object Label4: TUniLabel
          Left = 8
          Top = 44
          Width = 102
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Quantity per Release'
          TabOrder = 2
        end
        object Label1: TUniLabel
          Left = 8
          Top = 68
          Width = 50
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Start Date'
          TabOrder = 3
        end
        object Label2: TUniLabel
          Left = 8
          Top = 89
          Width = 83
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Interval (in days)'
          TabOrder = 4
        end
      end
    end
  end
  object Panel2: TUniPanel
    Tag = 1999
    Left = 0
    Top = 189
    Width = 592
    Height = 43
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 590
      Height = 2
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object Panel3: TUniPanel
      Tag = 1999
      Left = 207
      Top = 3
      Width = 384
      Height = 39
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnAppend: TUniButton
        Left = 0
        Top = 8
        Width = 119
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Append'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object brnOverwrite: TUniButton
        Left = 128
        Top = 8
        Width = 119
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Overwrite'
        TabOrder = 2
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 256
        Top = 8
        Width = 119
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 3
      end
    end
  end
  object PnlBtm1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 160
    Width = 592
    Height = 29
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object chkAllItems: TUniCheckBox
      Left = 8
      Top = 8
      Width = 187
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Apply to all items on order'
      TabOrder = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'edtCount'
      'edtQty'
      'dtpStartDate'
      'edInterval'
      'btnedtInterval'
      'chkForecast'
      'chkAllItems'
      'chkBlanket'
      'btnAppend'
      'brnOverwrite')
    SecurityCode = 'FRMNEWRELEASESDIALOG'
    Left = 334
    Top = 64
  end
end

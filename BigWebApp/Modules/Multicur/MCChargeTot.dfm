inherited FrmMCChargeTotals: TFrmMCChargeTotals
  Left = 340
  Top = 217
  ClientHeight = 133
  ClientWidth = 307
  Caption = 'Multi-Currency'
  ExplicitWidth = 313
  ExplicitHeight = 182
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 307
    ExplicitWidth = 307
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 307
    Height = 106
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 123
      Top = 0
      Width = 6
      Height = 106
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 123
      Height = 104
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblAmount: TUniLabel
        Left = 8
        Top = 12
        Width = 89
        Height = 13
        Hint = 'Full transaction amount, including taxes'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Amount (with Tax)'
        TabOrder = 1
      end
      object lblTax: TUniLabel
        Left = 8
        Top = 36
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Tax'
        TabOrder = 2
      end
      object lblFreight: TUniLabel
        Left = 8
        Top = 60
        Width = 34
        Height = 13
        Hint = 'Shipping and Handling'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Freight'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 129
      Top = 1
      Width = 178
      Height = 104
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object edtAmount: TUniEdit
        Left = 1
        Top = 8
        Width = 129
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object edtFreight: TUniEdit
        Left = 1
        Top = 56
        Width = 129
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object edtTax: TUniEdit
        Left = 1
        Top = 32
        Width = 129
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 240
  end
  inherited tblCurrency: TFDTable
    Left = 196
    Top = 10
  end
end

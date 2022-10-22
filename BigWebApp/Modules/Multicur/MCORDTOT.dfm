inherited FrmMCOrdTotals: TFrmMCOrdTotals
  Left = 186
  Top = 235
  ClientHeight = 134
  ClientWidth = 283
  Caption = 'Order Totals'
  ExplicitWidth = 289
  ExplicitHeight = 182
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 283
    ExplicitWidth = 283
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 283
    Height = 107
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 81
      Top = 0
      Width = 6
      Height = 107
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 0
      Top = 0
      Width = 81
      Height = 107
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label2: TUniLabel
        Left = 8
        Top = 11
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'Total'
        TabOrder = 1
      end
      object Label3: TUniLabel
        Left = 8
        Top = 33
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Tax'
        TabOrder = 2
      end
      object Label4: TUniLabel
        Left = 8
        Top = 79
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'Grand Total'
        TabOrder = 3
      end
      object Label5: TUniLabel
        Left = 8
        Top = 56
        Width = 34
        Height = 13
        Hint = ''
        Caption = 'Freight'
        TabOrder = 4
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 84
      Top = 0
      Width = 199
      Height = 107
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object eTotal: TUniEdit
        Left = 0
        Top = 8
        Width = 77
        Height = 19
        Hint = ''
        Text = 'eTotal'
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eTax: TUniEdit
        Left = 0
        Top = 30
        Width = 77
        Height = 19
        Hint = ''
        Text = 'eTax'
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eGrand: TUniEdit
        Left = 0
        Top = 75
        Width = 77
        Height = 19
        Hint = ''
        Text = 'eGrand'
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eFreight: TUniEdit
        Left = 0
        Top = 52
        Width = 77
        Height = 19
        Hint = ''
        Text = 'eFreight'
        TabOrder = 3
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
end

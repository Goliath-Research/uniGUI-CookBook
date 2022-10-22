inherited FrmMCARTotals: TFrmMCARTotals
  Left = 242
  Top = 174
  ClientHeight = 140
  ClientWidth = 262
  Caption = 'Totals'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 262
    ExplicitWidth = 262
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 262
    Height = 113
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 81
      Top = 0
      Width = 6
      Height = 113
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
      Height = 113
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label2: TUniLabel
        Left = 8
        Top = 12
        Width = 40
        Height = 13
        Hint = ''
        Caption = 'Subtotal'
        TabOrder = 1
      end
      object Label3: TUniLabel
        Left = 8
        Top = 60
        Width = 37
        Height = 13
        Hint = ''
        Caption = 'Freight '
        TabOrder = 2
      end
      object Label4: TUniLabel
        Left = 8
        Top = 36
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Tax'
        TabOrder = 3
      end
      object Label5: TUniLabel
        Left = 8
        Top = 84
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'Total'
        TabOrder = 4
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 84
      Top = 0
      Width = 178
      Height = 113
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object eSubTotal: TUniEdit
        Left = 0
        Top = 8
        Width = 105
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eFreight: TUniEdit
        Left = 0
        Top = 56
        Width = 105
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eTax: TUniEdit
        Left = 0
        Top = 32
        Width = 105
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eTotal: TUniEdit
        Left = 0
        Top = 80
        Width = 105
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 3
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
end

inherited FrmMCPOTotals: TFrmMCPOTotals
  Left = 263
  Top = 197
  ClientHeight = 176
  ClientWidth = 331
  Caption = 'Totals'
  ExplicitWidth = 337
  ExplicitHeight = 225
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 331
    ExplicitWidth = 246
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 331
    Height = 149
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 246
    ExplicitHeight = 93
    object Splitter1: TUniSplitter
      Left = 97
      Top = 0
      Width = 6
      Height = 149
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 93
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 97
      Height = 147
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 91
      object Label2: TUniLabel
        Left = 8
        Top = 11
        Width = 40
        Height = 13
        Hint = ''
        Caption = 'Subtotal'
        TabOrder = 1
      end
      object Label3: TUniLabel
        Left = 8
        Top = 59
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'Grand Total'
        TabOrder = 2
      end
      object Label4: TUniLabel
        Left = 8
        Top = 35
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Tax'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 103
      Top = 1
      Width = 228
      Height = 147
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 143
      ExplicitHeight = 91
      object eSubTotal: TUniEdit
        Left = 1
        Top = 8
        Width = 77
        Height = 19
        Hint = ''
        Text = 'eSubTotal'
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eGrand: TUniEdit
        Left = 1
        Top = 56
        Width = 77
        Height = 19
        Hint = ''
        Text = 'eGrand'
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eTax: TUniEdit
        Left = 1
        Top = 32
        Width = 77
        Height = 19
        Hint = ''
        Text = 'eTax'
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
end

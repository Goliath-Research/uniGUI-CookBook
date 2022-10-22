inherited FrmMCOrdDetail: TFrmMCOrdDetail
  Left = 275
  Top = 189
  ClientHeight = 149
  ClientWidth = 251
  Caption = 'Foreign Currency Rates'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 251
    ExplicitWidth = 251
    inherited Label1: TUniLabel
      Left = 4
      ExplicitLeft = 4
    end
    inherited cbCurrency: TUniDBLookupComboBox
      Left = 54
      Width = 142
      ExplicitLeft = 54
      ExplicitWidth = 142
    end
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 251
    Height = 122
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 113
      Top = 0
      Width = 6
      Height = 122
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 0
      Top = 0
      Width = 113
      Height = 122
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label2: TUniLabel
        Left = 8
        Top = 12
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Unit Price'
        TabOrder = 1
      end
      object Label3: TUniLabel
        Left = 8
        Top = 36
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Total Price'
        TabOrder = 2
      end
      object Label4: TUniLabel
        Left = 8
        Top = 60
        Width = 69
        Height = 13
        Hint = ''
        Caption = 'Price per 1000'
        TabOrder = 3
      end
      object Label6: TUniLabel
        Left = 8
        Top = 84
        Width = 64
        Height = 13
        Hint = ''
        Caption = 'List Unit Price'
        TabOrder = 4
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 116
      Top = 0
      Width = 135
      Height = 122
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object eUnitPrice: TUniEdit
        Left = 0
        Top = 8
        Width = 113
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eTotalPrice: TUniEdit
        Left = 0
        Top = 32
        Width = 113
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object ePricePer1000: TUniEdit
        Left = 0
        Top = 56
        Width = 113
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eListUnitPrice: TUniEdit
        Left = 0
        Top = 80
        Width = 113
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

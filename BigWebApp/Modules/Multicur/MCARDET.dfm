inherited FrmMCARDetails: TFrmMCARDetails
  Left = 205
  Top = 208
  ClientHeight = 180
  ClientWidth = 256
  Caption = ''
  ExplicitWidth = 262
  ExplicitHeight = 229
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 256
    ExplicitWidth = 259
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 256
    Height = 153
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 259
    ExplicitHeight = 135
    object Splitter1: TUniSplitter
      Left = 114
      Top = 1
      Width = 6
      Height = 151
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 133
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 113
      Height = 151
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 133
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
        Top = 60
        Width = 60
        Height = 13
        Hint = ''
        Caption = 'Freight Price'
        TabOrder = 2
      end
      object Label4: TUniLabel
        Left = 8
        Top = 36
        Width = 69
        Height = 13
        Hint = ''
        Caption = 'Price per 1000'
        TabOrder = 3
      end
      object Label6: TUniLabel
        Left = 8
        Top = 108
        Width = 73
        Height = 13
        Hint = ''
        Caption = 'Total After Tax'
        TabOrder = 4
      end
      object Label5: TUniLabel
        Left = 8
        Top = 84
        Width = 80
        Height = 13
        Hint = ''
        Caption = 'Total Before Tax'
        TabOrder = 5
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 120
      Top = 1
      Width = 135
      Height = 151
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 138
      ExplicitHeight = 133
      object eUnitPrice: TUniEdit
        Left = 0
        Top = 8
        Width = 97
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eFreightPrice: TUniEdit
        Left = 0
        Top = 56
        Width = 97
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
        Top = 32
        Width = 97
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eTotalAfterTax: TUniEdit
        Left = 0
        Top = 104
        Width = 97
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 3
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eTotalBeforeTax: TUniEdit
        Left = 0
        Top = 80
        Width = 97
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 4
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
end

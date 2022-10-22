inherited FrmMCPODetails: TFrmMCPODetails
  Left = 125
  Top = 211
  ClientHeight = 203
  ClientWidth = 359
  Caption = 'Foreign Currency Rates'
  ExplicitWidth = 365
  ExplicitHeight = 252
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 359
    ExplicitWidth = 265
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 359
    Height = 176
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 265
    ExplicitHeight = 90
    object Splitter1: TUniSplitter
      Left = 81
      Top = 0
      Width = 6
      Height = 176
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 90
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 81
      Height = 174
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 88
      object Label2: TUniLabel
        Left = 8
        Top = 11
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Unit Price'
        TabOrder = 1
      end
      object Label4: TUniLabel
        Left = 8
        Top = 35
        Width = 51
        Height = 13
        Hint = ''
        Caption = 'Price/1000'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 8
        Top = 59
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'Total'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 87
      Top = 1
      Width = 272
      Height = 174
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 178
      ExplicitHeight = 88
      object eUnitPrice: TUniEdit
        Left = 1
        Top = 8
        Width = 77
        Height = 19
        Hint = ''
        Text = 'eUnitPrice'
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object ePricePer1000: TUniEdit
        Left = 1
        Top = 32
        Width = 77
        Height = 19
        Hint = ''
        Text = 'ePricePer1000'
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eTotal: TUniEdit
        Left = 1
        Top = 56
        Width = 77
        Height = 19
        Hint = ''
        Text = 'eTotal'
        TabOrder = 2
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
    end
  end
end

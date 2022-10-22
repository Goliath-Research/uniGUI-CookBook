inherited FrmMCOrdReleases: TFrmMCOrdReleases
  Left = 139
  Top = 220
  ClientHeight = 95
  ClientWidth = 282
  Caption = 'Release Unit Price'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 282
    ExplicitWidth = 282
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 282
    Height = 68
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 81
      Top = 0
      Width = 6
      Height = 68
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
      Height = 68
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label2: TUniLabel
        Left = 8
        Top = 11
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Unit Price'
        TabOrder = 1
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 84
      Top = 0
      Width = 198
      Height = 68
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object eUnitPrice: TUniEdit
        Left = 0
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
    end
  end
end

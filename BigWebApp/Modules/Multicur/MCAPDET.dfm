inherited FrmMCAPDetails: TFrmMCAPDetails
  ClientHeight = 116
  ClientWidth = 261
  Caption = 'Foreign Currency Rates'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 261
    ExplicitWidth = 261
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 261
    Height = 89
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 114
      Top = 1
      Width = 6
      Height = 87
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 113
      Height = 87
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label2: TUniLabel
        Left = 8
        Top = 36
        Width = 44
        Height = 13
        Hint = ''
        Caption = 'Unit Cost'
        TabOrder = 1
      end
      object Label4: TUniLabel
        Left = 8
        Top = 12
        Width = 37
        Height = 13
        Hint = ''
        Caption = 'Amount'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 8
        Top = 60
        Width = 69
        Height = 13
        Hint = ''
        Caption = 'Standard Cost'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 120
      Top = 1
      Width = 140
      Height = 87
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object eUnitPrice: TUniEdit
        Left = 0
        Top = 32
        Width = 113
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eAmount: TUniEdit
        Left = 0
        Top = 8
        Width = 113
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eStdCost: TUniEdit
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
    end
  end
end

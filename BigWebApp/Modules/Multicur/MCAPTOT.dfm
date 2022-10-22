inherited FrmMCAPTotals: TFrmMCAPTotals
  ClientHeight = 118
  ClientWidth = 235
  Caption = 'Totals'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TUniPanel
    Width = 235
    ExplicitWidth = 235
  end
  object PnlClient01: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 27
    Width = 235
    Height = 91
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 97
      Top = 0
      Width = 6
      Height = 91
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 0
      Top = 0
      Width = 97
      Height = 91
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label2: TUniLabel
        Left = 8
        Top = 12
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'Invoice Amount'
        TabOrder = 1
      end
      object Label3: TUniLabel
        Left = 8
        Top = 60
        Width = 37
        Height = 13
        Hint = ''
        Caption = 'Balance'
        TabOrder = 2
      end
      object Label4: TUniLabel
        Left = 8
        Top = 36
        Width = 52
        Height = 13
        Hint = ''
        Caption = 'Distributed'
        TabOrder = 3
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 100
      Top = 0
      Width = 135
      Height = 91
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object eInvAmount: TUniEdit
        Left = 0
        Top = 8
        Width = 77
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eBalance: TUniEdit
        Left = 0
        Top = 56
        Width = 77
        Height = 19
        Hint = ''
        Text = ''
        TabOrder = 1
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object eDistributed: TUniEdit
        Left = 0
        Top = 32
        Width = 77
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

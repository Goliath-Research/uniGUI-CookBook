inherited FrmShipManAccountUSPS: TFrmShipManAccountUSPS
  ClientHeight = 175
  ClientWidth = 326
  OldCreateOrder = True
  ExplicitWidth = 332
  ExplicitHeight = 204
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Width = 326
    Height = 134
    ExplicitWidth = 326
    ExplicitHeight = 134
    inherited Splitter1: TUniSplitter
      Height = 134
      ExplicitHeight = 134
    end
    inherited PnlLabels: TUniPanel
      Height = 132
      ExplicitHeight = 132
      object lblUserName: TUniLabel
        Left = 8
        Top = 12
        Width = 52
        Height = 13
        Hint = ''
        Caption = 'User Name'
        TabOrder = 1
      end
      object lblPassword: TUniLabel
        Left = 8
        Top = 36
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'Password'
        TabOrder = 2
      end
      object lblPostageBalance: TUniLabel
        Left = 8
        Top = 60
        Width = 79
        Height = 13
        Hint = ''
        Caption = 'Postage Balance'
        TabOrder = 3
      end
    end
    inherited PnlEditBoxes: TUniPanel
      Width = 207
      Height = 132
      ExplicitWidth = 207
      ExplicitHeight = 132
      object edtUserName: TUniEdit
        Left = 1
        Top = 8
        Width = 196
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edtPassword: TUniEdit
        Left = 1
        Top = 32
        Width = 196
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edtPostageBalance: TUniEdit
        Tag = 1
        Left = 1
        Top = 56
        Width = 196
        Height = 21
        Hint = 'Test hint'
        ShowHint = True
        ParentShowHint = False
        Alignment = taRightJustify
        Text = ''
        ParentFont = False
        Font.Color = clRed
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clBtnFace
        ReadOnly = True
      end
      object btnCheckBalance: TUniButton
        Left = 6
        Top = 83
        Width = 83
        Height = 25
        Hint = ''
        Caption = 'Check Balance'
        TabOrder = 4
        OnClick = btnCheckBalanceClick
      end
      object btnPurchasePostage: TUniButton
        Left = 95
        Top = 83
        Width = 106
        Height = 25
        Hint = ''
        Caption = 'Purchase Postage'
        TabOrder = 5
        OnClick = btnPurchasePostageClick
      end
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 134
    Width = 326
    ExplicitTop = 134
    ExplicitWidth = 326
    inherited PnlButtonsInner: TUniPanel
      Left = 115
      ExplicitLeft = 115
    end
  end
end

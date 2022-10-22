inherited FrmShipManAccountUPS: TFrmShipManAccountUPS
  Left = 312
  Top = 216
  ClientHeight = 123
  ClientWidth = 355
  OldCreateOrder = True
  ExplicitWidth = 361
  ExplicitHeight = 152
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Width = 355
    Height = 82
    ExplicitWidth = 355
    ExplicitHeight = 82
    inherited Splitter1: TUniSplitter
      Height = 82
      ExplicitHeight = 82
    end
    inherited PnlLabels: TUniPanel
      Height = 80
      ExplicitHeight = 80
      object Label2: TUniLabel
        Left = 8
        Top = 60
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'Password'
        TabOrder = 1
      end
      object lblAccountNumber: TUniLabel
        Left = 8
        Top = 12
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Account #'
        TabOrder = 2
      end
      object lblMyUPSID: TUniLabel
        Left = 8
        Top = 36
        Width = 47
        Height = 13
        Hint = ''
        Caption = 'MyUPS ID'
        TabOrder = 3
      end
    end
    inherited PnlEditBoxes: TUniPanel
      Width = 236
      Height = 80
      ExplicitWidth = 236
      ExplicitHeight = 80
      object edtAccount: TUniEdit
        Left = 1
        Top = 8
        Width = 224
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edtMyUPSID: TUniEdit
        Left = 1
        Top = 32
        Width = 224
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edtPassword: TUniEdit
        Left = 1
        Top = 56
        Width = 224
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 82
    Width = 355
    ExplicitTop = 82
    ExplicitWidth = 355
    inherited PnlButtonsInner: TUniPanel
      Left = 144
      ExplicitLeft = 144
      inherited btnCancel: TUniBitBtn
        Caption = '&Close'
      end
    end
  end
end

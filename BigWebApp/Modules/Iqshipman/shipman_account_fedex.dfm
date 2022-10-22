inherited FrmShipManAccountFedEx: TFrmShipManAccountFedEx
  ClientWidth = 283
  OldCreateOrder = True
  ExplicitWidth = 289
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Width = 283
    ExplicitWidth = 283
    inherited Splitter1: TUniSplitter
      Left = 89
      ExplicitLeft = 89
    end
    inherited PnlLabels: TUniPanel
      Width = 89
      ExplicitWidth = 89
      object lblAccountNumber: TUniLabel
        Left = 8
        Top = 12
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Account #'
        TabOrder = 1
      end
      object lblMeterNumber: TUniLabel
        Left = 8
        Top = 36
        Width = 39
        Height = 13
        Hint = ''
        Caption = 'Meter #'
        TabOrder = 2
      end
    end
    inherited PnlEditBoxes: TUniPanel
      Left = 95
      Width = 188
      ExplicitLeft = 95
      ExplicitWidth = 188
      object edtAccountNumber: TUniEdit
        Left = 1
        Top = 8
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
      end
      object edtMeterNumber: TUniEdit
        Left = 1
        Top = 32
        Width = 121
        Height = 21
        Hint = ''
        Enabled = False
        Text = ''
        TabOrder = 1
        Color = clBtnFace
      end
    end
  end
  inherited PnlButtons: TUniPanel
    Width = 283
    ExplicitWidth = 283
    inherited PnlButtonsInner: TUniPanel
      Left = 72
      ExplicitLeft = 72
    end
  end
end

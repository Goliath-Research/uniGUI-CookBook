inherited FrmShipManAccountFedExSmartPost: TFrmShipManAccountFedExSmartPost
  ClientHeight = 121
  ExplicitHeight = 150
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Height = 80
    ExplicitHeight = 80
    inherited Splitter1: TUniSplitter
      Height = 80
      ExplicitHeight = 80
    end
    inherited PnlLabels: TUniPanel
      Height = 78
      ExplicitHeight = 78
      object Label1: TUniLabel
        Left = 8
        Top = 60
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Hub ID'
        TabOrder = 3
      end
    end
    inherited PnlEditBoxes: TUniPanel
      Height = 78
      ExplicitHeight = 78
      object edtHubID: TUniEdit
        Left = 1
        Top = 56
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
      end
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 80
    ExplicitTop = 80
  end
end

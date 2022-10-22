inherited FrmVoidCD: TFrmVoidCD
  Caption = 'Void CD'
  ExplicitWidth = 658
  ExplicitHeight = 230
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 173
    Height = 41
    ExplicitTop = 155
    ExplicitHeight = 41
    inherited Panel2: TUniPanel
      Height = 39
      ExplicitHeight = 41
      inherited BtnOk: TUniButton
        Left = 1
        Top = 8
        ExplicitLeft = 0
        ExplicitTop = 8
      end
      inherited BtnCancel: TUniButton
        Left = 104
        Top = 8
        ExplicitLeft = 104
        ExplicitTop = 8
      end
    end
  end
  inherited PnlCarrier: TUniPanel
    Height = 173
    ExplicitHeight = 155
    inherited Splitter1: TUniSplitter
      Height = 173
      ExplicitHeight = 155
    end
    inherited PnlLeft: TUniPanel
      Height = 171
      ExplicitHeight = 155
    end
    inherited PnlClient: TUniPanel
      Height = 171
      ExplicitHeight = 155
    end
  end
end

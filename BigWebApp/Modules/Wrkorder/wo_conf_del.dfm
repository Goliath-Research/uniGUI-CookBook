inherited FrmWOConfDel: TFrmWOConfDel
  ClientHeight = 121
  ClientWidth = 334
  ExplicitWidth = 340
  ExplicitHeight = 150
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Width = 334
    Height = 84
    ExplicitWidth = 334
    ExplicitHeight = 84
    inherited GroupBox1: TUniGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 326
      Height = 76
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitWidth = 326
      ExplicitHeight = 76
      inherited rbDelete: TUniRadioButton
        Left = 12
        Top = 21
        ExplicitLeft = 12
        ExplicitTop = 21
      end
      inherited rbArcDel: TUniRadioButton
        Left = 12
        Top = 43
        ExplicitLeft = 12
        ExplicitTop = 43
      end
    end
  end
  inherited Panel2: TUniPanel
    Top = 84
    Width = 334
    Height = 37
    ExplicitTop = 84
    ExplicitWidth = 334
    ExplicitHeight = 37
    inherited Panel3: TUniPanel
      Left = 118
      Width = 215
      Height = 35
      ExplicitLeft = 118
      ExplicitWidth = 215
      ExplicitHeight = 35
      inherited Button1: TUniButton
        Top = 3
        ExplicitTop = 3
      end
      inherited Button2: TUniButton
        Left = 112
        Top = 3
        ExplicitLeft = 112
        ExplicitTop = 3
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmWOConfDel')
    SecurityCode = 'FRMWOCONFDEL'
  end
end

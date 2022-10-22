inherited FrmWOConfDelSched: TFrmWOConfDelSched
  ClientHeight = 142
  ExplicitWidth = 320
  ExplicitHeight = 170
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Height = 105
    ExplicitHeight = 105
    inherited GroupBox1: TUniGroupBox
      Height = 93
      ExplicitHeight = 93
      inherited rbDelete: TUniRadioButton
        Top = 42
        ExplicitTop = 42
      end
      inherited rbArcDel: TUniRadioButton
        Top = 65
        ExplicitTop = 65
      end
      object rbReturnToPool: TUniRadioButton
        Left = 12
        Top = 20
        Width = 153
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Return To Scheduling Pool'
        TabOrder = 2
      end
    end
  end
  inherited Panel2: TUniPanel
    Top = 105
    ExplicitTop = 105
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'Button1'
      'Button2'
      'rbDelete'
      'rbArcDel'
      'rbReturnToPool')
    SecurityCode = 'FRMWOCONFDELSCHED'
    Left = 8
    Top = 104
  end
end

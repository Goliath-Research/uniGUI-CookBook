inherited FrmConfForecastRelease: TFrmConfForecastRelease
  ClientHeight = 147
  ClientWidth = 372
  Caption = 'Confirm Forecast Release'
  OldCreateOrder = True
  ExplicitWidth = 388
  ExplicitHeight = 186
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 372
    Height = 109
    ExplicitWidth = 372
    ExplicitHeight = 109
    object Label1: TUniLabel
      Left = 13
      Top = 8
      Width = 357
      Height = 103
      Hint = ''
      AutoSize = False
      Caption = 'Label1'
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
    end
  end
  inherited Panel2: TUniPanel
    Top = 109
    Width = 372
    ExplicitTop = 109
    ExplicitWidth = 372
    inherited Bevel1: TUniPanel
      Width = 370
      ExplicitWidth = 370
    end
    object Panel3: TUniPanel
      Tag = 1999
      Left = 156
      Top = 5
      Width = 216
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object btnOK: TUniButton
        Tag = 1
        Left = 8
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmConfForecastRelease')
    SecurityItems.Strings = (
      'btnOK'
      'CheckBox')
  end
end

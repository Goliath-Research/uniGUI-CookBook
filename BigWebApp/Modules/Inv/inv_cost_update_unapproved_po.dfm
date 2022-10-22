inherited FrmCostUpdateUnapprovedPO: TFrmCostUpdateUnapprovedPO
  Caption = 'Warning'
  ClientHeight = 158
  ClientWidth = 487
  ExplicitWidth = 503
  ExplicitHeight = 196
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 487
    Height = 120
    ExplicitWidth = 487
    ExplicitHeight = 120
  end
  inherited Panel2: TUniPanel
    Top = 120
    Width = 487
    ExplicitTop = 120
    ExplicitWidth = 487
    inherited Bevel1: TUniPanel
      Width = 487
      ExplicitWidth = 487
    end
    object Panel3: TUniPanel
      Left = 170
      Top = 5
      Width = 317
      Height = 33
      Align = alRight
      TabOrder = 1
      ExplicitLeft = 199
      object BtnYes: TUniButton
        Tag = 1
        Left = 2
        Top = 4
        Width = 97
        Height = 25
        Caption = '&Yes'
        OnClick = BtnYesClick
      end
      object BtnNo: TUniButton
        Left = 106
        Top = 4
        Width = 97
        Height = 25
        Caption = '&No'
        OnClick = BtnYesClick
      end
      object btnCancel: TUniButton
        Tag = 2
        Left = 210
        Top = 4
        Width = 97
        Height = 25
        Caption = 'Cancel'
        OnClick = BtnYesClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'BtnYes'
      'BtnNo'
      'CheckBox')
    SecurityCode = 'FRMCOSTUPDATEUNAPPROVEDPO'
    Left = 33
    Top = 83
  end
end

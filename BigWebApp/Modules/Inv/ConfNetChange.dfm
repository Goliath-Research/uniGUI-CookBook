inherited FrmConfNetChange: TFrmConfNetChange
  BorderStyle = bsDialog
  ClientHeight = 178
  ClientWidth = 481
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 481
    Height = 140
    ExplicitWidth = 481
    ExplicitHeight = 140
  end
  inherited Panel2: TUniPanel
    Top = 140
    Width = 481
    ExplicitTop = 140
    ExplicitWidth = 481
    inherited Bevel1: TUniPanel
      Width = 481
      ExplicitWidth = 481
    end
    object Panel3: TUniPanel
      Left = 268
      Top = 5
      Width = 213
      Height = 33
      Align = alRight
      TabOrder = 1
      DesignSize = (
        213
        33)
      object BtnYes: TUniButton
        Tag = 1
        Left = 7
        Top = 3
        Width = 97
        Height = 25
        Anchors = [akLeft, akTop, akBottom]
        Caption = '&Yes'
        OnClick = BtnYesClick
      end
      object BtnNo: TUniButton
        Left = 111
        Top = 3
        Width = 97
        Height = 25
        Anchors = [akLeft, akTop, akBottom]
        Caption = '&No'
        OnClick = BtnYesClick
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMCONFNETCHANGE')
    SecurityItems.Strings = (
      'BtnNo'
      'btnYes'
      'CheckBox')
    SecurityCode = 'FRMCONFNETCHANGE'
  end
end

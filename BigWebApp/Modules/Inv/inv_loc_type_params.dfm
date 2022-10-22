object FrmInvLocTypeParams: TFrmInvLocTypeParams
  Left = 0
  Top = 0
  ClientHeight = 131
  ClientWidth = 441
  Caption = 'Location Type Parameters'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbchlVerifyLocationCheckDigit: TUniDBCheckBox
    Left = 24
    Top = 16
    Width = 189
    Height = 17
    Hint = ''
    DataField = 'VERIFY_LOCATION_CHECK_DIGIT'
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
    Caption = 'WMS '#8211' Verify Location Check Digit'
    TabOrder = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 90
    Width = 441
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 220
      Top = 1
      Width = 221
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMINVLOCTYPEPARAMS'
    Left = 364
    Top = 28
  end
end

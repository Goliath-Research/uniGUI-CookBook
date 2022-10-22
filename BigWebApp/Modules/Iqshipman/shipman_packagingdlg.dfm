object FrmIQShipManPackagingDlg: TFrmIQShipManPackagingDlg
  Left = 315
  Top = 327
  ClientHeight = 137
  ClientWidth = 281
  Caption = 'Packaging'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 96
    Width = 281
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Left = 75
      Top = 1
      Width = 206
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
      end
      object btnCancel: TUniBitBtn
        Left = 102
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 281
    Height = 96
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object lblPromptText: TUniLabel
      Left = 8
      Top = 8
      Width = 80
      Height = 13
      Hint = ''
      Caption = 'Select packaging'
      TabOrder = 1
    end
    object cmbPackaging: TUniComboBox
      Left = 40
      Top = 32
      Width = 225
      Height = 21
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 2
    end
  end
end

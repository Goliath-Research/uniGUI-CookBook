object FrmShipManCarrierTypeDlg: TFrmShipManCarrierTypeDlg
  Left = 339
  Top = 270
  ClientHeight = 142
  ClientWidth = 330
  Caption = 'Select Carrier Type'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 330
    Height = 101
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 100
      Top = 0
      Width = 6
      Height = 101
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLabels: TUniPanel
      Left = 1
      Top = 1
      Width = 100
      Height = 99
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblAccount1: TUniLabel
        Left = 8
        Top = 12
        Width = 60
        Height = 13
        Hint = ''
        Caption = 'Carrier Type'
        TabOrder = 1
      end
    end
    object PnlEditBoxes: TUniPanel
      Left = 106
      Top = 1
      Width = 224
      Height = 99
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object cmbCarrierType: TUniComboBox
        Left = 1
        Top = 8
        Width = 145
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'UPS'
          'FedEx Ground'
          'FedEx Express'
          'USPS'
          'FedEx SmartPost')
        TabOrder = 1
      end
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 101
    Width = 330
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Left = 119
      Top = 1
      Width = 211
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
        Left = 104
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
end

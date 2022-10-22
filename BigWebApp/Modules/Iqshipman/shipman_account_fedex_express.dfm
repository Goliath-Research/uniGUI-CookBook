inherited FrmShipManAccountFedExExpress: TFrmShipManAccountFedExExpress
  ClientHeight = 391
  ClientWidth = 328
  OldCreateOrder = True
  ExplicitWidth = 334
  ExplicitHeight = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlMain: TUniPanel
    Width = 328
    Height = 350
    ExplicitWidth = 328
    ExplicitHeight = 350
    inherited Splitter1: TUniSplitter
      Left = 105
      Width = 1
      Height = 350
      ExplicitLeft = 105
      ExplicitWidth = 1
      ExplicitHeight = 350
    end
    inherited PnlLabels: TUniPanel
      Width = 105
      Height = 348
      ExplicitWidth = 105
      ExplicitHeight = 348
      object lblAccountNumber: TUniLabel
        Left = 8
        Top = 12
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Account #'
        TabOrder = 1
      end
      object lblMeterNumber: TUniLabel
        Left = 8
        Top = 36
        Width = 39
        Height = 13
        Hint = ''
        Caption = 'Meter #'
        TabOrder = 2
      end
      object lblFreightAccountNumber: TUniLabel
        Left = 8
        Top = 84
        Width = 87
        Height = 13
        Hint = ''
        Caption = 'Freight Account #'
        TabOrder = 3
      end
      object lblContact: TUniLabel
        Left = 8
        Top = 108
        Width = 38
        Height = 13
        Hint = ''
        Caption = 'Contact'
        TabOrder = 4
      end
      object lblPhone: TUniLabel
        Left = 8
        Top = 132
        Width = 41
        Height = 13
        Hint = ''
        Caption = 'Phone #'
        TabOrder = 5
      end
      object lblZip: TUniLabel
        Left = 8
        Top = 300
        Width = 57
        Height = 13
        Hint = ''
        Caption = 'Postal Code'
        TabOrder = 6
      end
      object lblAddr2: TUniLabel
        Left = 8
        Top = 204
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Address 2'
        TabOrder = 7
      end
      object lblCountry: TUniLabel
        Left = 8
        Top = 252
        Width = 39
        Height = 13
        Hint = ''
        Caption = 'Country'
        TabOrder = 8
      end
      object lblCompany: TUniLabel
        Left = 8
        Top = 156
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Company'
        TabOrder = 9
      end
      object lblCity: TUniLabel
        Left = 8
        Top = 228
        Width = 19
        Height = 13
        Hint = ''
        Caption = 'City'
        TabOrder = 10
      end
      object lblState: TUniLabel
        Left = 8
        Top = 276
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'State or Region'
        TabOrder = 11
      end
      object lblAddr1: TUniLabel
        Left = 8
        Top = 180
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Address 1'
        TabOrder = 12
      end
    end
    inherited PnlEditBoxes: TUniPanel
      Left = 106
      Width = 222
      Height = 348
      ExplicitLeft = 106
      ExplicitWidth = 222
      ExplicitHeight = 348
      object edtAccountNumber: TUniEdit
        Left = 1
        Top = 8
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
      end
      object edtMeterNumber: TUniEdit
        Left = 1
        Top = 32
        Width = 121
        Height = 21
        Hint = ''
        Enabled = False
        Text = ''
        TabOrder = 1
        Color = clBtnFace
      end
      object chkFreightEnabled: TUniCheckBox
        Left = 1
        Top = 56
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'Enable Freight'
        TabOrder = 2
        OnClick = chkFreightEnabledClick
      end
      object edtFreightAcctNum: TUniEdit
        Left = 1
        Top = 80
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object edtContact: TUniEdit
        Left = 1
        Top = 104
        Width = 209
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 4
      end
      object edtPhone: TUniEdit
        Left = 1
        Top = 128
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 5
      end
      object edtCompany: TUniEdit
        Left = 1
        Top = 152
        Width = 209
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 6
      end
      object edtAddr1: TUniEdit
        Left = 1
        Top = 176
        Width = 209
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 7
      end
      object edtAddr2: TUniEdit
        Left = 1
        Top = 200
        Width = 209
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 8
      end
      object edtCity: TUniEdit
        Left = 1
        Top = 224
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 9
      end
      object edtZip: TUniEdit
        Left = 1
        Top = 296
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 10
      end
      object cmbCountry: TUniComboBox
        Left = 1
        Top = 248
        Width = 209
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 12
        OnChange = cmbCountryChange
      end
      object cmbState: TUniComboBox
        Left = 1
        Top = 272
        Width = 209
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 13
      end
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 350
    Width = 328
    ExplicitTop = 350
    ExplicitWidth = 328
    inherited PnlButtonsInner: TUniPanel
      Left = 117
      ExplicitLeft = 117
    end
  end
end

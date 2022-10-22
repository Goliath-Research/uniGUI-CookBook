inherited FrmIQSysMerchantPayPal: TFrmIQSysMerchantPayPal
  Left = 288
  Top = 214
  ClientHeight = 265
  ClientWidth = 522
  Caption = 'PayPal Seller Account'
  OldCreateOrder = True
  ExplicitWidth = 538
  ExplicitHeight = 324
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBottom: TUniPanel
    Top = 230
    Width = 522
    ExplicitTop = 230
    ExplicitWidth = 522
    inherited PnlButtons: TUniPanel
      Left = 310
      ExplicitLeft = 310
    end
  end
  object PnlCtrlsCarrier: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 0
    Width = 522
    Height = 230
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 119
      Top = 1
      Width = 6
      Height = 228
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlCtrlsLeft: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 118
      Height = 228
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblAccountNumber: TUniLabel
        Left = 8
        Top = 11
        Width = 55
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Login Name'
        TabOrder = 1
      end
      object lblPassword: TUniLabel
        Left = 8
        Top = 35
        Width = 46
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Password'
        TabOrder = 2
      end
      object lblSignature: TUniLabel
        Left = 8
        Top = 59
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'Signature'
        TabOrder = 3
      end
      object Label91: TUniLabel
        Left = 8
        Top = 131
        Width = 74
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Charge Method'
        TabOrder = 4
      end
      object lblAccountType: TUniLabel
        Left = 8
        Top = 83
        Width = 66
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Account Type'
        TabOrder = 5
      end
      object lblCurrencyCode: TUniLabel
        Left = 8
        Top = 108
        Width = 72
        Height = 13
        Hint = ''
        Caption = 'Currency Code'
        TabOrder = 6
      end
    end
    object PnlCtrlsClient: TUniPanel
      Tag = 1999
      Left = 125
      Top = 1
      Width = 396
      Height = 228
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        396
        228)
      object edtLoginName: TUniEdit
        Left = 0
        Top = 8
        Width = 387
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object edtPassword: TUniEdit
        Left = 0
        Top = 32
        Width = 387
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object edtSignature: TUniEdit
        Left = 0
        Top = 56
        Width = 387
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object cmbChargeMethod: TUniComboBox
        Left = 0
        Top = 128
        Width = 230
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Authorize and Settle separately'
          'Settle immediately')
        TabOrder = 4
      end
      object chkChangeSettlement: TUniCheckBox
        Left = 0
        Top = 152
        Width = 393
        Height = 17
        Hint = ''
        Caption = 'Allow Manually Changing Settlement Amount'
        TabOrder = 5
        OnClick = chkChangeSettlementClick
      end
      object chkAutoAdjustSettlement: TUniCheckBox
        Left = 0
        Top = 168
        Width = 393
        Height = 17
        Hint = ''
        Caption = 'Automatically Adjust Amounts During Settlement Based on Invoice'
        TabOrder = 7
        OnClick = chkAutoAdjustSettlementClick
      end
      object cmbAccountType: TUniComboBox
        Left = 0
        Top = 80
        Width = 230
        Height = 21
        Hint = ''
        Enabled = False
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Premier'
          'Business')
        TabOrder = 6
        Color = clBtnFace
      end
      object cmbCurrency: TUniComboBox
        Left = 0
        Top = 104
        Width = 230
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'USD - US Dollars'
          'CAD - Canadian Dollars'
          'EUR - Euros'
          'GBP - British Pounds'
          'JPY - Japanese Yen'
          'AUD - Australian Dollars')
        TabOrder = 9
      end
      object chkTestAccount: TUniCheckBox
        Left = 0
        Top = 184
        Width = 393
        Height = 17
        Hint = ''
        Caption = 'Test Account'
        TabOrder = 8
      end
    end
  end
  inherited PkCurrencyCode: TIQWebHpick
    Top = 200
  end
  inherited PkCountryCode: TIQWebHpick
    Top = 200
  end
  inherited PkCurrencyISO: TIQWebHpick
    Top = 200
  end
end

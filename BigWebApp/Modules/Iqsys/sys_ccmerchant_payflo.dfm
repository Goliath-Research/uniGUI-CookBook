inherited FrmIQSysMerchantPayFlo: TFrmIQSysMerchantPayFlo
  Left = 352
  Top = 303
  ClientHeight = 307
  ClientWidth = 548
  Caption = 'PayFlo Pro Merchant Account'
  OldCreateOrder = True
  ExplicitWidth = 564
  ExplicitHeight = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBottom: TUniPanel
    Top = 272
    Width = 548
    ExplicitTop = 272
    ExplicitWidth = 548
    inherited PnlButtons: TUniPanel
      Left = 336
      ExplicitLeft = 336
    end
  end
  object PnlCtrlsCarrier: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 0
    Width = 548
    Height = 272
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 130
      Top = 1
      Width = 6
      Height = 270
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlCtrlsLeft: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 129
      Height = 270
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblUserName: TUniLabel
        Left = 8
        Top = 12
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
        Top = 36
        Width = 46
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Password'
        TabOrder = 2
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
        TabOrder = 3
      end
      object lblProcessingClass: TUniLabel
        Left = 8
        Top = 154
        Width = 79
        Height = 13
        Hint = ''
        Caption = 'Processing Class'
        TabOrder = 4
      end
      object lblCurrencyCode: TUniLabel
        Left = 8
        Top = 107
        Width = 72
        Height = 13
        Hint = ''
        Caption = 'Currency Code'
        TabOrder = 5
      end
      object lblPartner: TUniLabel
        Left = 8
        Top = 59
        Width = 50
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Partner ID'
        TabOrder = 6
      end
      object lblVendor: TUniLabel
        Left = 8
        Top = 83
        Width = 34
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Vendor'
        TabOrder = 7
      end
    end
    object PnlCtrlsClient: TUniPanel
      Tag = 1999
      Left = 136
      Top = 1
      Width = 411
      Height = 270
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object edtUserName: TUniEdit
        Left = 0
        Top = 8
        Width = 193
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
      end
      object edtPassword: TUniEdit
        Left = 0
        Top = 32
        Width = 193
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
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
        TabOrder = 5
      end
      object cmbProcessingClass: TUniComboBox
        Left = 0
        Top = 152
        Width = 230
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Standard'
          'Level 2'
          'Level 3')
        TabOrder = 6
      end
      object chkTestAccount: TUniCheckBox
        Left = 0
        Top = 208
        Width = 361
        Height = 17
        Hint = ''
        Caption = 'Test Account'
        TabOrder = 9
      end
      object chkChangeSettlement: TUniCheckBox
        Left = 0
        Top = 176
        Width = 408
        Height = 17
        Hint = ''
        Caption = 'Allow Manually Changing Settlement Amount'
        TabOrder = 7
        OnClick = chkChangeSettlementClick
      end
      object chkAutoAdjustSettlement: TUniCheckBox
        Left = 0
        Top = 192
        Width = 408
        Height = 17
        Hint = ''
        Caption = 'Automatically Adjust Amounts During Settlement Based on Invoice'
        TabOrder = 8
        OnClick = chkAutoAdjustSettlementClick
      end
      object cmbCurrency: TUniComboBox
        Left = 0
        Top = 104
        Width = 230
        Height = 21
        Hint = ''
        Enabled = False
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'USD - US Dollars'
          'CAD - Canadian Dollars'
          'EUR - Euros'
          'GBP - British Pounds'
          'JPY - Japanese Yen'
          'AUD - Australian Dollars')
        TabOrder = 11
      end
      object edtPartner: TUniEdit
        Left = 0
        Top = 56
        Width = 193
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object edtVendor: TUniEdit
        Left = 0
        Top = 80
        Width = 193
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object chkAllowNonReferencedCredits: TUniCheckBox
        Left = 0
        Top = 224
        Width = 408
        Height = 17
        Hint = ''
        Caption = 'Non-referenced credits allowed'
        TabOrder = 10
      end
    end
  end
  inherited PkCurrencyCode: TIQWebHpick
    Left = 216
    Top = 48
  end
  inherited PkCountryCode: TIQWebHpick
    Left = 384
    Top = 48
  end
  inherited MainMenu1: TUniMainMenu
    Left = 506
    Top = 40
  end
  inherited PkCurrencyISO: TIQWebHpick
    Left = 288
    Top = 48
  end
end

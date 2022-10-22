inherited FrmIQSysMerchantSterling: TFrmIQSysMerchantSterling
  ClientHeight = 284
  Caption = 'Sterling Merchant Account'
  ExplicitHeight = 343
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBottom: TUniPanel
    Top = 249
    ExplicitTop = 249
  end
  object PnlCtrlsCarrier: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 0
    Width = 541
    Height = 249
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 114
      Top = 1
      Width = 6
      Height = 247
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlCtrlsLeft: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 113
      Height = 247
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblLoginName: TUniLabel
        Left = 8
        Top = 11
        Width = 40
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Store ID'
        TabOrder = 1
      end
      object lblPassword: TUniLabel
        Left = 8
        Top = 35
        Width = 59
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Merchant ID'
        TabOrder = 2
      end
      object Label91: TUniLabel
        Left = 8
        Top = 107
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
        Top = 171
        Width = 79
        Height = 13
        Hint = ''
        Caption = 'Processing Class'
        TabOrder = 4
      end
      object lblCurrencyCode: TUniLabel
        Left = 8
        Top = 195
        Width = 72
        Height = 13
        Hint = ''
        Caption = 'Currency Code'
        TabOrder = 5
      end
      object lblSecurityCode: TUniLabel
        Left = 8
        Top = 83
        Width = 67
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Security Code'
        TabOrder = 6
      end
      object lblTerminalID: TUniLabel
        Left = 8
        Top = 59
        Width = 54
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Terminal ID'
        TabOrder = 7
      end
    end
    object PnlCtrlsClient: TUniPanel
      Tag = 1999
      Left = 120
      Top = 1
      Width = 420
      Height = 247
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object edtStoreID: TUniEdit
        Left = 0
        Top = 8
        Width = 193
        Height = 21
        Hint = ''
        MaxLength = 7
        Text = ''
        TabOrder = 0
      end
      object edtMerchantID: TUniEdit
        Left = 0
        Top = 32
        Width = 193
        Height = 21
        Hint = ''
        MaxLength = 12
        Text = ''
        TabOrder = 1
      end
      object cmbChargeMethod: TUniComboBox
        Left = 0
        Top = 104
        Width = 193
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Authorize and Settle separately'
          'Settle immediately')
        TabOrder = 7
      end
      object chkChangeSettlement: TUniCheckBox
        Left = 0
        Top = 128
        Width = 417
        Height = 17
        Hint = ''
        Caption = 'Allow Manually Changing Settlement Amount'
        TabOrder = 5
      end
      object chkAutoAdjustSettlement: TUniCheckBox
        Left = 0
        Top = 144
        Width = 417
        Height = 17
        Hint = ''
        Caption = 'Automatically Adjust Amounts During Settlement Based on Invoice'
        TabOrder = 6
      end
      object cmbProcessingClass: TUniComboBox
        Left = 0
        Top = 168
        Width = 193
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Standard'
          'Level 2'
          'Level 3')
        TabOrder = 8
      end
      object chkTestAccount: TUniCheckBox
        Left = 0
        Top = 216
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'Test Account'
        TabOrder = 9
      end
      object cmbCurrency: TUniComboBox
        Left = 0
        Top = 192
        Width = 193
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'CAD - Canadian Dollars'
          'USD - US Dollars')
        TabOrder = 10
      end
      object edtSecurityCode: TUniEdit
        Left = 0
        Top = 80
        Width = 193
        Height = 21
        Hint = ''
        MaxLength = 20
        Text = ''
        TabOrder = 3
      end
      object edtTerminalID: TUniEdit
        Left = 0
        Top = 56
        Width = 193
        Height = 21
        Hint = ''
        MaxLength = 3
        Text = ''
        TabOrder = 2
      end
    end
  end
  inherited MainMenu1: TUniMainMenu
    Left = 330
    Top = 184
  end
end

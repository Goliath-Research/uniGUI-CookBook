inherited FrmIQSysMerchantMerchantAccountsCa: TFrmIQSysMerchantMerchantAccountsCa
  ClientHeight = 268
  ClientWidth = 580
  Caption = 'Merchant-Accounts.Ca Merchant Account'
  ExplicitWidth = 596
  ExplicitHeight = 327
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBottom: TUniPanel
    Top = 233
    Width = 580
    ExplicitTop = 210
    ExplicitWidth = 580
    inherited PnlButtons: TUniPanel
      Left = 368
      ExplicitLeft = 368
    end
  end
  object PnlCtrlsCarrier: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 0
    Width = 580
    Height = 233
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitHeight = 210
    object Splitter1: TUniSplitter
      Left = 114
      Top = 1
      Width = 6
      Height = 231
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 208
    end
    object PnlCtrlsLeft: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 113
      Height = 231
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 208
      object lblLoginName: TUniLabel
        Left = 8
        Top = 12
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
        Top = 36
        Width = 58
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Pass Phrase'
        TabOrder = 2
      end
      object Label91: TUniLabel
        Left = 8
        Top = 59
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
        Top = 123
        Width = 79
        Height = 13
        Hint = ''
        Caption = 'Processing Class'
        TabOrder = 4
      end
      object lblCurrencyCode: TUniLabel
        Left = 8
        Top = 147
        Width = 72
        Height = 13
        Hint = ''
        Caption = 'Currency Code'
        TabOrder = 5
      end
    end
    object PnlCtrlsClient: TUniPanel
      Tag = 1999
      Left = 120
      Top = 1
      Width = 459
      Height = 231
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitHeight = 208
      object edtLoginName: TUniEdit
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
        Top = 56
        Width = 193
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Authorize and Settle separately'
          'Settle immediately')
        TabOrder = 5
      end
      object chkChangeSettlement: TUniCheckBox
        Left = 0
        Top = 80
        Width = 441
        Height = 17
        Hint = ''
        Caption = 'Allow Manually Changing Settlement Amount'
        TabOrder = 3
        OnClick = chkChangeSettlementClick
      end
      object chkAutoAdjustSettlement: TUniCheckBox
        Left = 0
        Top = 96
        Width = 449
        Height = 17
        Hint = ''
        Caption = 'Automatically Adjust Amounts During Settlement Based on Invoice'
        TabOrder = 4
        OnClick = chkAutoAdjustSettlementClick
      end
      object cmbProcessingClass: TUniComboBox
        Left = 0
        Top = 120
        Width = 193
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Standard'
          'Level 2')
        TabOrder = 7
      end
      object chkTestAccount: TUniCheckBox
        Left = 0
        Top = 168
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'Test Account'
        TabOrder = 6
      end
      object cmbCurrency: TUniComboBox
        Left = 0
        Top = 144
        Width = 193
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'CAD - Canadian Dollars'
          'USD - US Dollars')
        TabOrder = 8
      end
    end
  end
end

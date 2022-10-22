inherited FrmIQSysMerchantMES: TFrmIQSysMerchantMES
  Left = 281
  Top = 128
  ClientHeight = 321
  ClientWidth = 473
  Caption = 'Merchant e-Solutions Account'
  OldCreateOrder = True
  ExplicitWidth = 489
  ExplicitHeight = 380
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBottom: TUniPanel
    Top = 286
    Width = 473
    ExplicitTop = 286
    ExplicitWidth = 473
    inherited PnlButtons: TUniPanel
      Left = 261
      ExplicitLeft = 261
    end
  end
  object ScrollBox1: TUniScrollBox [1]
    Left = 0
    Top = 0
    Width = 473
    Height = 286
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ScrollHeight = 248
    object PnlCaption_General: TUniPanel
      Tag = 1999
      Left = 0
      Top = 0
      Width = 471
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
      DesignSize = (
        471
        27)
      object lblMerchantPrompt: TUniLabel
        Left = 8
        Top = 8
        Width = 44
        Height = 13
        Hint = ''
        Caption = 'General'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object Bevel1: TUniPanel
        Left = 2
        Top = 24
        Width = 473
        Height = 3
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
      end
    end
    object PnlMerchant: TUniPanel
      Tag = 1999
      Left = 0
      Top = 27
      Width = 471
      Height = 131
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Splitter2: TUniSplitter
        Left = 169
        Top = 1
        Width = 6
        Height = 129
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlMerchantLeft: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 168
        Height = 129
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object Label89: TUniLabel
          Left = 8
          Top = 11
          Width = 75
          Height = 13
          Hint = 'Merchant name as it appears on the customer receipt (optional)'
          ShowHint = True
          ParentShowHint = False
          Caption = 'Merchant Name'
          TabOrder = 1
        end
        object Label87: TUniLabel
          Left = 8
          Top = 35
          Width = 44
          Height = 13
          Hint = 'Unique identifier provided by the merchant'#39's bank or processor'
          ShowHint = True
          ParentShowHint = False
          Caption = 'Profile ID'
          TabOrder = 2
        end
        object Label90: TUniLabel
          Left = 8
          Top = 59
          Width = 51
          Height = 13
          Hint = 
            'Bank identification number (BIN) assigned by your bank or proces' +
            'sor.'
          ShowHint = True
          ParentShowHint = False
          Caption = 'Profile Key'
          TabOrder = 3
        end
        object lblProcessingClass: TUniLabel
          Left = 8
          Top = 83
          Width = 79
          Height = 13
          Hint = ''
          Caption = 'Processing Class'
          TabOrder = 4
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
          TabOrder = 5
        end
      end
      object PnlMerchantClient: TUniPanel
        Tag = 1999
        Left = 175
        Top = 1
        Width = 295
        Height = 129
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        DesignSize = (
          295
          129)
        object edtMerchantName: TUniEdit
          Left = 0
          Top = 8
          Width = 290
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object edtProfileID: TUniEdit
          Left = 0
          Top = 32
          Width = 290
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object edtProfileKey: TUniEdit
          Left = 0
          Top = 56
          Width = 290
          Height = 21
          Hint = ''
          Text = ''
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object cmbProcessingClass: TUniComboBox
          Left = 0
          Top = 80
          Width = 200
          Height = 21
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'Standard'
            'Level 2'
            'Level 3')
          TabOrder = 4
          OnCloseUp = cmbProcessingClassCloseUp
        end
        object cmbChargeMethod: TUniComboBox
          Left = 0
          Top = 104
          Width = 200
          Height = 21
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'Authorize and Settle separately'
            'Settle immediately')
          TabOrder = 5
        end
      end
    end
    object PnlCaption_Options: TUniPanel
      Tag = 1999
      Left = 0
      Top = 158
      Width = 471
      Height = 27
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
      DesignSize = (
        471
        27)
      object Label7: TUniLabel
        Left = 8
        Top = 8
        Width = 103
        Height = 13
        Hint = ''
        Caption = 'Additional Options'
        ParentFont = False
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object Bevel4: TUniPanel
        Left = 2
        Top = 24
        Width = 473
        Height = 3
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Caption = ''
      end
    end
    object PnlOption: TUniPanel
      Tag = 1999
      Left = 0
      Top = 185
      Width = 471
      Height = 63
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object chkChangeSettlement: TUniCheckBox
        Left = 8
        Top = 8
        Width = 460
        Height = 17
        Hint = ''
        Caption = 'Allow Manually Changing Settlement Amount'
        TabOrder = 0
        OnClick = chkChangeSettlementClick
      end
      object chkAutoAdjustSettlement: TUniCheckBox
        Left = 8
        Top = 24
        Width = 460
        Height = 17
        Hint = ''
        Caption = 'Automatically Adjust Amounts During Settlement Based on Invoice'
        TabOrder = 1
        OnClick = chkAutoAdjustSettlementClick
      end
      object chkTestAccount: TUniCheckBox
        Left = 8
        Top = 40
        Width = 265
        Height = 17
        Hint = ''
        Caption = 'Test Account'
        TabOrder = 2
      end
    end
  end
  inherited PkCurrencyCode: TIQWebHpick
    Left = 456
    Top = 496
  end
  inherited PkCountryCode: TIQWebHpick
    Left = 608
    Top = 496
  end
  inherited MainMenu1: TUniMainMenu
    Left = 498
    Top = 552
  end
  inherited PkCurrencyISO: TIQWebHpick
    Left = 528
    Top = 496
  end
end

inherited FrmIQSysMerchantFirstData: TFrmIQSysMerchantFirstData
  ClientHeight = 296
  ClientWidth = 523
  Caption = 'FirstData Merchant Account'
  ExplicitWidth = 539
  ExplicitHeight = 355
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBottom: TUniPanel
    Top = 261
    Width = 523
    ExplicitTop = 250
    ExplicitWidth = 523
    inherited PnlButtons: TUniPanel
      Left = 311
      ExplicitLeft = 311
    end
  end
  object PnlCtrlsCarrier: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 0
    Width = 523
    Height = 261
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitHeight = 250
    object Splitter1: TUniSplitter
      Left = 110
      Top = 1
      Width = 6
      Height = 259
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 248
    end
    object PnlCtrlsLeft: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 109
      Height = 259
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 248
      object lblMerchantID: TUniLabel
        Left = 8
        Top = 12
        Width = 59
        Height = 13
        Hint = ''
        Caption = 'Merchant ID'
        TabOrder = 1
      end
      object lblTerminalID: TUniLabel
        Left = 8
        Top = 36
        Width = 54
        Height = 13
        Hint = ''
        Caption = 'Terminal ID'
        TabOrder = 2
      end
      object lblGroupID: TUniLabel
        Left = 8
        Top = 60
        Width = 43
        Height = 13
        Hint = ''
        Caption = 'Group ID'
        TabOrder = 3
      end
      object lblChargeMethod: TUniLabel
        Left = 8
        Top = 155
        Width = 74
        Height = 13
        Hint = ''
        ShowHint = True
        ParentShowHint = False
        Caption = 'Charge Method'
        TabOrder = 4
      end
      object lblDatawireID: TUniLabel
        Left = 8
        Top = 83
        Width = 57
        Height = 13
        Hint = ''
        Caption = 'Datawire ID'
        TabOrder = 5
      end
      object lblProcessingClass: TUniLabel
        Left = 8
        Top = 131
        Width = 79
        Height = 13
        Hint = ''
        Caption = 'Processing Class'
        TabOrder = 6
      end
      object Label84: TUniLabel
        Left = 8
        Top = 107
        Width = 72
        Height = 13
        Hint = 
          'Merchant authorization currency code.  The value will usually eq' +
          'ual the Country Code.'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Currency Code'
        TabOrder = 7
      end
    end
    object PnlCtrlsClient: TUniPanel
      Tag = 1999
      Left = 116
      Top = 1
      Width = 406
      Height = 259
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitHeight = 248
      DesignSize = (
        406
        259)
      object sbtnCurrencyCode: TUniSpeedButton
        Left = 48
        Top = 104
        Width = 23
        Height = 22
        Hint = 'Select Currency Code'
        ShowHint = True
        ParentShowHint = False
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
          90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
          40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
          00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
          90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
          E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
          F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
          B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
          00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
          A068509050308048308048208038108F4C26B08870A068509058309048308040
          20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
          4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
          FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
          50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
          B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
          F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
          50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
          57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
          C09880B08060A068509050309058409D6842B07860B08870A070508048308048
          20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
          67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
          C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
          20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
          00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
          CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
          37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
          00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
          00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
          00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Caption = ''
        ParentColor = False
        Color = clWindow
        OnClick = sbtnCurrencyCodeClick
      end
      object edtMerchantID: TUniEdit
        Left = 0
        Top = 8
        Width = 169
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
      end
      object edtTerminalID: TUniEdit
        Left = 0
        Top = 32
        Width = 169
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object edtGroupID: TUniEdit
        Left = 0
        Top = 56
        Width = 169
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object cmbChargeMethod: TUniComboBox
        Left = 0
        Top = 152
        Width = 400
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Authorize and Settle separately'
          'Settle immediately')
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 10
        Color = clBtnFace
      end
      object chkTestAccount: TUniCheckBox
        Left = 0
        Top = 216
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'Test Account'
        TabOrder = 4
      end
      object edtDatawireID: TUniEdit
        Left = 0
        Top = 80
        Width = 169
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 5
      end
      object cmbProcessingClass: TUniComboBox
        Left = 0
        Top = 128
        Width = 193
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Standard'
          'Level 2'
          'Level 3')
        TabOrder = 11
      end
      object edtCurrencyCode: TUniEdit
        Left = 0
        Top = 104
        Width = 43
        Height = 21
        Hint = ''
        MaxLength = 3
        Text = ''
        TabOrder = 7
      end
      object chkChangeSettlement: TUniCheckBox
        Left = 0
        Top = 184
        Width = 400
        Height = 17
        Hint = ''
        Caption = 'Allow Manually Changing Settlement Amount'
        TabOrder = 8
      end
      object chkAutoAdjustSettlement: TUniCheckBox
        Left = 0
        Top = 200
        Width = 400
        Height = 17
        Hint = ''
        Caption = 'Automatically Adjust Amounts During Settlement Based on Invoice'
        TabOrder = 9
      end
    end
  end
  inherited PkCurrencyCode: TIQWebHpick
    Left = 64
    Top = 0
  end
  inherited PkCountryCode: TIQWebHpick
    Left = 216
    Top = 0
  end
  inherited MainMenu1: TUniMainMenu
    Left = 354
    Top = 65528
  end
  inherited PkCurrencyISO: TIQWebHpick
    Left = 136
    Top = 0
  end
end

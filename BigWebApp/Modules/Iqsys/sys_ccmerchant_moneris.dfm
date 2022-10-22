inherited FrmIQSysMerchantMoneris: TFrmIQSysMerchantMoneris
  Left = 362
  Top = 208
  ClientHeight = 295
  ClientWidth = 426
  Caption = 'Moneris Merchant Account'
  OldCreateOrder = True
  ExplicitWidth = 442
  ExplicitHeight = 354
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBottom: TUniPanel
    Top = 260
    Width = 426
    ExplicitTop = 260
    ExplicitWidth = 426
    inherited PnlButtons: TUniPanel
      Left = 214
      ExplicitLeft = 214
    end
  end
  object PnlCtrlsCarrier: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 90
    Width = 426
    Height = 170
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 170
      Top = 1
      Width = 6
      Height = 168
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlCtrlsLeft: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 169
      Height = 168
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblUserID: TUniLabel
        Left = 8
        Top = 12
        Width = 144
        Height = 13
        Hint = 'Either the Store ID (store_id) or DP ID (dp_id) value'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Login Name (User or Store ID)'
        TabOrder = 1
      end
      object lblKey: TUniLabel
        Left = 8
        Top = 36
        Width = 97
        Height = 13
        Hint = 'Either the HPP Key (hpp_key) or DP Key (dp_key) value'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Password (HPP Key)'
        TabOrder = 2
      end
      object Label77: TUniLabel
        Left = 8
        Top = 60
        Width = 75
        Height = 13
        Hint = 'Merchant location country code'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Language Code'
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
    end
    object PnlCtrlsClient: TUniPanel
      Tag = 1999
      Left = 176
      Top = 1
      Width = 249
      Height = 168
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
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
      object cmbLanguageCode: TUniComboBox
        Left = 0
        Top = 56
        Width = 138
        Height = 21
        Hint = ''
        Text = 'EN'
        Items.Strings = (
          'EN'
          'FR')
        TabOrder = 3
      end
      object cmbProcessingClass: TUniComboBox
        Left = 0
        Top = 80
        Width = 193
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Standard'
          'Level 2'
          'Level 3')
        TabOrder = 5
      end
      object chkTestAccount: TUniCheckBox
        Left = 1
        Top = 107
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'Test Account'
        TabOrder = 4
      end
    end
  end
  object CaptionPanel1: TIQWebCaptionPanel [2]
    Left = 0
    Top = 0
    Width = 426
    Height = 90
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = 'Important Note:'
    ParentColor = True
    Text = 
      'The EnterpriseIQ Credit Card module uses the '#8220'direct post'#8221' solut' +
      'ion when communicating with Moneris.  Profile settings must set ' +
      'the transaction type to '#8220'purchase'#8221' and the response method to '#8220'k' +
      'ey/value pairs.'#8221
    PictureLayout = plImageRight
    LayoutStyle = lsBasic
    DesignSize = (
      426
      90)
  end
  inherited PkCurrencyCode: TIQWebHpick
    Left = 16
    Top = 240
  end
  inherited PkCountryCode: TIQWebHpick
    Left = 168
    Top = 240
  end
  inherited MainMenu1: TUniMainMenu
    Left = 306
    Top = 232
  end
  inherited PkCurrencyISO: TIQWebHpick
    Left = 88
    Top = 240
  end
end

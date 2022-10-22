inherited FrmIQSysMerchantElavon: TFrmIQSysMerchantElavon
  Left = 366
  Top = 254
  ClientHeight = 193
  ClientWidth = 367
  Caption = 'Elavon Merchant Account'
  OldCreateOrder = True
  ExplicitWidth = 383
  ExplicitHeight = 252
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlBottom: TUniPanel
    Top = 158
    Width = 367
    ExplicitTop = 146
    ExplicitWidth = 367
    inherited PnlButtons: TUniPanel
      Left = 155
      ExplicitLeft = 155
    end
  end
  object PnlCtrlsCarrier: TUniPanel [1]
    Tag = 1999
    Left = 0
    Top = 0
    Width = 367
    Height = 158
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitHeight = 146
    object Splitter1: TUniSplitter
      Left = 110
      Top = 1
      Width = 6
      Height = 156
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitHeight = 144
    end
    object PnlCtrlsLeft: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 109
      Height = 156
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 144
      object lblAccountID: TUniLabel
        Left = 8
        Top = 12
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Account ID'
        TabOrder = 1
      end
      object lblUserID: TUniLabel
        Left = 8
        Top = 36
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'User ID'
        TabOrder = 2
      end
      object lblPassword: TUniLabel
        Left = 8
        Top = 60
        Width = 28
        Height = 13
        Hint = ''
        Caption = 'PIN #'
        TabOrder = 3
      end
      object lblChargeMethod: TUniLabel
        Left = 8
        Top = 84
        Width = 74
        Height = 13
        Hint = ''
        Enabled = False
        ShowHint = True
        ParentShowHint = False
        Caption = 'Charge Method'
        TabOrder = 4
      end
    end
    object PnlCtrlsClient: TUniPanel
      Tag = 1999
      Left = 116
      Top = 1
      Width = 250
      Height = 156
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitHeight = 144
      DesignSize = (
        250
        156)
      object edtAccountID: TUniEdit
        Left = 0
        Top = 8
        Width = 169
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 0
      end
      object edtUserID: TUniEdit
        Left = 0
        Top = 32
        Width = 169
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object edtPIN: TUniEdit
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
        Top = 80
        Width = 244
        Height = 21
        Hint = ''
        Enabled = False
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Authorize and Settle separately'
          'Settle immediately')
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        Color = clBtnFace
      end
      object chkTestAccount: TUniCheckBox
        Left = 0
        Top = 107
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'Test Account'
        TabOrder = 4
      end
    end
  end
  inherited PkCurrencyCode: TIQWebHpick
    Top = 120
  end
  inherited PkCountryCode: TIQWebHpick
    Left = 176
    Top = 120
  end
  inherited PkCurrencyISO: TIQWebHpick
    Top = 120
  end
end

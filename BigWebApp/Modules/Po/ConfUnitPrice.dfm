inherited FrmConfUnitPrice: TFrmConfUnitPrice
  ClientHeight = 119
  ClientWidth = 353
  ExplicitWidth = 369
  ExplicitHeight = 158
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 353
    Height = 81
    ExplicitWidth = 353
    ExplicitHeight = 81
  end
  inherited Panel2: TUniPanel
    Top = 81
    Width = 353
    ExplicitTop = 81
    ExplicitWidth = 353
    inherited Bevel1: TUniPanel
      Width = 351
      ExplicitWidth = 351
    end
    object Panel3: TUniPanel
      Left = 140
      Top = 5
      Width = 213
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        213
        33)
      object BtnYes: TUniButton
        Tag = 1
        Left = 7
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Yes'
        ModalResult = 1
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
      end
      object BtnNo: TUniButton
        Left = 111
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&No'
        ModalResult = 2
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 2
      end
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMCONFUNITPRICE')
    SecurityItems.Strings = (
      'BtnNo'
      'btnYes'
      'CheckBox')
    SecurityCode = 'FRMCONFUNITPRICE'
  end
end

inherited FrmConfirmArinvtSalesAccountSplit: TFrmConfirmArinvtSalesAccountSplit
  ClientHeight = 85
  ClientWidth = 370
  BorderStyle = bsDialog
  OldCreateOrder = True
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 370
    Height = 49
    ExplicitWidth = 370
    ExplicitHeight = 49
    object Label1: TUniLabel
      Left = 1
      Top = 15
      Width = 368
      Height = 18
      Hint = ''
      Alignment = taCenter
      AutoSize = False
      Caption = 'Label1'
      TabOrder = 2
    end
  end
  inherited Panel2: TUniPanel
    Top = 49
    Width = 370
    Height = 36
    ExplicitTop = 49
    ExplicitWidth = 370
    ExplicitHeight = 36
    inherited Bevel1: TUniPanel
      Width = 368
      ExplicitWidth = 368
    end
    object btnYes: TUniButton
      Tag = 1
      Left = 166
      Top = 7
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Yes'
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnClick = btnYesClick
    end
    object btnNo: TUniButton
      Left = 266
      Top = 7
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&No'
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 4
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'BtnYes')
    Left = 5
    Top = 19
  end
end

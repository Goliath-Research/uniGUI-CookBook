inherited FrmMsgMemoConfirm3Btn: TFrmMsgMemoConfirm3Btn
  Left = 101
  Top = 183
  Caption = 'Please select'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TUniPanel
    inherited btnYes: TUniBitBtn
      Left = 181
      Top = 1
      Glyph.Data = {00000000}
      Caption = '&Yes'
      ModalResult = 6
      ExplicitLeft = 181
      ExplicitTop = 1
    end
    inherited bbtnCancel: TUniBitBtn
      Left = 331
      Top = 1
      Glyph.Data = {00000000}
      ExplicitLeft = 331
      ExplicitTop = 1
    end
    object bbtnNo: TUniBitBtn
      Left = 31
      Top = 1
      Width = 120
      Height = 40
      Hint = ''
      Caption = '&No'
      ModalResult = 7
      TabOrder = 2
      OnClick = bbtnNoClick
    end
  end
end

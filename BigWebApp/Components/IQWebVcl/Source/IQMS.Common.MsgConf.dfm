inherited FrmShowConfirmStr: TFrmShowConfirmStr
  ClientHeight = 189
  ClientWidth = 405
  Caption = 'Confirm'
  ExplicitWidth = 421
  ExplicitHeight = 228
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlDisplay: TUniPanel
    Width = 405
    Height = 157
    ExplicitWidth = 405
    ExplicitHeight = 157
    inherited RichEdit1: TUniHTMLMemo
      Width = 403
      Height = 155
      ExplicitWidth = 403
      ExplicitHeight = 155
    end
  end
  inherited PnlButtons: TUniPanel
    Top = 157
    Width = 405
    ExplicitTop = 157
    ExplicitWidth = 405
    inherited PnlButtonsInner: TUniPanel
      Left = 181
      Width = 224
      ExplicitLeft = 181
      ExplicitWidth = 224
      inherited btnOK: TUniButton
        Left = 2
        ModalResult = 1
        ExplicitLeft = 2
      end
      object btnCancel: TUniButton
        Left = 114
        Top = 2
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
end

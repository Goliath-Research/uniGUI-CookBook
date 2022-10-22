object FrmDbtList: TFrmDbtList
  Left = 414
  Top = 268
  BorderStyle = bsSizeToolWin
  Caption = 'List'
  ClientHeight = 173
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  object lstObjects: TUniListBox
    Left = 0
    Top = 0
    Width = 210
    Height = 132
    Align = alClient
    TabOrder = 0
    OnDblClick = btnOkClick
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 132
    Width = 210
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 137
    ExplicitWidth = 218
    object PnlButtonsInner: TUniPanel
      Left = 3
      Top = 0
      Width = 215
      Height = 41
      Align = alRight
      TabOrder = 0
      object btnOk: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Caption = 'Select'
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Cancel = True
        Caption = 'Cancel'
        ModalResult = 2
      end
    end
  end
end

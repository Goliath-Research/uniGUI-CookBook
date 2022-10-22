object FrmDBTFieldNamePrompt: TFrmDBTFieldNamePrompt
  Left = 378
  Top = 256
  Caption = 'Field Name'
  ClientHeight = 148
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 107
    Width = 358
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 136
      Top = 0
      Width = 222
      Height = 41
      Align = alRight
      ParentBackground = False
      TabOrder = 0
      object btnOk: TUniBitBtn
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Caption = '&OK'
        Default = True
        TabOrder = 0
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Cancel = True
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 358
    Height = 107
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    object lblPrompt: TUniLabel
      Left = 16
      Top = 16
      Width = 123
      Height = 13
      Caption = 'Enter a name for the field'
    end
    object edtFieldName: TUniEdit
      Left = 16
      Top = 32
      Width = 201
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 0
      OnKeyPress = edtFieldNameKeyPress
    end
  end
end

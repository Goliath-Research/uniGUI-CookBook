object IQEditorDialogForm: TIQEditorDialogForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'New Editor  Dialog'
  ClientHeight = 372
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    384
    372)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 104
    Height = 13
    Caption = 'Please select an item:'
  end
  object Button1: TButton
    Left = 24
    Top = 334
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 278
    Top = 334
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object ListBox: TListBox
    Left = 24
    Top = 32
    Width = 329
    Height = 296
    ItemHeight = 13
    TabOrder = 2
    OnDblClick = ListBoxDblClick
  end
end

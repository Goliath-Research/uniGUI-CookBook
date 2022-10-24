object MyFormVCL: TMyFormVCL
  Left = 0
  Top = 0
  Caption = 'MyFormVCL'
  ClientHeight = 115
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 82
    Height = 16
    Caption = 'Enter some text'
  end
  object edtSomeText: TEdit
    Left = 104
    Top = 16
    Width = 193
    Height = 23
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 40
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 184
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end

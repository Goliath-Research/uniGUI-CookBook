object FrmDartNodes: TFrmDartNodes
  Left = 236
  Top = 223
  ClientHeight = 93
  ClientWidth = 324
  Caption = 'DART Nodes'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 6
    Top = 8
    Width = 314
    Height = 49
    Hint = ''
    TabOrder = 0
    Caption = ''
  end
  object Label1: TUniLabel
    Left = 16
    Top = 22
    Width = 105
    Height = 13
    Hint = ''
    Caption = 'Select Collector Node '
    TabOrder = 1
  end
  object btnOK: TUniButton
    Left = 152
    Top = 64
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TUniButton
    Left = 245
    Top = 64
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object ComboBox1: TUniComboBox
    Left = 136
    Top = 18
    Width = 177
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 4
  end
end

object FrmMfgConvDefineUOM: TFrmMfgConvDefineUOM
  Left = 296
  Top = 231
  ClientHeight = 95
  ClientWidth = 263
  Caption = 'Define UOM'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 4
    Top = 4
    Width = 253
    Height = 53
    Hint = ''
    TabOrder = 0
    Caption = ''
  end
  object Label2: TUniLabel
    Left = 144
    Top = 17
    Width = 8
    Height = 16
    Hint = ''
    Caption = '/'
    ParentFont = False
    Font.Height = -13
    Font.Style = [fsBold]
    TabOrder = 1
  end
  object Label1: TUniLabel
    Left = 10
    Top = 19
    Width = 27
    Height = 13
    Hint = ''
    Caption = 'UOM:'
    TabOrder = 2
  end
  object combUOM1: TUniComboBox
    Left = 41
    Top = 15
    Width = 99
    Height = 21
    Hint = ''
    Style = csDropDownList
    Text = ''
    TabOrder = 3
  end
  object combUOM2: TUniComboBox
    Left = 153
    Top = 15
    Width = 99
    Height = 21
    Hint = ''
    Style = csDropDownList
    Text = ''
    TabOrder = 4
  end
  object btnOK: TUniButton
    Left = 56
    Top = 64
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 5
    Default = True
  end
  object btnCancel: TUniButton
    Left = 160
    Top = 64
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 6
  end
  object procUOM: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    Left = 8
    Top = 64
  end
end

object FrmCalcUOMFactor: TFrmCalcUOMFactor
  Left = 278
  Top = 332
  ClientHeight = 167
  ClientWidth = 305
  Caption = 'Calculate Factor'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 7
    Top = 7
    Width = 289
    Height = 116
    Hint = ''
    TabOrder = 4
    Caption = ''
  end
  object Label1: TUniLabel
    Left = 15
    Top = 93
    Width = 19
    Height = 13
    Hint = ''
    Caption = 'SPG'
    TabOrder = 5
  end
  object Label2: TUniLabel
    Left = 15
    Top = 18
    Width = 33
    Height = 13
    Hint = ''
    Caption = 'Length'
    TabOrder = 6
  end
  object Label3: TUniLabel
    Left = 15
    Top = 43
    Width = 28
    Height = 13
    Hint = ''
    Caption = 'Width'
    TabOrder = 7
  end
  object Label4: TUniLabel
    Left = 15
    Top = 68
    Width = 31
    Height = 13
    Hint = ''
    Caption = 'Gauge'
    TabOrder = 8
  end
  object edSPG: TUniEdit
    Left = 82
    Top = 89
    Width = 134
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 3
  end
  object edLength: TUniEdit
    Left = 82
    Top = 14
    Width = 134
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object edWidth: TUniEdit
    Left = 82
    Top = 39
    Width = 134
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object edGauge: TUniEdit
    Left = 82
    Top = 64
    Width = 134
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object btnOK: TUniButton
    Left = 97
    Top = 133
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 9
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 199
    Top = 133
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 10
  end
end

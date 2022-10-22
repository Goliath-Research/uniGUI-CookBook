object Frm_Scale: TFrm_Scale
  Left = 364
  Top = 232
  ClientHeight = 150
  ClientWidth = 190
  Caption = 'Grid Options'
  BorderStyle = bsSingle
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  Font.Color = clBlack
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TUniLabel
    Left = 34
    Top = 120
    Width = 31
    Height = 13
    Hint = ''
    Caption = 'Factor'
    TabOrder = 2
  end
  object spnFactor: TUniSpinEdit
    Left = 83
    Top = 115
    Width = 41
    Height = 22
    Hint = ''
    Value = 4
    MaxValue = 100
    MinValue = 1
    OnChange = spnFactorChange
    TabOrder = 0
    ParentFont = False
    Font.Color = clBlack
    Font.Style = [fsBold]
  end
  object GroupBox1: TUniGroupBox
    Left = 8
    Top = 8
    Width = 153
    Height = 81
    Hint = ''
    Caption = ' Grid Height '
    TabOrder = 1
    object Label1: TUniLabel
      Left = 11
      Top = 18
      Width = 75
      Height = 13
      Hint = ''
      Caption = 'Grid Line Height'
      TabOrder = 3
    end
    object spnLineHeight: TUniSpinEdit
      Left = 96
      Top = 16
      Width = 41
      Height = 22
      Hint = ''
      Value = 22
      MaxValue = 50
      MinValue = 12
      OnChange = spnLineHeightChange
      TabOrder = 0
    end
    object btnDefault: TUniBitBtn
      Left = 29
      Top = 48
      Width = 89
      Height = 25
      Hint = ''
      Caption = 'Reset Default'
      TabOrder = 1
      OnClick = btnDefaultClick
    end
  end
end

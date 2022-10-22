object FrmDispProp: TFrmDispProp
  Left = 280
  Top = 136
  ClientHeight = 226
  ClientWidth = 200
  Caption = 'Disposition Properties'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TUniPageControl
    Left = 16
    Top = 16
    Width = 177
    Height = 169
    Hint = ''
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TUniTabSheet
      Hint = ''
      Caption = '&General'
      object CheckBox1: TUniCheckBox
        Left = 8
        Top = 24
        Width = 153
        Height = 17
        Hint = ''
        Caption = 'Auto relieve multi locations'
        TabOrder = 0
      end
    end
  end
  object BitBtn1: TUniBitBtn
    Left = 32
    Top = 200
    Width = 75
    Height = 25
    Hint = ''
    Caption = ''
    TabOrder = 1
  end
  object BitBtn2: TUniBitBtn
    Left = 120
    Top = 200
    Width = 75
    Height = 25
    Hint = ''
    Caption = ''
    TabOrder = 2
  end
end

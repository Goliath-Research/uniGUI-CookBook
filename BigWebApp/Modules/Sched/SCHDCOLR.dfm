object Frm_Colors: TFrm_Colors
  Left = 298
  Top = 95
  ClientHeight = 205
  ClientWidth = 280
  Caption = 'Schedule Colors'
  BorderStyle = bsDialog
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  Font.Color = clBlack
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TUniGroupBox
    Left = 8
    Top = 8
    Width = 265
    Height = 129
    Hint = ''
    Caption = ' Grid Colors '
    TabOrder = 0
    object btnDefault: TUniBitBtn
      Left = 144
      Top = 96
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Default'
      TabOrder = 0
      OnClick = btnDefaultClick
    end
    object Shape1: TUniPanel
      Left = 192
      Top = 24
      Width = 49
      Height = 25
      Hint = ''
      TabOrder = 2
      Caption = ''
    end
    object Shape2: TUniPanel
      Left = 192
      Top = 56
      Width = 49
      Height = 24
      Hint = ''
      TabOrder = 3
      Caption = ''
    end
    object btnBackGround: TUniColorButton
      Left = 16
      Top = 24
      Width = 113
      Height = 25
      Hint = ''
      Color = clBlack
      Caption = 'Background'
      OnSelect = btnBackGroundSelect
    end
    object btnLines: TUniColorButton
      Left = 16
      Top = 55
      Width = 113
      Height = 25
      Hint = ''
      Color = clBlack
      Caption = 'Lines'
      OnSelect = btnLinesSelect
    end
  end
  object PnlButton: TUniPanel
    Tag = 1999
    Left = 0
    Top = 164
    Width = 280
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 63
      Top = 1
      Width = 217
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniBitBtn
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Ok'
        TabOrder = 0
        OnClick = btnOKClick
      end
      object btncancel: TUniBitBtn
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 1
        OnClick = btncancelClick
      end
    end
  end
end

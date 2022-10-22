object FrmAutoMarShippedOrds: TFrmAutoMarShippedOrds
  Left = 128
  Top = 198
  ClientHeight = 140
  ClientWidth = 273
  Caption = 'Auto Mark Shipped Orders'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 28
    Top = 55
    Width = 69
    Height = 13
    Hint = ''
    Caption = 'Last Ship Date'
    TabOrder = 3
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 99
    Width = 273
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 99
      Top = 1
      Width = 174
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnCancel: TUniButton
        Left = 83
        Top = 8
        Width = 74
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 1
        OnClick = BtnCancelClick
      end
      object BtnOk: TUniButton
        Left = 2
        Top = 8
        Width = 74
        Height = 25
        Hint = ''
        Caption = 'Ok'
        TabOrder = 2
        OnClick = BtnOkClick
      end
    end
  end
  object CheckBox1: TUniCheckBox
    Left = 29
    Top = 27
    Width = 177
    Height = 17
    Hint = ''
    Caption = 'Exclude Orders Shipped After:'
    TabOrder = 1
    OnClick = CheckBox1Click
  end
  object wwDBDateTimePicker1: TUniDBDateTimePicker
    Left = 112
    Top = 51
    Width = 126
    Height = 21
    Hint = ''
    DateTime = 42661.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 2
  end
end

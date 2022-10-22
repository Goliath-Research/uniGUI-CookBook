object FrmMileageCalc: TFrmMileageCalc
  Left = 30
  Top = 181
  ClientHeight = 134
  ClientWidth = 227
  Caption = ''
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  DesignSize = (
    227
    134)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 13
    Top = 24
    Width = 66
    Height = 13
    Hint = ''
    Caption = 'Mileage Rate:'
    TabOrder = 3
  end
  object Label2: TUniLabel
    Left = 13
    Top = 60
    Width = 65
    Height = 13
    Hint = ''
    Caption = 'Mileage Qty.:'
    TabOrder = 4
  end
  object EditRate: TUniEdit
    Left = 93
    Top = 20
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object EditQty: TUniEdit
    Left = 93
    Top = 56
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 93
    Width = 227
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel2: TUniPanel
      Left = -5
      Top = 1
      Width = 232
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnCancel: TUniButton
        Left = 144
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 1
        OnClick = BtnCancelClick
      end
      object BtnOk: TUniButton
        Left = 56
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Ok'
        TabOrder = 2
        OnClick = BtnOkClick
      end
    end
  end
end

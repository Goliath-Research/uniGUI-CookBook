object FrmChooseWf: TFrmChooseWf
  Left = 0
  Top = 0
  ClientHeight = 124
  ClientWidth = 265
  Caption = 'Workflow'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 120
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 94
    Width = 265
    Height = 30
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = -4
      Top = 1
      Width = 269
      Height = 28
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 111
        Top = 2
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 190
        Top = 2
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object rbEmp: TUniRadioButton
    Left = 16
    Top = 19
    Width = 113
    Height = 17
    Hint = ''
    Caption = 'Employees'
    TabOrder = 1
  end
  object rbApp: TUniRadioButton
    Left = 16
    Top = 51
    Width = 113
    Height = 17
    Hint = ''
    Caption = 'Applicants'
    TabOrder = 2
  end
end

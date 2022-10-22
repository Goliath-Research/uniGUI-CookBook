object FrmNegAlert: TFrmNegAlert
  Left = 136
  Top = 191
  ClientHeight = 164
  ClientWidth = 432
  Caption = 'Alert'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 123
    Width = 432
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 185
      Top = 1
      Width = 247
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnNo: TUniButton
        Left = 160
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'No'
        TabOrder = 1
        OnClick = BtnNoClick
      end
      object BtnYes: TUniButton
        Left = 80
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Yes'
        TabOrder = 2
        OnClick = BtnYesClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 432
    Height = 71
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Panel5: TUniPanel
      Left = 1
      Top = 38
      Width = 430
      Height = 33
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = 'Panel5'
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 71
    Width = 432
    Height = 52
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 430
      Height = 24
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = 'Continue anyway?'
    end
  end
end

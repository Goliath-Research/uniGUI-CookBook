object FrmIQInputQuery: TFrmIQInputQuery
  Left = 336
  Top = 224
  ClientHeight = 107
  ClientWidth = 314
  Caption = ''
  OnShow = FormShow
  BorderStyle = bsDialog
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 66
    Width = 314
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel1: TUniPanel
      Left = 109
      Top = 1
      Width = 205
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
      object BtnCancel: TUniButton
        Left = 102
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 314
    Height = 66
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 24
      Top = 12
      Width = 89
      Height = 13
      Hint = ''
      Caption = 'Please enter value'
      TabOrder = 1
    end
    object MaskEdit1: TUniEdit
      Left = 24
      Top = 31
      Width = 274
      Hint = ''
      Text = ''
      TabOrder = 2
    end
  end
end

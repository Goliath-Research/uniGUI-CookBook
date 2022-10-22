object FrmGetEmpId: TFrmGetEmpId
  Left = 258
  Top = 239
  ClientHeight = 107
  ClientWidth = 330
  Caption = 'Employee Number'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 8
    Top = 7
    Width = 115
    Height = 13
    Hint = ''
    Caption = 'Enter Employee Number'
    TabOrder = 2
  end
  object edEmpNo: TUniEdit
    Left = 8
    Top = 27
    Width = 241
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 66
    Width = 330
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 114
      Top = 1
      Width = 216
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
      end
      object btnOk: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 2
        OnClick = btnOkClick
      end
    end
  end
end

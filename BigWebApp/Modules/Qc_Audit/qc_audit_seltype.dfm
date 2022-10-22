object FrmQcAuditSelType: TFrmQcAuditSelType
  Left = 343
  Top = 235
  ClientHeight = 136
  ClientWidth = 281
  Caption = 'Audit Type'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 8
    Top = 8
    Width = 84
    Height = 13
    Hint = ''
    Caption = 'Select Audit Type'
    TabOrder = 3
  end
  object rbInternal: TUniRadioButton
    Left = 24
    Top = 32
    Width = 113
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Internal'
    TabOrder = 0
  end
  object rbExternal: TUniRadioButton
    Left = 24
    Top = 56
    Width = 113
    Height = 17
    Hint = ''
    Caption = 'External'
    TabOrder = 1
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 95
    Width = 281
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 68
      Top = 1
      Width = 212
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 104
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
end

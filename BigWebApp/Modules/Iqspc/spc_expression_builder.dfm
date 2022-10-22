object FrmSPCExprBuilder: TFrmSPCExprBuilder
  Left = 268
  Top = 147
  ClientHeight = 307
  ClientWidth = 524
  Caption = 'Expression Builder'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 524
    Height = 105
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
  end
  object Panel2: TUniPanel
    Tag = 1999
    Left = 0
    Top = 105
    Width = 524
    Height = 41
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 266
    Width = 524
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 316
      Top = 1
      Width = 208
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
end

object FrmTouchScreenChoose: TFrmTouchScreenChoose
  Left = 0
  Top = 0
  ClientHeight = 337
  ClientWidth = 387
  Caption = 'Select'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 280
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object sbList: TUniScrollBox
      Left = 1
      Top = 1
      Width = 385
      Height = 278
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 280
    Width = 387
    Height = 57
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Left = 127
      Top = 1
      Width = 259
      Height = 55
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniBitBtn
        Left = 128
        Top = 8
        Width = 120
        Height = 40
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 0
      end
      object btnOk: TUniBitBtn
        Left = 0
        Top = 8
        Width = 120
        Height = 40
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
    end
  end
end

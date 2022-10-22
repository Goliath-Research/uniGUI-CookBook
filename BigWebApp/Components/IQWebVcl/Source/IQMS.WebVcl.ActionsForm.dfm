object FrmActionList: TFrmActionList
  Left = 309
  Top = 218
  ClientHeight = 197
  ClientWidth = 373
  Caption = 'Edit'
  Position = poOwnerFormCenter
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 373
    Height = 156
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object lstActions: TCheckListBox
      Left = 0
      Top = 0
      Width = 373
      Height = 156
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 156
    Width = 373
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Left = 157
      Top = 1
      Width = 216
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
        Caption = '&OK'
        TabOrder = 0
        Default = True
        OnClick = btnOKClick
      end
      object btnCancel: TUniBitBtn
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
    object btnExecute: TUniBitBtn
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Hint = 'Execute all selected jumps'
      ShowHint = True
      ParentShowHint = False
      Caption = 'Go!'
      TabOrder = 1
      OnClick = btnExecuteClick
    end
  end
end

object FrmOeQuickLocsFilter: TFrmOeQuickLocsFilter
  Left = 0
  Top = 0
  ClientHeight = 227
  ClientWidth = 405
  Caption = 'Filter'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 183
    Width = 405
    Height = 44
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 179
      Top = 1
      Width = 226
      Height = 42
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 118
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 183
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object chkExcludeInTransit: TUniCheckBox
      Left = 20
      Top = 16
      Width = 109
      Height = 17
      Hint = ''
      Caption = 'Exclude In Transit'
      TabOrder = 0
    end
    object chkExcludeHardAlloc: TUniCheckBox
      Left = 20
      Top = 38
      Width = 141
      Height = 17
      Hint = ''
      Caption = 'Exclude Hard Allocated'
      TabOrder = 1
    end
    object chkExcludeExpired: TUniCheckBox
      Left = 20
      Top = 60
      Width = 121
      Height = 17
      Hint = ''
      Caption = 'Exclude Expired'
      TabOrder = 2
    end
    object chkExcludeNonAlloc: TUniCheckBox
      Left = 20
      Top = 82
      Width = 121
      Height = 17
      Hint = ''
      Caption = 'Exclude Non-Allocate'
      TabOrder = 3
    end
    object chkExcludeNonConform: TUniCheckBox
      Left = 20
      Top = 104
      Width = 141
      Height = 17
      Hint = ''
      Caption = 'Exclude Non-Conform'
      TabOrder = 4
    end
    object chkExcludeVMI: TUniCheckBox
      Left = 20
      Top = 126
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'Exclude VMI'
      TabOrder = 5
    end
    object chkExcludeMTO: TUniCheckBox
      Left = 20
      Top = 148
      Width = 141
      Height = 17
      Hint = ''
      Caption = 'Exclude Make To Order'
      TabOrder = 6
    end
  end
end

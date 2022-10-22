object FrmIQDBXObjProp: TFrmIQDBXObjProp
  Left = 345
  Top = 227
  ClientHeight = 239
  ClientWidth = 326
  Caption = 'Object Properties'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 326
    Height = 198
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object lblObjectNameLabel: TUniLabel
      Left = 8
      Top = 20
      Width = 62
      Height = 13
      Hint = ''
      Caption = 'Object Name'
      TabOrder = 6
    end
    object lblObjectTypeLabel: TUniLabel
      Left = 8
      Top = 44
      Width = 59
      Height = 13
      Hint = ''
      Caption = 'Object Type'
      TabOrder = 7
    end
    object lblCreatedLabel: TUniLabel
      Left = 8
      Top = 68
      Width = 39
      Height = 13
      Hint = ''
      Caption = 'Created'
      TabOrder = 8
    end
    object lblModifiedLabel: TUniLabel
      Left = 8
      Top = 92
      Width = 40
      Height = 13
      Hint = ''
      Caption = 'Modified'
      TabOrder = 9
    end
    object lblStatusLabel: TUniLabel
      Left = 8
      Top = 116
      Width = 31
      Height = 13
      Hint = ''
      Caption = 'Status'
      TabOrder = 10
    end
    object edtObjectName: TUniEdit
      Left = 104
      Top = 16
      Width = 217
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 0
      Color = clBtnFace
      ReadOnly = True
    end
    object edtObjectType: TUniEdit
      Left = 104
      Top = 40
      Width = 217
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
      Color = clBtnFace
      ReadOnly = True
    end
    object edtCreated: TUniEdit
      Left = 104
      Top = 64
      Width = 217
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
      Color = clBtnFace
      ReadOnly = True
    end
    object edtModified: TUniEdit
      Left = 104
      Top = 88
      Width = 217
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 3
      Color = clBtnFace
      ReadOnly = True
    end
    object edtStatus: TUniEdit
      Left = 104
      Top = 112
      Width = 217
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 4
      Color = clBtnFace
      ReadOnly = True
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 198
    Width = 326
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 221
      Top = 1
      Width = 105
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Close'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
        Default = True
      end
    end
  end
end

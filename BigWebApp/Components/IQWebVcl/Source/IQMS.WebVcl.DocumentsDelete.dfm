object IQWebDocDelete: TIQWebDocDelete
  Left = 325
  Top = 233
  ClientHeight = 130
  ClientWidth = 337
  Caption = 'Delete Document'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 89
    Width = 337
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 131
      Top = 1
      Width = 206
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
        Default = True
      end
      object btnOK: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 2
        OnClick = btnOKClick
      end
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 337
    Height = 89
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object cbRemoveFromSys: TUniCheckBox
      Left = 19
      Top = 12
      Width = 310
      Height = 17
      Hint = ''
      Caption = 'Remove the document from the System?'
      TabOrder = 0
    end
  end
end

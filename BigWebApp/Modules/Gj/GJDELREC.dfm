object FrmDelRecurringLine: TFrmDelRecurringLine
  Left = 311
  Top = 240
  ClientHeight = 198
  ClientWidth = 368
  Caption = ''
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 157
    Width = 368
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 159
      Top = 1
      Width = 209
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
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
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 368
    Height = 157
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 8
      Top = 8
      Width = 260
      Height = 13
      Hint = ''
      Caption = 'Note - this transaction belongs to a RECURRING type.'
      TabOrder = 3
    end
    object Label2: TUniLabel
      Left = 8
      Top = 29
      Width = 399
      Height = 13
      Hint = ''
      Caption = 
        'Deleting recurring transaction line will prevent it from showing' +
        ' up in the next cycle. '
      TabOrder = 4
    end
    object Label3: TUniLabel
      Left = 8
      Top = 63
      Width = 283
      Height = 13
      Hint = ''
      Caption = 'You may however wish to push the line into the next cycle.'
      TabOrder = 5
    end
    object rbtnDelete: TUniRadioButton
      Left = 48
      Top = 88
      Width = 313
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Delete this transaction'
      TabOrder = 0
    end
    object rbtnPush: TUniRadioButton
      Left = 48
      Top = 112
      Width = 313
      Height = 17
      Hint = ''
      Caption = 'Delete and push into the next cycle'
      TabOrder = 1
    end
  end
end

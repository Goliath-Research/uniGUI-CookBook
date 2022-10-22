object FrmTLPredecessorPrompt1: TFrmTLPredecessorPrompt1
  Left = 272
  Top = 194
  ClientHeight = 217
  ClientWidth = 433
  Caption = 'Link Tasks'
  BorderStyle = bsDialog
  Position = poOwnerFormCenter
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 176
    Width = 433
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 223
      Top = 1
      Width = 210
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
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
        Default = True
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
    object chkDoNotShow: TUniCheckBox
      Left = 8
      Top = 16
      Width = 145
      Height = 17
      Hint = ''
      Caption = 'Do not show next time'
      TabOrder = 1
    end
  end
  object PnlPrompt: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 433
    Height = 89
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object lblPrompt: TUniLabel
      Left = 1
      Top = 1
      Width = 44
      Height = 13
      Hint = ''
      Caption = 'lblPrompt'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object PnlOptions: TUniPanel
    Tag = 1999
    Left = 0
    Top = 89
    Width = 433
    Height = 87
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object rgOptions: TUniRadioGroup
      Left = 1
      Top = 1
      Width = 431
      Height = 85
      Hint = ''
      Items.Strings = (
        'Link the tasks.'
        'Change the date without adding a link.')
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' What do you want to do? '
      TabOrder = 0
    end
  end
end

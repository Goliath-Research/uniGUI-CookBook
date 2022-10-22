object FrmPMFilterTasks: TFrmPMFilterTasks
  Left = 392
  Top = 233
  ClientHeight = 102
  ClientWidth = 293
  Caption = 'Filter Tasks'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 70
    Width = 293
    Height = 32
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsRight: TUniPanel
      Left = 81
      Top = 1
      Width = 212
      Height = 30
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniBitBtn
        Left = 5
        Top = 2
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TUniBitBtn
        Left = 109
        Top = 2
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 293
    Height = 70
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 291
      Height = 68
      Hint = ''
      Caption = ' Select Filter '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object chkMisc: TUniCheckBox
        Left = 10
        Top = 18
        Width = 169
        Height = 17
        Hint = ''
        Caption = 'Show Miscellaneous Tasks'
        TabOrder = 0
      end
      object chkArchived: TUniCheckBox
        Left = 10
        Top = 34
        Width = 169
        Height = 17
        Hint = ''
        Caption = 'Show Archived Tasks'
        TabOrder = 1
      end
    end
  end
end

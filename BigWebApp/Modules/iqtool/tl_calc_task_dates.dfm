object FrmTLCalcTaskDates: TFrmTLCalcTaskDates
  Left = 246
  Top = 201
  HelpContext = 9064
  ClientHeight = 225
  ClientWidth = 434
  Caption = 'Calculate Task Dates'
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
    Top = 184
    Width = 434
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 224
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
  end
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 434
    Height = 184
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object lblStartDate: TUniLabel
      Left = 8
      Top = 76
      Width = 50
      Height = 13
      Hint = ''
      Caption = 'Start Date'
      TabOrder = 3
    end
    object lblFinishDate: TUniLabel
      Left = 8
      Top = 100
      Width = 53
      Height = 13
      Hint = ''
      Caption = 'Finish Date'
      TabOrder = 4
    end
    object cmbStartDate: TUniDateTimePicker
      Left = 104
      Top = 72
      Width = 113
      Height = 21
      Hint = ''
      DateTime = 42664.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 0
    end
    object cmbFinishDate: TUniDateTimePicker
      Left = 104
      Top = 96
      Width = 113
      Height = 21
      Hint = ''
      DateTime = 42664.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
    end
    object rgSequence: TUniRadioGroup
      Left = 8
      Top = 8
      Width = 417
      Height = 57
      Hint = ''
      Items.Strings = (
        'Calculate Tasks from Project Start Date'
        'Calculate Tasks from Project Finish Date')
      ItemIndex = 0
      Caption = ' Sequence '
      TabOrder = 5
      OnClick = rgSequenceClick
    end
    object cmbStartTime: TIQWebTimeComboBox
      Left = 220
      Top = 72
      Width = 112
      Height = 21
      Hint = ''
      Time = 0.000000000000000000
      DesignSize = (
        112
        21)
    end
    object cmbFinishTime: TIQWebTimeComboBox
      Left = 220
      Top = 96
      Width = 112
      Height = 21
      Hint = ''
      Time = 0.000000000000000000
      DesignSize = (
        112
        21)
    end
  end
  object PMain: TUniPopupMenu
    Left = 256
    Top = 144
    object Help1: TUniMenuItem
      Caption = '&Help'
      ShortCut = 112
      OnClick = Help1Click
    end
  end
end

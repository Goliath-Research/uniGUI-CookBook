object FrmPMDatesDialog: TFrmPMDatesDialog
  Left = 374
  Top = 187
  ClientHeight = 152
  ClientWidth = 313
  Caption = 'Activity Summary Date Range'
  OnShow = FormShow
  BorderStyle = bsDialog
  Position = poDefault
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 118
    Width = 313
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsRight: TUniPanel
      Left = 103
      Top = 1
      Width = 210
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 106
        Top = 4
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
    Left = 0
    Top = 0
    Width = 313
    Height = 118
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlDates: TUniPanel
      Left = 1
      Top = 59
      Width = 311
      Height = 58
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitTop = 60
      object gbDates: TUniGroupBox
        Left = 1
        Top = 1
        Width = 309
        Height = 56
        Hint = ''
        Caption = ' Select Date Range '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 307
        ExplicitHeight = 52
        object Label1: TUniLabel
          Left = 8
          Top = 26
          Width = 24
          Height = 13
          Hint = ''
          Caption = 'From'
          TabOrder = 3
        end
        object Label2: TUniLabel
          Left = 166
          Top = 26
          Width = 12
          Height = 13
          Hint = ''
          Caption = 'To'
          TabOrder = 4
        end
        object dtpFromDate: TUniDateTimePicker
          Left = 49
          Top = 22
          Width = 97
          Height = 21
          Hint = ''
          DateTime = 42642.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 0
        end
        object dtpToDate: TUniDateTimePicker
          Left = 200
          Top = 22
          Width = 97
          Height = 21
          Hint = ''
          DateTime = 42642.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
        end
      end
    end
    object PnlOption: TUniPanel
      Left = 1
      Top = 1
      Width = 311
      Height = 58
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitHeight = 60
      object rgOption: TUniRadioGroup
        Left = 1
        Top = 1
        Width = 309
        Height = 56
        Hint = ''
        Items.Strings = (
          'All Dates'
          'Date Range')
        ItemIndex = 0
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Display Option '
        TabOrder = 0
        OnClick = rgOptionClick
        ExplicitHeight = 58
      end
    end
  end
end

object FrmDatesDialog2: TFrmDatesDialog2
  Left = 374
  Top = 187
  ClientHeight = 172
  ClientWidth = 315
  Caption = 'Date Range'
  OnShow = FormShow
  BorderStyle = bsDialog
  Position = poDefault
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Left = 0
    Top = 138
    Width = 315
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object btnOK: TUniButton
      Left = 153
      Top = 4
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancel: TUniButton
      Left = 234
      Top = 4
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 315
    Height = 138
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 313
    ExplicitHeight = 118
    object PnlDates: TUniPanel
      Left = 1
      Top = 80
      Width = 313
      Height = 58
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object gbDates: TUniGroupBox
        Left = 1
        Top = 1
        Width = 311
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
          Left = 41
          Top = 22
          Width = 103
          Height = 21
          Hint = ''
          DateTime = 42636.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 0
        end
        object dtpToDate: TUniDateTimePicker
          Left = 192
          Top = 22
          Width = 104
          Height = 21
          Hint = ''
          DateTime = 42636.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
        end
      end
    end
    object PnlOption: TUniPanel
      Left = 1
      Top = 1
      Width = 313
      Height = 80
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object rgOption: TUniRadioGroup
        Left = 1
        Top = 1
        Width = 311
        Height = 78
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
      end
    end
  end
end

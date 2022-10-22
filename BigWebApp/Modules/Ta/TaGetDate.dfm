object FrmSelProdDate: TFrmSelProdDate
  Left = 50
  Top = 157
  ClientHeight = 281
  ClientWidth = 384
  Caption = 'Select Prod. Date'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 208
    Width = 384
    Height = 73
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object btnLast: TUniButton
      Left = 8
      Top = 8
      Width = 365
      Height = 25
      Hint = ''
      Caption = 
        'Calculate using Emp. &Last Calculation Date (default to Prod. Da' +
        'te)'
      TabOrder = 1
      OnClick = btnLastClick
    end
    object btnProd: TUniButton
      Left = 8
      Top = 40
      Width = 153
      Height = 25
      Hint = ''
      Caption = 'Calculate using &Prod. Date'
      TabOrder = 2
      OnClick = btnProdClick
    end
    object btnCancel: TUniButton
      Left = 295
      Top = 40
      Width = 75
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      TabOrder = 3
      OnClick = btnCancelClick
    end
  end
  object wwDate: TUniCalendar
    Left = 0
    Top = 0
    Width = 384
    Height = 208
    Hint = ''
    Date = 42620.000000000000000000
    FirstDayOfWeek = dowMonday
    TabStop = False
    TabOrder = 1
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
end

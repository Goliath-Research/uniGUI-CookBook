object FrmProddates: TFrmProddates
  Left = 256
  Top = 176
  ClientHeight = 314
  ClientWidth = 534
  Caption = 'Production Date Filter'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBMonthCalendar2: TwwDBMonthCalendar
    Left = 32
    Top = 40
    Width = 225
    Height = 160
    Date = 38881.568634791660000000
    Time = 38881.568634791660000000
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 273
    Width = 534
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 316
      Top = 1
      Width = 218
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 259
    Height = 273
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 257
      Height = 21
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = 'From Date'
    end
    object wwFrom: TUniCalendar
      Left = 1
      Top = 21
      Width = 257
      Height = 252
      Hint = ''
      Date = 42620.000000000000000000
      FirstDayOfWeek = dowMonday
      TabStop = False
      TabOrder = 2
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
    end
  end
  object Panel5: TUniPanel
    Left = 259
    Top = 0
    Width = 275
    Height = 273
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Caption = ''
    object Panel6: TUniPanel
      Left = 1
      Top = 1
      Width = 273
      Height = 21
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = 'To Date'
    end
    object wwTo: TUniCalendar
      Left = 1
      Top = 21
      Width = 273
      Height = 252
      Hint = ''
      Date = 42620.000000000000000000
      FirstDayOfWeek = dowMonday
      TabStop = False
      TabOrder = 2
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
    end
  end
end

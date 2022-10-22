object FrmOENewPickWave: TFrmOENewPickWave
  Left = 0
  Top = 0
  ClientHeight = 214
  ClientWidth = 363
  Caption = 'Create SO Picking Wave'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 363
    Height = 172
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 123
      Top = 0
      Width = 5
      Height = 172
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 123
      Height = 170
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      ExplicitTop = -1
      object Label1: TUniLabel
        Left = 12
        Top = 16
        Width = 97
        Height = 13
        Hint = ''
        Caption = 'Wave Shipping Date'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 12
        Top = 40
        Width = 60
        Height = 13
        Hint = ''
        Caption = 'Wave Scope'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 41
        Top = 64
        Width = 31
        Height = 13
        Hint = ''
        Caption = '- Days'
        TabOrder = 3
      end
      object Label4: TUniLabel
        Left = 41
        Top = 88
        Width = 35
        Height = 13
        Hint = ''
        Caption = '+ Days'
        TabOrder = 4
      end
    end
    object Panel4: TUniPanel
      Left = 128
      Top = 1
      Width = 235
      Height = 170
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitLeft = 130
      ExplicitTop = -3
      object edBackDays: TUniEdit
        Left = 1
        Top = 61
        Width = 121
        Height = 21
        Hint = ''
        Text = '3'
        TabOrder = 1
      end
      object edForwDays: TUniEdit
        Left = 1
        Top = 85
        Width = 121
        Height = 21
        Hint = ''
        Text = '3'
        TabOrder = 2
      end
      object dtShipDate: TUniDBDateTimePicker
        Left = 1
        Top = 13
        Width = 121
        Height = 21
        Hint = ''
        DateTime = 42657.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 0
      end
      object chkSkipOnPickTicket: TUniCheckBox
        Left = 1
        Top = 113
        Width = 201
        Height = 17
        Hint = ''
        Caption = 'Skip Releases Already on Pick Ticket  '
        TabOrder = 3
      end
      object chkSkipOnPickWave: TUniCheckBox
        Left = 1
        Top = 134
        Width = 185
        Height = 17
        Hint = ''
        Caption = 'Skip Releases Already on a Wave '
        TabOrder = 4
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 172
    Width = 363
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel5: TUniPanel
      Left = 137
      Top = 1
      Width = 226
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 4
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 114
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
end

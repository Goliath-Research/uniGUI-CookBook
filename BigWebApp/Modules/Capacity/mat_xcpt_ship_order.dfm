object FrmMatExcepShipOrder: TFrmMatExcepShipOrder
  Left = 0
  Top = 0
  ClientHeight = 115
  ClientWidth = 367
  Caption = ''
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 73
    Width = 367
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 148
      Top = 1
      Width = 219
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
        Left = 112
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
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 367
    Height = 73
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 112
      Top = 1
      Width = 4
      Height = 71
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
      ExplicitLeft = 111
      ExplicitTop = 0
      ExplicitHeight = 73
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 111
      Height = 71
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 12
        Top = 15
        Width = 18
        Height = 13
        Hint = ''
        Caption = 'Qty'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 12
        Top = 40
        Width = 63
        Height = 13
        Hint = ''
        Caption = 'Promise Date'
        TabOrder = 2
      end
    end
    object Panel5: TUniPanel
      Left = 116
      Top = 1
      Width = 250
      Height = 71
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      ExplicitLeft = 115
      ExplicitWidth = 252
      object edQty: TUniEdit
        Left = 2
        Top = 12
        Width = 143
        Height = 21
        Hint = ''
        Text = '0'
        TabOrder = 0
      end
      object wwDBDateTimePicker1: TUniDBDateTimePicker
        Left = 1
        Top = 37
        Width = 144
        Height = 21
        Hint = ''
        DateTime = 42618.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
      end
    end
  end
end

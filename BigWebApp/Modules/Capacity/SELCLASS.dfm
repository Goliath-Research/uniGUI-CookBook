object FrmSelClass: TFrmSelClass
  Left = 437
  Top = 243
  ClientHeight = 94
  ClientWidth = 272
  Caption = ''
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 272
    Height = 61
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 270
      Height = 59
      Hint = ''
      Caption = ' Select Class'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object cbClass: TUniComboBox
        Left = 16
        Top = 20
        Width = 209
        Height = 21
        Hint = ''
        Text = ''
        Items.Strings = (
          'ALL'
          'FG'
          'PL'
          'IN'
          'PK')
        TabOrder = 1
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 61
    Width = 272
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 67
      Top = 1
      Width = 205
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 1
        Top = 2
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 102
        Top = 2
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
end

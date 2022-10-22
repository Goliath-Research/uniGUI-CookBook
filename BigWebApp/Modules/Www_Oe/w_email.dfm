object FrmWWWEMail: TFrmWWWEMail
  Left = 473
  Top = 311
  ClientHeight = 299
  ClientWidth = 440
  Caption = 'Email message'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 262
    Width = 440
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 223
      Top = 1
      Width = 217
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnSend: TUniBitBtn
        Left = 8
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        OnClick = btnSendClick
      end
      object btnCancel: TUniBitBtn
        Left = 111
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 1
        OnClick = btnCancelClick
      end
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 440
    Height = 80
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      440
      80)
    object Label3: TUniLabel
      Left = 5
      Top = 9
      Width = 44
      Height = 13
      Hint = ''
      Caption = 'Recipient'
      TabOrder = 3
    end
    object Label4: TUniLabel
      Left = 5
      Top = 35
      Width = 36
      Height = 13
      Hint = ''
      Caption = 'Subject'
      TabOrder = 4
    end
    object Label1: TUniLabel
      Left = 5
      Top = 62
      Width = 24
      Height = 13
      Hint = ''
      Caption = 'Body'
      TabOrder = 5
    end
    object dbSubject: TUniEdit
      Left = 60
      Top = 31
      Width = 365
      Hint = ''
      Text = ''
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Courier New'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object dbRecepient: TUniEdit
      Left = 60
      Top = 4
      Width = 365
      Hint = ''
      Text = ''
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Courier New'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
  object memBody: TUniMemo
    Left = 0
    Top = 80
    Width = 440
    Height = 182
    Hint = ''
    ScrollBars = ssVertical
    Lines.Strings = (
      '')
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Height = -13
    Font.Name = 'Courier New'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
end

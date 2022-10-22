object FrmEdiConfDel: TFrmEdiConfDel
  Left = 178
  Top = 215
  ClientHeight = 99
  ClientWidth = 291
  Caption = 'Confirm Delete'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 291
    Height = 65
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 289
      Height = 63
      Hint = ''
      Caption = ' Options '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 285
      ExplicitHeight = 59
      object rbDelete: TUniRadioButton
        Left = 8
        Top = 16
        Width = 113
        Height = 17
        Hint = ''
        Caption = 'Delete'
        TabOrder = 0
      end
      object rbArcDel: TUniRadioButton
        Left = 8
        Top = 33
        Width = 113
        Height = 17
        Hint = ''
        Caption = 'Archive and Delete'
        TabOrder = 1
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 65
    Width = 291
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel3: TUniPanel
      Left = 80
      Top = 1
      Width = 211
      Height = 32
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Button1: TUniButton
        Left = 5
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TUniButton
        Left = 108
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 2
        OnClick = Button2Click
      end
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'Button1'
      'Button2'
      'rbDelete'
      'rbArcDel')
    SecurityCode = 'FRMEDICONFDEL'
    Left = 152
    Top = 16
  end
end

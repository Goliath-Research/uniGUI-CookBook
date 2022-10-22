object FrmConfirmDelete: TFrmConfirmDelete
  Left = 197
  Top = 149
  ClientHeight = 122
  ClientWidth = 249
  Caption = 'Confirm Delete'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 249
    Height = 29
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 88
    Width = 249
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 40
      Top = 1
      Width = 209
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
  object Panel4: TUniPanel
    Left = 0
    Top = 29
    Width = 249
    Height = 59
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 247
      Height = 57
      Hint = ''
      Caption = ' Options '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
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
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmConfirmDelete')
    SecurityItems.Strings = (
      'rbDelete'
      'rbArcDel'
      'Button1')
    SecurityCode = 'FRMCONFIRMDELETE'
    Left = 160
    Top = 44
  end
end

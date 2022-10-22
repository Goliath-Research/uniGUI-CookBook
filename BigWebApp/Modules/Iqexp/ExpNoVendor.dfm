object FrmNoVendorUser: TFrmNoVendorUser
  Left = 39
  Top = 162
  ClientHeight = 213
  ClientWidth = 457
  Caption = 'Warning'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 172
    Width = 457
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 217
      Top = 1
      Width = 240
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnYes: TUniButton
        Left = 66
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Yes'
        TabOrder = 1
        OnClick = BtnYesClick
      end
      object BtnNo: TUniButton
        Left = 154
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'No'
        TabOrder = 2
        OnClick = BtnNoClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 31
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = 'No Vendor associated to the listed below user(s). Continue?'
  end
  object Memo1: TUniMemo
    Left = 0
    Top = 31
    Width = 457
    Height = 141
    Hint = ''
    Lines.Strings = (
      '')
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'BtnYes'
      'BtnNo')
    SecurityCode = 'FRMNOVENDORUSER'
    Left = 24
    Top = 180
  end
end

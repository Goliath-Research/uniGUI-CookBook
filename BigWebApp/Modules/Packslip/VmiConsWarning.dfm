object FrmVMIConsWarning: TFrmVMIConsWarning
  Left = 192
  Top = 124
  ClientHeight = 144
  ClientWidth = 372
  Caption = 'Warning'
  OnShow = FormShow
  BorderStyle = bsDialog
  Position = poDesktopCenter
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 103
    Width = 372
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 17
      Top = 1
      Width = 354
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnJump: TUniButton
        Left = 8
        Top = 8
        Width = 161
        Height = 25
        Hint = ''
        Caption = 'Jump to unposted AR Invoice'
        TabOrder = 1
        OnClick = BtnJumpClick
      end
      object Button2: TUniButton
        Left = 184
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Ok'
        TabOrder = 2
        OnClick = Button2Click
      end
      object BtnVoid: TUniButton
        Left = 272
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Void'
        TabOrder = 3
        OnClick = BtnVoidClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 372
    Height = 103
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = 'Unposted A/R invoice found - cannot Void'
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMVMICONSWARNING')
    SecurityItems.Strings = (
      'BtnJump'
      'BtnVoid')
    SecurityCode = 'FRMVMICONSWARNING'
    Left = 32
    Top = 24
  end
end

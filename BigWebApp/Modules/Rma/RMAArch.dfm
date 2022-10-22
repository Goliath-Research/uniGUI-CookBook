object FrmRMAArchive: TFrmRMAArchive
  Left = 458
  Top = 249
  ClientHeight = 142
  ClientWidth = 382
  Caption = 'Archive Closed RMAs'
  OnShow = FormShow
  BorderStyle = bsDialog
  Position = poDesktopCenter
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 30
    Top = 16
    Width = 177
    Height = 13
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Do you wish to archive closed RMAs?'
    TabOrder = 2
  end
  object CBUnInv: TUniCheckBox
    Left = 30
    Top = 46
    Width = 178
    Height = 20
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Include uninvoiced RMAs'
    TabOrder = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 97
    Width = 382
    Height = 45
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 122
      Top = 1
      Width = 260
      Height = 43
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 5
        Top = 6
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&OK'
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 133
        Top = 6
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmRMAArchive')
    SecurityItems.Strings = (
      'btnCancel'
      'btnOk'
      'CBUnInv')
    SecurityCode = 'FRMRMAARCHIVE'
    Left = 8
    Top = 72
  end
end

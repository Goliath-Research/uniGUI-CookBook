object FrmCRMMenuProperties: TFrmCRMMenuProperties
  Left = 370
  Top = 306
  ClientHeight = 197
  ClientWidth = 375
  Caption = 'Properties'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 156
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    DesignSize = (
      375
      156)
    object lblCaption: TUniLabel
      Left = 8
      Top = 20
      Width = 37
      Height = 13
      Hint = ''
      Caption = 'Caption'
      TabOrder = 4
    end
    object Label1: TUniLabel
      Left = 8
      Top = 44
      Width = 53
      Height = 13
      Hint = ''
      Caption = 'Description'
      TabOrder = 5
    end
    object chkVisible: TUniCheckBox
      Left = 128
      Top = 136
      Width = 97
      Height = 17
      Hint = ''
      Caption = 'Visible'
      TabOrder = 0
    end
    object edtCaption: TUniEdit
      Left = 128
      Top = 16
      Width = 241
      Height = 21
      Hint = ''
      Text = 'edtCaption'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object memDescrip: TUniMemo
      Left = 128
      Top = 40
      Width = 241
      Height = 89
      Hint = ''
      Lines.Strings = (
        'memDescrip')
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      Color = clBtnFace
      TabOrder = 2
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 156
    Width = 375
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      375
      41)
    object btnCancel: TUniButton
      Left = 271
      Top = 8
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Cancel'
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object btnOk: TUniButton
      Left = 167
      Top = 8
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'OK'
      ModalResult = 1
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
end

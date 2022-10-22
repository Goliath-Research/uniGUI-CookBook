object FrmRec_Labels_Confirm: TFrmRec_Labels_Confirm
  Left = 316
  Top = 218
  ClientHeight = 204
  ClientWidth = 375
  Caption = 'Out of balance'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  DesignSize = (
    375
    204)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TUniLabel
    Left = 6
    Top = 72
    Width = 73
    Height = 13
    Hint = ''
    Caption = 'Select action'
    ParentFont = False
    Font.Style = [fsBold]
    TabOrder = 0
  end
  object Bevel1: TUniPanel
    Left = 0
    Top = 167
    Width = 383
    Height = 4
    Hint = ''
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
    Caption = ''
  end
  object CaptionPanel1: TIQWebCaptionPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 60
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    Caption = 'The list is out of balance with the receipt qty'
    ParentColor = True
    Text = 
      'The list total qty is out of balance with the receipt qty. Pleas' +
      'e note it will not be processed during PO receipt posting unless' +
      ' corrected.'
    PictureLayout = plImageRight
    LayoutStyle = lsWindowsXP
    ExplicitWidth = 383
    DesignSize = (
      375
      60)
  end
  object rbtnAbort: TUniRadioButton
    Left = 20
    Top = 93
    Width = 113
    Height = 17
    Hint = ''
    Caption = 'Abort'
    TabOrder = 1
  end
  object rbtnFixList: TUniRadioButton
    Left = 20
    Top = 115
    Width = 203
    Height = 17
    Hint = ''
    Caption = 'Fix list qty'
    TabOrder = 2
  end
  object rbtnMatchList: TUniRadioButton
    Left = 20
    Top = 138
    Width = 227
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Adjust receipt qty to match list total qty'
    TabOrder = 3
  end
  object btnOK: TUniButton
    Left = 213
    Top = 176
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    Anchors = [akRight, akBottom]
    TabOrder = 6
  end
  object btnCancel: TUniButton
    Left = 301
    Top = 176
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    Anchors = [akRight, akBottom]
    TabOrder = 7
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmRec_Labels_Confirm')
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMREC_LABELS_CONFIRM'
    Left = 265
    Top = 81
  end
end

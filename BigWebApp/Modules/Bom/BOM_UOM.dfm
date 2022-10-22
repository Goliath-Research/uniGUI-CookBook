object FrmBom_UomSelect: TFrmBom_UomSelect
  Left = 431
  Top = 324
  ClientHeight = 247
  ClientWidth = 204
  Caption = 'UOM'
  OnShow = FormShow
  BorderStyle = bsSizeToolWin
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 92
    Top = 0
    Width = 112
    Height = 247
    Hint = ''
    Align = alRight
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object btnAssign: TUniButton
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Save As'
      TabOrder = 1
      OnClick = btnAssignClick
    end
    object btnConvert: TUniButton
      Left = 8
      Top = 40
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'C&onvert To'
      TabOrder = 2
      OnClick = btnConvertClick
    end
    object btnNew: TUniButton
      Left = 8
      Top = 72
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Edit UOM'
      TabOrder = 3
      OnClick = btnNewClick
    end
    object btnCancel: TUniButton
      Left = 8
      Top = 104
      Width = 97
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      Cancel = True
      ModalResult = 2
      TabOrder = 4
    end
  end
  object ListBox1: TUniListBox
    Left = 0
    Top = 0
    Width = 92
    Height = 247
    Hint = ''
    Items.Strings = (
      'Lbs'
      'Gr'
      'Oz')
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmBom_UomSelect')
    SecurityItems.Strings = (
      'btnNew')
    SecurityCode = 'FRMBOM_UOMSELECT'
    Left = 119
    Top = 152
  end
end

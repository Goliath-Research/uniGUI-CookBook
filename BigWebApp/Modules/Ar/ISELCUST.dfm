object FrmCustSelect: TFrmCustSelect
  Left = 311
  Top = 308
  ClientHeight = 135
  ClientWidth = 343
  Caption = 'Select Customer'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 105
    Width = 343
    Height = 30
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 141
      Top = 1
      Width = 202
      Height = 28
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 2
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
      end
      object BtnCancel: TUniButton
        Left = 104
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object RGSelect: TUniRadioGroup
    Left = 0
    Top = 0
    Width = 343
    Height = 105
    Hint = ''
    Items.Strings = (
      'Uninvoiced Shipments'
      'Uninvoiced or partially invoiced Orders'
      'VMI Shipments'
      'All Customers')
    ItemIndex = 0
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' Selection '
    TabOrder = 1
  end
end

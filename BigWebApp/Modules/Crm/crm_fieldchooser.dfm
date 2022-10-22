object FrmCRMFieldChooser: TFrmCRMFieldChooser
  Left = 267
  Top = 165
  ClientHeight = 201
  ClientWidth = 257
  Caption = 'Field Chooser'
  OnShow = FormShow
  BorderStyle = bsSizeToolWin
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlList: TUniPanel
    Left = 0
    Top = 0
    Width = 257
    Height = 166
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object lstFields: TCheckListBox
      Left = 1
      Top = 1
      Width = 255
      Height = 164
      Align = alClient
      ItemHeight = 13
      PopupMenu = PMain
      TabOrder = 0
    end
  end
  object PnlControls: TUniPanel
    Left = 0
    Top = 166
    Width = 257
    Height = 35
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel1: TUniPanel
      Left = 42
      Top = 1
      Width = 214
      Height = 33
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 5
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 109
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PMain: TUniPopupMenu
    Left = 72
    Top = 48
    object SelectAll1: TUniMenuItem
      Caption = 'Select All'
      OnClick = SelectAll1Click
    end
  end
end

object FrmIQOptionDialog: TFrmIQOptionDialog
  Left = 387
  Top = 277
  ClientHeight = 170
  ClientWidth = 225
  Caption = 'Options'
  OnShow = FormShow
  OnResize = FormResize
  OldCreateOrder = False
  OnClose = FormClose
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlCheckList: TUniPanel
    Left = 0
    Top = 41
    Width = 225
    Height = 98
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 91
    object lstOptions: TCheckListBox
      Left = 0
      Top = 0
      Width = 225
      Height = 98
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ItemHeight = 13
      PopupMenu = PMain
      TabOrder = 0
      OnMouseDown = lstOptionsMouseDown
      ExplicitHeight = 91
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 139
    Width = 225
    Height = 31
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 132
    object PnlButtonsInner: TUniPanel
      Left = 18
      Top = 1
      Width = 207
      Height = 29
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 2
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
      end
      object btnCancel: TUniBitBtn
        Left = 106
        Top = 4
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlPrompt: TUniPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 41
    Hint = ''
    Visible = False
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object lblPrompt: TUniLabel
      Left = 1
      Top = 1
      Width = 3
      Height = 13
      Hint = ''
      Caption = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
  end
  object PMain: TUniPopupMenu
    Left = 128
    Top = 73
    object SelectAll1: TUniMenuItem
      Caption = 'Select All'
      OnClick = SelectAll1Click
    end
    object UnselectAll1: TUniMenuItem
      Caption = 'Unselect All'
      OnClick = UnselectAll1Click
    end
  end
end

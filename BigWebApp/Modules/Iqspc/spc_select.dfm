object FrmSPCSelect: TFrmSPCSelect
  Left = 263
  Top = 198
  ClientHeight = 220
  ClientWidth = 353
  Caption = 'Select'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  KeyPreview = True
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlSource: TUniPanel
    Left = 117
    Top = 0
    Width = 236
    Height = 179
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object rgSource: TUniGroupBox
      Left = 1
      Top = 1
      Width = 234
      Height = 177
      Hint = ''
      Caption = ' Select a Type '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object PnlList: TUniPanel
        Left = 2
        Top = 15
        Width = 230
        Height = 160
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object lstSource: TUniListBox
          Left = 1
          Top = 1
          Width = 228
          Height = 158
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          OnDblClick = btnOkClick
        end
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 179
    Width = 353
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsRight: TUniPanel
      Left = 138
      Top = 1
      Width = 214
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 6
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 109
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object PnlOption: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 117
    Height = 179
    Hint = ''
    Visible = False
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 2
    Caption = ''
    object gbOption: TUniRadioGroup
      Left = 1
      Top = 1
      Width = 115
      Height = 177
      Hint = ''
      Items.Strings = (
        'Running'
        'Scheduled'
        'All')
      ItemIndex = 2
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = ' Option '
      TabOrder = 0
    end
  end
end

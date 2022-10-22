object FrmEdiFileType: TFrmEdiFileType
  Left = 294
  Top = 217
  ClientHeight = 157
  ClientWidth = 362
  Caption = 'Determine File Type'
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 362
    Height = 116
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object GroupBox1: TUniGroupBox
      Left = 1
      Top = 1
      Width = 360
      Height = 114
      Hint = ''
      Caption = ' Please Indicate File Type '
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object rbX12: TUniRadioButton
        Left = 11
        Top = 18
        Width = 113
        Height = 17
        Hint = ''
        Checked = True
        Caption = #39'X12'#39' File Type'
        TabOrder = 0
      end
      object rbEDIFACT: TUniRadioButton
        Left = 11
        Top = 46
        Width = 113
        Height = 17
        Hint = ''
        Caption = #39'EDIFACT'#39' File Type'
        TabOrder = 1
      end
      object rbYOUFIND: TUniRadioButton
        Left = 11
        Top = 73
        Width = 182
        Height = 17
        Hint = ''
        Caption = 'Let the program find the file type'
        TabOrder = 2
      end
    end
  end
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 116
    Width = 362
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 144
      Top = 1
      Width = 218
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 1
      end
      object btnCancel: TUniButton
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
end

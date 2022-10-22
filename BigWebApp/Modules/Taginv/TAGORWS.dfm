object FrmTagWorksheet: TFrmTagWorksheet
  Left = 377
  Top = 170
  ClientHeight = 130
  ClientWidth = 366
  Caption = 'Choose Tag or Worksheet Method'
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 366
    Height = 93
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object RadioGroup1: TUniRadioGroup
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 358
      Height = 85
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '  This count is based on  '
      TabOrder = 0
    end
    object rbTags: TUniRadioButton
      Left = 21
      Top = 26
      Width = 172
      Height = 17
      Hint = ''
      Caption = 'Tags (full physical inventory)'
      TabOrder = 1
    end
    object rbWork: TUniRadioButton
      Left = 21
      Top = 51
      Width = 244
      Height = 17
      Hint = ''
      Caption = 'Worksheet (populate tags based on a criteria)'
      TabOrder = 2
    end
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 93
    Width = 366
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Tag = 1999
      Left = 151
      Top = 1
      Width = 214
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 0
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 110
        Top = 3
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object SR1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'rbTags'
      'rbWork'
      'btnOK'
      'btnCancel')
    SecurityCode = 'FRMTAGWORKSHEET'
    Left = 43
    Top = 84
  end
end

object FrmCRMMarkupOptionsDlg: TFrmCRMMarkupOptionsDlg
  Left = 516
  Top = 259
  ClientHeight = 211
  ClientWidth = 425
  Caption = 'Markup'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 170
    Width = 425
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 215
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 1
        Default = True
        OnClick = btnOkClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
    object btnClear: TUniButton
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Hint = ''
      Caption = 'Clear'
      TabOrder = 2
      OnClick = btnClearClick
    end
  end
  object Panel1: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 425
    Height = 136
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 423
      Height = 111
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object rgOption2: TUniGroupBox
        Left = 1
        Top = 1
        Width = 421
        Height = 109
        Hint = ''
        Caption = ' Markup Options '
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitLeft = 8
        ExplicitTop = 8
        ExplicitWidth = 409
        ExplicitHeight = 95
        object rbPercentage: TUniRadioButton
          Left = 16
          Top = 16
          Width = 113
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Percentage'
          TabOrder = 0
          OnClick = rgOptionClick
        end
        object rbFlatMarkup: TUniRadioButton
          Left = 16
          Top = 64
          Width = 113
          Height = 17
          Hint = ''
          Caption = 'Flat Markup'
          TabOrder = 1
          OnClick = rgOptionClick
        end
        object chkCompounded: TUniCheckBox
          Left = 32
          Top = 40
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Compounded'
          TabOrder = 2
        end
      end
    end
    object PnlValueCarrier: TUniPanel
      Tag = 1999
      Left = 1
      Top = 111
      Width = 423
      Height = 25
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter1: TUniSplitter
        Left = 65
        Top = 0
        Width = 6
        Height = 25
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object PnlValueLeft: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 65
        Height = 23
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 0
        Caption = ''
        object lblRate: TUniLabel
          Left = 16
          Top = 4
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Rate'
          TabOrder = 1
        end
      end
      object PnlValueClient: TUniPanel
        Tag = 1999
        Left = 71
        Top = 1
        Width = 352
        Height = 23
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object lblPct: TUniLabel
          Left = 128
          Top = 4
          Width = 11
          Height = 13
          Hint = ''
          Caption = '%'
          TabOrder = 2
        end
        object edtValue: TUniEdit
          Left = 1
          Top = 1
          Width = 121
          Height = 21
          Hint = ''
          Text = ''
          TabOrder = 0
          OnExit = edtValueExit
        end
      end
    end
  end
  object PnlCheckBoxOptions: TUniPanel
    Left = 0
    Top = 136
    Width = 425
    Height = 34
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    ShowCaption = False
    Caption = ''
    object chkApplyToAll: TUniCheckBox
      Left = 16
      Top = 8
      Width = 153
      Height = 17
      Hint = ''
      Caption = 'Apply to all Sales Choices'
      TabOrder = 0
    end
  end
end

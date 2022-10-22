object FrmSPCCalcSampleCount: TFrmSPCCalcSampleCount
  Left = 0
  Top = 0
  ClientHeight = 150
  ClientWidth = 402
  Caption = ''
  OnShow = FormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 109
    Width = 402
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 192
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
  end
  object PnlClient01: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 402
    Height = 109
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 137
      Top = 0
      Width = 6
      Height = 109
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 137
      Height = 107
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 8
        Top = 11
        Width = 104
        Height = 13
        Hint = ''
        Caption = 'Confidence Percentile'
        TabOrder = 1
      end
      object Label2: TUniLabel
        Left = 8
        Top = 35
        Width = 95
        Height = 13
        Hint = ''
        Caption = 'Confidence Interval'
        TabOrder = 2
      end
      object Label3: TUniLabel
        Left = 8
        Top = 59
        Width = 50
        Height = 13
        Hint = ''
        Caption = 'Population'
        TabOrder = 3
      end
      object Label4: TUniLabel
        Left = 8
        Top = 83
        Width = 97
        Height = 13
        Hint = ''
        Caption = 'Sample Size (Result)'
        TabOrder = 4
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 143
      Top = 1
      Width = 259
      Height = 107
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object lblPercentSign: TUniLabel
        Left = 71
        Top = 35
        Width = 11
        Height = 13
        Hint = ''
        Caption = '%'
        TabOrder = 4
      end
      object edtConfidenceInterval: TUniEdit
        Left = 1
        Top = 32
        Width = 65
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
        OnChange = DoControlChange
        OnExit = edtConfidenceIntervalExit
      end
      object edtPopulation: TUniEdit
        Left = 1
        Top = 56
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
        OnChange = DoControlChange
        OnExit = edtPopulationExit
      end
      object edtResult: TUniEdit
        Left = 1
        Top = 80
        Width = 121
        Height = 21
        Hint = ''
        Alignment = taRightJustify
        Text = ''
        TabOrder = 3
        Color = clBtnFace
        ReadOnly = True
      end
      object cmbConfidencePercentile: TUniComboBox
        Left = 1
        Top = 8
        Width = 85
        Height = 21
        Hint = ''
        Style = csDropDownList
        Text = ''
        TabOrder = 5
        OnChange = DoControlChange
      end
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'cmbConfidencePercentile'
      'edtConfidenceInterval'
      'edtPopulation')
    SecurityCode = 'FRMSPCCALCSAMPLECOUNT'
    Left = 168
    Top = 88
  end
end

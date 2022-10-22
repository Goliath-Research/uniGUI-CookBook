object FrmShipmanPurgeBase: TFrmShipmanPurgeBase
  Left = 342
  Top = 245
  ClientHeight = 182
  ClientWidth = 409
  Caption = 'Purge'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 141
    Width = 409
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 200
      Top = 1
      Width = 209
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 0
        Default = True
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 104
        Top = 8
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
  object PnlMain: TUniPanel
    Tag = 1999
    Left = 0
    Top = 53
    Width = 409
    Height = 88
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 127
      Top = 0
      Width = 6
      Height = 88
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 127
      Height = 86
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblDate: TUniLabel
        Left = 16
        Top = 12
        Width = 82
        Height = 13
        Hint = ''
        Caption = 'Transaction Date'
        TabOrder = 1
      end
    end
    object PnlClient: TUniPanel
      Tag = 1999
      Left = 133
      Top = 1
      Width = 276
      Height = 86
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object lblSummary: TUniLabel
        Left = 1
        Top = 32
        Width = 12
        Height = 13
        Hint = ''
        Caption = '...'
        TabOrder = 2
      end
      object cmbDate: TUniDateTimePicker
        Left = 1
        Top = 8
        Width = 97
        Height = 21
        Hint = ''
        DateTime = 42669.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 0
        OnChange = cmbDateChange
      end
    end
  end
  object PnlPrompt: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 409
    Height = 53
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object lblPrompt: TUniLabel
      Left = 1
      Top = 1
      Width = 670
      Height = 13
      Hint = ''
      Caption = 
        'This screen allows you to purge data.  Records date on or before' +
        ' the date you select below will be deleted permanently from the ' +
        'database.'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
end

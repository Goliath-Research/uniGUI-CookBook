object FrmPMPromptTotalUnits: TFrmPMPromptTotalUnits
  Left = 537
  Top = 342
  ClientHeight = 118
  ClientWidth = 350
  Caption = 'Add Units'
  BorderStyle = bsDialog
  Position = poOwnerFormCenter
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 77
    Width = 350
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 140
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
    Width = 350
    Height = 77
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 113
      Top = 0
      Width = 6
      Height = 77
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 113
      Height = 75
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblUnitsToAdd: TUniLabel
        Left = 8
        Top = 12
        Width = 59
        Height = 13
        Hint = ''
        Caption = 'Units to Add'
        TabOrder = 1
      end
    end
    object PnlClient02: TUniPanel
      Tag = 1999
      Left = 119
      Top = 1
      Width = 231
      Height = 75
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object edtUnits: TUniEdit
        Left = 1
        Top = 8
        Width = 169
        Height = 21
        Hint = ''
        Text = '0'
        TabOrder = 0
        OnExit = edtUnitsExit
      end
      object chkUpdateTask: TUniCheckBox
        Left = 1
        Top = 40
        Width = 193
        Height = 17
        Hint = ''
        Caption = 'Update Task total units'
        TabOrder = 1
      end
    end
  end
end

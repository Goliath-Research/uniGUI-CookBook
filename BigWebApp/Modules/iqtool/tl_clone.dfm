object FrmTLClonePrompt: TFrmTLClonePrompt
  Left = 316
  Top = 244
  ClientHeight = 151
  ClientWidth = 387
  Caption = 'Clone Project'
  Constraints.MinHeight = 164
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  ActiveControl = edtProjectNumber
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtonCarrier: TUniPanel
    Left = 0
    Top = 110
    Width = 387
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 385
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object PnlButtons: TUniPanel
      Left = 171
      Top = 3
      Width = 215
      Height = 37
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 3
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        Default = True
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 110
        Top = 7
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlMain: TUniPanel
    Left = 0
    Top = 0
    Width = 387
    Height = 110
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter1: TUniSplitter
      Left = 92
      Top = 1
      Width = 6
      Height = 108
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlLeft01: TUniPanel
      Left = 1
      Top = 1
      Width = 91
      Height = 108
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Label5: TUniLabel
        Left = 8
        Top = 12
        Width = 69
        Height = 13
        Hint = ''
        Caption = 'New Project #'
        TabOrder = 1
      end
      object Label1: TUniLabel
        Left = 8
        Top = 36
        Width = 64
        Height = 13
        Hint = ''
        Caption = 'Project Name'
        TabOrder = 2
      end
    end
    object PnlClient01: TUniPanel
      Left = 98
      Top = 1
      Width = 288
      Height = 108
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        288
        108)
      object edtProjectNumber: TUniEdit
        Left = 1
        Top = 8
        Width = 137
        Height = 21
        Hint = ''
        CharCase = ecUpperCase
        MaxLength = 25
        Text = ''
        TabOrder = 0
      end
      object chkIncludeUDForm: TUniCheckBox
        Left = 1
        Top = 56
        Width = 284
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include User-Defined Form Information'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
      object chkIncludeInternalDocs: TUniCheckBox
        Left = 1
        Top = 72
        Width = 284
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include Internal Documents'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
      end
      object chkIncludeExternalDocs: TUniCheckBox
        Left = 1
        Top = 88
        Width = 284
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include External Documents'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
      end
      object edtProjectName: TUniEdit
        Left = 1
        Top = 32
        Width = 284
        Height = 21
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
  end
end

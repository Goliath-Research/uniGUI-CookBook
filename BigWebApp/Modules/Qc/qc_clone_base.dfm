object FrmWorkFlowCloneBase: TFrmWorkFlowCloneBase
  Left = 0
  Top = 0
  ClientHeight = 151
  ClientWidth = 343
  Caption = 'Clone Workflow'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 120
  TextHeight = 13
  object PnlButtonCarrier: TUniPanel
    Left = 0
    Top = 110
    Width = 343
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Bevel1: TUniPanel
      Left = 1
      Top = 1
      Width = 341
      Height = 2
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Caption = ''
    end
    object PnlButtons: TUniPanel
      Left = 128
      Top = 2
      Width = 215
      Height = 39
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
  object chkUDForm: TUniCheckBox
    Left = 19
    Top = 16
    Width = 209
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Include User Defined Form Information'
    TabOrder = 1
  end
  object chkExternalDocuments: TUniCheckBox
    Left = 19
    Top = 34
    Width = 167
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Include External Documents'
    TabOrder = 2
  end
  object chkEmailCorrespondence: TUniCheckBox
    Left = 19
    Top = 52
    Width = 167
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Include Email Correspondence'
    TabOrder = 3
  end
  object chkElementExternalDocuments: TUniCheckBox
    Left = 19
    Top = 71
    Width = 204
    Height = 17
    Hint = ''
    Checked = True
    Caption = 'Include Element External Documents'
    TabOrder = 4
  end
end

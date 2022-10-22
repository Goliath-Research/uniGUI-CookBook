object FrmPlmPromptClone: TFrmPlmPromptClone
  Left = 156
  Top = 135
  ClientHeight = 242
  ClientWidth = 363
  Caption = 'Clone Scenario'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  DesignSize = (
    363
    242)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 8
    Top = 6
    Width = 348
    Height = 197
    Hint = ''
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
  end
  object Label1: TUniLabel
    Left = 17
    Top = 19
    Width = 98
    Height = 13
    Hint = ''
    Caption = 'New Scenario Name '
    TabOrder = 3
  end
  object Label2: TUniLabel
    Left = 17
    Top = 44
    Width = 97
    Height = 13
    Hint = ''
    Caption = 'Scenario Description'
    TabOrder = 12
  end
  object edName: TUniEdit
    Left = 124
    Top = 15
    Width = 213
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object edDescrip: TUniEdit
    Left = 124
    Top = 40
    Width = 213
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object btnOK: TUniButton
    Left = 154
    Top = 211
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    Anchors = [akRight, akBottom]
    TabOrder = 13
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 257
    Top = 211
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    Anchors = [akRight, akBottom]
    TabOrder = 14
  end
  object chkIncludeDetail: TUniCheckBox
    Left = 124
    Top = 67
    Width = 149
    Height = 17
    Hint = ''
    Caption = 'Include Detail Information'
    TabOrder = 4
  end
  object chkIncludeNotes: TUniCheckBox
    Left = 124
    Top = 83
    Width = 97
    Height = 17
    Hint = ''
    Caption = 'Include Notes'
    TabOrder = 5
  end
  object chkIncludeInternalDocs: TUniCheckBox
    Left = 124
    Top = 115
    Width = 181
    Height = 17
    Hint = ''
    Caption = 'Include Item Internal Documents'
    TabOrder = 6
  end
  object chkIncludeExternalDocs: TUniCheckBox
    Left = 124
    Top = 131
    Width = 181
    Height = 17
    Hint = ''
    Caption = 'Include Item External Documents'
    TabOrder = 7
  end
  object chkIncludeEmail: TUniCheckBox
    Left = 124
    Top = 147
    Width = 197
    Height = 17
    Hint = ''
    Caption = 'Include Item Email Correspondence'
    TabOrder = 8
  end
  object chkIncludeUserFields: TUniCheckBox
    Left = 124
    Top = 163
    Width = 122
    Height = 17
    Hint = ''
    Caption = 'Include User Fields'
    TabOrder = 9
  end
  object chkIncludeUDForm: TUniCheckBox
    Left = 124
    Top = 179
    Width = 149
    Height = 17
    Hint = ''
    Caption = 'Include User Defined Form'
    TabOrder = 10
  end
  object chkIncludeIdeas: TUniCheckBox
    Left = 124
    Top = 99
    Width = 97
    Height = 17
    Hint = ''
    Caption = 'Include Ideas'
    TabOrder = 11
  end
end

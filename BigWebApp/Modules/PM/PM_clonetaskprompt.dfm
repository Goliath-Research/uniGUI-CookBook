object FrmCloneTaskPrompt: TFrmCloneTaskPrompt
  Left = 0
  Top = 0
  ClientHeight = 212
  ClientWidth = 554
  Caption = 'Clone Task'
  OnShow = FormShow
  Position = poOwnerFormCenter
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 171
    Width = 554
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 344
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
    Width = 554
    Height = 171
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 145
      Top = 0
      Width = 6
      Height = 171
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object PnlHeaderEditLeft: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 145
      Height = 169
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object lblTask: TUniLabel
        Left = 8
        Top = 11
        Width = 62
        Height = 13
        Hint = ''
        Caption = 'Current Task'
        TabOrder = 1
      end
      object lblDescription: TUniLabel
        Left = 8
        Top = 35
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'New Task'
        TabOrder = 2
      end
      object Label1: TUniLabel
        Left = 8
        Top = 59
        Width = 77
        Height = 13
        Hint = ''
        Caption = 'New Description'
        TabOrder = 3
      end
    end
    object PnlHeaderEdit: TUniPanel
      Tag = 1999
      Left = 151
      Top = 1
      Width = 403
      Height = 169
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      DesignSize = (
        403
        169)
      object chkIncludeSkills: TUniCheckBox
        Left = 1
        Top = 88
        Width = 89
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include Skills'
        TabOrder = 3
      end
      object chkIncludeInternalDocs: TUniCheckBox
        Left = 1
        Top = 104
        Width = 153
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include Internal Documents'
        TabOrder = 4
      end
      object chkIncludeExternalDocs: TUniCheckBox
        Left = 1
        Top = 120
        Width = 153
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include External Documents'
        TabOrder = 5
      end
      object chkIncludeEMailCorr: TUniCheckBox
        Left = 1
        Top = 136
        Width = 172
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Include EMail Correspondence'
        TabOrder = 6
      end
      object edtCurrentTask: TUniEdit
        Left = 1
        Top = 8
        Width = 185
        Height = 21
        Hint = ''
        Text = 'edtCurrentTask'
        TabOrder = 0
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
      end
      object edtNewTask: TUniEdit
        Left = 1
        Top = 32
        Width = 185
        Height = 21
        Hint = ''
        Text = 'edtNewTask'
        TabOrder = 1
      end
      object edtNewTaskDescription: TUniEdit
        Left = 1
        Top = 56
        Width = 390
        Height = 21
        Hint = ''
        Text = 'edtNewTaskDescription'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
  end
end

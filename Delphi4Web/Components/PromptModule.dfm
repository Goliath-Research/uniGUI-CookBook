object PromptModuleForm: TPromptModuleForm
  Left = 0
  Top = 0
  ClientHeight = 196
  ClientWidth = 558
  Caption = 'Please Enter Module Properties'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = UniFormClose
  MonitoredKeys.Keys = <>
  ActiveControl = UniComboBox1
  OnBeforeShow = UniFormBeforeShow
  DesignSize = (
    558
    196)
  PixelsPerInch = 96
  TextHeight = 13
  object UniFieldSet1: TUniFieldSet
    Left = 0
    Top = 0
    Width = 558
    Height = 155
    Hint = ''
    Title = 'Module'
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitHeight = 217
    object UniComboBox1: TUniComboBox
      Left = 80
      Top = 24
      Width = 145
      Hint = ''
      Text = 'UniComboBox1'
      TabOrder = 2
      FieldLabel = 'Module Category'
    end
    object UniEdit1: TUniEdit
      Left = 80
      Top = 52
      Width = 121
      Hint = ''
      Text = 'UniEdit1'
      TabOrder = 1
      FieldLabel = 'Module Name'
    end
  end
  object UniButton1: TUniButton
    Left = 475
    Top = 163
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'OK'
    ModalResult = 1
    Anchors = [akRight, akBottom]
    TabOrder = 1
    ExplicitTop = 225
  end
  object UniButton2: TUniButton
    Left = 8
    Top = 163
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    ExplicitTop = 225
  end
end

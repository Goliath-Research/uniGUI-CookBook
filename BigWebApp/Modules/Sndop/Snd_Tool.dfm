object FrmSndopTool: TFrmSndopTool
  Left = 333
  Top = 235
  ClientHeight = 333
  ClientWidth = 654
  Caption = 'Tool'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
  end
  object wwDBGridTool: TIQUniGridControl
    Left = 0
    Top = 3
    Width = 654
    Height = 330
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 437
    IQComponents.Grid.Height = 244
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SndDM.SrcSndop_PmEqmt
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SndDM.SrcSndop_PmEqmt
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 437
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 244
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SndDM.SrcSndop_PmEqmt
    Columns = <
      item
        FieldName = 'Eqno'
        Title.Caption = 'Tool Eq #'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Location'
        Title.Caption = 'Location'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'IS_PRIMARY'
        Title.Caption = 'Primary'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end>
    Marker = 0
  end
  object wwDBComboBoxToolEqNo: TUniDBComboBox
    Left = 179
    Top = 115
    Width = 121
    Height = 21
    Hint = ''
    Style = csDropDownList
    TabOrder = 1
    OnDropDown = wwDBComboBoxToolEqNoDropDown
  end
end

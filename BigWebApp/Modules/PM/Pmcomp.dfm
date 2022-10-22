object FrmPMComponents: TFrmPMComponents
  Left = 421
  Top = 276
  HelpContext = 1000664
  ClientHeight = 207
  ClientWidth = 265
  Caption = 'Components'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 265
    Height = 207
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitTop = 27
    ExplicitHeight = 180
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 263
      Height = 205
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 46
      IQComponents.Grid.Height = 119
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcPMComponents
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
      IQComponents.Navigator.DataSource = SrcPMComponents
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 46
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 119
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 92
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 121
      DataSource = SrcPMComponents
      Columns = <
        item
          FieldName = 'QTY'
          Title.Caption = 'Quantity'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NOTES'
          Title.Caption = 'Comment'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitHeight = 178
      Marker = 0
    end
  end
  object SrcPMComponents: TDataSource
    DataSet = TblPMComponents
    Left = 96
    Top = 75
  end
  object TblPMComponents: TFDTable
    Active = True
    BeforePost = TblPMComponentsBeforePost
    OnNewRecord = TblPMComponentsNewRecord
    IndexFieldNames = 'ID;PMEQMT_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PM_COMPONENTS'
    TableName = 'PM_COMPONENTS'
    Left = 104
    Top = 83
    object TblPMComponentsQTY: TBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QTY'
      Size = 0
    end
    object TblPMComponentsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 24
      FieldName = 'DESCRIP'
      Size = 35
    end
    object TblPMComponentsNOTES: TStringField
      DisplayLabel = 'Comment'
      DisplayWidth = 35
      FieldName = 'NOTES'
      Size = 255
    end
    object TblPMComponentsID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblPMComponentsPMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 176
    Top = 83
    object Help1: TUniMenuItem
      Caption = 'Help'
      ShortCut = 112
      OnClick = Help1Click
    end
  end
end

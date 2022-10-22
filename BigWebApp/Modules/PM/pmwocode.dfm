object FrmPMCode: TFrmPMCode
  Left = 421
  Top = 276
  HelpContext = 1000536
  ClientHeight = 207
  ClientWidth = 404
  Caption = 'MRO Work Order Detail Codes'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 404
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
      Width = 402
      Height = 205
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 185
      IQComponents.Grid.Height = 119
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcCode
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
      IQComponents.Navigator.DataSource = SrcCode
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 185
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
      DataSource = SrcCode
      Columns = <
        item
          FieldName = 'NAME'
          Title.Caption = 'Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitHeight = 178
      Marker = 0
    end
  end
  object SrcCode: TDataSource
    DataSet = TblCode
    Left = 112
    Top = 59
  end
  object TblCode: TFDTable
    BeforePost = TblCodeBeforePost
    OnNewRecord = TblCodeBeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PM_WO_DTL_CODE'
    TableName = 'PM_WO_DTL_CODE'
    Left = 120
    Top = 72
    object TblCodeNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 10
      FieldName = 'NAME'
      Size = 35
    end
    object TblCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 255
    end
    object TblCodeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object PMain: TUniPopupMenu
    Left = 176
    Top = 67
    object Help1: TUniMenuItem
      Caption = 'Help'
      ShortCut = 112
      OnClick = Help1Click
    end
  end
end

object FrmWorkCenterPkList: TFrmWorkCenterPkList
  Left = 253
  Top = 168
  ClientHeight = 251
  ClientWidth = 476
  Caption = 'Work Center PickList'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 476
    Height = 212
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 259
    IQComponents.Grid.Height = 126
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = wwDataSource1
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
    IQComponents.Navigator.DataSource = wwDataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 259
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 126
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'EQNO'
        Title.Caption = 'Work Center #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CNTR_DESC'
        Title.Caption = 'Center Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFG_TYPE'
        Title.Caption = 'Mfg Type'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGCELL'
        Title.Caption = 'Mfg Cell'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 212
    Width = 476
    Height = 39
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      476
      39)
    object btnOK: TUniButton
      Left = 297
      Top = 7
      Width = 75
      Height = 25
      Hint = ''
      Caption = '&OK'
      ModalResult = 1
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object btnCancel: TUniButton
      Left = 388
      Top = 7
      Width = 75
      Height = 25
      Hint = ''
      Caption = '&Cancel'
      Cancel = True
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 88
    Top = 96
  end
  object wwQuery1: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, eqno, cntr_desc, mfg_type, mfgcell, eplant_id'
      '  from work_center')
    Left = 88
    Top = 116
    object wwQuery1EQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 12
      FieldName = 'EQNO'
      Origin = 'WORK_CENTER.EQNO'
      Size = 60
    end
    object wwQuery1CNTR_DESC: TStringField
      DisplayLabel = 'Center Description'
      DisplayWidth = 35
      FieldName = 'CNTR_DESC'
      Origin = 'CNTR_DESC'
      FixedChar = True
      Size = 250
    end
    object wwQuery1MFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Origin = 'WORK_CENTER.MFG_TYPE'
      Size = 10
    end
    object wwQuery1MFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 12
      FieldName = 'MFGCELL'
      Origin = 'WORK_CENTER.MFGCELL'
      Size = 15
    end
    object wwQuery1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'WORK_CENTER.EPLANT_ID'
      Size = 0
    end
    object wwQuery1ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'WORK_CENTER.ID'
      Visible = False
      Size = 0
    end
  end
end

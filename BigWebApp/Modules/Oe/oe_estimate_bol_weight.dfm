object FrmEstimateBOLWeight: TFrmEstimateBOLWeight
  Left = 166
  Top = 163
  ClientHeight = 211
  ClientWidth = 609
  Caption = 'BOL Weight'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
  end
  object wwDBGridBolItem: TIQUniGridControl
    Left = 0
    Top = 28
    Width = 609
    Height = 183
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 392
    IQComponents.Grid.Height = 97
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcEstimate_Bol_Item
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
    IQComponents.Navigator.DataSource = SrcEstimate_Bol_Item
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 392
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 97
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcEstimate_Bol_Item
    Columns = <
      item
        FieldName = 'ItemNo'
        Title.Caption = 'Item #'
        Width = 168
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Descrip'
        Title.Caption = 'Description'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY'
        Title.Caption = 'Qty'
        Width = 77
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NET_WEIGHT'
        Title.Caption = 'Net Weight'
        Width = 77
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TARE_WEIGHT'
        Title.Caption = 'Tare Weight'
        Width = 84
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDBComboDlgItemNo: TUniEdit
    Left = 111
    Top = 34
    Width = 145
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object SrcEstimate_Bol_Item: TDataSource
    DataSet = TblEstimate_Bol_Item
    OnDataChange = SrcEstimate_Bol_ItemDataChange
    Left = 23
    Top = 118
  end
  object TblEstimate_Bol_Item: TFDTable
    AfterOpen = TblEstimate_Bol_ItemAfterOpen
    BeforePost = TblEstimate_Bol_ItemBeforePost
    AfterPost = TblEstimate_Bol_ItemAfterPost
    AfterDelete = TblEstimate_Bol_ItemAfterPost
    OnCalcFields = TblEstimate_Bol_ItemCalcFields
    OnNewRecord = TblEstimate_Bol_ItemNewRecord
    IndexFieldNames = 'ESTIMATE_BOL_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ESTIMATE_BOL_ITEM'
    TableName = 'ESTIMATE_BOL_ITEM'
    Left = 23
    Top = 165
    object TblEstimate_Bol_ItemItemNo: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 24
      FieldKind = fkCalculated
      FieldName = 'ItemNo'
      Required = True
      Size = 25
      Calculated = True
    end
    object TblEstimate_Bol_ItemDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      ReadOnly = True
      Size = 35
      Calculated = True
    end
    object TblEstimate_Bol_ItemQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 11
      FieldName = 'QTY'
      Size = 6
    end
    object TblEstimate_Bol_ItemNET_WEIGHT: TFMTBCDField
      DisplayLabel = 'Net Weight'
      DisplayWidth = 11
      FieldName = 'NET_WEIGHT'
      Size = 6
    end
    object TblEstimate_Bol_ItemTARE_WEIGHT: TFMTBCDField
      DisplayLabel = 'Tare Weight'
      DisplayWidth = 12
      FieldName = 'TARE_WEIGHT'
      Size = 6
    end
    object TblEstimate_Bol_ItemARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object TblEstimate_Bol_ItemID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblEstimate_Bol_ItemClass: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Class'
      Visible = False
      Calculated = True
    end
    object TblEstimate_Bol_ItemESTIMATE_BOL_ID: TBCDField
      FieldName = 'ESTIMATE_BOL_ID'
      Required = True
      Visible = False
      Size = 0
    end
  end
  object PkArinvt: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       itemno,'
      '       descrip,'
      '       descrip2,'
      '       class,'
      '       rev,'
      '       pk_weight'
      '  from arinvt'
      ' where class = '#39'PK'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 240
    Top = 141
    object PkArinvtID: TFloatField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      Visible = False
    end
    object PkArinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 35
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object PkArinvtREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object PkArinvtPK_WEIGHT: TFloatField
      DisplayLabel = 'Weight'
      FieldName = 'PK_WEIGHT'
      Origin = 'IQ.ARINVT.PK_WEIGHT'
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 115
    Top = 125
  end
  object QryArinvt: TFDQuery
    Tag = 1
    MasterSource = SrcEstimate_Bol_Item
    MasterFields = 'ARINVT_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select itemno,'
      '       descrip,'
      '       descrip2,'
      '       class,'
      '       rev,'
      '       is_pallet'
      '  from arinvt'
      ' where id = :arinvt_id')
    Left = 116
    Top = 157
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 1481410000c
      end>
    object QryArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object QryArinvtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object QryArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object QryArinvtIS_PALLET: TStringField
      DisplayLabel = 'Pallet'
      FieldName = 'IS_PALLET'
      Origin = 'IQ.ARINVT.IS_PALLET'
      FixedChar = True
      Size = 1
    end
  end
end

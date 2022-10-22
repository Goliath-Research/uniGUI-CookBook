object FrmBOLWeight: TFrmBOLWeight
  Left = 166
  Top = 163
  ClientHeight = 211
  ClientWidth = 609
  Caption = 'BOL Weight'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object wwDBGridBolItem: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 609
    Height = 211
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 392
    IQComponents.Grid.Height = 125
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcShipment_Bol_Item
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
    IQComponents.Navigator.DataSource = SrcShipment_Bol_Item
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 392
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 125
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 97
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 126
    DataSource = SrcShipment_Bol_Item
    Columns = <
      item
        FieldName = 'ItemNo'
        Title.Caption = 'Item #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Descrip'
        Title.Caption = 'Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY'
        Title.Caption = 'Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NET_WEIGHT'
        Title.Caption = 'Net Weight'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TARE_WEIGHT'
        Title.Caption = 'Tare Weight'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    ExplicitTop = 28
    ExplicitHeight = 183
    Marker = 0
  end
  object wwDBComboDlgItemNo: TUniEdit
    Left = 15
    Top = 66
    Width = 145
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object wwExpandButtonDescrip: TwwExpandButton
    Left = 151
    Top = 143
    Width = 214
    Height = 16
    DisableThemes = False
    OnAfterExpand = wwExpandButtonDescripAfterExpand
    Caption = 'wwExpandButtonDescrip'
    ShowText = True
    TabOrder = 2
  end
  object wwDataInspectorExpandItem: TwwDataInspector
    Left = 248
    Top = 45
    Width = 345
    Height = 66
    DisableThemes = False
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    DataSource = SrcArinvt
    Items = <
      item
        DataSource = SrcArinvt
        DataField = 'CLASS'
        Caption = 'Class'
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        DataField = 'REV'
        Caption = 'Rev'
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        DataField = 'DESCRIP2'
        Caption = 'Ext Description'
        WordWrap = False
      end
      item
        DataSource = SrcArinvt
        DataField = 'IS_PALLET'
        Caption = 'Pallet'
        PickList.Items.Strings = (
          'Y'
          'N')
        PickList.DisplayAsCheckbox = True
        WordWrap = False
      end>
    CaptionWidth = 104
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
    Visible = False
  end
  object SrcShipment_Bol_Item: TDataSource
    DataSet = TblShipment_Bol_Item
    OnDataChange = SrcShipment_Bol_ItemDataChange
    Left = 23
    Top = 150
  end
  object TblShipment_Bol_Item: TFDTable
    AfterOpen = TblShipment_Bol_ItemAfterOpen
    BeforePost = TblShipment_Bol_ItemBeforePost
    AfterPost = TblShipment_Bol_ItemAfterPost
    AfterDelete = TblShipment_Bol_ItemAfterPost
    OnCalcFields = TblShipment_Bol_ItemCalcFields
    OnNewRecord = TblShipment_Bol_ItemNewRecord
    IndexFieldNames = 'SHIPMENT_BOL_ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SHIPMENT_BOL_ITEM'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'SHIPMENT_BOL_ITEM'
    Left = 23
    Top = 166
    object TblShipment_Bol_ItemItemNo: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 24
      FieldKind = fkCalculated
      FieldName = 'ItemNo'
      Required = True
      Size = 25
      Calculated = True
    end
    object TblShipment_Bol_ItemDescrip: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'Descrip'
      ReadOnly = True
      Size = 35
      Calculated = True
    end
    object TblShipment_Bol_ItemQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 11
      FieldName = 'QTY'
      Size = 6
    end
    object TblShipment_Bol_ItemNET_WEIGHT: TFMTBCDField
      DisplayLabel = 'Net Weight'
      DisplayWidth = 11
      FieldName = 'NET_WEIGHT'
      Size = 6
    end
    object TblShipment_Bol_ItemTARE_WEIGHT: TFMTBCDField
      DisplayLabel = 'Tare Weight'
      DisplayWidth = 12
      FieldName = 'TARE_WEIGHT'
      Size = 6
    end
    object TblShipment_Bol_ItemARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object TblShipment_Bol_ItemID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblShipment_Bol_ItemSHIPMENT_BOL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIPMENT_BOL_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblShipment_Bol_ItemClass: TStringField
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'Class'
      Visible = False
      Calculated = True
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
      '  from arinvt')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 56
    Top = 149
    object PkArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      Visible = False
      Size = 0
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
      Size = 100
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
    object PkArinvtPK_WEIGHT: TFMTBCDField
      DisplayLabel = 'Weight'
      FieldName = 'PK_WEIGHT'
      Origin = 'IQ.ARINVT.PK_WEIGHT'
      Size = 6
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 91
    Top = 149
  end
  object QryArinvt: TFDQuery
    Tag = 1
    MasterSource = SrcShipment_Bol_Item
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
    Left = 92
    Top = 165
    ParamData = <
      item
        Name = 'ARINVT_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
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

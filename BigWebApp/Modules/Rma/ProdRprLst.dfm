object FrmProdRepairList: TFrmProdRepairList
  Left = 262
  Top = 169
  HelpContext = 1073048
  ClientHeight = 407
  ClientWidth = 649
  Caption = 'Product Code Repair List'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 177
    Width = 649
    Height = 4
    Cursor = crVSplit
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object PnlDetail: TUniPanel
    Tag = 1999
    Left = 0
    Top = 181
    Width = 649
    Height = 226
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Bevel3: TUniPanel
      Left = 1
      Top = 59
      Width = 647
      Height = 4
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Caption = ''
    end
    object Panel2: TUniPanel
      Tag = 1999
      Left = 1
      Top = 1
      Width = 647
      Height = 58
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Panel5: TUniPanel
        Tag = 1999
        Left = 1
        Top = 1
        Width = 645
        Height = 25
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 0
        Caption = ''
        Color = clBtnShadow
        object Label1: TUniLabel
          Left = 1
          Top = 1
          Width = 94
          Height = 13
          Hint = ''
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Inventory Items'
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object Panel15: TUniPanel
        Tag = 1999
        Left = 1
        Top = 26
        Width = 645
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
      end
    end
    object PnlGridDetail: TUniPanel
      Tag = 1999
      Left = 1
      Top = 63
      Width = 647
      Height = 162
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object wwDBGrid1: TIQUniGridControl
        Left = 1
        Top = 1
        Width = 645
        Height = 160
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 428
        IQComponents.Grid.Height = 74
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrclRepairItemList
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
        IQComponents.Navigator.DataSource = SrclRepairItemList
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.Navigator.BeforeAction = DBNavigator1BeforeAction
        IQComponents.HiddenPanel.Left = 428
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 74
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrclRepairItemList
        Columns = <
          item
            FieldName = 'ItemNo'
            Title.Caption = 'Item #'
            Width = 175
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Description'
            Title.Caption = 'Description'
            Width = 245
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Class'
            Title.Caption = 'Class'
            Width = 28
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Rev'
            Title.Caption = 'Revision'
            Width = 49
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'QTY'
            Title.Caption = 'Quantity'
            Width = 70
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'Descrip2'
            Title.Caption = 'Ext. Description'
            Width = 140
            ReadOnly = True
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object wwDBComboBoxItemNo: TUniDBComboBox
        Left = 121
        Top = 25
        Width = 149
        Height = 24
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        TabOrder = 0
        ReadOnly = True
        OnDropDown = wwDBComboBoxItemNoDropDown
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 649
    Height = 177
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 432
    IQComponents.Grid.Height = 91
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcProdCode
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
    IQComponents.Navigator.DataSource = SrcProdCode
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 432
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 91
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcProdCode
    Columns = <
      item
        FieldName = 'CODE'
        Title.Caption = 'Code #'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object SrcProdCode: TDataSource
    DataSet = QryProdCode
    Left = 55
    Top = 74
  end
  object QryProdCode: TFDQuery
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       code,'
      '       descrip'
      '  from prod_code'
      ' ')
    Left = 56
    Top = 89
    object QryProdCodeCODE: TStringField
      DisplayLabel = 'Code #'
      DisplayWidth = 25
      FieldName = 'CODE'
      Origin = 'PROD_CODE.CODE'
      Size = 25
    end
    object QryProdCodeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'PROD_CODE.DESCRIP'
      Size = 35
    end
    object QryProdCodeID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PROD_CODE.ID'
      Visible = False
      Size = 0
    end
  end
  object SrclRepairItemList: TDataSource
    DataSet = TblRepairItemList
    Left = 107
    Top = 75
  end
  object TblRepairItemList: TFDTable
    BeforePost = TblRepairItemListBeforePost
    IndexFieldNames = 'PROD_CODE_ID'
    MasterSource = SrcProdCode
    MasterFields = 'ID'
    ConnectionName = 'IQFD'
    UpdateOptions.UpdateTableName = 'REPAIR_ITEM_LIST'
    TableName = 'REPAIR_ITEM_LIST'
    Left = 107
    Top = 89
    object TblRepairItemListItemNo: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'ItemNo'
      LookupDataSet = PkArinvt
      LookupKeyFields = 'ID'
      LookupResultField = 'ITEMNO'
      KeyFields = 'ARINVT_ID'
      LookupCache = True
      Size = 25
      Lookup = True
    end
    object TblRepairItemListDescription: TStringField
      DisplayWidth = 35
      FieldKind = fkLookup
      FieldName = 'Description'
      LookupDataSet = PkArinvt
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'ARINVT_ID'
      LookupCache = True
      ReadOnly = True
      Size = 35
      Lookup = True
    end
    object TblRepairItemListClass: TStringField
      DisplayWidth = 4
      FieldKind = fkLookup
      FieldName = 'Class'
      LookupDataSet = PkArinvt
      LookupKeyFields = 'ID'
      LookupResultField = 'CLASS'
      KeyFields = 'ARINVT_ID'
      LookupCache = True
      ReadOnly = True
      Size = 2
      Lookup = True
    end
    object TblRepairItemListRev: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 7
      FieldKind = fkLookup
      FieldName = 'Rev'
      LookupDataSet = PkArinvt
      LookupKeyFields = 'ID'
      LookupResultField = 'REV'
      KeyFields = 'ARINVT_ID'
      LookupCache = True
      ReadOnly = True
      Lookup = True
    end
    object TblRepairItemListQTY: TFMTBCDField
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QTY'
      LookupCache = True
      Size = 6
    end
    object TblRepairItemListDescrip2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldKind = fkLookup
      FieldName = 'Descrip2'
      LookupDataSet = PkArinvt
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP2'
      KeyFields = 'ARINVT_ID'
      LookupCache = True
      ReadOnly = True
      Size = 100
      Lookup = True
    end
    object TblRepairItemListID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      LookupCache = True
      Visible = False
      Size = 0
    end
    object TblRepairItemListPROD_CODE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PROD_CODE_ID'
      LookupCache = True
      Visible = False
      Size = 0
    end
    object TblRepairItemListARINVT_ID: TBCDField
      DisplayLabel = 'Item #'
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      LookupCache = True
      Required = True
      Visible = False
      Size = 0
    end
  end
  object PkArinvt: TIQWebHpick
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select id, '
      '       itemno,'
      '       descrip,'
      '       rev,'
      '       class,'
      '       descrip2,'
      '       eplant_id'
      '  from arinvt'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 144
    Top = 89
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
    object PkArinvtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object PkArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.ARINVT.EPLANT_ID'
      Size = 0
    end
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'TblRepairItemList')
    SecurityCode = 'FRMPRODREPAIRLIST'
    Left = 213
    Top = 90
  end
end

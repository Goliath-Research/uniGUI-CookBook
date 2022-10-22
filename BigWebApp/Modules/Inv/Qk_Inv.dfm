inherited QuickAddRawArinvt: TQuickAddRawArinvt
  Left = 238
  Top = 162
  HelpContext = 1032371
  ClientHeight = 302
  ClientWidth = 396
  Caption = 'Quick Add '
  ExplicitWidth = 412
  ExplicitHeight = 341
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Top = 263
    Width = 396
    ExplicitTop = 263
    ExplicitWidth = 396
    inherited Panel2: TUniPanel
      Left = 186
      Width = 210
      ExplicitLeft = 186
      ExplicitWidth = 210
    end
  end
  inherited PageControl1: TUniPageControl
    Width = 396
    Height = 263
    ActivePage = TabCostElem
    OnChange = PageControl1Change
    ExplicitWidth = 396
    ExplicitHeight = 263
    inherited TabSheet1: TUniTabSheet
      Caption = 'New Material'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 388
      ExplicitHeight = 235
      object Panel3: TUniPanel
        Left = 0
        Top = 204
        Width = 388
        Height = 31
        Hint = ''
        Align = alBottom
        Anchors = [akLeft, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        DesignSize = (
          388
          31)
        object chkNonMaterial: TUniDBCheckBox
          Left = 8
          Top = 8
          Width = 385
          Height = 18
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataField = 'NON_MATERIAL'
          DataSource = DataSource1
          ValueChecked = 'Y'
          ValueUnchecked = 'N'
          Caption = 'Non-Material'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object PnlClient01: TUniPanel
        Left = 0
        Top = 0
        Width = 388
        Height = 204
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Caption = ''
        object Splitter1: TUniSplitter
          Left = 102
          Top = 0
          Width = 6
          Height = 204
          Hint = ''
          Align = alLeft
          ParentColor = False
          Color = clBtnFace
        end
        object PnlLeft01: TUniPanel
          Left = 1
          Top = 1
          Width = 102
          Height = 202
          Hint = ''
          Align = alLeft
          Anchors = [akLeft, akTop, akBottom]
          TabOrder = 0
          Caption = ''
          object Label1: TUniLabel
            Left = 8
            Top = 27
            Width = 59
            Height = 13
            Hint = ''
            AutoSize = False
            Caption = 'Class'
            TabOrder = 1
          end
          object Label2: TUniLabel
            Left = 8
            Top = 51
            Width = 59
            Height = 13
            Hint = ''
            AutoSize = False
            Caption = 'Item #'
            TabOrder = 2
          end
          object Label3: TUniLabel
            Left = 8
            Top = 75
            Width = 59
            Height = 13
            Hint = ''
            AutoSize = False
            Caption = 'Revision'
            TabOrder = 3
          end
          object Label4: TUniLabel
            Left = 8
            Top = 99
            Width = 59
            Height = 13
            Hint = ''
            AutoSize = False
            Caption = 'Description'
            TabOrder = 4
          end
          object Label5: TUniLabel
            Left = 8
            Top = 147
            Width = 59
            Height = 13
            Hint = ''
            AutoSize = False
            Caption = 'Unit'
            TabOrder = 5
          end
          object Label9: TUniLabel
            Left = 8
            Top = 171
            Width = 50
            Height = 13
            Hint = ''
            Caption = 'Lead Days'
            TabOrder = 6
          end
          object lblExtendedDescription: TUniLabel
            Left = 8
            Top = 123
            Width = 72
            Height = 13
            Hint = ''
            Caption = 'Ext Description'
            TabOrder = 7
          end
        end
        object PnlClient02: TUniPanel
          Left = 108
          Top = 1
          Width = 280
          Height = 202
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          Caption = ''
          DesignSize = (
            280
            202)
          object dbcCLASS: TUniDBComboBox
            Left = 1
            Top = 24
            Width = 48
            Height = 21
            Hint = ''
            DataField = 'CLASS'
            DataSource = DataSource1
            Items.Strings = (
              'IN'
              'PL'
              'PK')
            TabOrder = 0
          end
          object EditITEMNO: TUniDBEdit
            Left = 1
            Top = 48
            Width = 279
            Height = 21
            Hint = ''
            DataField = 'ITEMNO'
            DataSource = DataSource1
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object EditREV: TUniDBEdit
            Left = 1
            Top = 72
            Width = 279
            Height = 21
            Hint = ''
            DataField = 'REV'
            DataSource = DataSource1
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object EditDESCRIP: TUniDBEdit
            Left = 1
            Top = 96
            Width = 279
            Height = 21
            Hint = ''
            DataField = 'DESCRIP'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 3
          end
          object dbcUNIT: TUniDBComboBox
            Left = 1
            Top = 144
            Width = 279
            Height = 21
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'UNIT'
            DataSource = DataSource1
            Style = csDropDownList
            Items.Strings = (
              'EACH'
              'LBS'
              'GAL'
              'ROLL'
              'FT'
              'IN')
            TabOrder = 5
          end
          object dbeLeadTime: TUniDBEdit
            Left = 1
            Top = 168
            Width = 279
            Height = 21
            Hint = ''
            ShowHint = True
            ParentShowHint = False
            DataField = 'LEAD_DAYS'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
          end
          object chkBlend: TUniCheckBox
            Left = 1
            Top = 1
            Width = 290
            Height = 17
            Hint = ''
            Caption = 'Blend'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
          end
          object dbeExtDescription: TUniDBEdit
            Left = 1
            Top = 120
            Width = 279
            Height = 21
            Hint = ''
            DataField = 'DESCRIP2'
            DataSource = DataSource1
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
        end
      end
    end
    object TabVendor: TUniTabSheet
      Hint = ''
      ImageIndex = 1
      Caption = 'Vendor'
      object wwDBGrid1: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 388
        Height = 235
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 171
        IQComponents.Grid.Height = 149
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = wwSrcArinvt_Vendors
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
        IQComponents.Navigator.DataSource = wwSrcArinvt_Vendors
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 171
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 149
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = wwSrcArinvt_Vendors
        Columns = <
          item
            FieldName = 'VendorNo'
            Title.Caption = 'Vendor #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VendorCompany'
            Title.Caption = 'Vendor Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VEND_ITEMNO'
            Title.Caption = 'AKA Item #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'VEND_DESCRIP'
            Title.Caption = 'AKA Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
      object wwDBComboDlgVendor: TUniEdit
        Left = 48
        Top = 49
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 1
      end
    end
    object TabCostElem: TUniTabSheet
      Hint = ''
      ImageIndex = 2
      Caption = 'Standard Cost'
      object pnlStdCostGrid: TUniPanel
        Left = 0
        Top = 0
        Width = 388
        Height = 235
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object Panel9: TUniPanel
          Tag = 1999
          Left = 1
          Top = 1
          Width = 386
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = ''
        end
        object wwDBGridCostElem: TIQUniGridControl
          Left = 1
          Top = 27
          Width = 386
          Height = 208
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 169
          IQComponents.Grid.Height = 122
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcArinvt_Elements
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
          IQComponents.Navigator.DataSource = SrcArinvt_Elements
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 169
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 122
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcArinvt_Elements
          Columns = <
            item
              FieldName = 'Description'
              Title.Caption = 'Description'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'STD_COST'
              Title.Caption = 'Cost'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DEFAULT_COST_ELEMENT'
              Title.Caption = 'Default'
              Width = 64
              CheckBoxField.FieldValues = 'Y;N'
            end
            item
              FieldName = 'ADD_TO_ROLLUP'
              Title.Caption = 'Add To Roll Up'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object comboElement: TUniDBLookupComboBox
          Left = 16
          Top = 72
          Width = 121
          Height = 21
          Hint = ''
          ListField = 'ELEM_DESCRIP'
          ListSource = SrcElements
          ListFieldIndex = 0
          TabOrder = 2
          Color = clWindow
        end
        object wwDBEAdd_To_Rollup: TUniDBEdit
          Left = 16
          Top = 99
          Width = 121
          Height = 21
          Hint = 'Add to rolled up value during Standard Cost calculations'
          ShowHint = True
          ParentShowHint = False
          TabOrder = 3
        end
      end
    end
  end
  inherited Table1: TFDTable
    IndexFieldNames = 'ID'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.UpdateTableName = 'ARINVT'
    UpdateObject = FDUpdateSQLArinvt
    TableName = 'ARINVT'
    Left = 180
    Top = 48
    object Table1ID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object Table1CLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Required = True
      Size = 2
    end
    object Table1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Required = True
      Size = 50
    end
    object Table1REV: TStringField
      DisplayLabel = 'Rev '
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object Table1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Required = True
      Size = 100
    end
    object Table1UNIT: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Required = True
      Size = 10
    end
    object Table1LEAD_TIME: TStringField
      FieldName = 'LEAD_TIME'
      Size = 10
    end
    object Table1LEAD_DAYS: TBCDField
      FieldName = 'LEAD_DAYS'
      Size = 0
    end
    object Table1NON_MATERIAL: TStringField
      FieldName = 'NON_MATERIAL'
      FixedChar = True
      Size = 1
    end
    object Table1DESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
  end
  inherited DataSource1: TDataSource
    Left = 212
    Top = 48
  end
  object wwQryVendorLookup: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select vendorno,'
      '       company,'
      '       city,'
      '       state,'
      '       country,'
      '       id'
      '  from vendor'
      ' where NVL(pk_hide, '#39'N'#39') = '#39'N'#39
      'order by vendorno')
    Left = 201
    Top = 111
    object wwQryVendorLookupCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 25
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object wwQryVendorLookupVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      FixedChar = True
      Size = 10
    end
    object wwQryVendorLookupCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 12
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object wwQryVendorLookupSTATE: TStringField
      DisplayLabel = 'State'
      DisplayWidth = 2
      FieldName = 'STATE'
      FixedChar = True
    end
    object wwQryVendorLookupCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 12
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 30
    end
    object wwQryVendorLookupID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object PkVendor: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select vendorno,'
      '          company,'
      '          city,'
      '          state,'
      '          country,'
      '          id,'
      '          pk_hide'
      'from vendor'
      'order by vendorno'
      '         '
      '         '
      ' ')
    OnIQModify = PkVendorIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 231
    Top = 112
    object PkVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor#'
      FieldName = 'VENDORNO'
      Size = 10
    end
    object StringField2: TStringField
      DisplayLabel = 'Vendor Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object StringField3: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object StringField4: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object StringField5: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object FloatField1: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.VENDOR.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object wwSrcArinvt_Vendors: TDataSource
    DataSet = wwTblArinvt_Vendors
    Left = 72
    Top = 135
  end
  object wwTblArinvt_Vendors: TFDQuery
    Tag = 1
    OnNewRecord = wwTblArinvt_VendorsNewRecord
    IndexFieldNames = 'ARINVT_ID'
    MasterSource = DataSource1
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete]
    UpdateOptions.EnableDelete = False
    UpdateOptions.UpdateTableName = 'ARINVT_VENDORS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = FDUpdateSQL_Arinvt_Vendors
    SQL.Strings = (
      'SELECT vendor.vendorno,'
      '       vendor.company AS vendorcompany,'
      '       arinvt_vendors.vend_itemno,'
      '       arinvt_vendors.vend_descrip,'
      '       arinvt_vendors.arinvt_id,'
      '       arinvt_vendors.vendor_id,'
      '       arinvt_vendors.id'
      '  FROM arinvt_vendors, vendor'
      ' WHERE vendor.id = arinvt_vendors.vendor_id')
    Left = 81
    Top = 148
    object wwTblArinvt_VendorsVendorNo: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 9
      FieldKind = fkCalculated
      FieldName = 'VendorNo'
      Required = True
      Size = 10
      Calculated = True
    end
    object wwTblArinvt_VendorsVendorCompany: TStringField
      DisplayLabel = 'Vendor Name'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'VendorCompany'
      Required = True
      Size = 60
      Calculated = True
    end
    object wwTblArinvt_VendorsVEND_ITEMNO: TStringField
      DisplayLabel = 'AKA Item #'
      DisplayWidth = 18
      FieldName = 'VEND_ITEMNO'
      Required = True
      Size = 25
    end
    object wwTblArinvt_VendorsVEND_DESCRIP: TStringField
      DisplayLabel = 'AKA Description'
      DisplayWidth = 30
      FieldName = 'VEND_DESCRIP'
      Size = 35
    end
    object wwTblArinvt_VendorsARINVT_ID: TBCDField
      DisplayLabel = 'Inventory Item ID'
      FieldName = 'ARINVT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object wwTblArinvt_VendorsVENDOR_ID: TBCDField
      DisplayLabel = 'Vendor ID'
      FieldName = 'VENDOR_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object wwTblArinvt_VendorsID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object wwQryElements: TFDQuery
    Active = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, elem_descrip from elements')
    Left = 199
    Top = 156
    object wwQryElementsELEM_DESCRIP: TStringField
      DisplayLabel = 'Cost Element Description'
      DisplayWidth = 30
      FieldName = 'ELEM_DESCRIP'
      Origin = 'ELEMENTS.ELEM_DESCRIP'
      Size = 30
    end
    object wwQryElementsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ELEMENTS.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcArinvt_Elements: TDataSource
    DataSet = TblArinvt_Elements
    Left = 169
    Top = 156
  end
  object TblArinvt_Elements: TFDTable
    BeforePost = TblArinvt_ElementsBeforePost
    OnCalcFields = TblArinvt_ElementsCalcFields
    OnNewRecord = TblArinvt_ElementsNewRecord
    IndexFieldNames = 'ARINVT_ID'
    MasterSource = DataSource1
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARINVT_ELEMENTS'
    TableName = 'ARINVT_ELEMENTS'
    Left = 169
    Top = 184
    object TblArinvt_ElementsDescription: TStringField
      DisplayWidth = 14
      FieldKind = fkLookup
      FieldName = 'Description'
      LookupDataSet = wwQryElements
      LookupKeyFields = 'ID'
      LookupResultField = 'ELEM_DESCRIP'
      KeyFields = 'ELEMENTS_ID'
      Size = 30
      Lookup = True
    end
    object TblArinvt_ElementsSTD_COST: TFMTBCDField
      DisplayLabel = 'Cost'
      DisplayWidth = 8
      FieldName = 'STD_COST'
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object TblArinvt_ElementsDEFAULT_COST_ELEMENT: TStringField
      DisplayLabel = 'Default'
      DisplayWidth = 6
      FieldName = 'DEFAULT_COST_ELEMENT'
      Size = 1
    end
    object TblArinvt_ElementsADD_TO_ROLLUP: TFMTBCDField
      DisplayLabel = 'Add To Roll Up'
      DisplayWidth = 13
      FieldName = 'ADD_TO_ROLLUP'
      DisplayFormat = '########0.000000'
      Size = 6
    end
    object TblArinvt_ElementsARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblArinvt_ElementsELEMENTS_ID: TBCDField
      DisplayLabel = 'Cost Element'
      DisplayWidth = 10
      FieldName = 'ELEMENTS_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblArinvt_ElementsID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityCode = 'QUICKADDRAWARINVT'
    AfterApply = SRAfterApply
    Left = 232
    Top = 24
  end
  object FDUpdateSQL_Arinvt_Vendors: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO ARINVT_VENDORS'
      '(ID, ARINVT_ID, VENDOR_ID, VEND_ITEMNO, VEND_DESCRIP)'
      
        'VALUES (:NEW_ID, :NEW_ARINVT_ID, :NEW_VENDOR_ID, :NEW_VEND_ITEMN' +
        'O, :NEW_VEND_DESCRIP)')
    ModifySQL.Strings = (
      'UPDATE ARINVT_VENDORS'
      
        'SET ID = :NEW_ID, ARINVT_ID = :NEW_ARINVT_ID, VENDOR_ID = :NEW_V' +
        'ENDOR_ID, '
      
        '  VEND_ITEMNO = :NEW_VEND_ITEMNO, VEND_DESCRIP = :NEW_VEND_DESCR' +
        'IP'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ARINVT_ID, VENDOR_ID, SEQ, VEND_ITEMNO, VEND_DESCRIP,' +
        ' PRICE_PER_1000, '
      '  CURRENCY_ID, CUSER1, CUSER2, CUSER3, CUSER4, CUSER5, NUSER1, '
      
        '  NUSER2, NUSER3, NUSER4, NUSER5, VEND_REV, INFO_PO, IS_DEFAULT,' +
        ' '
      
        '  NUSER6, NUSER7, NUSER8, NUSER9, NUSER10, INFO_REC, INSP_RECEIP' +
        'T_THRES, '
      '  INSP_RECEIPT_COUNT, VEND_DESCRIP2, CUSER6, CUSER7, CUSER8, '
      
        '  CUSER9, CUSER10, LEAD_DAYS, LM_LABELS_ID, VENDOR_TYPE, VMI_LOC' +
        'ATIONS_ID, '
      '  STD_COST, ELEMENTS_ID, UOM, PO_MULTIPLE, MIN_ORDER_QTY'
      'FROM ARINVT_VENDORS'
      'WHERE ID = :ID')
    Left = 96
    Top = 160
  end
  object FDUpdateSQLArinvt: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO ARINVT'
      '(ID, CLASS, ITEMNO, REV, DESCRIP, DESCRIP2, '
      '  UNIT, LEAD_DAYS, LEAD_TIME, NON_MATERIAL)'
      
        'VALUES (:NEW_ID, :NEW_CLASS, :NEW_ITEMNO, nvl(:NEW_REV, '#39' '#39'), :N' +
        'EW_DESCRIP, :NEW_DESCRIP2, '
      '  :NEW_UNIT, :NEW_LEAD_DAYS, :NEW_LEAD_TIME, :NEW_NON_MATERIAL)')
    ModifySQL.Strings = (
      'UPDATE ARINVT'
      
        'SET ID = :NEW_ID, CLASS = :NEW_CLASS, ITEMNO = :NEW_ITEMNO, REV ' +
        '= :NEW_REV, '
      
        '  DESCRIP = :NEW_DESCRIP, DESCRIP2 = :NEW_DESCRIP2, UNIT = :NEW_' +
        'UNIT, '
      '  LEAD_DAYS = :NEW_LEAD_DAYS, LEAD_TIME = :NEW_LEAD_TIME, '
      '  NON_MATERIAL = :NEW_NON_MATERIAL'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM ARINVT'
      'WHERE ID = :OLD_ID')
    Left = 180
    Top = 76
  end
  object SrcElements: TDataSource
    DataSet = wwQryElements
    Left = 56
    Top = 208
  end
end

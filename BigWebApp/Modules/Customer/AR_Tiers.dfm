object FrmAR_Tiers: TFrmAR_Tiers
  Left = 111
  Top = 117
  HelpContext = 1463936
  ClientHeight = 581
  ClientWidth = 664
  Caption = 'AR Discount Tiers'
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 357
    Width = 664
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alBottom
    ParentColor = False
    Color = clBtnFace
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 664
    Height = 357
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 447
    IQComponents.Grid.Height = 271
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcAR_Discount_Tiers
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
    IQComponents.Navigator.DataSource = SrcAR_Discount_Tiers
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 447
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 271
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcAR_Discount_Tiers
    Columns = <
      item
        FieldName = 'DISCOUNT'
        Title.Caption = 'Tier Discount %'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BASED_ON_STD_PRICE'
        Title.Caption = 'Tier Price based on...'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'AGGREGATE'
        Title.Caption = 'Aggregate'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Item Class'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Cust#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTOMER'
        Title.Caption = 'Customer'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Item Descrip.'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Item Rev.'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DISCOUNT_PRICE'
        Title.Caption = 'Discount Price'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTTYPE'
        Title.Caption = 'Customer Type'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMTYPE'
        Title.Caption = 'Item Type'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext. Description'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USE_WATERFALL'
        Title.Caption = 'Use Waterfall'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'ATTN'
        Title.Caption = 'Ship To'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LESS_THAN_MIN_UPCHARGE'
        Title.Caption = 'Less Than Min. Upcharge %'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BOGO'
        Title.Caption = 'BOGO'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end>
    Marker = 0
    object wwDBLookupCombo1: TUniDBLookupComboBox
      Left = 264
      Top = 32
      Width = 121
      Height = 21
      Hint = ''
      ListField = 'DESCRIP'
      ListSource = dsCust_Type
      KeyField = 'ID'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
      OnDropDown = wwDBLookupCombo1DropDown
    end
    object wwDBLookupCombo2: TUniDBLookupComboBox
      Left = 264
      Top = 56
      Width = 121
      Height = 21
      Hint = ''
      ListField = 'DESCRIP'
      ListSource = dsItem_Type
      KeyField = 'ID'
      ListFieldIndex = 0
      TabOrder = 3
      Color = clWindow
      OnDropDown = wwDBLookupCombo1DropDown
    end
    object wwDBComboBox1: TUniDBComboBox
      Left = 263
      Top = 69
      Width = 121
      Height = 21
      Hint = ''
      Items.Strings = (
        'Price based on Price Breaks'#9
        'Price based on Std. Price'#9'Y')
      TabOrder = 4
    end
    object wwDBCustomer: TUniEdit
      Left = 264
      Top = 96
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 5
    end
    object wwDBItem: TUniEdit
      Left = 136
      Top = 96
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 7
    end
    object wwDBShipTo: TUniEdit
      Left = 288
      Top = 136
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 6
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 360
    Width = 664
    Height = 221
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 563
    object PC: TUniPageControl
      Left = 1
      Top = 1
      Width = 662
      Height = 219
      Hint = ''
      ActivePage = TabTier
      TabBarVisible = True
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object TabTier: TUniTabSheet
        Hint = ''
        TabVisible = False
        Caption = 'TabTier'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 281
        ExplicitHeight = 165
        object Panel3: TUniPanel
          Left = 0
          Top = 0
          Width = 654
          Height = 191
          Hint = ''
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          Caption = ''
          object Panel4: TUniPanel
            Left = 1
            Top = 1
            Width = 652
            Height = 27
            Hint = ''
            Align = alTop
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Alignment = taLeftJustify
            Caption = ''
            object LblSellCurr: TUniLabel
              Left = 3
              Top = 7
              Width = 44
              Height = 13
              Hint = ''
              Caption = 'Currency'
              TabOrder = 2
            end
            object dbSellCurr: TUniDBLookupComboBox
              Left = 51
              Top = 3
              Width = 133
              Height = 21
              Hint = ''
              ListField = 'DESCRIP'
              ListSource = dsCurr
              KeyField = 'ID'
              ListFieldIndex = 0
              TabOrder = 0
              Color = clWindow
            end
            object Shape9: TUniPanel
              Left = 305
              Top = 7
              Width = 11
              Height = 11
              Hint = 'Level Not in Waterfall'
              ShowHint = True
              ParentShowHint = False
              TabOrder = 3
              BorderStyle = ubsNone
              Caption = ''
              Color = clYellow
            end
          end
          object GridAggregate: TIQUniGridControl
            Left = 1
            Top = 27
            Width = 652
            Height = 164
            Layout = 'border'
            ParentAlignmentControl = False
            AlignmentControl = uniAlignmentClient
            Align = alClient
            Anchors = [akLeft, akTop, akRight, akBottom]
            TabOrder = 1
            IQComponents.Grid.Left = 0
            IQComponents.Grid.Top = 29
            IQComponents.Grid.Width = 435
            IQComponents.Grid.Height = 78
            IQComponents.Grid.Hint = ''
            IQComponents.Grid.DataSource = SrcAggregate
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
            IQComponents.Navigator.DataSource = SrcAggregate
            IQComponents.Navigator.LayoutConfig.Region = 'east'
            IQComponents.Navigator.TabOrder = 3
            IQComponents.HiddenPanel.Left = 435
            IQComponents.HiddenPanel.Top = 29
            IQComponents.HiddenPanel.Width = 209
            IQComponents.HiddenPanel.Height = 78
            IQComponents.HiddenPanel.Hint = ''
            IQComponents.HiddenPanel.Visible = True
            IQComponents.HiddenPanel.Align = alRight
            IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
            IQComponents.FormTab.Hint = ''
            IQComponents.FormTab.ImageIndex = 1
            IQComponents.FormTab.Caption = 'Form'
            IQComponents.FormTab.Layout = 'border'
            DataSource = SrcAggregate
            Columns = <
              item
                FieldName = 'QUAN'
                Title.Caption = 'Qty.'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'QUAN_LEVEL'
                Title.Caption = 'Waterfall Level'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DISCOUNT'
                Title.Caption = 'Discount Percentage'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DISCOUNT_PRICE'
                Title.Caption = 'Discount Price'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'DEACTIVE_DATE'
                Title.Caption = 'Inactive Date'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'EFFECT_DATE'
                Title.Caption = 'Effective Date'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'PRICE_DATE'
                Title.Caption = 'Price Date'
                Width = 64
                CheckBoxField.FieldValues = 'true;false'
              end
              item
                FieldName = 'WEBDIRECT_SHOW'
                Title.Caption = 'WebDirect - Show'
                Width = 64
                CheckBoxField.FieldValues = 'Y;N'
              end>
            Marker = 0
          end
          object cmbWaterfallLevel: TUniDBLookupComboBox
            Left = 264
            Top = 57
            Width = 121
            Height = 21
            Hint = ''
            ListField = 'QUAN_LEVEL'
            ListSource = dsWaterfallLevel
            KeyField = 'QUAN_LEVEL'
            ListFieldIndex = 0
            TabOrder = 2
            Color = clWindow
            OnDropDown = cmbWaterfallLevelDropDown
          end
        end
      end
      object TabBogo: TUniTabSheet
        Hint = ''
        TabVisible = False
        ImageIndex = 1
        Caption = 'TabBogo'
        object IQSearch2: TIQUniGridControl
          Left = 0
          Top = 27
          Width = 654
          Height = 164
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 437
          IQComponents.Grid.Height = 78
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcBogo
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
          IQComponents.Navigator.DataSource = SrcBogo
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = 437
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 78
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcBogo
          Columns = <
            item
              FieldName = 'PURCHASE_QTY'
              Title.Caption = 'Purchase Qty.'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DISCOUNT_QTY'
              Title.Caption = 'Discount Qty.'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'DISCOUNT_PERCENTAGE'
              Title.Caption = 'Discount Percentage'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'INACTIVE_DATE'
              Title.Caption = 'Inactive Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'EFFECTIVE_DATE'
              Title.Caption = 'Effective Date'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end
            item
              FieldName = 'MAX_QTY'
              Title.Caption = 'Max. Qty.'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
        object Panel5: TUniPanel
          Left = 0
          Top = 0
          Width = 654
          Height = 27
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Alignment = taLeftJustify
          Caption = '  BOGO Discounts'
        end
      end
    end
  end
  object SrcAR_Discount_Tiers: TDataSource
    DataSet = QryAR_Discount_Tiers
    OnDataChange = SrcAR_Discount_TiersDataChange
    Left = 64
    Top = 112
  end
  object MainMenu1: TUniMainMenu
    Left = 184
    Top = 16
    object File1: TUniMenuItem
      Caption = '&File'
      object CustomerTypes1: TUniMenuItem
        Caption = '&Customer Types'
        OnClick = CustomerTypes1Click
      end
      object ItemsTypes1: TUniMenuItem
        Caption = '&Items Types'
        OnClick = ItemsTypes1Click
      end
      object Waterfalls1: TUniMenuItem
        Caption = 'Waterfalls'
        OnClick = Waterfalls1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object AssignNativeCurrencytoAllUnassignedPriceBreaks1: TUniMenuItem
        Caption = '&Assign Native Currency to All Unassigned Price Breaks'
        OnClick = AssignNativeCurrencytoAllUnassignedPriceBreaks1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'AR Tiers'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 188989 $'
    BuildVersion = '176554'
    Left = 589
    Top = 224
  end
  object wwQryCust_Type: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       descrip'
      '  from cust_type'
      ' order by descrip ')
    Left = 88
    Top = 240
    object wwQryCust_TypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'CUST_TYPE.DESCRIP'
      Size = 50
    end
    object wwQryCust_TypeID: TBCDField
      FieldName = 'ID'
      Origin = 'CUST_TYPE.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryItem_Type: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       descrip'
      '  from item_type'
      ' order by descrip '
      ' ')
    Left = 144
    Top = 128
    object StringField1: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'CUST_TYPE.DESCRIP'
      Size = 50
    end
    object FloatField1: TBCDField
      FieldName = 'ID'
      Origin = 'CUST_TYPE.ID'
      Visible = False
      Size = 0
    end
  end
  object QryAR_Discount_Tiers: TFDQuery
    AfterInsert = QryAR_Discount_TiersAfterInsert
    AfterEdit = QryAR_Discount_TiersAfterInsert
    BeforePost = QryAR_Discount_TiersBeforePost
    AfterPost = QryAR_Discount_TiersAfterDelete
    AfterDelete = QryAR_Discount_TiersAfterDelete
    BeforeScroll = QryAR_Discount_TiersBeforeScroll
    AfterScroll = QryAR_Discount_TiersAfterScroll
    OnCalcFields = QryAR_Discount_TiersCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'AR_DISCOUNT_TIERS'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select a.id, '
      '       a.cust_type_id,'
      '       a.item_type_id,'
      '       a.discount,'
      '       a.based_on_std_price,'
      '       NVL(a.aggregate, '#39'N'#39') as aggregate,'
      '       r.id as arcusto_id,'
      '       r.custno as custno,'
      '       r.company as customer,'
      '       t.id as arinvt_id,'
      '       t.class,'
      '       t.itemno,'
      '       t.rev,'
      '       t.descrip,'
      '       t.descrip2,'
      '       a.discount_price,'
      '       ct.descrip as CustType,'
      '       it.descrip as ItemType,'
      '       a.use_waterfall,'
      '       s.attn,'
      '       a.ship_to_id,'
      '       a.LESS_THAN_MIN_UPCHARGE,'
      '       a.bogo '
      '  from AR_DISCOUNT_TIERS a,'
      '       cust_type c,'
      '       item_type i,'
      '       arcusto r,'
      '       arinvt t,'
      '       cust_type ct,'
      '       item_type it,'
      '       ship_to s'
      ' where a.cust_type_id = c.id(+)'
      '   and a.item_type_id = i.id(+)'
      '   and a.arinvt_id = t.id(+)'
      '   and a.arcusto_id = r.id(+)'
      '   and a.ship_to_id = s.id(+)'
      '   and a.cust_type_id = ct.id(+)'
      '   and a.item_type_id = it.id(+)')
    Left = 56
    Top = 176
    object QryAR_Discount_TiersDISCOUNT: TBCDField
      DisplayLabel = 'Tier Discount %'
      DisplayWidth = 10
      FieldName = 'DISCOUNT'
      Origin = 'A.DISCOUNT'
      Size = 2
    end
    object QryAR_Discount_TiersBASED_ON_STD_PRICE: TStringField
      DisplayLabel = 'Tier Price based on...'
      DisplayWidth = 1
      FieldName = 'BASED_ON_STD_PRICE'
      Origin = 'A.BASED_ON_STD_PRICE'
      FixedChar = True
      Size = 1
    end
    object QryAR_Discount_TiersAGGREGATE: TStringField
      DisplayLabel = 'Aggregate'
      DisplayWidth = 1
      FieldName = 'AGGREGATE'
      Origin = 'NVL(a.aggregate, '#39'N'#39')'
      Size = 1
    end
    object QryAR_Discount_TiersCLASS: TStringField
      DisplayLabel = 'Item Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 't.class'
      FixedChar = True
      Size = 2
    end
    object QryAR_Discount_TiersCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'r.custno'
      FixedChar = True
      Size = 10
    end
    object QryAR_Discount_TiersCUSTOMER: TStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 20
      FieldName = 'CUSTOMER'
      Origin = 'r.company'
      Size = 60
    end
    object QryAR_Discount_TiersDESCRIP: TStringField
      DisplayLabel = 'Item Descrip.'
      DisplayWidth = 15
      FieldName = 'DESCRIP'
      Origin = 't.descrip'
      Size = 100
    end
    object QryAR_Discount_TiersITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 't.itemno'
      FixedChar = True
      Size = 50
    end
    object QryAR_Discount_TiersREV: TStringField
      DisplayLabel = 'Item Rev.'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 't.rev'
      FixedChar = True
      Size = 15
    end
    object QryAR_Discount_TiersDISCOUNT_PRICE: TFMTBCDField
      DisplayLabel = 'Discount Price'
      DisplayWidth = 10
      FieldName = 'DISCOUNT_PRICE'
      Origin = 'a.DISCOUNT_PRICE'
      Size = 6
    end
    object QryAR_Discount_TiersCUSTTYPE: TStringField
      DisplayLabel = 'Customer Type'
      DisplayWidth = 20
      FieldName = 'CUSTTYPE'
      Origin = 'ct.descrip'
      Size = 50
    end
    object QryAR_Discount_TiersITEMTYPE: TStringField
      DisplayLabel = 'Item Type'
      DisplayWidth = 20
      FieldName = 'ITEMTYPE'
      Origin = 'it.descrip'
      Size = 50
    end
    object QryAR_Discount_TiersDESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP2'
      Origin = 't.descrip2'
      Size = 100
    end
    object QryAR_Discount_TiersUSE_WATERFALL: TStringField
      DisplayLabel = 'Use Waterfall'
      DisplayWidth = 1
      FieldName = 'USE_WATERFALL'
      Size = 1
    end
    object QryAR_Discount_TiersATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 20
      FieldName = 'ATTN'
      Origin = 's.attn'
      Size = 60
    end
    object QryAR_Discount_TiersCUST_TYPE_ID: TBCDField
      DisplayLabel = 'Customer Type'
      DisplayWidth = 10
      FieldName = 'CUST_TYPE_ID'
      Origin = 'A.CUST_TYPE_ID'
      Visible = False
      Size = 0
    end
    object QryAR_Discount_TiersITEM_TYPE_ID: TBCDField
      DisplayLabel = 'Item Type'
      DisplayWidth = 10
      FieldName = 'ITEM_TYPE_ID'
      Origin = 'A.ITEM_TYPE_ID'
      Visible = False
      Size = 0
    end
    object QryAR_Discount_TiersID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'a.id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryAR_Discount_TiersARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryAR_Discount_TiersARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryAR_Discount_TiersCustTypeExists: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'CustTypeExists'
      Visible = False
      Calculated = True
    end
    object QryAR_Discount_TiersArcustoIdExists: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'ArcustoIdExists'
      Visible = False
      Calculated = True
    end
    object QryAR_Discount_TiersItemTypeExists: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'ItemTypeExists'
      Visible = False
      Calculated = True
    end
    object QryAR_Discount_TiersArinvtIdExists: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'ArinvtIdExists'
      Visible = False
      Calculated = True
    end
    object QryAR_Discount_TiersSHIP_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object QryAR_Discount_TiersLESS_THAN_MIN_UPCHARGE: TBCDField
      FieldName = 'LESS_THAN_MIN_UPCHARGE'
      Size = 2
    end
    object QryAR_Discount_TiersBOGO: TStringField
      FieldName = 'BOGO'
      Origin = 'BOGO'
      Size = 1
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into AR_DISCOUNT_TIERS'
      
        '  (CUST_TYPE_ID, ITEM_TYPE_ID, DISCOUNT, BASED_ON_STD_PRICE, AGG' +
        'REGATE, '
      
        '   ID, ARCUSTO_ID, ARINVT_ID, DISCOUNT_PRICE, USE_WATERFALL, SHI' +
        'P_TO_ID, LESS_THAN_MIN_UPCHARGE, BOGO)'
      'values'
      
        '  (:CUST_TYPE_ID, :ITEM_TYPE_ID, :DISCOUNT, :BASED_ON_STD_PRICE,' +
        ' :AGGREGATE, '
      
        '   :ID, :ARCUSTO_ID, :ARINVT_ID, :DISCOUNT_PRICE, :USE_WATERFALL' +
        ', :SHIP_TO_ID, :LESS_THAN_MIN_UPCHARGE, :BOGO)')
    ModifySQL.Strings = (
      'update AR_DISCOUNT_TIERS'
      'set'
      '  ID = :OLD_ID,'
      '  CUST_TYPE_ID = decode(:CUST_TYPE_ID, 0, NULL, :CUST_TYPE_ID),'
      '  ITEM_TYPE_ID = decode(:ITEM_TYPE_ID, 0, NULL, :ITEM_TYPE_ID),'
      '  DISCOUNT = :DISCOUNT,'
      '  BASED_ON_STD_PRICE = :BASED_ON_STD_PRICE,'
      '  AGGREGATE= :AGGREGATE,'
      '  ARCUSTO_ID= decode(:ARCUSTO_ID, 0, NULL, :ARCUSTO_ID),'
      '  ARINVT_ID = decode(:ARINVT_ID, 0, NULL, :ARINVT_ID),'
      '  DISCOUNT_PRICE = :DISCOUNT_PRICE,'
      '  USE_WATERFALL = :USE_WATERFALL,'
      '  SHIP_TO_ID = :SHIP_TO_ID,'
      '  LESS_THAN_MIN_UPCHARGE = :LESS_THAN_MIN_UPCHARGE,'
      '  BOGO = :BOGO'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from AR_DISCOUNT_TIERS'
      'where'
      '  ID = :OLD_ID')
    Left = 232
    Top = 240
  end
  object SrcAggregate: TDataSource
    DataSet = TblAggregate
    Left = 224
    Top = 172
  end
  object TblAggregate: TFDTable
    BeforeInsert = TblAggregateBeforeEdit
    BeforeEdit = TblAggregateBeforeEdit
    BeforePost = TblAggregateBeforePost
    OnCalcFields = TblAggregateCalcFields
    Filtered = True
    OnFilterRecord = TblAggregateFilterRecord
    IndexFieldNames = 'AR_DISCOUNT_TIERS_ID;QUAN_LEVEL;QUAN'
    MasterSource = SrcAR_Discount_Tiers
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'AR_DISCOUNT_AGGREGATE'
    TableName = 'AR_DISCOUNT_AGGREGATE'
    Left = 216
    Top = 112
    object TblAggregateQUAN: TBCDField
      DisplayLabel = 'Qty.'
      DisplayWidth = 10
      FieldName = 'QUAN'
      Required = True
      Size = 2
    end
    object TblAggregateQUAN_LEVEL: TBCDField
      DisplayLabel = 'Waterfall Level'
      DisplayWidth = 10
      FieldName = 'QUAN_LEVEL'
      Size = 0
    end
    object TblAggregateDISCOUNT: TFMTBCDField
      DisplayLabel = 'Discount Percentage'
      DisplayWidth = 10
      FieldName = 'DISCOUNT'
      Size = 5
    end
    object TblAggregateDISCOUNT_PRICE: TFMTBCDField
      DisplayLabel = 'Discount Price'
      DisplayWidth = 10
      FieldName = 'DISCOUNT_PRICE'
      Size = 6
    end
    object TblAggregateDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
    end
    object TblAggregateEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
    end
    object TblAggregatePRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      DisplayWidth = 18
      FieldName = 'PRICE_DATE'
    end
    object TblAggregateWEBDIRECT_SHOW: TStringField
      DisplayLabel = 'WebDirect - Show'
      DisplayWidth = 1
      FieldName = 'WEBDIRECT_SHOW'
      Size = 1
    end
    object TblAggregateID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object TblAggregateAR_DISCOUNT_TIERS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'AR_DISCOUNT_TIERS_ID'
      Visible = False
      Size = 0
    end
    object TblAggregateCURRENCY_ID: TBCDField
      FieldName = 'CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object TblAggregateLevelExists: TBooleanField
      DisplayWidth = 5
      FieldKind = fkCalculated
      FieldName = 'LevelExists'
      Visible = False
      Calculated = True
    end
  end
  object PkCustomer: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as arcusto_id, custno, company, addr1, addr2, '
      'city, state, zip, cust_group, pk_hide from v_arcusto'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 177
    Top = 197
    object PkCustomerARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkCustomerCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkCustomerCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkCustomerADDR1: TStringField
      DisplayLabel = 'Addr1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkCustomerADDR2: TStringField
      DisplayLabel = 'Addr2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PkCustomerCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkCustomerSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PkCustomerZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkCustomerCUST_GROUP: TStringField
      DisplayLabel = 'Group ID'
      FieldName = 'CUST_GROUP'
      Origin = 'V_ARCUSTO.CUST_GROUP'
      Size = 30
    end
    object PkCustomerPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PopupMenu1: TUniPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 392
    Top = 83
    object ClearCustomer1: TUniMenuItem
      Caption = 'Clear Customer'
      OnClick = ClearCustomer1Click
    end
    object ClearItem1: TUniMenuItem
      Caption = 'Clear Item'
      OnClick = ClearItem1Click
    end
    object ClearCustomerType1: TUniMenuItem
      Caption = 'Clear Customer Type'
    end
    object ClearItemType1: TUniMenuItem
      Caption = 'Clear Item Type'
      OnClick = ClearItemType1Click
    end
    object ClearWaterfall1: TUniMenuItem
      Caption = 'Clear Waterfall'
    end
    object ClearShipTo1: TUniMenuItem
      Caption = 'Clear Ship To'
      OnClick = ClearShipTo1Click
    end
  end
  object PkArInvt: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id       as id,'
      '       a.itemno   as itemno,  '
      '       a.descrip  as descrip,  '
      '       a.descrip2 as descrip2, '
      '       a.rev      as rev, '
      '       a.class    as class,'
      '       a.ecode    as ecode,'
      '       c.custno   as custno,'
      '       c.company  as company,'
      '       a.cuser1   as User1,'
      '       a.cuser2   as User2,'
      '       a.eplant_id as eplant_id,'
      '       a.pk_hide as pk_hide'
      '  from arinvt a, arcusto c'
      ' where a.arcusto_id = c.id(+)'
      '   and NVL(a.non_salable, '#39'N'#39') = '#39'N'#39
      '   and misc.eplant_filter(a.eplant_id) = 1'
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 160
    Top = 264
    object PkArInvtID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArInvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArInvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArInvtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Size = 15
    end
    object PkArInvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkArInvtDESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object PkArInvtCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArInvtCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArInvtECODE: TStringField
      DisplayLabel = 'ECode'
      FieldName = 'ECODE'
      Size = 10
    end
    object PkArInvtUSER1: TStringField
      DisplayLabel = 'User 1'
      DisplayWidth = 20
      FieldName = 'USER1'
      Size = 60
    end
    object PkArInvtUSER2: TStringField
      DisplayLabel = 'User 2'
      DisplayWidth = 20
      FieldName = 'USER2'
      Size = 60
    end
    object PkArInvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkArInvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object QryCurr: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       curr_code,'
      '       descrip,'
      '       NATIVE_CURR'
      '  from currency'
      ' where curr_code = NATIVE_CURR')
    Left = 280
    Top = 288
    object QryCurrID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.CURRENCY.ID'
      Size = 0
    end
    object QryCurrCURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Origin = 'IQ.CURRENCY.CURR_CODE'
      Size = 10
    end
    object QryCurrDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.CURRENCY.DESCRIP'
      Size = 50
    end
    object QryCurrNATIVE_CURR: TStringField
      FieldName = 'NATIVE_CURR'
      Origin = 'IQ.CURRENCY.NATIVE_CURR'
      Size = 3
    end
  end
  object wwQryWaterfallLevel: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct(quan_level) as quan_level'
      '  from ar_discount_waterfall_levels'
      ' order by quan_level'
      ' ')
    Left = 192
    Top = 312
    object wwQryWaterfallLevelQUAN_LEVEL: TBCDField
      DisplayLabel = 'Level'
      DisplayWidth = 10
      FieldName = 'QUAN_LEVEL'
      Origin = 'IQ.AR_DISCOUNT_WATERFALL_LEVELS.QUAN_LEVEL'
      Size = 0
    end
  end
  object PopupMenuAggregate: TUniPopupMenu
    Left = 448
    Top = 312
    object AddAllLevels1: TUniMenuItem
      Caption = 'Add All Levels'
      OnClick = AddAllLevels1Click
    end
  end
  object PkShipTo: TIQWebHpick
    BeforeOpen = PkShipToBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select s.id            as id,'
      '       s.attn          as attn,'
      '       s.addr1         as addr1,'
      '       s.addr2         as addr2,'
      '       s.addr3         as addr3,'
      '       s.city          as city,'
      '       s.state         as state,'
      '       s.country       as country,'
      '       s.zip           as zip,'
      '       s.phone_number  as phone_number,'
      '       s.ext           as ext,'
      '       s.fax           as fax,'
      '       s.prime_contact as prime_contact,'
      '       s.ecode         as ecode,'
      '       s.eplant_id     as eplant_id,'
      '       f.descrip       as ship_via,'
      '       d.name          as division_name,'
      '       s.pk_hide       as pk_hide'
      '  from ship_to s,'
      '       freight f,'
      '       division d'
      ' where s.freight_id = f.id(+)'
      '   and s.arcusto_id = :id'
      '   and s.division_id = d.id(+)'
      '   and misc.eplant_filter_include_nulls(s.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 456
    Top = 97
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkShipToID: TBCDField
      DisplayLabel = 'Ship To ID'
      FieldName = 'ID'
      Origin = 'SHIP_TO.ID'
      Size = 0
    end
    object PkShipToPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      DisplayWidth = 20
      FieldName = 'PRIME_CONTACT'
      Origin = 'SHIP_TO.PRIME_CONTACT'
      Size = 30
    end
    object PkShipToATTN: TStringField
      DisplayLabel = 'Attention'
      DisplayWidth = 15
      FieldName = 'ATTN'
      Origin = 'SHIP_TO.ATTN'
      Size = 60
    end
    object PkShipToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'SHIP_TO.ADDR1'
      Size = 60
    end
    object PkShipToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'SHIP_TO.ADDR2'
      Size = 60
    end
    object PkShipToADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Origin = 'SHIP_TO.ADDR3'
      Size = 60
    end
    object PkShipToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'SHIP_TO.CITY'
      Size = 30
    end
    object PkShipToSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
      Origin = 'SHIP_TO.STATE'
    end
    object PkShipToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      Origin = 'SHIP_TO.COUNTRY'
      Size = 30
    end
    object PkShipToZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Origin = 'SHIP_TO.ZIP'
      Size = 10
    end
    object PkShipToPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'SHIP_TO.PHONE_NUMBER'
      Size = 25
    end
    object PkShipToEXT: TStringField
      DisplayLabel = 'Telephone Ext'
      DisplayWidth = 3
      FieldName = 'EXT'
      Origin = 'SHIP_TO.EXT'
      Size = 5
    end
    object PkShipToFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = 'SHIP_TO.FAX'
      Size = 25
    end
    object PkShipToECODE: TStringField
      DisplayLabel = 'ECode'
      FieldName = 'ECODE'
      Origin = 'SHIP_TO.ECODE'
      Size = 10
    end
    object PkShipToEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'SHIP_TO.EPLANT_ID'
      Size = 0
    end
    object PkShipToSHIP_VIA: TStringField
      DisplayLabel = 'Ship Via'
      FieldName = 'SHIP_VIA'
      Size = 60
    end
    object PkShipToDIVISION_NAME: TStringField
      DisplayLabel = 'Division Name'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
    object PkShipToPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object StoredProc1: TFDStoredProc
    Left = 312
    Top = 195
  end
  object SrcBogo: TDataSource
    DataSet = QryBogo
    Left = 444
    Top = 184
  end
  object QryBogo: TFDQuery
    BeforeOpen = QryBogoBeforeOpen
    BeforeInsert = QryBogoBeforeEdit
    BeforeEdit = QryBogoBeforeEdit
    BeforePost = QryBogoBeforePost
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'select id,'
      '       ar_discount_tiers_id,'
      '       purchase_qty,'
      '       discount_qty,'
      '       max_qty,'
      '       discount_percentage,'
      '       inactive_date,'
      '       effective_date'
      '  from BOGO_DISCOUNT_DETAILS'
      ' where ar_discount_tiers_id = :aId'
      '')
    Left = 512
    Top = 240
    ParamData = <
      item
        Name = 'AID'
        DataType = ftFloat
        ParamType = ptInput
      end>
    object QryBogoID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Precision = 15
      Size = 0
    end
    object QryBogoAR_DISCOUNT_TIERS_ID: TBCDField
      FieldName = 'AR_DISCOUNT_TIERS_ID'
      Origin = 'AR_DISCOUNT_TIERS_ID'
      Precision = 15
      Size = 0
    end
    object QryBogoPURCHASE_QTY: TBCDField
      FieldName = 'PURCHASE_QTY'
      Origin = 'PURCHASE_QTY'
      Precision = 14
    end
    object QryBogoDISCOUNT_QTY: TBCDField
      FieldName = 'DISCOUNT_QTY'
      Origin = 'DISCOUNT_QTY'
      Precision = 14
    end
    object QryBogoMAX_QTY: TBCDField
      FieldName = 'MAX_QTY'
      Origin = 'MAX_QTY'
      Precision = 14
    end
    object QryBogoDISCOUNT_PERCENTAGE: TBCDField
      FieldName = 'DISCOUNT_PERCENTAGE'
      Origin = 'DISCOUNT_PERCENTAGE'
      Precision = 3
      Size = 0
    end
    object QryBogoINACTIVE_DATE: TDateTimeField
      FieldName = 'INACTIVE_DATE'
      Origin = 'INACTIVE_DATE'
    end
    object QryBogoEFFECTIVE_DATE: TDateTimeField
      FieldName = 'EFFECTIVE_DATE'
      Origin = 'EFFECTIVE_DATE'
    end
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    ConnectionName = 'IQFD'
    InsertSQL.Strings = (
      'INSERT INTO IQMS.BOGO_DISCOUNT_DETAILS'
      '(ID, AR_DISCOUNT_TIERS_ID, PURCHASE_QTY, DISCOUNT_QTY, '
      '  MAX_QTY, DISCOUNT_PERCENTAGE, INACTIVE_DATE, '
      '  EFFECTIVE_DATE)'
      
        'VALUES (:NEW_ID, :NEW_AR_DISCOUNT_TIERS_ID, :NEW_PURCHASE_QTY, :' +
        'NEW_DISCOUNT_QTY, '
      '  :NEW_MAX_QTY, :NEW_DISCOUNT_PERCENTAGE, :NEW_INACTIVE_DATE, '
      '  :NEW_EFFECTIVE_DATE)')
    ModifySQL.Strings = (
      'UPDATE IQMS.BOGO_DISCOUNT_DETAILS'
      
        'SET ID = :NEW_ID, AR_DISCOUNT_TIERS_ID = :NEW_AR_DISCOUNT_TIERS_' +
        'ID, '
      
        '  PURCHASE_QTY = :NEW_PURCHASE_QTY, DISCOUNT_QTY = :NEW_DISCOUNT' +
        '_QTY, '
      
        '  MAX_QTY = :NEW_MAX_QTY, DISCOUNT_PERCENTAGE = :NEW_DISCOUNT_PE' +
        'RCENTAGE, '
      
        '  INACTIVE_DATE = :NEW_INACTIVE_DATE, EFFECTIVE_DATE = :NEW_EFFE' +
        'CTIVE_DATE'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM IQMS.BOGO_DISCOUNT_DETAILS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, AR_DISCOUNT_TIERS_ID, PURCHASE_QTY, DISCOUNT_QTY, MAX' +
        '_QTY, '
      '  DISCOUNT_PERCENTAGE, INACTIVE_DATE, EFFECTIVE_DATE'
      'FROM IQMS.BOGO_DISCOUNT_DETAILS'
      'WHERE ID = :ID')
    Left = 576
    Top = 152
  end
  object dsWaterfallLevel: TDataSource
    DataSet = wwQryWaterfallLevel
    OnDataChange = SrcAR_Discount_TiersDataChange
    Left = 376
    Top = 184
  end
  object dsCust_Type: TDataSource
    DataSet = wwQryCust_Type
    OnDataChange = SrcAR_Discount_TiersDataChange
    Left = 336
    Top = 240
  end
  object dsItem_Type: TDataSource
    DataSet = wwQryItem_Type
    OnDataChange = SrcAR_Discount_TiersDataChange
    Left = 392
    Top = 248
  end
  object dsCurr: TDataSource
    DataSet = QryCurr
    OnDataChange = SrcAR_Discount_TiersDataChange
    Left = 344
    Top = 296
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'NavMain'
      'TblTypes')
    SecurityCode = 'FRMCUST_TYPE'
    Left = 504
    Top = 152
  end
end

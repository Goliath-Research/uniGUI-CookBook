object FrmSchemaMaint: TFrmSchemaMaint
  Left = 73
  Top = 124
  ClientHeight = 587
  ClientWidth = 1060
  Caption = 'Schema Maintenance'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 154
    Width = 1060
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 157
    Width = 1060
    Height = 402
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Splitter2: TUniSplitter
      Left = 185
      Top = 0
      Width = 6
      Height = 402
      Hint = ''
      Align = alLeft
      ParentColor = False
      Color = clBtnFace
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 1
      Width = 185
      Height = 400
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel3: TUniPanel
        Left = 1
        Top = 1
        Width = 183
        Height = 25
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Schema Setup'
      end
      object DBRichEdit1: TDBRichEdit
        Left = 0
        Top = 25
        Width = 185
        Height = 375
        Align = alClient
        DataField = 'TEXT'
        DataSource = SrcSchema
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        PopupMenu = PopupMenu1
        ScrollBars = ssVertical
        TabOrder = 2
        Zoom = 100
      end
    end
    object Panel4: TUniPanel
      Left = 191
      Top = 1
      Width = 869
      Height = 400
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      Caption = ''
      object Splitter4: TUniSplitter
        Left = 89
        Top = 25
        Width = 6
        Height = 375
        Hint = ''
        Align = alLeft
        ParentColor = False
        Color = clBtnFace
      end
      object Panel5: TUniPanel
        Left = 1
        Top = 1
        Width = 867
        Height = 25
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Alignment = taLeftJustify
        Caption = 'Template'
        object NavTemplate: TUniDBNavigator
          Left = 627
          Top = 1
          Width = 240
          Height = 23
          Hint = ''
          DataSource = SrcTemplate
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object Panel6: TUniPanel
        Left = 1
        Top = 25
        Width = 89
        Height = 375
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 1
        Caption = ''
        object wwDBGrid1: TIQUniGridControl
          Left = 1
          Top = 1
          Width = 87
          Height = 373
          Layout = 'border'
          ParentAlignmentControl = False
          AlignmentControl = uniAlignmentClient
          Align = alClient
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 0
          IQComponents.Grid.Left = 0
          IQComponents.Grid.Top = 29
          IQComponents.Grid.Width = 434
          IQComponents.Grid.Height = 287
          IQComponents.Grid.Hint = ''
          IQComponents.Grid.DataSource = SrcTemplate
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
          IQComponents.Navigator.DataSource = SrcTemplate
          IQComponents.Navigator.LayoutConfig.Region = 'east'
          IQComponents.Navigator.TabOrder = 3
          IQComponents.HiddenPanel.Left = -130
          IQComponents.HiddenPanel.Top = 29
          IQComponents.HiddenPanel.Width = 209
          IQComponents.HiddenPanel.Height = 287
          IQComponents.HiddenPanel.Hint = ''
          IQComponents.HiddenPanel.Visible = True
          IQComponents.HiddenPanel.Align = alRight
          IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
          IQComponents.FormTab.Hint = ''
          IQComponents.FormTab.ImageIndex = 1
          IQComponents.FormTab.Caption = 'Form'
          IQComponents.FormTab.Layout = 'border'
          DataSource = SrcTemplate
          Columns = <
            item
              FieldName = 'SEQ'
              Title.Caption = 'Seq.'
              Width = 64
              CheckBoxField.FieldValues = 'true;false'
            end>
          Marker = 0
        end
      end
      object Panel10: TUniPanel
        Left = 95
        Top = 25
        Width = 774
        Height = 375
        Hint = ''
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 2
        Caption = ''
        object Panel11: TUniPanel
          Left = 1
          Top = 1
          Width = 772
          Height = 20
          Hint = ''
          Align = alTop
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Caption = 'SQL String'
        end
        object DBRichEdit2: TDBRichEdit
          Left = 0
          Top = 20
          Width = 774
          Height = 355
          Align = alClient
          DataField = 'TEXT'
          DataSource = SrcTemplate
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          PopupMenu = PopupMenu2
          ScrollBars = ssVertical
          TabOrder = 2
          Zoom = 100
        end
      end
    end
  end
  object Panel7: TUniPanel
    Left = 0
    Top = 559
    Width = 1060
    Height = 28
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel8: TUniPanel
      Left = 902
      Top = 1
      Width = 158
      Height = 26
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 2
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Ok'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 82
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object Panel9: TUniPanel
    Left = 0
    Top = 0
    Width = 1060
    Height = 25
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Alignment = taLeftJustify
    Caption = 'Schema'
  end
  object Panel12: TUniPanel
    Left = 0
    Top = 25
    Width = 1060
    Height = 129
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = 'Panel12'
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 1058
      Height = 127
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 841
      IQComponents.Grid.Height = 41
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcSchema
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
      IQComponents.Navigator.DataSource = SrcSchema
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 841
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 41
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcSchema
      Columns = <
        item
          FieldName = 'DESCRIP'
          Title.Caption = 'Schema'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TYPE'
          Title.Caption = 'Schema Type'
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
          FieldName = 'COMPANY'
          Title.Caption = 'Customer'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'VENDOR_COMP'
          Title.Caption = 'Vendor'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'VENDORNO'
          Title.Caption = 'Vendor#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
      object wwCustno: TUniEdit
        Left = 152
        Top = 48
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object wwCustomer: TUniEdit
        Left = 288
        Top = 48
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 3
      end
      object wwType: TUniDBComboBox
        Left = 432
        Top = 48
        Width = 121
        Height = 21
        Hint = ''
        Style = csDropDownList
        Items.Strings = (
          'SAFELIGHT'
          'ELECTROLUX'
          'GENERIC'
          'FA'
          'ZIO'
          'ASN')
        TabOrder = 4
      end
      object wwVendorNo: TUniEdit
        Left = 408
        Top = 80
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 6
      end
      object wwVendor: TUniEdit
        Left = 272
        Top = 80
        Width = 121
        Height = 21
        Hint = ''
        Text = ''
        TabOrder = 5
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 344
    Top = 16
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = '&Options'
      object ExportSchemas1: TUniMenuItem
        Caption = '&Export Schemas'
        OnClick = ExportSchemas1Click
      end
      object ImportSchemas1: TUniMenuItem
        Caption = '&Import Schemas'
        OnClick = ImportSchemas1Click
      end
    end
    object Reports1: TUniMenuItem
      Caption = '&Reports'
      object Print1: TUniMenuItem
        Caption = '&Print'
        OnClick = Print1Click
      end
      object PrinterSetup1: TUniMenuItem
        Caption = 'Printer &Setup'
        OnClick = PrinterSetup1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = 'Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Schema Maintenance'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192712 $'
    BuildVersion = '176554'
    Left = 384
    Top = 16
  end
  object SrcSchema: TDataSource
    DataSet = QrySchema
    Left = 24
    Top = 80
  end
  object QrySchema: TFDQuery
    AfterInsert = QrySchemaAfterInsert
    BeforePost = QrySchemaBeforePost
    AfterPost = QrySchemaAfterPost
    AfterCancel = QrySchemaAfterCancel
    BeforeDelete = QrySchemaBeforeDelete
    AfterDelete = QrySchemaAfterPost
    Connection = UniMainModule.FDConnection1
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'select a. id as id,'
      '       a.descrip as descrip,'
      '       a.type as type,'
      '       a.text as text,'
      '       r.custno as custno,'
      '       r.company as company,'
      '       a.arcusto_id as arcusto_id,'
      '       a.vendor_id,'
      '       v.vendorno as vendorno,'
      '       v.company as vendor_comp'
      '  from arcusto_schema a,'
      '       arcusto r,'
      '       vendor v'
      ' where a.arcusto_id = r.id(+)'
      '   and a.vendor_id = v.id(+)'
      '   and ( (a.arcusto_id is null and a.vendor_id is null)'
      
        '       or (a.vendor_id is not null and misc.eplant_filter_includ' +
        'e_nulls( v.eplant_id ) = 1)'
      
        '       or (a.arcusto_id is not null and misc.eplant_filter_inclu' +
        'de_nulls( r.eplant_id ) = 1)'
      '       )'
      ''
      ''
      ' ')
    Left = 40
    Top = 80
    object QrySchemaDESCRIP: TStringField
      DisplayLabel = 'Schema'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'a.DESCRIP'
      Size = 50
    end
    object QrySchemaTYPE: TStringField
      DisplayLabel = 'Schema Type'
      DisplayWidth = 20
      FieldName = 'TYPE'
      Origin = 'a.TYPE'
    end
    object QrySchemaCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'r.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QrySchemaCOMPANY: TStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'r.COMPANY'
      FixedChar = True
      Size = 60
    end
    object QrySchemaVENDOR_COMP: TStringField
      DisplayLabel = 'Vendor'
      DisplayWidth = 30
      FieldName = 'VENDOR_COMP'
      Origin = 'v.company'
      FixedChar = True
      Size = 60
    end
    object QrySchemaVENDORNO: TStringField
      DisplayLabel = 'Vendor#'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'v.vendorno'
      FixedChar = True
      Size = 10
    end
    object QrySchemaARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QrySchemaTEXT: TStringField
      FieldName = 'TEXT'
      Visible = False
      Size = 4000
    end
    object QrySchemaID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QrySchemaVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcTemplate: TDataSource
    DataSet = QryTemplate
    Left = 296
    Top = 180
  end
  object PkArcusto: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select custno,'
      '       company,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city, '
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       prime_contact,'
      '       id,'
      '       pk_hide'
      'from IQMS.v_arcusto'
      ' ')
    OnIQModify = PkArcustoIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 350
    Top = 178
    object PkArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkArcustoCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkArcustoADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkArcustoCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 30
    end
    object PkArcustoSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PkArcustoCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 30
    end
    object PkArcustoZIP: TStringField
      DisplayLabel = 'Zip'
      FieldName = 'ZIP'
      Size = 10
    end
    object PkArcustoPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PkArcustoPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      FieldName = 'PRIME_CONTACT'
      Size = 30
    end
    object PkArcustoID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArcustoADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Origin = 'ARCUSTO.ADDR2'
      Size = 60
    end
    object PkArcustoADDR3: TStringField
      DisplayLabel = 'Address 3'
      FieldName = 'ADDR3'
      Origin = 'ARCUSTO.ADDR3'
      Size = 60
    end
    object PkArcustoPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARCUSTO.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = 'zip'
    Left = 312
    Top = 16
  end
  object QryBatchMove: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 88
    Top = 72
  end
  object AbZipper1: TAbZipper
    AutoSave = False
    DOSMode = False
    StoreOptions = [soStripDrive, soStripPath, soRemoveDots]
    Left = 424
    Top = 16
  end
  object BatchMove1: TFDDataMove
    TextDataDef.Fields = <>
    TextFileName = 'Data.txt'
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 279
    Top = 18
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'zip'
    Filter = 'Zip file (*.zip)|*.zip|Any file (*.*)|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 311
    Top = 49
  end
  object AbUnZipper1: TAbUnZipper
    ExtractOptions = [eoCreateDirs, eoRestorePath]
    Left = 428
    Top = 50
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'DBMemo1'
      'DBMemo2'
      'IQSearch1'
      'NavSchema'
      'NavTemplate'
      'ExportSchemas1'
      'ImportSchemas1')
    SecurityCode = 'FRMSCHEMAMAINT'
    Left = 392
    Top = 180
  end
  object wwMemoDialog2: TwwMemoDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    MemoAttributes = [mSizeable]
    Caption = 'SQL Statement'
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    OnCloseDialog = wwMemoDialog2CloseDialog
    Left = 448
    Top = 344
  end
  object PopupMenu2: TUniPopupMenu
    Left = 440
    Top = 288
    object BringupSqlediform1: TUniMenuItem
      Caption = '&Bring up Sql edit form'
      OnClick = BringupSqlediform1Click
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 80
    Top = 280
    object MenuItem1: TUniMenuItem
      Caption = '&Bring up editor'
      OnClick = MenuItem1Click
    end
  end
  object wwMemoDialog1: TwwMemoDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    MemoAttributes = [mSizeable]
    Caption = 'SQL Statement'
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    OnCloseDialog = wwMemoDialog1CloseDialog
    Left = 88
    Top = 336
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 216
    Top = 113
  end
  object IQRepDef1: TIQWebRepDef
    App_ID = 'FrmSchemaMaint'
    WebUse = False
    TouchScreen = False
    Left = 264
    Top = 113
  end
  object QryTemplate: TFDQuery
    AfterInsert = QryTemplateAfterInsert
    BeforeEdit = QryTemplateBeforeEdit
    BeforePost = QryTemplateBeforeEdit
    AfterPost = QryTemplateAfterPost
    AfterDelete = QryTemplateAfterPost
    MasterSource = SrcSchema
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'SCHEMA_TEMPLATE'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select id,'
      '       arcusto_schema_id,'
      '       seq,'
      '       text'
      '  from SCHEMA_TEMPLATE'
      ' where arcusto_schema_id = :ID'
      ' order by seq')
    Left = 312
    Top = 190
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTemplateID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.SCHEMA_TEMPLATE.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 0
    end
    object QryTemplateARCUSTO_SCHEMA_ID: TBCDField
      FieldName = 'ARCUSTO_SCHEMA_ID'
      Origin = 'IQ.SCHEMA_TEMPLATE.ARCUSTO_SCHEMA_ID'
      Size = 0
    end
    object QryTemplateSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'IQ.SCHEMA_TEMPLATE.SEQ'
      Size = 0
    end
    object QryTemplateTEXT: TStringField
      FieldName = 'TEXT'
      Origin = 'IQ.SCHEMA_TEMPLATE.TEXT'
      Size = 4000
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into SCHEMA_TEMPLATE'
      '  (ID, ARCUSTO_SCHEMA_ID, SEQ, TEXT)'
      'values'
      '  (:ID, :ARCUSTO_SCHEMA_ID, :SEQ, :TEXT)')
    ModifySQL.Strings = (
      'update SCHEMA_TEMPLATE'
      'set'
      '  ID = :ID,'
      '  ARCUSTO_SCHEMA_ID = :ARCUSTO_SCHEMA_ID,'
      '  SEQ = :SEQ,'
      '  TEXT = :TEXT'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from SCHEMA_TEMPLATE'
      'where'
      '  ID = :OLD_ID')
    Left = 320
    Top = 206
  end
  object PkVendor: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select vendorno,'
      '       company,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city,'
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       prime_contact,'
      '       id,'
      '       pk_hide'
      'from v_vendor'
      '')
    OnIQModify = PkVendorIQModify
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 358
    Top = 218
    object PkVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor#'
      FieldName = 'VENDORNO'
      FixedChar = True
      Size = 10
    end
    object PkVendorCOMPANY: TStringField
      DisplayLabel = 'Vendor'
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object PkVendorADDR1: TStringField
      DisplayLabel = 'Address 1'
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkVendorADDR2: TStringField
      DisplayLabel = 'Address 2'
      FieldName = 'ADDR2'
      Size = 60
    end
    object PkVendorADDR3: TStringField
      DisplayLabel = 'Address 3'
      FieldName = 'ADDR3'
      Size = 60
    end
    object PkVendorCITY: TStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object PkVendorSTATE: TStringField
      DisplayLabel = 'State'
      FieldName = 'STATE'
    end
    object PkVendorCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      FixedChar = True
      Size = 30
    end
    object PkVendorZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object PkVendorPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone#'
      FieldName = 'PHONE_NUMBER'
      Size = 25
    end
    object PkVendorPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      FieldName = 'PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object PkVendorID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkVendorPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO ARCUSTO_SCHEMA'
      '(ID, ARCUSTO_ID, DESCRIP, TYPE, TEXT, '
      '  VENDOR_ID)'
      
        'VALUES (:NEW_ID, :NEW_ARCUSTO_ID, :NEW_DESCRIP, :NEW_TYPE, :NEW_' +
        'TEXT, '
      '  :NEW_VENDOR_ID)')
    ModifySQL.Strings = (
      'UPDATE ARCUSTO_SCHEMA'
      
        'SET ID = :NEW_ID, ARCUSTO_ID = :NEW_ARCUSTO_ID, DESCRIP = :NEW_D' +
        'ESCRIP, '
      '  TYPE = :NEW_TYPE, TEXT = :NEW_TEXT, VENDOR_ID = :NEW_VENDOR_ID'
      'WHERE ID = :OLD_ID')
    DeleteSQL.Strings = (
      'DELETE FROM ARCUSTO_SCHEMA'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      
        'SELECT ID, ARCUSTO_ID, DESCRIP, "TYPE" AS "TYPE", TEXT, VENDOR_I' +
        'D'
      'FROM ARCUSTO_SCHEMA'
      'WHERE ID = :ID')
    Left = 64
    Top = 104
  end
  object QryHeader: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 304
    Top = 448
  end
  object QryDetail: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    Left = 360
    Top = 448
  end
end

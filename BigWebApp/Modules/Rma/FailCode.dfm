object FrmFailureCode: TFrmFailureCode
  Left = 304
  Top = 250
  HelpContext = 1073168
  ClientHeight = 330
  ClientWidth = 526
  Caption = 'Failure Code'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  ActiveControl = wwDBGrid1
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 273
    Top = 30
    Width = 6
    Height = 300
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
    ExplicitHeight = 246
  end
  object Bevel1: TUniPanel
    Left = 0
    Top = 27
    Width = 526
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Caption = ''
    ExplicitWidth = 496
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 496
  end
  object pnlAcct: TUniPanel
    Left = 279
    Top = 30
    Width = 247
    Height = 300
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    ExplicitLeft = 276
    ExplicitWidth = 220
    ExplicitHeight = 246
    object ScrollBox1: TUniScrollBox
      Left = 0
      Top = 0
      Width = 247
      Height = 300
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitTop = 3
      ExplicitWidth = 294
      ExplicitHeight = 361
      DesignSize = (
        245
        298)
      ScrollHeight = 291
      ScrollWidth = 193
      object wwDBLookupCombo1: TUniDBLookupComboBox
        Left = 8
        Top = 25
        Width = 242
        Height = 21
        Hint = ''
        ListField = 'DISP_ACCT;ACCT;DESCRIP;TYPE;EPLANT_ID'
        ListSource = ds_GLAcct
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'GLACCT_ID_WIP'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Color = clWindow
        OnDropDown = PickGLAcct
        ExplicitWidth = 212
      end
      object wwDBLookupCombo2: TUniDBLookupComboBox
        Left = 8
        Top = 74
        Width = 242
        Height = 21
        Hint = ''
        ListField = 'DISP_ACCT;ACCT;DESCRIP;TYPE;EPLANT_ID'
        ListSource = ds_GLAcct
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'GLACCT_ID_FINISHED'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clWindow
        OnDropDown = PickGLAcct
        ExplicitWidth = 289
      end
      object wwDBLookupCombo3: TUniDBLookupComboBox
        Left = 8
        Top = 123
        Width = 242
        Height = 21
        Hint = ''
        ListField = 'DISP_ACCT;ACCT;DESCRIP;TYPE;EPLANT_ID'
        ListSource = ds_GLAcct
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'GLACCT_ID_LABOR_APPLIED'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clWindow
        OnDropDown = PickGLAcct
        ExplicitWidth = 289
      end
      object wwDBLookupCombo4: TUniDBLookupComboBox
        Left = 8
        Top = 171
        Width = 242
        Height = 21
        Hint = ''
        ListField = 'DISP_ACCT;ACCT;DESCRIP;TYPE;EPLANT_ID'
        ListSource = ds_GLAcct
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'GLACCT_ID_LABOR_COGS'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        Color = clWindow
        OnDropDown = PickGLAcct
        ExplicitWidth = 289
      end
      object wwDBLookupCombo5: TUniDBLookupComboBox
        Left = 8
        Top = 220
        Width = 242
        Height = 21
        Hint = ''
        ListField = 'DISP_ACCT;ACCT;DESCRIP;TYPE;EPLANT_ID'
        ListSource = ds_GLAcct
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'GLACCT_ID_COMP_COGS'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Color = clWindow
        OnDropDown = PickGLAcct
        ExplicitWidth = 289
      end
      object wwDBLookupCombo6: TUniDBLookupComboBox
        Left = 8
        Top = 270
        Width = 242
        Height = 21
        Hint = ''
        ListField = 'DISP_ACCT;ACCT;DESCRIP;TYPE;EPLANT_ID'
        ListSource = ds_GLAcct
        KeyField = 'ID'
        ListFieldIndex = 0
        DataField = 'GLACCT_ID_SALES_RMA'
        DataSource = DataSource1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        Color = clWindow
        OnDropDown = PickGLAcct
        ExplicitWidth = 289
      end
      object Panel2: TUniPanel
        Left = 8
        Top = 2
        Width = 185
        Height = 20
        Hint = ''
        TabOrder = 6
        Alignment = taLeftJustify
        Caption = 'WIP Repair GL Acct'
      end
      object Panel3: TUniPanel
        Left = 8
        Top = 52
        Width = 145
        Height = 20
        Hint = ''
        TabOrder = 7
        Alignment = taLeftJustify
        Caption = 'FG Repair GL Acct'
      end
      object Panel4: TUniPanel
        Left = 8
        Top = 148
        Width = 145
        Height = 20
        Hint = ''
        TabOrder = 8
        Alignment = taLeftJustify
        Caption = 'Repair Labor COGS Acct '
      end
      object Panel5: TUniPanel
        Left = 8
        Top = 197
        Width = 169
        Height = 20
        Hint = ''
        TabOrder = 9
        Alignment = taLeftJustify
        Caption = 'Repair Components COGS Acct '
      end
      object Panel6: TUniPanel
        Left = 8
        Top = 247
        Width = 169
        Height = 20
        Hint = ''
        TabOrder = 10
        Alignment = taLeftJustify
        Caption = 'Sales Acct  '
      end
      object Panel7: TUniPanel
        Left = 5
        Top = 100
        Width = 145
        Height = 20
        Hint = ''
        TabOrder = 11
        Alignment = taLeftJustify
        Caption = 'Repair Labor Applied Acct'
      end
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 30
    Width = 273
    Height = 300
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 56
    IQComponents.Grid.Height = 214
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = DataSource1
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
    IQComponents.Navigator.DataSource = DataSource1
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 56
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 214
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 160
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 189
    DataSource = DataSource1
    Columns = <
      item
        FieldName = 'CODE'
        Title.Caption = 'Code'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WARRANTY'
        Title.Caption = 'Warranty'
        Width = 49
        CheckBoxField.FieldValues = 'Y;N'
      end>
    ExplicitTop = 32
    ExplicitHeight = 246
    Marker = 0
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 42
    Top = 92
  end
  object Table1: TFDTable
    AfterInsert = Table1AfterInsert
    BeforePost = Table1BeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'FAILURE_CODE'
    UpdateOptions.KeyFields = 'ID'
    TableName = 'FAILURE_CODE'
    Left = 35
    Top = 146
    object Table1CODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 10
      FieldName = 'CODE'
      Size = 10
    end
    object Table1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Size = 50
    end
    object Table1WARRANTY: TStringField
      DisplayLabel = 'Warranty '
      DisplayWidth = 7
      FieldName = 'WARRANTY'
      FixedChar = True
      Size = 1
    end
    object Table1GLACCT_ID_SALES_RMA: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_SALES_RMA'
      Visible = False
      Size = 0
    end
    object Table1ID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object Table1GLACCT_ID_WIP: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_WIP'
      Visible = False
      Size = 0
    end
    object Table1GLACCT_ID_FINISHED: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_FINISHED'
      Visible = False
      Size = 0
    end
    object Table1GLACCT_ID_LABOR_APPLIED: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_LABOR_APPLIED'
      Visible = False
      Size = 0
    end
    object Table1GLACCT_ID_LABOR_COGS: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_LABOR_COGS'
      Visible = False
      Size = 0
    end
    object Table1GLACCT_ID_COMP_COGS: TBCDField
      DisplayWidth = 10
      FieldName = 'GLACCT_ID_COMP_COGS'
      Visible = False
      Size = 0
    end
  end
  object QryGLAcct: TFDQuery
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       acct,'
      '       descrip,'
      '       acct || '#39' - '#39' || descrip as disp_acct,'
      '       type,'
      '       eplant_id,'
      '       pk_hide'
      '  from glacct'
      ' ')
    Left = 99
    Top = 147
    object QryGLAcctDISP_ACCT: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 103
      FieldName = 'DISP_ACCT'
      Origin = 'IQ.GLACCT.ACCT'
      Size = 103
    end
    object QryGLAcctACCT: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 30
      FieldName = 'ACCT'
      Origin = 'IQ.GLACCT.ACCT'
      Size = 50
    end
    object QryGLAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.GLACCT.DESCRIP'
      Size = 50
    end
    object QryGLAcctTYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 10
      FieldName = 'TYPE'
      Origin = 'IQ.GLACCT.TYPE'
      Size = 25
    end
    object QryGLAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.GLACCT.EPLANT_ID'
      Size = 0
    end
    object QryGLAcctID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.GLACCT.ID'
      Visible = False
      Size = 0
    end
    object QryGLAcctPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkGLAcct: TIQWebHpick
    BeforeOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       acct,'
      '       descrip,'
      '       type,'
      '       eplant_id,'
      '       pk_hide'
      '  from glacct')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 220
    Top = 139
    object PkGLAcctID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.GLACCT.ID'
      Visible = False
      Size = 0
    end
    object PkGLAcctACCT: TStringField
      DisplayLabel = 'Acct #'
      DisplayWidth = 30
      FieldName = 'ACCT'
      Origin = 'IQ.GLACCT.ACCT'
      Size = 50
    end
    object PkGLAcctDESCRIP: TStringField
      DisplayLabel = 'Description '
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.GLACCT.DESCRIP'
      Size = 50
    end
    object PkGLAcctTYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 15
      FieldName = 'TYPE'
      Origin = 'IQ.GLACCT.TYPE'
      Size = 25
    end
    object PkGLAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'IQ.GLACCT.EPLANT_ID'
      Size = 0
    end
    object PkGLAcctPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.GLACCT.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmFailureCode'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192956 $'
    BuildVersion = '176554'
    Left = 153
    Top = 106
  end
  object PopupMenu1: TUniPopupMenu
    Left = 127
    Top = 207
    object About1: TUniMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
  object ds_GLAcct: TDataSource
    DataSet = QryGLAcct
    Left = 224
    Top = 192
  end
end

object FrmImp: TFrmImp
  Left = 144
  Top = 160
  ClientHeight = 281
  ClientWidth = 412
  Caption = 'Import Files'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 30
    Width = 412
    Height = 251
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 195
    IQComponents.Grid.Height = 165
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcInput
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
    IQComponents.Navigator.DataSource = SrcInput
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 195
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 165
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcInput
    Columns = <
      item
        FieldName = 'FILENAME'
        Title.Caption = 'File'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LAST_UPDATE'
        Title.Caption = 'Last Update'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Schema'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TYPE'
        Title.Caption = 'Schema type'
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
        FieldName = 'Error'
        Title.Caption = 'Errors/Warnings'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 30
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Alignment = taLeftJustify
    Caption = ''
    ExplicitTop = 8
  end
  object MainMenu1: TUniMainMenu
    Left = 184
    Top = 40
    object File1: TUniMenuItem
      Caption = '&File'
      object SchemaMaint1: TUniMenuItem
        Caption = '&Schema Maint.'
        OnClick = SchemaMaint1Click
      end
      object ShowErrorsandWarning1: TUniMenuItem
        Caption = 'Show &Errors and Warnings'
        OnClick = ShowErrorsandWarning1Click
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object Abortprocessing1: TUniMenuItem
        Caption = '&Abort processing'
        OnClick = Abortprocessing1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TUniMenuItem
      Caption = 'Options'
      object Parseonly1: TUniMenuItem
        Caption = 'Parse only'
        OnClick = Parseonly1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        ShortCut = 112
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcInput: TDataSource
    DataSet = QryInput
    Left = 16
    Top = 118
  end
  object QryInput: TFDQuery
    OnCalcFields = QryInputCalcFields
    CachedUpdates = True
    OnUpdateRecord = QryInputUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select s.filename,'
      '       s.last_update,'
      '       a.descrip,'
      '       a.type,'
      '       r.custno,'
      '       r.company,'
      '       s.id,'
      '       a.id as arcusto_schema_id '
      '  from input_file s,'
      '       arcusto_schema a,'
      '       arcusto r'
      ' where s.arcusto_schema_id = a.id(+)'
      '   and a.arcusto_id = r.id(+)'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 32
    Top = 118
    object QryInputFILENAME: TStringField
      DisplayLabel = 'File'
      DisplayWidth = 50
      FieldName = 'FILENAME'
      Origin = 's.FILENAME'
      Size = 255
    end
    object QryInputLAST_UPDATE: TDateTimeField
      DisplayLabel = 'Last Update'
      DisplayWidth = 18
      FieldName = 'LAST_UPDATE'
      Origin = 's.LAST_UPDATE'
    end
    object QryInputDESCRIP: TStringField
      DisplayLabel = 'Schema'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'a.DESCRIP'
      Size = 50
    end
    object QryInputTYPE: TStringField
      DisplayLabel = 'Schema type'
      DisplayWidth = 20
      FieldName = 'TYPE'
      Origin = 'a.TYPE'
    end
    object QryInputCUSTNO: TStringField
      DisplayLabel = 'Cust#'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'r.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryInputCOMPANY: TStringField
      DisplayLabel = 'Customer'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'r.COMPANY'
      FixedChar = True
      Size = 60
    end
    object QryInputError: TStringField
      DisplayLabel = 'Errors/Warnings'
      DisplayWidth = 15
      FieldKind = fkCalculated
      FieldName = 'Error'
      Calculated = True
    end
    object QryInputID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object QryInputARCUSTO_SCHEMA_ID: TBCDField
      FieldName = 'ARCUSTO_SCHEMA_ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 112
    Top = 118
    object ShowErrorsandWarnings1: TUniMenuItem
      Caption = 'Show &Errors and Warnings'
      OnClick = ShowErrorsandWarning1Click
    end
    object ApplyTemplates1: TUniMenuItem
      Caption = '&Apply Templates'
      OnClick = ApplyTemplates1Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object CreateOrders1: TUniMenuItem
      Caption = '&Create Orders'
      OnClick = CreateOrders1Click
    end
    object Showparsedfile1: TUniMenuItem
      Caption = '&Show parsed file'
      OnClick = Showparsedfile1Click
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Import Files'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 196373 $'
    BuildVersion = '176554'
    Left = 160
    Top = 118
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'SchemaMaint1'
      'Parseonly1')
    SecurityCode = 'FRMIMP'
    Left = 216
    Top = 126
  end
end

object FrmPkChoice: TFrmPkChoice
  Left = 358
  Top = 205
  ClientHeight = 283
  ClientWidth = 536
  Caption = 'Select a Choice'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlGrid: TUniPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 242
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 534
      Height = 240
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 317
      IQComponents.Grid.Height = 154
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcData
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
      IQComponents.Navigator.DataSource = SrcData
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 317
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 154
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitLeft = 0
      IQComponents.FormTab.ExplicitTop = 0
      IQComponents.FormTab.ExplicitWidth = 256
      IQComponents.FormTab.ExplicitHeight = 128
      DataSource = SrcData
      Columns = <
        item
          FieldName = 'SEQ'
          Title.Caption = '#'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SALES_CHOICE_DESCRIP'
          Title.Caption = 'Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRICE'
          Title.Caption = 'Price'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CODE'
          Title.Caption = 'Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object PnlButtons: TUniPanel
    Left = 0
    Top = 242
    Width = 536
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Left = 318
      Top = 1
      Width = 218
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOk: TUniBitBtn
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Enabled = False
        Caption = '&OK'
        ModalResult = 1
        TabOrder = 0
        Default = True
        OnClick = btnOkClick
      end
      object btnCancel: TUniBitBtn
        Left = 112
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object SrcData: TDataSource
    DataSet = QryData
    OnDataChange = SrcDataDataChange
    Left = 57
    Top = 55
  end
  object QryData: TFDQuery
    Active = True
    BeforeOpen = DoBeforeOpen
    OnCalcFields = QryDataCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      '  SELECT a.id AS sales_option_choice_id,'
      '         a.sales_config_option_id AS sales_config_option_id,'
      '         a.seq AS seq,'
      '         a.descrip AS sales_choice_descrip,'
      '         a.price AS price,'
      '         a.markup AS markup,'
      '         a.markup_type AS markup_type,'
      '         a.markup_compound AS markup_compound,'
      '         a.code AS code'
      '    FROM sales_option_choice a'
      '   WHERE a.sales_config_option_id = :SALES_CONFIG_OPTION_ID AND'
      '         NVL(a.pk_hide, '#39'N'#39') = '#39'N'#39' and'
      
        '         crm_quote_misc.filter_option_choice_by_attr( :crm_quote' +
        '_detail_id, a.id ) = 1'
      'ORDER BY a.seq')
    Left = 57
    Top = 83
    ParamData = <
      item
        Name = 'SALES_CONFIG_OPTION_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'CRM_QUOTE_DETAIL_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryDataSEQ: TBCDField
      DisplayLabel = '#'
      DisplayWidth = 5
      FieldName = 'SEQ'
      Origin = 'SEQ'
      Precision = 3
      Size = 0
    end
    object QryDataSALES_CHOICE_DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 28
      FieldName = 'SALES_CHOICE_DESCRIP'
      Origin = 'SALES_CHOICE_DESCRIP'
      Size = 60
    end
    object QryDataPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      DisplayWidth = 11
      FieldName = 'PRICE'
      Origin = 'PRICE'
      Precision = 15
      Size = 6
    end
    object QryDataCODE: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 15
      FieldName = 'CODE'
      Origin = 'CODE'
      Size = 30
    end
    object QryDataForbidden: TBooleanField
      DisplayWidth = 7
      FieldKind = fkCalculated
      FieldName = 'Forbidden'
      Origin = '0'
      Visible = False
      Calculated = True
    end
    object QryDataSALES_OPTION_CHOICE_ID: TBCDField
      FieldName = 'SALES_OPTION_CHOICE_ID'
      Origin = 'SALES_OPTION_CHOICE_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryDataSALES_CONFIG_OPTION_ID: TBCDField
      FieldName = 'SALES_CONFIG_OPTION_ID'
      Origin = 'SALES_CONFIG_OPTION_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryDataMARKUP: TFMTBCDField
      FieldName = 'MARKUP'
      Origin = 'MARKUP'
      Visible = False
      Precision = 15
      Size = 6
    end
    object QryDataMARKUP_TYPE: TBCDField
      FieldName = 'MARKUP_TYPE'
      Origin = 'MARKUP_TYPE'
      Visible = False
      Precision = 1
      Size = 0
    end
    object QryDataMARKUP_COMPOUND: TStringField
      FieldName = 'MARKUP_COMPOUND'
      Origin = 'MARKUP_COMPOUND'
      Visible = False
      Size = 1
    end
  end
  object QryExcludes: TFDQuery
    MasterSource = SrcData
    MasterFields = 'SALES_OPTION_CHOICE_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT dependant_option_id,'
      '       dependant_choice_id,'
      '       operator'
      '  FROM sales_choice_exception'
      ' WHERE sales_option_choice_id = :SALES_OPTION_CHOICE_ID')
    Left = 57
    Top = 111
    ParamData = <
      item
        Name = 'SALES_OPTION_CHOICE_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryExcludesDEPENDANT_OPTION_ID: TBCDField
      FieldName = 'DEPENDANT_OPTION_ID'
      Origin = 'DEPENDANT_OPTION_ID'
      Precision = 15
      Size = 0
    end
    object QryExcludesDEPENDANT_CHOICE_ID: TBCDField
      FieldName = 'DEPENDANT_CHOICE_ID'
      Origin = 'DEPENDANT_CHOICE_ID'
      Precision = 15
      Size = 0
    end
    object QryExcludesOPERATOR: TStringField
      FieldName = 'OPERATOR'
      Origin = 'OPERATOR'
      Size = 3
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 200
    Top = 64
    object Refresh1: TUniMenuItem
      Caption = 'Refresh'
      ShortCut = 116
      OnClick = Refresh1Click
    end
  end
end

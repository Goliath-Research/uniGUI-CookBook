object FrmForecastSaveDlg: TFrmForecastSaveDlg
  Left = 196
  Top = 189
  ClientHeight = 237
  ClientWidth = 478
  Caption = 'Forecast '
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -14
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object GroupBox2: TUniGroupBox
    Left = 5
    Top = 2
    Width = 336
    Height = 104
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '  Customers  '
    TabOrder = 0
    object Label6: TUniLabel
      Left = 48
      Top = 74
      Width = 60
      Height = 17
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Customer'
      TabOrder = 4
    end
    object rbtnAll_Cust: TUniRadioButton
      Left = 10
      Top = 21
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Checked = True
      Caption = 'All Customers'
      TabOrder = 0
    end
    object rbtnOne_Cust: TUniRadioButton
      Left = 10
      Top = 47
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Select Customer'
      TabOrder = 1
    end
    object wwcombCustomer: TUniDBLookupComboBox
      Left = 112
      Top = 69
      Width = 215
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListOnlyMode = lmFollowSource
      ListField = 'COMPANY'
      ListSource = Src_wwQryCustomer
      KeyField = 'CUSTNO'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  object GroupBox1: TUniGroupBox
    Left = 5
    Top = 108
    Width = 336
    Height = 104
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Inventory '
    TabOrder = 1
    object Label1: TUniLabel
      Left = 48
      Top = 74
      Width = 42
      Height = 17
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Item #'
      TabOrder = 4
    end
    object rbtnAll_Items: TUniRadioButton
      Left = 10
      Top = 21
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Checked = True
      Caption = 'All Items'
      TabOrder = 0
    end
    object rbtnOne_Item: TUniRadioButton
      Left = 10
      Top = 47
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'One Inventory Item'
      TabOrder = 1
    end
    object wwcombItem: TUniDBLookupComboBox
      Left = 112
      Top = 69
      Width = 215
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListOnlyMode = lmFollowSource
      ListField = 'CLASS; ITEMNO; DESCRIP; REV'
      ListSource = Src_wwQryItems
      KeyField = 'ITEMNO'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  object GroupBox3: TUniGroupBox
    Left = 5
    Top = 215
    Width = 336
    Height = 83
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '  Select Dates Scope  '
    TabOrder = 2
    object Label2: TUniLabel
      Left = 10
      Top = 28
      Width = 32
      Height = 17
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'From'
      TabOrder = 3
    end
    object Label3: TUniLabel
      Left = 181
      Top = 28
      Width = 16
      Height = 17
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'To'
      TabOrder = 4
    end
    object lblCurrentQuarter: TUniLabel
      Left = 47
      Top = 57
      Width = 340
      Height = 18
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Current Quarter: 3  [ mm/dd/yyyy - mm/dd/yyyy ]'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -15
      TabOrder = 5
    end
    object DateTimePicker1: TUniDateTimePicker
      Left = 48
      Top = 23
      Width = 119
      Height = 24
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DateTime = 42641.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 0
    end
    object DateTimePicker2: TUniDateTimePicker
      Left = 207
      Top = 23
      Width = 119
      Height = 24
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DateTime = 42641.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
  end
  object btnOK: TUniButton
    Left = 352
    Top = 10
    Width = 119
    Height = 31
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 352
    Top = 49
    Width = 119
    Height = 31
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 4
  end
  object wwQryCustomer: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select Distinct a.custno,'
      '       a.company,'
      '       f.arcusto_id'
      '  from arcusto a,'
      '       fore_cust f'
      ' where f.arcusto_id = a.id'
      'order by custno'
      ' '
      ' ')
    Left = 262
    Top = 20
    object wwQryCustomerCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      Size = 10
    end
    object wwQryCustomerCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 25
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
    object wwQryCustomerARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO.ID'
      Visible = False
      Size = 0
    end
  end
  object wwQryItems: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select f.arinvt_id,'
      '       a.itemno,'
      '       a.class,'
      '       a.rev,'
      '       a.descrip'
      '  from arinvt a,'
      '       fore_item f'
      ' where f.arinvt_id = a.id'
      ' order by itemno'
      ' ')
    Left = 236
    Top = 112
    object wwQryItemsITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 20
      FieldName = 'ITEMNO'
      Origin = 'ARINVT.ITEMNO'
      Size = 25
    end
    object wwQryItemsCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Origin = 'ARINVT.CLASS'
      Size = 2
    end
    object wwQryItemsREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      Origin = 'ARINVT.REV'
      Size = 15
    end
    object wwQryItemsDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Origin = 'ARINVT.DESCRIP'
      Size = 100
    end
    object wwQryItemsARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'FORE_ITEM.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object procBackup: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.FORECAST.DOBACKUP'
    Left = 288
    Top = 88
    ParamData = <
      item
        Name = 'V_ARINVT_ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'V_ARCUSTO_ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'V_START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_END_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_KIND'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object procGet_Quarter: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.FORECAST.GET_QUARTER_BY_DATE'
    Left = 328
    Top = 88
    ParamData = <
      item
        Name = 'V_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_QUARTER'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end
      item
        Name = 'V_QTR_START_DATE'
        DataType = ftDateTime
        ParamType = ptInputOutput
      end
      item
        Name = 'V_QTR_END_DATE'
        DataType = ftDateTime
        ParamType = ptInputOutput
      end>
  end
  object procRestore: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.FORECAST.DORESTORE'
    Left = 289
    Top = 124
    ParamData = <
      item
        Name = 'V_ARINVT_ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'V_ARCUSTO_ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'V_START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_END_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'V_KIND'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object Src_wwQryCustomer: TDataSource
    DataSet = wwQryCustomer
    Left = 168
    Top = 16
  end
  object Src_wwQryItems: TDataSource
    DataSet = wwQryItems
    Left = 160
    Top = 120
  end
end

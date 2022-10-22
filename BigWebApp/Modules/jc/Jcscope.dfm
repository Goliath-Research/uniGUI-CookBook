inherited FrmJCScope: TFrmJCScope
  Left = 329
  Top = 197
  ClientHeight = 221
  ClientWidth = 507
  Caption = 'JC Scope'
  ExplicitWidth = 513
  ExplicitHeight = 250
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox1: TUniGroupBox
    Width = 507
    Height = 182
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = '  Select Scope  '
    ExplicitWidth = 507
    ExplicitHeight = 170
    object Label3: TUniLabel [0]
      Left = 14
      Top = 97
      Width = 39
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Order #'
      TabOrder = 10
    end
    object Label4: TUniLabel [1]
      Left = 276
      Top = 97
      Width = 32
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'MFG #'
      TabOrder = 11
    end
    object Label5: TUniLabel [2]
      Left = 14
      Top = 131
      Width = 29
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'WO #'
      TabOrder = 12
    end
    object Label6: TUniLabel [3]
      Left = 276
      Top = 131
      Width = 26
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Lot #'
      TabOrder = 13
    end
    object Label7: TUniLabel [4]
      Left = 14
      Top = 25
      Width = 33
      Height = 13
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Item #'
      TabOrder = 14
    end
    inherited Label1: TUniLabel
      Left = 14
      Top = 63
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 8
      ExplicitLeft = 14
      ExplicitTop = 63
    end
    inherited Label2: TUniLabel
      Left = 276
      Top = 63
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 9
      ExplicitLeft = 276
      ExplicitTop = 63
    end
    inherited DateTimePicker1: TUniDateTimePicker
      Left = 71
      Top = 58
      Width = 172
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 1
      ExplicitLeft = 71
      ExplicitTop = 58
      ExplicitWidth = 172
    end
    inherited DateTimePicker2: TUniDateTimePicker
      Left = 324
      Top = 58
      Width = 173
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 2
      ExplicitLeft = 324
      ExplicitTop = 58
      ExplicitWidth = 173
    end
    object dbOrderno: TUniDBLookupComboBox
      Left = 71
      Top = 93
      Width = 172
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListField = 'DESCRIP'
      ListSource = srcOrderno
      KeyField = 'ORDERNO'
      ListFieldIndex = 0
      ClearButton = True
      TabOrder = 3
      Color = clWindow
    end
    object DbMfgNo: TUniDBLookupComboBox
      Left = 324
      Top = 92
      Width = 173
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListField = 'MFGNO'
      ListSource = srcMfgNo
      KeyField = 'MFGNO'
      ListFieldIndex = 0
      TabOrder = 4
      Color = clWindow
    end
    object wwDBLookupComboWO: TUniDBLookupComboBox
      Left = 71
      Top = 126
      Width = 172
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListField = 'WORKORDER_ID'
      ListSource = srcWO
      KeyField = 'WORKORDER_ID'
      ListFieldIndex = 0
      TabOrder = 5
      Color = clWindow
    end
    object dbLotNo: TUniDBLookupComboBox
      Left = 324
      Top = 126
      Width = 173
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListField = 'FG_LOTNO'
      ListSource = srcLotNo
      KeyField = 'FG_LOTNO'
      ListFieldIndex = 0
      TabOrder = 6
      Color = clWindow
    end
    object wwDBComboDlgItemNo: TUniEdit
      Left = 71
      Top = 25
      Width = 426
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = ''
      TabOrder = 0
      OnKeyDown = wwDBComboDlgItemNoKeyDown
    end
  end
  inherited Panel1: TUniPanel
    Top = 182
    Width = 507
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 182
    ExplicitWidth = 507
    inherited Panel2: TUniPanel
      Left = 300
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ExplicitLeft = 300
      inherited btnOK: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
      inherited btnCancel: TUniButton
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
      end
    end
  end
  object QryOrderno: TFDQuery
    BeforeOpen = AssignParams
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct orderno from translog'
      'where trans_date between :date_start and :date_end'
      ''
      '')
    Left = 72
    Top = 80
    ParamData = <
      item
        Name = 'date_start'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date_end'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryOrdernoORDERNO: TStringField
      DisplayLabel = 'Order#'
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Origin = 'TRANSLOG.ORDERNO'
      Size = 15
    end
  end
  object QryMfgNo: TFDQuery
    BeforeOpen = AssignParams
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct mfgno from translog'
      'where trans_date between :date_start and :date_end')
    Left = 329
    Top = 80
    ParamData = <
      item
        Name = 'date_start'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date_end'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryMfgNoMFGNO: TStringField
      DisplayLabel = 'Mfg#'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 'TRANSLOG.MFGNO'
      Size = 50
    end
  end
  object wwQryWO: TFDQuery
    BeforeOpen = AssignParams
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct workorder_id from translog'
      'where workorder_id > 0'
      '   and trans_date between :date_start and :date_end')
    Left = 67
    Top = 128
    ParamData = <
      item
        Name = 'date_start'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date_end'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object wwQryWOWORKORDER_ID: TBCDField
      DisplayLabel = 'WO #'
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Origin = 'IQ.TRANSLOG.WORKORDER_ID'
      Size = 0
    end
  end
  object wwQryLotNo: TFDQuery
    BeforeOpen = AssignParams
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct fg_lotno from translog'
      'where trans_date between :date_start and :date_end')
    Left = 326
    Top = 128
    ParamData = <
      item
        Name = 'date_start'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date_end'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object wwQryLotNoFG_LOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 25
      FieldName = 'FG_LOTNO'
      Origin = 'IQ.TRANSLOG.FG_LOTNO'
      FixedChar = True
      Size = 25
    end
  end
  object PkArinvt: TIQWebHpick
    SQL.Strings = (
      'select arinvt.id,'
      '       arinvt.class,'
      '       arinvt.itemno,'
      '       arinvt.rev,'
      '       arinvt.descrip,'
      '       arinvt.descrip2,'
      '       arinvt.eplant_id,'
      '       arinvt.arcusto_id,'
      '       arcusto.custno,'
      '       arcusto.company,'
      '       arinvt.pk_hide'
      '  from arinvt,'
      '       arcusto'
      ' where arinvt.arcusto_id = arcusto.id(+)'
      '   and misc.eplant_filter( arinvt.eplant_id ) = 1'
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 13
    Top = 178
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
    object PkArinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
    object PkArinvtREV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object PkArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
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
    object PkArinvtARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'IQ.ARINVT.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkArinvtCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkArinvtCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object PkArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object srcLotNo: TDataSource
    DataSet = wwQryLotNo
    Left = 376
    Top = 136
  end
  object srcWO: TDataSource
    DataSet = wwQryWO
    Left = 104
    Top = 136
  end
  object srcMfgNo: TDataSource
    DataSet = QryMfgNo
    Left = 376
    Top = 88
  end
  object srcOrderno: TDataSource
    DataSet = QryOrderno
    Left = 120
    Top = 88
  end
end

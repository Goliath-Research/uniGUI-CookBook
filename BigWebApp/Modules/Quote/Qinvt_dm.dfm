object QInvtDM: TQInvtDM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 430
  Width = 626
  object TblArinvtBreaks: TFDTable
    OnCalcFields = TblArinvtBreaksCalcFields
    Filtered = True
    OnFilterRecord = TblArinvtBreaksFilterRecord
    IndexFieldNames = 'ARINVT_ID'
    MasterSource = SrcArinvt
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evItems]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'ARINVT_BREAKS'
    TableName = 'ARINVT_BREAKS'
    Left = 98
    Top = 76
    object TblArinvtBreaksARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblArinvtBreaksQUAN: TBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QUAN'
      Required = True
      Size = 2
    end
    object TblArinvtBreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      FieldName = 'QPRICE'
      DisplayFormat = '#########.##0000'
      Size = 6
    end
    object TblArinvtBreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      FieldName = 'PRICE_DATE'
    end
    object TblArinvtBreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      FieldName = 'EFFECT_DATE'
    end
    object TblArinvtBreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      FieldName = 'DEACTIVE_DATE'
    end
    object TblArinvtBreaksBUYING: TStringField
      FieldName = 'BUYING'
      FixedChar = True
      Size = 1
    end
    object TblArinvtBreaksID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblArinvtBreaksStd_Cost: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Std_Cost'
      DisplayFormat = '#########.##0000'
      Calculated = True
    end
    object TblArinvtBreaksStd_Cost_Control: TStringField
      FieldKind = fkCalculated
      FieldName = 'Std_Cost_Control'
      Size = 60
      Calculated = True
    end
  end
  object SrcArinvtBreaks: TDataSource
    DataSet = TblArinvtBreaks
    Left = 116
    Top = 98
  end
  object TblQinvtBreaks: TFDTable
    BeforeInsert = PostParentsBeforeEdit
    BeforeEdit = PostParentsBeforeEdit
    BeforePost = TblQinvtBreaksBeforePost
    OnCalcFields = TblQinvtBreaksCalcFields
    OnNewRecord = TblQinvtBreaksNewRecord
    Filtered = True
    IndexFieldNames = 'QINVT_ID'
    MasterSource = SrcQInvt
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'QINVT_QTY_BREAKS'
    TableName = 'QINVT_QTY_BREAKS'
    Left = 94
    Top = 8
    object TblQinvtBreaksQINVT_ID: TBCDField
      FieldName = 'QINVT_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblQinvtBreaksQUAN: TBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QUAN'
      Required = True
      Size = 0
    end
    object TblQinvtBreaksQPRICE: TFMTBCDField
      DisplayLabel = 'Price'
      FieldName = 'QPRICE'
      DisplayFormat = '#########.##0000'
      Size = 6
    end
    object TblQinvtBreaksPRICE_DATE: TDateTimeField
      DisplayLabel = 'Price Date'
      FieldName = 'PRICE_DATE'
    end
    object TblQinvtBreaksEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      FieldName = 'EFFECT_DATE'
    end
    object TblQinvtBreaksDEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      FieldName = 'DEACTIVE_DATE'
      EditMask = '!##/##/####;1;_'
    end
    object TblQinvtBreaksID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object TblQinvtBreaksStd_Cost: TFMTBCDField
      FieldKind = fkCalculated
      FieldName = 'Std_Cost'
      DisplayFormat = '#########.##0000'
      Calculated = True
    end
    object TblQinvtBreaksStd_Cost_Control: TStringField
      FieldKind = fkCalculated
      FieldName = 'Std_Cost_Control'
      Size = 60
      Calculated = True
    end
  end
  object SrcQInvtBreaks: TDataSource
    DataSet = TblQinvtBreaks
    OnDataChange = SrcQInvtBreaksDataChange
    Left = 108
    Top = 28
  end
  object TblArinvt: TFDTable
    BeforeOpen = TblArinvtBeforeOpen
    AfterOpen = TblArinvtAfterOpen
    BeforeInsert = AbortOnInsert
    AfterScroll = TblArinvtAfterScroll
    Filtered = True
    IndexFieldNames = 'CLASS;ITEMNO;REV'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'ARINVT'
    TableName = 'ARINVT'
    Left = 22
    Top = 80
    object TblArinvtSTD_COST: TFMTBCDField
      DisplayLabel = 'Std Cost'
      DisplayWidth = 10
      FieldName = 'STD_COST'
    end
    object TblArinvtSTD_COST_CONTROL: TStringField
      DisplayLabel = 'Std Cost Control'
      DisplayWidth = 30
      FieldName = 'STD_COST_CONTROL'
      Size = 60
    end
    object TblArinvtID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object TblArinvtCLASS: TStringField
      DisplayLabel = 'CL'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Required = True
      Visible = False
      Size = 2
    end
    object TblArinvtITEMNO: TStringField
      DisplayLabel = 'Item Number'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      Required = True
      Visible = False
      Size = 50
    end
    object TblArinvtREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Required = True
      Visible = False
      Size = 15
    end
    object TblArinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Required = True
      Visible = False
      Size = 100
    end
    object TblArinvtUNIT: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 5
      FieldName = 'UNIT'
      Required = True
      Visible = False
      Size = 10
    end
    object TblArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Visible = False
      Size = 100
    end
    object TblArinvtSPG: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'SPG'
      Visible = False
    end
    object TblArinvtEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object TblArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object TblArinvtIS_BY_PRODUCT: TStringField
      FieldName = 'IS_BY_PRODUCT'
      Visible = False
      Size = 1
    end
    object TblArinvtGAUGE: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'GAUGE'
      Visible = False
    end
    object TblArinvtLENGTH: TFMTBCDField
      FieldName = 'LENGTH'
      Visible = False
    end
    object TblArinvtWIDTH: TFMTBCDField
      FieldName = 'WIDTH'
      Visible = False
    end
    object TblArinvtRFQ_USE_STD_COST: TStringField
      FieldName = 'RFQ_USE_STD_COST'
      Visible = False
      Size = 1
    end
    object TblArinvtSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcArinvt: TDataSource
    DataSet = TblArinvt
    OnDataChange = SrcArinvtDataChange
    Left = 36
    Top = 102
  end
  object TblQInvt: TFDTable
    BeforePost = AssignIDBeforePost
    OnCalcFields = TblQInvtCalcFields
    OnNewRecord = TblQInvtNewRecord
    IndexFieldNames = 'CLASS;ITEMNO;REV'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'QINVT'
    TableName = 'QINVT'
    Left = 22
    Top = 6
    object TblQInvtID: TBCDField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Visible = False
      Size = 0
    end
    object TblQInvtCLASS: TStringField
      DisplayLabel = 'CL'
      DisplayWidth = 2
      FieldName = 'CLASS'
      Required = True
      Size = 2
    end
    object TblQInvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      Required = True
      Size = 50
    end
    object TblQInvtREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object TblQInvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 100
    end
    object TblQInvtUNIT: TStringField
      DisplayLabel = 'Unit'
      DisplayWidth = 5
      FieldName = 'UNIT'
      Size = 10
    end
    object TblQInvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object TblQInvtSTDCAV: TFMTBCDField
      FieldName = 'STDCAV'
      Visible = False
      Size = 6
    end
    object TblQInvtPTWT: TFMTBCDField
      FieldName = 'PTWT'
      Visible = False
      Size = 6
    end
    object TblQInvtPT_VOL: TFMTBCDField
      FieldName = 'PT_VOL'
      Visible = False
      Size = 6
    end
    object TblQInvtQUOTE_ID: TBCDField
      FieldName = 'QUOTE_ID'
      Visible = False
      Size = 0
    end
    object TblQInvtSPG: TFMTBCDField
      FieldName = 'SPG'
      Size = 6
    end
    object TblQInvtRfq: TStringField
      DisplayLabel = 'Rfq #'
      FieldKind = fkCalculated
      FieldName = 'Rfq'
      Calculated = True
    end
    object TblQInvtIS_BY_PRODUCT: TStringField
      FieldName = 'IS_BY_PRODUCT'
      Visible = False
      Size = 1
    end
    object TblQInvtGAUGE: TFMTBCDField
      DisplayLabel = 'Gauge'
      FieldName = 'GAUGE'
    end
    object TblQInvtDEDUCT_BY_PRODUCT_VALUE: TStringField
      FieldName = 'DEDUCT_BY_PRODUCT_VALUE'
      Visible = False
      Size = 1
    end
    object TblQInvtLENGTH: TFMTBCDField
      FieldName = 'LENGTH'
      Visible = False
      Size = 6
    end
    object TblQInvtWIDTH: TFMTBCDField
      FieldName = 'WIDTH'
      Visible = False
      Size = 6
    end
    object TblQInvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
    object TblQInvtARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object TblQInvtStd_Cost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Std_Cost'
      Calculated = True
    end
    object TblQInvtStd_Cost_Control: TStringField
      FieldKind = fkCalculated
      FieldName = 'Std_Cost_Control'
      Size = 60
      Calculated = True
    end
  end
  object SrcQInvt: TDataSource
    DataSet = TblQInvt
    OnDataChange = SrcQInvtDataChange
    Left = 36
    Top = 28
  end
  object PkQinvt: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select q.itemno as itemno,  '
      '       q.class as class,  '
      '       q.rev as rev,  '
      '       q.descrip as descrip,    '
      '       q.descrip2 as descrip2,  '
      '       q.unit as unit,  '
      '       q.id as id,'
      '       rfq.rfq as rfq,'
      '       q.pk_hide as pk_hide'
      '  from QINVT q, quote rfq'
      ' where q.quote_id = rfq.id(+)')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 26
    Top = 243
    object PkQinvtITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkQinvtCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkQinvtDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkQinvtREV: TStringField
      DisplayLabel = 'Revision'
      FieldName = 'REV'
      Size = 15
    end
    object PkQinvtUNIT: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Size = 10
    end
    object PkQinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.QINVT.ID'
      Visible = False
      Size = 0
    end
    object PkQinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.QINVT.DESCRIP2'
      Size = 100
    end
    object PkQinvtRFQ: TStringField
      DisplayLabel = 'RFQ #'
      FieldName = 'RFQ'
      FixedChar = True
    end
    object PkQinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object PkArinvt: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select itemno, class, rev, descrip, unit, id, pk_hide, descrip2'
      '  from ARINVT'
      ' where misc.eplant_filter( eplant_id ) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 26
    Top = 298
    object StringField1: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object StringField2: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object StringField3: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object StringField4: TStringField
      DisplayLabel = 'Revision'
      FieldName = 'REV'
      Size = 15
    end
    object StringField5: TStringField
      DisplayLabel = 'Unit'
      FieldName = 'UNIT'
      Size = 10
    end
    object PkArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      Visible = False
      Size = 0
    end
    object PkArinvtPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.ARINVT.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArinvtDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
  end
  object SrcQOpMat: TDataSource
    Left = 207
    Top = 31
  end
  object SrcQOpMat_Qty_Breaks: TDataSource
    OnDataChange = SrcQOpMat_Qty_BreaksDataChange
    Left = 308
    Top = 31
  end
  object SrcQuote: TDataSource
    Left = 208
    Top = 92
  end
  object SrcQMat_Qty_Breaks: TDataSource
    OnDataChange = SrcQMat_Qty_BreaksDataChange
    Left = 304
    Top = 92
  end
  object PkQinvt_IN: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select q.itemno as itemno,  '
      '       q.class as class,  '
      '       q.rev as rev,  '
      '       q.descrip as descrip,    '
      '       q.descrip2 as descrip2,  '
      '       q.id as id,'
      '       rfq.rfq as rfq,'
      '       q.pk_hide as pk_hide'
      '  from QINVT q, quote rfq'
      ' where q.quote_id = rfq.id(+)'
      '   and class = '#39'IN'#39
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 218
    Top = 243
    object StringField6: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object StringField7: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object StringField8: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object FloatField1: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkQinvt_INCLASS: TStringField
      FieldName = 'CLASS'
      Visible = False
      Size = 2
    end
    object PkQinvt_INDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.QINVT.DESCRIP2'
      Size = 100
    end
    object PkQinvt_INRFQ: TStringField
      FieldName = 'RFQ'
      FixedChar = True
    end
    object PkQinvt_INPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object PkQinvt_PK: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select q.itemno as itemno,  '
      '       q.class as class,  '
      '       q.rev as rev,  '
      '       q.descrip as descrip,    '
      '       q.descrip2 as descrip2,  '
      '       q.unit as unit,  '
      '       q.id as id,'
      '       rfq.rfq as rfq,'
      '       q.pk_hide as pk_hide'
      '  from QINVT q, quote rfq'
      ' where q.quote_id = rfq.id(+)'
      '   and class = '#39'PK'#39
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 151
    Top = 243
    object StringField9: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object StringField10: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object StringField11: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object FloatField2: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkQinvt_PKCLASS: TStringField
      FieldName = 'CLASS'
      Visible = False
      Size = 2
    end
    object PkQinvt_PKDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.QINVT.DESCRIP2'
      Size = 100
    end
    object PkQinvt_PKRFQ: TStringField
      DisplayLabel = 'RFQ #'
      FieldName = 'RFQ'
      FixedChar = True
    end
    object PkQinvt_PKPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object PkQinvt_PL: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select q.itemno as itemno,  '
      '       q.class as class,  '
      '       q.rev as rev,  '
      '       q.descrip as descrip,    '
      '       q.descrip2 as descrip2,  '
      '       q.id as id,'
      '       rfq.rfq as rfq,'
      '       q.pk_hide as pk_hide'
      '  from v_qinvt_prime_material q, quote rfq'
      ' where q.quote_id = rfq.id(+)'
      ''
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 86
    Top = 243
    object StringField12: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object StringField13: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object StringField14: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object FloatField3: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkQinvt_PLCLASS: TStringField
      FieldName = 'CLASS'
      Visible = False
      Size = 2
    end
    object PkQinvt_PLDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.V_QINVT_PRIME_MATERIAL.DESCRIP2'
      Size = 100
    end
    object PkQinvt_PLRFQ: TStringField
      DisplayLabel = 'RFQ #'
      FieldName = 'RFQ'
      FixedChar = True
    end
    object PkQinvt_PLPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object PkArinvt_PL: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select itemno,'
      '       descrip,'
      '       rev,'
      '       class,'
      '       id,'
      '       pk_hide,'
      '       descrip2'
      '  from v_arinvt_prime_material'
      ' where misc.eplant_filter( eplant_id ) = 1 ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 87
    Top = 298
    object PkArinvt_PLITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArinvt_PLDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArinvt_PLREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object PkArinvt_PLCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Visible = False
      Size = 2
    end
    object PkArinvt_PLID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvt_PLPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARINVT_PRIME_MATERIAL.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArinvt_PLDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.V_ARINVT_PRIME_MATERIAL.DESCRIP2'
      Size = 100
    end
  end
  object PkArinvt_PK: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select itemno,'
      '          descrip,'
      '           rev,'
      '           class,'
      '           id,'
      '           pk_hide,'
      '           descrip2'
      'from arinvt'
      'where class = '#39'PK'#39
      ' and misc.eplant_filter( eplant_id ) = 1'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 152
    Top = 298
    object PkArinvt_PKITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArinvt_PKDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArinvt_PKREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object PkArinvt_PKCLASS: TStringField
      FieldName = 'CLASS'
      Visible = False
      Size = 2
    end
    object PkArinvt_PKID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvt_PKPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.ARINVT.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArinvt_PKDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
  end
  object PkArinvt_IN: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select itemno,'
      '          descrip,'
      '           rev,'
      '           class,'
      '           id,'
      '           pk_hide,'
      'descrip2'
      'from arinvt'
      'where class = '#39'IN'#39
      '  and misc.eplant_filter( eplant_id ) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 218
    Top = 298
    object PkArinvt_INITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkArinvt_INDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkArinvt_INREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object PkArinvt_INCLASS: TStringField
      FieldName = 'CLASS'
      Visible = False
      Size = 2
    end
    object PkArinvt_INID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvt_INPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.ARINVT.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArinvt_INDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
  end
  object SrcQOpMatByProduct: TDataSource
    Left = 464
    Top = 93
  end
  object PkQinvt_ByProd: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select q.itemno as itemno,  '
      '       q.class as class,  '
      '       q.rev as rev,  '
      '       q.descrip as descrip,    '
      '       q.descrip2 as descrip2,  '
      '       q.id as id,'
      '       rfq.rfq as rfq,'
      '       q.pk_hide as pk_hide'
      '  from v_qinvt_by_product q, quote rfq'
      ' where q.quote_id = rfq.id(+)'
      ''
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 298
    Top = 243
    object StringField15: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object StringField16: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object StringField17: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object FloatField4: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object StringField18: TStringField
      FieldName = 'CLASS'
      Visible = False
      Size = 2
    end
    object PkQinvt_ByProdDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.V_QINVT_BY_PRODUCT.DESCRIP2'
      Size = 100
    end
    object PkQinvt_ByProdRFQ: TStringField
      DisplayLabel = 'RFQ #'
      FieldName = 'RFQ'
      FixedChar = True
    end
    object PkQinvt_ByProdPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
  end
  object PkArinvt_ByProd: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select itemno,'
      '       descrip,'
      '       rev,'
      '       class,'
      '       id,'
      '       pk_hide,'
      '       descrip2'
      '  from v_arinvt_by_product'
      ' where misc.eplant_filter( eplant_id ) = 1 ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 300
    Top = 298
    object StringField19: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object StringField20: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 100
    end
    object StringField21: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object StringField22: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Visible = False
      Size = 2
    end
    object FloatField5: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkArinvt_ByProdPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.V_ARINVT_BY_PRODUCT.PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object PkArinvt_ByProdDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'IQ.V_ARINVT_BY_PRODUCT.DESCRIP2'
      Size = 100
    end
  end
  object SrcQOpmatByProduct_Qty_Breaks: TDataSource
    Left = 454
    Top = 34
  end
  object SrcArinvtStdCost: TDataSource
    DataSet = QryArinvtStdCost
    Left = 32
    Top = 156
  end
  object QryArinvtStdCost: TFDQuery
    MasterSource = SrcArinvt
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, std_cost, std_cost_control from arinvt where id = :id')
    Left = 48
    Top = 176
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryArinvtStdCostID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      Size = 0
    end
    object QryArinvtStdCostSTD_COST: TFMTBCDField
      DisplayLabel = 'Std Cost'
      FieldName = 'STD_COST'
      Origin = 'IQ.ARINVT.STD_COST'
      DisplayFormat = '#########.##0000'
      Size = 6
    end
    object QryArinvtStdCostSTD_COST_CONTROL: TStringField
      DisplayLabel = 'Std Cost Control'
      FieldName = 'STD_COST_CONTROL'
      Origin = 'IQ.ARINVT.STD_COST_CONTROL'
      Size = 60
    end
  end
end

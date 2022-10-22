inherited FrmBomSameArinvt: TFrmBomSameArinvt
  ClientHeight = 281
  Caption = 'BOM List'
  OldCreateOrder = True
  ExplicitWidth = 553
  ExplicitHeight = 319
  PixelsPerInch = 96
  TextHeight = 13
  inherited wwDBGrid1: TIQUniGridControl
    Height = 251
    ExplicitHeight = 251
    Marker = 0
  end
  inherited Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    Filtered = True
    SQL.Strings = (
      'select STANDARD.MFGNO          as MfgNo,'
      '       STANDARD.MFG_TYPE       as Mfg_TYPE,'
      '       ARINVT.ITEMNO           as ITEMNO,'
      '       ARINVT.REV              as REV,'
      '       ARINVT.DESCRIP          as DESCRIP,'
      '       ARINVT.DESCRIP2         as DESCRIP2,'
      '       ARCUSTO.COMPANY         as COMPANY,'
      '       STANDARD.ID             as ID,'
      '       standard.eplant_id      as eplant_id,'
      '       standard.route_seq      as route_seq,'
      '       standard.effect_date    as effect_date,'
      '       standard.deactive_date  as deactive_date,'
      '       standard.pk_hide        as pk_hide'
      '  from IQMS.STANDARD, IQMS.PARTNO, IQMS.ARINVT, IQMS.ARCUSTO'
      ' where IQMS.STANDARD.ID = IQMS.PARTNO.STANDARD_ID(+)'
      '   and IQMS.PARTNO.ARINVT_ID = IQMS.ARINVT.ID(+)'
      '   and IQMS.ARCUSTO.ID(+) = IQMS.STANDARD.ARCUSTO_ID '
      '   and PARTNO.arinvt_id = :arinvt_id'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1MFGNO: TStringField
      DisplayLabel = 'MFG #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object Query1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object Query1REV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 18
      FieldName = 'DESCRIP'
      Size = 100
    end
    object Query1COMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 15
      FieldName = 'COMPANY'
      Size = 60
    end
    object Query1ID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object Query1MFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      Size = 10
    end
    object Query1DESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object Query1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object Query1EFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      FieldName = 'EFFECT_DATE'
    end
    object Query1DEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      FieldName = 'DEACTIVE_DATE'
    end
    object Query1ROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      FieldName = 'ROUTE_SEQ'
      Size = 0
    end
    object Query1PK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end

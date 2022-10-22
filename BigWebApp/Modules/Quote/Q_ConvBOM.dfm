inherited FrmQuoteConvertedBOMs: TFrmQuoteConvertedBOMs
  Caption = 'Converted BOMs'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited wwDBGrid1: TIQUniGridControl
    Marker = 0
  end
  inherited Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    SQL.Strings = (
      'select standard.mfgno,'
      '       standard.mfg_type,'
      '       arinvt.itemno,'
      '       arinvt.rev,'
      '       arinvt.descrip,'
      '       arinvt.descrip2,'
      '       arcusto.company,'
      '       standard.id,'
      '       standard.eplant_id,'
      '       standard.route_seq,'
      '       standard.effect_date,'
      '       standard.deactive_date'
      '  from '
      '       standard, partno, arinvt, arcusto'
      ' where '
      '       standard.id = partno.standard_id(+)'
      '   and partno.arinvt_id = arinvt.id(+)'
      '   and arcusto.id(+) = standard.arcusto_id '
      '   and rtrim(standard.rfq) = :rfq'
      '   and NVL(standard.eplant_id,0) = :eplant_id'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 179
    Top = 72
    ParamData = <
      item
        Name = 'rfq'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'eplant_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1MFGNO: TStringField
      DisplayLabel = 'MFG #'
      DisplayWidth = 19
      FieldName = 'MFGNO'
      Size = 50
    end
    object Query1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 14
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
    object Query1MFG_TYPE: TStringField
      DisplayLabel = 'MFG Type'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Size = 10
    end
    object Query1DESCRIP2: TStringField
      DisplayLabel = 'Ext. Description'
      DisplayWidth = 23
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object Query1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object Query1EFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
    end
    object Query1DEACTIVE_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'DEACTIVE_DATE'
    end
    object Query1ROUTE_SEQ: TBCDField
      DisplayLabel = 'Route #'
      DisplayWidth = 10
      FieldName = 'ROUTE_SEQ'
      Size = 0
    end
    object Query1ID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  inherited PopupMenu1: TUniPopupMenu
    inherited JumpTo1: TUniMenuItem
      Caption = 'Jump To BOM'
    end
  end
  inherited IQJump1: TIQWebJump
    DataField = 'ID'
    JumpTo = jtBom
  end
end

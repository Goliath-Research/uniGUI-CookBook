inherited FrmFrShowShipped: TFrmFrShowShipped
  Caption = 'FrmFrShowShipped'
  PixelsPerInch = 96
  TextHeight = 17
  inherited DBGrid1: TUniDBGrid
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Columns = <
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Customer'
        Width = 64
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY'
        Title.Caption = 'Qty'
        Width = 51
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PRICE'
        Title.Caption = 'Price'
        Width = 48
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIPDATE'
        Title.Caption = 'Ship Date'
        Width = 86
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PACKSLIPNO'
        Title.Caption = 'PackSlip #'
        Width = 64
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PONO'
        Title.Caption = 'PO #'
        Width = 60
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'UNIT'
        Title.Caption = 'UOM'
        Width = 64
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited Panel1: TUniPanel
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    inherited DBNavigator1: TUniDBNavigator
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select '
      '       -- v.qtyshipped as qty,'
      '       v.qtyshipped_native as qty,'
      
        '       v.unit_price /  IQMisc.No_Zero( NVL(v.uom_factor,1)) as p' +
        'rice,'
      '       v.arcusto_id,'
      '       v.shipdate,'
      '       v.arinvt_id,'
      '       v.packslipno,'
      '       v.pono,'
      '       a.company,'
      '       v.ord_detail_id,'
      '       v.shipment_dtl_id,'
      '       arinvt.unit'
      '       -- decode( d1.id, null, d2.unit, d1.unit) as unit'
      '       '
      '  from           '
      '       v_shipments v,'
      '       arcusto a,'
      '       arinvt,'
      '       /* '
      '       -- ord_detail d1, '
      '       -- hist_ord_detail d2 '
      '       */'
      '       ord_detail d'
      '       '
      ' where            '
      '       v.shipdate is not NULL'
      '   and v.arinvt_id = :arinvt_id'
      '   and (v.arcusto_id = :arcusto_id or :arcusto_id = 0)'
      '   and v.shipdate between :date1 and :date2'
      '   and v.arcusto_id = a.id(+)'
      '   '
      '   /*'
      '   --and v.ord_detail_id = d1.id(+)'
      '   --and v.ord_detail_id = d2.id(+)'
      '   */'
      '   '
      '   and v.arinvt_id = arinvt.id(+)'
      ''
      '       -- exclude ICT and outsource '
      '   and v.ord_detail_id = d.id(+)'
      '   and d.ship_to_id_from is null '
      '   and d.in_transit_partno_id is null    '
      '')
    Left = 70
    Top = 65
  end
  inherited PopupMenu1: TUniPopupMenu
    inherited JumptoOrder1: TUniMenuItem
      Caption = 'Jump to Packing Slip'
    end
  end
  inherited IQJump1: TIQWebJump
    DataField = 'SHIPMENT_DTL_ID'
    JumpTo = jtJumpToPackSlip
  end
end

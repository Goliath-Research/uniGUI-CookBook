inherited FrmTPD_Jump_PO: TFrmTPD_Jump_PO
  ClientHeight = 164
  ClientWidth = 613
  Caption = 'FrmTPD_Jump_PO'
  OldCreateOrder = True
  ExplicitWidth = 629
  ExplicitHeight = 202
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 613
    ExplicitWidth = 570
    inherited DBNavigator1: TUniDBNavigator
      Left = 512
      ExplicitLeft = 469
    end
  end
  inherited DBGrid1: TUniDBGrid
    Width = 613
    Height = 137
    Columns = <
      item
        FieldName = 'VENDORNO'
        Title.Caption = 'Vendor #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Company'
        Width = 94
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PONO'
        Title.Caption = 'PO #'
        Width = 51
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BLANKET_QTY'
        Title.Caption = 'Blanket Quantity'
        Width = 86
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Promise Date'
        Width = 90
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REL_QTY'
        Title.Caption = 'Release Quantity'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REL_QTY_RECEIVED'
        Title.Caption = 'Quantity Received'
        Width = 96
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR1'
        Title.Caption = 'Address'
        Width = 364
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CITY'
        Title.Caption = 'City'
        Width = 184
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STATE'
        Title.Caption = 'State or Region'
        Width = 124
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited PopupMenu1: TUniPopupMenu
    inherited JumpTo1: TUniMenuItem
      Caption = 'Jump To PO'
      OnClick = JumpTo1Click
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select po.id,'
      '       po.pono,'
      '       po.vendor_id,'
      '       rel.id as po_releases_id,'
      '       a.id as po_detail_id,'
      '       a.arinvt_id, '
      '       a.total_qty_ord as blanket_qty,'
      '       rel.promise_date, '
      '       UOM.To_Native( rel.quan, a.unit ) as rel_qty, '
      
        '       UOM.To_Native( b.qty_received,  a.unit ) as rel_qty_recei' +
        'ved,'
      '       v.vendorno,'
      '       v.company,'
      '       v.addr1,'
      '       v.city,'
      '       v.state'
      '  from '
      '       po,'
      '       po_detail a, '
      
        '       ( select po_releases_id, sum(qty_received) as qty_receive' +
        'd '
      '           from po_receipts '
      '          group by po_releases_id ) b, '
      '       po_releases rel,'
      '       vendor v'
      ' where '
      '       po.id = a.po_id'
      '   and a.arinvt_id = :arinvt_id'
      '   and NVL(a.closed, '#39'N'#39') = '#39'N'#39' '
      '   and rel.promise_date between :date1 and :date2'
      '   and a.id = rel.po_detail_id '
      '   and rel.id = b.po_releases_id(+) '
      '   and po.vendor_id = v.id(+)')
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object Query1ID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object Query1PONO: TStringField
      FieldName = 'PONO'
      Size = 35
    end
    object Query1VENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Size = 0
    end
    object Query1PO_RELEASES_ID: TBCDField
      FieldName = 'PO_RELEASES_ID'
      Size = 0
    end
    object Query1PO_DETAIL_ID: TBCDField
      FieldName = 'PO_DETAIL_ID'
      Size = 0
    end
    object Query1ARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
    object Query1BLANKET_QTY: TBCDField
      FieldName = 'BLANKET_QTY'
    end
    object Query1PROMISE_DATE: TDateTimeField
      FieldName = 'PROMISE_DATE'
    end
    object Query1REL_QTY: TFMTBCDField
      FieldName = 'REL_QTY'
      Size = 38
    end
    object Query1REL_QTY_RECEIVED: TFMTBCDField
      FieldName = 'REL_QTY_RECEIVED'
      Size = 38
    end
    object Query1VENDORNO: TStringField
      FieldName = 'VENDORNO'
      FixedChar = True
      Size = 10
    end
    object Query1COMPANY: TStringField
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object Query1ADDR1: TStringField
      FieldName = 'ADDR1'
      FixedChar = True
      Size = 60
    end
    object Query1CITY: TStringField
      FieldName = 'CITY'
      FixedChar = True
      Size = 30
    end
    object Query1STATE: TStringField
      FieldName = 'STATE'
      FixedChar = True
    end
  end
end

inherited FrmTPD_Jump_SO: TFrmTPD_Jump_SO
  ClientHeight = 176
  ClientWidth = 459
  Caption = 'Sales Orders'
  OldCreateOrder = True
  ExplicitWidth = 475
  ExplicitHeight = 215
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 459
    Caption = ' Sales Orders'
    ExplicitWidth = 459
    inherited DBNavigator1: TUniDBNavigator
      Left = 358
      ExplicitLeft = 358
    end
  end
  inherited DBGrid1: TUniDBGrid
    Width = 459
    Height = 149
    Columns = <
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Customer #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Company'
        Width = 87
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORDERNO'
        Title.Caption = 'Order #'
        Width = 55
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PONO'
        Title.Caption = 'PO #'
        Width = 52
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_QUAN'
        Title.Caption = 'Ship Quantity'
        Width = 69
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QUAN'
        Title.Caption = 'Release Quantity'
        Width = 87
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MUST_SHIP_DATE'
        Title.Caption = 'Must Ship Date'
        Width = 85
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Promise Date'
        Width = 72
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ADDR1'
        Title.Caption = 'Ship-To Address'
        Width = 87
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CITY'
        Title.Caption = 'Ship-To City'
        Width = 71
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STATE'
        Title.Caption = 'Ship-To State'
        Width = 75
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited PopupMenu1: TUniPopupMenu
    inherited JumpTo1: TUniMenuItem
      Caption = 'Jump To Sales Order'
      OnClick = JumptoSalesOrder1Click
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select v.order_id,'
      '       v.ord_detail_id,'
      '       v.must_ship_date,'
      '       v.ship_quan,'
      '       v.arcusto_id,'
      '       v.ship_to_id,'
      '       v.release_id,'
      '       a.custno,'
      '       a.company,'
      '       s.addr1,'
      '       s.city,'
      '       s.state,'
      '       o.orderno,'
      '       o.pono,'
      '       r.quan,'
      '       v.promise_date'
      '  from v_backlog_releases v,'
      '       arcusto a,'
      '       ship_to s,'
      '       orders o,'
      '       releases r'
      ' where v.arinvt_id = :arinvt_id'
      '   and a.id = v.arcusto_id'
      '   and s.id = v.ship_to_id'
      '   and o.id = v.order_id'
      '   and r.id = v.release_id'
      '   and v.must_ship_date between :date1 and :date2'
      '')
    Top = 100
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
    object Query1ORDER_ID: TBCDField
      FieldName = 'ORDER_ID'
      Origin = 'V_BACKLOG_RELEASES.ORDER_ID'
      Size = 0
    end
    object Query1ORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Origin = 'V_BACKLOG_RELEASES.ORD_DETAIL_ID'
      Size = 0
    end
    object Query1SHIP_QUAN: TFMTBCDField
      DisplayLabel = 'Ship Qty'
      FieldName = 'SHIP_QUAN'
      Origin = 'V_BACKLOG_RELEASES.SHIP_QUAN'
      Size = 38
    end
    object Query1ARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'V_BACKLOG_RELEASES.ARCUSTO_ID'
      Size = 0
    end
    object Query1SHIP_TO_ID: TFMTBCDField
      FieldName = 'SHIP_TO_ID'
      Origin = 'V_BACKLOG_RELEASES.SHIP_TO_ID'
      Size = 38
    end
    object Query1RELEASE_ID: TBCDField
      FieldName = 'RELEASE_ID'
      Origin = 'V_BACKLOG_RELEASES.RELEASE_ID'
      Size = 0
    end
    object Query1CUSTNO: TStringField
      DisplayLabel = 'Cust #'
      FieldName = 'CUSTNO'
      Origin = 'ARCUSTO.CUSTNO'
      Size = 10
    end
    object Query1COMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 60
    end
    object Query1ADDR1: TStringField
      DisplayLabel = 'Ship-To Address'
      FieldName = 'ADDR1'
      Origin = 'SHIP_TO.ADDR1'
      Size = 60
    end
    object Query1CITY: TStringField
      DisplayLabel = 'Ship-To City'
      FieldName = 'CITY'
      Origin = 'SHIP_TO.CITY'
      Size = 30
    end
    object Query1STATE: TStringField
      DisplayLabel = 'Ship-To State'
      FieldName = 'STATE'
      Origin = 'SHIP_TO.STATE'
    end
    object Query1ORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Origin = 'ORDERS.ORDERNO'
      Size = 15
    end
    object Query1PONO: TStringField
      DisplayLabel = 'PO #'
      FieldName = 'PONO'
      Origin = 'ORDERS.PONO'
      Size = 35
    end
    object Query1QUAN: TBCDField
      DisplayLabel = 'Release Qty'
      FieldName = 'QUAN'
      Origin = 'RELEASES.QUAN'
    end
    object Query1PROMISE_DATE: TDateTimeField
      DisplayLabel = 'Promise Date'
      FieldName = 'PROMISE_DATE'
      Origin = 'V_BACKLOG_RELEASES.PROMISE_DATE'
    end
    object Query1MUST_SHIP_DATE: TDateTimeField
      DisplayLabel = 'Must Ship Date'
      FieldName = 'MUST_SHIP_DATE'
      Origin = 'V_BACKLOG_RELEASES.MUST_SHIP_DATE'
    end
  end
end

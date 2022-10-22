object FrmSalesOrderDRP: TFrmSalesOrderDRP
  Left = 305
  Top = 247
  ClientHeight = 230
  ClientWidth = 613
  Caption = 'Sales Orders DRP'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 0
    Width = 613
    Height = 230
    Hint = ''
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Columns = <
      item
        FieldName = 'ORDERNO'
        Title.Caption = 'Sales Order #'
        Width = 71
      end
      item
        FieldName = 'PONO'
        Title.Caption = 'PO #'
        Width = 59
      end
      item
        FieldName = 'SHIP_QUAN'
        Title.Caption = 'Ship Quantity'
        Width = 93
      end
      item
        FieldName = 'MFG_QUAN'
        Title.Caption = 'Exception Quantity'
        Width = 96
      end
      item
        FieldName = 'REQUEST_DATE'
        Title.Caption = 'Request Date'
        Width = 82
      end
      item
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Promise Date'
        Width = 74
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Customer'
        Width = 103
      end>
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 104
    Top = 56
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.order_id,'
      '       p.ord_detail_id,'
      '       o.orderno,'
      '       o.pono,'
      '       p.request_date,'
      '       p.promise_date,'
      '       p.ship_quan,'
      '       p.mfg_quan,'
      '       a.company'
      '  from ptallocate p,'
      '       orders o,'
      '       arcusto a'
      ' where '
      '       arinvt_id = :arinvt_id'
      '   and trunc(must_ship_date) = trunc(:shipdate)'
      '   /* and standard_id is NULL */'
      '   and mfg_quan > 0'
      '   and o.id = p.order_id'
      '   and o.arcusto_id = a.id'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 104
    Top = 92
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'shipdate'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object Query1ORDER_ID: TBCDField
      FieldName = 'ORDER_ID'
      Origin = 'PTALLOCATE.ORDER_ID'
      Size = 0
    end
    object Query1ORD_DETAIL_ID: TBCDField
      FieldName = 'ORD_DETAIL_ID'
      Origin = 'PTALLOCATE.ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object Query1ORDERNO: TStringField
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Origin = 'ORDERS.ORDERNO'
      Size = 15
    end
    object Query1PONO: TStringField
      FieldName = 'PONO'
      Origin = 'ORDERS.PONO'
    end
    object Query1REQUEST_DATE: TDateTimeField
      FieldName = 'REQUEST_DATE'
      Origin = 'PTALLOCATE.REQUEST_DATE'
    end
    object Query1PROMISE_DATE: TDateTimeField
      FieldName = 'PROMISE_DATE'
      Origin = 'PTALLOCATE.PROMISE_DATE'
    end
    object Query1COMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'ARCUSTO.COMPANY'
      Size = 30
    end
    object Query1SHIP_QUAN: TFMTBCDField
      DisplayLabel = 'Ship QTY'
      FieldName = 'SHIP_QUAN'
      Origin = 'PTALLOCATE.SHIP_QUAN'
    end
    object Query1MFG_QUAN: TFMTBCDField
      DisplayLabel = 'Excp QTY'
      FieldName = 'MFG_QUAN'
      Origin = 'PTALLOCATE.MFG_QUAN'
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 152
    Top = 56
    object JumptoOrder1: TUniMenuItem
      Caption = 'Jump to Order'
      OnClick = JumptoOrder1Click
    end
  end
end

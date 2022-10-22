inherited FrmFGAvailDetailBackLog: TFrmFGAvailDetailBackLog
  ClientHeight = 246
  ClientWidth = 677
  Caption = 'FrmFGAvailDetailBackLog'
  OnCreate = UniFormCreate
  ExplicitWidth = 693
  ExplicitHeight = 285
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TUniDBGrid
    Width = 677
    Height = 186
    Columns = <
      item
        FieldName = 'ORDERNO'
        Title.Caption = 'Order#'
        Width = 41
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_QUAN_NATIVE'
        Title.Caption = 'Ship Qty'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REQUEST_DATE'
        Title.Caption = 'Request Date'
        Width = 73
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Promised Date'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MUST_SHIP_DATE'
        Title.Caption = 'Must Ship Date'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Cust#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Company Name'
        Width = 106
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PONO'
        Title.Caption = 'Customer PO#'
        Width = 214
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FORECAST'
        Title.Caption = 'Forecast'
        Width = 46
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited PnlTouchScreenButtons: TUniPanel
    Top = 186
    Width = 677
    ExplicitTop = 186
    ExplicitWidth = 677
    inherited PnlTouchScreenButtonsInner: TUniPanel
      Left = 534
      ExplicitLeft = 534
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select o.orderno as orderno,'
      '       o.id as order_id,'
      '       v.ship_quan_native as ship_quan_native,'
      '       v.request_date as request_date,'
      '       v.promise_date as promise_date,'
      '       v.must_ship_date as must_ship_date,'
      '       a.custno as custno,'
      '       a.company as company,'
      '       o.pono as pono,'
      '       nvl(r.forecast, '#39'N'#39') as forecast'
      '  from v_backlog_releases v,  '
      '       orders o,              '
      '       arcusto a,'
      '       releases r'
      ' where arinvt_id = :arinvt_id'
      '   and trunc(v.must_ship_date) = :tran_date'
      '   and o.id = v.order_id      '
      '   and o.arcusto_id = a.id(+)'
      '   and v.release_id = r.id'
      '   and ( nvl(:division_id,0) = -1'
      '         or'
      '         :division_id = nvl(v.division_id,0))'
      ' '
      '')
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'tran_date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'division_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1ORDERNO: TStringField
      DisplayWidth = 10
      FieldName = 'ORDERNO'
      Size = 15
    end
    object Query1REQUEST_DATE: TDateTimeField
      FieldName = 'REQUEST_DATE'
    end
    object Query1PROMISE_DATE: TDateTimeField
      FieldName = 'PROMISE_DATE'
    end
    object Query1MUST_SHIP_DATE: TDateTimeField
      FieldName = 'MUST_SHIP_DATE'
    end
    object Query1CUSTNO: TStringField
      FieldName = 'CUSTNO'
      Size = 10
    end
    object Query1COMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object Query1ORDER_ID: TBCDField
      FieldName = 'ORDER_ID'
      Size = 0
    end
    object Query1SHIP_QUAN_NATIVE: TFMTBCDField
      DisplayLabel = 'Ship Qty'
      FieldName = 'SHIP_QUAN_NATIVE'
      Size = 38
    end
    object Query1PONO: TStringField
      FieldName = 'PONO'
      Size = 35
    end
    object Query1FORECAST: TStringField
      FieldName = 'FORECAST'
      Size = 1
    end
  end
  inherited PopupMenu1: TUniPopupMenu
    Left = 224
    Top = 69
    object JumpToOrder1: TUniMenuItem
      Caption = 'Jump To Order'
      OnClick = JumpToOrder1Click
    end
  end
  object IQJump1: TIQWebJump
    DataField = 'ORDER_ID'
    DataSource = DataSource1
    JumpTo = jtSalesOrder
    Left = 152
    Top = 72
  end
end

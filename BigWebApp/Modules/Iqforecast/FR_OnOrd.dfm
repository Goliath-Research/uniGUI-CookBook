object FrmFrShowOnOrder: TFrmFrShowOnOrder
  Left = 89
  Top = 154
  ClientHeight = 242
  ClientWidth = 773
  Caption = 'On Order'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -14
  PixelsPerInch = 96
  TextHeight = 17
  object DBGrid1: TUniDBGrid
    Left = 0
    Top = 33
    Width = 773
    Height = 209
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TitleFont.Height = -14
    DataSource = DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
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
        Title.Caption = 'Quantity'
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
        FieldName = 'PROMISE_DATE'
        Title.Caption = 'Promise Date'
        Width = 86
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORDERNO'
        Title.Caption = 'Order #'
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
      end
      item
        FieldName = 'MUST_SHIP_DATE'
        Title.Caption = 'Must Ship Date'
        Width = 85
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'IS_ARCHIVED'
        Title.Caption = 'Archived'
        Width = 64
        Font.Height = -14
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 773
    Height = 33
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 650
      Top = 1
      Width = 123
      Height = 31
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = DataSource1
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 72
    Top = 40
  end
  object Query1: TFDQuery
    AfterOpen = AssignEPlantFilter
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.ship_quan_native as qty,'
      '       v.unit_price_native as price,'
      '       v.arcusto_id,'
      '       v.promise_date,'
      '       v.arinvt_id,'
      '       v.orderno,'
      '       v.pono,'
      '       a.company,'
      '       v.ord_detail_id,'
      '       arinvt.unit,'
      '       v.must_ship_date,'
      '       v.is_archived'
      '  from'
      '       v_releases_comb_qk v,'
      '       arcusto a,'
      '       arinvt,'
      '       ord_detail d       '
      ' where'
      '       v.promise_date is not NULL'
      '   and v.promise_date_forecast_use is not null'
      '   and v.arinvt_id = :arinvt_id'
      '   and (v.arcusto_id = :arcusto_id or :arcusto_id = 0)'
      '   and v.promise_date_forecast_use between :date1 and :date2'
      '   and v.arcusto_id = a.id(+)'
      '   and v.arinvt_id = arinvt.id(+)'
      '   '
      '       -- exclude ICT and outsource '
      '   and v.ord_detail_id = d.id(+)'
      '   and d.ship_to_id_from is null'
      '   and d.in_transit_partno_id is null ')
    Left = 71
    Top = 88
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'arcusto_id'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end>
  end
  object PopupMenu1: TUniPopupMenu
    Left = 120
    Top = 56
    object JumptoOrder1: TUniMenuItem
      Caption = 'Jump to Order'
      OnClick = JumptoOrder1Click
    end
  end
  object IQJump1: TIQWebJump
    DataField = 'ORD_DETAIL_ID'
    DataSource = DataSource1
    JumpTo = jtSalesOrderDetail
    Left = 120
    Top = 40
  end
end

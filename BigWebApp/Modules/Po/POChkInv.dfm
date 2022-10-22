inherited FrmStatusExceptionInv: TFrmStatusExceptionInv
  ClientHeight = 200
  ClientWidth = 341
  ExplicitWidth = 347
  ExplicitHeight = 228
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 341
    Height = 157
    TabStop = False
    ExplicitWidth = 341
    ExplicitHeight = 157
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 333
      ExplicitHeight = 129
      inherited Label1: TUniLabel
        Width = 53
        Caption = 'Description'
        TabOrder = 6
        ExplicitWidth = 53
      end
      inherited Label3: TUniLabel
        Top = 56
        Width = 60
        Caption = 'Blanket Qty.'
        TabOrder = 7
        ExplicitTop = 56
        ExplicitWidth = 60
      end
      inherited Label2: TUniLabel
        Top = 101
        TabOrder = 8
        ExplicitTop = 101
      end
      object Label4: TUniLabel [3]
        Left = 4
        Top = 32
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Item#'
        TabOrder = 9
      end
      object Label5: TUniLabel [4]
        Left = 4
        Top = 78
        Width = 51
        Height = 13
        Hint = ''
        Caption = 'Min. Order'
        TabOrder = 10
      end
      object Label6: TUniLabel [5]
        Left = 197
        Top = 78
        Width = 55
        Height = 13
        Hint = ''
        Caption = 'Max. Order'
        TabOrder = 11
      end
      inherited DBEdit1: TUniDBEdit
        Left = 92
        DataField = 'DESCRIP'
        TabStop = False
        ExplicitLeft = 92
      end
      inherited DBEdit2: TUniDBEdit
        Left = 92
        Top = 53
        DataField = 'TOTAL_QTY_ORD'
        TabStop = False
        ExplicitLeft = 92
        ExplicitTop = 53
      end
      inherited DBEdit3: TUniDBEdit
        Left = 92
        Top = 98
        TabStop = False
        ExplicitLeft = 92
        ExplicitTop = 98
      end
      object DBEdit4: TUniDBEdit
        Left = 92
        Top = 29
        Width = 232
        Height = 19
        Hint = ''
        DataField = 'ITEMNO'
        DataSource = DataSource1
        TabOrder = 3
        TabStop = False
      end
      object DBEdit5: TUniDBEdit
        Left = 92
        Top = 75
        Width = 57
        Height = 19
        Hint = ''
        DataField = 'MIN_ORDER_QTY'
        DataSource = DataSource1
        TabOrder = 4
        TabStop = False
      end
      object DBEdit6: TUniDBEdit
        Left = 267
        Top = 75
        Width = 57
        Height = 19
        Hint = ''
        DataField = 'MAX_ORDER_QTY'
        DataSource = DataSource1
        TabOrder = 5
        TabStop = False
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 157
    Width = 341
    ExplicitTop = 157
    ExplicitWidth = 341
    inherited Panel2: TUniPanel
      Left = 44
      Width = 297
      ExplicitLeft = 44
      ExplicitWidth = 297
      inherited btnOK: TUniButton
        Left = 100
        Top = 5
        Width = 85
        ExplicitLeft = 100
        ExplicitTop = 5
        ExplicitWidth = 85
      end
      inherited btnCancel: TUniButton
        Left = 199
        Top = 5
        Width = 85
        ExplicitLeft = 199
        ExplicitTop = 5
        ExplicitWidth = 85
      end
      object btnPriceBreaks: TUniButton
        Left = 2
        Top = 5
        Width = 85
        Height = 25
        Hint = ''
        Caption = 'Price Breaks'
        TabOrder = 3
        OnClick = btnPriceBreaksClick
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select a.descrip,'
      '       a.itemno,'
      ''
      '       case'
      
        '         when NVL(c.min_order_qty,0) > 0 then TO_CHAR(c.min_orde' +
        'r_qty)'
      
        '         when NVL(d.min_order_qty,0) > 0 then TO_CHAR(d.min_orde' +
        'r_qty)'
      
        '         when NVL(a.min_order_qty,0) > 0 then TO_CHAR(a.min_orde' +
        'r_qty)'
      '         else '#39'N/A'#39
      '       end as min_order_qty,'
      ''
      
        '       Decode( iqmisc.no_zero( d.max_order_qty, nvl(a.max_order_' +
        'qty, 0)),'
      '               0, '#39'N/A'#39','
      
        '               iqmisc.no_zero( d.max_order_qty, nvl(a.max_order_' +
        'qty, 0))) as max_order_qty,'
      '       To_Char(:TotalQtyOrd1) as total_qty_ord,'
      
        '      substrB(iqeval.substrW63Max(:TotalQtyOrd2 || '#39' is not with' +
        'in Min and Max Order Qty'#39', 1, 100), 1, 100) as status_id'
      '  from arinvt a,'
      
        '       (select * from arinvt_division where division_id = :divis' +
        'ion_id) d,'
      
        '       (select * from arinvt_vendors where vendor_id = :vendor_i' +
        'd) c'
      '  WHERE a.id = :id'
      '    and d.arinvt_id(+) = a.id'
      '    and c.arinvt_id(+) = a.id'
      '')
    ParamData = <
      item
        Name = 'TotalQtyOrd1'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'TotalQtyOrd2'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'division_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'vendor_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  inherited SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK'
      'btnPriceBreaks')
    SecurityCode = 'FRMSTATUSEXCEPTIONINV'
  end
end

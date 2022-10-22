inherited FrmOrdOnHoldException: TFrmOrdOnHoldException
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Height = 125
    ExplicitHeight = 125
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 399
      ExplicitHeight = 97
      inherited Label1: TUniLabel
        Width = 39
        Caption = 'Order #'
        ExplicitWidth = 39
      end
      inherited Label3: TUniLabel
        Width = 33
        Caption = 'Item #'
        ExplicitWidth = 33
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'ORDERNO'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'ITEMNO'
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 125
    Height = 38
    ExplicitTop = 125
    ExplicitHeight = 38
    inherited Panel2: TUniPanel
      Left = 198
      Width = 209
      Height = 36
      ExplicitLeft = 198
      ExplicitWidth = 209
      ExplicitHeight = 36
      inherited btnOK: TUniButton
        Top = 7
        Caption = '&OK'
        ExplicitTop = 7
      end
      inherited btnCancel: TUniButton
        Top = 7
        Caption = '&Cancel'
        ExplicitTop = 7
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select o.orderno,'
      
        '       decode( d.arinvt_id, NULL, d.misc_item, a.itemno ) as ite' +
        'mno,'
      '       '#39'On Hold'#39' as status_id'
      '  from orders o, '
      '       ord_detail d,'
      '       arinvt a'
      ' where d.id = :id'
      '   and d.orders_id = o.id'
      '   and d.arinvt_id = a.id')
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmOrdOnHoldException')
    SecurityCode = 'FRMORDONHOLDEXCEPTION'
  end
end

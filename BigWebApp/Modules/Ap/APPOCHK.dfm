inherited FrmAP_PODetailCheck: TFrmAP_PODetailCheck
  Caption = 'PO Detail check'
  ExplicitWidth = 413
  ExplicitHeight = 191
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 399
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 34
        Caption = 'Vendor'
        ExplicitWidth = 34
      end
      inherited Label3: TUniLabel
        Width = 22
        Caption = 'PO#'
        ExplicitWidth = 22
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'LTRIM(RTRIM(V.COMPANY))||'#39'['#39'||LTRIM(RTRIM(V.VENDORNO))||'#39']'#39
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'PONO'
      end
      inherited DBEdit3: TUniDBEdit
        DataField = 'STATUS'
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select d.po_detail_id,'
      '       a.vendor_id,'
      
        '       LTrim(RTrim(v.company)) || '#39' ['#39' || LTrim(RTrim(v.vendorno' +
        ')) || '#39']'#39','
      '       p.PONO,'
      '       '#39'PO detail exists in Inv# '#39' || a.invoice_no as status'
      '  from apprepost_detail d,'
      '       apprepost a,'
      '       vendor v,'
      '       po p,'
      '       po_detail pd'
      ' where d.po_detail_id = :Id'
      '   and d.apprepost_id = a.id'
      '   and a.vendor_id = v.id(+)'
      '   and d.po_detail_id = pd.id(+)'
      '   and pd.po_id = p.id(+)'
      '   and rownum < 2'
      ''
      ' ')
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMAP_PODETAILCHECK'
  end
end

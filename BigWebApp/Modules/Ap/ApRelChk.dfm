inherited FrmApReleaseCheck: TFrmApReleaseCheck
  BorderStyle = bsSizeable
  Caption = 'PO Release check'
  ClientHeight = 153
  ClientWidth = 397
  Constraints.MinHeight = 176
  Position = poDefault
  ExplicitWidth = 413
  ExplicitHeight = 191
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 397
    Height = 110
    ExplicitWidth = 397
    ExplicitHeight = 110
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 389
      ExplicitHeight = 82
      inherited DBEdit1: TUniDBEdit
        Width = 236
        Anchors = [akLeft, akTop, akRight]
        DataField = 'LTRIM(RTRIM(V.COMPANY))||'#39'['#39'||L'
        ExplicitWidth = 236
      end
      inherited DBEdit2: TUniDBEdit
        Width = 236
        Anchors = [akLeft, akTop, akRight]
        DataField = 'PONO'
        ExplicitWidth = 236
      end
      inherited DBEdit3: TUniDBEdit
        Width = 236
        Anchors = [akLeft, akTop, akRight]
        DataField = 'STATUS'
        ExplicitWidth = 236
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 110
    Width = 397
    ExplicitTop = 110
    ExplicitWidth = 397
    inherited Panel2: TUniPanel
      Left = 190
      ExplicitLeft = 190
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select d.po_receipts_id,'
      '       a.vendor_id,'
      
        '       LTrim(RTrim(v.company)) || '#39' ['#39' || LTrim(RTrim(v.vendorno' +
        ')) || '#39']'#39','
      '       p.PONO,'
      
        '       '#39'PO release (Invoiced qty. of '#39' || qty_invoiced || '#39') exi' +
        'sts in Inv# '#39' || a.invoice_no as status'
      '  from apprepost_detail d,'
      '       apprepost a,'
      '       vendor v,'
      '       po p,'
      '       po_detail pd'
      ' where d.po_receipts_id = :Id'
      '   and d.apprepost_id = a.id'
      '   and a.vendor_id = v.id(+)'
      '   and d.po_detail_id = pd.id(+)'
      '   and pd.po_id = p.id(+)'
      '   and rownum < 2'
      ''
      ' '
      ' ')
  end
end

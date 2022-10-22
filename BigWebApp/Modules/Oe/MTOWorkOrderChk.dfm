inherited FrmMTOOnWorkorderException: TFrmMTOOnWorkorderException
  ClientWidth = 359
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 359
    ExplicitWidth = 359
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 351
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Left = 2
        Width = 29
        Caption = 'WO #'
        ExplicitLeft = 2
        ExplicitWidth = 29
      end
      inherited Label3: TUniLabel
        Left = 2
        Width = 55
        Caption = 'MTO Line #'
        ExplicitLeft = 2
        ExplicitWidth = 55
      end
      inherited Label2: TUniLabel
        Left = 2
        ExplicitLeft = 2
      end
      inherited DBEdit1: TUniDBEdit
        Left = 68
        Width = 279
        DataField = 'ID'
        ExplicitLeft = 68
        ExplicitWidth = 279
      end
      inherited DBEdit2: TUniDBEdit
        Left = 68
        Width = 279
        DataField = 'ORD_DET_SEQNO'
        ExplicitLeft = 68
        ExplicitWidth = 279
      end
      inherited DBEdit3: TUniDBEdit
        Left = 68
        Width = 279
        ExplicitLeft = 68
        ExplicitWidth = 279
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 359
    ExplicitWidth = 359
    inherited Panel2: TUniPanel
      Left = 152
      ExplicitLeft = 152
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select wo.id,'
      '       ord_det_seqno, '
      
        '       '#39'Make To Order sales order line is linked to a Work Order' +
        #39' as status_id'
      '  from workorder wo, ord_detail d'
      ' where d.id = :id'
      '   and d.id = wo.make_to_order_detail_id'
      ''
      '')
  end
end

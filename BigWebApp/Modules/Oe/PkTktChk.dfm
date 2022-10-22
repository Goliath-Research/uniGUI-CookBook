inherited FrmOrdOnPkTktException: TFrmOrdOnPkTktException
  ClientWidth = 350
  ExplicitWidth = 356
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 350
    Height = 126
    ExplicitWidth = 350
    ExplicitHeight = 126
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 342
      ExplicitHeight = 98
      inherited Label1: TUniLabel
        Width = 39
        Caption = 'Ticket #'
        ExplicitWidth = 39
      end
      inherited Label3: TUniLabel
        Width = 30
        Caption = 'Line #'
        ExplicitWidth = 30
      end
      inherited DBEdit1: TUniDBEdit
        Left = 88
        Width = 245
        DataField = 'TICKET_ID'
        ExplicitLeft = 88
        ExplicitWidth = 245
      end
      inherited DBEdit2: TUniDBEdit
        Left = 88
        Width = 245
        DataField = 'SEQ'
        ExplicitLeft = 88
        ExplicitWidth = 245
      end
      inherited DBEdit3: TUniDBEdit
        Left = 88
        Width = 245
        ExplicitLeft = 88
        ExplicitWidth = 245
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 126
    Width = 350
    Height = 37
    ExplicitTop = 126
    ExplicitWidth = 350
    ExplicitHeight = 37
    inherited Panel2: TUniPanel
      Left = 140
      Width = 210
      Height = 35
      ExplicitLeft = 140
      ExplicitWidth = 210
      ExplicitHeight = 35
      inherited btnCancel: TUniButton
        Left = 107
        ExplicitLeft = 107
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select t.id as ticket_id,'
      '       d.seq,'
      
        '       (select '#39'Order # '#39' || rtrim(o.orderno) || '#39' is on the pic' +
        'k ticket'#39' from ord_detail x, orders o where x.id = d.ord_detail_' +
        'id and x.orders_id = o.id) as status_id'
      '  from ps_ticket_dtl d,'
      '       ps_ticket t'
      ' where d.ord_detail_id = :id'
      '   and d.ps_ticket_id = t.id'
      '')
  end
end

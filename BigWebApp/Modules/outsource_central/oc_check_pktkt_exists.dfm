inherited FrmOutsource_CheckPickTicketExists: TFrmOutsource_CheckPickTicketExists
  ClientWidth = 352
  ExplicitWidth = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 352
    ExplicitWidth = 352
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 344
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 84
        Caption = 'Ship Order Line #'
        ExplicitWidth = 84
      end
      inherited Label3: TUniLabel
        Width = 54
        Caption = 'PS Ticket #'
        ExplicitWidth = 54
      end
      inherited DBEdit1: TUniDBEdit
        Left = 103
        DataField = 'ORD_DET_SEQNO'
        ExplicitLeft = 103
      end
      inherited DBEdit2: TUniDBEdit
        Left = 103
        DataField = 'PS_TICKET_ID'
        ExplicitLeft = 103
      end
      inherited DBEdit3: TUniDBEdit
        Left = 103
        ExplicitLeft = 103
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 352
    ExplicitWidth = 352
    inherited Panel2: TUniPanel
      Left = 144
      ExplicitLeft = 144
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select a.ord_det_seqno,'
      '       b.ps_ticket_id,'
      
        '       '#39'PS Ticket already exists for this ship order'#39' as status_' +
        'id'
      '  from ord_detail a, ps_ticket_dtl b'
      ' where a.id = :id'
      '   and a.id = b.ord_detail_id'
      '')
  end
  inherited DataSource1: TDataSource
    Left = 264
  end
end

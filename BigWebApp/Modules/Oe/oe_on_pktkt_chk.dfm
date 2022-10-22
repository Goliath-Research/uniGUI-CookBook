inherited FrmOrderOnPkTicketException: TFrmOrderOnPkTicketException
  ClientHeight = 153
  ClientWidth = 349
  ExplicitWidth = 355
  ExplicitHeight = 182
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 349
    Height = 110
    ExplicitWidth = 349
    ExplicitHeight = 110
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 341
      ExplicitHeight = 82
      inherited Label1: TUniLabel
        Width = 60
        Caption = 'Pick Ticket #'
        ExplicitWidth = 60
      end
      inherited Label3: TUniLabel
        Width = 30
        Caption = 'Line #'
        ExplicitWidth = 30
      end
      inherited DBEdit1: TUniDBEdit
        Left = 86
        Width = 244
        DataField = 'PS_TICKET_ID'
        Anchors = [akLeft, akTop, akRight]
        ExplicitLeft = 86
        ExplicitWidth = 244
      end
      inherited DBEdit2: TUniDBEdit
        Left = 86
        Width = 244
        DataField = 'SEQ'
        Anchors = [akLeft, akTop, akRight]
        ExplicitLeft = 86
        ExplicitWidth = 244
      end
      inherited DBEdit3: TUniDBEdit
        Left = 86
        Width = 244
        Anchors = [akLeft, akTop, akRight]
        ExplicitLeft = 86
        ExplicitWidth = 244
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 110
    Width = 349
    ExplicitTop = 110
    ExplicitWidth = 349
    inherited Panel2: TUniPanel
      Left = 142
      ExplicitLeft = 142
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select ps_ticket_id,'
      '       seq,'
      '       '#39'Pick ticket exists for this sales order'#39' as status_id'
      '  from ps_ticket_dtl '
      ' where ord_detail_id = :id'
      '')
  end
  object PopupMenu1: TUniPopupMenu
    Left = 16
    Top = 102
    object JumpToPickTicket1: TUniMenuItem
      Caption = 'Jump To Pick Ticket'
      OnClick = JumpToPickTicket1Click
    end
  end
end

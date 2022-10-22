inherited FrmReleaseOnPkTicketException: TFrmReleaseOnPkTicketException
  ClientWidth = 341
  ExplicitWidth = 347
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 341
    ExplicitWidth = 341
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 333
      ExplicitHeight = 92
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
        Left = 78
        Width = 245
        DataField = 'PS_TICKET_ID'
        ExplicitLeft = 78
        ExplicitWidth = 245
      end
      inherited DBEdit2: TUniDBEdit
        Left = 78
        Width = 245
        DataField = 'SEQ'
        ExplicitLeft = 78
        ExplicitWidth = 245
      end
      inherited DBEdit3: TUniDBEdit
        Left = 78
        Width = 245
        ExplicitLeft = 78
        ExplicitWidth = 245
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 341
    ExplicitWidth = 341
    inherited Panel2: TUniPanel
      Left = 134
      ExplicitLeft = 134
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select ps_ticket_id,'
      '       seq,'
      '       '#39'Pick ticket exists for this release'#39' as status_id'
      '  from ps_ticket_dtl '
      ' where release_id = :id'
      '')
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMRELEASEONPKTICKETEXCEPTION'
  end
  object PopupMenu1: TUniPopupMenu
    Left = 40
    Top = 114
    object JumpToPickTicket1: TUniMenuItem
      Caption = 'Jump To Pick Ticket'
      OnClick = JumpToPickTicket1Click
    end
  end
end

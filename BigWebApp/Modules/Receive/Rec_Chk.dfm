inherited FrmRecNotApprovedException: TFrmRecNotApprovedException
  ExplicitWidth = 413
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 399
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 22
        Caption = 'PO#'
        ExplicitWidth = 22
      end
      inherited Label3: TUniLabel
        Width = 36
        Caption = 'User ID'
        ExplicitWidth = 36
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'PONO'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'USERID'
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select pono, '
      '       userid, '
      '       NVL(approved_by, '#39'BLANK PO STATUS'#39') as status_id'
      '  from po'
      ' where id = :id')
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMRECNOTAPPROVEDEXCEPTION'
  end
end

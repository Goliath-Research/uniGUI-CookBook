inherited FrmPoNotApprovedException: TFrmPoNotApprovedException
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
        Top = 7
        Width = 25
        Caption = 'PO #'
        ExplicitTop = 7
        ExplicitWidth = 25
      end
      inherited Label3: TUniLabel
        Width = 36
        Caption = 'User ID'
        ExplicitWidth = 36
      end
      inherited DBEdit1: TUniDBEdit
        Left = 72
        Width = 217
        DataField = 'PONO'
        ExplicitLeft = 72
        ExplicitWidth = 217
      end
      inherited DBEdit2: TUniDBEdit
        Left = 72
        Width = 217
        DataField = 'USERID'
        ExplicitLeft = 72
        ExplicitWidth = 217
      end
      inherited DBEdit3: TUniDBEdit
        Left = 72
        Width = 217
        ExplicitLeft = 72
        ExplicitWidth = 217
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select pono, '
      '       userid, '
      '       NVL(approved_by, '#39'BLANK PO STATUS'#39') as status_id,'
      '       id'
      '  from po'
      ' where id = :id')
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmPoNotApprovedException')
    SecurityCode = 'FRMPONOTAPPROVEDEXCEPTION'
  end
end

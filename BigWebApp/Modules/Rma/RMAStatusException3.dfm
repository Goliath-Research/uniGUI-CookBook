inherited FrmRMAStatusException3: TFrmRMAStatusException3
  Caption = 'FrmRMAStatusException3'
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
        Width = 33
        Caption = 'RMA #'
        ExplicitWidth = 33
      end
      inherited Label3: TUniLabel
        Width = 36
        Caption = 'User ID'
        ExplicitWidth = 36
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'RMANO'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'USERID'
      end
      inherited DBEdit3: TUniDBEdit
        DataField = 'STATUS'
      end
    end
  end
  inherited Panel1: TUniPanel
    inherited Panel2: TUniPanel
      Left = 199
      ExplicitLeft = 199
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select rmano, '
      '       userid, '
      '       id,'
      '       '#39'Not Approved. Unable to create Credit Memo.'#39' as status,'
      
        '       '#39'Not Approved. Unable to assign CAR/CAPA/MRB.'#39' as status2' +
        ','
      '       '#39'Not Approved. Unable to receive qty.'#39' as status3'
      '  from rma'
      ' where id = :id')
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMRMASTATUSEXCEPTION3')
    SecurityCode = 'FRMRMASTATUSEXCEPTION3'
  end
end

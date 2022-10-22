inherited FrmRMAStatusException: TFrmRMAStatusException
  ClientWidth = 335
  ExplicitWidth = 341
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 335
    ExplicitWidth = 335
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 327
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
        Width = 262
        DataField = 'RMANO'
        ExplicitWidth = 262
      end
      inherited DBEdit2: TUniDBEdit
        Width = 262
        DataField = 'USERID'
        ExplicitWidth = 262
      end
      inherited DBEdit3: TUniDBEdit
        Width = 262
        DataField = 'STATUS'
        ExplicitWidth = 262
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 335
    ExplicitWidth = 335
    inherited Panel2: TUniPanel
      Left = 127
      ExplicitLeft = 127
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
      'FRMRMASTATUSEXCEPTION')
    SecurityCode = 'FRMRMASTATUSEXCEPTION'
  end
end

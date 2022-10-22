inherited FrmMasterLocNonConfDispoDesgExcp: TFrmMasterLocNonConfDispoDesgExcp
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      inherited Label3: TUniLabel
        Width = 53
        Caption = 'Description'
        ExplicitWidth = 53
      end
      inherited DBEdit1: TUniDBEdit
        Left = 75
        Width = 216
        ExplicitLeft = 75
        ExplicitWidth = 216
      end
      inherited DBEdit2: TUniDBEdit
        Left = 75
        Width = 216
        DataField = 'DESCRIP'
        ExplicitLeft = 75
        ExplicitWidth = 216
      end
      inherited DBEdit3: TUniDBEdit
        Left = 75
        Width = 216
        ExplicitLeft = 75
        ExplicitWidth = 216
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select id, '
      '       loc_desc, '
      '       descrip,'
      '       '#39'Non Conform Dispo Designated Location'#39' as status_id'
      '  from locations where id = :id'
      '')
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMMASTERLOCNONCONFDISPODESGEXCP'
  end
end

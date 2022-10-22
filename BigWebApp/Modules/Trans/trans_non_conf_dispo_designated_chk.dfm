inherited FrmNonConformDispoDesignatedException: TFrmNonConformDispoDesignatedException
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      inherited Label1: TUniLabel
        Width = 40
        Caption = 'Location'
        ExplicitWidth = 40
      end
      inherited Label3: TUniLabel
        Width = 26
        Caption = 'Lot #'
        ExplicitWidth = 26
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'LOC_DESC'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'LOTNO'
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select id, '
      '       loc_desc, '
      '       lotno,'
      '       '#39'Non Conform Dispo Designated Location'#39' as status_id'
      '  from v_fgmulti_locations where id = :id'
      '')
  end
end

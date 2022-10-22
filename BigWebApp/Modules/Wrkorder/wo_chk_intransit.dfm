inherited FrmWorkorderInTransitException: TFrmWorkorderInTransitException
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      inherited Label1: TUniLabel
        Width = 33
        Caption = 'Item #'
        ExplicitWidth = 33
      end
      inherited Label3: TUniLabel
        Width = 40
        Caption = 'Location'
        ExplicitWidth = 40
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'ITEMNO'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'LOC_DESC'
      end
    end
  end
  inherited Panel1: TUniPanel
    inherited Panel2: TUniPanel
      Left = 199
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select a.itemno,'
      '       v.loc_desc,'
      '       '#39'In Transit'#39' as status_id'
      '  from v_fgmulti_locations v, arinvt a'
      'where v.in_transit_workorder_id = :id'
      '  and v.arinvt_id = a.id'
      ''
      ''
      '')
  end
end

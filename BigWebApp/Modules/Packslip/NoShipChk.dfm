inherited FrmNoShipException: TFrmNoShipException
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      inherited Label3: TUniLabel
        Width = 26
        Caption = 'Lot #'
        ExplicitWidth = 26
      end
      inherited DBEdit1: TUniDBEdit
        Top = 5
        ExplicitTop = 5
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'LOTNO'
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select v.loc_desc,'
      '       v.lotno,'
      '       '#39'Location is marked No-Ship'#39' as status_id'
      '  from v_fgmulti_locations v'
      ' where v.id = :id'
      ''
      ' '
      ' '
      ' ')
  end
end

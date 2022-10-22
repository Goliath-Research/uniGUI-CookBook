inherited FrmNonConformException: TFrmNonConformException
  ClientWidth = 345
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 345
    ExplicitWidth = 345
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 337
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 40
        Caption = 'Location'
        ExplicitWidth = 40
      end
      inherited Label3: TUniLabel
        Width = 78
        Caption = 'Non-Conforming'
        ExplicitWidth = 78
      end
      inherited DBEdit1: TUniDBEdit
        Left = 104
        Width = 222
        DataField = 'LOC_DESC'
        ExplicitLeft = 104
        ExplicitWidth = 222
      end
      inherited DBEdit2: TUniDBEdit
        Left = 104
        Width = 222
        DataField = 'DESCRIP'
        ExplicitLeft = 104
        ExplicitWidth = 222
      end
      inherited DBEdit3: TUniDBEdit
        Left = 104
        Width = 222
        ExplicitLeft = 104
        ExplicitWidth = 222
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 345
    ExplicitWidth = 345
    inherited Panel2: TUniPanel
      Left = 138
      ExplicitLeft = 138
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select v.loc_desc,'
      '       nc.descrip,'
      '       '#39'Location is marked Non-Conform'#39' as status_id'
      '  from v_fgmulti_locations v, non_conform nc'
      ' where v.id = :id'
      '   and v.non_conform_id = nc.id'
      ''
      ' '
      ' '
      ' ')
  end
end

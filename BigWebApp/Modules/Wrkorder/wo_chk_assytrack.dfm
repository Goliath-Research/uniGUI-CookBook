inherited FrmWorkorderInAssyTrackException: TFrmWorkorderInAssyTrackException
  Left = 80
  Top = 204
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      inherited Label1: TUniLabel
        Width = 26
        Caption = 'WO#'
        ExplicitWidth = 26
      end
      inherited Label3: TUniLabel
        Width = 33
        Caption = 'Cust #'
        ExplicitWidth = 33
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'ID'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'CUSTNO'
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
      'select w.id, '
      '       a.custno, '
      '       '#39'WO is in Assembly Track'#39' as status_id'
      '  from workorder w, arcusto a'
      ' where w.id = :id'
      '   and w.arcusto_id = a.id(+)')
  end
end

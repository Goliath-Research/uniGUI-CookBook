inherited FrmVMIOverOnHandException: TFrmVMIOverOnHandException
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
      'select v.loc_desc,'
      '       v.lotno,'
      '       '#39'Qty in VMI location exceeded'#39' as status_id'
      '  from v_fgmulti_locations v'
      ' where v.id = :id'
      ''
      ' '
      ' '
      ' ')
  end
  inherited DataSource1: TDataSource
    Left = 264
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'TFRMVMIOVERONHANDEXCEPTION'
  end
end

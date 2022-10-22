inherited FrmLocationWorkorderHardAllocatedException: TFrmLocationWorkorderHardAllocatedException
  ExplicitWidth = 413
  ExplicitHeight = 191
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 399
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 29
        Caption = 'WO #'
        ExplicitWidth = 29
      end
      inherited Label3: TUniLabel
        Width = 20
        Caption = 'Kind'
        ExplicitWidth = 20
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'WORKORDER_ID'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'KIND'
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select w.id as workorder_id, '
      '       a.kind,'
      '       '#39'Workorder is not complete.'#39' as status_id'
      '  from workorder_bom a, '
      '       workorder_bom_mat_loc b,'
      '       workorder w'
      ' where b.fgmulti_id = :id'
      '   and b.workorder_bom_id = a.id'
      '   and a.workorder_id = w.id'
      '')
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMLOCATIONWORKORDERHARDALLOCATEDEX'
  end
end

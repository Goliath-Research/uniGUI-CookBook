inherited FrmHardAllocatedMaterial: TFrmHardAllocatedMaterial
  Left = 453
  Top = 125
  ClientHeight = 196
  ClientWidth = 356
  Caption = 'Material hard allocation violation'
  Constraints.MaxHeight = 230
  Constraints.MinHeight = 224
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 356
    Height = 153
    ExplicitWidth = 356
    ExplicitHeight = 153
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 348
      ExplicitHeight = 125
      inherited Label1: TUniLabel
        Width = 40
        Caption = 'Location'
        TabOrder = 6
        ExplicitWidth = 40
      end
      inherited Label3: TUniLabel
        Width = 83
        Caption = 'Allocated to lot #'
        TabOrder = 7
        ExplicitWidth = 83
      end
      inherited Label2: TUniLabel
        Top = 109
        ExplicitTop = 109
      end
      object Label4: TUniLabel [3]
        Left = 4
        Top = 59
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'Item #'
        TabOrder = 8
      end
      object Label5: TUniLabel [4]
        Left = 4
        Top = 84
        Width = 62
        Height = 13
        Hint = ''
        Caption = 'Workorder #'
        TabOrder = 9
      end
      inherited DBEdit1: TUniDBEdit
        Left = 97
        Width = 246
        DataField = 'LOC_DESC'
        ExplicitLeft = 97
        ExplicitWidth = 246
      end
      inherited DBEdit2: TUniDBEdit
        Left = 97
        Width = 246
        DataField = 'FAB_LOT_LOTNO'
        ExplicitLeft = 97
        ExplicitWidth = 246
      end
      inherited DBEdit3: TUniDBEdit
        Left = 97
        Top = 106
        Width = 246
        ExplicitLeft = 97
        ExplicitTop = 106
        ExplicitWidth = 246
      end
      object DBEdit4: TUniDBEdit
        Left = 97
        Top = 56
        Width = 246
        Height = 19
        Hint = ''
        DataField = 'ITEMNO'
        DataSource = DataSource1
        TabOrder = 3
      end
      object DBEdit5: TUniDBEdit
        Left = 97
        Top = 81
        Width = 246
        Height = 19
        Hint = ''
        DataField = 'FAB_WO_WORKORDER_ID'
        DataSource = DataSource1
        TabOrder = 4
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 153
    Width = 356
    ExplicitTop = 153
    ExplicitWidth = 356
    inherited Panel2: TUniPanel
      Left = 149
      ExplicitLeft = 149
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      ' select f.loc_desc,'
      '        lot.fab_lot_lotno,'
      '        lot.fab_wo_workorder_id,'
      '        a.itemno,'
      '        '#39'Authorization required'#39' as status_id'
      '   from v_fgmulti_locations f,'
      '        v_lot_track_ex lot,'
      '        arinvt a'
      '  where'
      '        f.id = :id'
      '    and f.id = lot.fab_loc_fgmulti_id'
      '    and lot.fab_lot_arinvt_id = a.id(+)'
      '    and NVL(lot.fab_lot_id,0) <> :fab_lot_id')
    ParamData = <
      item
        Name = 'id'
        DataType = ftFloat
      end
      item
        Name = 'fab_lot_id'
        DataType = ftFloat
      end>
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMHARD_ALLOC_MAT_EXCEPTION'
  end
end

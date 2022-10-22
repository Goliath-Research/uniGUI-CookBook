inherited FrmTPD_JumpPlanned: TFrmTPD_JumpPlanned
  Left = 366
  Top = 217
  ClientHeight = 180
  ClientWidth = 408
  Caption = 'FrmTPD_JumpPlanned'
  OldCreateOrder = True
  ExplicitWidth = 424
  ExplicitHeight = 219
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 408
    Caption = ' Planned Work Orders'
    ExplicitWidth = 408
    inherited DBNavigator1: TUniDBNavigator
      Left = 307
      ExplicitLeft = 307
    end
  end
  inherited DBGrid1: TUniDBGrid
    Width = 408
    Height = 153
    Columns = <
      item
        FieldName = 'WORKORDER_ID'
        Title.Caption = 'Work Order #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'Manufacturing #'
        Width = 304
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY'
        Title.Caption = 'Quantity'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited PopupMenu1: TUniPopupMenu
    inherited JumpTo1: TUniMenuItem
      Caption = 'Jump To Work Order'
      OnClick = JumpTo1Click
    end
    object JumpToSchedule1: TUniMenuItem
      Caption = 'Jump To Schedule'
      OnClick = JumpToSchedule1Click
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select h.workorder_id,'
      '       s.mfgno,'
      '       sum( nvl(p.qty,0) + nvl(p.pending_final_assy,0)) as qty'
      '  from day_hrs h,'
      '       day_pts p,'
      '       partno,'
      '       arinvt a,'
      '       workorder w,'
      '       standard s'
      ' where h.id = p.day_hrs_id'
      '   and p.partno_id = partno.id'
      '   and partno.arinvt_id = :arinvt_id'
      '   and partno.arinvt_id = a.id'
      '   /* and NVL(a.mps,'#39'N'#39') = '#39'Y'#39' */'
      '   and h.prod_date between :date1 and :date2'
      '   and h.workorder_id = w.id'
      '   and w.standard_id = s.id'
      '   and NVL(w.firm, '#39'N'#39') = '#39'N'#39
      ''
      '   and ( mfg.is_like_assy1(s.mfg_type ) = 0'
      '         or'
      '         h.last_process = '#39'Y'#39' )'
      '   '
      'group by'
      '       h.workorder_id,'
      '       s.mfgno'
      '          ')
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'date1'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object Query1WORKORDER_ID: TBCDField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object Query1MFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Size = 50
    end
    object Query1QTY: TFMTBCDField
      DisplayLabel = 'Qty'
      FieldName = 'QTY'
      Size = 38
    end
  end
end

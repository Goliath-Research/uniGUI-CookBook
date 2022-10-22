object InvTransPlanDM: TInvTransPlanDM
  OldCreateOrder = False
  Height = 398
  Width = 488
  object QryTransAlertMove: TFDQuery
    BeforeOpen = QryTransAlertMoveBeforeOpen
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      '       /* trans_alert_detail */'
      '       d.id,'
      '       d.trans_alert_id,'
      '       d.fgmulti_id,'
      '       d.master_label_id,'
      '       d.lotno,'
      '       d.qty,'
      ''
      '       /* trans_alert */'
      '       t.arinvt_id,'
      '       t.locations_id as trans_alert_locations_id,'
      '       nvl(w.standard_id, a.standard_id) as standard_id,'
      '       t.workorder_id,'
      ''
      '       /* inv_trans_plan fields */'
      
        '       v.trans_detail_id as inv_trans_detail_id,               /' +
        '* inv_trans_detail.id */'
      '       v.trans_item_ptsper as inv_trans_item_ptsper,           '
      '       v.trans_item_division_id as inv_trans_item_division_id,'
      
        '       v.trans_item_id as inv_trans_item_id                    /' +
        '* inv_trans_item.id */'
      '  from '
      '       trans_alert t,'
      '       trans_alert_detail d,'
      '       v_inv_trans_plan v,'
      '       workorder w,'
      '       arinvt a'
      ' where '
      '       t.id = :trans_alert_id'
      '   and t.id = d.trans_alert_id'
      '   '
      
        '       /* link in inv_trans_detail via view - it is 1 to 1 with ' +
        'trans_alert_detail */'
      '   and lower(v.trans_detail_source) = '#39'trans_alert_detail'#39
      '   and v.trans_detail_source_id = d.id'
      '   and v.trans_plan_id = :inv_trans_plan_id'
      ''
      '       /* link in arinvt and workorder to get standard_id */'
      '   and t.workorder_id = w.id(+)'
      '   and t.arinvt_id = a.id    '
      '   '
      ''
      ' order by d.id')
    Left = 48
    Top = 43
    ParamData = <
      item
        Name = 'trans_alert_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'inv_trans_plan_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryTransAlertMoveID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.TRANS_ALERT_DETAIL.ID'
      Visible = False
      Size = 0
    end
    object QryTransAlertMoveLOTNO: TStringField
      DisplayLabel = 'Lot #'
      DisplayWidth = 17
      FieldName = 'LOTNO'
      Origin = 'IQ.TRANS_ALERT_DETAIL.LOTNO'
      Size = 25
    end
    object QryTransAlertMoveQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 15
      FieldName = 'QTY'
      Origin = 'IQ.TRANS_ALERT_DETAIL.QTY'
      Size = 6
    end
    object QryTransAlertMoveINV_TRANS_ITEM_PTSPER: TFMTBCDField
      DisplayLabel = 'Parts Per'
      DisplayWidth = 10
      FieldName = 'INV_TRANS_ITEM_PTSPER'
      Visible = False
      Size = 6
    end
    object QryTransAlertMoveFGMULTI_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FGMULTI_ID'
      Origin = 'IQ.TRANS_ALERT_DETAIL.FGMULTI_ID'
      Visible = False
      Size = 0
    end
    object QryTransAlertMoveMASTER_LABEL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MASTER_LABEL_ID'
      Origin = 'IQ.TRANS_ALERT_DETAIL.MASTER_LABEL_ID'
      Visible = False
      Size = 0
    end
    object QryTransAlertMoveTRANS_ALERT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TRANS_ALERT_ID'
      Origin = 'IQ.TRANS_ALERT_DETAIL.TRANS_ALERT_ID'
      Visible = False
      Size = 0
    end
    object QryTransAlertMoveTRANS_ALERT_LOCATIONS_ID: TBCDField
      FieldName = 'TRANS_ALERT_LOCATIONS_ID'
      Origin = 'IQ.TRANS_ALERT.LOCATIONS_ID'
      Size = 0
    end
    object QryTransAlertMoveINV_TRANS_DETAIL_ID: TBCDField
      FieldName = 'INV_TRANS_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryTransAlertMoveINV_TRANS_ITEM_ID: TBCDField
      FieldName = 'INV_TRANS_ITEM_ID'
      Visible = False
      Size = 0
    end
    object QryTransAlertMoveINV_TRANS_ITEM_DIVISION_ID: TBCDField
      FieldName = 'INV_TRANS_ITEM_DIVISION_ID'
      Origin = 'IQ.V_INV_TRANS_PLAN.TRANS_ITEM_DIVISION_ID'
      Size = 0
    end
    object QryTransAlertMoveARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.TRANS_ALERT.ARINVT_ID'
      Size = 0
    end
    object QryTransAlertMoveSTANDARD_ID: TFMTBCDField
      FieldName = 'STANDARD_ID'
      Size = 38
    end
    object QryTransAlertMoveWORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
  end
  object QryTransLocMove: TFDQuery
    CachedUpdates = True
    MasterSource = SrcTransAlertMove
    MasterFields = 'INV_TRANS_DETAIL_ID'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id,'
      '       a.inv_trans_detail_id,'
      '       a.locations_id,'
      '       a.inv_trans_item_id,'
      '       a.qty,'
      '       a.units,'
      '       b.lotno'
      '  from       '
      '       inv_trans_locations a,'
      '       inv_trans_detail b '
      ' where '
      '       b.id = :inv_trans_detail_id'
      '   and b.id = a.inv_trans_detail_id'
      ' order by '
      '       a.id'
      '')
    Left = 48
    Top = 107
    ParamData = <
      item
        Name = 'INV_TRANS_DETAIL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryTransLocMoveQTY: TFMTBCDField
      DisplayLabel = 'Qty'
      DisplayWidth = 16
      FieldName = 'QTY'
      Size = 6
    end
    object QryTransLocMoveUNITS: TBCDField
      DisplayLabel = 'Units'
      DisplayWidth = 10
      FieldName = 'UNITS'
      Size = 0
    end
    object QryTransLocMoveID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryTransLocMoveINV_TRANS_DETAIL_ID: TBCDField
      FieldName = 'INV_TRANS_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryTransLocMoveLOCATIONS_ID: TBCDField
      FieldName = 'LOCATIONS_ID'
      Visible = False
      Size = 0
    end
    object QryTransLocMoveINV_TRANS_ITEM_ID: TBCDField
      FieldName = 'INV_TRANS_ITEM_ID'
      Visible = False
      Size = 0
    end
    object QryTransLocMoveLOTNO: TStringField
      FieldName = 'LOTNO'
      Origin = 'IQ.INV_TRANS_DETAIL.LOTNO'
      Size = 25
    end
  end
  object SrcTransAlertMove: TDataSource
    DataSet = QryTransAlertMove
    Left = 49
    Top = 5
  end
end

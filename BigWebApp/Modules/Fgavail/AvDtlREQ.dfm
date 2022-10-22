inherited FrmFGAvailDetailReq: TFrmFGAvailDetailReq
  ClientHeight = 317
  ClientWidth = 753
  Caption = 'FrmFGAvailDetailReq'
  OnCreate = UniFormCreate
  ExplicitWidth = 769
  ExplicitHeight = 356
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TUniDBGrid
    Width = 753
    Height = 257
    Columns = <
      item
        FieldName = 'MAT_REQ'
        Title.Caption = 'Material Requirement'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WORKORDER_ID'
        Title.Caption = 'WO#'
        Width = 42
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EQNO'
        Title.Caption = 'Work Center'
        Width = 67
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'POS'
        Title.Caption = 'Pos'
        Width = 23
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Sched Item#'
        Width = 80
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Sched Item Description'
        Width = 116
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY'
        Title.Caption = 'Sched Qty'
        Width = 60
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Cust#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Company'
        Width = 86
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'Mfg#'
        Width = 71
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  inherited PnlTouchScreenButtons: TUniPanel
    Top = 257
    Width = 753
    ExplicitTop = 257
    ExplicitWidth = 753
    inherited PnlTouchScreenButtonsInner: TUniPanel
      Left = 610
      ExplicitLeft = 610
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select day_hrs.workorder_id,'
      '       work_center.eqno,'
      '       cntr_sched.cntr_seq as pos,'
      '       day_pts.qty,'
      '       day_use.tot_mat_qty as mat_req,'
      '       arcusto.custno,'
      '       arcusto.company,'
      '       standard.mfgno,'
      '       standard.id as standard_id,'
      '       arinvt.itemno,'
      '       arinvt.descrip,'
      '       arinvt.id as arinvt_id'
      '  from day_hrs,'
      '       day_pts,'
      '       day_use,'
      '       workorder wo,'
      '       arcusto,'
      '       cntr_sched,'
      '       work_center,'
      '       standard,'
      '       arinvt,'
      '       partno'
      ' where Trunc(day_hrs.prod_date) = :tran_date'
      '   and day_pts.day_hrs_id = day_hrs.id'
      '   and day_use.day_pts_id = day_pts.id'
      '   and day_use.arinvt_id = :arinvt_id'
      '   and wo.id = day_hrs.workorder_id'
      '   and wo.arcusto_id = arcusto.id(+)'
      '   and cntr_sched.workorder_id(+) = wo.id'
      '   and work_center.id(+) = cntr_sched.work_center_id'
      '   and standard.id = wo.standard_id'
      '   and partno.id = day_pts.partno_id'
      '   and arinvt.id = partno.arinvt_id'
      '')
    ParamData = <
      item
        Name = 'tran_date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1WORKORDER_ID: TBCDField
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object Query1EQNO: TStringField
      FieldName = 'EQNO'
      Size = 60
    end
    object Query1POS: TBCDField
      FieldName = 'POS'
      Size = 0
    end
    object Query1QTY: TFMTBCDField
      FieldName = 'QTY'
      Size = 6
    end
    object Query1MAT_REQ: TFMTBCDField
      FieldName = 'MAT_REQ'
      Size = 6
    end
    object Query1CUSTNO: TStringField
      FieldName = 'CUSTNO'
      Size = 10
    end
    object Query1COMPANY: TStringField
      FieldName = 'COMPANY'
      Size = 60
    end
    object Query1MFGNO: TStringField
      FieldName = 'MFGNO'
      Size = 50
    end
    object Query1ITEMNO: TStringField
      FieldName = 'ITEMNO'
      Size = 50
    end
    object Query1DESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 100
    end
    object Query1STANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Size = 0
    end
    object Query1ARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Size = 0
    end
  end
  inherited PopupMenu1: TUniPopupMenu
    object JumptoWO1: TUniMenuItem
      Caption = 'Jump To WO'
      OnClick = JumptoWO1Click
    end
    object JumpToBOM1: TUniMenuItem
      Caption = 'Jump To BOM'
      OnClick = JumpToBOM1Click
    end
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumptoInventory1Click
    end
    object JumpToInventoryAvailability1: TUniMenuItem
      Caption = 'Jump To Inventory Availability'
      OnClick = JumpToInventoryAvailability1Click
    end
  end
  object IQJump1: TIQWebJump
    DataField = 'WORKORDER_ID'
    DataSource = DataSource1
    JumpTo = jtWorkOrder
    Left = 160
    Top = 56
  end
  object IQJump2: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = DataSource1
    JumpTo = jtBom
    Left = 188
    Top = 56
  end
  object IQJump3: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = DataSource1
    JumpTo = jtInventory
    Left = 216
    Top = 56
  end
  object IQJumpInvAvailability: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = DataSource1
    JumpTo = jtAvailability
    Left = 244
    Top = 56
  end
end

inherited FrmWo_Firm_Alloc: TFrmWo_Firm_Alloc
  ClientHeight = 305
  ClientWidth = 597
  Caption = 'FIRM workorder allocation'
  OldCreateOrder = True
  ExplicitWidth = 613
  ExplicitHeight = 344
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Width = 597
    ExplicitWidth = 597
  end
  inherited Panel1: TUniPanel
    Width = 597
    ExplicitWidth = 597
    inherited DBNavigator1: TUniDBNavigator
      Left = 492
      ExplicitLeft = 492
    end
  end
  inherited wwDBGrid1: TIQUniGridControl
    Width = 597
    Height = 275
    IQComponents.Grid.Width = 380
    IQComponents.Grid.Height = 189
    IQComponents.HiddenPanel.Left = 380
    IQComponents.HiddenPanel.Height = 189
    IQComponents.HiddenPanel.ExplicitLeft = 380
    IQComponents.HiddenPanel.ExplicitHeight = 189
    IQComponents.FormTab.ExplicitLeft = 4
    IQComponents.FormTab.ExplicitTop = 24
    IQComponents.FormTab.ExplicitWidth = 589
    IQComponents.FormTab.ExplicitHeight = 218
    ExplicitWidth = 597
    ExplicitHeight = 275
    Marker = 0
  end
  inherited DataSource1: TDataSource
    Left = 163
  end
  inherited Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    SQL.Strings = (
      'select f.workorder_id,'
      '       f.qty,'
      '       a.id as ptallocate_id,'
      '       a.order_id,'
      '       a.ord_detail_id,'
      '       o.orderno,'
      '       d.ord_det_seqno,'
      '       d.arinvt_id,'
      '       arinvt.itemno,'
      '       arinvt.descrip,'
      '       arinvt.class,'
      '       arinvt.rev'
      '  from '
      '       wo_firm_alloc f,'
      '       ptallocate a,'
      '       orders o,'
      '       ord_detail d,'
      '       arinvt'
      ' where '
      '       f.workorder_id = :id'
      '   and f.ptallocate_id = a.id'
      '   and a.order_id = o.id'
      '   and a.ord_detail_id = d.id'
      '   and d.arinvt_id = arinvt.id(+)'
      '')
    Left = 204
    Top = 44
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
        Value = Null
      end>
    object Query1ORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 9
      FieldName = 'ORDERNO'
      Size = 15
    end
    object Query1ORD_DET_SEQNO: TBCDField
      DisplayLabel = 'Line #'
      DisplayWidth = 6
      FieldName = 'ORD_DET_SEQNO'
      Size = 0
    end
    object Query1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object Query1QTY: TFMTBCDField
      DisplayLabel = 'Alloc Qty'
      DisplayWidth = 12
      FieldName = 'QTY'
    end
    object Query1DESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Size = 35
    end
    object Query1CLASS: TStringField
      DisplayLabel = 'Item Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
    object Query1REV: TStringField
      DisplayLabel = 'Item Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object Query1WORKORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Visible = False
      Size = 0
    end
    object Query1PTALLOCATE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PTALLOCATE_ID'
      Visible = False
      Size = 0
    end
    object Query1ORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORDER_ID'
      Visible = False
      Size = 0
    end
    object Query1ORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object Query1ARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  inherited PopupMenu1: TUniPopupMenu
    Left = 300
    Top = 43
    inherited JumpTo1: TUniMenuItem
      Caption = 'Jump To Sales Order'
    end
  end
  inherited IQJump1: TIQWebJump
    DataField = 'ORD_DETAIL_ID'
    JumpTo = jtSalesOrderDetail
    Top = 43
  end
end

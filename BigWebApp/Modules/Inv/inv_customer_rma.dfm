object FrmInvCustomerRMA: TFrmInvCustomerRMA
  Left = 0
  Top = 0
  ClientHeight = 337
  ClientWidth = 635
  Caption = 'Customer RMA'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 635
    Height = 337
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 418
    IQComponents.Grid.Height = 251
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcRMA
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcRMA
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 418
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 251
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcRMA
    Columns = <
      item
        FieldName = 'RMANO'
        Title.Caption = 'RMA #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RMA_DATE'
        Title.Caption = 'RMA Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLOSED'
        Title.Caption = 'Closed'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'QTYRETURNED'
        Title.Caption = 'Qty Returned'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Customer #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Customer Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QTY_RECEIVED'
        Title.Caption = 'Qty To Return'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    Marker = 0
  end
  object SrcRMA: TDataSource
    DataSet = wwQryRMA
    Left = 40
    Top = 76
  end
  object wwQryRMA: TFDQuery
    BeforeOpen = wwQryRMABeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select r.id as rma_id,'
      '       r.rmano,'
      '       r.arcusto_id,'
      '       r.rma_date,'
      '       r.userid,'
      '       r.closed,'
      '       d.id as rma_detail_id,'
      '       d.arinvt_id,'
      '       d.qtyreturned,'
      '       t.qty_received,'
      '       a.custno,'
      '       a.company'
      '  from rma r,'
      '       rma_detail d,'
      '       arcusto a,'
      '       v_rma_receipts_total t,'
      '       shipment_dtl s,'
      '       (select id, arinvt_id'
      '          from ord_detail'
      '         where arinvt_id = :arinvt_id'
      '         union all'
      '        select id, arinvt_id'
      '          from hist_ord_detail'
      '         where arinvt_id = :arinvt_id) v'
      ' where d.rma_id = r.id'
      '   and d.shipment_dtl_id = s.id(+)'
      '   and d.id = t.rma_detail_id(+)'
      '   and s.order_dtl_id = v.id(+)'
      '   and NVL(d.arinvt_id, v.arinvt_id) = :arinvt_id'
      '   and r.arcusto_id = a.id(+)'
      '')
    Left = 40
    Top = 108
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQryRMARMANO: TStringField
      DisplayLabel = 'RMA #'
      DisplayWidth = 15
      FieldName = 'RMANO'
      Origin = 'r.RMANO'
      Size = 15
    end
    object wwQryRMARMA_DATE: TDateTimeField
      DisplayLabel = 'RMA Date'
      DisplayWidth = 18
      FieldName = 'RMA_DATE'
      Origin = 'r.RMA_DATE'
    end
    object wwQryRMACLOSED: TStringField
      DisplayLabel = 'Closed'
      DisplayWidth = 6
      FieldName = 'CLOSED'
      Origin = 'r.CLOSED'
      FixedChar = True
      Size = 1
    end
    object wwQryRMAQTYRETURNED: TFMTBCDField
      DisplayLabel = 'Qty Returned'
      DisplayWidth = 11
      FieldName = 'QTYRETURNED'
      Origin = 'd.QTYRETURNED'
      Size = 6
    end
    object wwQryRMACUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'a.custno'
      FixedChar = True
      Size = 10
    end
    object wwQryRMACOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 20
      FieldName = 'COMPANY'
      Origin = 'a.COMPANY'
      Size = 60
    end
    object wwQryRMAQTY_RECEIVED: TFMTBCDField
      DisplayLabel = 'Qty To Return'
      DisplayWidth = 13
      FieldName = 'QTY_RECEIVED'
      Origin = 't.qty_received'
      Size = 38
    end
    object wwQryRMARMA_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'RMA_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object wwQryRMAARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object wwQryRMAUSERID: TStringField
      DisplayWidth = 35
      FieldName = 'USERID'
      Visible = False
      Size = 35
    end
    object wwQryRMAARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object wwQryRMARMA_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'RMA_ID'
      Visible = False
      Size = 0
    end
  end
  object IQJumpCustomerRMA: TIQWebJump
    DataField = 'ARCUSTO_ID'
    DataSource = SrcRMA
    JumpTo = jtCustomer
    Left = 88
    Top = 108
  end
  object popmRMA: TUniPopupMenu
    Left = 88
    Top = 76
    object JumpToRMA: TUniMenuItem
      Caption = 'Jump to RMA'
      OnClick = JumpToRMAClick
    end
    object JumpToCustomerRMA: TUniMenuItem
      Caption = 'Jump to Customer'
      OnClick = JumpToCustomerRMAClick
    end
  end
end

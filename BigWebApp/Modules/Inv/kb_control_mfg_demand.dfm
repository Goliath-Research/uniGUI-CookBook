object FrmKB_ControlMfgDemand: TFrmKB_ControlMfgDemand
  Left = 0
  Top = 0
  ClientHeight = 216
  ClientWidth = 563
  Caption = 'Demand'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 563
    Height = 216
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object IQSearch1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 561
      Height = 214
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 344
      IQComponents.Grid.Height = 128
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = wwDataSource1
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
      IQComponents.Navigator.DataSource = wwDataSource1
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 344
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 128
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = wwDataSource1
      Columns = <
        item
          FieldName = 'ORDERNO'
          Title.Caption = 'Order #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PONO'
          Title.Caption = 'PO #'
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
          FieldName = 'REL_DATE'
          Title.Caption = 'Release Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REL_QUAN'
          Title.Caption = 'Release Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 56
    Top = 80
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select x.workorder_id, /* not used */'
      '       rel.orderno,'
      '       rel.pono,'
      '       arcusto.custno,'
      '       rel.rel_date,'
      '       rel.rel_quan,'
      '       orders.id as orders_id,'
      '       ptorder.id as ptorder_id,'
      '       rel.ord_detail_id'
      '  from '
      '       ( select distinct v.workorder_id, v.partno_id'
      '           from v_day_hrs_pts_use v'
      '          where v.mfgcell_id = :mfgcell_id'
      '            and v.partno_id = :partno_id'
      
        '            and nvl(v.prod_date, v.day_hrs_prod_date) <= sysdate' +
        ' + :scope ) x,'
      '       ptorder,'
      '       ptorder_rel rel,'
      '       orders,'
      '       arcusto'
      ' where '
      '       x.workorder_id = ptorder.workorder_id'
      '   and x.partno_id = ptorder.partno_id'
      '   and ptorder.id = rel.ptorder_id'
      '   and RTrim(orders.orderno(+)) = RTrim(rel.orderno)'
      '   and arcusto.id(+) = orders.arcusto_id'
      '')
    Left = 24
    Top = 112
    ParamData = <
      item
        Name = 'mfgcell_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'partno_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'scope'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1ORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 16
      FieldName = 'ORDERNO'
      Origin = 'rel.orderno'
      Size = 15
    end
    object wwQuery1PONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 20
      FieldName = 'PONO'
      Origin = 'rel.pono'
      Size = 35
    end
    object wwQuery1CUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 16
      FieldName = 'CUSTNO'
      Origin = 'arcusto.custno'
      FixedChar = True
      Size = 10
    end
    object wwQuery1REL_DATE: TDateTimeField
      DisplayLabel = 'Release Date'
      DisplayWidth = 17
      FieldName = 'REL_DATE'
      Origin = 'rel.rel_date'
    end
    object wwQuery1REL_QUAN: TBCDField
      DisplayLabel = 'Release Qty'
      DisplayWidth = 15
      FieldName = 'REL_QUAN'
      Origin = 'rel.rel_quan'
      Size = 2
    end
    object wwQuery1WORKORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Visible = False
      Size = 0
    end
    object wwQuery1ORDERS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORDERS_ID'
      Visible = False
      Size = 0
    end
    object wwQuery1PTORDER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PTORDER_ID'
      Visible = False
      Size = 0
    end
    object wwQuery1ORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 96
    Top = 96
    object JumpToOE1: TUniMenuItem
      Caption = 'Jump To Sales Order'
      OnClick = JumpToOE1Click
    end
  end
  object IQJumpOE: TIQWebJump
    DataField = 'ORDERS_ID'
    DataSource = wwDataSource1
    JumpTo = jtSalesOrder
    Left = 88
    Top = 152
  end
end

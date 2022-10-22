object FrmMatExceptionWO: TFrmMatExceptionWO
  Left = 167
  Top = 180
  HelpContext = 1094596
  ClientHeight = 349
  ClientWidth = 842
  Caption = 'Material Exception Work Order'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 842
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    ExplicitTop = 27
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 3
    Width = 842
    Height = 346
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 625
    IQComponents.Grid.Height = 260
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
    IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 625
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 260
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 105
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitLeft = 0
    IQComponents.FormTab.ExplicitTop = 0
    IQComponents.FormTab.ExplicitWidth = 256
    IQComponents.FormTab.ExplicitHeight = 134
    DataSource = wwDataSource1
    Columns = <
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 28
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Revision'
        Width = 42
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROD_DATE'
        Title.Caption = 'Production Date'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 49
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DIVISION_ID'
        Title.Caption = 'Division ID'
        Width = 63
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ONHAND'
        Title.Caption = 'OnHand'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Qty_On_Req'
        Title.Caption = 'Qty On Requisition'
        Width = 98
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Qty_On_Po'
        Title.Caption = 'Qty on PO'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext Description'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    ExplicitTop = 30
    ExplicitHeight = 191
    Marker = 0
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 40
    Top = 80
  end
  object wwQuery1: TFDQuery
    OnCalcFields = wwQuery1CalcFields
    Filtered = True
    OnFilterRecord = wwQuery1FilterRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.eplant_id,'
      '       h.prod_date,'
      '       u.arinvt_id,'
      '       h.division_id,'
      '       u.tot_mat_qty as qty,'
      '       case nvl(params.capacity_consolidate_div_req, '#39'N'#39')'
      '         when '#39'Y'#39' then'
      '           a.onhand'
      '         else'
      
        '           (select onhand from v_arinvt_division where arinvt_id' +
        ' = u.arinvt_id and NVL(h.division_id,0) = NVL(division_id,0))'
      '       end as onhand,     '
      
        '       (select eplant_id from standard where id = h.standard_id)' +
        ' as standard_eplant_id'
      '  from                     '
      '       day_hrs h,'
      '       day_pts p,'
      '       day_use u,'
      '       arinvt a,'
      '       params'
      ' where'
      '       h.id = p.day_hrs_id'
      '   and p.id = u.day_pts_id'
      '   and exists (select 1'
      '                 from xcpt_mat_req x'
      '                where u.arinvt_id = x.arinvt_id'
      '                  and h.prod_date >= x.must_arrive'
      
        '                  /* and NVL(h.division_id,0) = NVL(x.division_i' +
        'd,0)) */'
      
        '                  and decode( params.capacity_consolidate_div_re' +
        'q, '#39'Y'#39', -1, nvl(h.division_id,0)) = NVL(x.division_id,0))'
      '   and h.workorder_id = :workorder_id'
      '   and u.arinvt_id = a.id'
      'order by'
      '       a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       a.eplant_id,'
      '       h.prod_date'
      ' '
      '')
    Left = 41
    Top = 136
    ParamData = <
      item
        Name = 'workorder_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Size = 2
    end
    object wwQuery1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      Size = 50
    end
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 100
    end
    object wwQuery1REV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 6
      FieldName = 'REV'
      Size = 15
    end
    object wwQuery1PROD_DATE: TDateTimeField
      DisplayLabel = 'Production Date'
      DisplayWidth = 13
      FieldName = 'PROD_DATE'
    end
    object wwQuery1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 7
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object wwQuery1DIVISION_ID: TBCDField
      DisplayLabel = 'Division ID'
      DisplayWidth = 9
      FieldName = 'DIVISION_ID'
      Size = 0
    end
    object wwQuery1ONHAND: TFMTBCDField
      DisplayLabel = 'OnHand'
      DisplayWidth = 10
      FieldName = 'ONHAND'
      Size = 38
    end
    object wwQuery1Qty_On_Req: TFloatField
      DisplayLabel = 'Qty On Requisition'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'Qty_On_Req'
      Calculated = True
    end
    object wwQuery1Qty_On_Po: TFloatField
      DisplayLabel = 'Qty on PO'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Qty_On_Po'
      Calculated = True
    end
    object wwQuery1DESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Size = 100
    end
    object wwQuery1QTY: TFMTBCDField
      DisplayLabel = 'Qty Required'
      DisplayWidth = 11
      FieldName = 'QTY'
      Visible = False
      Size = 6
    end
    object wwQuery1ARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object wwQuery1STANDARD_EPLANT_ID: TFMTBCDField
      FieldName = 'STANDARD_EPLANT_ID'
      Visible = False
      Size = 38
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 296
    Top = 128
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to &Inventory'
      OnClick = JumptoInventory1Click
    end
    object JumpToMaterialExceptions1: TUniMenuItem
      Caption = 'Jump To Material Exceptions'
      OnClick = JumpToMaterialExceptions1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = wwDataSource1
    JumpTo = jtInventory
    Left = 128
    Top = 104
  end
end

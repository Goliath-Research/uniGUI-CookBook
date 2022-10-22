object FrmProdAssociatedWorkcenters: TFrmProdAssociatedWorkcenters
  Left = 303
  Top = 234
  ClientHeight = 327
  ClientWidth = 638
  Caption = 'Associated Workcenters'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -14
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 34
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object DBNavigator1: TUniDBNavigator
      Left = 482
      Top = 1
      Width = 156
      Height = 32
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DataSource = SrcV_DayProd
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 34
    Width = 638
    Height = 293
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Height = -14
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 421
    IQComponents.Grid.Height = 207
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcV_DayProd
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
    IQComponents.Navigator.DataSource = SrcV_DayProd
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 421
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 207
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcV_DayProd
    Columns = <
      item
        FieldName = 'EQNO'
        Title.Caption = 'Workcenter #'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TOTAL_CYCLES_DISP'
        Title.Caption = 'Total Cycles'
        Width = 84
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROD_HRS'
        Title.Caption = 'Prod Hrs'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DOWN_TIME'
        Title.Caption = 'Down Time'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'GOOD_PTS'
        Title.Caption = 'Good Pts'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REJECTS'
        Title.Caption = 'Rejects'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FLOOR_DISPO_QTY'
        Title.Caption = 'Floor Dispo'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CNTR_DESC'
        Title.Caption = 'Work Center Description'
        Width = 217
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object SrcV_DayProd: TDataSource
    DataSet = QryV_DayProd
    Left = 164
    Top = 49
  end
  object QryV_DayProd: TFDQuery
    BeforeOpen = QryV_DayProdBeforeOpen
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select v.id,'
      '       v.eqno,'
      '       w.cntr_desc,'
      '       v.total_cycles_disp,'
      '       v.prod_hrs,'
      '       v.down_time,'
      '       v.prod_date,'
      '       v.shift,'
      '       v.mfg_type,'
      '       v.work_center_id,'
      '       v.hist_illum_rt_id,'
      ''
      '       p.id as day_part_id,'
      '       p.hist_illum_part_id,'
      '       p.class,'
      '       p.itemno,'
      '       p.rev,'
      '       p.descrip,'
      '       DECODE( rtrim(mfg.lookup_mfgtype( v.mfg_type )),'
      
        '               '#39'EXTRUSION'#39', Round( p.rejects / (partno.ptwt / 12' +
        '), 2),'
      '               p.rejects) as rejects,'
      '       partno.arinvt_id,'
      '       DECODE( rtrim(mfg.lookup_mfgtype(v.mfg_type)),'
      
        '               '#39'EXTRUSION'#39', Round( p.good_pts / (partno.ptwt / 1' +
        '2), 2),'
      '               p.good_pts ) as good_pts,'
      '       DECODE( rtrim(mfg.lookup_mfgtype(v.mfg_type)),'
      
        '               '#39'EXTRUSION'#39', Round( p.floor_dispo_qty / (partno.p' +
        'twt / 12), 2),'
      '               p.floor_dispo_qty ) as floor_dispo_qty'
      '       '
      '  from v_%s v,'
      '       work_center w,'
      '       v_%s p,'
      '       partno'
      ' where v.parent_id = :parent_id'
      '   and v.work_center_id = w.id'
      '   '
      '   and v.id = p.dayprod_id(+)'
      '   and p.partno_id = partno.id(+)'
      '      -- extrusion 2 must have actcav > 0'
      
        '   and decode( rtrim(mfg.lookup_mfgtype(v.mfg_type)), '#39'EXTRUSION' +
        '2'#39', NVL(p.actcav,0), 1 ) > 0'
      '       '
      'order by v.eqno,'
      '         v.ID'
      '         '
      '')
    Left = 308
    Top = 42
    ParamData = <
      item
        Name = 'parent_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryV_DayProdMFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
    end
  end
  object AppDef1: TIQWebAppDef
    AppCode = 'PROD'
    DataField = 'MFG_TYPE'
    DataSource = SrcV_DayProd
    Left = 232
    Top = 51
  end
end

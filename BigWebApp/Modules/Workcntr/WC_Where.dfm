object FrmWorkCenterWhereUsed: TFrmWorkCenterWhereUsed
  Left = 112
  Top = 166
  ClientHeight = 189
  ClientWidth = 407
  Caption = 'Where Used'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 407
    Height = 189
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 190
    IQComponents.Grid.Height = 103
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
    IQComponents.HiddenPanel.Left = 190
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 103
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
        FieldName = 'MFGNO'
        Title.Caption = 'Manufacturing #'
        Width = 112
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 49
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 98
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Revision'
        Width = 63
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 161
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Extended Description'
        Width = 168
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_NAME'
        Title.Caption = 'EPlant'
        Width = 84
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 48
    Top = 48
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select s.mfgno,'
      '       s.id as standard_id,'
      '       a.class,'
      '       a.itemno,'
      '       a.rev,'
      '       a.descrip,'
      '       a.descrip2,'
      '       p.arinvt_id,'
      '       s.eplant_id,'
      '       e.name as eplant_name'
      '  from'
      '       standard s,'
      ''
      
        '       /* get all boms using that cntr_type directly or through ' +
        'ASSY1 processes */'
      '       ( select s.id as standard_id'
      '           from standard s'
      
        '          where rtrim(s.cntr_type) = (select rtrim(cntr_type) fr' +
        'om work_center where id = :work_center_id)'
      ''
      '         UNION'
      ''
      '         select distinct partno.standard_id'
      '           from sndop,'
      '                ptoper,'
      '                partno,'
      '                standard'
      
        '          where rtrim(sndop.cntr_type) = (select rtrim(cntr_type' +
        ') from work_center where id = :work_center_id)'
      '            and sndop.op_class = '#39'AS'#39
      '            and sndop.id = ptoper.sndop_id'
      '            and ptoper.partno_id = partno.id'
      '            and partno.standard_id = standard.id'
      
        '            and mfg.lookup_mfgtype( standard.mfg_type ) = :looku' +
        'p_mfgtype ) x,'
      ''
      '       partno p,'
      '       arinvt a,'
      '       eplant e'
      ' where'
      '       s.id = x.standard_id'
      '   and p.standard_id = s.id'
      '   and p.arinvt_id = a.id'
      '   and e.id(+) = s.eplant_id'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 48
    Top = 128
    ParamData = <
      item
        Name = 'work_center_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'lookup_mfgtype'
        DataType = ftString
        ParamType = ptInput
      end>
    object wwQuery1MFGNO: TStringField
      DisplayLabel = 'Manufacturing #'
      DisplayWidth = 16
      FieldName = 'MFGNO'
      Origin = 'S.MFGNO'
      Size = 50
    end
    object wwQuery1CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 7
      FieldName = 'CLASS'
      Origin = 'A.CLASS'
      Size = 2
    end
    object wwQuery1ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 14
      FieldName = 'ITEMNO'
      Origin = 'A.ITEMNO'
      Size = 50
    end
    object wwQuery1REV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 9
      FieldName = 'REV'
      Origin = 'A.REV'
      Size = 15
    end
    object wwQuery1DESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 23
      FieldName = 'DESCRIP'
      Origin = 'A.DESCRIP'
      Size = 100
    end
    object wwQuery1DESCRIP2: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 24
      FieldName = 'DESCRIP2'
      Origin = 'A.DESCRIP2'
      Size = 100
    end
    object wwQuery1EPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 12
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object wwQuery1EPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'S.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object wwQuery1STANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Origin = 'S.ID'
      Visible = False
      Size = 0
    end
    object wwQuery1ARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Origin = 'P.ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object PopupMenu1: TUniPopupMenu
    Left = 96
    Top = 64
    object JumptoBOM1: TUniMenuItem
      Caption = 'Jump to &BOM'
      OnClick = JumptoBOM1Click
    end
    object JumptoInventory1: TUniMenuItem
      Caption = 'Jump to &Inventory'
      OnClick = JumptoInventory1Click
    end
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = wwDataSource1
    JumpTo = jtInventory
    Left = 304
    Top = 136
  end
  object IQJumpBom: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = wwDataSource1
    JumpTo = jtBom
    Left = 304
    Top = 88
  end
end

object FrmOutSourceShipOrderInfo: TFrmOutSourceShipOrderInfo
  Left = 541
  Top = 226
  ClientHeight = 222
  ClientWidth = 375
  Caption = 'Outsource Info'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TUniPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 222
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 1
      Top = 1
      Width = 373
      Height = 220
      DisableThemes = False
      Align = alClient
      TabOrder = 1
      DataSource = DataSource1
      Items = <
        item
          DataSource = DataSource1
          DataField = 'PARENT_ITEMNO'
          Caption = 'Parent Item #'
          ReadOnly = True
          Expanded = True
          Items = <
            item
              DataSource = DataSource1
              DataField = 'PARENT_DESCRIP'
              Caption = 'Description'
              Items = <
                item
                  DataSource = DataSource1
                  DataField = 'PARENT_DESCRIP2'
                  Caption = 'Ext Description'
                  WordWrap = False
                end
                item
                  DataSource = DataSource1
                  DataField = 'PARENT_CLASS'
                  Caption = 'Class'
                  WordWrap = False
                end
                item
                  DataSource = DataSource1
                  DataField = 'PARENT_REV'
                  Caption = 'Rev'
                  WordWrap = False
                end>
              WordWrap = False
            end
            item
              DataSource = DataSource1
              DataField = 'PARENT_WORKORDER_ID'
              Caption = 'Parent WO #'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataSource = DataSource1
          DataField = 'CHILD_ITEMNO'
          Caption = 'Child Item #'
          Expanded = True
          Items = <
            item
              DataSource = DataSource1
              DataField = 'CHILD_DESCRIP'
              Caption = 'Description'
              Items = <
                item
                  DataSource = DataSource1
                  DataField = 'CHILD_DESCRIP2'
                  Caption = 'Ext Description'
                  WordWrap = False
                end
                item
                  DataSource = DataSource1
                  DataField = 'CHILD_CLASS'
                  Caption = 'Class'
                  WordWrap = False
                end
                item
                  DataSource = DataSource1
                  DataField = 'CHILD_REV'
                  Caption = 'Rev'
                  WordWrap = False
                end>
              WordWrap = False
            end
            item
              DataSource = DataSource1
              DataField = 'CHILD_WORKORDER_ID'
              Caption = 'Child WO #'
              ReadOnly = True
              CustomControl = wwDBComboDlgChildWO
              Expanded = True
              WordWrap = False
            end>
          WordWrap = False
        end>
      DefaultRowHeight = 19
      CaptionWidth = 138
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      CaptionIndent = 15
      object wwDBComboDlgChildWO: TUniEdit
        Left = 156
        Top = 97
        Width = 229
        Height = 18
        Hint = ''
        Visible = False
        BorderStyle = ubsNone
        Text = ''
        TabOrder = 0
        TabStop = False
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 147
    Top = 25
  end
  object Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select'
      '       parent.id as parent_arinvt_id,'
      '       parent.class    as parent_class,'
      '       parent.itemno   as parent_itemno,'
      '       parent.descrip  as parent_descrip,'
      '       parent.descrip2 as parent_descrip2,'
      '       parent.rev      as parent_rev,'
      '       d.in_transit_workorder_id as parent_workorder_id,'
      ''
      '       child.id as child_arinvt_id,'
      '       child.class    as child_class   ,'
      '       child.itemno   as child_itemno  ,'
      '       child.descrip  as child_descrip ,'
      '       child.descrip2 as child_descrip2,'
      '       child.rev      as child_rev     ,'
      '       /* display one cjild workorder for now */'
      
        '       (select min(workorder_id) from wo_depend where parent_wor' +
        'korder_id = d.in_transit_workorder_id ) as child_workorder_id,'
      '       '
      '       d.in_transit_workorder_id,'
      '       d.in_transit_partno_id,'
      '       d.is_drop_ship'
      '  from '
      '       ord_detail d,'
      '       arinvt child,'
      '       arinvt parent,'
      '       partno'
      ' where d.id = :ord_detail_id'
      '       /* child */'
      '   and d.arinvt_id = child.id'
      '       /* parent */'
      '   and d.in_transit_partno_id = partno.id'
      '   and partno.arinvt_id = parent.id'
      ' ')
    Left = 198
    Top = 28
    ParamData = <
      item
        Name = 'ord_detail_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1PARENT_ARINVT_ID: TBCDField
      FieldName = 'PARENT_ARINVT_ID'
      Size = 0
    end
    object Query1PARENT_CLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'PARENT_CLASS'
      FixedChar = True
      Size = 2
    end
    object Query1PARENT_ITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'PARENT_ITEMNO'
      FixedChar = True
      Size = 50
    end
    object Query1PARENT_DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'PARENT_DESCRIP'
      Size = 100
    end
    object Query1PARENT_DESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      FieldName = 'PARENT_DESCRIP2'
      Size = 100
    end
    object Query1PARENT_REV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'PARENT_REV'
      FixedChar = True
      Size = 15
    end
    object Query1PARENT_WORKORDER_ID: TBCDField
      DisplayLabel = 'Parent WO #'
      FieldName = 'PARENT_WORKORDER_ID'
      Size = 0
    end
    object Query1CHILD_ARINVT_ID: TBCDField
      FieldName = 'CHILD_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object Query1CHILD_CLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CHILD_CLASS'
      FixedChar = True
      Size = 2
    end
    object Query1CHILD_ITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'CHILD_ITEMNO'
      FixedChar = True
      Size = 50
    end
    object Query1CHILD_DESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'CHILD_DESCRIP'
      Size = 100
    end
    object Query1CHILD_DESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      FieldName = 'CHILD_DESCRIP2'
      Size = 100
    end
    object Query1CHILD_REV: TStringField
      DisplayLabel = 'Rev'
      FieldName = 'CHILD_REV'
      FixedChar = True
      Size = 15
    end
    object Query1IN_TRANSIT_WORKORDER_ID: TBCDField
      FieldName = 'IN_TRANSIT_WORKORDER_ID'
      Visible = False
      Size = 0
    end
    object Query1IN_TRANSIT_PARTNO_ID: TBCDField
      FieldName = 'IN_TRANSIT_PARTNO_ID'
      Visible = False
      Size = 0
    end
    object Query1CHILD_WORKORDER_ID: TFMTBCDField
      DisplayLabel = 'Child WO #'
      FieldName = 'CHILD_WORKORDER_ID'
      Size = 38
    end
  end
end

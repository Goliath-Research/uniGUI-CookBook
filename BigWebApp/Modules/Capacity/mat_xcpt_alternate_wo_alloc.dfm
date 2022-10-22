object FrmMatXcptAlternateWorkorderAlloc: TFrmMatXcptAlternateWorkorderAlloc
  Left = 0
  Top = 0
  ClientHeight = 401
  ClientWidth = 872
  Caption = 'Alternate Work Order Allocation'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 0
    Top = 45
    Width = 872
    Height = 3
    Cursor = crVSplit
    Hint = ''
    Align = alTop
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 872
    Height = 45
    Hint = ''
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = 'Panel1'
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 48
    Width = 872
    Height = 312
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    inline wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 29
      Width = 870
      Height = 282
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 29
      ExplicitWidth = 870
      ExplicitHeight = 282
      inherited PageControl: TUniPageControl
        Width = 870
        Height = 253
        ExplicitWidth = 870
        ExplicitHeight = 253
      end
      inherited TopToolBar: TUniToolBar
        Width = 870
      end
    end
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 870
      Height = 28
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object DBNavigator1: TUniDBNavigator
        Left = 668
        Top = 1
        Width = 202
        Height = 26
        Hint = ''
        DataSource = SrcWO
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
      end
    end
    object wwDBComboDlgAlternateComponent: TUniEdit
      Left = 168
      Top = 128
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
      OnKeyDown = wwDBComboDlgAlternateComponentKeyDown
    end
    object wwDBComboDlgAlternateBlend: TUniEdit
      Left = 168
      Top = 164
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 3
      OnKeyDown = wwDBComboDlgAlternateBlendKeyDown
    end
  end
  object Panel4: TUniPanel
    Left = 0
    Top = 360
    Width = 872
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Panel5: TUniPanel
      Left = 642
      Top = 1
      Width = 230
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 8
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 119
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 24
    Top = 225
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object SrcArinvt: TDataSource
    DataSet = QryArinvt
    Left = 20
    Top = 141
  end
  object QryArinvt: TFDQuery
    BeforeOpen = QryArinvtBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       itemno,'
      '       descrip,'
      '       descrip2,'
      '       rev,'
      '       class'
      '  from arinvt'
      ' where id = :arinvt_id'
      '')
    Left = 21
    Top = 170
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT.ID'
      Size = 0
    end
    object QryArinvtITEMNO: TStringField
      FieldName = 'ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryArinvtDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.ARINVT.DESCRIP'
      Size = 100
    end
    object QryArinvtDESCRIP2: TStringField
      FieldName = 'DESCRIP2'
      Origin = 'IQ.ARINVT.DESCRIP2'
      Size = 100
    end
    object QryArinvtREV: TStringField
      FieldName = 'REV'
      Origin = 'IQ.ARINVT.REV'
      FixedChar = True
      Size = 15
    end
    object QryArinvtCLASS: TStringField
      FieldName = 'CLASS'
      Origin = 'IQ.ARINVT.CLASS'
      FixedChar = True
      Size = 2
    end
  end
  object SrcWO: TDataSource
    DataSet = QryWO
    Left = 70
    Top = 144
  end
  object QryWO: TFDQuery
    BeforeOpen = QryWOBeforeOpen
    AfterPost = QryWOAfterPost
    OnCalcFields = QryWOCalcFields
    CachedUpdates = True
    OnUpdateRecord = QryWOUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select h.workorder_id,'
      '       w.origin,'
      '       w.standard_id,'
      '       s.mfgno,'
      '       alt.code,'
      '       s.alternate_item_code_id,'
      
        '       Sum(decode( u.qty_covered_by_day_use_id, null, u.tot_mat_' +
        'qty, 0)) as tot_mat_qty,'
      
        '       Sum(decode( u.qty_covered_by_day_use_id, null, u.hard_all' +
        'oc_qty, 0)) as hard_alloc_qty,'
      '       to_number(null) as component_arinvt_alternate_id,'
      '       to_number(null) as blend_arinvt_alternate_id,'
      '       s.arinvt_id_mat'
      '  from day_hrs h,'
      '       day_pts p,'
      '       day_use u,'
      '       workorder w, '
      '       params,'
      '       standard s,'
      '       alternate_item_code alt'
      'where h.id = p.day_hrs_id'
      '  and p.id = u.day_pts_id '
      '  and u.arinvt_id = :arinvt_id'
      '  and u.prod_date >= :must_arrive'
      '  '
      
        '  and mat_po_xcpt.filter_cost_object( :cost_object_source, :cost' +
        '_object_id, h.cost_object_source, h.cost_object_id ) = 1'
      '  '
      '  and (params.capacity_consolidate_div_req = '#39'Y'#39
      '      or'
      '      NVL(h.division_id,0) = NVL(:division_id,0))'
      '      '
      '  and h.workorder_id = w.id(+)'
      
        '  and (NVL(params.fr_hide, '#39'N'#39') = '#39'N'#39' or  NVL(w.origin, '#39'*'#39') <> ' +
        #39'FORECAST'#39')'
      ''
      '  and w.standard_id = s.id'
      '  and s.alternate_item_code_id = alt.id(+)'
      'group by '
      '         h.workorder_id,'
      '         w.standard_id,'
      '         w.origin,'
      '         s.mfgno,'
      '         alt.code,'
      '         s.alternate_item_code_id,'
      '         s.arinvt_id_mat'
      '         '
      '         ')
    Left = 69
    Top = 171
    ParamData = <
      item
        Name = 'arinvt_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'must_arrive'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'cost_object_source'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'cost_object_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'division_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryWOWORKORDER_ID: TBCDField
      DisplayLabel = 'WO #'
      DisplayWidth = 10
      FieldName = 'WORKORDER_ID'
      Origin = 'h.workorder_id'
      ReadOnly = True
      Size = 0
    end
    object QryWOTOT_MAT_QTY: TFMTBCDField
      DisplayLabel = 'Required'
      DisplayWidth = 15
      FieldName = 'TOT_MAT_QTY'
      Origin = 
        'Sum(decode( u.qty_covered_by_day_use_id, null, u.tot_mat_qty, 0)' +
        ')'
      ReadOnly = True
      DisplayFormat = '########0.00'
      Size = 38
    end
    object QryWOHARD_ALLOC_QTY: TFMTBCDField
      DisplayLabel = 'Hard Allocated'
      DisplayWidth = 16
      FieldName = 'HARD_ALLOC_QTY'
      Origin = 
        'Sum(decode( u.qty_covered_by_day_use_id, null, u.hard_alloc_qty,' +
        ' 0))'
      ReadOnly = True
      Size = 38
    end
    object QryWOORIGIN: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 13
      FieldName = 'ORIGIN'
      Origin = 'w.origin'
      ReadOnly = True
      Size = 10
    end
    object QryWOMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 's.mfgno'
      ReadOnly = True
      Size = 50
    end
    object QryWOCODE: TStringField
      DisplayLabel = 'Alternate Item Code'
      DisplayWidth = 25
      FieldName = 'CODE'
      ReadOnly = True
      Size = 25
    end
    object QryWOSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryWOCOMPONENT_ARINVT_ALTERNATE_ID: TFMTBCDField
      FieldName = 'COMPONENT_ARINVT_ALTERNATE_ID'
      Size = 38
    end
    object QryWOBLEND_ARINVT_ALTERNATE_ID: TFMTBCDField
      FieldName = 'BLEND_ARINVT_ALTERNATE_ID'
      Size = 38
    end
    object QryWOAlternateComponentItemNo: TStringField
      FieldKind = fkCalculated
      FieldName = 'AlternateComponentItemNo'
      Size = 25
      Calculated = True
    end
    object QryWOAlternateBlendItemno: TStringField
      FieldKind = fkCalculated
      FieldName = 'AlternateBlendItemno'
      Size = 25
      Calculated = True
    end
    object QryWOALTERNATE_ITEM_CODE_ID: TBCDField
      FieldName = 'ALTERNATE_ITEM_CODE_ID'
      ReadOnly = True
      Visible = False
      Size = 0
    end
    object QryWOBlend_Sndop_ID: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Blend_Sndop_ID'
      Calculated = True
    end
    object QryWOARINVT_ID_MAT: TBCDField
      FieldName = 'ARINVT_ID_MAT'
      Visible = False
      Size = 0
    end
    object QryWOBelongsToBlend: TStringField
      FieldKind = fkCalculated
      FieldName = 'BelongsToBlend'
      ReadOnly = True
      Size = 1
      Calculated = True
    end
  end
end

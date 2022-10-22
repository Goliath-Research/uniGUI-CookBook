object FrmMatXcptAlternate: TFrmMatXcptAlternate
  Left = 402
  Top = 171
  ClientHeight = 344
  ClientWidth = 372
  Caption = 'Replace with alternate item'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 372
    Height = 302
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    inline IQSearch1: TIQUniGridControl
      Left = 1
      Top = 25
      Width = 370
      Height = 276
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 25
      ExplicitWidth = 370
      ExplicitHeight = 276
      inherited PageControl: TUniPageControl
        Width = 370
        Height = 247
        ExplicitWidth = 370
        ExplicitHeight = 247
      end
      inherited TopToolBar: TUniToolBar
        Width = 370
      end
    end
    object Panel4: TUniPanel
      Left = 1
      Top = 1
      Width = 370
      Height = 24
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object Label1: TUniLabel
        Left = 4
        Top = 9
        Width = 146
        Height = 13
        Hint = ''
        Caption = 'Select workorders to alternate'
        TabOrder = 1
      end
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 302
    Width = 372
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 196
      Top = 1
      Width = 176
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 6
        Top = 9
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 93
        Top = 9
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object SrcArinvtAlt: TDataSource
    DataSet = QryArinvtAlt
    Left = 52
    Top = 157
  end
  object QryArinvtAlt: TFDQuery
    BeforeOpen = QryArinvtAltBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select alt.id,'
      '       alt.arinvt_id,'
      '       alt.parent_arinvt_id,'
      '       a1.itemno as alt_itemno,'
      '       a2.itemno as orig_itemno'
      '  from arinvt_alternate alt,'
      '       arinvt a1,'
      '       arinvt a2'
      ' where alt.id = :arinvt_alternate_id'
      '   and alt.arinvt_id = a1.id'
      '   and alt.parent_arinvt_id = a2.id')
    Left = 53
    Top = 214
    ParamData = <
      item
        Name = 'arinvt_alternate_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryArinvtAltID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARINVT_ALTERNATE.ID'
      Size = 0
    end
    object QryArinvtAltALT_ITEMNO: TStringField
      FieldName = 'ALT_ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryArinvtAltORIG_ITEMNO: TStringField
      FieldName = 'ORIG_ITEMNO'
      Origin = 'IQ.ARINVT.ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryArinvtAltARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Origin = 'IQ.ARINVT_ALTERNATE.ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryArinvtAltPARENT_ARINVT_ID: TBCDField
      FieldName = 'PARENT_ARINVT_ID'
      Origin = 'IQ.ARINVT_ALTERNATE.PARENT_ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcWO: TDataSource
    DataSet = QryWO
    Left = 100
    Top = 159
  end
  object QryWO: TFDQuery
    BeforeOpen = QryWOBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select h.workorder_id,'
      '       w.origin,'
      '       w.standard_id,'
      '       s.mfgno,'
      
        '       Sum(decode( u.qty_covered_by_day_use_id, null, u.tot_mat_' +
        'qty, 0)) as tot_mat_qty,'
      
        '       Sum(decode( u.qty_covered_by_day_use_id, null, u.hard_all' +
        'oc_qty, 0)) as hard_alloc_qty'
      '  from day_hrs h,'
      '       day_pts p,'
      '       day_use u,'
      '       workorder w, '
      '       params,'
      '       standard s'
      'where h.id = p.day_hrs_id'
      '  and p.id = u.day_pts_id '
      '  and u.arinvt_id = :arinvt_id'
      '  and u.prod_date >= :must_arrive'
      '  '
      
        '  and mat_po_xcpt.filter_cost_object( :cost_object_source, :cost' +
        '_object_id, h.cost_object_source, h.cost_object_id ) = 1'
      '  and (params.capacity_consolidate_div_req = '#39'Y'#39
      '       or'
      '       NVL(h.division_id,0) = NVL(:division_id,0))'
      '                         '
      '  and h.workorder_id = w.id(+)'
      
        '  and (NVL(params.fr_hide, '#39'N'#39') = '#39'N'#39' or  NVL(w.origin, '#39'*'#39') <> ' +
        #39'FORECAST'#39')'
      ''
      '  and w.standard_id = s.id'
      'group by '
      '         h.workorder_id,'
      '         w.standard_id,'
      '         w.origin,'
      '         s.mfgno'
      '         ')
    Left = 101
    Top = 227
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
      Size = 0
    end
    object QryWOTOT_MAT_QTY: TFMTBCDField
      DisplayLabel = 'Required'
      DisplayWidth = 15
      FieldName = 'TOT_MAT_QTY'
      Origin = 
        'Sum(decode( u.qty_covered_by_day_use_id, null, u.tot_mat_qty, 0)' +
        ')'
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
      Size = 38
    end
    object QryWOORIGIN: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 13
      FieldName = 'ORIGIN'
      Origin = 'w.origin'
      Size = 10
    end
    object QryWOMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 's.mfgno'
      Size = 50
    end
    object QryWOSTANDARD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
  end
end

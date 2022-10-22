inherited FrmOrdScheduledException: TFrmOrdScheduledException
  ClientHeight = 153
  ClientWidth = 397
  BorderStyle = bsSizeable
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 397
    Height = 116
    ActivePage = TabSheet2
    ExplicitWidth = 397
    ExplicitHeight = 116
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 389
      ExplicitHeight = 88
      inherited Label1: TUniLabel
        Left = 3
        Width = 39
        Caption = 'Order #'
        ExplicitLeft = 3
        ExplicitWidth = 39
      end
      inherited Label3: TUniLabel
        Left = 3
        ExplicitLeft = 3
      end
      inherited Label2: TUniLabel
        Left = 3
        ExplicitLeft = 3
      end
      inherited DBEdit1: TUniDBEdit
        Left = 72
        Width = 217
        DataField = 'ORDERNO'
        ExplicitLeft = 72
        ExplicitWidth = 217
      end
      inherited DBEdit2: TUniDBEdit
        Left = 72
        Width = 217
        ExplicitLeft = 72
        ExplicitWidth = 217
      end
      inherited DBEdit3: TUniDBEdit
        Left = 72
        Width = 217
        ExplicitLeft = 72
        ExplicitWidth = 217
      end
    end
    object TabSheet2: TUniTabSheet
      Hint = ''
      Caption = 'Details'
      object DBGrid1: TUniDBGrid
        Left = 0
        Top = 0
        Width = 389
        Height = 88
        Hint = ''
        DataSource = DataSource2
        LoadMask.Message = 'Loading data...'
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        Columns = <
          item
            FieldName = 'ITEMNO'
            Title.Caption = 'Item #'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EQNO'
            Title.Caption = 'Work Center'
            Width = 76
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'WORKORDER_ID'
            Title.Caption = 'WO #'
            Width = 44
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'CNTR_SEQ'
            Title.Caption = 'Pos'
            Width = 28
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PROD_START_TIME'
            Title.Caption = 'Sched Start'
            Width = 109
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'PROD_END_TIME'
            Title.Caption = 'Sched End'
            Width = 96
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 116
    Width = 397
    Height = 37
    ExplicitTop = 116
    ExplicitWidth = 397
    ExplicitHeight = 37
    inherited Panel2: TUniPanel
      Left = 187
      Width = 210
      Height = 35
      ExplicitLeft = 187
      ExplicitWidth = 210
      ExplicitHeight = 35
      inherited btnCancel: TUniButton
        Left = 107
        ExplicitLeft = 107
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select o.orderno,'
      '       a.company,'
      '       '#39'Scheduled to Run'#39' as status_id'
      '  from orders o, '
      '       arcusto a'
      ' where o.id = :id'
      '   and o.arcusto_id = a.id')
    Left = 256
    Top = 65528
  end
  inherited DataSource1: TDataSource
    Left = 168
    Top = 40
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmOrdScheduledException')
    SecurityCode = 'FRMORDSCHEDULEDEXCEPTION'
  end
  object DataSource2: TDataSource
    DataSet = QryScheduled
    Left = 225
    Top = 32
  end
  object QryScheduled: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select w.eqno,'
      '       s.workorder_id,'
      '       s.cntr_seq,'
      '       a.itemno,'
      '       s.prod_start_time,'
      '       s.prod_end_time'
      '  from '
      '       ptallocate p,'
      '       ptorder_rel r,'
      '       ptorder t,'
      '       cntr_sched s,'
      '       work_center w,'
      '       arinvt a,'
      '       partno n'
      ' where '
      '       (p.ord_detail_id = :ord_detail_id or :any_ord_dtl = 1)'
      '   and p.order_id = :orders_id'
      
        '   and r.ptallocate_id = p.id             -- and get to ptorder_' +
        'rel.'
      '   and t.id = r.ptorder_id                -- climb up to ptorder'
      
        '   and s.workorder_id = t.workorder_id    -- and link with cntr_' +
        'sched.'
      
        '   and s.work_center_id = w.id            -- join work center fo' +
        'r eqno.'
      
        '   and t.partno_id = n.id                 -- link partno to get ' +
        'arinvt'
      '   and n.arinvt_id = a.id                 -- get arinvt itemno')
    Left = 296
    Top = 32
    ParamData = <
      item
        Name = 'ord_detail_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'any_ord_dtl'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'orders_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryScheduledEQNO: TStringField
      DisplayLabel = 'Work Center'
      FieldName = 'EQNO'
      Size = 60
    end
    object QryScheduledWORKORDER_ID: TBCDField
      DisplayLabel = 'WO #'
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryScheduledCNTR_SEQ: TBCDField
      DisplayLabel = 'Pos'
      FieldName = 'CNTR_SEQ'
      Size = 0
    end
    object QryScheduledITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object QryScheduledPROD_START_TIME: TDateTimeField
      DisplayLabel = 'Sched Start'
      FieldName = 'PROD_START_TIME'
    end
    object QryScheduledPROD_END_TIME: TDateTimeField
      DisplayLabel = 'Sched End'
      FieldName = 'PROD_END_TIME'
    end
  end
end

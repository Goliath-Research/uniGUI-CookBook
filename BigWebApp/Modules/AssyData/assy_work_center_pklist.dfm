object FrmAssyWorkCenterPickList: TFrmAssyWorkCenterPickList
  Left = 222
  Top = 148
  ClientHeight = 524
  ClientWidth = 632
  Caption = 'Qualified Work Centers'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 440
    Width = 632
    Height = 84
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 345
      Top = 1
      Width = 286
      Height = 82
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnMainNext: TUniBitBtn
        Tag = 1
        Left = 2
        Top = 12
        Width = 129
        Height = 60
        Hint = ''
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888887788888888888888A07888888888888AAA0788888888888AAA07888
          8888888AAAAA0788888888AAA8AA0788888887AA08AAA07888887A88888AA078
          888888888888AA07888888888888AA078888888888888AA0788888888888887A
          0788888888888887A0778888888888888AA08888888888888888}
        Caption = 'OK'
        TabOrder = 0
        OnClick = btnMainNextClick
      end
      object btnMainCancel: TUniBitBtn
        Left = 145
        Top = 12
        Width = 129
        Height = 60
        Hint = ''
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666668666666666666666666666666666666
          0000666608866666666666666686666666666666000066691086666688666666
          6888666666666666000066691088666008866666688866666886666600006669
          1108869110866666688886668888666600006666911089111066666666888868
          8888666600006666911191110666666666888888888666660000666669111110
          6666666666688888886666660000666666911108866666666666888886666666
          0000666666911110866666666666888888666666000066666911011088666666
          6668888888666666000066666910691108866666666888688886666600006666
          9106669110886666668886668888666600006666910666691108666666888666
          6888866600006666696666669106666666686666668886660000666666666666
          6966666666666666666866660000666666666666666666666666666666666666
          0000}
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 440
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
  end
  object wwDataSource1: TDataSource
    DataSet = wwQuery1
    Left = 157
    Top = 72
  end
  object wwQuery1: TFDQuery
    BeforeOpen = wwQuery1BeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select w.eqno,'
      '       w.cntr_type,'
      '       w.cntr_desc,'
      '       s.workcenter_id,'
      '       w.pmeqmt_id,'
      '       p.eqno as toolno'
      '  from SNDOP_WORKCENTER s, work_center w, pmeqmt p'
      ' where s.sndop_id = :sndop_id'
      '   and s.workcenter_id = w.id'
      '   and w.pmeqmt_id = p.id(+)'
      '   '
      '')
    Left = 156
    Top = 92
    ParamData = <
      item
        Name = 'sndop_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object wwQuery1EQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 13
      FieldName = 'EQNO'
      Origin = 'IQ.WORK_CENTER.EQNO'
      FixedChar = True
      Size = 60
    end
    object wwQuery1CNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 20
      FieldName = 'CNTR_TYPE'
      Origin = 'IQ.WORK_CENTER.CNTR_TYPE'
      FixedChar = True
    end
    object wwQuery1CNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'CNTR_DESC'
      Origin = 'IQ.WORK_CENTER.CNTR_DESC'
      FixedChar = True
      Size = 250
    end
    object wwQuery1TOOLNO: TStringField
      DisplayLabel = 'Tool #'
      DisplayWidth = 25
      FieldName = 'TOOLNO'
      Size = 25
    end
    object wwQuery1WORKCENTER_ID: TBCDField
      FieldName = 'WORKCENTER_ID'
      Origin = 'IQ.SNDOP_WORKCENTER.WORKCENTER_ID'
      Visible = False
      Size = 0
    end
    object wwQuery1PMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Origin = 'IQ.WORK_CENTER.PMEQMT_ID'
      Visible = False
      Size = 0
    end
  end
end

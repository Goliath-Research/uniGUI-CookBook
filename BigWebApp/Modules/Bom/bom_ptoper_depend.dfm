object FrmBomPtOperDepend: TFrmBomPtOperDepend
  Left = 246
  Top = 232
  ClientHeight = 196
  ClientWidth = 578
  Caption = 'Process Dependency'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TUniSplitter
    Left = 193
    Top = 0
    Width = 6
    Height = 196
    Hint = ''
    Align = alLeft
    ParentColor = False
    Color = clBtnFace
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 193
    Height = 196
    Hint = ''
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Caption = ''
    object wwDataInspector1: TwwDataInspector
      Left = 0
      Top = 0
      Width = 193
      Height = 196
      DisableThemes = False
      Align = alClient
      TabOrder = 1
      DataSource = SrcPtoper
      Items = <
        item
          DataSource = SrcPtoper
          DataField = 'OPNO'
          Caption = 'Process #'
          WordWrap = False
        end
        item
          DataSource = SrcPtoper
          DataField = 'OPDESC'
          Caption = 'Description'
          WordWrap = False
        end
        item
          DataSource = SrcPtoper
          DataField = 'OPSEQ'
          Caption = 'Sequence #'
          WordWrap = False
        end>
      DefaultRowHeight = 19
      CaptionWidth = 90
      Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
    end
  end
  object Panel2: TUniPanel
    Left = 199
    Top = 0
    Width = 379
    Height = 196
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 1
      Top = 1
      Width = 377
      Height = 30
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 5
        Top = 9
        Width = 83
        Height = 13
        Hint = ''
        Caption = 'Parent Processes'
        TabOrder = 1
      end
    end
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 30
      Width = 377
      Height = 166
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 160
      IQComponents.Grid.Height = 80
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcPtoperDepend
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
      IQComponents.Navigator.DataSource = SrcPtoperDepend
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 160
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 80
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcPtoperDepend
      Columns = <
        item
          FieldName = 'OPNO'
          Title.Caption = 'Process #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OPDESC'
          Title.Caption = 'Process Description'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OPSEQ'
          Title.Caption = 'Sequence #'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
    object wwDBComboDlgProcess: TUniEdit
      Left = 14
      Top = 74
      Width = 161
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 2
    end
  end
  object SrcPtoper: TDataSource
    DataSet = QryPtoper
    Left = 42
    Top = 75
  end
  object QryPtoper: TFDQuery
    BeforeOpen = QryPtoperBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.id,'
      '       p.opseq,'
      '       s.opno,'
      '       s.opdesc'
      '  from ptoper p,'
      '       sndop s '
      ' where p.id = :ptoper_id'
      '   and p.sndop_id = s.id      '
      ' ')
    Left = 42
    Top = 97
    ParamData = <
      item
        Name = 'ptoper_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPtoperID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.PTOPER.ID'
      Size = 0
    end
    object QryPtoperOPSEQ: TBCDField
      DisplayLabel = '#'
      FieldName = 'OPSEQ'
      Origin = 'IQ.PTOPER.OPSEQ'
      Size = 0
    end
    object QryPtoperOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Origin = 'IQ.SNDOP.OPNO'
      Size = 15
    end
    object QryPtoperOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Origin = 'IQ.SNDOP.OPDESC'
      Size = 60
    end
  end
  object SrcPtoperDepend: TDataSource
    DataSet = QryPtoperDepend
    Left = 96
    Top = 75
  end
  object QryPtoperDepend: TFDQuery
    BeforePost = QryPtoperDependBeforePost
    AfterPost = ApplyUpdates
    AfterDelete = ApplyUpdates
    OnNewRecord = QryPtoperDependNewRecord
    CachedUpdates = True
    MasterSource = SrcPtoper
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select d.id,'
      '       d.ptoper_id,'
      '       d.parent_id,'
      '       decode(d.parent_id, -1, '#39'N/A'#39', s.opno) as opno,'
      '       decode(d.parent_id, -1, '#39'<START>'#39', s.opdesc) as opdesc,'
      '       p.opseq'
      '  from ptoper_depend d,'
      '       ptoper p,'
      '       sndop s'
      ' where d.ptoper_id = :id'
      '   and d.parent_id = p.id(+)'
      '   and p.sndop_id = s.id(+)'
      'order by d.id   ')
    Left = 96
    Top = 96
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryPtoperDependOPNO: TStringField
      DisplayLabel = 'Process #'
      DisplayWidth = 15
      FieldName = 'OPNO'
      Size = 15
    end
    object QryPtoperDependOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      ReadOnly = True
      Size = 60
    end
    object QryPtoperDependOPSEQ: TBCDField
      DisplayLabel = 'Sequence #'
      DisplayWidth = 10
      FieldName = 'OPSEQ'
      ReadOnly = True
      Size = 0
    end
    object QryPtoperDependID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object QryPtoperDependPTOPER_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PTOPER_ID'
      Visible = False
      Size = 0
    end
    object QryPtoperDependPARENT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PARENT_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ptoper_depend'
      '  (ID, PTOPER_ID, PARENT_ID)'
      'values'
      '  (:ID, :PTOPER_ID, :PARENT_ID)')
    ModifySQL.Strings = (
      'update ptoper_depend'
      'set'
      '  ID = :ID,'
      '  PTOPER_ID = :PTOPER_ID,'
      '  PARENT_ID = :PARENT_ID'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ptoper_depend'
      'where'
      '  ID = :OLD_ID')
    Left = 95
    Top = 125
  end
  object SecurityRegister1: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryPtoperDepend')
    SecurityCode = 'FRMBOMPTOPERDEPEND'
    Left = 138
    Top = 75
  end
  object PkSndop: TIQWebHpick
    BeforeOpen = PkSndopBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select opseq as opseq,'
      '       opno as opno, '
      '       opdesc as opdesc, '
      '       op_class as op_class,'
      '       pk_hide as pk_hide,'
      '       ptoper_id as ptoper_id'
      '       '
      '-- HPICK_FROM_START'
      '  from    '
      '      ( select '
      '               ptoper.opseq as opseq,'
      '               sndop.opno as opno, '
      '               sndop.opdesc as opdesc, '
      '               sndop.op_class as op_class, '
      '               sndop.pk_hide as pk_hide,'
      '               ptoper.id as ptoper_id'
      '          from ptoper, sndop'
      '         where ptoper.partno_id = :partno_id'
      '           and ptoper.opseq < :opseq'
      '           and ptoper.sndop_id = sndop.id'
      '           and misc.eplant_filter_include_nulls( eplant_id ) = 1'
      '                                      '
      '        UNION ALL'
      ''
      '        select '
      '               0 as opseq,'
      '               '#39'N/A'#39' as opno, '
      '               '#39'<START>'#39' as opdesc, '
      '               '#39#39' as op_class, '
      '               '#39'N'#39' as pk_hide,'
      '               -1 as ptoper_id'
      '          from dual'
      '         where :opseq > 1)'
      '          '
      '-- HPICK_WHERE_START'
      '  '
      ' '
      ' '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 136
    Top = 108
    ParamData = <
      item
        Name = 'partno_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'opseq'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkSndopOPSEQ: TFMTBCDField
      DisplayLabel = '#'
      FieldName = 'OPSEQ'
      Size = 38
    end
    object PkSndopOPNO: TStringField
      DisplayLabel = 'Process #'
      FieldName = 'OPNO'
      Size = 15
    end
    object PkSndopOPDESC: TStringField
      DisplayLabel = 'Process Description'
      DisplayWidth = 30
      FieldName = 'OPDESC'
      Size = 60
    end
    object PkSndopPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      Size = 1
    end
    object PkSndopPTOPER_ID: TFMTBCDField
      FieldName = 'PTOPER_ID'
      Visible = False
      Size = 38
    end
  end
end

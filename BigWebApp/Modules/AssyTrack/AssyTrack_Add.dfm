object FrmAssyTrackAdd: TFrmAssyTrackAdd
  Left = 487
  Top = 278
  ClientHeight = 343
  ClientWidth = 634
  Caption = 'Add To Assembly Track'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 284
    Width = 634
    Height = 40
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 455
      Top = 1
      Width = 178
      Height = 38
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 2
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 91
        Top = 8
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object pnlTopToolBar: TUniPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 28
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object pnlFilterDays: TUniPanel
      Tag = 1999
      Left = 433
      Top = 1
      Width = 200
      Height = 26
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Label1: TUniLabel
        Left = 9
        Top = 6
        Width = 72
        Height = 13
        Hint = ''
        Caption = 'Days Out Filter'
        TabOrder = 3
      end
      object Bevel1: TUniPanel
        Left = 1
        Top = 1
        Width = 2
        Height = 24
        Hint = ''
        Align = alLeft
        Anchors = [akLeft, akTop, akBottom]
        TabOrder = 4
        Caption = ''
      end
      object DBEdit1: TUniDBEdit
        Left = 92
        Top = 2
        Width = 43
        Height = 21
        Hint = 'Days out filter on Must Start Date'
        ShowHint = True
        ParentShowHint = False
        DataField = 'ADD_JOBS_DAYS_OUT_FILTER'
        DataSource = SrcParams
        TabOrder = 0
      end
      object NavParams: TUniDBNavigator
        Left = 139
        Top = 1
        Width = 60
        Height = 24
        Hint = ''
        DataSource = SrcParams
        VisibleButtons = [nbPost, nbCancel]
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 324
    Width = 634
    Height = 19
    Hint = ''
    Panels = <
      item
        Text = ' MfgType'
        Width = 200
      end
      item
        Text = ' MfgCell'
        Width = 200
      end
      item
        Width = 50
      end>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object IQSearchWO: TIQUniGridControl
    Left = 0
    Top = 28
    Width = 634
    Height = 256
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 417
    IQComponents.Grid.Height = 170
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcUnsched
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Grid.OnDrawColumnCell = IQSearchWODBGridDrawColumnCell
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcUnsched
    IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbRefresh]
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.Navigator.BeforeAction = IQSearchWODBNavigatorBeforeAction
    IQComponents.HiddenPanel.Left = 417
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 170
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitLeft = 0
    IQComponents.FormTab.ExplicitTop = 0
    IQComponents.FormTab.ExplicitWidth = 256
    IQComponents.FormTab.ExplicitHeight = 128
    DataSource = SrcUnsched
    Columns = <
      item
        FieldName = 'ID'
        Title.Caption = 'WO #'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'MFGNO'
        Title.Caption = 'Mfg #'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ITEMNO'
        Title.Caption = 'Item #'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Qty'
        Title.Caption = 'Qty'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REL_DATE'
        Title.Caption = 'Release Date'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PRODHRS'
        Title.Caption = 'Prod Hours'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'REV'
        Title.Caption = 'Rev'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'Class'
        Width = 28
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Description'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'START_TIME'
        Title.Caption = 'Must Start'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PRIORITY'
        Title.Caption = 'Priority'
        Width = 42
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'FIRM'
        Title.Caption = 'Firm'
        Width = 7
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'ORIGIN'
        Title.Caption = 'Origin'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DESCRIP2'
        Title.Caption = 'Ext Description'
        Width = 245
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CUSTNO'
        Title.Caption = 'Cust #'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'COMPANY'
        Title.Caption = 'Customer Name'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORDERNO'
        Title.Caption = 'SO#'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object SrcUnsched: TDataSource
    DataSet = QryUnsched
    Left = 35
    Top = 98
  end
  object QryUnsched: TFDQuery
    Tag = 1
    BeforeOpen = QryUnschedBeforeOpen
    OnCalcFields = QryUnschedCalcFields
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evAutoClose]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select w.id,'
      '       w.standard_id,'
      '       o.partno_id,'
      '       w.start_time,'
      '       w.end_time,'
      '       w.prodhrs,'
      '       s.mfgno,'
      '       a.itemno,'
      '       a.rev,'
      '       a.class,'
      '       a.descrip,'
      '       a.descrip2,'
      '       a.eplant_id,'
      '       o.id as ptorder_id,'
      '       a.id as arinvt_id,'
      '       a.std_cost,'
      '       r.rel_date,'
      '       w.priority,'
      '       w.firm,'
      '       w.origin,'
      '       w.is_xcpt_mat,'
      ''
      '       c.custno,'
      '       c.company,'
      
        '       (select orderno from ptorder_rel where ptorder_id = o.id ' +
        'and orderno is not null and rownum < 2 ) as orderno'
      ''
      '  from'
      '       workorder w,'
      '       standard s,'
      '       ptorder o,'
      '       partno p,'
      '       arinvt a,'
      '       v_workorder_earliest_release r,'
      '       arcusto c'
      ' where  '
      '       -- select assy1 firm workorders'
      '       nvl(w.assy_run, '#39'N'#39') = '#39'N'#39
      '   and w.standard_id = s.id'
      '   and mfg.is_similar_to_assy1( s.mfg_type ) = 1'
      ''
      '   and (:view_kind = 1 and rtrim(s.mfg_type) = :mfgtype'
      '        or'
      '        :view_kind = 2 and s.mfgcell_id = :mfgcell_id)'
      '   '
      '       -- link ptorder, partno and arinvt'
      '   and w.id = o.workorder_id'
      '   and o.partno_id = p.id'
      '   and p.arinvt_id = a.id'
      
        '       -- link v_workorder_earliest_release ro show earliest rel' +
        'ease date'
      '   and w.id = r.workorder_id       '
      ''
      '   and misc.eplant_filter(a.eplant_id) = 1'
      ''
      '   and (:day_out_filter = 0'
      '        or'
      
        '        :day_out_filter <> 0 and w.start_time <= trunc(sysdate) ' +
        '+ :day_out_filter)'
      ''
      '   and w.arcusto_id = c.id(+)'
      '   '
      
        '   and not exists (select 1 from ptoper where partno_id = o.part' +
        'no_id and grouping_process = '#39'Y'#39' and rownum < 2 )'
      ''
      '   and ( nvl(a.assy1_exclude_forecast_wo, '#39'N'#39') <> '#39'Y'#39
      '         or'
      '         ( nvl(a.assy1_exclude_forecast_wo, '#39'N'#39') = '#39'Y'#39
      '           and'
      '           nvl(w.origin,'#39'*'#39') <> '#39'FORECAST'#39
      '           and'
      
        '           not exists (select 1 from ptorder_rel where ptorder_i' +
        'd = o.id and fore_dtl_id is not null and rownum < 2)'
      '         ))'
      '        '
      '   '
      '               ')
    Left = 28
    Top = 135
    ParamData = <
      item
        Name = 'view_kind'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'mfgtype'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'mfgcell_id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'day_out_filter'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryUnschedID: TBCDField
      DisplayLabel = 'WO #'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'w.id'
      Size = 0
    end
    object QryUnschedMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 25
      FieldName = 'MFGNO'
      Origin = 's.mfgno'
      Size = 50
    end
    object QryUnschedITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object QryUnschedQty: TFloatField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Qty'
      DisplayFormat = '########0.00'
      Calculated = True
    end
    object QryUnschedREL_DATE: TDateTimeField
      DisplayLabel = 'Release Date'
      DisplayWidth = 18
      FieldName = 'REL_DATE'
      Origin = 'r.rel_date'
    end
    object QryUnschedPRODHRS: TFMTBCDField
      DisplayLabel = 'Prod Hours'
      DisplayWidth = 10
      FieldName = 'PRODHRS'
      Origin = 'w.prodhrs'
      DisplayFormat = '########0.00'
      Size = 6
    end
    object QryUnschedREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object QryUnschedCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 4
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object QryUnschedDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object QryUnschedEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Size = 0
    end
    object QryUnschedSTART_TIME: TDateTimeField
      DisplayLabel = 'Must Start'
      DisplayWidth = 18
      FieldName = 'START_TIME'
      Origin = 'w.start_time'
    end
    object QryUnschedPRIORITY: TStringField
      DisplayLabel = 'Priority'
      DisplayWidth = 6
      FieldName = 'PRIORITY'
      FixedChar = True
      Size = 1
    end
    object QryUnschedFIRM: TStringField
      DisplayLabel = 'Firm'
      DisplayWidth = 1
      FieldName = 'FIRM'
      Origin = 'w.firm'
      FixedChar = True
      Size = 1
    end
    object QryUnschedORIGIN: TStringField
      DisplayLabel = 'Origin'
      DisplayWidth = 10
      FieldName = 'ORIGIN'
      Origin = 'w.origin'
      Size = 10
    end
    object QryUnschedDESCRIP2: TStringField
      DisplayLabel = 'Ext Description'
      DisplayWidth = 35
      FieldName = 'DESCRIP2'
      Origin = 'a.descrip2'
      Size = 100
    end
    object QryUnschedCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'c.custno'
      FixedChar = True
      Size = 10
    end
    object QryUnschedCOMPANY: TStringField
      DisplayLabel = 'Customer Name'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'c.company'
      Size = 60
    end
    object QryUnschedORDERNO: TStringField
      DisplayLabel = 'SO#'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 
        '(select orderno from ptorder_rel where ptorder_id = o.id and ord' +
        'erno is not null and rownum < 2 )'
      Size = 15
    end
    object QryUnschedPTORDER_ID: TBCDField
      FieldName = 'PTORDER_ID'
      Visible = False
      Size = 0
    end
    object QryUnschedARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object QryUnschedSTD_COST: TFMTBCDField
      FieldName = 'STD_COST'
      Visible = False
      Size = 6
    end
    object QryUnschedPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Visible = False
      Size = 0
    end
    object QryUnschedSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
    object QryUnschedIS_XCPT_MAT: TStringField
      FieldName = 'IS_XCPT_MAT'
      Visible = False
      Size = 1
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK'
      'JumpToWorkOrder1'
      'JumpToBOM1'
      'JumpToInventory1')
    SecurityCode = 'FRMASSYTRACKADD'
    Left = 238
    Top = 110
  end
  object popmGridWO: TUniPopupMenu
    Left = 100
    Top = 167
    object JumpToWorkOrder1: TUniMenuItem
      Caption = 'Jump To Work Order'
      OnClick = JumpToWorkOrder1Click
    end
    object JumpToBOM1: TUniMenuItem
      Caption = 'Jump To BOM'
      OnClick = JumpToBOM1Click
    end
    object JumpToInventory1: TUniMenuItem
      Caption = 'Jump To Inventory'
      OnClick = JumpToInventory1Click
    end
  end
  object IQJumpWO: TIQWebJump
    DataField = 'ID'
    DataSource = SrcUnsched
    JumpTo = jtWorkOrder
    Left = 210
    Top = 167
  end
  object IQJumpBOM: TIQWebJump
    DataField = 'STANDARD_ID'
    DataSource = SrcUnsched
    JumpTo = jtBom
    Left = 210
    Top = 202
  end
  object IQJumpInv: TIQWebJump
    DataField = 'ARINVT_ID'
    DataSource = SrcUnsched
    JumpTo = jtInventory
    Left = 209
    Top = 232
  end
  object PkWorkorders: TIQWebHpick
    BeforeOpen = QryUnschedBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select w.id          as id,'
      '       s.mfgno       as mfgno,'
      '       w.start_time  as start_time,'
      '       w.prodhrs     as prodhrs,'
      '       a.itemno      as itemno,'
      '       a.rev         as rev,'
      '       a.class       as class,'
      '       a.descrip     as descrip,'
      '       a.eplant_id   as eplant_id,'
      '       w.firm        as firm,'
      '       o.partno_id   as partno_id,'
      '       o.id          as ptorder_id,'
      '       a.id          as arinvt_id,'
      '       w.standard_id as standard_id'
      '  from '
      '       workorder w,'
      '       standard s,'
      '       ptorder o,'
      '       partno p,'
      '       arinvt a,'
      '       v_workorder_earliest_release r'
      ' where  '
      '       /* select assy1 firm workorders */'
      '       nvl(w.assy_run, '#39'N'#39') = '#39'N'#39
      '   and w.standard_id = s.id'
      '   and mfg.lookup_mfgtype(s.mfg_type) in ('#39'ASSY1'#39', '#39'ASSY2'#39')'
      '       /* link ptorder, partno and arinvt */'
      '   and w.id = o.workorder_id'
      '   and o.partno_id = p.id'
      '   and p.arinvt_id = a.id'
      
        '       /* link v_workorder_earliest_release ro show earliest rel' +
        'ease date */'
      '   and w.id = r.workorder_id       '
      ''
      '   and misc.eplant_filter(a.eplant_id) = 1'
      ''
      '   and (:day_out_filter = 0 '
      '        or'
      
        '        :day_out_filter <> 0 and w.start_time <= trunc(sysdate) ' +
        '+ :day_out_filter)'
      '   '
      '   and (:view_kind = 1 and rtrim(s.mfg_type) = :mfgtype'
      '        or'
      '        :view_kind = 2 and s.mfgcell_id = :mfgcell_id)'
      ''
      '   and ( nvl(a.assy1_exclude_forecast_wo, '#39'N'#39') <> '#39'Y'#39
      '         or'
      
        '         nvl(a.assy1_exclude_forecast_wo, '#39'N'#39') = '#39'Y'#39' and nvl(w.o' +
        'rigin,'#39'*'#39') <> '#39'FORECAST'#39')'
      '        '
      '   ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 334
    Top = 161
    ParamData = <
      item
        Name = 'day_out_filter'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'view_kind'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'mfgtype'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'mfgcell_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkWorkordersID: TBCDField
      DisplayLabel = 'WO #'
      FieldName = 'ID'
      Origin = 'w.id'
      Size = 0
    end
    object PkWorkordersMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      FieldName = 'MFGNO'
      Origin = 's.mfgno'
      Size = 50
    end
    object PkWorkordersSTART_TIME: TDateTimeField
      DisplayLabel = 'Must Start'
      FieldName = 'START_TIME'
      Origin = 'w.start_time'
    end
    object PkWorkordersPRODHRS: TFMTBCDField
      DisplayLabel = 'Prod Hours'
      FieldName = 'PRODHRS'
      Origin = 'w.prodhrs'
      Size = 6
    end
    object PkWorkordersITEMNO: TStringField
      DisplayLabel = 'Item #'
      FieldName = 'ITEMNO'
      Origin = 'a.itemno'
      FixedChar = True
      Size = 50
    end
    object PkWorkordersREV: TStringField
      DisplayLabel = 'Item Rev'
      FieldName = 'REV'
      Origin = 'a.rev'
      FixedChar = True
      Size = 15
    end
    object PkWorkordersCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Origin = 'a.class'
      FixedChar = True
      Size = 2
    end
    object PkWorkordersDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      FieldName = 'DESCRIP'
      Origin = 'a.descrip'
      Size = 100
    end
    object PkWorkordersEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'a.eplant_id'
      Size = 0
    end
    object PkWorkordersFIRM: TStringField
      DisplayLabel = 'Firm'
      FieldName = 'FIRM'
      Origin = 'w.firm'
      FixedChar = True
      Size = 1
    end
    object PkWorkordersPARTNO_ID: TBCDField
      FieldName = 'PARTNO_ID'
      Visible = False
      Size = 0
    end
    object PkWorkordersPTORDER_ID: TBCDField
      FieldName = 'PTORDER_ID'
      Visible = False
      Size = 0
    end
    object PkWorkordersARINVT_ID: TBCDField
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkWorkordersSTANDARD_ID: TBCDField
      FieldName = 'STANDARD_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcParams: TDataSource
    DataSet = TblParams
    Left = 175
    Top = 94
  end
  object TblParams: TFDTable
    AfterPost = TblParamsAfterPost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 175
    Top = 132
    object TblParamsADD_JOBS_DAYS_OUT_FILTER: TBCDField
      FieldName = 'ADD_JOBS_DAYS_OUT_FILTER'
      Size = 0
    end
  end
end

object Cap_Main_DM: TCap_Main_DM
  OldCreateOrder = True
  Height = 472
  Width = 446
  object MainMenu1: TMainMenu
    Left = 345
    Top = 31
    object File1: TMenuItem
      Caption = '&File'
      object Recalculate1: TMenuItem
        Caption = '&Recalculate'
        Visible = False
        OnClick = Recalculate1Click
      end
      object N4: TMenuItem
        Caption = '-'
        Visible = False
      end
      object Exit1: TMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Options1: TMenuItem
      Caption = '&Options'
      object MaterialPlanning1: TMenuItem
        Caption = '&Material Planning...'
        OnClick = MaterialPlanning1Click
      end
      object DailyPartProjection1: TMenuItem
        Caption = '&Daily Parts Projection'
        OnClick = DailyPartProjection1Click
      end
    end
    object Reports1: TMenuItem
      Caption = '&Reports'
      object Print1: TMenuItem
        Caption = '&Print'
      end
      object PrintSetup1: TMenuItem
        Caption = 'Print &Setup'
        OnClick = PrintSetup1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object Contents1: TMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TMenuItem
        Caption = '&About'
      end
    end
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 345
    Top = 184
  end
  object PopupMenu1: TPopupMenu
    Left = 345
    Top = 104
    object Details1: TMenuItem
      Caption = '&Projected Parts'
      OnClick = GridDayDblClick
    end
    object HoursShift1: TMenuItem
      Caption = 'Hours / Shift'
      OnClick = HoursShift1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object JumptoWorkOrder1: TMenuItem
      Caption = 'Jump to WorkOrder'
      OnClick = JumptoWorkOrder1Click
    end
  end
  object SrcWorkCenterType: TDataSource
    DataSet = QryWorkCenterType
    OnDataChange = SrcWorkCenterTypeDataChange
    Left = 48
    Top = 23
  end
  object QryWorkCenterType: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct RTrim(w.cntr_type) as cntr_type, '
      '       w.mfgcell_id,'
      '       m.mfgcell,'
      '       m.descrip as mfgcell_descrip,'
      '       w.mfg_type as mfgtype'
      '  from work_center w,'
      '       mfgcell m'
      ' where w.mfgcell_id = m.id(+)'
      '   and NVL(w.pk_hide, '#39'N'#39') = '#39'N'#39
      ' '
      ' '
      ' ')
    Left = 181
    Top = 23
    object QryWorkCenterTypeCNTR_TYPE: TStringField
      DisplayLabel = 'Machine Type'
      DisplayWidth = 17
      FieldName = 'CNTR_TYPE'
      Origin = 'RTrim(w.cntr_type)'
    end
    object QryWorkCenterTypeMFGCELL: TStringField
      DisplayLabel = 'Mfg Cell'
      DisplayWidth = 16
      FieldName = 'MFGCELL'
      Origin = 'm.mfgcell'
      Size = 15
    end
    object QryWorkCenterTypeMFGTYPE: TStringField
      DisplayLabel = 'Mfg Type'
      DisplayWidth = 16
      FieldName = 'MFGTYPE'
      Origin = 'w.mfg_type'
      Size = 10
    end
    object QryWorkCenterTypeMFGCELL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MFGCELL_ID'
      Origin = 'w.mfgcell_id'
      Visible = False
      Size = 0
    end
    object QryWorkCenterTypeMFGCELL_DESCRIP: TStringField
      DisplayLabel = 'MfgCell'
      DisplayWidth = 25
      FieldName = 'MFGCELL_DESCRIP'
      Origin = 'm.descrip'
      Visible = False
      Size = 25
    end
  end
  object SrcV_Hrs_Week_Tot: TDataSource
    DataSet = QryV_Hrs_Week_Tot
    OnDataChange = SrcV_Hrs_Week_TotDataChange
    Left = 56
    Top = 96
  end
  object QryV_Hrs_Week_Tot: TFDQuery
    MasterSource = SrcWorkCenterType
    MasterFields = 'CNTR_TYPE;MFGCELL_ID'
    DetailFields = 'CNTR_TYPE;MFGCELL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.cntr_type,'
      '       a.week_start,'
      '       a.week,'
      '       r.hrs_week_req,'
      '       a.hrs_week_avail,'
      '       DECODE( a.hrs_week_avail, 0,0,'
      
        '               Round((r.hrs_week_req / a.hrs_week_avail) * 100,2' +
        ')) as Used_Percent,'
      '       a.mfgcell_id'
      '  from V_HRS_WEEK_REQ r, v_hrs_week_avail a'
      ' where a.cntr_type = :cntr_type'
      '   and NVL(a.mfgcell_id,0) = NVL(:mfgcell_id,0)'
      '   and a.cntr_type  = r.cntr_type(+)'
      '   and a.week_start = r.week_start(+)'
      '   and NVL(a.mfgcell_id, 0) = NVL( r.mfgcell_id(+), 0)'
      ' order by a.week_start'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 56
    Top = 141
    ParamData = <
      item
        Name = 'CNTR_TYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 21
        Value = '01LGOSVAME'
      end
      item
        Name = 'MFGCELL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 160000c
      end>
    object QryV_Hrs_Week_TotWEEK: TBCDField
      DisplayLabel = 'Week'
      DisplayWidth = 12
      FieldName = 'WEEK'
      Size = 0
    end
    object QryV_Hrs_Week_TotWEEK_START: TDateTimeField
      DisplayLabel = 'Starts On'
      DisplayWidth = 18
      FieldName = 'WEEK_START'
    end
    object QryV_Hrs_Week_TotHRS_WEEK_REQ: TFMTBCDField
      DisplayLabel = 'Requested Hours'
      DisplayWidth = 16
      FieldName = 'HRS_WEEK_REQ'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryV_Hrs_Week_TotHRS_WEEK_AVAIL: TFMTBCDField
      DisplayLabel = 'Available Hours'
      DisplayWidth = 18
      FieldName = 'HRS_WEEK_AVAIL'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryV_Hrs_Week_TotUSED_PERCENT: TFMTBCDField
      DisplayLabel = 'Percentage Used'
      DisplayWidth = 16
      FieldName = 'USED_PERCENT'
      Size = 38
    end
    object QryV_Hrs_Week_TotCNTR_TYPE: TStringField
      DisplayWidth = 19
      FieldName = 'CNTR_TYPE'
      Visible = False
    end
    object QryV_Hrs_Week_TotMFGCELL_ID: TBCDField
      DisplayWidth = 12
      FieldName = 'MFGCELL_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcV_Hrs_Day_Tot: TDataSource
    DataSet = QryV_Hrs_Day_Tot
    Left = 56
    Top = 192
  end
  object QryV_Hrs_Day_Tot: TFDQuery
    MasterSource = SrcV_Hrs_Week_Tot
    MasterFields = 'CNTR_TYPE;WEEK_START;MFGCELL_ID'
    DetailFields = 'CNTR_TYPE;WEEK_START;MFGCELL_ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.cntr_type,'
      '       a.prod_date,'
      '       r.hrs_day_req,'
      '       a.Week_Start,'
      '       a.Week,'
      '       InitCap( to_char( a.prod_date, '#39'DY'#39' )) as Week_Day,'
      '       a.prod_hrs as avail_hrs,'
      '       DECODE( a.prod_hrs, 0, 0,'
      
        '               Round(( r.hrs_day_req / a.prod_hrs ) * 100, 2)) a' +
        's Used_Percent,'
      '       a.mfgcell_id'
      '  from v_hrs_day_REQ r, hrs_day_AVAIL a'
      ' where a.cntr_type  = :cntr_type'
      '   and a.week_start = :week_start'
      '   and NVL(a.mfgcell_id,0) = NVL(:mfgcell_id,0)'
      '   and a.cntr_type  = r.cntr_type(+) '
      '   and a.prod_date  = r.prod_date(+)'
      '   and NVL(a.mfgcell_id,0) = NVL(r.mfgcell_id(+),0)'
      ' order by a.prod_date            '
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 56
    Top = 248
    ParamData = <
      item
        Name = 'CNTR_TYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 21
        Value = '01LGOSVAME'
      end
      item
        Name = 'WEEK_START'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = 42484d
      end
      item
        Name = 'MFGCELL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 160000c
      end>
    object QryV_Hrs_Day_TotPROD_DATE: TDateTimeField
      DisplayLabel = 'Production Date'
      DisplayWidth = 24
      FieldName = 'PROD_DATE'
    end
    object QryV_Hrs_Day_TotWEEK_DAY: TStringField
      DisplayLabel = 'Day'
      DisplayWidth = 15
      FieldName = 'WEEK_DAY'
      Size = 12
    end
    object QryV_Hrs_Day_TotHRS_DAY_REQ: TFMTBCDField
      DisplayLabel = 'Requested Hours'
      DisplayWidth = 15
      FieldName = 'HRS_DAY_REQ'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryV_Hrs_Day_TotAVAIL_HRS: TFMTBCDField
      DisplayLabel = 'Available Hours'
      DisplayWidth = 12
      FieldName = 'AVAIL_HRS'
      DisplayFormat = '#####0.00'
      Size = 6
    end
    object QryV_Hrs_Day_TotUSED_PERCENT: TFMTBCDField
      DisplayLabel = 'Percentage Used'
      DisplayWidth = 16
      FieldName = 'USED_PERCENT'
      Size = 38
    end
    object QryV_Hrs_Day_TotCNTR_TYPE: TStringField
      DisplayWidth = 17
      FieldName = 'CNTR_TYPE'
      Visible = False
    end
    object QryV_Hrs_Day_TotWEEK_START: TDateTimeField
      DisplayWidth = 22
      FieldName = 'WEEK_START'
      Visible = False
    end
    object QryV_Hrs_Day_TotWEEK: TBCDField
      DisplayWidth = 12
      FieldName = 'WEEK'
      Visible = False
      Size = 0
    end
    object QryV_Hrs_Day_TotMFGCELL_ID: TBCDField
      FieldName = 'MFGCELL_ID'
      Visible = False
      Size = 0
    end
  end
  object SrcV_Hrs_Day: TDataSource
    DataSet = QryV_Hrs_Day
    Left = 56
    Top = 296
  end
  object QryV_Hrs_Day: TFDQuery
    AggregatesActive = True
    MasterSource = SrcV_Hrs_Day_Tot
    MasterFields = 'CNTR_TYPE;PROD_DATE;MFGCELL_ID'
    DetailFields = 'CNTR_TYPE;PROD_DATE'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select h.day_hrs_id,'
      '       h.workorder_id,'
      '       h.prod_date,'
      '       h.prod_hrs + h.setuphrs as prod_hrs,'
      '       h.cntr_sched_id,'
      ''
      
        '       decode( h.work_center_id, null, '#39'(Not Sched)'#39', c.eqno) as' +
        ' eqno,'
      ''
      '       /*'
      '       DECODE( d.id,'
      '               null, decode( h.work_center_id,'
      '                             null, '#39'(Not Sched)'#39','
      '                             c.eqno),'
      '               (select nvl( w.eqno, '#39'(Not Sched)'#39')'
      '                  from work_center w, cntr_sched c'
      
        '                 where c.sndop_dispatch_id = d.id  and c.work_ce' +
        'nter_id = w.id)) as eqno,'
      '       */'
      ''
      '       h.work_center_id,'
      '       d.work_center_id as sndop_dispatch_work_center_id,'
      '       h.cntr_type,'
      '       a.custno,'
      '       h.late,'
      '       h.mfgcell_id,'
      '       sndop.opdesc'
      '  from '
      '       V_HRS_DAY h, '
      '       work_center c, '
      '       arcusto a, '
      '       workorder w, '
      '       sndop,'
      '       sndop_dispatch d'
      ' where '
      '       h.cntr_type = :cntr_type'
      '   and h.prod_date = :prod_date'
      '   and NVL(h.mfgcell_id,0) = NVL(:mfgcell_id,0)'
      '   and h.work_center_id = c.id(+)'
      '   and h.workorder_id = w.id'
      '   and w.arcusto_id = a.id(+)'
      '   '
      '   and h.sndop_id = sndop.id(+)'
      '   and h.workorder_id = d.workorder_id(+)'
      '   and h.sndop_id = d.sndop_id(+)'
      ''
      'order by h.workorder_id'
      ' '
      ' '
      ' ')
    Left = 56
    Top = 344
    ParamData = <
      item
        Name = 'CNTR_TYPE'
        DataType = ftString
        ParamType = ptInput
        Size = 21
        Value = '01LGOSVAME'
      end
      item
        Name = 'PROD_DATE'
        DataType = ftDateTime
        ParamType = ptInput
        Size = 8
        Value = 42489.3333333333d
      end
      item
        Name = 'MFGCELL_ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 160000c
      end>
    object QryV_Hrs_DayWORKORDER_ID: TBCDField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDER_ID'
      Size = 0
    end
    object QryV_Hrs_DayPROD_HRS: TFMTBCDField
      DisplayLabel = 'Requested Hours'
      DisplayWidth = 15
      FieldName = 'PROD_HRS'
      DisplayFormat = '#####0.00'
      Size = 38
    end
    object QryV_Hrs_DayCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 15
      FieldName = 'CUSTNO'
      Size = 10
    end
    object QryV_Hrs_DayEQNO: TStringField
      DisplayLabel = 'Center #'
      DisplayWidth = 19
      FieldName = 'EQNO'
      Size = 60
    end
    object QryV_Hrs_DayOPDESC: TStringField
      DisplayLabel = 'Process (FAB/ASSY1)'
      DisplayWidth = 22
      FieldName = 'OPDESC'
      Size = 60
    end
    object QryV_Hrs_DayDAY_HRS_ID: TBCDField
      FieldName = 'DAY_HRS_ID'
      Visible = False
      Size = 0
    end
    object QryV_Hrs_DayPROD_DATE: TDateTimeField
      DisplayWidth = 27
      FieldName = 'PROD_DATE'
      Visible = False
    end
    object QryV_Hrs_DayCNTR_SCHED_ID: TFMTBCDField
      FieldName = 'CNTR_SCHED_ID'
      Visible = False
      Size = 38
    end
    object QryV_Hrs_DayWORK_CENTER_ID: TFMTBCDField
      FieldName = 'WORK_CENTER_ID'
      Visible = False
      Size = 38
    end
    object QryV_Hrs_DayCNTR_TYPE: TStringField
      DisplayWidth = 19
      FieldName = 'CNTR_TYPE'
      Visible = False
    end
    object QryV_Hrs_DayLATE: TStringField
      DisplayWidth = 6
      FieldName = 'LATE'
      Visible = False
      Size = 1
    end
  end
  object IQDataControllerLinkList1: TIQDataControllerLinkList
    DataControllerLinks = <
      item
        DataSource = SrcWorkCenterType
        IsPrimaryLink = True
        ToolbarActions = TlbActionList
      end
      item
        DataSource = SrcV_Hrs_Week_Tot
        IsPrimaryLink = False
      end
      item
        DataSource = SrcV_Hrs_Day_Tot
        IsPrimaryLink = False
      end
      item
        DataSource = SrcV_Hrs_Day
        IsPrimaryLink = False
      end>
    PrimaryLink.DataSource = SrcWorkCenterType
    PrimaryLink.IsPrimaryLink = True
    PrimaryLink.ToolbarActions = TlbActionList
    Left = 343
    Top = 264
  end
  object TlbActionList: TActionList
    Images = tlbImageListAdapter
    Left = 352
    Top = 400
    object actToolbarSearch: TAction
      Caption = 'Search'
      ImageIndex = 0
      OnExecute = actToolbarSearchExecute
    end
  end
  object MnuActionList: TActionList
    Left = 352
    Top = 334
    object actmnuFileRecalculate: TAction
      Category = '\&File'
      Caption = 'Recalculate'
      OnExecute = Recalculate1Click
    end
    object actMnuFileExit: TAction
      Category = '\&File'
      Caption = 'Exit'
      OnExecute = Exit1Click
    end
    object actMnuOptionsMaterialPlanning: TAction
      Category = '\&Options'
      Caption = 'Material Planning'
      OnExecute = MaterialPlanning1Click
    end
    object actMnuOptionsDailyPartsProjection: TAction
      Category = '\&Options'
      Caption = 'Daily Parts Projection'
      OnExecute = DailyPartProjection1Click
    end
    object actMnuReportsPrint: TAction
      Category = '\&Reports'
      Caption = 'Print'
    end
    object actMnuReportsPrintSetup: TAction
      Category = '\&Reports'
      Caption = 'Print Setup'
      OnExecute = PrintSetup1Click
    end
    object actMnuHelpContents: TAction
      Category = '\&Help'
      Caption = 'Contents'
      OnExecute = Contents1Click
    end
    object actMnuHelpAbout: TAction
      Category = '\&Help'
      Caption = 'About'
    end
  end
  object tlbUniImageList: TUniImageList
    Left = 200
    Top = 288
    Bitmap = {
      494C010103000500080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000034464000344640000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B18C7600A0786000906040009058
      40009058400087492A00000000000000000000000000B48565009C755D00A070
      5000905840009050300077381800000000008B8B8B00777777005F5F5F005A5A
      5A005A5A5A004A4A4A0000000000000000000000000084848400747474006F6F
      6F005A5A5A00515151003B3B3B00000000000000000000000000000000000000
      0000034464000ED1FF0003446400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0908000FFF8FF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B0806000F0E8E000E0C8
      C000D0A89000B078500080482000000000008F8F8F00FAFAFA00C9C9C900A1A1
      A10081818100424242000000000000000000000000007F7F7F00E7E7E700C9C9
      C900A7A7A7007777770048484800000000000000000000000000000000000000
      00000000000000669A0014D3FF00034464000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0908000FFF8FF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B0806000F0E8E000F0E0
      E000E0C0B000C088700080483000000000008F8F8F00FAFAFA00C9C9C900A1A1
      A10081818100424242000000000000000000000000007F7F7F00E7E7E700E2E2
      E200C0C0C000898989004A4A4A00000000000000000000000000000000000000
      0000000000000099CC001BD5FF001BD5FF000344640000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0908000FFF8FF00E0C8C000D0A0
      9000C080600080402000000000000000000000000000B0806000F0E8E000F0E0
      E000E0C0B000C088700080483000000000008F8F8F00FAFAFA00C9C9C900A1A1
      A10081818100424242000000000000000000000000007F7F7F00E7E7E700E2E2
      E200C0C0C000898989004A4A4A00000000000000000000000000000000000000
      0000000000000000000000669A0022D7FF0022D7FF0003446400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0988000FFFFFF00F0E8E000E0C8
      C000D0A0800080402000000000000000000000000000B0806000F0E8E000F0E0
      E000E0C0B000C0887000804830000000000097979700FFFFFF00E7E7E700C9C9
      C9009E9E9E00424242000000000000000000000000007F7F7F00E7E7E700E2E2
      E200C0C0C000898989004A4A4A00000000000000000000000000000000000000
      000000669A0000669A0000669A0029DAFF000344640003446400034464000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3A49400B0887000A06850009050
      30008048300080482000803810008F4C2600B0887000A0685000905830009048
      300080402000703810009058300000000000A4A4A40087878700696969005151
      51004A4A4A00484848003B3B3B004E4E4E008787870069696900575757004C4C
      4C00424242003939390057575700000000000000000000000000000000000000
      00000000000000669A0030DCFF0030DCFF000344640000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEC4B400B0887000FFFFFF00E0D0
      C000D0A09000A070500080401000D5B89C00B0907000E0D8D000F0D8D000D0A0
      9000B078500080382000CFA98A0000000000C3C3C30087878700FFFFFF00CECE
      CE00A1A1A1006F6F6F0041414100B5B5B5008D8D8D00D7D7D700D9D9D900A1A1
      A100777777003D3D3D00A7A7A700000000000000000000000000000000000000
      0000000000000000000000669A0037DEFF0037DEFF0003446400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0908000F0F0F000FFF8
      F000F0D8C000B08060008048200096573200B0907000FFFFFF00FFF8F000F0D0
      C000B07850008048200000000000000000000000000000000000F0F0F000F7F7
      F700D5D5D5007F7F7F0048484800575757008D8D8D00FFFFFF00F7F7F700D0D0
      D000777777004848480000000000000000000000000000000000000000000000
      0000000000000000000000669A003DE0FF003DE0FF003DE0FF00034464000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F8E2D200C0988000B080
      6000A068500090503000905840009D684200B0786000B0887000A07050008048
      300080482000ECC4A700000000000000000000000000E1E1E100979797007F7F
      7F0069696900515151005A5A5A006767670079797900878787006F6F6F004A4A
      4A0048484800C2C2C20000000000000000000000000000000000000000000066
      9A0000669A0000669A0000669A0044E3FF000344640003446400034464000344
      6400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0988000FFF8
      FF00E0C0B000C09070008048200000000000C0988000FFF8FF00E0C8B000D0A0
      800080482000000000000000000000000000000000000000000097979700FAFA
      FA00C0C0C0008E8E8E00484848000000000097979700FAFAFA00C5C5C5009E9E
      9E00484848000000000000000000000000000000000000000000000000000000
      000000669A004BE5FF004BE5FF004BE5FF004BE5FF0003446400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CFB1A100B090
      8000A0685000905030008751390000000000C0A89000B0908000A06850009050
      3000864F37000000000000000000000000000000000000000000B0B0B0008F8F
      8F0069696900515151005252520000000000A5A5A5008F8F8F00696969005151
      5100505050000000000000000000000000000000000000000000000000000000
      00000000000000669A005CEBFE005CEBFE005CEBFE005CEBFE00034464000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B183
      6D00FFF8F00081452700000000000000000000000000B0806800FFF8F0008043
      2400000000000000000000000000000000000000000000000000000000008383
      8300F7F7F7004646460000000000000000000000000080808000F7F7F7004444
      4400000000000000000000000000000000000000000000000000000000000000
      0000000000000099CC0000669A0070F1FE0070F1FE0070F1FE0070F1FE000344
      6400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C7A8
      9800B48D75009D684300000000000000000000000000CEAE9C00B48C74009C66
      400000000000000000000000000000000000000000000000000000000000A7A7
      A7008C8C8C0067676700000000000000000000000000ADADAD008B8B8B006565
      6500000000000000000000000000000000000000000000000000000000000000
      000000000000000000000099CC00034464000344640003446400034464000344
      6400034464000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFFFFF3FF0000
      03810381F1FF000003810381F8FF000003810381F87F000003810381FC3F0000
      03810381F01F000000010001F87F000000010001FC3F00008003C003FC1F0000
      80038003E00F0000C107C107F03F0000C107C107F81F0000E38FE38FF80F0000
      E38FE38FFC070000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object tlbImageListAdapter: TUniImageListAdapter
    UniImageList = tlbUniImageList
    Left = 200
    Top = 368
  end
end

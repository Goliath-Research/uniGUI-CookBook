object DM_RTPCMon: TDM_RTPCMon
  OldCreateOrder = False
  Height = 495
  Width = 591
  object srcWorkCenter: TDataSource
    DataSet = tblWork_Center
    Left = 92
    Top = 10
  end
  object tblWork_Center: TFDTable
    BeforeEdit = tblWork_CenterBeforeEdit
    Filtered = True
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateTableName = 'WORK_CENTER'
    TableName = 'WORK_CENTER'
    Left = 101
    Top = 15
    object tblWork_CenterID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object tblWork_CenterEQNO: TStringField
      DisplayLabel = 'Work Center #'
      DisplayWidth = 11
      FieldName = 'EQNO'
      Required = True
      Size = 60
    end
    object tblWork_CenterCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 14
      FieldName = 'CNTR_TYPE'
      Required = True
    end
    object tblWork_CenterCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 27
      FieldName = 'CNTR_DESC'
      Size = 250
    end
    object tblWork_CenterMFGCELL: TStringField
      DisplayLabel = 'Manufacturing Cell'
      DisplayWidth = 15
      FieldName = 'MFGCELL'
      Size = 15
    end
    object tblWork_CenterMFG_TYPE: TStringField
      DisplayLabel = 'Manufacturing Type'
      DisplayWidth = 10
      FieldName = 'MFG_TYPE'
      Required = True
      Size = 10
    end
    object tblWork_CenterIS_RT: TStringField
      DisplayLabel = 'RT?'
      DisplayWidth = 3
      FieldName = 'IS_RT'
      Size = 1
    end
    object tblWork_CenterEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object tblWork_CenterMFGCELL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'MFGCELL_ID'
      Visible = False
      Size = 0
    end
    object tblWork_CenterPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object tblWork_CenterIS_VIRTUAL: TStringField
      FieldName = 'IS_VIRTUAL'
      Visible = False
      Size = 1
    end
    object tblWork_CenterPARENT_ID: TBCDField
      FieldName = 'PARENT_ID'
      Visible = False
      Size = 0
    end
  end
  object pkWorkCntr: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select w.eqno as eqno,'
      '       w.cntr_desc as cntr_desc,'
      '       w.cntr_type as cntr_type,'
      '       w.ID as id,'
      '       w.eplant_id as eplant_id,'
      '       e.name as eplant_name,'
      '       m.mfgcell as mfgcell,'
      '       d.name as division_name,'
      '       w.pk_hide as pk_hide,'
      '       pd.name as device_name,'
      '       pd.descrip as device_descrip,'
      '       pd.id as pcmon_device_id,'
      '       pd.inactive as device_inactive'
      ' from work_center w,'
      '      pcmon_device pd,'
      '      mfgcell m,'
      '      division d,'
      '      eplant e'
      'where w.mfgcell_id = m.id(+)'
      '  and m.division_id = d.id(+)'
      '  and e.id(+) = w.eplant_id'
      '  and w.parent_id is null'
      '  and w.id = pd.work_center_id(+)'
      '  and misc.Eplant_Filter(w.eplant_id) = 1 '
      '  '
      ' '
      ' '
      ' '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 444
    Top = 12
    object pkWorkCntrEQNO: TStringField
      DisplayLabel = 'Work Center #'
      FieldName = 'EQNO'
      Origin = 'w.eqno'
      Size = 60
    end
    object pkWorkCntrCNTR_DESC: TStringField
      DisplayLabel = 'Description'
      FieldName = 'CNTR_DESC'
      Origin = 'w.cntr_desc'
      Size = 250
    end
    object pkWorkCntrCNTR_TYPE: TStringField
      DisplayLabel = 'Type'
      FieldName = 'CNTR_TYPE'
      Origin = 'w.cntr_type'
    end
    object pkWorkCntrID: TBCDField
      FieldName = 'ID'
      Origin = 'w.id'
      Visible = False
      Size = 0
    end
    object pkWorkCntrEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'w.eplant_id'
      Visible = False
      Size = 0
    end
    object pkWorkCntrMFGCELL: TStringField
      DisplayLabel = 'Manufacturing Cell'
      FieldName = 'MFGCELL'
      Origin = 'm.mfgcell'
      Size = 15
    end
    object pkWorkCntrDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 15
      FieldName = 'DIVISION_NAME'
      Origin = 'd.name'
      Size = 25
    end
    object pkWorkCntrEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 12
      FieldName = 'EPLANT_NAME'
      Origin = 'e.name'
      Size = 30
    end
    object pkWorkCntrPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object pkWorkCntrDEVICE_NAME: TStringField
      DisplayLabel = 'Device Name'
      FieldName = 'DEVICE_NAME'
      Size = 25
    end
    object pkWorkCntrDEVICE_DESCRIP: TStringField
      DisplayLabel = 'Device Descrip'
      FieldName = 'DEVICE_DESCRIP'
      Size = 50
    end
    object pkWorkCntrPCMON_DEVICE_ID: TBCDField
      FieldName = 'PCMON_DEVICE_ID'
      Visible = False
      Size = 0
    end
    object pkWorkCntrDEVICE_INACTIVE: TStringField
      DisplayLabel = 'Device Inactive'
      FieldName = 'DEVICE_INACTIVE'
      Size = 1
    end
  end
  object srcPCMonDevice: TDataSource
    DataSet = tblPCMON_DEVICE
    Left = 88
    Top = 72
  end
  object tblPCMON_DEVICE: TFDTable
    BeforeInsert = tblPCMON_DEVICEBeforeInsert
    BeforePost = tblPCMON_DEVICEBeforePost
    AfterPost = tblPCMON_DEVICEAfterPost
    AfterDelete = tblPCMON_DEVICEAfterPost
    IndexFieldNames = 'WORK_CENTER_ID'
    MasterSource = srcWorkCenter
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PCMON_DEVICE'
    TableName = 'PCMON_DEVICE'
    Left = 96
    Top = 80
    object tblPCMON_DEVICEID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object tblPCMON_DEVICENAME: TStringField
      FieldName = 'NAME'
      Size = 25
    end
    object tblPCMON_DEVICEDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 50
    end
    object tblPCMON_DEVICEIP_ADDRESS: TStringField
      FieldName = 'IP_ADDRESS'
      Size = 200
    end
    object tblPCMON_DEVICETIME_INTERVAL: TBCDField
      FieldName = 'TIME_INTERVAL'
      Size = 0
    end
    object tblPCMON_DEVICEPORT: TBCDField
      FieldName = 'PORT'
      Size = 0
    end
    object tblPCMON_DEVICEBAUD: TBCDField
      FieldName = 'BAUD'
      Size = 0
    end
    object tblPCMON_DEVICEPARITY: TBCDField
      FieldName = 'PARITY'
      Size = 0
    end
    object tblPCMON_DEVICESTOPBITS: TBCDField
      FieldName = 'STOPBITS'
      Size = 0
    end
    object tblPCMON_DEVICEDATABITS: TBCDField
      FieldName = 'DATABITS'
      Size = 0
    end
    object tblPCMON_DEVICESTART_CHAR: TStringField
      FieldName = 'START_CHAR'
      Size = 10
    end
    object tblPCMON_DEVICESTOP_CHAR: TStringField
      FieldName = 'STOP_CHAR'
      Size = 10
    end
    object tblPCMON_DEVICEWORK_CENTER_ID: TBCDField
      FieldName = 'WORK_CENTER_ID'
      Size = 0
    end
    object tblPCMON_DEVICECYCLE_BASED: TStringField
      DisplayLabel = 'Cycle Based'
      FieldName = 'CYCLE_BASED'
      Size = 1
    end
    object tblPCMON_DEVICEOFFLINE_COMMAND: TStringField
      FieldName = 'OFFLINE_COMMAND'
      Size = 50
    end
    object tblPCMON_DEVICEOFFLINE_RESPONSE: TStringField
      FieldName = 'OFFLINE_RESPONSE'
      Size = 50
    end
    object tblPCMON_DEVICERESULT_PREFIX: TStringField
      FieldName = 'RESULT_PREFIX'
      Size = 50
    end
    object tblPCMON_DEVICERESULT_POSTFIX: TStringField
      FieldName = 'RESULT_POSTFIX'
      Size = 50
    end
    object tblPCMON_DEVICECYCLE_THRESHOLD: TBCDField
      FieldName = 'CYCLE_THRESHOLD'
      Size = 0
    end
    object tblPCMON_DEVICEPROTOCOL: TStringField
      FieldName = 'PROTOCOL'
      Size = 30
    end
    object tblPCMON_DEVICEINITS_CONNECT: TStringField
      FieldName = 'INITS_CONNECT'
      Size = 1
    end
    object tblPCMON_DEVICEALWAYS_CONNECTED: TStringField
      FieldName = 'ALWAYS_CONNECTED'
      Size = 1
    end
    object tblPCMON_DEVICETEMPLATE_ID: TBCDField
      FieldName = 'TEMPLATE_ID'
      Visible = False
      Size = 0
    end
    object tblPCMON_DEVICELITTLE_ENDIAN: TStringField
      FieldName = 'LITTLE_ENDIAN'
      Size = 1
    end
    object tblPCMON_DEVICEPRODMON_ENABLED: TStringField
      FieldName = 'PRODMON_ENABLED'
      FixedChar = True
      Size = 1
    end
    object tblPCMON_DEVICEINACTIVE: TStringField
      DisplayLabel = 'Inactive'
      FieldName = 'INACTIVE'
      Size = 1
    end
    object tblPCMON_DEVICESLAVE_NO: TBCDField
      DisplayLabel = 'Slave ID'
      FieldName = 'SLAVE_NO'
      Size = 0
    end
    object tblPCMON_DEVICEWATCHER_DIRECTORY: TStringField
      FieldName = 'WATCHER_DIRECTORY'
      Size = 255
    end
    object tblPCMON_DEVICECIP_PATH: TStringField
      FieldName = 'CIP_PATH'
      Size = 255
    end
    object tblPCMON_DEVICESCAN_INTERVAL: TBCDField
      FieldName = 'SCAN_INTERVAL'
      Size = 0
    end
  end
  object srcPCMon_Device_Capab: TDataSource
    DataSet = tblPCMON_DEVICE_CAPAB
    OnDataChange = srcPCMon_Device_CapabDataChange
    Left = 96
    Top = 136
  end
  object tblPCMON_DEVICE_CAPAB: TFDTable
    BeforeInsert = tblPCMON_DEVICE_CAPABBeforeInsert
    BeforePost = BeforePost
    OnCalcFields = tblPCMON_DEVICE_CAPABCalcFields
    IndexFieldNames = 'PCMON_DEVICE_ID;SEQ'
    MasterSource = srcPCMonDevice
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PCMON_DEVICE_CAPAB'
    TableName = 'PCMON_DEVICE_CAPAB'
    Left = 104
    Top = 144
    object tblPCMON_DEVICE_CAPABCapabType: TStringField
      DisplayLabel = 'Capability Type'
      DisplayWidth = 20
      FieldKind = fkCalculated
      FieldName = 'CapabType'
      Size = 25
      Calculated = True
    end
    object tblPCMON_DEVICE_CAPABCOMMAND: TStringField
      DisplayLabel = 'Command'
      DisplayWidth = 10
      FieldName = 'COMMAND'
      Size = 50
    end
    object tblPCMON_DEVICE_CAPABRESULT_PREFIX: TStringField
      DisplayLabel = 'Data Result Prefix'
      DisplayWidth = 10
      FieldName = 'RESULT_PREFIX'
      Visible = False
      Size = 50
    end
    object tblPCMON_DEVICE_CAPABRESULT_POSTFIX: TStringField
      DisplayLabel = 'Data Result Postfix'
      DisplayWidth = 10
      FieldName = 'RESULT_POSTFIX'
      Visible = False
      Size = 50
    end
    object tblPCMON_DEVICE_CAPABRESPONSE_ACK: TStringField
      DisplayLabel = 'Response Ack'
      DisplayWidth = 10
      FieldName = 'RESPONSE_ACK'
      Visible = False
      Size = 50
    end
    object tblPCMON_DEVICE_CAPABPACKET_HEADER: TStringField
      DisplayLabel = 'Packet Header'
      DisplayWidth = 10
      FieldName = 'PACKET_HEADER'
      Visible = False
      Size = 150
    end
    object tblPCMON_DEVICE_CAPABPACKET_LENGTH: TBCDField
      DisplayLabel = 'Packet Length'
      DisplayWidth = 10
      FieldName = 'PACKET_LENGTH'
      Visible = False
      Size = 0
    end
    object tblPCMON_DEVICE_CAPABSTART_POS: TBCDField
      DisplayLabel = 'Start Position'
      DisplayWidth = 10
      FieldName = 'START_POS'
      Visible = False
      Size = 0
    end
    object tblPCMON_DEVICE_CAPABVALUE_LENGTH: TBCDField
      DisplayLabel = 'Length'
      DisplayWidth = 10
      FieldName = 'VALUE_LENGTH'
      Visible = False
      Size = 0
    end
    object tblPCMON_DEVICE_CAPABID: TBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object tblPCMON_DEVICE_CAPABPCMON_DEVICE_ID: TBCDField
      FieldName = 'PCMON_DEVICE_ID'
      Visible = False
      Size = 0
    end
    object tblPCMON_DEVICE_CAPABPCMON_CAPAB_TYPE_ID: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'PCMON_CAPAB_TYPE_ID'
      Visible = False
      Size = 38
    end
    object tblPCMON_DEVICE_CAPABNAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Size = 50
    end
    object tblPCMON_DEVICE_CAPABUOM: TStringField
      FieldName = 'UOM'
      Size = 10
    end
    object tblPCMON_DEVICE_CAPABSEQ: TBCDField
      DisplayLabel = 'Display Seq'
      FieldName = 'SEQ'
      Size = 0
    end
    object tblPCMON_DEVICE_CAPABACTION_PREDICATE: TStringField
      FieldName = 'ACTION_PREDICATE'
      Size = 50
    end
    object tblPCMON_DEVICE_CAPABACTION_OPERATOR: TStringField
      FieldName = 'ACTION_OPERATOR'
      Size = 2
    end
    object tblPCMON_DEVICE_CAPABACTION: TStringField
      FieldName = 'ACTION'
      Size = 15
    end
    object tblPCMON_DEVICE_CAPABRESULT_DATA_TYPE: TStringField
      DisplayLabel = 'Data Type'
      FieldName = 'RESULT_DATA_TYPE'
      Size = 10
    end
    object tblPCMON_DEVICE_CAPABACTION_SQL: TStringField
      DisplayLabel = 'Action SQL'
      FieldName = 'ACTION_SQL'
      Size = 2000
    end
    object tblPCMON_DEVICE_CAPABTAGNAME: TStringField
      FieldName = 'TAGNAME'
      Size = 255
    end
  end
  object pkPCMonDevice: TIQWebHpick
    Filtered = True
    MasterSource = srcWorkCenter
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select '
      '       pd.id as pcmon_device_id,'
      '       pd.name as name,'
      '       pd.descrip as descrip,'
      '       pd.ip_address as ip_address           '
      '  from pcmon_device pd'
      ' where pd.work_center_id = :id')
    Title = 'Select from Pick List'
    Touchscreen = False
    AssociatedDataSource = srcPCMonDevice
    ForceShowWaitForPrompt = False
    Left = 444
    Top = 68
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object pkPCMonDeviceNAME: TStringField
      DisplayLabel = 'Device Name'
      FieldName = 'NAME'
      Origin = 'IQ.PCMON_DEVICE.NAME'
      Size = 25
    end
    object pkPCMonDeviceDESCRIP: TStringField
      DisplayLabel = 'Device Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.PCMON_DEVICE.DESCRIP'
      Size = 50
    end
    object pkPCMonDeviceIP_ADDRESS: TStringField
      DisplayLabel = 'IP Address'
      FieldName = 'IP_ADDRESS'
      Origin = 'IQ.PCMON_DEVICE.IP_ADDRESS'
      Size = 200
    end
    object pkPCMonDevicePCMON_DEVICE_ID: TBCDField
      FieldName = 'PCMON_DEVICE_ID'
      Origin = 'IQ.PCMON_DEVICE.ID'
      Visible = False
      Size = 0
    end
  end
  object spClonePCMonDevice: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.PCMON_MISC.CLONEDEVICE'
    Left = 360
    Top = 8
    ParamData = <
      item
        Name = 'v_trg_work_center_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_pcmon_device_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_result'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end>
  end
  object srcPCMON_CAPAB_TYPE: TDataSource
    DataSet = tblPCMON_CAPAB_TYPE
    Left = 224
    Top = 64
  end
  object tblPCMON_CAPAB_TYPE: TFDTable
    BeforePost = BeforePost
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PCMON_CAPAB_TYPE'
    TableName = 'PCMON_CAPAB_TYPE'
    Left = 232
    Top = 24
    object tblPCMON_CAPAB_TYPEID: TFMTBCDField
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 38
    end
    object tblPCMON_CAPAB_TYPENAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Size = 50
    end
    object tblPCMON_CAPAB_TYPEDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 50
    end
  end
  object pkPCMonCapabType: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       name as name,'
      '       descrip as descrip'
      '  from pcmon_capab_type')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 448
    Top = 136
    object pkPCMonCapabTypeID: TFMTBCDField
      FieldName = 'ID'
      Origin = 'IQ.PCMON_CAPAB_TYPE.ID'
      Visible = False
      Size = 38
    end
    object pkPCMonCapabTypeNAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Origin = 'IQ.PCMON_CAPAB_TYPE.NAME'
      Size = 50
    end
    object pkPCMonCapabTypeDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.PCMON_CAPAB_TYPE.DESCRIP'
      Size = 50
    end
  end
  object pkPCMonDeviceTemplate: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select t.id as id,'
      '       t.name as name,'
      '       t.protocol as protocol'
      '  from pcmon_device_template t')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 448
    Top = 208
    object pkPCMonDeviceTemplateID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.PCMON_DEVICE_TEMPLATE.ID'
      Visible = False
      Size = 0
    end
    object pkPCMonDeviceTemplateNAME: TStringField
      DisplayLabel = 'Template Name'
      FieldName = 'NAME'
      Origin = 'IQ.PCMON_DEVICE_TEMPLATE.NAME'
      Size = 25
    end
    object pkPCMonDeviceTemplatePROTOCOL: TStringField
      DisplayLabel = 'Protocol'
      FieldName = 'PROTOCOL'
      Origin = 'IQ.PCMON_DEVICE_TEMPLATE.PROTOCOL'
      Size = 25
    end
  end
  object tblPCMON_DEVICE_TEMPLATE: TFDTable
    BeforePost = BeforePost
    IndexFieldNames = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PCMON_DEVICE_TEMPLATE'
    TableName = 'PCMON_DEVICE_TEMPLATE'
    Left = 256
    Top = 120
    object tblPCMON_DEVICE_TEMPLATEID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object tblPCMON_DEVICE_TEMPLATENAME: TStringField
      FieldName = 'NAME'
      Size = 25
    end
    object tblPCMON_DEVICE_TEMPLATEPROTOCOL: TStringField
      FieldName = 'PROTOCOL'
      Required = True
      Size = 25
    end
    object tblPCMON_DEVICE_TEMPLATEOFFLINE_COMMAND: TStringField
      FieldName = 'OFFLINE_COMMAND'
      Size = 50
    end
    object tblPCMON_DEVICE_TEMPLATEOFFLINE_RESPONSE: TStringField
      FieldName = 'OFFLINE_RESPONSE'
      Size = 50
    end
    object tblPCMON_DEVICE_TEMPLATERESULT_PREFIX: TStringField
      FieldName = 'RESULT_PREFIX'
      Size = 50
    end
    object tblPCMON_DEVICE_TEMPLATERESULT_POSTFIX: TStringField
      FieldName = 'RESULT_POSTFIX'
      Size = 50
    end
    object tblPCMON_DEVICE_TEMPLATEINITS_CONNECT: TStringField
      FieldName = 'INITS_CONNECT'
      Size = 1
    end
    object tblPCMON_DEVICE_TEMPLATEALWAYS_CONNECTED: TStringField
      FieldName = 'ALWAYS_CONNECTED'
      Size = 1
    end
    object tblPCMON_DEVICE_TEMPLATELITTLE_ENDIAN: TStringField
      FieldName = 'LITTLE_ENDIAN'
      Size = 1
    end
  end
  object srcPCMON_DEVICE_TEMPLATE: TDataSource
    DataSet = tblPCMON_DEVICE_TEMPLATE
    Left = 248
    Top = 112
  end
  object srcPCMON_DEV_CAPAB_TMPL: TDataSource
    DataSet = tblPCMON_DEV_CAPAB_TMPL
    Left = 256
    Top = 184
  end
  object tblPCMON_DEV_CAPAB_TMPL: TFDTable
    BeforeInsert = tblPCMON_DEV_CAPAB_TMPLBeforeInsert
    BeforeEdit = tblPCMON_DEV_CAPAB_TMPLBeforeEdit
    BeforePost = BeforePost
    OnCalcFields = tblPCMON_DEV_CAPAB_TMPLCalcFields
    IndexFieldNames = 'PCMON_DEVICE_TEMPLATE_ID'
    MasterSource = srcPCMON_DEVICE_TEMPLATE
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PCMON_DEV_CAPAB_TMPL'
    TableName = 'PCMON_DEV_CAPAB_TMPL'
    Left = 256
    Top = 192
    object tblPCMON_DEV_CAPAB_TMPLCapabType: TStringField
      DisplayLabel = 'Capability Type'
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'CapabType'
      Size = 25
      Calculated = True
    end
    object tblPCMON_DEV_CAPAB_TMPLNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 50
      FieldName = 'NAME'
      Size = 50
    end
    object tblPCMON_DEV_CAPAB_TMPLUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Size = 10
    end
    object tblPCMON_DEV_CAPAB_TMPLID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Required = True
      Visible = False
      Size = 0
    end
    object tblPCMON_DEV_CAPAB_TMPLPCMON_DEVICE_TEMPLATE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PCMON_DEVICE_TEMPLATE_ID'
      Required = True
      Visible = False
      Size = 0
    end
    object tblPCMON_DEV_CAPAB_TMPLCOMMAND: TStringField
      DisplayWidth = 50
      FieldName = 'COMMAND'
      Visible = False
      Size = 50
    end
    object tblPCMON_DEV_CAPAB_TMPLRESULT_PREFIX: TStringField
      DisplayWidth = 50
      FieldName = 'RESULT_PREFIX'
      Visible = False
      Size = 50
    end
    object tblPCMON_DEV_CAPAB_TMPLRESULT_POSTFIX: TStringField
      DisplayWidth = 50
      FieldName = 'RESULT_POSTFIX'
      Visible = False
      Size = 50
    end
    object tblPCMON_DEV_CAPAB_TMPLPCMON_CAPAB_TYPE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PCMON_CAPAB_TYPE_ID'
      Visible = False
      Size = 0
    end
    object tblPCMON_DEV_CAPAB_TMPLSTART_POS: TBCDField
      DisplayLabel = 'Start Position'
      DisplayWidth = 10
      FieldName = 'START_POS'
      Visible = False
      Size = 0
    end
    object tblPCMON_DEV_CAPAB_TMPLPACKET_HEADER: TStringField
      DisplayLabel = 'Packet Header'
      DisplayWidth = 150
      FieldName = 'PACKET_HEADER'
      Visible = False
      Size = 150
    end
    object tblPCMON_DEV_CAPAB_TMPLVALUE_LENGTH: TBCDField
      DisplayWidth = 10
      FieldName = 'VALUE_LENGTH'
      Visible = False
      Size = 0
    end
    object tblPCMON_DEV_CAPAB_TMPLRESPONSE_ACK: TStringField
      DisplayLabel = 'Response Ack'
      DisplayWidth = 50
      FieldName = 'RESPONSE_ACK'
      Visible = False
      Size = 50
    end
    object tblPCMON_DEV_CAPAB_TMPLPACKET_LENGTH: TBCDField
      DisplayLabel = 'Fixed Packet Length'
      DisplayWidth = 10
      FieldName = 'PACKET_LENGTH'
      Visible = False
      Size = 0
    end
  end
  object spCreateDeviceFromTemplate: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.PCMON_MISC.CREATEDEVICEFROMTEMPLATE'
    Left = 360
    Top = 64
    ParamData = <
      item
        Name = 'v_pcmon_device_id'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end
      item
        Name = 'v_work_center_id'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'v_template_id'
        DataType = ftFMTBcd
        ParamType = ptInputOutput
      end>
  end
end

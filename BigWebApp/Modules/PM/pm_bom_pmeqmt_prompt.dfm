object FrmPMBomEquipPrompt: TFrmPMBomEquipPrompt
  Left = 0
  Top = 0
  ClientHeight = 370
  ClientWidth = 809
  Caption = 'Open MRO Work Orders'
  OnShow = FormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnlButtons: TUniPanel
    Tag = 1999
    Left = 0
    Top = 329
    Width = 809
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object PnlButtonsInner: TUniPanel
      Tag = 1999
      Left = 598
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnContinue: TUniButton
        Left = 0
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Continue'
        ModalResult = 1
        TabOrder = 1
        Default = True
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        Cancel = True
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object PnlPrompt: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 809
    Height = 41
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 1
      Top = 1
      Width = 463
      Height = 13
      Hint = ''
      Caption = 
        'Open MRO Work Orders exist for Tooling that is attached to this ' +
        'BOM.  Do you wish to continue?'
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
    end
  end
  object PnlGrid: TUniPanel
    Tag = 1999
    Left = 0
    Top = 41
    Width = 809
    Height = 288
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Caption = ''
    object Grid: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 807
      Height = 286
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 590
      IQComponents.Grid.Height = 200
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcPMWODtl
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
      IQComponents.Navigator.DataSource = SrcPMWODtl
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 590
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 200
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcPMWODtl
      Columns = <
        item
          FieldName = 'PMWO_ID'
          Title.Caption = 'Work Order #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_DATE'
          Title.Caption = 'Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_START_DATE'
          Title.Caption = 'Start Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_END_DATE'
          Title.Caption = 'End Date'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'REQUESTED_BY'
          Title.Caption = 'Requested By'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'DEPARTMENT'
          Title.Caption = 'Department'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'STATUS'
          Title.Caption = 'Status'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PRIORITY'
          Title.Caption = 'Priority'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WO_TYPE'
          Title.Caption = 'Type'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EQNO'
          Title.Caption = 'Equipment #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EQUIP_DESCRIP'
          Title.Caption = 'Equipment Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EQUIP_CLASS'
          Title.Caption = 'Equipment Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LOCATION'
          Title.Caption = 'Equipment Location'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'SERIALNO'
          Title.Caption = 'Equipment Serial #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CRITICAL'
          Title.Caption = 'Critical?'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARCUSTO_CUSTNO'
          Title.Caption = 'Customer #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARCUSTO_COMPANY'
          Title.Caption = 'Customer Company'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'VENDOR_VENDORNO'
          Title.Caption = 'Vendor #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'VENDOR_COMPANY'
          Title.Caption = 'Vendor Company'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UOM'
          Title.Caption = 'UOM'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TASK_NUMBER'
          Title.Caption = 'Task #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TASK_DESCRIPTION'
          Title.Caption = 'Task Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INCOMPLETE'
          Title.Caption = 'Incomplete?'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CREATEDBY'
          Title.Caption = 'Created By'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CREATED'
          Title.Caption = 'Created'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CODE_NAME'
          Title.Caption = 'Code'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CODE_DESCRIP'
          Title.Caption = 'Code Description'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EPLANT_NAME'
          Title.Caption = 'EPlant'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      TabsVisible = True
      Marker = 0
    end
  end
  object SrcPMWODtl: TDataSource
    DataSet = QryPMWODtl
    Left = 272
    Top = 152
  end
  object QryPMWODtl: TFDQuery
    BeforeOpen = QryPMWODtlBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT a.id AS id,'
      '       a.pmwo_id AS pmwo_id,'
      '       a.wo_date AS wo_date,'
      '       a.wo_start_date AS wo_start_date,'
      '       a.wo_end_date AS wo_end_date,'
      '       a.wo_class AS wo_class,'
      '       a.requested_by AS requested_by,'
      '       a.department AS department,'
      '       a.status AS status,'
      '       a.priority AS priority,'
      '       a.wo_type AS wo_type,'
      '       a.pmeqmt_id AS pmeqmt_id,'
      '       a.eqno AS eqno,'
      '       a.equip_descrip AS equip_descrip,'
      '       a.equip_class AS equip_class,'
      '       a.location AS location,'
      '       a.serialno AS serialno,'
      '       a.critical AS critical,'
      '       a.arcusto_id AS arcusto_id,'
      '       a.arcusto_custno AS arcusto_custno,'
      '       a.arcusto_company AS arcusto_company,'
      '       a.vendor_id AS vendor_id,'
      '       a.vendor_vendorno AS vendor_vendorno,'
      '       a.vendor_company AS vendor_company,'
      '       a.pmjob_id AS pmjob_id,'
      '       a.pmtasks_id AS pmtasks_id,'
      '       a.uom AS uom,'
      '       a.task_number AS task_number,'
      '       a.task_description AS task_description,'
      '       a.incomplete AS incomplete,'
      '       a.last_wo_date AS last_wo_date,'
      '       a.createdby AS createdby,'
      '       a.created AS created,'
      '       a.changedby AS changedby,'
      '       a.lastchanged AS lastchanged,'
      '       a.code_id AS code_id,'
      '       a.code_name AS code_name,'
      '       a.code_descrip AS code_descrip,'
      '       a.eplant_id AS eplant_id,'
      '       a.eplant_name AS eplant_name'
      '  FROM v_pmwo_dtl_open_jobs a, standard_pmeqmt b'
      ' WHERE a.pmeqmt_id = b.pmeqmt_id AND'
      '       b.standard_id = :STANDARD_ID')
    Left = 280
    Top = 160
    ParamData = <
      item
        Name = 'STANDARD_ID'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
      end>
    object QryPMWODtlPMWO_ID: TBCDField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 16
      FieldName = 'PMWO_ID'
      Origin = 'PMWO_ID'
      Precision = 15
      Size = 0
    end
    object QryPMWODtlWO_DATE: TDateTimeField
      DisplayLabel = 'Date'
      DisplayWidth = 18
      FieldName = 'WO_DATE'
      Origin = 'WO_DATE'
    end
    object QryPMWODtlWO_START_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      DisplayWidth = 18
      FieldName = 'WO_START_DATE'
      Origin = 'WO_START_DATE'
    end
    object QryPMWODtlWO_END_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      DisplayWidth = 18
      FieldName = 'WO_END_DATE'
      Origin = 'WO_END_DATE'
    end
    object QryPMWODtlWO_CLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'WO_CLASS'
      Origin = 'WO_CLASS'
      FixedChar = True
      Size = 2
    end
    object QryPMWODtlREQUESTED_BY: TStringField
      DisplayLabel = 'Requested By'
      DisplayWidth = 35
      FieldName = 'REQUESTED_BY'
      Origin = 'REQUESTED_BY'
      Size = 35
    end
    object QryPMWODtlDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 20
      FieldName = 'DEPARTMENT'
      Origin = 'DEPARTMENT'
    end
    object QryPMWODtlSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 20
      FieldName = 'STATUS'
      Origin = 'STATUS'
    end
    object QryPMWODtlPRIORITY: TStringField
      DisplayLabel = 'Priority'
      DisplayWidth = 20
      FieldName = 'PRIORITY'
      Origin = 'PRIORITY'
    end
    object QryPMWODtlWO_TYPE: TStringField
      DisplayLabel = 'Type'
      DisplayWidth = 35
      FieldName = 'WO_TYPE'
      Origin = 'WO_TYPE'
      Size = 35
    end
    object QryPMWODtlEQNO: TStringField
      DisplayLabel = 'Equipment #'
      DisplayWidth = 25
      FieldName = 'EQNO'
      Origin = 'EQNO'
      Required = True
      Size = 25
    end
    object QryPMWODtlEQUIP_DESCRIP: TStringField
      DisplayLabel = 'Equipment Description'
      DisplayWidth = 50
      FieldName = 'EQUIP_DESCRIP'
      Origin = 'EQUIP_DESCRIP'
      Size = 50
    end
    object QryPMWODtlEQUIP_CLASS: TStringField
      DisplayLabel = 'Equipment Class'
      DisplayWidth = 2
      FieldName = 'EQUIP_CLASS'
      Origin = 'EQUIP_CLASS'
      Required = True
      FixedChar = True
      Size = 2
    end
    object QryPMWODtlLOCATION: TStringField
      DisplayLabel = 'Equipment Location'
      DisplayWidth = 30
      FieldName = 'LOCATION'
      Origin = 'LOCATION'
      Size = 30
    end
    object QryPMWODtlSERIALNO: TStringField
      DisplayLabel = 'Equipment Serial #'
      DisplayWidth = 25
      FieldName = 'SERIALNO'
      Origin = 'SERIALNO'
      Size = 25
    end
    object QryPMWODtlCRITICAL: TStringField
      DisplayLabel = 'Critical'
      DisplayWidth = 1
      FieldName = 'CRITICAL'
      Origin = 'CRITICAL'
      Size = 1
    end
    object QryPMWODtlARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'ARCUSTO_CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryPMWODtlARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Customer Company'
      DisplayWidth = 60
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'ARCUSTO_COMPANY'
      Size = 60
    end
    object QryPMWODtlVENDOR_VENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDOR_VENDORNO'
      Origin = 'VENDOR_VENDORNO'
      FixedChar = True
      Size = 10
    end
    object QryPMWODtlVENDOR_COMPANY: TStringField
      DisplayLabel = 'Vendor Company'
      DisplayWidth = 60
      FieldName = 'VENDOR_COMPANY'
      Origin = 'VENDOR_COMPANY'
      Size = 60
    end
    object QryPMWODtlUOM: TStringField
      DisplayWidth = 10
      FieldName = 'UOM'
      Origin = 'UOM'
      Size = 10
    end
    object QryPMWODtlTASK_NUMBER: TStringField
      DisplayLabel = 'Task #'
      DisplayWidth = 50
      FieldName = 'TASK_NUMBER'
      Origin = 'TASK_NUMBER'
      FixedChar = True
      Size = 50
    end
    object QryPMWODtlTASK_DESCRIPTION: TStringField
      DisplayLabel = 'Task Description'
      DisplayWidth = 50
      FieldName = 'TASK_DESCRIPTION'
      Origin = 'TASK_DESCRIPTION'
      Size = 50
    end
    object QryPMWODtlINCOMPLETE: TStringField
      DisplayLabel = 'Incomplete?'
      DisplayWidth = 1
      FieldName = 'INCOMPLETE'
      Origin = 'INCOMPLETE'
      FixedChar = True
      Size = 1
    end
    object QryPMWODtlCREATEDBY: TStringField
      DisplayLabel = 'Created By'
      DisplayWidth = 35
      FieldName = 'CREATEDBY'
      Origin = 'CREATEDBY'
      Size = 35
    end
    object QryPMWODtlCREATED: TDateTimeField
      DisplayLabel = 'Created'
      DisplayWidth = 18
      FieldName = 'CREATED'
      Origin = 'CREATED'
    end
    object QryPMWODtlCODE_NAME: TStringField
      DisplayLabel = 'Code'
      DisplayWidth = 35
      FieldName = 'CODE_NAME'
      Origin = 'CODE_NAME'
      Size = 35
    end
    object QryPMWODtlCODE_DESCRIP: TStringField
      DisplayLabel = 'Code Description'
      DisplayWidth = 255
      FieldName = 'CODE_DESCRIP'
      Origin = 'CODE_DESCRIP'
      Size = 255
    end
    object QryPMWODtlEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      DisplayWidth = 30
      FieldName = 'EPLANT_NAME'
      Origin = 'EPLANT_NAME'
      Size = 30
    end
    object QryPMWODtlID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPMWODtlPMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Origin = 'PMEQMT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPMWODtlARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'ARCUSTO_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPMWODtlVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'VENDOR_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPMWODtlPMJOB_ID: TBCDField
      FieldName = 'PMJOB_ID'
      Origin = 'PMJOB_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPMWODtlPMTASKS_ID: TBCDField
      FieldName = 'PMTASKS_ID'
      Origin = 'PMTASKS_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPMWODtlCODE_ID: TBCDField
      FieldName = 'CODE_ID'
      Origin = 'CODE_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryPMWODtlEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object PGrid: TUniPopupMenu
    OnPopup = PGridPopup
    Left = 448
    Top = 184
    object JumptoMROWorkOrder1: TUniMenuItem
      Caption = 'Jump to MRO Work Order'
      OnClick = JumptoMROWorkOrder1Click
    end
    object JumptoMRO1: TUniMenuItem
      Caption = 'Jump to MRO'
      OnClick = JumptoMRO1Click
    end
  end
  object SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmPMBomEquipPrompt')
    SecurityItems.Strings = (
      'btnContinue'
      'JumptoMRO1'
      'JumptoMROWorkOrder1')
    SecurityCode = 'FRMPMBOMEQUIPPROMPT'
    Left = 400
    Top = 192
  end
end

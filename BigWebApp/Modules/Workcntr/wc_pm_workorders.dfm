object FrmWorkCenterPMWorkorders: TFrmWorkCenterPMWorkorders
  Left = 348
  Top = 221
  ClientHeight = 207
  ClientWidth = 479
  Caption = 'MRO Work Orders'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object GridPMWorkOrdersEQMT: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 479
    Height = 207
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 262
    IQComponents.Grid.Height = 121
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcPMWorkOrdersByEQMT
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Grid.OnDrawColumnCell = GridPMWorkOrdersEQMTDBGridDrawColumnCell
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcPMWorkOrdersByEQMT
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 262
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 121
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcPMWorkOrdersByEQMT
    Columns = <
      item
        FieldName = 'ID'
        Title.Caption = 'Work Order #'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WO_DATE'
        Title.Caption = 'WO Date'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLASS'
        Title.Caption = 'WO Class'
        Width = 49
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DEPARTMENT'
        Title.Caption = 'Department'
        Width = 91
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'START_DATE'
        Title.Caption = 'Start Date'
        Width = 84
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'END_DATE'
        Title.Caption = 'End Date'
        Width = 84
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PRIORITY'
        Title.Caption = 'Priority'
        Width = 84
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'STATUS'
        Title.Caption = 'Status'
        Width = 77
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'WO_TYPE'
        Title.Caption = 'WO Type'
        Width = 56
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'Created By'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object SrcPMWorkOrdersByEQMT: TDataSource
    DataSet = QryPMWorkOrdersByEQMT
    Left = 56
    Top = 93
  end
  object QryPMWorkOrdersByEQMT: TFDQuery
    BeforeOpen = QryPMWorkOrdersByEQMTBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select distinct'
      '     pmwo.id as id,'
      '     pmwo.wo_date as wo_date,'
      '     pmwo.userid as userid,'
      '     pmwo.department as department,'
      '     pmwo.status as status,'
      '     pmwo.priority as priority,'
      '     pmwo.wo_type as wo_type,'
      '     pmwo.class as class,'
      '     pmwo.start_date as start_date,'
      '     pmwo.end_date as end_date,'
      '     pmwo.eplant_id as eplant_id,'
      '     pmwo_dtl.wo_open as wo_open'
      'from'
      '     pmwo,'
      '     pmwo_dtl,'
      '     pmjob'
      'where'
      '     pmjob.pmeqmt_id  = :pmeqmt_id and     '
      '     pmwo_dtl.pmjob_id = pmjob.id and'
      '     pmwo.id = pmwo_dtl.pmwo_id'
      '     '
      ' ')
    Left = 56
    Top = 141
    ParamData = <
      item
        Name = 'pmeqmt_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryPMWorkOrdersByEQMTID: TBCDField
      DisplayLabel = 'Work Order #'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'PMWO.ID'
      Size = 0
    end
    object QryPMWorkOrdersByEQMTWO_DATE: TDateTimeField
      DisplayLabel = 'WO Date'
      DisplayWidth = 10
      FieldName = 'WO_DATE'
      Origin = 'PMWO.WO_DATE'
    end
    object QryPMWorkOrdersByEQMTCLASS: TStringField
      DisplayLabel = 'WO Class'
      DisplayWidth = 7
      FieldName = 'CLASS'
      Origin = 'PMWO.CLASS'
      Size = 2
    end
    object QryPMWorkOrdersByEQMTDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 13
      FieldName = 'DEPARTMENT'
      Origin = 'PMWO.DEPARTMENT'
    end
    object QryPMWorkOrdersByEQMTSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      DisplayWidth = 12
      FieldName = 'START_DATE'
      Origin = 'PMWO.START_DATE'
    end
    object QryPMWorkOrdersByEQMTEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      DisplayWidth = 12
      FieldName = 'END_DATE'
      Origin = 'PMWO.END_DATE'
    end
    object QryPMWorkOrdersByEQMTPRIORITY: TStringField
      DisplayLabel = 'Priority'
      DisplayWidth = 12
      FieldName = 'PRIORITY'
      Origin = 'PMWO.PRIORITY'
    end
    object QryPMWorkOrdersByEQMTSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 11
      FieldName = 'STATUS'
      Origin = 'PMWO.STATUS'
    end
    object QryPMWorkOrdersByEQMTWO_TYPE: TStringField
      DisplayLabel = 'WO Type'
      DisplayWidth = 8
      FieldName = 'WO_TYPE'
      Origin = 'PMWO.WO_TYPE'
      Size = 35
    end
    object QryPMWorkOrdersByEQMTUSERID: TStringField
      DisplayLabel = 'Created By'
      DisplayWidth = 10
      FieldName = 'USERID'
      Origin = 'PMWO.USERID'
      Size = 35
    end
    object QryPMWorkOrdersByEQMTEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'PMWO.EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryPMWorkOrdersByEQMTWO_OPEN: TStringField
      DisplayLabel = 'WO Open'
      FieldName = 'WO_OPEN'
      Origin = 'pmwo_dtl.wo_open'
      FixedChar = True
      Size = 1
    end
  end
  object PPMWorkOrdersByEQMT: TUniPopupMenu
    Left = 184
    Top = 96
    object JumptoWorkOrder1: TUniMenuItem
      Caption = 'Jump to Work Order'
      OnClick = JumptoWorkOrder1Click
    end
  end
  object JCustomer: TIQWebJump
    DataField = 'ARCUSTO_ID'
    JumpTo = jtCustomer
    Left = 184
    Top = 124
  end
end

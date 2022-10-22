object FrmToolingWhiteboardDrillDown: TFrmToolingWhiteboardDrillDown
  Left = 0
  Top = 0
  ClientHeight = 290
  ClientWidth = 554
  Caption = 'Whiteboard Drill Down'
  OnShow = FormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PnlGrid: TUniPanel
    Tag = 1999
    Left = 0
    Top = 0
    Width = 554
    Height = 290
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 554
    Height = 290
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 337
    IQComponents.Grid.Height = 204
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcData
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
    IQComponents.Navigator.DataSource = SrcData
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 337
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 204
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcData
    Columns = <
      item
        FieldName = 'RFQ'
        Title.Caption = 'Project #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PROJECT'
        Title.Caption = 'Project'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TASK_NAME'
        Title.Caption = 'Task Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TASK_STARTDATE'
        Title.Caption = 'Task Start Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TASK_FINISHDATE'
        Title.Caption = 'Task Finish Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DURATION_DISPLAY'
        Title.Caption = 'Task Duration'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PERCENTAGE'
        Title.Caption = 'Percentage'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EMPNO'
        Title.Caption = 'Employee #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FIRST_NAME'
        Title.Caption = 'First Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LAST_NAME'
        Title.Caption = 'Last Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object SrcData: TDataSource
    DataSet = QryData
    Left = 272
    Top = 144
  end
  object QryData: TFDQuery
    BeforeOpen = QryDataBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'SELECT a.id AS tool_rfq_id,'
      '       a.rfq AS rfq,'
      '       a.project AS project,'
      '       b.id AS tool_task_information_id,'
      '       b.name AS task_name,'
      '       b.startdate AS task_startdate,'
      '       b.finishdate AS task_finishdate,'
      
        '       project_task.task_duration_display(b.id) AS duration_disp' +
        'lay,'
      '       c.pr_emp_id AS pr_emp_id,'
      '       c.percentage AS percentage,'
      '       d.empno AS empno,'
      '       d.first_name AS first_name,'
      '       d.last_name AS last_name'
      
        '  FROM tool_rfq a, tool_task_information b, tool_task_info_emp c' +
        ', pr_emp d,'
      '       (SELECT DISTINCT tool_task_information_id,'
      '                        pr_emp_id'
      '          FROM day_labor_project'
      '         WHERE pr_emp_id = :PR_EMP_ID AND'
      
        '               TRUNC(labor_date) BETWEEN TRUNC(:START_DATE) AND ' +
        'TRUNC(:END_DATE)) e'
      ' WHERE a.id = b.tool_rfq_id AND'
      '       b.id = e.tool_task_information_id AND'
      
        '       c.tool_task_information_id = e.tool_task_information_id A' +
        'ND'
      '       c.pr_emp_id = e.pr_emp_id AND'
      '       d.id = c.pr_emp_id AND'
      '       d.ta_shift_id = :TA_SHIFT_ID')
    Left = 280
    Top = 152
    ParamData = <
      item
        Name = 'PR_EMP_ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'START_DATE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'END_DATE'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'TA_SHIFT_ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryDataRFQ: TStringField
      DisplayLabel = 'Project #'
      DisplayWidth = 18
      FieldName = 'RFQ'
      Origin = 'RFQ'
    end
    object QryDataPROJECT: TStringField
      DisplayLabel = 'Project'
      DisplayWidth = 18
      FieldName = 'PROJECT'
      Origin = 'PROJECT'
      Size = 255
    end
    object QryDataTASK_NAME: TStringField
      DisplayLabel = 'Task Name'
      DisplayWidth = 18
      FieldName = 'TASK_NAME'
      Origin = 'TASK_NAME'
      Size = 255
    end
    object QryDataTASK_STARTDATE: TDateTimeField
      DisplayLabel = 'Task Start Date'
      DisplayWidth = 18
      FieldName = 'TASK_STARTDATE'
      Origin = 'TASK_STARTDATE'
    end
    object QryDataTASK_FINISHDATE: TDateTimeField
      DisplayLabel = 'Task Finish Date'
      DisplayWidth = 18
      FieldName = 'TASK_FINISHDATE'
      Origin = 'TASK_FINISHDATE'
    end
    object QryDataDURATION_DISPLAY: TStringField
      DisplayLabel = 'Task Duration'
      DisplayWidth = 18
      FieldName = 'DURATION_DISPLAY'
      Origin = 'DURATION_DISPLAY'
      Size = 4000
    end
    object QryDataPERCENTAGE: TBCDField
      DisplayLabel = 'Percentage'
      DisplayWidth = 18
      FieldName = 'PERCENTAGE'
      Origin = 'PERCENTAGE'
      Precision = 5
      Size = 2
    end
    object QryDataEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 18
      FieldName = 'EMPNO'
      Origin = 'EMPNO'
      Size = 25
    end
    object QryDataFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 18
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Size = 30
    end
    object QryDataLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 18
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Size = 30
    end
    object QryDataTOOL_RFQ_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'TOOL_RFQ_ID'
      Origin = 'TOOL_RFQ_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryDataTOOL_TASK_INFORMATION_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'TOOL_TASK_INFORMATION_ID'
      Origin = 'TOOL_TASK_INFORMATION_ID'
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryDataPR_EMP_ID: TBCDField
      DisplayWidth = 18
      FieldName = 'PR_EMP_ID'
      Origin = 'PR_EMP_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
  end
end

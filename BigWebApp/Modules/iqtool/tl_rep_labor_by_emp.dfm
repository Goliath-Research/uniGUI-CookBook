object FrmToolingReportLaborByEmployee: TFrmToolingReportLaborByEmployee
  Left = 0
  Top = 0
  ClientHeight = 441
  ClientWidth = 1005
  Caption = 'Labor Reporting by Employee'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TUniPanel
    Left = 0
    Top = 68
    Width = 1005
    Height = 331
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object wwDBGrid1: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 1003
      Height = 329
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 786
      IQComponents.Grid.Height = 243
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcEmpLabor
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
      IQComponents.Navigator.DataSource = SrcEmpLabor
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 786
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 243
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.HiddenPanel.ExplicitHeight = 217
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      IQComponents.FormTab.ExplicitHeight = 246
      DataSource = SrcEmpLabor
      Columns = <
        item
          FieldName = 'LABOR_HRS'
          Title.Caption = 'Hours'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'PROJECT'
          Title.Caption = 'Project Name'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WORKORDERNO'
          Title.Caption = 'Work Order #'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'OUTLINENUMBER'
          Title.Caption = 'Task Outline #'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TASK_NAME'
          Title.Caption = 'Task Name'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL_LABOR_HRS'
          Title.Caption = 'Total Labor Hours'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMPLETED'
          Title.Caption = 'Task Completed'
          Width = 64
          CheckBoxField.FieldValues = 'Y;N'
        end
        item
          FieldName = 'NOTES'
          Title.Caption = 'Notes'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitTop = 28
      ExplicitHeight = 303
      Marker = 0
    end
    object wwDBComboDlgNote: TUniEdit
      Left = 524
      Top = 164
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 1
    end
  end
  object Panel5: TUniPanel
    Left = 0
    Top = 399
    Width = 1005
    Height = 42
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel1: TUniPanel
      Left = 777
      Top = 1
      Width = 228
      Height = 40
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 6
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Post'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 118
        Top = 9
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = btnCancelClick
      end
    end
  end
  object Panel6: TUniPanel
    Left = 0
    Top = 0
    Width = 1005
    Height = 68
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Caption = ''
    object Label2: TUniLabel
      Left = 13
      Top = 11
      Width = 57
      Height = 13
      Hint = ''
      Caption = 'Employee #'
      TabOrder = 3
    end
    object sbtnSelectEmployee: TUniSpeedButton
      Left = 276
      Top = 10
      Width = 23
      Height = 22
      Hint = 'Select Employee'
      ShowHint = True
      ParentShowHint = False
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB18C76A07860
        90604090584090584087492AFF00FFFF00FFFF00FFB485659C755DA070509058
        40905030773818FF00FF8B8B8B7777775F5F5F5A5A5A5A5A5A4A4A4AFF00FFFF
        00FFFF00FF8484847474746F6F6F5A5A5A5151513B3B3BFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0E0C8C0D0A8
        90B07850804820FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7C9C9C9A7A7A7777777484848FF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFB09080FFF8FF
        E0C8C0D0A090C08060804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF8F8F8FFAFAFAC9C9C9A1A1A1818181424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC09880FFFFFF
        F0E8E0E0C8C0D0A080804020FF00FFFF00FFFF00FFB08060F0E8E0F0E0E0E0C0
        B0C08870804830FF00FF979797FFFFFFE7E7E7C9C9C99E9E9E424242FF00FFFF
        00FFFF00FF7F7F7FE7E7E7E2E2E2C0C0C08989894A4A4AFF00FFC3A494B08870
        A068509050308048308048208038108F4C26B08870A068509058309048308040
        20703810905830FF00FFA4A4A48787876969695151514A4A4A4848483B3B3B4E
        4E4E8787876969695757574C4C4C424242393939575757FF00FFDEC4B4B08870
        FFFFFFE0D0C0D0A090A07050804010D5B89CB09070E0D8D0F0D8D0D0A090B078
        50803820CFA98AFF00FFC3C3C3878787FFFFFFCECECEA1A1A16F6F6F414141B5
        B5B58D8D8DD7D7D7D9D9D9A1A1A17777773D3D3DA7A7A7FF00FFFF00FFC09080
        F0F0F0FFF8F0F0D8C0B08060804820965732B09070FFFFFFFFF8F0F0D0C0B078
        50804820FF00FFFF00FFFF00FFFF00FFF0F0F0F7F7F7D5D5D57F7F7F48484857
        57578D8D8DFFFFFFF7F7F7D0D0D0777777484848FF00FFFF00FFFF00FFF8E2D2
        C09880B08060A068509050309058409D6842B07860B08870A070508048308048
        20ECC4A7FF00FFFF00FFFF00FFE1E1E19797977F7F7F6969695151515A5A5A67
        67677979798787876F6F6F4A4A4A484848C2C2C2FF00FFFF00FFFF00FFFF00FF
        C09880FFF8FFE0C0B0C09070804820FF00FFC09880FFF8FFE0C8B0D0A0808048
        20FF00FFFF00FFFF00FFFF00FFFF00FF979797FAFAFAC0C0C08E8E8E484848FF
        00FF979797FAFAFAC5C5C59E9E9E484848FF00FFFF00FFFF00FFFF00FFFF00FF
        CFB1A1B09080A06850905030875139FF00FFC0A890B09080A06850905030864F
        37FF00FFFF00FFFF00FFFF00FFFF00FFB0B0B08F8F8F696969515151525252FF
        00FFA5A5A58F8F8F696969515151505050FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFB1836DFFF8F0814527FF00FFFF00FFFF00FFB08068FFF8F0804324FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF838383F7F7F7464646FF00FFFF
        00FFFF00FF808080F7F7F7444444FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC7A898B48D759D6843FF00FFFF00FFFF00FFCEAE9CB48C749C6640FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7A7A78C8C8C676767FF00FFFF
        00FFFF00FFADADAD8B8B8B656565FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Caption = ''
      ParentColor = False
      Color = clWindow
      OnClick = sbtnSelectEmployeeClick
    end
    object Label1: TUniLabel
      Left = 13
      Top = 37
      Width = 53
      Height = 13
      Hint = ''
      Caption = 'Labor Date'
      TabOrder = 5
    end
    object wwDBDateTimePickerLaborDate: TUniDBDateTimePicker
      Left = 101
      Top = 33
      Width = 171
      Height = 21
      Hint = ''
      DateTime = 42664.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object cmbEmp: TUniDBLookupComboBox
      Left = 101
      Top = 8
      Width = 171
      Height = 21
      Hint = ''
      ListField = 'EMPNO'
      ListSource = SrcQryEmp
      KeyField = 'FIRST_NAME'
      ListFieldIndex = 0
      TabOrder = 0
      Color = clWindow
      OnDropDown = cmbEmpDropDown
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 372
    Top = 232
    object File1: TUniMenuItem
      Caption = 'File'
      object Exit1: TUniMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = 'Help'
      object About1: TUniMenuItem
        Caption = 'About'
        OnClick = About1Click
      end
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'FrmToolingReportLaborByEmployee'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 193132 $'
    BuildVersion = '176554'
    Left = 404
    Top = 232
  end
  object QryEmp: TFDQuery
    BeforeOpen = QryEmpBeforeOpen
    ConnectionName = 'IQFD'
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select a.empno,'
      '       a.first_name,'
      '       a.last_name,'
      '       a.id'
      '  from pr_emp a,'
      '       ta_shift b'
      ' where a.ta_shift_id = b.id(+)'
      '   and nvl(a.pk_hide, '#39'N'#39') <> '#39'Y'#39
      '   and (:project_manager = 0'
      '         or'
      '        :project_manager = 1 and b.project_manager = '#39'Y'#39')'
      'order by a.empno')
    Left = 660
    Top = 191
    ParamData = <
      item
        Name = 'PROJECT_MANAGER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object QryEmpEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 16
      FieldName = 'EMPNO'
      Origin = 'EMPNO'
      Size = 25
    end
    object QryEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 17
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Size = 30
    end
    object QryEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 21
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Size = 30
    end
    object QryEmpID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
  end
  object QryEmpLabor: TFDQuery
    BeforeOpen = QryEmpLaborBeforeOpen
    BeforeInsert = CheckAbortInsert
    BeforeEdit = CheckAbortInsert
    CachedUpdates = True
    OnUpdateRecord = QryEmpLaborUpdateRecord
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id,'
      '       a.tool_task_information_id,'
      '       to_number(null) as labor_hrs,'
      '       c.project,'
      '       c.workorderno,'
      '       b.outlinenumber,'
      '       b.name as task_name,'
      '       b.completed,'
      '       ( select sum(nvl(labor_hrs, 0)) '
      '          from emp_labor '
      '         where source_id = b.id '
      '           and source = '#39'TOOL_TASK_INFORMATION'#39' '
      '           and pr_emp_id = a.pr_emp_id ) as total_labor_hrs,'
      '       (select notes from emp_labor where id = -1) as notes'
      '  from '
      '       tool_task_info_emp a,'
      '       tool_task_information b, '
      '       tool_rfq c'
      ' where '
      '       a.pr_emp_id = :pr_emp_id'
      '   and a.tool_task_information_id = b.id'
      '   and b.tool_rfq_id = c.id'
      '   and nvl(c.archived, '#39'N'#39') <> '#39'Y'#39
      '   and nvl(c.open_wo, '#39'N'#39') <> '#39'N'#39' '
      '   and nvl(b.completed, '#39'N'#39') <> '#39'Y'#39
      'order by      '
      '       c.project,'
      '       c.workorderno'
      '                ')
    Left = 448
    Top = 300
    ParamData = <
      item
        Name = 'PR_EMP_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryEmpLaborID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryEmpLaborTOOL_TASK_INFORMATION_ID: TBCDField
      FieldName = 'TOOL_TASK_INFORMATION_ID'
      Origin = 'TOOL_TASK_INFORMATION_ID'
      Visible = False
      Precision = 15
      Size = 0
    end
    object QryEmpLaborLABOR_HRS: TFMTBCDField
      DisplayLabel = 'Hours'
      FieldName = 'LABOR_HRS'
      Origin = 'LABOR_HRS'
      DisplayFormat = '#########.##'
      Precision = 38
      Size = 38
    end
    object QryEmpLaborPROJECT: TStringField
      DisplayLabel = 'Project Name'
      DisplayWidth = 30
      FieldName = 'PROJECT'
      Origin = 'PROJECT'
      ReadOnly = True
      Size = 255
    end
    object QryEmpLaborWORKORDERNO: TStringField
      DisplayLabel = 'Work Order #'
      FieldName = 'WORKORDERNO'
      Origin = 'WORKORDERNO'
      ReadOnly = True
    end
    object QryEmpLaborOUTLINENUMBER: TStringField
      DisplayLabel = 'Task Outline'
      DisplayWidth = 40
      FieldName = 'OUTLINENUMBER'
      Origin = 'OUTLINENUMBER'
      ReadOnly = True
      Size = 255
    end
    object QryEmpLaborTASK_NAME: TStringField
      DisplayLabel = 'Task Name'
      DisplayWidth = 40
      FieldName = 'TASK_NAME'
      Origin = 'TASK_NAME'
      ReadOnly = True
      Size = 255
    end
    object QryEmpLaborTOTAL_LABOR_HRS: TFMTBCDField
      FieldName = 'TOTAL_LABOR_HRS'
      Origin = 'TOTAL_LABOR_HRS'
      ReadOnly = True
      Precision = 38
      Size = 38
    end
    object QryEmpLaborCOMPLETED: TStringField
      FieldName = 'COMPLETED'
      Origin = 'COMPLETED'
      Size = 1
    end
    object QryEmpLaborNOTES: TStringField
      FieldName = 'NOTES'
      Origin = 'NOTES'
      Size = 4000
    end
  end
  object SrcEmpLabor: TDataSource
    DataSet = QryEmpLabor
    Left = 480
    Top = 232
  end
  object PkEmp: TIQWebHpick
    BeforeOpen = QryEmpBeforeOpen
    ConnectionName = 'IQFD'
    SQL.Strings = (
      'select a.id,'
      '       a.empno,'
      '       a.first_name,'
      '       a.last_name'
      '  from pr_emp a,'
      '       ta_shift b'
      ' where nvl(a.pk_hide, '#39'N'#39') <> '#39'Y'#39
      '   and a.ta_shift_id = b.id(+)'
      '   and (:project_manager = 0'
      '        or'
      '        :project_manager = 1 and b.project_manager = '#39'Y'#39')'
      '               '
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 404
    Top = 286
    ParamData = <
      item
        Name = 'project_manager'
        DataType = ftInteger
      end>
    object PkEmpID: TBCDField
      FieldName = 'ID'
      Origin = 'PR_EMP.ID'
      Visible = False
      Size = 0
    end
    object PkEmpEMPNO: TStringField
      DisplayLabel = 'Employee #'
      FieldName = 'EMPNO'
      Origin = 'PR_EMP.EMPNO'
      Size = 25
    end
    object PkEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Origin = 'PR_EMP.FIRST_NAME'
      Size = 30
    end
    object PkEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Origin = 'PR_EMP.LAST_NAME'
      Size = 30
    end
  end
  object SrcQryEmp: TDataSource
    DataSet = QryEmp
    Left = 696
    Top = 296
  end
end

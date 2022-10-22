object FrmTaMessages: TFrmTaMessages
  Left = 32
  Top = 150
  HelpContext = 1015613
  ClientHeight = 567
  ClientWidth = 747
  Caption = 'Employee / Task Messages'
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 747
    Height = 258
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 530
    IQComponents.Grid.Height = 172
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcMsg
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
    IQComponents.Navigator.DataSource = SrcMsg
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 530
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 172
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcMsg
    Columns = <
      item
        FieldName = 'GLOBAL'
        Title.Caption = 'Global'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'TA_MESSAGE'
        Title.Caption = 'Message'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DISPLAY_TIME'
        Title.Caption = 'Display Time (sec.)'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'INACTIVE'
        Title.Caption = 'Inactive'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'SOURCE'
        Title.Caption = 'Source'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SOURCE_ID'
        Title.Caption = 'Source ID'
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
        FieldName = 'EMP_NAME'
        Title.Caption = 'Employee Name'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIFT'
        Title.Caption = 'Shift'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EXPIRY_DATE'
        Title.Caption = 'Inactive Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CLOCK_IN'
        Title.Caption = 'On Clock In'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'CLOCK_OUT'
        Title.Caption = 'On Clock Out'
        Width = 64
        CheckBoxField.FieldValues = 'Y;N'
      end
      item
        FieldName = 'DIVISION'
        Title.Caption = 'Division'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'Eplant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PR_PAYGROUP'
        Title.Caption = 'Pay Group'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SUPER_NAME'
        Title.Caption = 'Supervisor'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
    object wwDBDateTimePicker1: TUniDBDateTimePicker
      Left = 69
      Top = 207
      Width = 149
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DateTime = 42661.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
      OnKeyDown = wwDBDateTimePicker1KeyDown
    end
    object wwDBComboEmp: TUniEdit
      Left = 325
      Top = 49
      Width = 149
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = ''
      TabOrder = 3
      OnKeyDown = wwDBComboEmpKeyDown
    end
    object wwDBComboShift: TUniEdit
      Left = 325
      Top = 79
      Width = 149
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = ''
      TabOrder = 4
      OnKeyDown = wwDBComboShiftKeyDown
    end
    object wwDBComboSourceID: TUniEdit
      Left = 325
      Top = 108
      Width = 149
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = ''
      TabOrder = 5
      OnKeyDown = wwDBComboSourceIDKeyDown
    end
    object wwDBComboSource: TUniDBComboBox
      Left = 325
      Top = 138
      Width = 149
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      Items.Strings = (
        'WO'
        'PM'
        'TL'
        'UD'
        'SO'
        'JS'
        'RR')
      TabOrder = 6
      OnKeyDown = wwDBComboSourceKeyDown
    end
    object wwDBComboMessage: TUniEdit
      Left = 325
      Top = 167
      Width = 149
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = ''
      TabOrder = 7
    end
    object wwDBSpinTime: TUniDBNumberEdit
      Left = 325
      Top = 197
      Width = 149
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 8
      MaxValue = 1000.000000000000000000
      MinValue = 1.000000000000000000
      DecimalSeparator = '.'
    end
    object wwDBComboDlgSuper: TUniEdit
      Left = 512
      Top = 49
      Width = 149
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = ''
      TabOrder = 9
      OnKeyDown = wwDBComboDlgSuperKeyDown
    end
    object wwDBComboDlgDivision: TUniEdit
      Left = 512
      Top = 79
      Width = 149
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = ''
      TabOrder = 10
      OnKeyDown = wwDBComboDlgDivisionKeyDown
    end
    object wwDBComboDlgEplant: TUniEdit
      Left = 512
      Top = 108
      Width = 149
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = ''
      TabOrder = 12
      OnKeyDown = wwDBComboDlgEplantKeyDown
    end
    object wwDBComboDlgPaygroup: TUniEdit
      Left = 512
      Top = 138
      Width = 149
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Text = ''
      TabOrder = 11
      OnKeyDown = wwDBComboDlgPaygroupKeyDown
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 258
    Width = 747
    Height = 309
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object IQSearch2: TIQUniGridControl
      Left = 1
      Top = 1
      Width = 745
      Height = 307
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Layout = 'border'
      ParentAlignmentControl = False
      AlignmentControl = uniAlignmentClient
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      IQComponents.Grid.Left = 0
      IQComponents.Grid.Top = 29
      IQComponents.Grid.Width = 528
      IQComponents.Grid.Height = 221
      IQComponents.Grid.Hint = ''
      IQComponents.Grid.DataSource = SrcEmp
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
      IQComponents.Navigator.DataSource = SrcEmp
      IQComponents.Navigator.LayoutConfig.Region = 'east'
      IQComponents.Navigator.TabOrder = 3
      IQComponents.HiddenPanel.Left = 528
      IQComponents.HiddenPanel.Top = 29
      IQComponents.HiddenPanel.Width = 209
      IQComponents.HiddenPanel.Height = 221
      IQComponents.HiddenPanel.Hint = ''
      IQComponents.HiddenPanel.Visible = True
      IQComponents.HiddenPanel.Align = alRight
      IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
      IQComponents.FormTab.Hint = ''
      IQComponents.FormTab.ImageIndex = 1
      IQComponents.FormTab.Caption = 'Form'
      IQComponents.FormTab.Layout = 'border'
      DataSource = SrcEmp
      Columns = <
        item
          FieldName = 'EMPNO'
          Title.Caption = 'Employee #'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'EMP_NAME'
          Title.Caption = 'Employee Name'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
      object wwDBComboEmpMsg: TUniEdit
        Left = 364
        Top = 59
        Width = 149
        Height = 21
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Text = ''
        TabOrder = 2
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 120
    Top = 48
    object File1: TUniMenuItem
      Caption = '&File'
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        OnClick = Contents1Click
      end
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcMsg: TDataSource
    DataSet = QryMsg
    Left = 48
    Top = 115
  end
  object QryMsg: TFDQuery
    BeforePost = QryMsgBeforePost
    AfterPost = QryMsgAfterPost
    AfterDelete = QryMsgAfterPost
    AfterScroll = QryMsgAfterScroll
    OnNewRecord = QryMsgNewRecord
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select t.id,'
      '       t.global,'
      '       t.ta_shift_id,'
      '       t.pr_emp_id,'
      '       t.ta_message,'
      '       t.display_time,'
      '       t.inactive,'
      '       t.expiry_date,'
      '       t.source,'
      '       t.source_id,'
      '       t.clock_in,'
      '       t.clock_out,'
      '       p.empno,'
      
        '       substrB( iqstring.Concat3W( p.First_Name, p.Middle_Name, ' +
        'p.Last_Name), 1, 255) as emp_name,'
      
        '       substrB( iqstring.Concat3W( p2.First_Name, p2.Middle_Name' +
        ', p2.Last_Name), 1, 255) as super_name,'
      '       t.eplant_id,'
      '       t.supervisor_id,'
      '       t.division_id,'
      '       d.name as division,'
      '       t.pr_paygroup_id,'
      '       g.description as pr_paygroup,'
      '       s.descrip as shift'
      '  from ta_messages t,'
      '       pr_emp p,'
      '       pr_emp p2,'
      '       ta_shift s,'
      '       division d,'
      '       pr_paygroup g'
      ' where t.pr_emp_id = p.id(+)'
      '   and t.supervisor_id = p2.id(+)'
      '   and t.division_id = d.id(+)'
      '   and t.pr_paygroup_id = g.id(+)'
      '   and t.ta_shift_id = s.id(+)'
      ''
      '')
    Left = 64
    Top = 128
    object QryMsgGLOBAL: TStringField
      DisplayLabel = 'Global'
      DisplayWidth = 1
      FieldName = 'GLOBAL'
      Origin = 't.global'
      FixedChar = True
      Size = 1
    end
    object QryMsgTA_MESSAGE: TStringField
      DisplayLabel = 'Message'
      DisplayWidth = 50
      FieldName = 'TA_MESSAGE'
      Origin = 't.ta_message'
      Size = 2000
    end
    object QryMsgDISPLAY_TIME: TBCDField
      DisplayLabel = 'Display Time (sec.)'
      DisplayWidth = 10
      FieldName = 'DISPLAY_TIME'
      Origin = 't.display_time'
      Size = 0
    end
    object QryMsgINACTIVE: TStringField
      DisplayLabel = 'Inactive'
      DisplayWidth = 1
      FieldName = 'INACTIVE'
      Origin = 't.inactive'
      FixedChar = True
      Size = 1
    end
    object QryMsgSOURCE: TStringField
      DisplayLabel = 'Source'
      DisplayWidth = 10
      FieldName = 'SOURCE'
      Origin = 't.source'
      Size = 30
    end
    object QryMsgSOURCE_ID: TBCDField
      DisplayLabel = 'Source ID'
      DisplayWidth = 10
      FieldName = 'SOURCE_ID'
      Origin = 't.source_id'
      Size = 0
    end
    object QryMsgEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 10
      FieldName = 'EMPNO'
      Origin = 'p.empno'
      Size = 25
    end
    object QryMsgEMP_NAME: TStringField
      DisplayLabel = 'Employee Name'
      DisplayWidth = 30
      FieldName = 'EMP_NAME'
      Origin = 
        'substrB( iqstring.Concat3W( p.First_Name, p.Middle_Name, p.Last_' +
        'Name), 1, 255)'
      Size = 255
    end
    object QryMsgSHIFT: TStringField
      DisplayLabel = 'Shift'
      DisplayWidth = 20
      FieldName = 'SHIFT'
      Origin = 's.descrip'
      Size = 100
    end
    object QryMsgEXPIRY_DATE: TDateTimeField
      DisplayLabel = 'Inactive Date'
      DisplayWidth = 18
      FieldName = 'EXPIRY_DATE'
      Origin = 't.EXPIRY_DATE'
    end
    object QryMsgCLOCK_IN: TStringField
      DisplayLabel = 'On Clock In'
      DisplayWidth = 1
      FieldName = 'CLOCK_IN'
      FixedChar = True
      Size = 1
    end
    object QryMsgCLOCK_OUT: TStringField
      DisplayLabel = 'On Clock Out'
      DisplayWidth = 1
      FieldName = 'CLOCK_OUT'
      FixedChar = True
      Size = 1
    end
    object QryMsgDIVISION: TStringField
      DisplayLabel = 'Division'
      DisplayWidth = 20
      FieldName = 'DIVISION'
      Origin = 'd.name'
      Size = 25
    end
    object QryMsgEPLANT_ID: TBCDField
      DisplayLabel = 'Eplant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 't.eplant_id'
      Size = 0
    end
    object QryMsgPR_PAYGROUP: TStringField
      DisplayLabel = 'Pay Group'
      DisplayWidth = 20
      FieldName = 'PR_PAYGROUP'
      Origin = 'g.description'
      Size = 50
    end
    object QryMsgSUPER_NAME: TStringField
      DisplayLabel = 'Supervisor'
      DisplayWidth = 20
      FieldName = 'SUPER_NAME'
      Origin = 
        'substrB( iqstring.Concat3W( p2.First_Name, p2.Middle_Name, p2.La' +
        'st_Name), 1, 255)'
      Size = 255
    end
    object QryMsgID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 't.id'
      Visible = False
      Size = 0
    end
    object QryMsgTA_SHIFT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TA_SHIFT_ID'
      Origin = 't.ta_shift_id'
      Visible = False
      Size = 0
    end
    object QryMsgPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Origin = 't.pr_emp_id'
      Visible = False
      Size = 0
    end
    object QryMsgSUPERVISOR_ID: TBCDField
      FieldName = 'SUPERVISOR_ID'
      Visible = False
      Size = 0
    end
    object QryMsgDIVISION_ID: TBCDField
      FieldName = 'DIVISION_ID'
      Visible = False
      Size = 0
    end
    object QryMsgPR_PAYGROUP_ID: TBCDField
      FieldName = 'PR_PAYGROUP_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ta_messages'
      
        '  (ID, GLOBAL, TA_SHIFT_ID, PR_EMP_ID, TA_MESSAGE, DISPLAY_TIME,' +
        ' '
      'INACTIVE, '
      
        '   EXPIRY_DATE, SOURCE, SOURCE_ID, CLOCK_IN, CLOCK_OUT, SUPERVIS' +
        'OR_ID, EPLANT_ID, DIVISION_ID, PR_PAYGROUP_ID)'
      'values'
      
        '  (:ID, :GLOBAL, :TA_SHIFT_ID, :PR_EMP_ID, :TA_MESSAGE, :DISPLAY' +
        '_TIME,'
      
        '   :INACTIVE, :EXPIRY_DATE, :SOURCE, :SOURCE_ID, :CLOCK_IN, :CLO' +
        'CK_OUT, :SUPERVISOR_ID, :EPLANT_ID, :DIVISION_ID, :PR_PAYGROUP_I' +
        'D)'
      ''
      ' ')
    ModifySQL.Strings = (
      'update ta_messages'
      'set'
      '  ID = :ID,'
      '  GLOBAL = :GLOBAL,'
      '  TA_SHIFT_ID = :TA_SHIFT_ID,'
      '  PR_EMP_ID = :PR_EMP_ID,'
      '  TA_MESSAGE = :TA_MESSAGE,'
      '  DISPLAY_TIME = :DISPLAY_TIME,'
      '  INACTIVE = :INACTIVE,'
      '  EXPIRY_DATE = :EXPIRY_DATE,'
      '  SOURCE = :SOURCE,'
      '  SOURCE_ID = :SOURCE_ID,'
      '  CLOCK_IN = :CLOCK_IN,'
      '  CLOCK_OUT = :CLOCK_OUT,'
      '  SUPERVISOR_ID = :SUPERVISOR_ID,'
      '  EPLANT_ID = :EPLANT_ID,'
      '  DIVISION_ID = :DIVISION_ID,'
      '  PR_PAYGROUP_ID = :PR_PAYGROUP_ID'
      'where'
      '  ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'delete from ta_messages'
      'where'
      '  ID = :OLD_ID')
    Left = 80
    Top = 144
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Employee / Task Messages'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192457 $'
    BuildVersion = '176554'
    Left = 120
    Top = 139
  end
  object wwMemoDialog1: TwwMemoDialog
    DataSource = SrcMsg
    DataField = 'TA_MESSAGE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    DlgLeft = 0
    DlgTop = 0
    DlgWidth = 561
    DlgHeight = 396
    Left = 160
    Top = 99
  end
  object PkShift: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id, descrip as descrip from ta_shift')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 168
    Top = 139
    object PkShiftID: TBCDField
      DisplayLabel = 'Shift#'
      FieldName = 'ID'
      Origin = 'IQ.TA_SHIFT.ID'
      Size = 0
    end
    object PkShiftDESCRIP: TStringField
      DisplayLabel = 'Shift'
      FieldName = 'DESCRIP'
      Origin = 'IQ.TA_SHIFT.DESCRIP'
      Size = 100
    end
  end
  object PkEmp: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      '       p.first_name as first_name,'
      '       p.middle_name as middle_name,'
      '       p.last_name as last_name,'
      '       p.empno as empno,'
      '       p.ssnmbr as ssnmbr,'
      
        '       decode(LTrim(RTrim(NVL(p.country, '#39'USA'#39'))), '#39'USA'#39', substr' +
        '(p.ssnmbr, 1, 3) || '#39'-'#39' || substr(p.ssnmbr, 4, 2) || '#39'-'#39' ||'
      '       substr(ssnmbr, 6, 4),'
      
        '       decode(LTrim(RTrim(NVL(p.country, '#39'USA'#39'))), '#39'CANADA'#39', sub' +
        'str(p.ssnmbr, 1, 3) || '#39'-'#39' || substr(p.ssnmbr, 4, 3) || '#39'-'#39' ||'
      '       substr(ssnmbr, 7, 3), p.ssnmbr)) as SSN'
      '  from   pr_emp p,'
      '         pr_paygroup g'
      '  where NVL(p.PK_HIDE, '#39'N'#39') = '#39'N'#39
      '    and p.pr_paygroup_id = g.id(+)'
      '    and misc.eplant_filter_include_nulls(g.eplant_id) = 1'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 208
    Top = 139
    object PkEmpID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object PkEmpMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      FieldName = 'MIDDLE_NAME'
      Size = 30
    end
    object PkEmpEMPNO: TStringField
      DisplayLabel = 'Emp#'
      FieldName = 'EMPNO'
      Size = 25
    end
    object PkEmpSSNMBR: TStringField
      FieldName = 'SSNMBR'
      Visible = False
      Size = 11
    end
    object PkEmpSSN: TStringField
      FieldName = 'SSN'
      Visible = False
      Size = 11
    end
    object PkEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Size = 30
    end
  end
  object PkPM: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select pw.id as pwid,'
      '     pd.id as id,'
      '     pw.wo_date as wo_date,'
      '     pw.department as department,'
      '     pw.status as status,'
      '     pw.priority as priority,'
      '     pw.wo_type as wo_type,'
      '     pw.class as class,'
      '     pw.start_date as start_date,'
      '     pw.end_date as end_date,'
      
        '     Decode(pt.descrip, null, SubStr(pd.comment1, 1, 50), pt.des' +
        'crip) as task_descrip,'
      '     pt.taskno as taskno,'
      '     pj.misc_comment as misc_comment,'
      '     pq.eqno as eqno,'
      '     pq.class as pq_class,'
      '     pq.descrip as eq_descrip,'
      
        '     decode(pt.id, null, pj.misc_comment, pt.descrip) as descrip' +
        'tion,'
      '     pd.wo_open as wo_open,'
      '     pq.id as pmeqmt_id,'
      '     pq.eplant_id as eplant_id,'
      '     e.name as eplant_name'
      'from'
      '     pmwo pw,'
      '     pmwo_dtl pd,'
      '     pmjob pj,'
      '     pmeqmt pq,'
      '     pmtasks pt,'
      '     eplant e'
      'where'
      '     pd.pmwo_id = pw.id'
      '     and pd.pmjob_id = pj.id(+)'
      '     and pj.pmtasks_id = pt.id(+)'
      '     and pj.pmeqmt_id = pq.id(+)'
      '     and e.id(+) = pq.eplant_id'
      '     and misc.eplant_filter(pw.eplant_id) = 1'
      ''
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 60
    Top = 333
    object PkPMID: TBCDField
      DisplayLabel = 'Work Order Detail#'
      FieldName = 'ID'
      Size = 0
    end
    object PkPMWO_DATE: TDateTimeField
      DisplayLabel = 'WO Date'
      DisplayWidth = 13
      FieldName = 'WO_DATE'
    end
    object PkPMDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 15
      FieldName = 'DEPARTMENT'
    end
    object PkPMSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 15
      FieldName = 'STATUS'
    end
    object PkPMPRIORITY: TStringField
      DisplayLabel = 'Priority'
      DisplayWidth = 15
      FieldName = 'PRIORITY'
    end
    object PkPMWO_TYPE: TStringField
      DisplayLabel = 'WO Type'
      DisplayWidth = 15
      FieldName = 'WO_TYPE'
      Size = 35
    end
    object PkPMCLASS: TStringField
      DisplayLabel = 'WO Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkPMSTART_DATE: TDateTimeField
      DisplayLabel = 'Start Date'
      DisplayWidth = 13
      FieldName = 'START_DATE'
    end
    object PkPMEND_DATE: TDateTimeField
      DisplayLabel = 'End Date'
      DisplayWidth = 13
      FieldName = 'END_DATE'
    end
    object PkPMTASK_DESCRIP: TStringField
      DisplayLabel = 'Task Description'
      DisplayWidth = 20
      FieldName = 'TASK_DESCRIP'
      Size = 50
    end
    object PkPMTASKNO: TStringField
      DisplayLabel = 'Task #'
      DisplayWidth = 7
      FieldName = 'TASKNO'
      Size = 50
    end
    object PkPMEQNO: TStringField
      DisplayLabel = 'Equip #'
      DisplayWidth = 7
      FieldName = 'EQNO'
      Size = 25
    end
    object PkPMPQ_CLASS: TStringField
      DisplayLabel = 'Equip. Class'
      FieldName = 'PQ_CLASS'
      Size = 2
    end
    object PkPMEQ_DESCRIP: TStringField
      DisplayLabel = 'Equipment Description'
      DisplayWidth = 20
      FieldName = 'EQ_DESCRIP'
      Size = 50
    end
    object PkPMDESCRIPTION: TStringField
      DisplayLabel = 'Job Description'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object PkPMWO_OPEN: TStringField
      DisplayLabel = 'Open'
      DisplayWidth = 4
      FieldName = 'WO_OPEN'
      Size = 1
    end
    object PkPMPMEQMT_ID: TBCDField
      FieldName = 'PMEQMT_ID'
      Visible = False
      Size = 0
    end
    object PkPMEPLANT_ID: TBCDField
      FieldName = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object PkPMEPLANT_NAME: TStringField
      DisplayLabel = 'EPlant'
      FieldName = 'EPLANT_NAME'
      Size = 30
    end
    object PkPMPWID: TBCDField
      DisplayLabel = 'Work Order#'
      FieldName = 'PWID'
      Size = 0
    end
  end
  object PkWorkOrder: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select  s.id as id,'
      '        s.mfgno as mfgno,'
      '        a.itemno as itemno,'
      '        a.descrip as descrip,'
      '        a.descrip2 as descrip2,'
      '        a.rev as rev,'
      '        w.eplant_id as eplant_id,'
      '        w.cycles_req as cycles_req,'
      '        w.id as wo_num,'
      '        w.bucket as bucket,       '
      '        w.origin as origin,'
      '        wc.eqno as eqno,'
      '        wc.id as wc_id,'
      '        wc.cntr_desc as cntr_desc '
      'from workorder w, '
      '     standard s, '
      '     partno p, '
      '     arinvt a,'
      '     cntr_sched c,'
      '     work_center wc '
      'where w.standard_id = s.id'
      '  and p.arinvt_id = a.id'
      '  and p.standard_id = s.id'
      '  and c.workorder_id(+) = w.id'
      '  and c.work_center_id = wc.id(+)'
      '  and misc.eplant_filter(w.eplant_id) = 1'
      ''
      '         '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 25
    Top = 333
    object PkWorkOrderID: TBCDField
      DisplayLabel = 'Standard ID'
      DisplayWidth = 10
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkWorkOrderMFGNO: TStringField
      DisplayLabel = 'Mfg#'
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkWorkOrderITEMNO: TStringField
      DisplayLabel = 'Item#'
      DisplayWidth = 20
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkWorkOrderDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkWorkOrderREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 3
      FieldName = 'REV'
      Size = 15
    end
    object PkWorkOrderEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'WORKORDER.EPLANT_ID'
      Size = 0
    end
    object PkWorkOrderCYCLES_REQ: TBCDField
      DisplayLabel = 'Required'
      FieldName = 'CYCLES_REQ'
      Origin = 'WORKORDER.CYCLES_REQ'
      Size = 2
    end
    object PkWorkOrderBUCKET: TBCDField
      DisplayLabel = 'Bkt#'
      DisplayWidth = 5
      FieldName = 'BUCKET'
      Origin = 'WORKORDER.BUCKET'
      Size = 0
    end
    object PkWorkOrderORIGIN: TStringField
      DisplayLabel = 'Origin'
      FieldName = 'ORIGIN'
      Origin = 'WORKORDER.ORIGIN'
      Size = 10
    end
    object PkWorkOrderDESCRIP2: TStringField
      DisplayLabel = 'Descrip2'
      FieldName = 'DESCRIP2'
      Origin = 'ARINVT.DESCRIP2'
      Size = 100
    end
    object PkWorkOrderEQNO: TStringField
      DisplayLabel = 'Work Center#'
      FieldName = 'EQNO'
      Size = 60
    end
    object PkWorkOrderCNTR_DESC: TStringField
      DisplayLabel = 'Work Center Description'
      FieldName = 'CNTR_DESC'
      Size = 250
    end
    object PkWorkOrderWC_ID: TBCDField
      FieldName = 'WC_ID'
      Visible = False
      Size = 0
    end
    object PkWorkOrderWO_NUM: TBCDField
      DisplayLabel = 'WO #'
      FieldName = 'WO_NUM'
      Size = 0
    end
  end
  object PkTL: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.id as tool_rfq_id,'
      '       a.rfq as rfq,'
      '       a.project as project,'
      '       a.workorderno as workorderno,'
      '       b.company as customer,'
      '       e.eqno as eqno,'
      '       a.eplant_id as eplant_id,'
      '       t.id as id,'
      '       t.name as task_name,'
      '       t.outlinenumber as outlinenumber'
      '  from tool_rfq a,'
      '       arcusto b,'
      '       pmeqmt e,'
      '       tool_task_information t'
      ' where a.arcusto_id = b.id(+)'
      '   and e.id(+) = a.pmeqmt_id'
      '   and t.tool_rfq_id = a.id'
      '   and misc.eplant_filter(a.eplant_id) = 1'
      ''
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 92
    Top = 333
    object PkTLTOOL_RFQ_ID: TBCDField
      FieldName = 'TOOL_RFQ_ID'
      Visible = False
      Size = 0
    end
    object PkTLRFQ: TStringField
      DisplayLabel = 'Project#'
      FieldName = 'RFQ'
    end
    object PkTLPROJECT: TStringField
      DisplayLabel = 'Project Name'
      DisplayWidth = 20
      FieldName = 'PROJECT'
      Size = 255
    end
    object PkTLWORKORDERNO: TStringField
      DisplayLabel = 'WorkOrder#'
      FieldName = 'WORKORDERNO'
    end
    object PkTLCUSTOMER: TStringField
      DisplayLabel = 'Customer'
      FieldName = 'CUSTOMER'
      Size = 60
    end
    object PkTLEQNO: TStringField
      DisplayLabel = 'Eq#'
      FieldName = 'EQNO'
      Size = 25
    end
    object PkTLEPLANT_ID: TBCDField
      DisplayLabel = 'Eplant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkTLID: TBCDField
      DisplayLabel = 'Tool/Task ID'
      FieldName = 'ID'
      Size = 0
    end
    object PkTLTASK_NAME: TStringField
      DisplayLabel = 'Task'
      FieldName = 'TASK_NAME'
      Size = 255
    end
  end
  object PkOrders: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select s.PONO           as pono,'
      '       s.orderno        as orderno,'
      '       s.custno         as custno,'
      '       s.addr1          as addr1,'
      '       s.addr2          as addr2,'
      '       s.addr3          as addr3,'
      '       s.status         as status,'
      '       s.company        as company,'
      '       s.Date_Taken     as Date_Taken,'
      '       s.Ord_By         as Ord_By,'
      '       s.class          as class,'
      '       s.rev            as rev,'
      '       s.ItemNo         as ItemNo,'
      '       s.description    as description,'
      '       s.description2   as description2,'
      '       s.cust_itemno    as cust_itemno,'
      '       s.cust_descrip   as cust_descrip,'
      '       s.total_qty_ord  as total_qty_ord,'
      '       s.ecode          as ecode,'
      '       s.eplant_id      as eplant_id,'
      '       s.web_orders_id  as web_orders_id,'
      '       s.ord_detail_id  as id'
      '  from v_ord_detail_aka s'
      ' where misc.eplant_filter(s.eplant_id) = 1'
      ''
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 128
    Top = 333
    object PkOrdersID: TBCDField
      DisplayLabel = 'Order #'
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkOrdersPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 15
      FieldName = 'PONO'
      Size = 35
    end
    object PkOrdersCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      FieldName = 'CUSTNO'
      Size = 10
    end
    object PkOrdersCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 15
      FieldName = 'COMPANY'
      Size = 60
    end
    object PkOrdersDATE_TAKEN: TDateTimeField
      DisplayLabel = 'Order Date'
      FieldName = 'DATE_TAKEN'
    end
    object PkOrdersORD_BY: TStringField
      DisplayLabel = 'Order By'
      DisplayWidth = 15
      FieldName = 'ORD_BY'
      Visible = False
      Size = 30
    end
    object PkOrdersCLASS: TStringField
      DisplayLabel = 'Class'
      FieldName = 'CLASS'
      Size = 2
    end
    object PkOrdersREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 5
      FieldName = 'REV'
      Size = 15
    end
    object PkOrdersITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkOrdersDESCRIPTION: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'DESCRIPTION'
      Size = 250
    end
    object PkOrdersDESCRIPTION2: TStringField
      DisplayLabel = 'Extended Description'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION2'
      Size = 100
    end
    object PkOrdersADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 15
      FieldName = 'ADDR1'
      Size = 60
    end
    object PkOrdersADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 15
      FieldName = 'ADDR2'
      Size = 60
    end
    object PkOrdersADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 15
      FieldName = 'ADDR3'
      Size = 60
    end
    object PkOrdersSTATUS: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 10
      FieldName = 'STATUS'
      Origin = 'V_ORD_DETAIL_AKA.STATUS'
    end
    object PkOrdersCUST_ITEMNO: TStringField
      DisplayLabel = 'AKA Item #'
      DisplayWidth = 15
      FieldName = 'CUST_ITEMNO'
      Origin = 'V_ORD_DETAIL_AKA.CUST_ITEMNO'
      Size = 50
    end
    object PkOrdersCUST_DESCRIP: TStringField
      DisplayLabel = 'AKA Item Description'
      DisplayWidth = 25
      FieldName = 'CUST_DESCRIP'
      Origin = 'V_ORD_DETAIL_AKA.CUST_DESCRIP'
      Size = 35
    end
    object PkOrdersECODE: TStringField
      DisplayLabel = 'ECode'
      FieldName = 'ECODE'
      Origin = 'V_ORD_DETAIL_AKA.ECODE'
      Size = 10
    end
    object PkOrdersTOTAL_QTY_ORD: TBCDField
      DisplayLabel = 'Blanket Qty'
      FieldName = 'TOTAL_QTY_ORD'
    end
    object PkOrdersEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'V_ORD_DETAIL_AKA.EPLANT_ID'
      Size = 0
    end
    object PkOrdersWEB_ORDERS_ID: TBCDField
      DisplayLabel = 'Web Ref#'
      FieldName = 'WEB_ORDERS_ID'
      Origin = 'V_ORD_DETAIL_AKA.WEB_ORDERS_ID'
      Size = 0
    end
    object PkOrdersORDERNO: TStringField
      DisplayLabel = 'Order #'
      FieldName = 'ORDERNO'
      Origin = 'V_ORD_DETAIL_AKA.ORDERNO'
      Size = 15
    end
  end
  object PkRR: TIQWebHpick
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id as id,'
      '       d.rma_id as rma_id,'
      '       d.wo_date as created_no,'
      '       d.wo_lead_days as lead_days,'
      '       d.wo_due_date as due_date,'
      '       d.wo_qty as Quantity,'
      '       d.workorderno as workorderno,'
      '       r.arcusto_id as arcusto_id,'
      '       r.rmano as rmano,'
      '       a.company as customer,'
      '       decode(d.arinvt_id, null, c.itemno, i.itemno) as itemno,'
      
        '       decode(d.arinvt_id, null, NVL(c.descrip, c.misc_item), i.' +
        'descrip) as descrip,'
      '       r.eplant_id as eplant_id'
      '  from rma_detail d,'
      '       rma r,'
      '       arcusto a,'
      '       c_ship_hist c,'
      '       arinvt i'
      ' where d.rma_id = r.id'
      '   and r.arcusto_id = a.id'
      '   and d.shipment_dtl_id = c.shipment_dtl_id(+)'
      '   and d.arinvt_id = i.id(+)'
      '   and NVL(d.wo_open, '#39'N'#39') = '#39'Y'#39
      '   and d.wo_close_date is null'
      '   and misc.eplant_filter(r.eplant_id) = 1'
      ''
      ''
      '         '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 241
    Top = 333
    object PkRRRMA_ID: TBCDField
      FieldName = 'RMA_ID'
      Visible = False
      Size = 0
    end
    object PkRRCREATED_NO: TDateTimeField
      DisplayLabel = 'Created On'
      FieldName = 'CREATED_NO'
    end
    object PkRRLEAD_DAYS: TBCDField
      DisplayLabel = 'Lead days'
      FieldName = 'LEAD_DAYS'
      Size = 0
    end
    object PkRRDUE_DATE: TDateTimeField
      DisplayLabel = 'Due Date'
      FieldName = 'DUE_DATE'
    end
    object PkRRQUANTITY: TBCDField
      DisplayLabel = 'Qty.'
      FieldName = 'QUANTITY'
      Size = 2
    end
    object PkRRWORKORDERNO: TStringField
      DisplayLabel = 'Work Order#'
      FieldName = 'WORKORDERNO'
      Size = 15
    end
    object PkRRARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object PkRRRMANO: TStringField
      DisplayLabel = 'Rma#'
      FieldName = 'RMANO'
      Size = 15
    end
    object PkRRCUSTOMER: TStringField
      DisplayLabel = 'Customer'
      FieldName = 'CUSTOMER'
      FixedChar = True
      Size = 60
    end
    object PkRRITEMNO: TStringField
      DisplayLabel = 'Item#'
      FieldName = 'ITEMNO'
      Size = 50
    end
    object PkRRDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Size = 250
    end
    object PkRREPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkRRID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object PkJobShop: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select t.id as id,'
      '       q.projectno as projectno,'
      '       q.descrip as project_descrip,'
      '       c.custno as custno,'
      '       c.company as company,'
      '       a.itemno as itemno,'
      '       a.descrip as descrip,'
      '       a.rev as rev,'
      '       s.mfgno as mfgno,'
      '       s.cntr_type as cntr_type,'
      '       s.mfg_type as mfg_type,'
      '       q.arinvt_id as main_arinvt_id,'
      '       q.standard_id as main_standard_id,'
      '       t.arinvt_id as task_arinvt_id,'
      '       t.standard_id as task_standard_id'
      '  from jobshop_rfq q,'
      '       jobshop_task t,'
      '       arinvt a,'
      '       arcusto c,'
      '       standard s'
      ' where q.id = t.jobshop_rfq_id'
      '   and t.arinvt_id = a.id(+)'
      '   and t.standard_id = s.id(+)'
      '   and q.arcusto_id = c.id(+)'
      '   and NVL(q.IS_OPEN, '#39'N'#39') = '#39'Y'#39
      '   and NVL(q.ARCHIVED, '#39'N'#39') = '#39'N'#39
      '   and misc.eplant_filter(q.eplant_id) = 1'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 204
    Top = 333
    object PkJobShopID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkJobShopPROJECTNO: TStringField
      DisplayLabel = 'Project #'
      DisplayWidth = 10
      FieldName = 'PROJECTNO'
      Size = 25
    end
    object PkJobShopPROJECT_DESCRIP: TStringField
      DisplayLabel = 'Project Description'
      DisplayWidth = 35
      FieldName = 'PROJECT_DESCRIP'
      Size = 255
    end
    object PkJobShopCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object PkJobShopCOMPANY: TStringField
      DisplayLabel = 'Company'
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object PkJobShopITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 15
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object PkJobShopDESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 25
      FieldName = 'DESCRIP'
      Size = 100
    end
    object PkJobShopREV: TStringField
      DisplayLabel = 'Item Rev'
      DisplayWidth = 10
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object PkJobShopMFGNO: TStringField
      DisplayLabel = 'Mfg #'
      DisplayWidth = 15
      FieldName = 'MFGNO'
      Size = 50
    end
    object PkJobShopCNTR_TYPE: TStringField
      DisplayLabel = 'Center Type'
      DisplayWidth = 15
      FieldName = 'CNTR_TYPE'
      FixedChar = True
    end
    object PkJobShopMFG_TYPE: TStringField
      DisplayLabel = 'Mfg Type'
      FieldName = 'MFG_TYPE'
      FixedChar = True
      Size = 10
    end
    object PkJobShopMAIN_ARINVT_ID: TBCDField
      FieldName = 'MAIN_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkJobShopMAIN_STANDARD_ID: TBCDField
      FieldName = 'MAIN_STANDARD_ID'
      Visible = False
      Size = 0
    end
    object PkJobShopTASK_ARINVT_ID: TBCDField
      FieldName = 'TASK_ARINVT_ID'
      Visible = False
      Size = 0
    end
    object PkJobShopTASK_STANDARD_ID: TBCDField
      FieldName = 'TASK_STANDARD_ID'
      Visible = False
      Size = 0
    end
  end
  object PKUD: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      'code,'
      'descrip,'
      'pk_hide'
      ' from master_labor')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 164
    Top = 333
    object PKUDID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.MASTER_LABOR.ID'
      Visible = False
      Size = 0
    end
    object PKUDCODE: TStringField
      DisplayLabel = 'Code'
      FieldName = 'CODE'
      Origin = 'IQ.MASTER_LABOR.CODE'
      Size = 25
    end
    object PKUDDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.MASTER_LABOR.DESCRIP'
      Size = 50
    end
    object PKUDPK_HIDE: TStringField
      DisplayLabel = 'Hide from PickLists'
      FieldName = 'PK_HIDE'
      Origin = 'IQ.MASTER_LABOR.PK_HIDE'
      Size = 1
    end
  end
  object PkDivision: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id,'
      '       d.name,'
      '       d.eplant_id'
      '  from division d'
      ' where misc.eplant_filter(d.eplant_id) = 1')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 208
    Top = 171
    object PkDivisionID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkDivisionNAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'NAME'
      Size = 25
    end
    object PkDivisionEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkEplant: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       name'
      '  from eplant'
      '           ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 204
    Top = 204
    object PkEplantID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'ID'
      Origin = 'IQ.EPLANT.ID'
      Size = 0
    end
    object PkEplantNAME: TStringField
      DisplayLabel = 'EPlant'
      FieldName = 'NAME'
      Origin = 'IQ.EPLANT.NAME'
      Size = 30
    end
  end
  object PkPayGroup: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, description from pr_paygroup'
      ' where misc.eplant_filter(eplant_id) = 1'
      '  and NVL(pk_hide, '#39'N'#39') = '#39'N'#39)
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 208
    Top = 96
    object PkPayGroupID: TBCDField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Precision = 15
      Size = 0
    end
    object PkPayGroupDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Size = 50
    end
  end
  object SrcEmp: TDataSource
    DataSet = QryEmp
    Left = 64
    Top = 267
  end
  object QryEmp: TFDQuery
    BeforePost = QryEmpBeforePost
    AfterPost = QryEmpAfterPost
    AfterDelete = QryEmpAfterPost
    CachedUpdates = True
    MasterSource = SrcMsg
    MasterFields = 'ID'
    DetailFields = 'ID'
    Connection = UniMainModule.FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    UpdateObject = UpdateSQL2
    SQL.Strings = (
      'select t.id,'
      '       t.ta_messages_id,'
      '       t.pr_emp_id,'
      '       p.empno,'
      
        '       RTrim(p.first_name) || '#39' '#39' || RTrim(p.last_name) as emp_n' +
        'ame'
      '  from ta_messages_emp t,'
      '       pr_emp p'
      ' where t.pr_emp_id = p.id'
      '   and t.ta_messages_id = :ID')
    Left = 72
    Top = 288
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = 130000c
      end>
    object QryEmpEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 10
      FieldName = 'EMPNO'
      Origin = 'p.EMPNO'
      Size = 25
    end
    object QryEmpEMP_NAME: TStringField
      DisplayLabel = 'Employee Name'
      DisplayWidth = 30
      FieldName = 'EMP_NAME'
      Origin = 'RTrim(p.first_name) || '#39' '#39' || RTrim(p.last_name)'
      Size = 61
    end
    object QryEmpID: TBCDField
      FieldName = 'ID'
      Origin = 't.id'
      Required = True
      Visible = False
      Size = 0
    end
    object QryEmpTA_MESSAGES_ID: TBCDField
      FieldName = 'TA_MESSAGES_ID'
      Origin = 't.TA_MESSAGES_ID'
      Visible = False
      Size = 0
    end
    object QryEmpPR_EMP_ID: TBCDField
      FieldName = 'PR_EMP_ID'
      Origin = 't.PR_EMP_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL2: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ta_messages_emp'
      '  (ID, PR_EMP_ID, TA_MESSAGES_ID)'
      'values'
      '  (:ID, :PR_EMP_ID, :TA_MESSAGES_ID)'
      ''
      ' ')
    ModifySQL.Strings = (
      'update ta_messages'
      'set'
      '  ID = :ID,'
      '  PR_EMP_ID = :PR_EMP_ID,  '
      '  TA_MESSAGES_ID = :TA_MESSAGES_ID'
      'where'
      '  ID = :OLD_ID'
      ' ')
    DeleteSQL.Strings = (
      'delete from ta_messages_emp'
      'where'
      '  ID = :OLD_ID')
    Left = 88
    Top = 304
  end
  object PopupMenu1: TUniPopupMenu
    Left = 552
    Top = 115
    object SelectMultipleEmployees1: TUniMenuItem
      Caption = 'Select Multiple Employees'
      OnClick = SelectMultipleEmployees1Click
    end
  end
  object PkEmpSuper: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      '       p.first_name as first_name,'
      '       p.middle_name as middle_name,'
      '       p.last_name as last_name,'
      '       p.empno as empno,'
      '       p.ssnmbr as ssnmbr,'
      
        '       decode(LTrim(RTrim(NVL(p.country, '#39'USA'#39'))), '#39'USA'#39', substr' +
        '(p.ssnmbr, 1, 3) || '#39'-'#39' || substr(p.ssnmbr, 4, 2) || '#39'-'#39' ||'
      '       substr(ssnmbr, 6, 4),'
      
        '       decode(LTrim(RTrim(NVL(p.country, '#39'USA'#39'))), '#39'CANADA'#39', sub' +
        'str(p.ssnmbr, 1, 3) || '#39'-'#39' || substr(p.ssnmbr, 4, 3) || '#39'-'#39' ||'
      '       substr(ssnmbr, 7, 3), p.ssnmbr)) as SSN'
      '  from   pr_emp p,'
      '         pr_paygroup g'
      '  where NVL(p.PK_HIDE, '#39'N'#39') = '#39'N'#39
      '    and NVL(p.supervisor, '#39'N'#39') = '#39'Y'#39
      '    and p.pr_paygroup_id = g.id(+)'
      '    and misc.eplant_filter_include_nulls(g.eplant_id) = 1'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 160
    Top = 67
    object FloatField1: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object StringField1: TStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object PkEmpSuperMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      FieldName = 'MIDDLE_NAME'
      Size = 30
    end
    object StringField2: TStringField
      DisplayLabel = 'Emp#'
      FieldName = 'EMPNO'
      Size = 25
    end
    object StringField3: TStringField
      FieldName = 'SSNMBR'
      Visible = False
      Size = 11
    end
    object StringField4: TStringField
      FieldName = 'SSN'
      Visible = False
      Size = 11
    end
    object StringField5: TStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRST_NAME'
      Size = 30
    end
  end
end

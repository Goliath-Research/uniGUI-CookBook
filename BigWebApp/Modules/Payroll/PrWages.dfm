object FrmPrWages: TFrmPrWages
  Left = 63
  Top = 154
  HelpContext = 13990
  ClientHeight = 407
  ClientWidth = 388
  Caption = 'Mass Wages Update'
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
    Width = 388
    Height = 319
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 171
    IQComponents.Grid.Height = 233
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
    IQComponents.HiddenPanel.Left = 171
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 233
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
        Title.Caption = 'Emp#'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NAME'
        Title.Caption = 'Name'
        Width = 644
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'DEPARTMENT'
        Title.Caption = 'Department'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TA_SETTING'
        Title.Caption = 'T&A setting'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIFT'
        Title.Caption = 'Shift'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PAYGROUP'
        Title.Caption = 'Pay Group'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PAYTYPE'
        Title.Caption = 'Pay Type'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'RATE'
        Title.Caption = 'Rate'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'HR_JOB_DESCRIP'
        Title.Caption = 'HR_JOB_DESCRIP'
        Width = 1750
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 319
    Width = 388
    Height = 88
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Label1: TUniLabel
      Left = 156
      Top = 28
      Width = 96
      Height = 13
      Hint = ''
      Caption = 'Percentage/Amount'
      TabOrder = 5
    end
    object Panel2: TUniPanel
      Left = 1
      Top = 60
      Width = 386
      Height = 28
      Hint = ''
      Align = alBottom
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object Panel3: TUniPanel
        Left = 178
        Top = 1
        Width = 208
        Height = 26
        Hint = ''
        Align = alRight
        Anchors = [akTop, akRight, akBottom]
        TabOrder = 0
        Caption = ''
        object BtnCancel: TUniButton
          Left = 130
          Top = 1
          Width = 75
          Height = 25
          Hint = ''
          Caption = '&Cancel'
          TabOrder = 1
          OnClick = Exit1Click
        end
        object BtnApply: TUniButton
          Left = 10
          Top = 1
          Width = 113
          Height = 25
          Hint = ''
          Caption = '&Apply Wages Update'
          TabOrder = 2
          OnClick = BtnApplyClick
        end
      end
    end
    object rbPercent: TUniRadioButton
      Left = 8
      Top = 15
      Width = 138
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'Percentage update'
      TabOrder = 1
    end
    object rbDollar: TUniRadioButton
      Left = 8
      Top = 39
      Width = 138
      Height = 17
      Hint = ''
      Caption = 'Monetary amount update'
      TabOrder = 2
    end
    object edAmount: TUniEdit
      Left = 260
      Top = 24
      Width = 121
      Height = 21
      Hint = ''
      Text = ''
      TabOrder = 3
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 328
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
  object SrcEmp: TDataSource
    DataSet = QryEmp
    Left = 56
    Top = 171
  end
  object QryEmp: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select e.id,'
      '       e.empno,'
      '       e.pr_paygroup_id,'
      '       e.pr_paytype_id,'
      '       e.first_name,'
      '       e.last_name,'
      '       e.middle_name,'
      '       e.ssnmbr,'
      '       e.addr1,'
      '       e.addr2,'
      '       e.state,'
      '       e.zip,'
      '       e.country,'
      '       e.phone_number,'
      '       e.basis,'
      '       e.pr_department_id,'
      '       e.ta_settings_id,'
      '       e.rate,'
      '       t.descrip as ta_setting,'
      '       s.descrip as shift,'
      '       p.description as paytype,'
      '       g.description as paygroup,'
      '       NVL(d.description, '#39' '#39') as department,'
      
        '       RTrim(LTrim(RTrim(LTrim(RTrim(LTrim(Nvl(e.first_name, '#39' '#39 +
        '))) || '#39' '#39' ||'
      
        '                   RTrim(LTrim(NVL(e.middle_name, '#39' '#39'))))) || '#39' ' +
        #39' ||'
      
        '                   RTrim(LTrim(NVL(e.last_name, '#39' '#39'))))) as name' +
        ','
      
        '       decode(LTrim(RTrim(NVL(country, '#39'USA'#39'))), '#39'USA'#39', substr(s' +
        'snmbr, 1, 3) || '#39'-'#39' || substr(ssnmbr, 4, 2) || '#39'-'#39' ||'
      '       substr(ssnmbr, 6, 4),'
      
        '       decode(LTrim(RTrim(NVL(country, '#39'USA'#39'))), '#39'CANADA'#39', subst' +
        'r(ssnmbr, 1, 3) || '#39'-'#39' || substr(ssnmbr, 4, 3) || '#39'-'#39' ||'
      '       substr(ssnmbr, 7, 3), ssnmbr)) as SSN,'
      '       h.descrip as HR_JOB_DESCRIP'
      '  from pr_emp e,'
      '       ta_settings t,'
      '       pr_department d,'
      '       ta_shift s,'
      '       pr_paytype p,'
      '       pr_paygroup g,'
      '       HR_JOB_DESCRIP h'
      ' where e.pr_department_id = d.id(+)'
      '   and e.ta_settings_id = t.id(+)'
      '   and e.ta_shift_id = s.id(+)'
      '   and e.pr_paytype_id = p.id(+)'
      '   and e.pr_paygroup_id = g.id(+)'
      '   and e.HR_JOB_DESCRIP_id = h.id(+)'
      '   and NVL(e.PK_HIDE, '#39'N'#39') = '#39'N'#39
      '   and (e.pr_paygroup_id is null'
      '        or e.pr_paygroup_id in (select pr_paygroup_id'
      '                                  from s_user_paygroup'
      
        '                                 where misc.GetUserName = user_n' +
        'ame))'
      '   and (e.emp_status_id is null or e.emp_status_id in (select id'
      
        '                                                         from em' +
        'p_status'
      
        '                                                        where NV' +
        'L(INCL_IN_PREPOST_PAYROLL, '#39'Y'#39') = '#39'Y'#39'))'
      ''
      ''
      ''
      ''
      ''
      ' ')
    Left = 72
    Top = 171
    object QryEmpEMPNO: TStringField
      DisplayLabel = 'Emp#'
      DisplayWidth = 25
      FieldName = 'EMPNO'
      Origin = 'E.EMPNO'
      Size = 25
    end
    object QryEmpNAME: TStringField
      DisplayLabel = 'Name'
      DisplayWidth = 92
      FieldName = 'NAME'
      Origin = 
        'RTrim(LTrim(RTrim(LTrim(RTrim(LTrim(Nvl(e.first_name, '#39' '#39'))) || ' +
        #39' '#39' || RTrim(LTrim(NVL(e.middle_name, '#39' '#39'))))) || '#39' '#39' || RTrim(L' +
        'Trim(NVL(e.last_name, '#39' '#39')))))'
      Size = 92
    end
    object QryEmpDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 20
      FieldName = 'DEPARTMENT'
      Origin = 'NVL(d.description, '#39' '#39')'
      Size = 100
    end
    object QryEmpTA_SETTING: TStringField
      DisplayLabel = 'T&A setting'
      DisplayWidth = 20
      FieldName = 'TA_SETTING'
      Origin = 't.descrip'
      Size = 50
    end
    object QryEmpSHIFT: TStringField
      DisplayLabel = 'Shift'
      DisplayWidth = 20
      FieldName = 'SHIFT'
      Origin = 's.descrip'
      Size = 100
    end
    object QryEmpPAYGROUP: TStringField
      DisplayLabel = 'Pay Group'
      DisplayWidth = 20
      FieldName = 'PAYGROUP'
      Origin = 'g.description'
      Size = 50
    end
    object QryEmpPAYTYPE: TStringField
      DisplayLabel = 'Pay Type'
      DisplayWidth = 20
      FieldName = 'PAYTYPE'
      Origin = 'p.description'
      Size = 50
    end
    object QryEmpRATE: TBCDField
      DisplayLabel = 'Rate'
      DisplayWidth = 10
      FieldName = 'RATE'
      Origin = 'e.rate'
    end
    object QryEmpHR_JOB_DESCRIP: TStringField
      DisplayWidth = 250
      FieldName = 'HR_JOB_DESCRIP'
      Size = 250
    end
    object QryEmpSSNMBR: TStringField
      DisplayLabel = 'SSN'
      DisplayWidth = 11
      FieldName = 'SSNMBR'
      Origin = 'e.ssnmbr'
      Visible = False
      Size = 11
    end
    object QryEmpFIRST_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'FIRST_NAME'
      Origin = 'E.FIRST_NAME'
      Visible = False
      Size = 30
    end
    object QryEmpLAST_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Origin = 'E.LAST_NAME'
      Visible = False
      Size = 30
    end
    object QryEmpMIDDLE_NAME: TStringField
      DisplayWidth = 30
      FieldName = 'MIDDLE_NAME'
      Origin = 'E.MIDDLE_NAME'
      Visible = False
      Size = 30
    end
    object QryEmpADDR1: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR1'
      Origin = 'E.ADDR1'
      Visible = False
      Size = 60
    end
    object QryEmpADDR2: TStringField
      DisplayWidth = 30
      FieldName = 'ADDR2'
      Origin = 'E.ADDR2'
      Visible = False
      Size = 60
    end
    object QryEmpSTATE: TStringField
      DisplayWidth = 2
      FieldName = 'STATE'
      Origin = 'E.STATE'
      Visible = False
    end
    object QryEmpZIP: TStringField
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'E.ZIP'
      Visible = False
      Size = 10
    end
    object QryEmpCOUNTRY: TStringField
      DisplayWidth = 30
      FieldName = 'COUNTRY'
      Origin = 'e.country'
      Visible = False
      Size = 30
    end
    object QryEmpPHONE_NUMBER: TStringField
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      Origin = 'e.phone_number'
      Visible = False
      Size = 25
    end
    object QryEmpBASIS: TStringField
      DisplayWidth = 1
      FieldName = 'BASIS'
      Origin = 'e.basis'
      Visible = False
      Size = 1
    end
    object QryEmpPR_PAYGROUP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_PAYGROUP_ID'
      Origin = 'e.pr_paygroup_id'
      Visible = False
      Size = 0
    end
    object QryEmpPR_PAYTYPE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_PAYTYPE_ID'
      Origin = 'E.PR_PAYTYPE_ID'
      Visible = False
      Size = 0
    end
    object QryEmpPR_DEPARTMENT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_DEPARTMENT_ID'
      Origin = 'E.PR_DEPARTMENT_ID'
      Visible = False
      Size = 0
    end
    object QryEmpID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'E.ID'
      Visible = False
      Size = 0
    end
    object QryEmpTA_SETTINGS_ID: TBCDField
      FieldName = 'TA_SETTINGS_ID'
      Origin = 'E.TA_SETTINGS_ID'
      Visible = False
      Size = 0
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Mass Wages Update'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192887 $'
    BuildVersion = '176554'
    Left = 280
    Top = 48
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'BtnApply')
    SecurityCode = 'FRMPRWAGES'
    Left = 248
    Top = 48
  end
end

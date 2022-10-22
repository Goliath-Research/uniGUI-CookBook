object FrmHrSelEmp: TFrmHrSelEmp
  Left = 0
  Top = 0
  ClientHeight = 373
  ClientWidth = 405
  Caption = 'Select Employee'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 336
    Width = 405
    Height = 37
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 195
      Top = 1
      Width = 210
      Height = 35
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnCancel: TUniButton
        Left = 109
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&Cancel'
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object btnOk: TUniButton
        Left = 7
        Top = 6
        Width = 97
        Height = 25
        Hint = ''
        Caption = '&OK'
        TabOrder = 2
        OnClick = btnOkClick
      end
    end
  end
  object PC: TUniPageControl
    Left = 0
    Top = 0
    Width = 405
    Height = 336
    Hint = ''
    ActivePage = TabAll
    TabBarVisible = True
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    object TabAll: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'TabAll'
      object IQSearchAll: TIQUniGridControl
        Left = 0
        Top = 0
        Width = 397
        Height = 308
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 180
        IQComponents.Grid.Height = 222
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcEmpAll
        IQComponents.Grid.LoadMask.Message = 'Loading data...'
        IQComponents.Grid.Align = alClient
        IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
        IQComponents.Grid.TabOrder = 0
        IQComponents.Navigator.Left = 410
        IQComponents.Navigator.Top = 0
        IQComponents.Navigator.Width = 100
        IQComponents.Navigator.Height = 25
        IQComponents.Navigator.Hint = ''
        IQComponents.Navigator.ShowHint = True
        IQComponents.Navigator.DataSource = SrcEmpAll
        IQComponents.Navigator.VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 180
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 222
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.HiddenPanel.ExplicitHeight = 195
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        IQComponents.FormTab.ExplicitHeight = 224
        DataSource = SrcEmpAll
        Columns = <
          item
            FieldName = 'EMPNO'
            Title.Caption = 'Emp#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'JOB_TITLE'
            Title.Caption = 'Job Title'
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
            FieldName = 'MIDDLE_NAME'
            Title.Caption = 'Middle Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LAST_NAME'
            Title.Caption = 'Last Name'
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
            FieldName = 'JOB_DESC'
            Title.Caption = 'Job Description'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        ExplicitTop = 27
        ExplicitHeight = 281
        Marker = 0
      end
    end
    object TabSkills: TUniTabSheet
      Hint = ''
      TabVisible = False
      ImageIndex = 1
      Caption = 'TabSkills'
      object Panel4: TUniPanel
        Left = 0
        Top = 0
        Width = 397
        Height = 27
        Hint = ''
        Align = alTop
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Caption = ''
        object NavSkills: TUniDBNavigator
          Left = 297
          Top = 1
          Width = 100
          Height = 25
          Hint = ''
          ShowHint = True
          ParentShowHint = False
          DataSource = SrcEmpSkills
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      object IQSearchSkills: TIQUniGridControl
        Left = 0
        Top = 27
        Width = 397
        Height = 281
        Layout = 'border'
        ParentAlignmentControl = False
        AlignmentControl = uniAlignmentClient
        Align = alClient
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        IQComponents.Grid.Left = 0
        IQComponents.Grid.Top = 29
        IQComponents.Grid.Width = 180
        IQComponents.Grid.Height = 195
        IQComponents.Grid.Hint = ''
        IQComponents.Grid.DataSource = SrcEmpSkills
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
        IQComponents.Navigator.DataSource = SrcEmpSkills
        IQComponents.Navigator.LayoutConfig.Region = 'east'
        IQComponents.Navigator.TabOrder = 3
        IQComponents.HiddenPanel.Left = 180
        IQComponents.HiddenPanel.Top = 29
        IQComponents.HiddenPanel.Width = 209
        IQComponents.HiddenPanel.Height = 195
        IQComponents.HiddenPanel.Hint = ''
        IQComponents.HiddenPanel.Visible = True
        IQComponents.HiddenPanel.Align = alRight
        IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
        IQComponents.FormTab.Hint = ''
        IQComponents.FormTab.ImageIndex = 1
        IQComponents.FormTab.Caption = 'Form'
        IQComponents.FormTab.Layout = 'border'
        DataSource = SrcEmpSkills
        Columns = <
          item
            FieldName = 'FIRST_NAME'
            Title.Caption = 'First Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'MIDDLE_NAME'
            Title.Caption = 'Middle Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'LAST_NAME'
            Title.Caption = 'Last Name'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SKILL_DESCRIP'
            Title.Caption = 'Skill'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SKILL_TYPE'
            Title.Caption = 'Skill Type'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'SKILLNO'
            Title.Caption = 'Skill#'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRAINING_ITEM'
            Title.Caption = 'Training Item'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'REV'
            Title.Caption = 'Revision'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'EFFECT_DATE'
            Title.Caption = 'Effective Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'TRAINING_DUE_DATE'
            Title.Caption = 'Training Due Date'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'DEPARTMENT'
            Title.Caption = 'Department'
            Width = 64
            CheckBoxField.FieldValues = 'true;false'
          end>
        Marker = 0
      end
    end
  end
  object SrcEmpAll: TDataSource
    DataSet = QryEmpAll
    Left = 48
    Top = 99
  end
  object QryEmpAll: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id as id,'
      '       p.empno as empno,'
      '       p.job_title as job_title,'
      '       p.birth_date as birth_date,'
      '       p.first_name           as first_name,'
      '       p.middle_name          as middle_name,'
      '       p.last_name            as last_name,'
      '       p.ssnmbr               as ssnmbr,'
      '       p.addr1                as addr1,'
      '       p.addr2                as addr2,'
      '       p.state                as state,'
      '       p.country              as country,'
      '       p.zip                  as zip,'
      '       p.phone_number         as phone_number,'
      '       p.city                 as city,'
      '       p.charge_rate          as charge_rate,'
      '       p.status_code          as status_code,'
      '       p.date_hired           as date_hired,'
      '       p.termination_date     as termination_date,'
      '       p.last_review_date     as last_review_date,'
      '       d.description          as department,'
      '       h.descrip              as job_desc,'
      '       p.next_review_date     as next_review_date'
      '  from pr_emp p,'
      '       pr_department d,'
      '       hr_job_descrip h,'
      '       pr_paygroup g'
      ' where NVL(p.PK_HIDE, '#39'N'#39') = '#39'N'#39
      '   and p.pr_paygroup_id = g.id(+)'
      '   and p.pr_department_id = d.id(+)'
      '   and p.hr_job_descrip_id = h.id(+)'
      '   '
      '   and misc.eplant_filter_include_nulls(g.eplant_id) = 1'
      ''
      ' '
      ' ')
    Left = 64
    Top = 99
    object QryEmpAllEMPNO: TStringField
      DisplayLabel = 'Emp#'
      DisplayWidth = 10
      FieldName = 'EMPNO'
      Origin = 'p.EMPNO'
      Size = 25
    end
    object QryEmpAllJOB_TITLE: TStringField
      DisplayLabel = 'Job Title'
      DisplayWidth = 30
      FieldName = 'JOB_TITLE'
      Origin = 'p.JOB_TITLE'
      Size = 30
    end
    object QryEmpAllFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 15
      FieldName = 'FIRST_NAME'
      Origin = 'p.FIRST_NAME'
      Size = 30
    end
    object QryEmpAllMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 30
      FieldName = 'MIDDLE_NAME'
      Origin = 'p.MIDDLE_NAME'
      Size = 30
    end
    object QryEmpAllLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 15
      FieldName = 'LAST_NAME'
      Origin = 'p.LAST_NAME'
      Size = 30
    end
    object QryEmpAllDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 20
      FieldName = 'DEPARTMENT'
      Size = 100
    end
    object QryEmpAllJOB_DESC: TStringField
      DisplayLabel = 'Job Description'
      DisplayWidth = 20
      FieldName = 'JOB_DESC'
      Size = 250
    end
    object QryEmpAllPHONE_NUMBER: TStringField
      DisplayLabel = 'Phone#'
      DisplayWidth = 25
      FieldName = 'PHONE_NUMBER'
      Origin = 'p.PHONE_NUMBER'
      Visible = False
      Size = 25
    end
    object QryEmpAllSSNMBR: TStringField
      DisplayLabel = 'SSN'
      DisplayWidth = 11
      FieldName = 'SSNMBR'
      Origin = 'P.SSNMBR'
      Visible = False
      Size = 11
    end
    object QryEmpAllADDR1: TStringField
      DisplayLabel = 'Address1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'p.ADDR1'
      Visible = False
      Size = 60
    end
    object QryEmpAllADDR2: TStringField
      DisplayLabel = 'Address2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'p.ADDR2'
      Visible = False
      Size = 60
    end
    object QryEmpAllCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 30
      FieldName = 'CITY'
      Origin = 'p.CITY'
      Visible = False
      Size = 30
    end
    object QryEmpAllSTATE: TStringField
      DisplayLabel = 'State or Region'
      DisplayWidth = 20
      FieldName = 'STATE'
      Origin = 'p.STATE'
      Visible = False
    end
    object QryEmpAllCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 30
      FieldName = 'COUNTRY'
      Origin = 'p.COUNTRY'
      Visible = False
      Size = 30
    end
    object QryEmpAllZIP: TStringField
      DisplayLabel = 'Postal or Zip Code'
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'p.ZIP'
      Visible = False
      Size = 10
    end
    object QryEmpAllCHARGE_RATE: TBCDField
      DisplayLabel = 'Charge Rate'
      DisplayWidth = 10
      FieldName = 'CHARGE_RATE'
      Origin = 'p.CHARGE_RATE'
      Visible = False
      Size = 2
    end
    object QryEmpAllSTATUS_CODE: TStringField
      DisplayLabel = 'Status Code'
      DisplayWidth = 10
      FieldName = 'STATUS_CODE'
      Origin = 'p.STATUS_CODE'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QryEmpAllDATE_HIRED: TDateTimeField
      DisplayLabel = 'Date Hired'
      DisplayWidth = 18
      FieldName = 'DATE_HIRED'
      Origin = 'p.DATE_HIRED'
      Visible = False
    end
    object QryEmpAllTERMINATION_DATE: TDateTimeField
      DisplayLabel = 'Date Terminated'
      DisplayWidth = 18
      FieldName = 'TERMINATION_DATE'
      Origin = 'p.TERMINATION_DATE'
      Visible = False
    end
    object QryEmpAllLAST_REVIEW_DATE: TDateTimeField
      DisplayLabel = 'Last Review Date'
      DisplayWidth = 18
      FieldName = 'LAST_REVIEW_DATE'
      Origin = 'p.LAST_REVIEW_DATE'
      Visible = False
    end
    object QryEmpAllNEXT_REVIEW_DATE: TDateTimeField
      DisplayLabel = 'Next Review Date'
      DisplayWidth = 18
      FieldName = 'NEXT_REVIEW_DATE'
      Origin = 'p.NEXT_REVIEW_DATE'
      Visible = False
    end
    object QryEmpAllBIRTH_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'BIRTH_DATE'
      Origin = 'p.BIRTH_DATE'
      Visible = False
    end
    object QryEmpAllID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'P.ID'
      Visible = False
      Size = 0
    end
  end
  object SrcEmpSkills: TDataSource
    DataSet = QryEmpSkills
    Left = 48
    Top = 163
  end
  object QryEmpSkills: TFDQuery
    Active = True
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select v.pr_emp_id as id,'
      '       v.ssnmbr as ssnmbr,'
      '       v.first_name as first_name,'
      '       v.middle_name as middle_name,'
      '       v.last_name as last_name,'
      '       v.pmskill_id as pmskill_id,'
      '       v.skill_descrip as skill_descrip,'
      '       v.skill_type as skill_type,'
      '       v.skillno as skillno,'
      '       v.training_item as training_item,'
      '       v.rev as rev,'
      '       v.effect_date as effect_date,'
      '       v.hr_training_items_id as hr_training_items_id,'
      '       v.training_due_date as training_due_date,'
      '       v.department as department'
      '  from v_hr_emp_skill_status2 v,'
      '       pr_emp p'
      ' where NVL(p.PK_HIDE, '#39'N'#39') = '#39'N'#39
      '   and p.id = v.pr_emp_id '
      '      '
      ''
      ' '
      ' '
      ' ')
    Left = 64
    Top = 163
    object QryEmpSkillsFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 30
      FieldName = 'FIRST_NAME'
      Origin = 'v.FIRST_NAME'
      Size = 30
    end
    object QryEmpSkillsMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 30
      FieldName = 'MIDDLE_NAME'
      Origin = 'v.MIDDLE_NAME'
      Size = 30
    end
    object QryEmpSkillsLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Origin = 'v.LAST_NAME'
      Size = 30
    end
    object QryEmpSkillsSKILL_DESCRIP: TStringField
      DisplayLabel = 'Skill'
      DisplayWidth = 20
      FieldName = 'SKILL_DESCRIP'
      Origin = 'v.SKILL_DESCRIP'
      Size = 60
    end
    object QryEmpSkillsSKILL_TYPE: TStringField
      DisplayLabel = 'Skill Type'
      DisplayWidth = 2
      FieldName = 'SKILL_TYPE'
      Origin = 'v.SKILL_TYPE'
      Size = 2
    end
    object QryEmpSkillsSKILLNO: TStringField
      DisplayLabel = 'Skill#'
      DisplayWidth = 10
      FieldName = 'SKILLNO'
      Origin = 'v.SKILLNO'
      FixedChar = True
      Size = 10
    end
    object QryEmpSkillsTRAINING_ITEM: TStringField
      DisplayLabel = 'Training Item'
      DisplayWidth = 20
      FieldName = 'TRAINING_ITEM'
      Origin = 'v.TRAINING_ITEM'
      Size = 250
    end
    object QryEmpSkillsREV: TStringField
      DisplayLabel = 'Revision'
      DisplayWidth = 10
      FieldName = 'REV'
      Origin = 'v.REV'
      Size = 50
    end
    object QryEmpSkillsEFFECT_DATE: TDateTimeField
      DisplayLabel = 'Effective Date'
      DisplayWidth = 18
      FieldName = 'EFFECT_DATE'
      Origin = 'v.EFFECT_DATE'
    end
    object QryEmpSkillsTRAINING_DUE_DATE: TDateTimeField
      DisplayLabel = 'Training Due Date'
      DisplayWidth = 18
      FieldName = 'TRAINING_DUE_DATE'
      Origin = 'v.TRAINING_DUE_DATE'
    end
    object QryEmpSkillsDEPARTMENT: TStringField
      DisplayLabel = 'Department'
      DisplayWidth = 20
      FieldName = 'DEPARTMENT'
      Origin = 'v.department'
      Size = 100
    end
    object QryEmpSkillsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'v.PR_EMP_ID'
      Visible = False
      Size = 0
    end
    object QryEmpSkillsSSNMBR: TStringField
      DisplayWidth = 11
      FieldName = 'SSNMBR'
      Origin = 'v.SSNMBR'
      Visible = False
      Size = 11
    end
    object QryEmpSkillsPMSKILL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PMSKILL_ID'
      Origin = 'v.PMSKILL_ID'
      Visible = False
      Size = 0
    end
    object QryEmpSkillsHR_TRAINING_ITEMS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'HR_TRAINING_ITEMS_ID'
      Origin = 'v.HR_TRAINING_ITEMS_ID'
      Visible = False
      Size = 0
    end
  end
end

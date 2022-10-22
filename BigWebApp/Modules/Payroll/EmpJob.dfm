object FrmEmpJobs: TFrmEmpJobs
  Left = 74
  Top = 168
  HelpContext = 14030
  Caption = 'Employee Jobs'
  ClientHeight = 366
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  object Splitter1: TUniSplitter
    Left = 0
    Top = 161
    Width = 389
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 389
    Height = 161
    Align = alTop
    TabOrder = 0
    UseTFields = True
    DataSource = SrcEmp
              Columns = <
                item
                  FieldName = 'EMPNO'
                  Title.Caption = 'Emp#'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'FIRST_NAME'
                  Title.Caption = 'First Name'
                  Width = 105
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'LAST_NAME'
                  Title.Caption = 'Last Name'
                  Width = 105
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end>
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 164
    Width = 389
    Height = 202
    Align = alClient
    TabOrder = 1
    object Panel2: TUniPanel
      Left = 0
      Top = 0
      Width = 389
      Height = 30
      Align = alTop
      Alignment = taLeftJustify
      Caption = 'Employee Jobs'
      TabOrder = 0
      object NavJobs: TUniDBNavigator
        Left = 148
        Top = 1
        Width = 240
        Height = 28
        DataSource = SrcEmpJobs
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
        Align = alRight
        TabOrder = 0
      end
    end
    object IQSearch2: TIQUniGridControl
      Left = 0
      Top = 30
      Width = 389
      Height = 172
      Align = alClient
      TabOrder = 1
      UseTFields = True
      DataSource = SrcEmpJobs
              Columns = <
                item
                  FieldName = 'CERT_LEVEL'
                  Title.Caption = 'Cert. Level'
                  Width = 70
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'CERT_EXPIRE_DATE'
                  Title.Caption = 'Cert. Exp. Date'
                  Width = 126
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end
                item
                  FieldName = 'DESCRIP'
                  Title.Caption = 'Job. Descrip'
                  Width = 140
                  ReadOnly = False
                  CheckBoxField.FieldValues = 'true;false'
                end>
              PendingWork.Strings = (
                'Field <CERT_EXPIRE_DATE> has custom editor <CertDate>'
                'Field <DESCRIP> has custom editor <wwDBJobs>'
                )
      object wwDBJobs: TUniEdit
        Left = 24
        Top = 112
        Width = 121
        Height = 21
        TabOrder = 3
      end
      object CertDate: TUniDBDateTimePicker
        Left = 24
        Top = 136
        Width = 121
        Height = 21
        TabOrder = 4
      end
    end
  end
  object MainMenu1: TUniMainMenu
    Left = 96
    Top = 24
    object File1: TUniMenuItem
      Caption = '&File'
      object JobDescriptions1: TUniMenuItem
        Caption = '&Job Descriptions'
        OnClick = JobDescriptions1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object Contents1: TUniMenuItem
        Caption = '&Contents'
        HelpContext = 14030
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
    Left = 48
    Top = 99
  end
  object QryEmp: TFDQuery
    CachedUpdates = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select p.id,'
      '       p.first_name,'
      '       p.last_name,'
      '       p.empno,'
      '       p.ssnmbr'
      '  from pr_emp p,'
      '       pr_paygroup g'
      ' where NVL(p.PK_HIDE, '#39'N'#39') = '#39'N'#39
      '    and p.pr_paygroup_id = g.id(+)'
      '    and misc.eplant_filter_include_nulls(g.eplant_id) = 1'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 64
    Top = 99
    object QryEmpEMPNO: TStringField
      DisplayLabel = 'Emp#'
      DisplayWidth = 10
      FieldName = 'EMPNO'
      Origin = 'P.EMPNO'
      Size = 25
    end
    object QryEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 15
      FieldName = 'FIRST_NAME'
      Origin = 'P.FIRST_NAME'
      Size = 30
    end
    object QryEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 15
      FieldName = 'LAST_NAME'
      Origin = 'P.LAST_NAME'
      Size = 30
    end
    object QryEmpID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'P.ID'
      Visible = False
      Size = 0
    end
  end
  object PkJobs: TIQWebHPick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id, descrip from HR_JOB_DESCRIP')
    Left = 176
    Top = 244
    object PkJobsID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.HR_JOB_DESCRIP.ID'
      Visible = False
      Size = 0
    end
    object PkJobsDESCRIP: TStringField
      DisplayLabel = 'Job Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.HR_JOB_DESCRIP.DESCRIP'
      Size = 250
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'GridJobs'
      'NavJobs'
      'JobDescriptions1')
    SecurityCode = 'FRMEMPJOBS'
    Left = 336
    Top = 56
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'Employee Jobs'
    Version = 'DEV.151528'
    DatabaseName = 'IQ'
    ChangeListNumber = '$Change: 195009 $'
    BuildVersion = '151528'
    Left = 296
    Top = 56
  end
  object SrcEmpJobs: TDataSource
    DataSet = QryEmpJobs
    Left = 40
    Top = 244
  end
  object QryEmpJobs: TFDQuery
    BeforeInsert = QryEmpJobsBeforeInsert
    BeforeEdit = QryEmpJobsBeforeEdit
    BeforePost = QryEmpJobsBeforePost
    AfterPost = QryEmpJobsAfterPost
    BeforeDelete = QryEmpJobsBeforeDelete
    AfterDelete = QryEmpJobsAfterPost
    MasterSource = SrcEmp
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PR_EMP_JOB'
    UpdateOptions.KeyFields = 'ID'
    UpdateObject = UpdateSQL1
    SQL.Strings = (
      'select j.id,'
      '       j.pr_emp_id,'
      '       j.hr_job_descrip_id,'
      '       j.cert_level,'
      '       j.cert_expire_date,'
      '       h.descrip'
      '  from PR_EMP_JOB j,'
      '       hr_job_descrip h'
      ' where j.hr_job_descrip_id = h.id(+)'
      '    and  j.pr_emp_id = :ID')
    Left = 56
    Top = 256
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryEmpJobsCERT_LEVEL: TBCDField
      DisplayLabel = 'Cert. Level'
      DisplayWidth = 10
      FieldName = 'CERT_LEVEL'
      Origin = 'j.CERT_LEVEL'
      Size = 0
    end
    object QryEmpJobsCERT_EXPIRE_DATE: TDateTimeField
      DisplayLabel = 'Cert. Exp. Date'
      DisplayWidth = 18
      FieldName = 'CERT_EXPIRE_DATE'
      Origin = 'j.CERT_EXPIRE_DATE'
    end
    object QryEmpJobsDESCRIP: TStringField
      DisplayLabel = 'Job. Descrip'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'h.DESCRIP'
      Size = 250
    end
    object QryEmpJobsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'j.id'
      Visible = False
      Size = 0
    end
    object QryEmpJobsPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Origin = 'j.PR_EMP_ID'
      Visible = False
      Size = 0
    end
    object QryEmpJobsHR_JOB_DESCRIP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'HR_JOB_DESCRIP_ID'
      Origin = 'j.HR_JOB_DESCRIP_ID'
      Visible = False
      Size = 0
    end
  end
  object UpdateSQL1: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into PR_EMP_JOB'
      
        '  (ID, PR_EMP_ID, HR_JOB_DESCRIP_ID, CERT_LEVEL, CERT_EXPIRE_DAT' +
        'E)'
      'values'
      '  (:ID, :PR_EMP_ID, :HR_JOB_DESCRIP_ID, :CERT_LEVEL, '
      ':CERT_EXPIRE_DATE)')
    ModifySQL.Strings = (
      'update PR_EMP_JOB'
      'set'
      '  ID = :ID,'
      '  PR_EMP_ID = :PR_EMP_ID,'
      '  HR_JOB_DESCRIP_ID = :HR_JOB_DESCRIP_ID,'
      '  CERT_LEVEL = :CERT_LEVEL,'
      '  CERT_EXPIRE_DATE = :CERT_EXPIRE_DATE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from PR_EMP_JOB'
      'where'
      '  ID = :OLD_ID')
    Left = 72
    Top = 272
  end
end

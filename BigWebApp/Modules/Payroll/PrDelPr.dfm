object FrmDelPriors: TFrmDelPriors
  Left = 45
  Top = 163
  ClientHeight = 343
  ClientWidth = 428
  Caption = 'Delete Priors'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 313
    Width = 428
    Height = 30
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 264
      Top = 1
      Width = 164
      Height = 28
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnDelete: TUniButton
        Left = 7
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Delete'
        TabOrder = 1
        OnClick = BtnDeleteClick
      end
      object BtnCancel: TUniButton
        Left = 88
        Top = 3
        Width = 75
        Height = 25
        Hint = ''
        Caption = '&Close'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object Panel3: TUniPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Caption = ''
    object Nav: TUniDBNavigator
      Left = 281
      Top = 1
      Width = 146
      Height = 25
      Hint = ''
      DataSource = SrcCheck
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 27
    Width = 428
    Height = 286
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 434
    IQComponents.Grid.Height = 434
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcCheck
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
    IQComponents.Navigator.DataSource = SrcCheck
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 434
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 434
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitLeft = 0
    IQComponents.FormTab.ExplicitTop = 0
    IQComponents.FormTab.ExplicitWidth = 256
    IQComponents.FormTab.ExplicitHeight = 128
    DataSource = SrcCheck
    Columns = <
      item
        FieldName = 'ID'
        Title.Caption = 'ID'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'AMOUNT'
        Title.Caption = 'Amount'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CHECK_NO'
        Title.Caption = 'Check#'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CHECK_DATE'
        Title.Caption = 'Check Date'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CHECK_STATUS'
        Title.Caption = 'Check Status'
        Width = 105
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ACCOUNT_NUMBER'
        Title.Caption = 'Account#'
        Width = 175
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PERIOD'
        Title.Caption = 'Period'
        Width = 70
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PR_PAYGROUP_DESCRIPTION'
        Title.Caption = 'Paygroup'
        Width = 140
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PAYPERIOD_ENDING_DATE'
        Title.Caption = 'Payperiod Ending Date'
        Width = 126
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FIRST_NAME'
        Title.Caption = 'First name'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'LAST_NAME'
        Title.Caption = 'Last name'
        Width = 210
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SSNMBR'
        Title.Caption = 'SSN'
        Width = 77
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object QryPrior: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select e.id,'
      '       e.first_name,'
      '       e.last_name,'
      '       e.ssnmbr,'
      '       e.pr_emp_id,'
      '       e.payperiod_id,'
      '       e.qtr_code,'
      '       e.cheque_id,'
      '       e.amount,'
      '       e.glperiods_id_pr,'
      '       c.check_no,'
      '       c.check_date,'
      '       c.check_status,'
      '       c.bankinfo_dtl_id,'
      '       c.void_reason,'
      '       b.account_number,'
      '       p.period,'
      '       e.pr_type,'
      '       e.pr_paygroup_description,'
      '       e.payperiod_ending_date,'
      '       e.work_period_begin,'
      '       e.work_period_end,'
      '       e.time_stamp'
      '  from pr_check_hist e,'
      '       cheque c,'
      '       bankinfo_dtl b,'
      '       glperiods p'
      ' where e.cheque_id = c.id(+)'
      '   and e.glperiods_id_pr = p.id(+)'
      '   and c.bankinfo_dtl_id = b.id(+)'
      '   and e.pr_type = '#39'PRIOR'#39
      '       '
      ' '
      ' ')
    Left = 32
    Top = 224
    object QryPriorID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'E.ID'
      Size = 0
    end
    object QryPriorAMOUNT: TBCDField
      DisplayLabel = 'Amount'
      DisplayWidth = 10
      FieldName = 'AMOUNT'
      Origin = 'E.AMOUNT'
      currency = True
      Size = 2
    end
    object QryPriorCHECK_NO: TBCDField
      DisplayLabel = 'Check#'
      DisplayWidth = 10
      FieldName = 'CHECK_NO'
      Origin = 'C.CHECK_NO'
      Size = 0
    end
    object QryPriorCHECK_DATE: TDateTimeField
      DisplayLabel = 'Check Date'
      DisplayWidth = 18
      FieldName = 'CHECK_DATE'
      Origin = 'C.CHECK_DATE'
    end
    object QryPriorCHECK_STATUS: TStringField
      DisplayLabel = 'Check Status'
      DisplayWidth = 15
      FieldName = 'CHECK_STATUS'
      Origin = 'C.CHECK_STATUS'
      Size = 15
    end
    object QryPriorACCOUNT_NUMBER: TStringField
      DisplayLabel = 'Account#'
      DisplayWidth = 25
      FieldName = 'ACCOUNT_NUMBER'
      Origin = 'B.ACCOUNT_NUMBER'
      Size = 25
    end
    object QryPriorPERIOD: TBCDField
      DisplayLabel = 'Period'
      DisplayWidth = 10
      FieldName = 'PERIOD'
      Origin = 'P.PERIOD'
      Size = 0
    end
    object QryPriorPR_PAYGROUP_DESCRIPTION: TStringField
      DisplayLabel = 'Paygroup'
      DisplayWidth = 20
      FieldName = 'PR_PAYGROUP_DESCRIPTION'
      Origin = 'E.PR_PAYGROUP_DESCRIPTION'
      Size = 50
    end
    object QryPriorPAYPERIOD_ENDING_DATE: TDateTimeField
      DisplayLabel = 'Payperiod Ending Date'
      DisplayWidth = 18
      FieldName = 'PAYPERIOD_ENDING_DATE'
      Origin = 'E.PAYPERIOD_ENDING_DATE'
    end
    object QryPriorFIRST_NAME: TStringField
      DisplayLabel = 'First name'
      DisplayWidth = 30
      FieldName = 'FIRST_NAME'
      Origin = 'E.FIRST_NAME'
      Size = 30
    end
    object QryPriorLAST_NAME: TStringField
      DisplayLabel = 'Last name'
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Origin = 'E.LAST_NAME'
      Size = 30
    end
    object QryPriorSSNMBR: TStringField
      DisplayLabel = 'SSN'
      DisplayWidth = 11
      FieldName = 'SSNMBR'
      Origin = 'E.SSNMBR'
      Size = 11
    end
    object QryPriorPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Origin = 'E.PR_EMP_ID'
      Visible = False
      Size = 0
    end
    object QryPriorPAYPERIOD_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PAYPERIOD_ID'
      Origin = 'E.PAYPERIOD_ID'
      Visible = False
      Size = 0
    end
    object QryPriorQTR_CODE: TBCDField
      DisplayWidth = 10
      FieldName = 'QTR_CODE'
      Origin = 'E.QTR_CODE'
      Visible = False
      Size = 0
    end
    object QryPriorCHEQUE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CHEQUE_ID'
      Origin = 'E.CHEQUE_ID'
      Visible = False
      Size = 0
    end
    object QryPriorGLPERIODS_ID_PR: TBCDField
      DisplayWidth = 10
      FieldName = 'GLPERIODS_ID_PR'
      Origin = 'E.GLPERIODS_ID_PR'
      Visible = False
      Size = 0
    end
    object QryPriorBANKINFO_DTL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'BANKINFO_DTL_ID'
      Origin = 'C.BANKINFO_DTL_ID'
      Visible = False
      Size = 0
    end
    object QryPriorVOID_REASON: TStringField
      DisplayWidth = 50
      FieldName = 'VOID_REASON'
      Origin = 'C.VOID_REASON'
      Visible = False
      Size = 50
    end
    object QryPriorPR_TYPE: TStringField
      DisplayWidth = 15
      FieldName = 'PR_TYPE'
      Origin = 'E.PR_TYPE'
      Visible = False
      Size = 15
    end
    object QryPriorWORK_PERIOD_BEGIN: TDateTimeField
      DisplayWidth = 18
      FieldName = 'WORK_PERIOD_BEGIN'
      Origin = 'E.WORK_PERIOD_BEGIN'
      Visible = False
    end
    object QryPriorWORK_PERIOD_END: TDateTimeField
      DisplayWidth = 18
      FieldName = 'WORK_PERIOD_END'
      Origin = 'E.WORK_PERIOD_END'
      Visible = False
    end
    object QryPriorTIME_STAMP: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TIME_STAMP'
      Origin = 'E.TIME_STAMP'
      Visible = False
    end
  end
  object SrcCheck: TDataSource
    DataSet = QryPrior
    Left = 20
    Top = 224
  end
  object procDeletePriors: TFDStoredProc
    StoredProcName = 'IQMS.PAYROLL_DELETE.IQ_DELETEPAYROLLPRIOR'
    Left = 72
    Top = 227
    ParamData = <
      item
        Name = 'V_HIST_EMP_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end>
  end
end

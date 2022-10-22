object FrmTLAttachedLaborProperties: TFrmTLAttachedLaborProperties
  Left = 172
  Top = 115
  ClientHeight = 275
  ClientWidth = 314
  Caption = 'Properties'
  OnShow = FormShow
  BorderStyle = bsSizeToolWin
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object wwDataInspector1: TwwDataInspector
    Left = 0
    Top = 0
    Width = 314
    Height = 275
    DisableThemes = False
    Align = alClient
    TabOrder = 0
    DataSource = SrcLabor
    Items = <
      item
        DataSource = SrcLabor
        DataField = 'CREATED'
        Caption = 'Record Created'
        ReadOnly = True
        Options = []
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'LABOR_HRS'
        Caption = 'Labor Hours'
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'EMPLOYEE'
        Caption = 'Employee'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'EMP_CHARGE_RATE'
        Caption = 'Employee Charge Rate'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'CHARGE_RATE'
        Caption = 'Charge Rate Used'
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'DESCRIPTION'
        Caption = 'Pay Type'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'RATE'
        Caption = 'Rate'
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'NOTES'
        Caption = 'Notes'
        Resizeable = True
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'DETAILNO'
        Caption = 'Detail #'
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'POSTING_SOURCE'
        Caption = 'Posting Source'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        Caption = 'DataSet Record Information'
        EditText = '<DBA use only>'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'ID'
        Caption = 'Record ID'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'PR_EMP_ID'
        Caption = 'Employee Record ID'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'SOURCE'
        Caption = 'Owner Table Source'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'SOURCE_ID'
        Caption = 'Owner Table Source ID'
        ReadOnly = True
        WordWrap = False
      end
      item
        DataSource = SrcLabor
        DataField = 'PK_HIDE'
        Caption = 'Hidden'
        ReadOnly = True
        WordWrap = False
      end>
    CaptionWidth = 158
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
    OnKeyDown = wwDataInspector1KeyDown
  end
  object SrcLabor: TDataSource
    DataSet = QryLabor
    Left = 104
    Top = 32
  end
  object QryLabor: TFDQuery
    BeforeOpen = QryLaborBeforeOpen
    AfterOpen = QryLaborAfterOpen
    BeforeInsert = QryLaborBeforeInsert
    AfterPost = QryLaborAfterPost
    CachedUpdates = True
    OnUpdateRecord = QryLaborUpdateRecord
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.UpdateTableName = 'EMP_LABOR'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select'
      '    e.id,'
      '    e.labor_hrs,'
      '    e.notes,'
      '    e.pr_emp_id,'
      '    e.end_date,'
      '    e.detailno,'
      '    e.pr_paytype_id,'
      '    e.rate,'
      '    e.source_id,'
      '    NVL( e.charge_rate, 0 ) as charge_rate,'
      '    e.start_date,'
      '    NVL( e.pk_hide, '#39'N'#39' ) as pk_hide,'
      '    e.source,'
      '    e.created,'
      '    p.empno,'
      '    p.first_name,'
      '    p.last_name,'
      
        '    RTrim(LTrim( RTrim( p.first_name )) || '#39' '#39' || LTrim( p.last_' +
        'name )) as employee,'
      '    p.charge_rate as emp_charge_rate,'
      '    t.description,'
      '    e.posting_source'
      'from'
      '    emp_labor e,'
      '    pr_emp p,'
      '    pr_paytype t'
      'where'
      '    p.id(+) = e.pr_emp_id and'
      '    t.id(+) = e.pr_paytype_id and'
      '    e.id = :id'
      ''
      ' '
      ' ')
    Left = 112
    Top = 48
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryLaborLABOR_HRS: TFMTBCDField
      FieldName = 'LABOR_HRS'
      Size = 6
    end
    object QryLaborNOTES: TStringField
      FieldName = 'NOTES'
      Size = 4000
    end
    object QryLaborPR_EMP_ID: TBCDField
      FieldName = 'PR_EMP_ID'
      Size = 0
    end
    object QryLaborDETAILNO: TStringField
      FieldName = 'DETAILNO'
      Size = 25
    end
    object QryLaborPR_PAYTYPE_ID: TBCDField
      FieldName = 'PR_PAYTYPE_ID'
      Size = 0
    end
    object QryLaborRATE: TFMTBCDField
      FieldName = 'RATE'
      Size = 6
    end
    object QryLaborSOURCE_ID: TBCDField
      FieldName = 'SOURCE_ID'
      Size = 0
    end
    object QryLaborCHARGE_RATE: TFMTBCDField
      FieldName = 'CHARGE_RATE'
      Size = 38
    end
    object QryLaborPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      FixedChar = True
      Size = 1
    end
    object QryLaborSOURCE: TStringField
      FieldName = 'SOURCE'
      Size = 50
    end
    object QryLaborCREATED: TDateTimeField
      FieldName = 'CREATED'
    end
    object QryLaborEMPNO: TStringField
      FieldName = 'EMPNO'
      Size = 25
    end
    object QryLaborFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object QryLaborLAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object QryLaborEMPLOYEE: TStringField
      FieldName = 'EMPLOYEE'
      Size = 61
    end
    object QryLaborEMP_CHARGE_RATE: TBCDField
      FieldName = 'EMP_CHARGE_RATE'
      Size = 2
    end
    object QryLaborDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 50
    end
    object QryLaborID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryLaborPOSTING_SOURCE: TStringField
      FieldName = 'POSTING_SOURCE'
      Size = 10
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'QryLaborCHARGE_RATE'
      'QryLaborEMP_CHARGE_RATE'
      'QryLaborDETAILNO'
      'QryLaborRATE'
      'QryLaborNOTES'
      'QryLaborLABOR_HRS')
    SecurityCode = 'FRMTLATTACHEDLABORPROPERTIES'
    Left = 152
    Top = 144
  end
end

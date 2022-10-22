object FrmTASelEmpViol: TFrmTASelEmpViol
  Left = 99
  Top = 200
  ClientHeight = 382
  ClientWidth = 693
  Caption = 'Select Employee'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 693
    Height = 331
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
    IQComponents.Grid.Width = 476
    IQComponents.Grid.Height = 245
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = Src
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
    IQComponents.Navigator.DataSource = Src
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 476
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 245
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = Src
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
        FieldName = 'EMPNO'
        Title.Caption = 'Employee #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BADGENO'
        Title.Caption = 'Badge #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 331
    Width = 693
    Height = 51
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 434
      Top = 1
      Width = 259
      Height = 49
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object BtnOk: TUniButton
        Left = 6
        Top = 10
        Width = 120
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        TabOrder = 1
        OnClick = BtnOkClick
      end
      object BtnCancel: TUniButton
        Left = 132
        Top = 10
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = BtnCancelClick
      end
    end
  end
  object Src: TDataSource
    DataSet = Qry
    Left = 128
    Top = 96
  end
  object Qry: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.id as pr_emp_id,'
      '       p.first_name,'
      '       p.middle_name,'
      '       p.last_name,'
      '       p.empno,'
      '       p.ssnmbr,'
      '       p.badgeno     '
      '  from pr_emp p,'
      '       pr_paygroup g'
      ' where p.id <> :AId1'
      '   and p.id not in (select pr_emp_id from PR_EMP_TA_VIOL_HDR)'
      '   and NVL(p.PK_HIDE, '#39'N'#39') = '#39'N'#39
      '   and p.pr_paygroup_id = g.id(+)'
      '   and misc.eplant_filter_include_nulls(g.eplant_id) = 1'
      
        '   and ta_misc.CheckSupervisionAndPaygroup(misc.getusername, p.p' +
        'r_paygroup_id, p.id, p.supervisor_id, :AShowAll) = 1   '
      '   and (p.pr_paygroup_id is null '
      '        or p.pr_paygroup_id in (select pr_paygroup_id '
      '                                  from s_user_paygroup '
      
        '                                 where misc.GetUserName = user_n' +
        'ame))'
      '')
    Left = 168
    Top = 96
    ParamData = <
      item
        Name = 'AId1'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'AShowAll'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 30
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Size = 30
    end
    object QryMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 30
      FieldName = 'MIDDLE_NAME'
      Origin = 'MIDDLE_NAME'
      Size = 30
    end
    object QryLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Size = 30
    end
    object QryEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 25
      FieldName = 'EMPNO'
      Origin = 'EMPNO'
      Size = 25
    end
    object QryBADGENO: TStringField
      DisplayLabel = 'Badge #'
      DisplayWidth = 25
      FieldName = 'BADGENO'
      Origin = 'BADGENO'
      Size = 25
    end
    object QrySSNMBR: TStringField
      DisplayLabel = 'SSN'
      DisplayWidth = 11
      FieldName = 'SSNMBR'
      Origin = 'SSNMBR'
      Visible = False
      Size = 11
    end
    object QryPR_EMP_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID'
      Origin = 'ID'
      Visible = False
      Size = 0
    end
  end
end

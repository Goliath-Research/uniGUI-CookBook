object FrmTASelEmpPR: TFrmTASelEmpPR
  Left = 277
  Top = 187
  ClientHeight = 309
  ClientWidth = 523
  Caption = 'Select Employees to Post to the Payroll'
  OnShow = FormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -14
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TUniPanel
    Left = 0
    Top = 258
    Width = 523
    Height = 51
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    object Panel2: TUniPanel
      Left = 256
      Top = 1
      Width = 267
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
      object btnCancel: TUniButton
        Left = 138
        Top = 10
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&Cancel'
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object btnOk: TUniButton
        Left = 10
        Top = 10
        Width = 119
        Height = 31
        Hint = ''
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = '&OK'
        TabOrder = 2
        OnClick = btnOkClick
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 523
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
    Font.Height = -14
    TabOrder = 1
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 306
    IQComponents.Grid.Height = 172
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
    IQComponents.HiddenPanel.Left = 306
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 172
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 139
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 168
    DataSource = SrcEmp
    Columns = <
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
      end>
    ExplicitTop = 33
    ExplicitHeight = 225
    Marker = 0
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
      'select distinct l.pr_emp_id as id,'
      '                p.first_name,'
      '                p.middle_name,'
      '                p.last_name,'
      '                p.empno,'
      '                p.ssnmbr'
      '  from   pr_emp p,'
      '         TA_PREPOST_LOG l,'
      '         TA_PREPOST_CONTROL c'
      ' where l.pr_emp_id = p.id'
      '   and l.ta_prepost_control_id = c.id'
      '   and c.id = 1'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 64
    Top = 99
    object QryEmpEMPNO: TStringField
      DisplayLabel = 'Employee #'
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
    object QryEmpMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 30
      FieldName = 'MIDDLE_NAME'
      Origin = 'p.MIDDLE_NAME'
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
      Origin = 'L.PR_EMP_ID'
      Visible = False
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOk'
      'navEmp'
      'IQSearch1'
      'QryEmp'
      '')
    SecurityCode = 'FRMTASELEMPPR'
    Left = 104
    Top = 99
  end
end

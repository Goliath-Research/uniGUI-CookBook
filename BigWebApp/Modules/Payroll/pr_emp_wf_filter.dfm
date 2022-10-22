inherited FrmPrEmpWorkflowFilter: TFrmPrEmpWorkflowFilter
  ClientHeight = 211
  ClientWidth = 254
  ExplicitWidth = 260
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox1: TUniGroupBox [0]
    Left = 0
    Top = 172
    Width = 77
    Height = 31
    Enabled = False
    Visible = False
    ExplicitLeft = 0
    ExplicitTop = 172
    ExplicitWidth = 77
    ExplicitHeight = 31
    inherited rbtnCustOne: TUniRadioButton
      Left = 41
      Top = 17
      ExplicitLeft = 41
      ExplicitTop = 17
    end
    inherited wwDBLookupComboArcusto: TUniDBLookupComboBox
      Left = 13
      Top = 40
      Width = 97
      ExplicitLeft = 13
      ExplicitTop = 40
      ExplicitWidth = 97
    end
  end
  inherited btnOK: TUniButton [1]
  end
  inherited btnCancel: TUniButton [2]
  end
  object GroupBox3: TUniGroupBox [4]
    Left = 4
    Top = 2
    Width = 242
    Height = 87
    Hint = ''
    Caption = '  Employees  '
    TabOrder = 4
    object rbtnEmpAll: TUniRadioButton
      Left = 12
      Top = 17
      Width = 113
      Height = 17
      Hint = ''
      Caption = 'All'
      TabOrder = 0
      OnClick = EnableControlEmpDropDown
    end
    object rbtnEmpOne: TUniRadioButton
      Left = 12
      Top = 37
      Width = 113
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'One Employee'
      TabOrder = 1
      OnClick = EnableControlEmpDropDown
    end
    object wwDBLookupComboEmp: TUniDBLookupComboBox
      Left = 28
      Top = 57
      Width = 198
      Height = 21
      Hint = ''
      ListField = 'EMPNO'
      ListSource = SrcPrEmp
      KeyField = 'ID'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  object QryPrEmp: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select e.empno as empno,'
      '       e.first_name as first_name,'
      '       e.last_name as last_name,'
      '       e.id as id'
      '  from pr_emp e'
      ' where nvl(e.pk_hide, '#39'N'#39') <> '#39'Y'#39
      'order by empno')
    Left = 200
    Top = 16
    object QryPrEmpEMPNO: TStringField
      DisplayLabel = 'Employee #'
      DisplayWidth = 25
      FieldName = 'EMPNO'
      Size = 25
    end
    object QryPrEmpFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 30
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object QryPrEmpLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object QryPrEmpID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object SrcPrEmp: TDataSource
    DataSet = QryPrEmp
    Left = 120
    Top = 104
  end
end

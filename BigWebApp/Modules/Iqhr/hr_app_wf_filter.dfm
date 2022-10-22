inherited FrmHrAppWorkflowFilter: TFrmHrAppWorkflowFilter
  ExplicitWidth = 258
  ExplicitHeight = 234
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox1: TUniGroupBox
    Caption = '  Applicants  '
    inherited rbtnCustOne: TUniRadioButton
      Caption = 'One applicant'
    end
  end
  object QryHrApp: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select '
      '       a.last_name as last_name,'
      '       a.first_name as first_name,'
      '       a.id'
      '  from hr_app a'
      ' where nvl(a.pk_hide,'#39'N'#39') <> '#39'Y'#39
      '')
    Left = 176
    Top = 16
    object QryHrAppLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 30
      FieldName = 'LAST_NAME'
      Size = 30
    end
    object QryHrAppFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 30
      FieldName = 'FIRST_NAME'
      Size = 30
    end
    object QryHrAppID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
end

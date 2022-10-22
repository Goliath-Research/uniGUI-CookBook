inherited FrmWorkflowFilterPO: TFrmWorkflowFilterPO
  ClientHeight = 210
  ClientWidth = 256
  ExplicitWidth = 262
  ExplicitHeight = 239
  PixelsPerInch = 96
  TextHeight = 13
  inherited GroupBox1: TUniGroupBox
    Left = 15
    Top = 171
    Width = 69
    Height = 25
    Visible = False
    Caption = ''
    ExplicitLeft = 15
    ExplicitTop = 171
    ExplicitWidth = 69
    ExplicitHeight = 25
    inherited rbtnCustAll: TUniRadioButton
      Left = -3
      Top = 7
      ExplicitLeft = -3
      ExplicitTop = 7
    end
    inherited rbtnCustOne: TUniRadioButton
      Left = 29
      Top = 8
      Width = 10
      ExplicitLeft = 29
      ExplicitTop = 8
      ExplicitWidth = 10
    end
    inherited wwDBLookupComboArcusto: TUniDBLookupComboBox
      Left = 40
      Top = 7
      Width = 20
      ExplicitLeft = 40
      ExplicitTop = 7
      ExplicitWidth = 20
    end
  end
  inherited GroupBox2: TUniGroupBox
    inherited rbtnShowOpen: TUniRadioButton
      Width = 155
      ExplicitWidth = 155
    end
    inherited rbtnShowClosed: TUniRadioButton
      Width = 176
      ExplicitWidth = 176
    end
  end
  object GroupBox3: TUniGroupBox [4]
    Left = 5
    Top = 2
    Width = 242
    Height = 87
    Hint = ''
    Caption = '  Vendors  '
    TabOrder = 4
    object rbtnVendAll: TUniRadioButton
      Left = 12
      Top = 17
      Width = 113
      Height = 17
      Hint = ''
      Caption = 'All'
      TabOrder = 0
      OnClick = EnableControlVendDropDown
    end
    object rbtnVendOne: TUniRadioButton
      Left = 12
      Top = 37
      Width = 113
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'One vendor'
      TabOrder = 1
      OnClick = EnableControlVendDropDown
    end
    object wwDBLookupComboVendor: TUniDBLookupComboBox
      Left = 28
      Top = 57
      Width = 198
      Height = 21
      Hint = ''
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  inherited QryArcusto: TFDQuery
    Tag = 1
  end
  object QryVendor: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, vendorno, company from vendor order by vendorno')
    Left = 62
    Top = 174
    object QryVendorVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      Origin = 'IQ.VENDOR.VENDORNO'
      FixedChar = True
      Size = 10
    end
    object QryVendorCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'IQ.VENDOR.COMPANY'
      FixedChar = True
      Size = 60
    end
    object QryVendorID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.VENDOR.ID'
      Visible = False
      Size = 0
    end
  end
end

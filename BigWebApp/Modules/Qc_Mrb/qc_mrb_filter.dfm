inherited FrmWorkflowFilterMRB: TFrmWorkflowFilterMRB
  ClientHeight = 373
  Caption = 'Workflow MRB Filter'
  ExplicitWidth = 258
  ExplicitHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnOK: TUniButton
    Top = 330
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 330
  end
  inherited btnCancel: TUniButton
    Top = 330
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 330
  end
  inherited GroupBox1: TUniGroupBox
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    inherited rbtnCustAll: TUniRadioButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited rbtnCustOne: TUniRadioButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited wwDBLookupComboArcusto: TUniDBLookupComboBox
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ListField = 'CUSTNO'
      ListSource = SrcQryArcusto
      KeyField = 'COMPANY'
    end
  end
  inherited GroupBox2: TUniGroupBox
    Top = 219
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 219
    inherited rbtnShowAll: TUniRadioButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited rbtnShowOpen: TUniRadioButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
    inherited rbtnShowClosed: TUniRadioButton
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
    end
  end
  object t: TUniGroupBox [4]
    Left = 5
    Top = 98
    Width = 298
    Height = 107
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '  Vendors  '
    TabOrder = 4
    object rbtnVendAll: TUniRadioButton
      Left = 0
      Top = 17
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'All'
      TabOrder = 0
      OnClick = EnableControlVendDropDown
    end
    object rbtnVendOne: TUniRadioButton
      Left = 15
      Top = 46
      Width = 139
      Height = 20
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Checked = True
      Caption = 'One vendor'
      TabOrder = 1
      OnClick = EnableControlVendDropDown
    end
    object wwDBLookupComboVendor: TUniDBLookupComboBox
      Left = 34
      Top = 70
      Width = 244
      Height = 24
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListField = 'VENDORNO'
      ListSource = SrcQryVendor
      KeyField = 'COMPANY'
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  inherited QryArcusto: TFDQuery
    Left = 166
    Top = 245
  end
  object QryVendor: TFDQuery
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, vendorno, company from vendor order by vendorno')
    Left = 209
    Top = 245
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
  object SrcQryArcusto: TDataSource
    DataSet = QryArcusto
    Left = 112
    Top = 184
  end
  object SrcQryVendor: TDataSource
    DataSet = QryVendor
    Left = 184
    Top = 200
  end
end

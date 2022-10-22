inherited FrmWorkflowFilterDev: TFrmWorkflowFilterDev
  ClientHeight = 362
  ClientWidth = 327
  Caption = 'Workflow Deviation Filter'
  OldCreateOrder = True
  ExplicitWidth = 333
  ExplicitHeight = 391
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnOK: TUniButton
    Top = 325
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 325
  end
  inherited btnCancel: TUniButton
    Top = 325
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ExplicitTop = 325
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
      Caption = 'All deviations'
    end
    inherited rbtnShowOpen: TUniRadioButton
      Width = 208
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Open deviations'
      ExplicitWidth = 208
    end
    inherited rbtnShowClosed: TUniRadioButton
      Width = 194
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Terminated deviations'
      ExplicitWidth = 194
    end
  end
  object GroupBox3: TUniGroupBox [4]
    Left = 6
    Top = 111
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
      Left = 15
      Top = 21
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
      ListSource = DataSource2
      ListFieldIndex = 0
      TabOrder = 2
      Color = clWindow
    end
  end
  inherited QryArcusto: TFDQuery
    Left = 182
    Top = 253
  end
  object QryVendor: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, vendorno, company from vendor order by vendorno')
    Left = 217
    Top = 253
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
  object DataSource2: TDataSource
    DataSet = QryVendor
    Left = 88
    Top = 240
  end
end

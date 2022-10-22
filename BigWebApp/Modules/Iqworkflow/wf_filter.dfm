object FrmWorkflowFilter: TFrmWorkflowFilter
  Left = 134
  Top = 171
  ClientHeight = 206
  ClientWidth = 252
  Caption = 'Workflow Filter'
  OnShow = UniFormShow
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnOK: TUniButton
    Left = 45
    Top = 176
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 149
    Top = 176
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object GroupBox1: TUniGroupBox
    Left = 5
    Top = 2
    Width = 242
    Height = 87
    Hint = ''
    Caption = '  Customers  '
    TabOrder = 2
    object rbtnCustAll: TUniRadioButton
      Left = 12
      Top = 17
      Width = 113
      Height = 17
      Hint = ''
      Caption = 'All'
      TabOrder = 0
      OnClick = EnableControlCustDropDown
    end
    object rbtnCustOne: TUniRadioButton
      Left = 12
      Top = 37
      Width = 113
      Height = 17
      Hint = ''
      Checked = True
      Caption = 'One customer'
      TabOrder = 1
      OnClick = EnableControlCustDropDown
    end
    object wwDBLookupComboArcusto: TUniDBLookupComboBox
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
  object GroupBox2: TUniGroupBox
    Left = 5
    Top = 90
    Width = 242
    Height = 85
    Hint = ''
    Caption = '  Showing  '
    TabOrder = 3
    object rbtnShowAll: TUniRadioButton
      Left = 12
      Top = 17
      Width = 178
      Height = 17
      Hint = ''
      Caption = 'All workflows'
      TabOrder = 0
    end
    object rbtnShowOpen: TUniRadioButton
      Left = 12
      Top = 36
      Width = 113
      Height = 17
      Hint = ''
      Caption = 'Open workflows'
      TabOrder = 1
    end
    object rbtnShowClosed: TUniRadioButton
      Left = 12
      Top = 55
      Width = 113
      Height = 17
      Hint = ''
      Caption = 'Closed workflows'
      TabOrder = 2
    end
  end
  object QryArcusto: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, custno, company from arcusto order by custno')
    Left = 6
    Top = 173
    object QryArcustoCUSTNO: TStringField
      DisplayLabel = 'Cust #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      Origin = 'IQ.ARCUSTO.CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryArcustoCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'COMPANY'
      Origin = 'IQ.ARCUSTO.COMPANY'
      FixedChar = True
      Size = 60
    end
    object QryArcustoID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.ARCUSTO.ID'
      Visible = False
      Size = 0
    end
  end
end

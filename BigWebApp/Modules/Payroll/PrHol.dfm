object FrmPrHoliday: TFrmPrHoliday
  Left = 120
  Top = 187
  ClientHeight = 119
  ClientWidth = 212
  Caption = 'Paytype Info'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  DesignSize = (
    212
    119)
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TUniLabel
    Left = 5
    Top = 14
    Width = 77
    Height = 13
    Hint = ''
    Caption = 'Production Date'
    TabOrder = 3
  end
  object Label6: TUniLabel
    Left = 4
    Top = 39
    Width = 42
    Height = 13
    Hint = ''
    Caption = 'PayType'
    TabOrder = 4
  end
  object Label7: TUniLabel
    Left = 6
    Top = 64
    Width = 28
    Height = 13
    Hint = ''
    Caption = 'Hours'
    TabOrder = 5
  end
  object dtProddate: TUniDateTimePicker
    Left = 87
    Top = 10
    Width = 85
    Height = 21
    Hint = ''
    DateTime = 42619.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 0
  end
  object DbHolHours: TUniDBNumberEdit
    Left = 88
    Top = 60
    Width = 50
    Height = 21
    Hint = ''
    DataField = 'DAILY_ONE_AFTER'
    TabOrder = 1
    DecimalSeparator = '.'
  end
  object dbHolPayType: TUniDBLookupComboBox
    Left = 87
    Top = 35
    Width = 121
    Height = 21
    Hint = ''
    ListField = 'DESCRIPTION'
    ListSource = DataSource1
    KeyField = 'ID'
    ListFieldIndex = 0
    TabOrder = 2
    Color = clWindow
  end
  object BtnCancel: TUniButton
    Left = 53
    Top = 91
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&Cancel'
    ModalResult = 2
    Anchors = [akRight, akBottom]
    TabOrder = 6
  end
  object BtnOk: TUniButton
    Left = 133
    Top = 91
    Width = 75
    Height = 25
    Hint = ''
    Caption = '&Ok'
    Anchors = [akRight, akBottom]
    TabOrder = 7
    OnClick = BtnOkClick
  end
  object QryPayType: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select * from pr_paytype'
      '  where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39)
    Left = 24
    Top = 40
    object QryPayTypeDESCRIPTION: TStringField
      DisplayLabel = 'PayType'
      DisplayWidth = 20
      FieldName = 'DESCRIPTION'
      Origin = 'PR_PAYTYPE.DESCRIPTION'
      Size = 50
    end
    object QryPayTypeID: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      ProviderFlags = []
      Required = True
      Precision = 15
      Size = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = QryPayType
    Left = 152
    Top = 72
  end
end

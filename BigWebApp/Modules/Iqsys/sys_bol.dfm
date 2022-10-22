object FrmBolParams: TFrmBolParams
  Left = 677
  Top = 215
  HelpContext = 1067544
  ClientHeight = 138
  ClientWidth = 358
  Caption = 'BOL Parameters'
  BorderStyle = bsDialog
  OldCreateOrder = False
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 9
    Top = 12
    Width = 341
    Height = 86
    Hint = ''
    TabOrder = 3
    Caption = ''
  end
  object DBCheckBox1: TUniDBCheckBox
    Left = 22
    Top = 21
    Width = 314
    Height = 17
    Hint = 
      'Check to calculate BOL weight based on individual component weig' +
      'hts'
    ShowHint = True
    ParentShowHint = False
    DataField = 'BOL_CALC_INDIVIDUAL'
    DataSource = DataSource1
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
    Caption = 'BOL weight is based on individual component weights'
    TabOrder = 0
    OnClick = DBCheckBox1Click
  end
  object btnOK: TUniButton
    Left = 147
    Top = 105
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOKClick
  end
  object btnCancel: TUniButton
    Left = 253
    Top = 105
    Width = 97
    Height = 25
    Hint = ''
    Caption = 'Cancel'
    Cancel = True
    ModalResult = 2
    TabOrder = 5
  end
  object cbxBOLSigRequired: TUniDBCheckBox
    Left = 22
    Top = 70
    Width = 314
    Height = 17
    Hint = ''
    ShowHint = True
    ParentShowHint = False
    DataField = 'IS_BOL_SIG_REQUIRED'
    DataSource = srcIQSys2
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
    Caption = 'BOL Signature Required'
    TabOrder = 2
  end
  object DBCheckBox2: TUniDBCheckBox
    Left = 39
    Top = 44
    Width = 284
    Height = 17
    Hint = 'BOL is based on serialized labels volume and weight'
    ShowHint = True
    ParentShowHint = False
    DataField = 'BOL_CALC_LABEL_BASED'
    DataSource = DataSource1
    ValueChecked = 'Y'
    ValueUnchecked = 'N'
    Caption = 'Use serialized labels volume && weight'
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = tblParams
    Left = 23
    Top = 97
  end
  object tblParams: TFDTable
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'PARAMS'
    TableName = 'PARAMS'
    Left = 24
    Top = 112
  end
  object srcIQSys2: TDataSource
    DataSet = tblIQSys2
    Left = 71
    Top = 97
  end
  object tblIQSys2: TFDTable
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'IQSYS2'
    TableName = 'IQSYS2'
    Left = 72
    Top = 112
    object tblIQSys2IS_BOL_SIG_REQUIRED: TStringField
      DisplayLabel = 'BOL Signature Required'
      FieldName = 'IS_BOL_SIG_REQUIRED'
      Size = 1
    end
  end
end

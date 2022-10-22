object FrmApTax: TFrmApTax
  Left = 51
  Top = 195
  ClientHeight = 178
  ClientWidth = 466
  Caption = 'AP Tax Elements'
  OldCreateOrder = False
  OnClose = FormClose
  Menu = MainMenu1
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 27
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Nav: TUniDBNavigator
      Left = 240
      Top = 1
      Width = 225
      Height = 25
      Hint = ''
      DataSource = SrcTax
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
      ConfirmDelete = False
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Grid: TUniDBGrid
    Left = 0
    Top = 27
    Width = 466
    Height = 151
    Hint = ''
    DataSource = SrcTax
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ParentColor = False
    Color = clBtnFace
    Columns = <
      item
        FieldName = 'DESCRIP'
        Title.Caption = 'Tax Element'
        Width = 64
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TAX_RATE'
        Title.Caption = 'Original Tax Rate'
        Width = 99
        ReadOnly = True
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TAX_AMOUNT'
        Title.Caption = 'Tax Amount'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'glAcct'
        Title.Caption = 'GL Account'
        Width = 124
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
  object MainMenu1: TUniMainMenu
    Left = 184
    Top = 56
    object File1: TUniMenuItem
      Caption = '&File'
      object TaxCodes1: TUniMenuItem
        Caption = 'Tax Codes'
        OnClick = TaxCodes1Click
      end
      object N1: TUniMenuItem
        Caption = '-'
      end
      object Exit1: TUniMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TUniMenuItem
      Caption = '&Help'
      object About1: TUniMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
  object SrcTax: TDataSource
    DataSet = TblTax
    Left = 16
    Top = 72
  end
  object TblTax: TFDTable
    BeforeInsert = TblTaxBeforeInsert
    AfterPost = TblTaxAfterPost
    BeforeDelete = TblTaxBeforeDelete
    IndexFieldNames = 'APPREPOST_DETAIL_ID'
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'APPREPOST_TAX'
    TableName = 'APPREPOST_TAX'
    Left = 32
    Top = 72
    object TblTaxID: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object TblTaxAPPREPOST_DETAIL_ID: TBCDField
      FieldName = 'APPREPOST_DETAIL_ID'
      Size = 0
    end
    object TblTaxDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 60
    end
    object TblTaxTAX_RATE: TFMTBCDField
      FieldName = 'TAX_RATE'
      Size = 6
    end
    object TblTaxGLACCT_ID: TBCDField
      FieldName = 'GLACCT_ID'
      Size = 0
    end
    object TblTaxTAX_AMOUNT: TFMTBCDField
      FieldName = 'TAX_AMOUNT'
      DisplayFormat = '###,###,###,##0.000'
      Size = 6
    end
    object TblTaxglAcct: TStringField
      FieldKind = fkLookup
      FieldName = 'glAcct'
      LookupDataSet = QryGlAcct
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'GLACCT_ID'
      Lookup = True
    end
  end
  object QryGlAcct: TFDQuery
    Filtered = True
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id, eplant_id, acct, descrip from glacct'
      'where NVL(PK_HIDE, '#39'N'#39') = '#39'N'#39
      'and misc.eplant_filter(eplant_id) = 1'
      'order by acct')
    Left = 80
    Top = 71
    object QryGlAcctACCT: TStringField
      DisplayLabel = 'Account'
      DisplayWidth = 15
      FieldName = 'ACCT'
      Origin = 'GLACCT.ACCT'
      Size = 50
    end
    object QryGlAcctDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 20
      FieldName = 'DESCRIP'
      Origin = 'GLACCT.DESCRIP'
      Size = 50
    end
    object QryGlAcctEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'GLACCT.EPLANT_ID'
      Size = 0
    end
    object QryGlAcctID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'GLACCT.ID'
      Visible = False
      Size = 0
    end
  end
  object PKTax: TIQWebHpick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id as id,'
      '       tax_code as tax_code,'
      '       tax_code_desc as tax_code_desc,'
      '       tax_rate as tax_rate    '
      '  from v_tax_codes'
      '')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 224
    Top = 56
    object PKTaxID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.V_TAX_CODES.ID'
      Visible = False
      Size = 0
    end
    object PKTaxTAX_CODE: TStringField
      DisplayLabel = 'Tax Code'
      FieldName = 'TAX_CODE'
      Origin = 'IQ.V_TAX_CODES.TAX_CODE'
    end
    object PKTaxTAX_CODE_DESC: TStringField
      DisplayLabel = 'Tax Code Description'
      FieldName = 'TAX_CODE_DESC'
      Origin = 'IQ.V_TAX_CODES.TAX_CODE_DESC'
      Size = 50
    end
    object PKTaxTAX_RATE: TFMTBCDField
      DisplayLabel = 'Tax Rate'
      FieldName = 'TAX_RATE'
      Origin = 'IQ.V_TAX_CODES.TAX_RATE'
      Size = 38
    end
  end
  object IQAbout1: TIQWebAbout
    ModuleName = 'AP/AR Tax Elements'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 195715 $'
    BuildVersion = '176554'
    Left = 256
    Top = 56
  end
  object QryPosted: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       apinvoice_detail_id,'
      '       descrip,'
      '       tax_rate,'
      '       glacct_id,'
      '       acct as glacct,'
      '       tax_amount'
      '  from apinvoice_tax'
      ' where apinvoice_detail_id = :AId'
      ''
      ' ')
    Left = 32
    Top = 120
    ParamData = <
      item
        Name = 'AId'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object QryVoided: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       apinvoice_detail_void_id,'
      '       descrip,'
      '       tax_rate,'
      '       glacct_id,'
      '       acct as glacct,'
      '       tax_amount'
      '  from apinvoice_void_tax'
      ' where apinvoice_detail_void_id = :AId'
      ''
      ' ')
    Left = 72
    Top = 120
    ParamData = <
      item
        Name = 'AId'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object TblARTax: TFDTable
    BeforeInsert = TblTaxBeforeInsert
    BeforePost = TblARTaxBeforePost
    AfterPost = TblARTaxAfterPost
    BeforeDelete = TblTaxBeforeDelete
    IndexFieldNames = 'ARPREPOST_DETAIL_ID'
    MasterFields = 'ID'
    Connection = UniMainModule.FDConnection1
    UpdateOptions.UpdateTableName = 'ARPREPOST_TAX'
    TableName = 'ARPREPOST_TAX'
    Left = 176
    Top = 112
    object FloatField1: TBCDField
      FieldName = 'ID'
      Required = True
      Size = 0
    end
    object StringField1: TStringField
      FieldName = 'DESCRIP'
      Size = 60
    end
    object FloatField3: TFMTBCDField
      FieldName = 'TAX_RATE'
      Size = 6
    end
    object FloatField4: TBCDField
      FieldName = 'GLACCT_ID'
      Size = 0
    end
    object FloatField5: TFMTBCDField
      FieldName = 'TAX_AMOUNT'
      DisplayFormat = '###,###,###,##0.000'
      Size = 6
    end
    object StringField2: TStringField
      FieldKind = fkLookup
      FieldName = 'glAcct'
      LookupDataSet = QryGlAcct
      LookupKeyFields = 'ID'
      LookupResultField = 'ACCT'
      KeyFields = 'GLACCT_ID'
      Lookup = True
    end
    object TblARTaxARPREPOST_DETAIL_ID: TBCDField
      FieldName = 'ARPREPOST_DETAIL_ID'
      Size = 0
    end
  end
  object QryUsePosted: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       apinvoice_detail_id,'
      '       descrip,'
      '       tax_rate,'
      '       glacct_id,'
      '       acct as glacct,'
      '       tax_amount'
      '  from apinvoice_use_tax'
      ' where apinvoice_detail_id = :AId'
      ''
      ' ')
    Left = 248
    Top = 120
    ParamData = <
      item
        Name = 'AId'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  object QryUseVoided: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       apinvoice_detail_void_id,'
      '       descrip,'
      '       tax_rate,'
      '       glacct_id,'
      '       acct as glacct,'
      '       tax_amount'
      '  from apinvoice_void_use_tax'
      ' where apinvoice_detail_void_id = :AId'
      ''
      ' ')
    Left = 336
    Top = 120
    ParamData = <
      item
        Name = 'AId'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
end

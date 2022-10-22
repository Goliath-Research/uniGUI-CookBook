inherited FrmShipTo: TFrmShipTo
  Left = 222
  Top = 172
  Caption = 'Customers Shipping Address'
  ClientHeight = 364
  ClientWidth = 714
  ExplicitWidth = 730
  ExplicitHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Width = 714
    ExplicitWidth = 714
  end
  inherited Panel1: TUniPanel
    Top = 329
    Width = 714
    ExplicitTop = 329
    ExplicitWidth = 714
    inherited Panel2: TUniPanel
      Left = 608
      ExplicitLeft = 608
      inherited BtnClose: TUniButton
        Top = 6
        Caption = '&Close'
        ExplicitTop = 6
      end
    end
    inherited Panel3: TUniPanel
      Width = 608
      ExplicitWidth = 608
    end
  end
  inherited Panel4: TUniPanel
    Width = 714
    ExplicitWidth = 714
    inherited DBNavigator1: TUniDBNavigator
      Left = 488
      ExplicitLeft = 488
    end
  end
  inherited wwDBGrid1: TIQUniGridControl
    Width = 714
    Height = 299
    ControlType.Strings = (
      'Freight_Comp;CustomEdit;wwDBComboDlgFreight;F'
      'Tax_code;CustomEdit;wwDBComboDlgTaxCode;F'
      'Division;CustomEdit;wwDBComboDlgDivision;F'
      'Plant_Name;CustomEdit;wwDBComboDlgEplant;F'
      'COUNTRY;CustomEdit;wwDBComboBoxCountry;F'
      'STATE;CustomEdit;wwDBComboBoxState;F'
      'COUNTRY_ID;CustomEdit;wwDBComboBoxCountry;F'
      'STATE_ID;CustomEdit;wwDBComboBoxState;F')
    Selected.Strings = (
      'PRIME_CONTACT'#9'30'#9'Name'#9'F'#9
      'ATTN'#9'30'#9'Company'#9'F'#9
      'ADDR1'#9'30'#9'Address1'#9'F'
      'ADDR2'#9'30'#9'Address2'#9'F'
      'ADDR3'#9'30'#9'Address3'#9'F'
      'CITY'#9'30'#9'City'#9'F'
      'COUNTRY'#9'30'#9'Country'#9'F'
      'STATE'#9'10'#9'State/Region'#9'F'
      'ZIP'#9'10'#9'Zip'#9'F'
      'PHONE_NUMBER'#9'25'#9'Phone'#9'F'
      'FAX'#9'25'#9'Fax'#9'F'
      'EXT'#9'5'#9'Ext'#9'F'
      'Freight_Comp'#9'20'#9'Freight'#9'F'
      'Tax_code'#9'20'#9'Tax Code'#9'F'
      'Plant_Name'#9'20'#9'EPlant Name'#9'T'
      'Division'#9'30'#9'Division'#9'F')
    ExplicitWidth = 714
    ExplicitHeight = 299
  end
  object wwDBComboDlgTaxCode: TUniEdit [4]
    Left = 40
    Top = 196
    Width = 150
    Height = 21
    OnCustomDlg = wwDBComboDlgTaxCodeCustomDlg
    ShowButton = True
    Style = csDropDown
    ReadOnly = True
    TabOrder = 3
    WordWrap = False
    UnboundDataType = wwDefault
    OnKeyDown = wwDBComboDlgTaxCodeKeyDown
  end
  object wwDBComboDlgFreight: TUniEdit [5]
    Left = 40
    Top = 221
    Width = 150
    Height = 21
    OnCustomDlg = wwDBComboDlgFreightCustomDlg
    ShowButton = True
    Style = csDropDown
    ReadOnly = True
    TabOrder = 4
    WordWrap = False
    UnboundDataType = wwDefault
    OnKeyDown = wwDBComboDlgFreightKeyDown
  end
  object wwDBComboDlgDivision: TUniEdit [6]
    Left = 40
    Top = 248
    Width = 150
    Height = 21
    OnCustomDlg = wwDBComboDlgDivisionCustomDlg
    ShowButton = True
    Style = csDropDown
    ReadOnly = True
    TabOrder = 5
    WordWrap = False
    UnboundDataType = wwDefault
    OnKeyDown = wwDBComboDlgDivisionKeyDown
  end
  object wwDBComboDlgEplant: TUniEdit [7]
    Left = 40
    Top = 275
    Width = 150
    Height = 21
    OnCustomDlg = wwDBComboDlgEplantCustomDlg
    ShowButton = True
    Style = csDropDown
    ReadOnly = True
    TabOrder = 6
    WordWrap = False
    UnboundDataType = wwDefault
  end
  inherited wwDBComboBoxCountry: TUniDBLookupComboBox
    TabOrder = 7
  end
  inherited wwDBComboBoxState: TUniDBLookupComboBox
    TabOrder = 8
  end
  inherited tBillTo: TFDTable
    BeforeOpen = tBillToBeforeOpen
    OnCalcFields = tBillToCalcFields
    Filtered = True
    UpdateOptions.UpdateTableName = 'SHIP_TO'
    TableName = 'SHIP_TO'
    Top = 104
    object tBillToSHIP_TIME: TBCDField [14]
      FieldName = 'SHIP_TIME'
      Size = 3
    end
    object tBillToTAX_CODE_ID: TBCDField [15]
      Tag = 1
      FieldName = 'TAX_CODE_ID'
      LookupKeyFields = 'ID'
      LookupResultField = 'TAX_CODE'
      Size = 0
    end
    object tBillToTax_code: TStringField [16]
      FieldKind = fkCalculated
      FieldName = 'Tax_code'
      LookupKeyFields = 'ID'
      LookupResultField = 'TAX_CODE'
      KeyFields = 'TAX_CODE_ID'
      Calculated = True
    end
    object tBillToFREIGHT_ID: TBCDField [17]
      Tag = 1
      FieldName = 'FREIGHT_ID'
      Size = 0
    end
    object tBillToFreight_Comp: TStringField [18]
      FieldKind = fkCalculated
      FieldName = 'Freight_Comp'
      LookupKeyFields = 'ID'
      LookupResultField = 'DESCRIP'
      KeyFields = 'FREIGHT_ID'
      Calculated = True
    end
    object tBillToEPLANT_ID: TBCDField [19]
      Tag = 1
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object tBillToPlant_Name: TStringField [20]
      FieldKind = fkCalculated
      FieldName = 'Plant_Name'
      LookupKeyFields = 'ID'
      LookupResultField = 'PLANT_NAME'
      KeyFields = 'EPLANT_ID'
      Calculated = True
    end
    object tBillToDIVISION_ID: TBCDField [21]
      Tag = 1
      FieldName = 'DIVISION_ID'
      Size = 0
    end
    object tBillToDivision: TStringField [22]
      FieldKind = fkCalculated
      FieldName = 'Division'
      Size = 30
      Calculated = True
    end
  end
  inherited PkAddress: TIQWebHPick
    SQL.Strings = (
      'select s.id            as id,'
      '       s.attn          as attn,'
      '       s.addr1         as addr1,'
      '       s.addr2         as addr2,'
      '       s.addr3         as addr3,'
      '       s.city          as city,'
      '       s.state         as state,'
      '       s.country       as country,'
      '       s.zip           as zip,'
      '       s.phone_number  as phone_number,'
      '       s.ext           as ext,'
      '       s.fax           as fax,'
      '       s.prime_contact as prime_contact,'
      '       s.eplant_id     as eplant_id,'
      '       f.descrip       as ship_via,'
      '       d.name          as division_name,'
      '       s.pk_hide       as pk_hide'
      '  from ship_to s,'
      '       freight f,'
      '       division d'
      ' where s.freight_id = f.id(+)'
      '   and s.arcusto_id = :arcusto_id'
      '   and s.division_id = d.id(+)'
      '')
    Left = 86
    Top = 72
    object PkAddressEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
    object PkAddressSHIP_VIA: TStringField
      DisplayLabel = 'Ship Via'
      FieldName = 'SHIP_VIA'
      Size = 60
    end
    object PkAddressDIVISION_NAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'DIVISION_NAME'
      Size = 25
    end
    object PkAddressPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object PkDivision: TIQWebHPick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select d.id,'
      '       d.name,'
      '       d.eplant_id'
      '  from division d'
      ' where misc.eplant_filter(d.eplant_id) = 1')
    Left = 196
    Top = 248
    object PkDivisionID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
    object PkDivisionNAME: TStringField
      DisplayLabel = 'Division'
      FieldName = 'NAME'
      Size = 25
    end
    object PkDivisionEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkFreight: TIQWebHPick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       scac_iata_code,'
      '       code_qualifier,'
      '       transport_code,'
      '       equip_owners_code,'
      '       pk_hide,'
      '       eplant_id'
      '  from freight'
      ' where misc.eplant_filter_include_nulls( eplant_id ) = 1  ')
    Left = 196
    Top = 219
    object PkFreightID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.FREIGHT.ID'
      Visible = False
      Size = 0
    end
    object PkFreightDESCRIP: TStringField
      DisplayLabel = 'Description'
      FieldName = 'DESCRIP'
      Origin = 'IQ.FREIGHT.DESCRIP'
      Size = 60
    end
    object PkFreightSCAC_IATA_CODE: TStringField
      DisplayLabel = 'SCAC IATA'
      FieldName = 'SCAC_IATA_CODE'
      Origin = 'IQ.FREIGHT.SCAC_IATA_CODE'
      FixedChar = True
      Size = 17
    end
    object PkFreightCODE_QUALIFIER: TStringField
      DisplayLabel = 'Code Qualifier'
      FieldName = 'CODE_QUALIFIER'
      Origin = 'IQ.FREIGHT.CODE_QUALIFIER'
      Size = 6
    end
    object PkFreightTRANSPORT_CODE: TStringField
      DefaultExpression = 'Transportation Method Code'
      DisplayLabel = 'Transportation Method Code'
      FieldName = 'TRANSPORT_CODE'
      Origin = 'IQ.FREIGHT.TRANSPORT_CODE'
      Size = 6
    end
    object PkFreightEQUIP_OWNERS_CODE: TStringField
      DisplayLabel = 'Equipment Owners Code'
      FieldName = 'EQUIP_OWNERS_CODE'
      Origin = 'IQ.FREIGHT.EQUIP_OWNERS_CODE'
      Size = 4
    end
    object PkFreightPK_HIDE: TStringField
      FieldName = 'PK_HIDE'
      Origin = 'IQ.FREIGHT.PK_HIDE'
      Visible = False
      Size = 1
    end
    object PkFreightEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Size = 0
    end
  end
  object PkTaxCode: TIQWebHPick
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       tax_code,'
      '       tax_code_desc,'
      '       tot_tax_rate'
      '  from tax_codes')
    Left = 196
    Top = 189
    object PkTaxCodeTAX_CODE: TStringField
      DisplayLabel = 'Tax Code'
      DisplayWidth = 20
      FieldName = 'TAX_CODE'
      Origin = 'IQ.TAX_CODES.TAX_CODE'
    end
    object PkTaxCodeTAX_CODE_DESC: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 50
      FieldName = 'TAX_CODE_DESC'
      Origin = 'IQ.TAX_CODES.TAX_CODE_DESC'
      Size = 50
    end
    object PkTaxCodeTOT_TAX_RATE: TFMTBCDField
      DisplayLabel = 'Rate'
      DisplayWidth = 10
      FieldName = 'TOT_TAX_RATE'
      Origin = 'IQ.TAX_CODES.TOT_TAX_RATE'
      Size = 6
    end
    object PkTaxCodeID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.TAX_CODES.ID'
      Visible = False
      Size = 0
    end
  end
end

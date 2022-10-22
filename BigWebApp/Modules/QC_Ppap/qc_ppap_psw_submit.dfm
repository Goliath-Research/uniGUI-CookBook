object FrmPSW_Submit: TFrmPSW_Submit
  Left = 166
  Top = 199
  ClientHeight = 177
  ClientWidth = 470
  Caption = 'Submit PSW'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -14
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object pnlBody: TUniPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 136
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitLeft = 16
    ExplicitWidth = 185
    ExplicitHeight = 41
    DesignSize = (
      470
      136)
    object Label1: TUniLabel
      Left = 15
      Top = 16
      Width = 95
      Height = 17
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Trading Partner'
      TabOrder = 5
    end
    object Label2: TUniLabel
      Left = 15
      Top = 75
      Width = 106
      Height = 17
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Transaction Type'
      TabOrder = 6
    end
    object Label3: TUniLabel
      Left = 15
      Top = 46
      Width = 78
      Height = 17
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'XML Schema'
      TabOrder = 7
    end
    object rbtnProcess: TUniRadioButton
      Left = 139
      Top = 75
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Checked = True
      Caption = 'Process'
      TabOrder = 0
    end
    object rbtnRespond: TUniRadioButton
      Left = 139
      Top = 100
      Width = 139
      Height = 21
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Respond'
      TabOrder = 1
    end
    object wwDBLookupComboSCHEMA: TUniDBLookupComboBox
      Left = 139
      Top = 43
      Width = 320
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListFieldIndex = 0
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Color = clWindow
    end
    object wwDBLookupComboURL: TUniDBLookupComboBox
      Left = 139
      Top = 11
      Width = 320
      Height = 25
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ListFieldIndex = 0
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Color = clWindow
    end
  end
  object pnlButtons: TUniPanel
    Left = 0
    Top = 136
    Width = 470
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    DesignSize = (
      470
      41)
    object btnCancel: TUniButton
      Left = 354
      Top = 5
      Width = 105
      Height = 31
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Cancel'
      ModalResult = 2
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object btnOK: TUniButton
      Left = 227
      Top = 5
      Width = 103
      Height = 31
      Hint = ''
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'OK'
      ModalResult = 1
      Anchors = [akTop, akRight]
      TabOrder = 2
      Default = True
      OnClick = btnOKClick
    end
  end
  object QryEdiPartners: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select edi.id, '
      '       edi.web_service_url, '
      '       a.custno,'
      '       a.company as arcusto_company,'
      '       v.vendorno,'
      '       v.company as vendor_company'
      '  from edi_partners edi, arcusto a, vendor v'
      ' where edi.arcusto_id = a.id(+)'
      '   and edi.vendor_id = v.id(+)'
      '   and edi.web_service_url is not NULL ')
    Left = 293
    Top = 57
    object QryEdiPartnersWEB_SERVICE_URL: TStringField
      DisplayLabel = 'WebService URL'
      DisplayWidth = 30
      FieldName = 'WEB_SERVICE_URL'
      Size = 250
    end
    object QryEdiPartnersCUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryEdiPartnersARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Customer Company'
      DisplayWidth = 25
      FieldName = 'ARCUSTO_COMPANY'
      Size = 60
    end
    object QryEdiPartnersVENDORNO: TStringField
      DisplayLabel = 'Vendor #'
      DisplayWidth = 10
      FieldName = 'VENDORNO'
      FixedChar = True
      Size = 10
    end
    object QryEdiPartnersVENDOR_COMPANY: TStringField
      DisplayLabel = 'Vendor Company'
      DisplayWidth = 25
      FieldName = 'VENDOR_COMPANY'
      FixedChar = True
      Size = 60
    end
    object QryEdiPartnersID: TBCDField
      FieldName = 'ID'
      Visible = False
      Size = 0
    end
  end
  object HTTPRIO1: THTTPRIO
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = True
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    HTTPWebNode.WebNodeOptions = []
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 332
    Top = 59
  end
  object QryXMLSchema: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select id,'
      '       descrip,'
      '       schema_no,'
      '       execute_proc'
      '  from xml_schema')
    Left = 263
    Top = 58
    object QryXMLSchemaDESCRIP: TStringField
      DisplayLabel = 'Schema Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Origin = 'IQ.XML_SCHEMA.DESCRIP'
      Size = 100
    end
    object QryXMLSchemaSCHEMA_NO: TStringField
      DisplayLabel = 'Schema #'
      DisplayWidth = 10
      FieldName = 'SCHEMA_NO'
      Origin = 'IQ.XML_SCHEMA.SCHEMA_NO'
      Size = 10
    end
    object QryXMLSchemaEXECUTE_PROC: TStringField
      DisplayLabel = 'Procedure'
      DisplayWidth = 30
      FieldName = 'EXECUTE_PROC'
      Origin = 'IQ.XML_SCHEMA.EXECUTE_PROC'
      Size = 30
    end
    object QryXMLSchemaID: TBCDField
      FieldName = 'ID'
      Origin = 'IQ.XML_SCHEMA.ID'
      Visible = False
      Size = 0
    end
  end
end

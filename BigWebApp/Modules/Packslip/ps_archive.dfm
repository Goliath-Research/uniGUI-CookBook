object FrmPSArchive: TFrmPSArchive
  Left = 266
  Top = 204
  HelpContext = 1100086
  ClientHeight = 354
  ClientWidth = 588
  Caption = 'Archive Batch of Packing Slips'
  OnShow = FormShow
  OldCreateOrder = False
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 0
    Width = 588
    Height = 294
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 371
    IQComponents.Grid.Height = 208
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcShipments
    IQComponents.Grid.LoadMask.Message = 'Loading data...'
    IQComponents.Grid.Align = alClient
    IQComponents.Grid.Anchors = [akLeft, akTop, akRight, akBottom]
    IQComponents.Grid.TabOrder = 0
    IQComponents.Navigator.Left = 410
    IQComponents.Navigator.Top = 0
    IQComponents.Navigator.Width = 241
    IQComponents.Navigator.Height = 25
    IQComponents.Navigator.Hint = ''
    IQComponents.Navigator.ShowHint = True
    IQComponents.Navigator.DataSource = SrcShipments
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 371
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 208
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = SrcShipments
    Columns = <
      item
        FieldName = 'PACKSLIPNO'
        Title.Caption = 'PS#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FOB'
        Title.Caption = 'F.O.B.'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIPDATE'
        Title.Caption = 'Ship Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PS_DATE'
        Title.Caption = 'PS. Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_CUSTNO'
        Title.Caption = 'Cust #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_COMPANY'
        Title.Caption = 'Company'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_TO_ATTN'
        Title.Caption = 'Company'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_TO_ADDR1'
        Title.Caption = 'Address1'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_TO_CITY'
        Title.Caption = 'City'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_TO_STATE'
        Title.Caption = 'State/Prov'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_TO_COUNTRY'
        Title.Caption = 'Country'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_TO_ZIP'
        Title.Caption = 'Zip/Postal Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BILL_TO_ATTN'
        Title.Caption = 'Company'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BILL_TO_ADDR1'
        Title.Caption = 'Address1'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BILL_TO_CITY'
        Title.Caption = 'City'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BILL_TO_STATE'
        Title.Caption = 'State/Prov'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BILL_TO_COUNTRY'
        Title.Caption = 'Country'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BILL_TO_ZIP'
        Title.Caption = 'Zip/Postal Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PS_TICKET_BATCH'
        Title.Caption = 'Pick Ticket Batch'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object Panel1: TUniPanel
    Left = 0
    Top = 294
    Width = 588
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel2: TUniPanel
      Left = 378
      Top = 1
      Width = 210
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnOK: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'OK'
        TabOrder = 1
        OnClick = btnOKClick
      end
      object btnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 2
      end
    end
  end
  object StatusBar1: TUniStatusBar
    Left = 0
    Top = 335
    Width = 588
    Height = 19
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    ParentColor = False
    Color = clWindow
  end
  object SrcShipments: TDataSource
    DataSet = QryShipments
    Left = 72
    Top = 58
  end
  object QryShipments: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    UpdateOptions.UpdateTableName = 'SHIPMENTS'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select '
      '       id,'
      '       packslipno,'
      '       eplant_id,'
      '       arcusto_custno,'
      '       arcusto_company,'
      '       ship_to_attn,'
      '       ship_to_addr1,'
      '       ship_to_addr2,'
      '       ship_to_addr3,'
      '       ship_to_city,'
      '       ship_to_state,'
      '       ship_to_country,'
      '       ship_to_zip,'
      '       bill_to_attn,'
      '       bill_to_addr1,'
      '       bill_to_addr2,'
      '       bill_to_addr3,'
      '       bill_to_city,'
      '       bill_to_state,'
      '       bill_to_country,'
      '       bill_to_zip,'
      '       shipdate,'
      '       ps_date,'
      '       fob,'
      '       freight_descrip,'
      '       ship_via,'
      '       vmi,'
      '       ps_ticket_id,'
      '       tracking_num,'
      '       ps_ticket_batch'
      '  from shipments       '
      ' where '
      '       NVL(shipment_type, '#39' '#39') <> '#39'CUM SHIP ADJUSTMENT'#39
      '   and NVL(archived, '#39'N'#39') = '#39'N'#39
      '   and misc.eplant_filter( eplant_id ) = 1'
      ''
      '')
    Left = 72
    Top = 76
    object QryShipmentsPACKSLIPNO: TStringField
      DisplayLabel = 'Pack.Slip#'
      DisplayWidth = 10
      FieldName = 'PACKSLIPNO'
      Origin = 'PACKSLIPNO'
      Required = True
      Size = 15
    end
    object QryShipmentsFOB: TStringField
      DisplayLabel = 'F.O.B.'
      DisplayWidth = 15
      FieldName = 'FOB'
      Origin = 'FOB'
      Size = 60
    end
    object QryShipmentsSHIPDATE: TDateTimeField
      DisplayLabel = 'Ship Date'
      DisplayWidth = 18
      FieldName = 'SHIPDATE'
      Origin = 'SHIPDATE'
    end
    object QryShipmentsPS_DATE: TDateTimeField
      DisplayLabel = 'PS. Date'
      DisplayWidth = 18
      FieldName = 'PS_DATE'
      Origin = 'PS_DATE'
    end
    object QryShipmentsARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Cust#'
      DisplayWidth = 10
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'ARCUSTO_CUSTNO'
      Size = 10
    end
    object QryShipmentsARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 30
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'ARCUSTO_COMPANY'
      Size = 60
    end
    object QryShipmentsFREIGHT_DESCRIP: TStringField
      DisplayWidth = 30
      FieldName = 'FREIGHT_DESCRIP'
      Origin = 'FREIGHT_DESCRIP'
      Visible = False
      Size = 60
    end
    object QryShipmentsSHIP_VIA: TStringField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 15
      FieldName = 'SHIP_VIA'
      Origin = 'SHIP_VIA'
      Visible = False
      Size = 30
    end
    object QryShipmentsSHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To Company'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'SHIP_TO_ATTN'
      Size = 60
    end
    object QryShipmentsSHIP_TO_ADDR1: TStringField
      DisplayLabel = 'Ship To Address1'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_ADDR1'
      Origin = 'SHIP_TO_ADDR1'
      Size = 60
    end
    object QryShipmentsSHIP_TO_ADDR2: TStringField
      DisplayLabel = 'Ship To Address2'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_ADDR2'
      Origin = 'SHIP_TO_ADDR2'
      Size = 60
    end
    object QryShipmentsSHIP_TO_ADDR3: TStringField
      DisplayLabel = 'Ship To Address3'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_ADDR3'
      Origin = 'SHIP_TO_ADDR3'
      Size = 60
    end
    object QryShipmentsSHIP_TO_CITY: TStringField
      DisplayLabel = 'Ship To City'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_CITY'
      Origin = 'SHIP_TO_CITY'
      Size = 30
    end
    object QryShipmentsSHIP_TO_STATE: TStringField
      DisplayLabel = 'Ship To State or Region'
      DisplayWidth = 2
      FieldName = 'SHIP_TO_STATE'
      Origin = 'SHIP_TO_STATE'
    end
    object QryShipmentsSHIP_TO_COUNTRY: TStringField
      DisplayLabel = 'Ship To Country'
      DisplayWidth = 30
      FieldName = 'SHIP_TO_COUNTRY'
      Origin = 'SHIP_TO_COUNTRY'
      Size = 100
    end
    object QryShipmentsSHIP_TO_ZIP: TStringField
      DisplayLabel = 'Ship To Postal Code'
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ZIP'
      Origin = 'SHIP_TO_ZIP'
    end
    object QryShipmentsBILL_TO_ATTN: TStringField
      DisplayLabel = 'Bill To Company'
      DisplayWidth = 30
      FieldName = 'BILL_TO_ATTN'
      Origin = 'BILL_TO_ATTN'
      Size = 60
    end
    object QryShipmentsBILL_TO_ADDR1: TStringField
      DisplayLabel = 'Bill To Address1'
      DisplayWidth = 30
      FieldName = 'BILL_TO_ADDR1'
      Origin = 'BILL_TO_ADDR1'
      Size = 60
    end
    object QryShipmentsBILL_TO_ADDR2: TStringField
      DisplayLabel = 'Bill To Address2'
      DisplayWidth = 30
      FieldName = 'BILL_TO_ADDR2'
      Origin = 'BILL_TO_ADDR2'
      Size = 60
    end
    object QryShipmentsBILL_TO_ADDR3: TStringField
      DisplayLabel = 'Bill To Address3'
      DisplayWidth = 30
      FieldName = 'BILL_TO_ADDR3'
      Origin = 'BILL_TO_ADDR3'
      Size = 60
    end
    object QryShipmentsBILL_TO_CITY: TStringField
      DisplayLabel = 'Bill To City'
      DisplayWidth = 30
      FieldName = 'BILL_TO_CITY'
      Origin = 'BILL_TO_CITY'
      Size = 30
    end
    object QryShipmentsBILL_TO_STATE: TStringField
      DisplayLabel = 'Bill To State or Region'
      DisplayWidth = 2
      FieldName = 'BILL_TO_STATE'
      Origin = 'BILL_TO_STATE'
    end
    object QryShipmentsBILL_TO_COUNTRY: TStringField
      DisplayLabel = 'Bill To Country'
      DisplayWidth = 30
      FieldName = 'BILL_TO_COUNTRY'
      Origin = 'BILL_TO_COUNTRY'
      Size = 100
    end
    object QryShipmentsBILL_TO_ZIP: TStringField
      DisplayLabel = 'Bill To Postal Code'
      DisplayWidth = 10
      FieldName = 'BILL_TO_ZIP'
      Origin = 'BILL_TO_ZIP'
    end
    object QryShipmentsEPLANT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'EPLANT_ID'
      Visible = False
      Size = 0
    end
    object QryShipmentsTRACKING_NUM: TStringField
      DisplayWidth = 50
      FieldName = 'TRACKING_NUM'
      Origin = 'TRACKING_NUM'
      Visible = False
      Size = 50
    end
    object QryShipmentsVMI: TStringField
      DisplayWidth = 1
      FieldName = 'VMI'
      Origin = 'VMI'
      Visible = False
      Size = 1
    end
    object QryShipmentsID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
      Size = 0
    end
    object QryShipmentsPS_TICKET_ID: TBCDField
      FieldName = 'PS_TICKET_ID'
      Origin = 'PS_TICKET_ID'
      Visible = False
      Size = 0
    end
    object QryShipmentsPS_TICKET_BATCH: TBCDField
      DisplayWidth = 10
      FieldName = 'PS_TICKET_BATCH'
      Origin = 'PS_TICKET_BATCH'
      Size = 0
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnOK')
    SecurityCode = 'FRMPSARCHIVE'
    Left = 120
    Top = 77
  end
end

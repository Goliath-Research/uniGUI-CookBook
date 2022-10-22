object FrmAdjustShipment: TFrmAdjustShipment
  Left = 81
  Top = 123
  HelpContext = 1069238
  ClientHeight = 204
  ClientWidth = 491
  Caption = 'Manual Cum. Shipped Adjustment'
  OnShow = FormShow
  OldCreateOrder = True
  OnClose = FormClose
  OnActivate = FormActivate
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TUniPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 3
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
    Caption = ''
    ExplicitTop = 27
  end
  object wwDBGrid1: TIQUniGridControl
    Left = 0
    Top = 3
    Width = 491
    Height = 201
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 274
    IQComponents.Grid.Height = 115
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = SrcOrd_Detail_Cum_Ship
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
    IQComponents.Navigator.DataSource = SrcOrd_Detail_Cum_Ship
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 274
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 115
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.HiddenPanel.ExplicitHeight = 88
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    IQComponents.FormTab.ExplicitHeight = 117
    DataSource = SrcOrd_Detail_Cum_Ship
    Columns = <
      item
        FieldName = 'Ship_To_Info'
        Title.Caption = 'Ship To'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'QUAN'
        Title.Caption = ' Cum Shipped  ~ (Order Detail) '
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'CURR_QUAN'
        Title.Caption = ' Curr Cum Shipped  ~ (Order Detail) '
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'Ship_Quan'
        Title.Caption = ' Curr Cum Shipped  ~ (Shipments) '
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'NOTE'
        Title.Caption = 'Comment'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    TabsVisible = True
    ExplicitTop = 30
    ExplicitHeight = 174
    Marker = 0
  end
  object wwDBComboBoxShipTo: TUniDBComboBox
    Left = 15
    Top = 80
    Width = 121
    Height = 21
    Hint = ''
    DataField = 'SHIP_TO_ID'
    DataSource = SrcOrd_Detail_Cum_Ship
    Style = csDropDownList
    TabOrder = 1
    OnDropDown = wwDBComboBoxShipToDropDown
  end
  object cmbGridNote: TUniEdit
    Left = 24
    Top = 120
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object QryShipments: TFDQuery
    Tag = 1
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'insert into shipments'
      '  (id,'
      '   to_invoice,'
      '   packslipno,'
      '   fob,'
      '   userid,'
      '   shipdate,'
      '   ps_date,'
      '   arcusto_id,'
      '   arcusto_custno,'
      '   arcusto_company,'
      '   arcusto_addr1,'
      '   arcusto_addr2,'
      '   arcusto_addr3,'
      '   arcusto_city,'
      '   arcusto_state,'
      '   arcusto_country,'
      '   arcusto_zip,'
      '   arcusto_phone_number,'
      '   arcusto_ext,'
      '   arcusto_fax_number,'
      '   arcusto_prime_contact,'
      '   ship_to_attn,'
      '   ship_to_addr1,'
      '   ship_to_addr2,'
      '   ship_to_addr3,'
      '   ship_to_city,'
      '   ship_to_state,'
      '   ship_to_country,'
      '   ship_to_zip,'
      '   ship_to_ship_time,'
      '   ship_to_tax_code_id,'
      '   ship_to_phone_number,'
      '   ship_to_ext,'
      '   ship_to_fax,'
      '   ship_to_prime_contact,'
      '   ship_to_note,'
      '   bill_to_attn,'
      '   bill_to_addr1,'
      '   bill_to_addr2,'
      '   bill_to_addr3,'
      '   bill_to_city,'
      '   bill_to_state,'
      '   bill_to_country,'
      '   bill_to_zip,'
      '   bill_to_phone_number,'
      '   bill_to_ext,'
      '   bill_to_fax,'
      '   bill_to_prime_contact,'
      '   terms_descrip,'
      '   terms_days,'
      '   terms_discount,'
      '   terms_discount_days,'
      '   shipment_type,'
      '   ship_to_id,'
      '   bill_to_id )'
      'select'
      '   :nShipmentId,'
      '   '#39'N'#39','
      '   :nPackSlipNo,'
      '   :cFob,'
      '   misc.GetUserName,'
      '   :cShipDate,'
      '   :cPSDate,'
      '   a.id,'
      '   a.custno,'
      '   a.company,'
      '   a.addr1,'
      '   a.addr2,'
      '   a.addr3,'
      '   a.city,'
      '   a.state,'
      '   a.country,'
      '   a.zip,'
      '   a.phone_number,'
      '   a.ext,'
      '   a.fax_number,'
      '   a.prime_contact,'
      '   s.attn,'
      '   s.addr1,'
      '   s.addr2,'
      '   s.addr3,'
      '   s.city,'
      '   s.state,'
      '   s.country,'
      '   s.zip,'
      '   s.ship_time,'
      '   s.tax_code_id,'
      '   s.phone_number,'
      '   s.ext,'
      '   s.fax,'
      '   s.prime_contact,'
      '   NVL(:AComment, s.notes),'
      '   b.attn,'
      '   b.addr1,'
      '   b.addr2,'
      '   b.addr3,'
      '   b.city,'
      '   b.state,'
      '   b.country,'
      '   b.zip,'
      '   b.phone_number,'
      '   b.ext,'
      '   b.fax,'
      '   b.prime_contact,'
      '   t.description,'
      '   t.days,'
      '   t.discount,'
      '   t.discount_days,'
      '   '#39'CUM SHIP ADJUSTMENT'#39','
      '   s.id,'
      '   b.id'
      'from orders o, arcusto a, ship_to s, bill_to b, terms t'
      'where o.id = :gOrderId'
      '  and o.arcusto_id = a.id'
      '  and s.id(+) = :gShipToId'
      '  and b.id(+) = :gBillToId'
      '  and t.id(+) = o.terms_id'
      ''
      '')
    Left = 255
    Top = 86
    ParamData = <
      item
        Name = 'nShipmentId'
        DataType = ftFloat
      end
      item
        Name = 'nPackSlipNo'
        DataType = ftString
      end
      item
        Name = 'cFob'
        DataType = ftString
      end
      item
        Name = 'cShipDate'
        DataType = ftDate
      end
      item
        Name = 'cPSDate'
        DataType = ftDate
      end
      item
        Name = 'AComment'
        DataType = ftString
      end
      item
        Name = 'gOrderId'
        DataType = ftFloat
      end
      item
        Name = 'gShipToId'
        DataType = ftFloat
      end
      item
        Name = 'gBillToId'
        DataType = ftFloat
      end>
  end
  object SrcOrd_Detail_Cum_Ship: TDataSource
    DataSet = QryCum
    Left = 160
    Top = 61
  end
  object QryCum: TFDQuery
    Active = True
    BeforeOpen = QryCumBeforeOpen
    BeforePost = QryCumBeforePost
    AfterPost = QryCumAfterPost
    AfterDelete = QryCumAfterPost
    OnCalcFields = QryCumCalcFields
    OnNewRecord = QryCumNewRecord
    CachedUpdates = True
    OnUpdateRecord = QryCumUpdateRecord
    Connection = UniMainModule.FDConnection1
    UpdateObject = UpdateSQLOrd_Detail_Cum_Ship
    SQL.Strings = (
      'select id,'
      '       ord_detail_id,'
      '       ship_to_id,'
      '       quan as curr_quan,'
      '       quan,'
      '       note'
      '  from ord_detail_cum_ship'
      ' where ord_detail_id = :ord_detail_id'
      ' order by id'
      ' '
      ' '
      ' ')
    Left = 160
    Top = 91
    ParamData = <
      item
        Name = 'ord_detail_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryCumShip_To_Info: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 23
      FieldKind = fkCalculated
      FieldName = 'Ship_To_Info'
      Size = 200
      Calculated = True
    end
    object QryCumQUAN: TBCDField
      DisplayLabel = ' Order Detail ~ Cum Shipped '
      DisplayWidth = 14
      FieldName = 'QUAN'
      Origin = 'IQ.ORD_DETAIL_CUM_SHIP.QUAN'
    end
    object QryCumCURR_QUAN: TBCDField
      FieldName = 'CURR_QUAN'
      Origin = 'IQ.ORD_DETAIL_CUM_SHIP.QUAN'
    end
    object QryCumShip_Quan: TFloatField
      DisplayLabel = ' Shipments ~ Cum Shipped '
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'Ship_Quan'
      Calculated = True
    end
    object QryCumDelta_Qty: TFloatField
      DisplayLabel = ' Shipments will be ~ adjusted by'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'Delta_Qty'
      Calculated = True
    end
    object QryCumSHIP_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Origin = 'IQ.ORD_DETAIL_CUM_SHIP.SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object QryCumID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'IQ.ORD_DETAIL_CUM_SHIP.ID'
      Visible = False
      Size = 0
    end
    object QryCumORD_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ORD_DETAIL_ID'
      Origin = 'IQ.ORD_DETAIL_CUM_SHIP.ORD_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryCumNOTE: TStringField
      DisplayLabel = 'Note'
      FieldName = 'NOTE'
      Origin = 'IQ.ORD_DETAIL_CUM_SHIP.NOTE'
      Size = 255
    end
  end
  object UpdateSQLOrd_Detail_Cum_Ship: TFDUpdateSQL
    Connection = UniMainModule.FDConnection1
    InsertSQL.Strings = (
      'insert into ord_detail_cum_ship'
      '  (ID, ORD_DETAIL_ID, SHIP_TO_ID, QUAN, NOTE)'
      'values'
      '  (:ID, :ORD_DETAIL_ID, :SHIP_TO_ID, :QUAN, :NOTE)')
    ModifySQL.Strings = (
      'update ord_detail_cum_ship'
      'set'
      '  ORD_DETAIL_ID = :ORD_DETAIL_ID,'
      '  SHIP_TO_ID = :SHIP_TO_ID,'
      '  QUAN = :QUAN,'
      '  NOTE = :NOTE'
      'where'
      '  ID = :OLD_ID')
    DeleteSQL.Strings = (
      'delete from ord_detail_cum_ship'
      'where'
      '  ID = :OLD_ID')
    Left = 160
    Top = 128
  end
  object PkShipTo: TIQWebHpick
    BeforeOpen = PkShipToBeforeOpen
    Filtered = True
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select id,'
      '       attn,'
      '       addr1,'
      '       addr2,'
      '       addr3,'
      '       city,'
      '       state,'
      '       country,'
      '       zip,'
      '       phone_number,'
      '       ext,'
      '       fax,'
      '       prime_contact,'
      '       ecode,'
      '       eplant_id'
      ' from ship_to'
      'where arcusto_id = :arcusto_id'
      ' ')
    Title = 'Select from Pick List'
    Touchscreen = False
    ForceShowWaitForPrompt = False
    Left = 212
    Top = 85
    ParamData = <
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object PkShipToID: TBCDField
      FieldName = 'ID'
      Origin = 'SHIP_TO.ID'
      Visible = False
      Size = 0
    end
    object PkShipToPRIME_CONTACT: TStringField
      DisplayLabel = 'Prime Contact'
      DisplayWidth = 20
      FieldName = 'PRIME_CONTACT'
      Origin = 'SHIP_TO.PRIME_CONTACT'
      Size = 30
    end
    object PkShipToATTN: TStringField
      DisplayLabel = 'Attention'
      DisplayWidth = 15
      FieldName = 'ATTN'
      Origin = 'SHIP_TO.ATTN'
      Size = 60
    end
    object PkShipToADDR1: TStringField
      DisplayLabel = 'Address 1'
      DisplayWidth = 20
      FieldName = 'ADDR1'
      Origin = 'SHIP_TO.ADDR1'
      Size = 60
    end
    object PkShipToADDR2: TStringField
      DisplayLabel = 'Address 2'
      DisplayWidth = 20
      FieldName = 'ADDR2'
      Origin = 'SHIP_TO.ADDR2'
      Size = 60
    end
    object PkShipToADDR3: TStringField
      DisplayLabel = 'Address 3'
      DisplayWidth = 20
      FieldName = 'ADDR3'
      Origin = 'SHIP_TO.ADDR3'
      Size = 60
    end
    object PkShipToCITY: TStringField
      DisplayLabel = 'City'
      DisplayWidth = 15
      FieldName = 'CITY'
      Origin = 'SHIP_TO.CITY'
      Size = 30
    end
    object PkShipToSTATE: TStringField
      DisplayLabel = 'State or Region'
      FieldName = 'STATE'
      Origin = 'SHIP_TO.STATE'
    end
    object PkShipToCOUNTRY: TStringField
      DisplayLabel = 'Country'
      DisplayWidth = 15
      FieldName = 'COUNTRY'
      Origin = 'SHIP_TO.COUNTRY'
      Size = 100
    end
    object PkShipToZIP: TStringField
      DisplayLabel = 'Postal Code'
      FieldName = 'ZIP'
      Origin = 'SHIP_TO.ZIP'
      Size = 10
    end
    object PkShipToPHONE_NUMBER: TStringField
      DisplayLabel = 'Telephone'
      FieldName = 'PHONE_NUMBER'
      Origin = 'SHIP_TO.PHONE_NUMBER'
      Size = 25
    end
    object PkShipToEXT: TStringField
      DisplayLabel = 'Telephone Ext'
      DisplayWidth = 3
      FieldName = 'EXT'
      Origin = 'SHIP_TO.EXT'
      Size = 5
    end
    object PkShipToFAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
      Origin = 'SHIP_TO.FAX'
      Size = 25
    end
    object PkShipToECODE: TStringField
      DisplayLabel = 'ECode'
      FieldName = 'ECODE'
      Origin = 'SHIP_TO.ECODE'
      Size = 10
    end
    object PkShipToEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      FieldName = 'EPLANT_ID'
      Origin = 'SHIP_TO.EPLANT_ID'
      Size = 0
    end
  end
end

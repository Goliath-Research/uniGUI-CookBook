object FrmOeUnArchive: TFrmOeUnArchive
  Left = 0
  Top = 0
  ClientHeight = 424
  ClientWidth = 677
  Caption = 'Unarchive Sales Orders'
  OnShow = FormShow
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
    Width = 677
    Height = 38
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Caption = ''
    object Label1: TUniLabel
      Left = 12
      Top = 12
      Width = 24
      Height = 13
      Hint = ''
      Caption = 'From'
      TabOrder = 3
    end
    object Label2: TUniLabel
      Left = 216
      Top = 12
      Width = 12
      Height = 13
      Hint = ''
      Caption = 'To'
      TabOrder = 4
    end
    object DbFrom: TUniDBDateTimePicker
      Left = 41
      Top = 8
      Width = 152
      Height = 21
      Hint = ''
      DateTime = 42671.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 0
    end
    object DbTo: TUniDBDateTimePicker
      Left = 237
      Top = 8
      Width = 152
      Height = 21
      Hint = ''
      DateTime = 42671.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
    end
    object btnApply: TUniButton
      Left = 405
      Top = 6
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'Apply'
      TabOrder = 5
      OnClick = btnApplyClick
    end
  end
  object Panel2: TUniPanel
    Left = 0
    Top = 383
    Width = 677
    Height = 41
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 466
      Top = 1
      Width = 211
      Height = 39
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnUnArchive: TUniButton
        Left = 1
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Unarchive'
        TabOrder = 1
        OnClick = btnUnArchiveClick
      end
      object BtnCancel: TUniButton
        Left = 104
        Top = 8
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Cancel'
        TabOrder = 2
        OnClick = Exit1Click
      end
    end
  end
  object IQSearch1: TIQUniGridControl
    Left = 0
    Top = 38
    Width = 677
    Height = 345
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 460
    IQComponents.Grid.Height = 259
    IQComponents.Grid.Hint = ''
    IQComponents.Grid.DataSource = Src
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
    IQComponents.Navigator.DataSource = Src
    IQComponents.Navigator.LayoutConfig.Region = 'east'
    IQComponents.Navigator.TabOrder = 3
    IQComponents.HiddenPanel.Left = 460
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 259
    IQComponents.HiddenPanel.Hint = ''
    IQComponents.HiddenPanel.Visible = True
    IQComponents.HiddenPanel.Align = alRight
    IQComponents.HiddenPanel.Anchors = [akTop, akRight, akBottom]
    IQComponents.FormTab.Hint = ''
    IQComponents.FormTab.ImageIndex = 1
    IQComponents.FormTab.Caption = 'Form'
    IQComponents.FormTab.Layout = 'border'
    DataSource = Src
    Columns = <
      item
        FieldName = 'PONO'
        Title.Caption = 'PO #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'USERID'
        Title.Caption = 'Taken By'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'TERMS_DESCRIP'
        Title.Caption = 'Terms'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'SHIP_TO_ATTN'
        Title.Caption = 'Ship To'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FREIGHT_DESCRIP'
        Title.Caption = 'Ship Via'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'EPLANT_ID'
        Title.Caption = 'EPlant ID'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCHIVED_BY'
        Title.Caption = 'Archived By'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FOB'
        Title.Caption = 'FOB'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_ADDR1'
        Title.Caption = 'Customer Address 1'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_ADDR2'
        Title.Caption = 'Customer Address 1'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_ADDR3'
        Title.Caption = 'Customer Address 3'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_CITY'
        Title.Caption = 'Customer City'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_COMPANY'
        Title.Caption = 'Customer Company'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_COUNTRY'
        Title.Caption = 'Customer Country'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_CUSTNO'
        Title.Caption = 'Customer #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_PRIME_CONTACT'
        Title.Caption = 'Customer Prime Contact'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_STATE'
        Title.Caption = 'Customer State/Region'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ARCUSTO_ZIP'
        Title.Caption = 'Customer Postal Code'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'BILL_TO_ATTN'
        Title.Caption = 'Bill To'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORDERNO'
        Title.Caption = 'Order #'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'ORD_DATE'
        Title.Caption = 'Order Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end>
    Marker = 0
  end
  object MainMenu1: TUniMainMenu
    Left = 32
    Top = 120
    object File1: TUniMenuItem
      Caption = '&File'
      object UnArchive1: TUniMenuItem
        Caption = '&UnArchive'
        OnClick = btnUnArchiveClick
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
  object IQAbout1: TIQWebAbout
    ModuleName = 'UnArchive SOs'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 194096 $'
    BuildVersion = '176554'
    Left = 32
    Top = 64
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnUnArchive'
      'UnArchive1')
    SecurityCode = 'FRMOEUNARCHIVE'
    Left = 88
    Top = 120
  end
  object Src: TDataSource
    DataSet = Qry
    Left = 128
    Top = 110
  end
  object Qry: TFDQuery
    BeforeOpen = QryBeforeOpen
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.id,'
      '       p.orderno,'
      '       p.pono,'
      '       p.arcusto_id,'
      '       p.ord_date,'
      '       p.userid,'
      '       p.arcusto_custno,'
      '       p.arcusto_company,'
      '       p.arcusto_addr1,'
      '       p.arcusto_addr2,'
      '       p.arcusto_addr3,'
      '       p.arcusto_city,'
      '       p.arcusto_state,'
      '       p.arcusto_country,'
      '       p.arcusto_zip,'
      '       p.arcusto_prime_contact,'
      '       p.terms_descrip,'
      '       p.ship_to_attn,'
      '       p.bill_to_attn,'
      '       p.freight_descrip,'
      '       p.eplant_id,'
      '       p.archived_by,'
      '       p.fob '
      '  from hist_orders p,'
      '       arcusto v'
      ' where misc.eplant_filter_include_nulls( p.eplant_id ) = 1'
      '   and p.arcusto_id = v.id(+)'
      '   and misc.eplant_filter_include_nulls( v.eplant_id ) = 1'
      
        '   and Trunc(NVL(p.date_archived, p.ord_date)) between :START_DA' +
        'TE and :END_DATE'
      ''
      '')
    Left = 136
    Top = 120
    ParamData = <
      item
        Name = 'START_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'END_DATE'
        DataType = ftDateTime
        ParamType = ptInput
      end>
    object QryPONO: TStringField
      DisplayLabel = 'PO #'
      DisplayWidth = 15
      FieldName = 'PONO'
      Origin = 'p.PONO'
      Size = 35
    end
    object QryUSERID: TStringField
      DisplayLabel = 'Taken By'
      DisplayWidth = 35
      FieldName = 'USERID'
      Origin = 'p.USERID'
      Size = 35
    end
    object QryTERMS_DESCRIP: TStringField
      DisplayLabel = 'Terms'
      DisplayWidth = 20
      FieldName = 'TERMS_DESCRIP'
      Origin = 'p.TERMS_DESCRIP'
      Size = 60
    end
    object QrySHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 20
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'p.SHIP_TO_ATTN'
      Size = 60
    end
    object QryFREIGHT_DESCRIP: TStringField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 30
      FieldName = 'FREIGHT_DESCRIP'
      Origin = 'p.FREIGHT_DESCRIP'
      Size = 60
    end
    object QryEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'p.EPLANT_ID'
      Size = 0
    end
    object QryARCHIVED_BY: TStringField
      DisplayLabel = 'Archived By'
      DisplayWidth = 35
      FieldName = 'ARCHIVED_BY'
      Origin = 'p.ARCHIVED_BY'
      Size = 35
    end
    object QryFOB: TStringField
      DisplayWidth = 15
      FieldName = 'FOB'
      Origin = 'p.FOB'
      Size = 60
    end
    object QryARCUSTO_ADDR1: TStringField
      DisplayLabel = 'Customer Address 1'
      DisplayWidth = 20
      FieldName = 'ARCUSTO_ADDR1'
      Origin = 'p.ARCUSTO_ADDR1'
      Size = 60
    end
    object QryARCUSTO_ADDR2: TStringField
      DisplayLabel = 'Customer Address 1'
      DisplayWidth = 20
      FieldName = 'ARCUSTO_ADDR2'
      Origin = 'p.ARCUSTO_ADDR2'
      Size = 60
    end
    object QryARCUSTO_ADDR3: TStringField
      DisplayLabel = 'Customer Address 3'
      DisplayWidth = 20
      FieldName = 'ARCUSTO_ADDR3'
      Origin = 'p.ARCUSTO_ADDR3'
      Size = 60
    end
    object QryARCUSTO_CITY: TStringField
      DisplayLabel = 'Customer City'
      DisplayWidth = 30
      FieldName = 'ARCUSTO_CITY'
      Origin = 'p.ARCUSTO_CITY'
      FixedChar = True
      Size = 30
    end
    object QryARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Customer Company'
      DisplayWidth = 60
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'p.ARCUSTO_COMPANY'
      Size = 60
    end
    object QryARCUSTO_COUNTRY: TStringField
      DisplayLabel = 'Customer Country'
      DisplayWidth = 30
      FieldName = 'ARCUSTO_COUNTRY'
      Origin = 'p.ARCUSTO_COUNTRY'
      FixedChar = True
      Size = 100
    end
    object QryARCUSTO_CUSTNO: TStringField
      DisplayLabel = 'Customer #'
      DisplayWidth = 10
      FieldName = 'ARCUSTO_CUSTNO'
      Origin = 'p.ARCUSTO_CUSTNO'
      FixedChar = True
      Size = 10
    end
    object QryARCUSTO_PRIME_CONTACT: TStringField
      DisplayLabel = 'Customer Contact'
      DisplayWidth = 30
      FieldName = 'ARCUSTO_PRIME_CONTACT'
      Origin = 'p.ARCUSTO_PRIME_CONTACT'
      FixedChar = True
      Size = 30
    end
    object QryARCUSTO_STATE: TStringField
      DisplayLabel = 'Customer State'
      DisplayWidth = 20
      FieldName = 'ARCUSTO_STATE'
      Origin = 'p.ARCUSTO_STATE'
    end
    object QryARCUSTO_ZIP: TStringField
      DisplayLabel = 'Customer Postal Code'
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ZIP'
      Origin = 'p.ARCUSTO_ZIP'
      FixedChar = True
      Size = 10
    end
    object QryBILL_TO_ATTN: TStringField
      DisplayLabel = 'Bill To'
      DisplayWidth = 20
      FieldName = 'BILL_TO_ATTN'
      Origin = 'p.BILL_TO_ATTN'
      Size = 60
    end
    object QryORDERNO: TStringField
      DisplayLabel = 'Order #'
      DisplayWidth = 15
      FieldName = 'ORDERNO'
      Origin = 'p.ORDERNO'
      Size = 15
    end
    object QryID: TBCDField
      FieldName = 'ID'
      Origin = 'p.ID'
      Visible = False
      Size = 0
    end
    object QryARCUSTO_ID: TBCDField
      FieldName = 'ARCUSTO_ID'
      Origin = 'p.ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryORD_DATE: TDateTimeField
      DisplayLabel = 'Order Date'
      FieldName = 'ORD_DATE'
      Origin = 'p.ORD_DATE'
    end
  end
end

object FrmUnArchivePos: TFrmUnArchivePos
  Left = 64
  Top = 198
  ClientHeight = 457
  ClientWidth = 753
  Caption = 'Unarchive Purchase Orders'
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
    Width = 753
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
      DateTime = 42661.000000000000000000
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
      DateTime = 42661.000000000000000000
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
    Top = 424
    Width = 753
    Height = 33
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    Caption = ''
    object Panel3: TUniPanel
      Left = 526
      Top = 1
      Width = 227
      Height = 31
      Hint = ''
      Align = alRight
      Anchors = [akTop, akRight, akBottom]
      TabOrder = 0
      Caption = ''
      object btnUnArchive: TUniButton
        Left = 9
        Top = 1
        Width = 97
        Height = 25
        Hint = ''
        Caption = 'Unarchive'
        TabOrder = 1
        OnClick = btnUnArchiveClick
      end
      object BtnCancel: TUniButton
        Left = 112
        Top = 3
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
    Width = 753
    Height = 386
    Layout = 'border'
    ParentAlignmentControl = False
    AlignmentControl = uniAlignmentClient
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    IQComponents.Grid.Left = 0
    IQComponents.Grid.Top = 29
    IQComponents.Grid.Width = 536
    IQComponents.Grid.Height = 300
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
    IQComponents.HiddenPanel.Left = 536
    IQComponents.HiddenPanel.Top = 29
    IQComponents.HiddenPanel.Width = 209
    IQComponents.HiddenPanel.Height = 300
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
        FieldName = 'ARCHIVED_DATE'
        Title.Caption = 'Archived Date'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PONO'
        Title.Caption = 'PO#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'PO_DATE'
        Title.Caption = 'PO Date'
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
        FieldName = 'VENDOR_VENDORNO'
        Title.Caption = 'Vendor#'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'VENDOR_COMPANY'
        Title.Caption = 'Vendor Company'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'VENDOR_ATTN'
        Title.Caption = 'Vendor Attn.'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'VENDOR_ADDR1'
        Title.Caption = 'Vendor Addr1'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'VENDOR_CITY'
        Title.Caption = 'Vendor City'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'VENDOR_STATE'
        Title.Caption = 'Vendor State'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'VENDOR_COUNTRY'
        Title.Caption = 'Vendor Country'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'VENDOR_ZIP'
        Title.Caption = 'Vendor Zip'
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
        FieldName = 'REMIT_TO_ATTN'
        Title.Caption = 'Remit To'
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
        FieldName = 'TAX_CODES_TAX_CODE'
        Title.Caption = 'Tax'
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
        FieldName = 'APPROVED_BY'
        Title.Caption = 'Approved By'
        Width = 64
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'FOB'
        Title.Caption = 'FOB'
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
    ModuleName = 'UnArchive POs'
    Version = 'DEV.176554'
    ChangeListNumber = '$Change: 192477 $'
    BuildVersion = '176554'
    Left = 64
    Top = 120
  end
  object Src: TDataSource
    DataSet = Qry
    Left = 104
    Top = 110
  end
  object Qry: TFDQuery
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select p.id,'
      '       p.pono,'
      '       p.vendor_id,'
      '       p.po_date,'
      '       p.terms_id,'
      '       p.remit_to_id,'
      '      p.ship_to_id,'
      '      p.userid,'
      '      p.freight_id,'
      '      p.fob,'
      '      p.tax_code_id,'
      '      p.comment1,'
      '      p.company_id,'
      '      p.vendor_vendorno,'
      '      p.vendor_company,'
      '      p.vendor_attn,'
      '      p.vendor_addr1,'
      '      p.vendor_addr2,'
      '      p.vendor_addr3,'
      '      p.vendor_city,'
      '      p.vendor_state,'
      '      p.vendor_country,'
      '      p.vendor_zip,'
      '      p.terms_descrip,'
      '      p.terms_days,'
      '      p.terms_discount,'
      '      p.terms_discount_days,'
      '      p.remit_to_attn,'
      '      p.remit_to_addr1,'
      '      p.remit_to_addr2,'
      '      p.remit_to_addr3,'
      '      p.remit_to_city,'
      '      p.remit_to_state,'
      '      p.remit_to_zip,'
      '      p.remit_to_country,'
      '      p.ship_to_attn,'
      '      p.ship_to_addr1,'
      '      p.ship_to_addr2,'
      '      p.ship_to_addr3,'
      '      p.ship_to_city,'
      '      p.ship_to_state,'
      '      p.ship_to_country,'
      '      p.ship_to_zip,'
      '      p.company_company,'
      '      p.company_address1,'
      '      p.company_address2,'
      '      p.company_address3,'
      '      p.company_city,'
      '      p.company_state,'
      '      p.company_zip,'
      '      p.company_country,'
      '      p.freight_descrip,'
      '      p.tax_codes_tax_code,'
      '      p.tax_codes_tax_rate,'
      '      p.buyerid,'
      '      p.confirm_to,'
      '      p.currency_id,'
      '      p.fx_rate,'
      '      p.ecode,'
      '      p.eid,'
      '      p.edate_time,'
      '      p.ecopy,'
      '      p.currency_code,'
      '      p.currency_descrip,'
      '      p.po_control,'
      '      p.pr_emp_id_rqstnr,'
      '      p.empno_rqstnr,'
      '      p.eplant_id,'
      '      p.print_count,'
      '      p.print_last_user,'
      '      p.print_last_date,'
      '      p.archived_by,'
      '      p.po_type,'
      '      p.approved_by,'
      '      p.vendor_contact_id,'
      '      p.vendor_contact_first,'
      '      p.vendor_contact_last,'
      '      p.archived_date'
      ''
      '  from po_hist p,'
      '          vendor v'
      ' where misc.eplant_filter_include_nulls( p.eplant_id ) = 1'
      '   and p.vendor_id = v.id(+)'
      '   and misc.eplant_filter_include_nulls( v.eplant_id ) = 1'
      '   and p.archived_date between :AFrom and :ATo'
      ''
      '')
    Left = 112
    Top = 120
    ParamData = <
      item
        Name = 'AFrom'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ATo'
        DataType = ftDate
        ParamType = ptInput
      end>
    object QryARCHIVED_DATE: TDateTimeField
      DisplayLabel = 'Archived Date'
      DisplayWidth = 18
      FieldName = 'ARCHIVED_DATE'
      Origin = 'P.ARCHIVED_DATE'
    end
    object QryPONO: TStringField
      DisplayLabel = 'PO#'
      DisplayWidth = 15
      FieldName = 'PONO'
      Origin = 'P.PONO'
      Size = 35
    end
    object QryPO_DATE: TDateTimeField
      DisplayLabel = 'PO Date'
      DisplayWidth = 18
      FieldName = 'PO_DATE'
      Origin = 'P.PO_DATE'
    end
    object QryUSERID: TStringField
      DisplayLabel = 'Taken By'
      DisplayWidth = 35
      FieldName = 'USERID'
      Origin = 'P.USERID'
      Size = 35
    end
    object QryVENDOR_VENDORNO: TStringField
      DisplayLabel = 'Vendor#'
      DisplayWidth = 10
      FieldName = 'VENDOR_VENDORNO'
      Origin = 'P.VENDOR_VENDORNO'
      FixedChar = True
      Size = 10
    end
    object QryVENDOR_COMPANY: TStringField
      DisplayLabel = 'Vendor Company'
      DisplayWidth = 30
      FieldName = 'VENDOR_COMPANY'
      Origin = 'P.VENDOR_COMPANY'
      FixedChar = True
      Size = 60
    end
    object QryVENDOR_ATTN: TStringField
      DisplayLabel = 'Vendor Attn.'
      DisplayWidth = 30
      FieldName = 'VENDOR_ATTN'
      Origin = 'P.VENDOR_ATTN'
      FixedChar = True
      Size = 30
    end
    object QryVENDOR_ADDR1: TStringField
      DisplayLabel = 'Vendor Addr1'
      DisplayWidth = 20
      FieldName = 'VENDOR_ADDR1'
      Origin = 'P.VENDOR_ADDR1'
      Size = 60
    end
    object QryVENDOR_CITY: TStringField
      DisplayLabel = 'Vendor City'
      DisplayWidth = 30
      FieldName = 'VENDOR_CITY'
      Origin = 'P.VENDOR_CITY'
      FixedChar = True
      Size = 30
    end
    object QryVENDOR_STATE: TStringField
      DisplayLabel = 'Vendor State or Region'
      DisplayWidth = 20
      FieldName = 'VENDOR_STATE'
      Origin = 'P.VENDOR_STATE'
    end
    object QryVENDOR_COUNTRY: TStringField
      DisplayLabel = 'Vendor Country'
      DisplayWidth = 30
      FieldName = 'VENDOR_COUNTRY'
      Origin = 'P.VENDOR_COUNTRY'
      FixedChar = True
      Size = 100
    end
    object QryVENDOR_ZIP: TStringField
      DisplayLabel = 'Vendor Postal Code'
      DisplayWidth = 10
      FieldName = 'VENDOR_ZIP'
      Origin = 'P.VENDOR_ZIP'
      FixedChar = True
      Size = 10
    end
    object QryTERMS_DESCRIP: TStringField
      DisplayLabel = 'Terms'
      DisplayWidth = 20
      FieldName = 'TERMS_DESCRIP'
      Origin = 'P.TERMS_DESCRIP'
      Size = 60
    end
    object QryREMIT_TO_ATTN: TStringField
      DisplayLabel = 'Remit To'
      DisplayWidth = 20
      FieldName = 'REMIT_TO_ATTN'
      Origin = 'P.REMIT_TO_ATTN'
      Size = 60
    end
    object QrySHIP_TO_ATTN: TStringField
      DisplayLabel = 'Ship To'
      DisplayWidth = 20
      FieldName = 'SHIP_TO_ATTN'
      Origin = 'P.SHIP_TO_ATTN'
      FixedChar = True
      Size = 60
    end
    object QryFREIGHT_DESCRIP: TStringField
      DisplayLabel = 'Ship Via'
      DisplayWidth = 30
      FieldName = 'FREIGHT_DESCRIP'
      Origin = 'P.FREIGHT_DESCRIP'
      Size = 60
    end
    object QryTAX_CODES_TAX_CODE: TStringField
      DisplayLabel = 'Tax'
      DisplayWidth = 10
      FieldName = 'TAX_CODES_TAX_CODE'
      Origin = 'P.TAX_CODES_TAX_CODE'
    end
    object QryEPLANT_ID: TBCDField
      DisplayLabel = 'EPlant ID'
      DisplayWidth = 10
      FieldName = 'EPLANT_ID'
      Origin = 'P.EPLANT_ID'
      Size = 0
    end
    object QryARCHIVED_BY: TStringField
      DisplayLabel = 'Archived By'
      DisplayWidth = 35
      FieldName = 'ARCHIVED_BY'
      Origin = 'P.ARCHIVED_BY'
      Size = 35
    end
    object QryAPPROVED_BY: TStringField
      DisplayLabel = 'Approved By'
      DisplayWidth = 35
      FieldName = 'APPROVED_BY'
      Origin = 'P.APPROVED_BY'
      Size = 35
    end
    object QryFOB: TStringField
      DisplayWidth = 15
      FieldName = 'FOB'
      Origin = 'P.FOB'
      Size = 60
    end
    object QryBUYERID: TStringField
      DisplayWidth = 35
      FieldName = 'BUYERID'
      Origin = 'P.BUYERID'
      Visible = False
      Size = 35
    end
    object QryCONFIRM_TO: TStringField
      DisplayWidth = 50
      FieldName = 'CONFIRM_TO'
      Origin = 'P.CONFIRM_TO'
      Visible = False
      Size = 50
    end
    object QryCURRENCY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'CURRENCY_ID'
      Origin = 'P.CURRENCY_ID'
      Visible = False
      Size = 0
    end
    object QryFX_RATE: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'FX_RATE'
      Origin = 'P.FX_RATE'
      Visible = False
      Size = 6
    end
    object QryECODE: TStringField
      DisplayWidth = 10
      FieldName = 'ECODE'
      Origin = 'P.ECODE'
      Visible = False
      Size = 10
    end
    object QryEID: TBCDField
      DisplayWidth = 10
      FieldName = 'EID'
      Origin = 'P.EID'
      Visible = False
      Size = 0
    end
    object QryEDATE_TIME: TDateTimeField
      DisplayWidth = 18
      FieldName = 'EDATE_TIME'
      Origin = 'P.EDATE_TIME'
      Visible = False
    end
    object QryECOPY: TStringField
      DisplayWidth = 1
      FieldName = 'ECOPY'
      Origin = 'P.ECOPY'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryCURRENCY_CODE: TStringField
      DisplayWidth = 10
      FieldName = 'CURRENCY_CODE'
      Origin = 'P.CURRENCY_CODE'
      Visible = False
      Size = 10
    end
    object QryCURRENCY_DESCRIP: TStringField
      DisplayWidth = 50
      FieldName = 'CURRENCY_DESCRIP'
      Origin = 'P.CURRENCY_DESCRIP'
      Visible = False
      Size = 50
    end
    object QryPO_CONTROL: TStringField
      DisplayWidth = 60
      FieldName = 'PO_CONTROL'
      Origin = 'P.PO_CONTROL'
      Visible = False
      Size = 60
    end
    object QryPR_EMP_ID_RQSTNR: TBCDField
      DisplayWidth = 10
      FieldName = 'PR_EMP_ID_RQSTNR'
      Origin = 'P.PR_EMP_ID_RQSTNR'
      Visible = False
      Size = 0
    end
    object QryEMPNO_RQSTNR: TStringField
      DisplayWidth = 25
      FieldName = 'EMPNO_RQSTNR'
      Origin = 'P.EMPNO_RQSTNR'
      Visible = False
      Size = 25
    end
    object QryPRINT_COUNT: TBCDField
      DisplayWidth = 10
      FieldName = 'PRINT_COUNT'
      Origin = 'P.PRINT_COUNT'
      Visible = False
      Size = 0
    end
    object QryPRINT_LAST_USER: TStringField
      DisplayWidth = 35
      FieldName = 'PRINT_LAST_USER'
      Origin = 'P.PRINT_LAST_USER'
      Visible = False
      Size = 35
    end
    object QryPRINT_LAST_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'PRINT_LAST_DATE'
      Origin = 'P.PRINT_LAST_DATE'
      Visible = False
    end
    object QryPO_TYPE: TStringField
      DisplayWidth = 20
      FieldName = 'PO_TYPE'
      Origin = 'P.PO_TYPE'
      Visible = False
    end
    object QryVENDOR_CONTACT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_CONTACT_ID'
      Origin = 'P.VENDOR_CONTACT_ID'
      Visible = False
      Size = 0
    end
    object QryVENDOR_CONTACT_FIRST: TStringField
      DisplayWidth = 30
      FieldName = 'VENDOR_CONTACT_FIRST'
      Origin = 'P.VENDOR_CONTACT_FIRST'
      Visible = False
      Size = 30
    end
    object QryVENDOR_CONTACT_LAST: TStringField
      DisplayWidth = 30
      FieldName = 'VENDOR_CONTACT_LAST'
      Origin = 'P.VENDOR_CONTACT_LAST'
      Visible = False
      Size = 30
    end
    object QryID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'P.ID'
      Visible = False
      Size = 0
    end
    object QryTAX_CODES_TAX_RATE: TFMTBCDField
      DisplayWidth = 10
      FieldName = 'TAX_CODES_TAX_RATE'
      Origin = 'P.TAX_CODES_TAX_RATE'
      Visible = False
      Size = 6
    end
    object QryCOMPANY_COMPANY: TStringField
      DisplayWidth = 60
      FieldName = 'COMPANY_COMPANY'
      Origin = 'P.COMPANY_COMPANY'
      Visible = False
      Size = 60
    end
    object QryCOMPANY_ADDRESS1: TStringField
      DisplayWidth = 60
      FieldName = 'COMPANY_ADDRESS1'
      Origin = 'P.COMPANY_ADDRESS1'
      Visible = False
      Size = 60
    end
    object QryCOMPANY_ADDRESS2: TStringField
      DisplayWidth = 60
      FieldName = 'COMPANY_ADDRESS2'
      Origin = 'P.COMPANY_ADDRESS2'
      Visible = False
      Size = 60
    end
    object QryCOMPANY_ADDRESS3: TStringField
      DisplayWidth = 60
      FieldName = 'COMPANY_ADDRESS3'
      Origin = 'P.COMPANY_ADDRESS3'
      Visible = False
      Size = 60
    end
    object QryCOMPANY_CITY: TStringField
      DisplayWidth = 30
      FieldName = 'COMPANY_CITY'
      Origin = 'P.COMPANY_CITY'
      Visible = False
      Size = 30
    end
    object QryCOMPANY_STATE: TStringField
      DisplayWidth = 20
      FieldName = 'COMPANY_STATE'
      Origin = 'P.COMPANY_STATE'
      Visible = False
    end
    object QryCOMPANY_ZIP: TStringField
      DisplayWidth = 10
      FieldName = 'COMPANY_ZIP'
      Origin = 'P.COMPANY_ZIP'
      Visible = False
      Size = 10
    end
    object QryCOMPANY_COUNTRY: TStringField
      DisplayWidth = 25
      FieldName = 'COMPANY_COUNTRY'
      Origin = 'P.COMPANY_COUNTRY'
      Visible = False
      Size = 100
    end
    object QryTERMS_DAYS: TBCDField
      DisplayWidth = 10
      FieldName = 'TERMS_DAYS'
      Origin = 'P.TERMS_DAYS'
      Visible = False
      Size = 0
    end
    object QryTERMS_DISCOUNT: TBCDField
      DisplayWidth = 10
      FieldName = 'TERMS_DISCOUNT'
      Origin = 'P.TERMS_DISCOUNT'
      Visible = False
      Size = 3
    end
    object QryTERMS_DISCOUNT_DAYS: TBCDField
      DisplayWidth = 10
      FieldName = 'TERMS_DISCOUNT_DAYS'
      Origin = 'P.TERMS_DISCOUNT_DAYS'
      Visible = False
      Size = 0
    end
    object QryREMIT_TO_ADDR1: TStringField
      DisplayWidth = 60
      FieldName = 'REMIT_TO_ADDR1'
      Origin = 'P.REMIT_TO_ADDR1'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QryREMIT_TO_ADDR2: TStringField
      DisplayWidth = 60
      FieldName = 'REMIT_TO_ADDR2'
      Origin = 'P.REMIT_TO_ADDR2'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QryREMIT_TO_ADDR3: TStringField
      DisplayWidth = 60
      FieldName = 'REMIT_TO_ADDR3'
      Origin = 'P.REMIT_TO_ADDR3'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QryREMIT_TO_CITY: TStringField
      DisplayWidth = 30
      FieldName = 'REMIT_TO_CITY'
      Origin = 'P.REMIT_TO_CITY'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object QryREMIT_TO_STATE: TStringField
      DisplayWidth = 20
      FieldName = 'REMIT_TO_STATE'
      Origin = 'P.REMIT_TO_STATE'
      Visible = False
    end
    object QryREMIT_TO_ZIP: TStringField
      DisplayWidth = 10
      FieldName = 'REMIT_TO_ZIP'
      Origin = 'P.REMIT_TO_ZIP'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QryREMIT_TO_COUNTRY: TStringField
      DisplayWidth = 30
      FieldName = 'REMIT_TO_COUNTRY'
      Origin = 'P.REMIT_TO_COUNTRY'
      Visible = False
      FixedChar = True
      Size = 100
    end
    object QrySHIP_TO_ADDR1: TStringField
      DisplayWidth = 60
      FieldName = 'SHIP_TO_ADDR1'
      Origin = 'P.SHIP_TO_ADDR1'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QrySHIP_TO_ADDR2: TStringField
      DisplayWidth = 60
      FieldName = 'SHIP_TO_ADDR2'
      Origin = 'P.SHIP_TO_ADDR2'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QrySHIP_TO_ADDR3: TStringField
      DisplayWidth = 60
      FieldName = 'SHIP_TO_ADDR3'
      Origin = 'P.SHIP_TO_ADDR3'
      Visible = False
      FixedChar = True
      Size = 60
    end
    object QrySHIP_TO_CITY: TStringField
      DisplayWidth = 30
      FieldName = 'SHIP_TO_CITY'
      Origin = 'P.SHIP_TO_CITY'
      Visible = False
      FixedChar = True
      Size = 30
    end
    object QrySHIP_TO_STATE: TStringField
      DisplayWidth = 20
      FieldName = 'SHIP_TO_STATE'
      Origin = 'P.SHIP_TO_STATE'
      Visible = False
    end
    object QrySHIP_TO_COUNTRY: TStringField
      DisplayWidth = 30
      FieldName = 'SHIP_TO_COUNTRY'
      Origin = 'P.SHIP_TO_COUNTRY'
      Visible = False
      FixedChar = True
      Size = 100
    end
    object QrySHIP_TO_ZIP: TStringField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ZIP'
      Origin = 'P.SHIP_TO_ZIP'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object QryVENDOR_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'VENDOR_ID'
      Origin = 'P.VENDOR_ID'
      Visible = False
      Size = 0
    end
    object QryTERMS_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TERMS_ID'
      Origin = 'P.TERMS_ID'
      Visible = False
      Size = 0
    end
    object QryREMIT_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'REMIT_TO_ID'
      Origin = 'P.REMIT_TO_ID'
      Visible = False
      Size = 0
    end
    object QrySHIP_TO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'SHIP_TO_ID'
      Origin = 'P.SHIP_TO_ID'
      Visible = False
      Size = 0
    end
    object QryFREIGHT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'FREIGHT_ID'
      Origin = 'P.FREIGHT_ID'
      Visible = False
      Size = 0
    end
    object QryTAX_CODE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'TAX_CODE_ID'
      Origin = 'P.TAX_CODE_ID'
      Visible = False
      Size = 0
    end
    object QryCOMMENT1: TStringField
      DisplayWidth = 255
      FieldName = 'COMMENT1'
      Origin = 'P.COMMENT1'
      Visible = False
      Size = 255
    end
    object QryCOMPANY_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'COMPANY_ID'
      Origin = 'P.COMPANY_ID'
      Visible = False
      Size = 0
    end
    object QryVENDOR_ADDR2: TStringField
      DisplayWidth = 30
      FieldName = 'VENDOR_ADDR2'
      Origin = 'P.VENDOR_ADDR2'
      Visible = False
      Size = 60
    end
    object QryVENDOR_ADDR3: TStringField
      DisplayWidth = 60
      FieldName = 'VENDOR_ADDR3'
      Origin = 'P.VENDOR_ADDR3'
      Visible = False
      Size = 60
    end
  end
  object SR: TIQWebSecurityRegister
    SecurityItems.Strings = (
      'btnUnArchive'
      'UnArchive1')
    SecurityCode = 'FRMUNARCHIVEPOS'
    Left = 152
    Top = 118
  end
end

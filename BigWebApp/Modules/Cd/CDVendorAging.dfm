object FrmCDVendorAging: TFrmCDVendorAging
  Left = 0
  Top = 0
  ClientHeight = 212
  ClientWidth = 385
  Caption = 'Enterprise-Wide Aging'
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 25
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Alignment = taLeftJustify
    Caption = ''
  end
  object diAging: TwwDataInspector
    Left = 0
    Top = 25
    Width = 385
    Height = 187
    DisableThemes = False
    Align = alClient
    TabOrder = 1
    DataSource = SrcVendorAging
    Items = <
      item
        DataSource = SrcVendorAging
        DataField = 'p_current'
        Caption = 'Current'
        WordWrap = False
      end
      item
        DataSource = SrcVendorAging
        DataField = 'p_1_30'
        Caption = 'Overdue'
        WordWrap = False
      end
      item
        DataSource = SrcVendorAging
        DataField = 'p_30_60'
        Caption = 'Over 30'
        WordWrap = False
      end
      item
        DataSource = SrcVendorAging
        DataField = 'p_60_90'
        Caption = 'Over 60'
        WordWrap = False
      end
      item
        DataSource = SrcVendorAging
        DataField = 'p_90'
        Caption = 'Over 90'
        WordWrap = False
      end
      item
        DataSource = SrcVendorAging
        DataField = 'total_to_pay'
        Caption = 'Total'
        WordWrap = False
      end
      item
        DataSource = SrcVendorAging
        DataField = 'CREDIT_LIMIT'
        Caption = 'Credit Limit'
        WordWrap = False
      end
      item
        DataSource = SrcVendorAging
        DataField = 'open_to_buy'
        Caption = 'Open to Buy'
        WordWrap = False
      end
      item
        DataSource = SrcVendorAging
        DataField = 'total_overdue'
        Caption = 'Total Overdue'
        WordWrap = False
      end
      item
        DataSource = SrcVendorAging
        DataField = 'Curr_code'
        Caption = 'Currency'
        WordWrap = False
      end>
    CaptionWidth = 112
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
  end
  object SrcVendorAging: TDataSource
    DataSet = ViewVendorAging
    Left = 12
    Top = 83
  end
  object ViewVendorAging: TFDQuery
    Tag = 1
    OnCalcFields = ViewVendorAgingCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      'select v.id as vendor_id,'
      '       v.vendorno,'
      '       v.company,'
      '       v.attn,'
      '       v.addr1,'
      '       v.addr2,'
      '       v.addr3,'
      '       v.city,'
      '       v.state,'
      '       v.zip,'
      '       v.country,       '
      '       v.phone_number,'
      '       v.fax_number,'
      '       v.use_usa_mask,'
      '       v.credit_limit,'
      '       v.ytd_purchases,'
      '       v.currency_id'
      ' from v_vendor v'
      'where id = :aId '
      '')
    Left = 20
    Top = 91
    ParamData = <
      item
        Name = 'aId'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object ViewVendorAgingVENDORNO: TStringField
      FieldName = 'VENDORNO'
      Origin = 'VENDOR.VENDORNO'
      Size = 10
    end
    object ViewVendorAgingCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'VENDOR.COMPANY'
      Size = 60
    end
    object ViewVendorAgingATTN: TStringField
      FieldName = 'ATTN'
      Origin = 'VENDOR.ATTN'
      Size = 30
    end
    object ViewVendorAgingADDR1: TStringField
      FieldName = 'ADDR1'
      Origin = 'VENDOR.ADDR1'
      Size = 60
    end
    object ViewVendorAgingADDR2: TStringField
      FieldName = 'ADDR2'
      Origin = 'VENDOR.ADDR2'
      Size = 60
    end
    object ViewVendorAgingADDR3: TStringField
      FieldName = 'ADDR3'
      Origin = 'VENDOR.ADDR3'
      Size = 60
    end
    object ViewVendorAgingCITY: TStringField
      FieldName = 'CITY'
      Origin = 'VENDOR.CITY'
      Size = 30
    end
    object ViewVendorAgingSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'VENDOR.STATE'
    end
    object ViewVendorAgingCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Origin = 'VENDOR.COUNTRY'
      Size = 30
    end
    object ViewVendorAgingZIP: TStringField
      FieldName = 'ZIP'
      Origin = 'VENDOR.ZIP'
      Size = 10
    end
    object ViewVendorAgingPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Origin = 'IQ.VENDOR.PHONE_NUMBER'
      Size = 25
    end
    object ViewVendorAgingFAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      Origin = 'IQ.VENDOR.FAX_NUMBER'
      Size = 25
    end
    object ViewVendorAgingUSE_USA_MASK: TStringField
      FieldName = 'USE_USA_MASK'
      Origin = 'IQ.VENDOR.USE_USA_MASK'
      FixedChar = True
      Size = 1
    end
    object ViewVendorAgingCREDIT_LIMIT: TBCDField
      FieldName = 'CREDIT_LIMIT'
      Origin = 'VENDOR.CREDIT_LIMIT'
      currency = True
      Size = 2
    end
    object ViewVendorAgingYTD_PURCHASES: TBCDField
      FieldName = 'YTD_PURCHASES'
      Origin = 'VENDOR.YTD_PURCHASES'
      Size = 2
    end
    object ViewVendorAgingp_current: TFloatField
      FieldKind = fkCalculated
      FieldName = 'p_current'
      currency = True
      Calculated = True
    end
    object ViewVendorAgingp_1_30: TFloatField
      FieldKind = fkCalculated
      FieldName = 'p_1_30'
      currency = True
      Calculated = True
    end
    object ViewVendorAgingp_30_60: TFloatField
      FieldKind = fkCalculated
      FieldName = 'p_30_60'
      currency = True
      Calculated = True
    end
    object ViewVendorAgingp_60_90: TFloatField
      FieldKind = fkCalculated
      FieldName = 'p_60_90'
      currency = True
      Calculated = True
    end
    object ViewVendorAgingp_90: TFloatField
      FieldKind = fkCalculated
      FieldName = 'p_90'
      currency = True
      Calculated = True
    end
    object ViewVendorAgingtotal_to_pay: TFloatField
      FieldKind = fkCalculated
      FieldName = 'total_to_pay'
      currency = True
      Calculated = True
    end
    object ViewVendorAgingopen_to_buy: TFloatField
      FieldKind = fkCalculated
      FieldName = 'open_to_buy'
      currency = True
      Calculated = True
    end
    object ViewVendorAgingtotal_overdue: TFloatField
      FieldKind = fkCalculated
      FieldName = 'total_overdue'
      currency = True
      Calculated = True
    end
    object ViewVendorAgingVENDOR_ID: TBCDField
      FieldName = 'VENDOR_ID'
      Origin = 'VENDOR.ID'
      Size = 0
    end
    object ViewVendorAgingCurr_code: TStringField
      FieldKind = fkCalculated
      FieldName = 'Curr_code'
      Calculated = True
    end
    object ViewVendorAgingCURRENCY_ID: TBCDField
      FieldName = 'CURRENCY_ID'
      Origin = 'IQ.VENDOR.CURRENCY_ID'
      Size = 0
    end
    object ViewVendorAgingVendorAddress: TStringField
      FieldKind = fkCalculated
      FieldName = 'VendorAddress'
      Size = 4000
      Calculated = True
    end
  end
  object ProcOverdue: TFDStoredProc
    Connection = UniMainModule.FDConnection1
    StoredProcName = 'IQMS.GL.GET_AP_OVERDUE_SUM_PROC'
    Left = 88
    Top = 88
    ParamData = <
      item
        Name = 'V_VENDOR_ID'
        DataType = ftFMTBcd
        ParamType = ptInput
      end
      item
        Name = 'V_CURRENT'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_1_30'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_30_60'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_60_90'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_90'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_TOTAL_OVERDUE'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end
      item
        Name = 'V_TOTAL_TO_PAY'
        DataType = ftFMTBcd
        ParamType = ptOutput
      end>
  end
end

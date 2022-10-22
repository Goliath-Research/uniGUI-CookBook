object FrmCRMSoConfigSummary: TFrmCRMSoConfigSummary
  Left = 0
  Top = 0
  ClientHeight = 254
  ClientWidth = 333
  Caption = 'Sales Configuration Summary'
  OnShow = FormShow
  BorderStyle = bsSizeToolWin
  OldCreateOrder = False
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object diSummary: TwwDataInspector
    Left = 0
    Top = 0
    Width = 333
    Height = 254
    DisableThemes = False
    Align = alClient
    PopupMenu = PMain
    TabOrder = 0
    DataSource = SrcData
    Items = <
      item
        DataSource = SrcData
        DataField = 'RFQ'
        Caption = 'CRM RFQ #'
        Expanded = True
        Items = <
          item
            DataSource = SrcData
            DataField = 'PROJECT'
            Caption = 'Description'
            WordWrap = False
          end
          item
            DataSource = SrcData
            DataField = 'REV'
            Caption = 'Revision'
            WordWrap = False
          end
          item
            DataSource = SrcData
            DataField = 'QUOTE_DATE'
            Caption = 'Quote Date'
            WordWrap = False
          end
          item
            DataSource = SrcData
            DataField = 'EXPIRATION_DATE'
            Caption = 'Expiration Date'
            WordWrap = False
          end
          item
            DataSource = SrcData
            DataField = 'ARCUSTO_COMPANY'
            Caption = 'Customer'
            WordWrap = False
          end>
        WordWrap = False
      end
      item
        DataSource = SrcData
        DataField = 'SOURCE_DISPLAY'
        Caption = 'Description'
        WordWrap = False
      end
      item
        DataSource = SrcData
        DataField = 'TotalConfigPrice'
        Caption = 'Total Unit Configuration Price'
        WordWrap = False
      end
      item
        DataSource = SrcData
        DataField = 'TotalUnitCost'
        Caption = 'Total Unit Standard Cost'
        WordWrap = False
      end
      item
        DataSource = SrcData
        DataField = 'TotalGrossProfit'
        Caption = 'Total Unit Gross Profit'
        WordWrap = False
      end
      item
        DataSource = SrcData
        DataField = 'TotalGrossProfitPercent'
        Caption = 'Total Unit Gross Profit %'
        WordWrap = False
      end
      item
        DataSource = SrcData
        DataField = 'GrandTotalConfigPrice'
        Caption = 'Grand Total Price'
        WordWrap = False
      end
      item
        DataSource = SrcData
        DataField = 'GrandTotalCost'
        Caption = 'Grand Total Cost'
        WordWrap = False
      end
      item
        DataSource = SrcData
        DataField = 'GrandTotalProfit'
        Caption = 'Grand Total Profit'
        WordWrap = False
      end
      item
        DataSource = SrcData
        DataField = 'GrandTotalProfitPercent'
        Caption = 'Grand Total Profit %'
        WordWrap = False
      end>
    CaptionWidth = 169
    Options = [ovColumnResize, ovRowResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    LineStyleCaption = ovDottedLine
    LineStyleData = ovDottedLine
    ReadOnly = True
  end
  object SrcData: TDataSource
    DataSet = QryData
    Left = 112
    Top = 120
  end
  object QryData: TFDQuery
    BeforeOpen = QryDataBeforeOpen
    OnCalcFields = QryDataCalcFields
    Connection = UniMainModule.FDConnection1
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    SQL.Strings = (
      
        'SELECT a.id AS id, a.rfq AS rfq, a.project AS project, a.rev AS ' +
        'rev,'
      
        '       a.quote_date AS quote_date, a.expiration_date AS expirati' +
        'on_date,'
      
        '       a.arcusto_company AS arcusto_company, b.id AS crm_quote_d' +
        'etail_id,'
      
        '       b.source_id AS source_id, b.source_display AS source_disp' +
        'lay'
      '  FROM crm_quote a, crm_quote_detail b'
      ' WHERE b.id = :ID AND'
      '       a.id = b.crm_quote_id AND'
      '       b.source = '#39'SALES_CONFIG'#39)
    Left = 120
    Top = 128
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryDataID: TFloatField
      FieldName = 'ID'
      Origin = 'a.id'
    end
    object QryDataRFQ: TStringField
      DisplayLabel = 'CRM RFQ #'
      FieldName = 'RFQ'
      Origin = 'a.rfq'
      FixedChar = True
      Size = 10
    end
    object QryDataPROJECT: TStringField
      DisplayLabel = 'Description'
      FieldName = 'PROJECT'
      Origin = 'a.project'
      Size = 35
    end
    object QryDataREV: TFloatField
      DisplayLabel = 'Revision'
      FieldName = 'REV'
      Origin = 'a.rev'
    end
    object QryDataQUOTE_DATE: TDateTimeField
      DisplayLabel = 'Quote Date'
      FieldName = 'QUOTE_DATE'
      Origin = 'a.quote_date'
      DisplayFormat = 'ddddd'
    end
    object QryDataEXPIRATION_DATE: TDateTimeField
      DisplayLabel = 'Expiration Date'
      FieldName = 'EXPIRATION_DATE'
      Origin = 'a.expiration_date'
      DisplayFormat = 'ddddd'
    end
    object QryDataARCUSTO_COMPANY: TStringField
      DisplayLabel = 'Customer'
      FieldName = 'ARCUSTO_COMPANY'
      Origin = 'a.arcusto_company'
      Size = 60
    end
    object QryDataCRM_QUOTE_DETAIL_ID: TFloatField
      FieldName = 'CRM_QUOTE_DETAIL_ID'
      Origin = 'b.id'
      Visible = False
    end
    object QryDataSOURCE_ID: TFloatField
      FieldName = 'SOURCE_ID'
      Origin = 'b.source_id'
      Visible = False
    end
    object QryDataSOURCE_DISPLAY: TStringField
      DisplayLabel = 'Description'
      FieldName = 'SOURCE_DISPLAY'
      Origin = 'b.source_display'
      Size = 250
    end
    object QryDataTotalConfigPrice: TFloatField
      DisplayLabel = 'Total Configuration Price'
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'TotalConfigPrice'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QryDataTotalUnitCost: TFloatField
      DisplayLabel = 'Total Unit Standard Cost'
      FieldKind = fkCalculated
      FieldName = 'TotalUnitCost'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QryDataTotalGrossProfit: TFloatField
      DisplayLabel = 'Total Unit Gross Profit'
      FieldKind = fkCalculated
      FieldName = 'TotalGrossProfit'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QryDataTotalGrossProfitPercent: TFloatField
      DisplayLabel = 'Total Unit Gross Profit %'
      FieldKind = fkCalculated
      FieldName = 'TotalGrossProfitPercent'
      DisplayFormat = '#,##0.00 %'
      Calculated = True
    end
    object QryDataGrandTotalConfigPrice: TFloatField
      DisplayLabel = 'Grand Total Price'
      FieldKind = fkCalculated
      FieldName = 'GrandTotalConfigPrice'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QryDataGrandTotalCost: TFloatField
      DisplayLabel = 'Grand Total Cost'
      FieldKind = fkCalculated
      FieldName = 'GrandTotalCost'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QryDataGrandTotalProfit: TFloatField
      DisplayLabel = 'Grand Total Profit'
      FieldKind = fkCalculated
      FieldName = 'GrandTotalProfit'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object QryDataGrandTotalProfitPercent: TFloatField
      DisplayLabel = 'Grand Total Profit %'
      FieldKind = fkCalculated
      FieldName = 'GrandTotalProfitPercent'
      DisplayFormat = '#,##0.00 %'
      Calculated = True
    end
  end
  object PMain: TUniPopupMenu
    Left = 176
    Top = 120
    object CopySummarytoClipboard1: TUniMenuItem
      Caption = 'Copy Summary to Clipboard'
      ShortCut = 24643
      OnClick = CopySummarytoClipboard1Click
    end
  end
end

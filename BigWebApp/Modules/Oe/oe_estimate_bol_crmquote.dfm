inherited FrmEstimateBOLCRMQuote: TFrmEstimateBOLCRMQuote
  Left = 312
  Top = 202
  OldCreateOrder = True
  OnCreate = FormCreate
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TUniPanel
    inherited pnlHdrLeft01: TUniPanel
      inherited Panel3: TUniPanel
        object NavHeader: TUniDBNavigator
          Left = 134
          Top = 1
          Width = 79
          Height = 25
          Hint = ''
          DataSource = SrcHeader
          VisibleButtons = [nbPost, nbCancel, nbRefresh]
          Align = alRight
          Anchors = [akTop, akRight, akBottom]
          TabOrder = 0
        end
      end
      inherited wwDataInspector1: TwwDataInspector
        Items = <
          item
            DataSource = SrcHeader
            DataField = 'RFQ'
            Caption = 'Quote #'
            ReadOnly = True
            WordWrap = False
          end
          item
            DataSource = SrcHeader
            DataField = 'FREIGHT_QUOTENO'
            Caption = 'Freight Quote #'
            Expanded = True
            Items = <
              item
                DataSource = SrcHeader
                DataField = 'FREIGHT_CHARGE'
                Caption = 'Total Charge'
                WordWrap = False
              end>
            WordWrap = False
          end>
      end
    end
    inherited pnlHdrClient01: TUniPanel
      inherited wwDBGridItem: TIQUniGridControl
        IQComponents.FormTab.ExplicitLeft = 0
        IQComponents.FormTab.ExplicitTop = 0
        IQComponents.FormTab.ExplicitWidth = 256
        IQComponents.FormTab.ExplicitHeight = 128
        Marker = 0
      end
    end
  end
  inherited pnlClient01: TUniPanel
    inherited wwDBGridBol: TIQUniGridControl
      IQComponents.FormTab.ExplicitLeft = 0
      IQComponents.FormTab.ExplicitTop = 0
      IQComponents.FormTab.ExplicitWidth = 256
      IQComponents.FormTab.ExplicitHeight = 128
      Columns = <
        item
          FieldName = 'VOLUME'
          Title.Caption = 'Volume'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'CLASS'
          Title.Caption = 'Class'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BUMPED'
          Title.Caption = 'Bumped'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'NMFC_CODE'
          Title.Caption = 'NMFC'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'COMMENT1'
          Title.Caption = 'Comment'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'LBS_CU_FT'
          Title.Caption = 'Weight/Volume Act'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'Lbs_Cu_Ft_Std'
          Title.Caption = 'Weight/Volume Std'
          Width = 64
          ReadOnly = True
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'WEIGHT'
          Title.Caption = 'Total Weight'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL_BOXES'
          Title.Caption = 'Total Boxes'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'BOX_QTY'
          Title.Caption = 'Box Qty'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end>
      Marker = 0
    end
  end
  inherited QryHeader: TFDQuery
    BeforeOpen = QryHeaderBeforeOpen
    AfterPost = QryHeaderAfterPost
    CachedUpdates = True
    OnUpdateRecord = QryHeaderUpdateRecord
    UpdateOptions.EnableUpdate = True
    UpdateOptions.UpdateTableName = 'CRM_QUOTE'
    UpdateOptions.KeyFields = 'ID'
    SQL.Strings = (
      'select id,'
      '       rfq,'
      '       freight_charge,'
      '       freight_quoteno,'
      '       freight_id'
      '  from crm_quote'
      ' where id = :ID')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryHeaderRFQ: TStringField
      DisplayLabel = 'Quote #'
      FieldName = 'RFQ'
      Origin = 'IQ.CRM_QUOTE.RFQ'
      FixedChar = True
      Size = 10
    end
    object QryHeaderFREIGHT_CHARGE: TFMTBCDField
      DisplayLabel = 'Freight Charge'
      FieldName = 'FREIGHT_CHARGE'
      Origin = 'IQ.CRM_QUOTE.FREIGHT_CHARGE'
      DisplayFormat = '#,##0.00'
      Size = 6
    end
    object QryHeaderFREIGHT_QUOTENO: TStringField
      DisplayLabel = 'Freight Quote #'
      FieldName = 'FREIGHT_QUOTENO'
      Origin = 'IQ.CRM_QUOTE.FREIGHT_QUOTENO'
      Size = 30
    end
    object QryHeaderFREIGHT_ID: TBCDField
      FieldName = 'FREIGHT_ID'
      Origin = 'IQ.CRM_QUOTE.FREIGHT_ID'
      Size = 0
    end
  end
  inherited QryItem: TFDQuery
    MasterFields = 'ID'
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT id AS id, '
      '       crm_quote_id AS crm_quote_id, '
      '       seq AS seq, '
      '       qty AS qty, '
      '       source_descrip AS source_descrip, '
      '       source_display AS source_display, '
      '       descrip2 AS descrip2,'
      '       unit AS unit'
      'FROM v_crm_quote_detail_simple'
      'WHERE crm_quote_id = :ID'
      'ORDER BY seq')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 34
        Value = Null
      end>
    object QryItemSEQ: TBCDField [0]
      DisplayLabel = '#'
      DisplayWidth = 10
      FieldName = 'SEQ'
      Origin = 'V_CRM_QUOTE_DETAIL.SEQ'
      Size = 0
    end
    object QryItemQTY: TBCDField [1]
      DisplayLabel = 'Quantity'
      DisplayWidth = 10
      FieldName = 'QTY'
      Origin = 'V_CRM_QUOTE_DETAIL.QTY'
    end
    object QryItemSOURCE_DESCRIP: TStringField [2]
      DisplayLabel = 'Source'
      DisplayWidth = 30
      FieldName = 'SOURCE_DESCRIP'
      Origin = 'IQ.V_CRM_QUOTE_DETAIL.SOURCE_DESCRIP'
      Size = 60
    end
    object QryItemSOURCE_DISPLAY: TStringField [3]
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'SOURCE_DISPLAY'
      Origin = 'V_CRM_QUOTE_DETAIL.SOURCE_DISPLAY'
      Size = 250
    end
    object QryItemDESCRIP2: TStringField [4]
      DisplayLabel = 'Extended Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP2'
      Origin = 'V_CRM_QUOTE_DETAIL.DESCRIP2'
      Size = 100
    end
    object QryItemUNIT: TStringField [5]
      DisplayLabel = 'UOM'
      DisplayWidth = 10
      FieldName = 'UNIT'
      Origin = 'V_CRM_QUOTE_DETAIL.UNIT'
      Size = 10
    end
    inherited QryItemSource: TStringField
      Visible = False
    end
    inherited QryItemSource_ID: TFloatField
      Visible = False
    end
    inherited QryItemID: TBCDField
      Origin = 'v_crm_quote_detail.id'
      Visible = False
    end
    object QryItemCRM_QUOTE_ID: TBCDField
      FieldName = 'CRM_QUOTE_ID'
      Origin = 'V_CRM_QUOTE_DETAIL.CRM_QUOTE_ID'
      Visible = False
      Size = 0
    end
  end
end

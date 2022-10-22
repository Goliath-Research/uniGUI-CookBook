inherited FrmCRMDrillDown_Invoices: TFrmCRMDrillDown_Invoices
  ClientHeight = 379
  ClientWidth = 645
  Caption = 'Invoices'
  OldCreateOrder = True
  ExplicitWidth = 661
  ExplicitHeight = 418
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Width = 645
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 645
  end
  inherited PnlGrid: TUniPanel
    Width = 645
    Height = 349
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 645
    ExplicitHeight = 349
    inherited Grid: TIQUniGridControl
      Width = 643
      Height = 347
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      IQComponents.Grid.Width = 426
      IQComponents.Grid.Height = 261
      IQComponents.HiddenPanel.Left = 426
      IQComponents.HiddenPanel.Height = 261
      IQComponents.HiddenPanel.ExplicitLeft = 426
      IQComponents.HiddenPanel.ExplicitHeight = 261
      IQComponents.FormTab.ExplicitWidth = 635
      IQComponents.FormTab.ExplicitHeight = 290
      Columns = <
        item
          FieldName = 'COMPANY'
          Title.Caption = 'Company'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INVOICE_NO'
          Title.Caption = 'Invoice #'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INVOICE_DATE'
          Title.Caption = 'Invoice Date'
          Width = 91
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'INVOICE_QTY'
          Title.Caption = 'Invoice Qty'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_ITEMNO'
          Title.Caption = 'Item #'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_DESCRIP'
          Title.Caption = 'Item Description'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_DESCRIP2'
          Title.Caption = 'Item Extended Description'
          Width = 84
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'ARINVT_REV'
          Title.Caption = 'Item Revision'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'UNIT_PRICE'
          Title.Caption = 'Unit Price'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'TOTAL_AMT'
          Title.Caption = 'Total Amount'
          Width = 70
          CheckBoxField.FieldValues = 'true;false'
        end>
      ExplicitWidth = 643
      ExplicitHeight = 347
      Marker = 0
    end
  end
  inherited PnlToolbar: TUniPanel
    Width = 645
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitWidth = 645
    inherited Nav: TUniDBNavigator
      Left = 546
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 546
    end
  end
  inherited SrcInformation: TDataSource
    Left = 256
    Top = 16
  end
  inherited QryInformation: TFDQuery
    BeforeOpen = QryInformationBeforeOpen
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select'
      '    o.id as arcusto_id,'
      '    o.company,'
      '    c.id as arinvoice_id,'
      '    d.id as arinvoice_detail_id,'
      '    c.invoice_no,'
      '    c.invoice_date,'
      '    d.arinvt_id,'
      '    d.arinvt_itemno,'
      '    d.arinvt_descrip,'
      '    d.arinvt_descrip2,'
      '    d.arinvt_rev,'
      '    d.invoice_qty,'
      '    d.unit_price,'
      '    NVL( d.invoice_qty, 0) * NVL(d.unit_price, 0) as total_amt'
      'from'
      '    arinvoice c,'
      '    arinvoice_detail d,'
      '    arcusto o'
      'where'
      '    o.id(+) = c.arcusto_id and'
      '    c.id = d.arinvoice_id and'
      '    LTrim( RTrim( d.arinvt_itemno )) = :itemno and'
      '    c.arcusto_id = :arcusto_id'
      '')
    Left = 184
    Top = 16
    ParamData = <
      item
        Name = 'itemno'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'arcusto_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryInformationCOMPANY: TStringField
      DisplayLabel = 'Company'
      DisplayWidth = 10
      FieldName = 'COMPANY'
      FixedChar = True
      Size = 60
    end
    object QryInformationINVOICE_NO: TStringField
      DisplayLabel = 'Invoice #'
      DisplayWidth = 10
      FieldName = 'INVOICE_NO'
      Size = 25
    end
    object QryInformationINVOICE_DATE: TDateTimeField
      DisplayLabel = 'Invoice Date'
      DisplayWidth = 13
      FieldName = 'INVOICE_DATE'
    end
    object QryInformationINVOICE_QTY: TBCDField
      DisplayLabel = 'Invoice Qty'
      DisplayWidth = 10
      FieldName = 'INVOICE_QTY'
    end
    object QryInformationARINVT_ITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 10
      FieldName = 'ARINVT_ITEMNO'
      FixedChar = True
      Size = 50
    end
    object QryInformationARINVT_DESCRIP: TStringField
      DisplayLabel = 'Item Description'
      DisplayWidth = 12
      FieldName = 'ARINVT_DESCRIP'
      Size = 100
    end
    object QryInformationARINVT_DESCRIP2: TStringField
      DisplayLabel = 'Item Extended Description'
      DisplayWidth = 12
      FieldName = 'ARINVT_DESCRIP2'
      Size = 100
    end
    object QryInformationARINVT_REV: TStringField
      DisplayLabel = 'Item Revision'
      DisplayWidth = 10
      FieldName = 'ARINVT_REV'
      FixedChar = True
      Size = 15
    end
    object QryInformationUNIT_PRICE: TFMTBCDField
      DisplayLabel = 'Unit Price'
      DisplayWidth = 10
      FieldName = 'UNIT_PRICE'
      Size = 6
    end
    object QryInformationTOTAL_AMT: TFMTBCDField
      DisplayLabel = 'Total Amount'
      DisplayWidth = 10
      FieldName = 'TOTAL_AMT'
      Size = 38
    end
    object QryInformationARCUSTO_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARCUSTO_ID'
      Visible = False
      Size = 0
    end
    object QryInformationARINVOICE_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVOICE_ID'
      Visible = False
      Size = 0
    end
    object QryInformationARINVOICE_DETAIL_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVOICE_DETAIL_ID'
      Visible = False
      Size = 0
    end
    object QryInformationARINVT_ID: TBCDField
      DisplayWidth = 10
      FieldName = 'ARINVT_ID'
      Visible = False
      Size = 0
    end
  end
  object JARInvoice: TIQWebJump
    DataField = 'ARINVOICE_ID'
    DataSource = SrcInformation
    JumpTo = jtARInvoice
    Left = 328
    Top = 16
  end
end

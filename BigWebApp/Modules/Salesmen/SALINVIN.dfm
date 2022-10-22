object FrmCommInvoiceInfo: TFrmCommInvoiceInfo
  Left = 350
  Top = 151
  ClientHeight = 409
  ClientWidth = 280
  Caption = 'Invoice Summary'
  BorderStyle = bsSizeToolWin
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnClose = FormClose
  MonitoredKeys.Keys = <>
  Font.Height = -14
  PixelsPerInch = 96
  TextHeight = 17
  object Panel1: TUniPanel
    Left = 0
    Top = 0
    Width = 280
    Height = 409
    Hint = ''
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 206
    object diSummary: TwwDataInspector
      Left = 0
      Top = 0
      Width = 280
      Height = 409
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DisableThemes = False
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 0
      Items = <
        item
          DataField = 'ARCUSTO_CUSTNO'
          Caption = 'Customer #'
          Expanded = True
          Items = <
            item
              DataField = 'ARCUSTO_COMPANY'
              Caption = 'Company'
              WordWrap = False
            end
            item
              DataField = 'ARCUSTO_ADDR1'
              Caption = 'Address 1'
              WordWrap = False
            end
            item
              DataField = 'ARCUSTO_ADDR2'
              Caption = 'Address 2'
              WordWrap = False
            end
            item
              DataField = 'ARCUSTO_ADDR3'
              Caption = 'Address 3'
              WordWrap = False
            end
            item
              DataField = 'ARCUSTO_CITY'
              Caption = 'City'
              WordWrap = False
            end
            item
              DataField = 'ARCUSTO_STATE'
              Caption = 'State or Region'
              WordWrap = False
            end
            item
              DataField = 'ARCUSTO_ZIP'
              Caption = 'Postal Code'
              WordWrap = False
            end
            item
              DataField = 'ARCUSTO_COUNTRY'
              Caption = 'Country'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataField = 'INVOICE_NO'
          Caption = 'Invoice #'
          Expanded = True
          Items = <
            item
              DataField = 'INVOICE_DATE'
              Caption = 'Invoice Date'
              WordWrap = False
            end
            item
              DataField = 'DUE_DATE'
              Caption = 'Due Date'
              WordWrap = False
            end
            item
              DataField = 'NOTES'
              Caption = 'Note'
              WordWrap = False
            end>
          WordWrap = False
        end
        item
          DataField = 'ARINVT_ITEMNO'
          Caption = 'Inventory Item #'
          Expanded = True
          Items = <
            item
              DataField = 'ARINVT_DESCRIP'
              Caption = 'Description'
              WordWrap = False
            end
            item
              DataField = 'ARINVT_DESCRIP2'
              Caption = 'Extended Description'
              WordWrap = False
            end
            item
              DataField = 'ARINVT_CLASS'
              Caption = 'Class'
              WordWrap = False
            end
            item
              DataField = 'ARINVT_REV'
              Caption = 'Revision'
              WordWrap = False
            end
            item
              DataField = 'INVOICE_QTY'
              Caption = 'Invoice Quantity'
              WordWrap = False
            end
            item
              DataField = 'UNIT_PRICE'
              Caption = 'Unit Price'
              WordWrap = False
            end
            item
              DataField = 'MISC_COMMENT'
              Caption = 'Comment'
              WordWrap = False
            end>
          WordWrap = False
        end>
      CaptionWidth = 142
      Options = [ovColumnResize, ovEnterToTab, ovHighlightActiveRow, ovCenterCaptionVert]
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'Tahoma'
      CaptionFont.Style = []
      LineStyleCaption = ovDottedLine
      LineStyleData = ovDottedLine
      ReadOnly = True
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 278
      ExplicitHeight = 204
    end
  end
end

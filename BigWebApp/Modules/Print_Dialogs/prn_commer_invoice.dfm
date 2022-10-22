inherited FrmPrintCommerInvoice: TFrmPrintCommerInvoice
  ExplicitWidth = 445
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited tabSelectionCriteria: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 421
      ExplicitHeight = 302
      inherited pnlCriteriaBottom: TUniPanel
        inherited lblPrinting: TUniLabel
          TabOrder = 4
        end
        object cbAutoEmail: TUniCheckBox
          Left = 14
          Top = 40
          Width = 313
          Height = 17
          Hint = ''
          Caption = 'Send Auto Email Only. Do not Print Report'
          TabOrder = 1
          OnClick = cbAutoEmailClick
        end
        object cbPrintOnly: TUniCheckBox
          Left = 14
          Top = 56
          Width = 313
          Height = 17
          Hint = ''
          Caption = 'Print Only.  Do not Auto Email'
          TabOrder = 2
          OnClick = cbPrintOnlyClick
        end
      end
      inherited pnlCriteriaTop: TUniPanel
        inherited pnlCriteriaRight: TUniPanel
          ExplicitLeft = 260
        end
      end
    end
    inherited tabDestination: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 421
      ExplicitHeight = 302
      inherited PnlDestinationPCCarrier: TUniPanel
        inherited pgctrDestination: TUniPageControl
          ActivePage = tabFile
          inherited tabPrinter: TUniTabSheet
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 245
          end
          inherited tabScreen: TUniTabSheet
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 245
          end
          inherited tabFile: TUniTabSheet
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 245
          end
          inherited tabEmail: TUniTabSheet
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 245
          end
          inherited tabFax: TUniTabSheet
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 245
            inherited pnlFaxClient: TUniPanel
              inherited bvLeftBuffer: TUniPanel
                Top = 3
                Height = 238
                ExplicitTop = 3
                ExplicitHeight = 238
              end
              inherited bvRightBuffer: TUniPanel
                Left = 383
                Top = 3
                Height = 238
                ExplicitLeft = 383
                ExplicitTop = 3
                ExplicitHeight = 238
              end
              inherited bvBottomBuffer: TUniPanel
                Top = 241
                ExplicitTop = 241
              end
              inherited lviewFaxRecipients: TListView
                Left = 3
                Top = 3
                Width = 380
                Height = 238
                ExplicitLeft = 3
                ExplicitTop = 3
                ExplicitWidth = 380
                ExplicitHeight = 238
              end
            end
          end
        end
      end
    end
  end
  inherited pnlButtons: TUniPanel
    inherited pnlButtonsRight: TUniPanel
      Left = 115
      ExplicitLeft = 115
    end
  end
  inherited wwQryLookup: TFDQuery
    SQL.Strings = (
      'select packslipno,'
      '       class,'
      '       itemno,'
      '       rev,'
      '       descrip'
      '  from c_ship_hist'
      'where packslipno > '#39' '#39
      '    and misc.eplant_filter(eplant_id) = 1'
      ' order by packslipno')
    object wwQryLookupPACKSLIPNO: TStringField
      DisplayLabel = 'PS #'
      DisplayWidth = 15
      FieldName = 'PACKSLIPNO'
      Size = 15
    end
    object wwQryLookupITEMNO: TStringField
      DisplayLabel = 'Item #'
      DisplayWidth = 25
      FieldName = 'ITEMNO'
      FixedChar = True
      Size = 50
    end
    object wwQryLookupDESCRIP: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 30
      FieldName = 'DESCRIP'
      Size = 100
    end
    object wwQryLookupREV: TStringField
      DisplayLabel = 'Rev'
      DisplayWidth = 15
      FieldName = 'REV'
      FixedChar = True
      Size = 15
    end
    object wwQryLookupCLASS: TStringField
      DisplayLabel = 'Class'
      DisplayWidth = 2
      FieldName = 'CLASS'
      FixedChar = True
      Size = 2
    end
  end
  inherited QryMain: TFDQuery
    SQL.Strings = (
      'select id,'
      '       '#39' '#39' as mfg_type,'
      '       packslipno'
      '       arcusto_id,'
      '       ship_to_id'
      '  from '
      '       shipments'
      ' where '
      '       RTrim(packslipno) between :param1 and :param2'
      '   and misc.eplant_filter(eplant_id) = 1'
      ' order by packslipno'
      ' '
      ' '
      ' '
      ' ')
    Top = 197
    ParamData = <
      item
        Name = 'param1'
        DataType = ftString
      end
      item
        Name = 'param2'
        DataType = ftString
      end>
  end
  inherited QryDocs: TFDQuery
    SQL.Strings = (
      'select 1'
      '  from dual'
      ' where 0 > 1'
      '-- this is just a stub'
      '')
    Top = 197
  end
  inherited QryDocsExt: TFDQuery
    SQL.Strings = (
      'select 1'
      '  from dual'
      ' where 0 > 1'
      '-- this is just a stub'
      '')
    Left = 65
    Top = 197
  end
end

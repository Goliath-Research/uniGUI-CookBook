inherited FrmPrintDocsCRMQuote: TFrmPrintDocsCRMQuote
  Left = 407
  Top = 206
  Caption = 'Print Sales Quotation'
  Constraints.MinHeight = 276
  Constraints.MinWidth = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TUniSplitter
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
  end
  inherited PageControl1: TUniPageControl
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    inherited tabSelectionCriteria: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      inherited pnlCriteriaBottom: TUniPanel
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        inherited lblPrinting: TUniLabel
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
        inherited edStatus: TUniEdit
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
      end
      inherited pnlCriteriaTop: TUniPanel
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        inherited Label1: TUniLabel
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
        inherited wwcombFrom: TUniDBLookupComboBox
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
        inherited pnlCriteriaRight: TUniPanel
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          inherited Label2: TUniLabel
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
          inherited wwcombTo: TUniDBLookupComboBox
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
          end
        end
        inherited chkExcludeAttachedDocs: TUniCheckBox
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
      end
    end
    inherited tabDestination: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitWidth = 421
      ExplicitHeight = 302
      inherited PnlDestinationPCCarrier: TUniPanel
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        inherited pgctrDestination: TUniPageControl
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          inherited tabPrinter: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 245
            inherited Label3: TUniLabel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
          end
          inherited tabScreen: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 245
            inherited Label4: TUniLabel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
          end
          inherited tabFile: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitWidth = 411
            ExplicitHeight = 245
            inherited Splitter2: TUniSplitter
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited pnlFileRight: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited btnSaveFile: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited pnlFileClient: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited edSaveFile: TUniEdit
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited cboxFileType: TUniComboBox
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited PnlDestFileLeft01: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited Label6: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label5: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
          end
          inherited tabEmail: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            inherited Splitter3: TUniSplitter
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
            end
            inherited pnlEmailRight: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              TabOrder = 1
              inherited sbtnAssignEmail: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited sbtnBoilerPlates: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited sbtnOtherAttachments: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited pnlEMailClient: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              TabOrder = 0
              inherited edEmailTo: TUniEdit
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited edSubject: TUniEdit
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited memoEmail: TUniMemo
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited cboxEMailFileType: TUniComboBox
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited EdAttachmentName: TUniEdit
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited edOtherAttachments: TUniEdit
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited PnlDestEMailLeft01: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited Label7: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label8: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label9: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited Label11: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited lblOtherAttachments: TUniLabel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
          end
          inherited tabFax: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 245
            inherited pnlFaxRight: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited sbtnFax: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited sbtnFaxSetup: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited pnlFaxClient: TUniPanel
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              inherited bvTopBuffer: TUniPanel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited bvLeftBuffer: TUniPanel
                Top = 3
                Height = 238
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited bvRightBuffer: TUniPanel
                Left = 383
                Top = 3
                Height = 238
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited bvBottomBuffer: TUniPanel
                Top = 241
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited lviewFaxRecipients: TListView
                Left = 3
                Top = 3
                Width = 380
                Height = 238
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
          end
        end
      end
      inherited Panel1: TUniPanel
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        inherited TabControl1: TUniTabControl
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
        end
      end
    end
  end
  inherited pnlButtons: TUniPanel
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Constraints.MinHeight = 35
    inherited pnlButtonsRight: TUniPanel
      Left = 120
      Width = 309
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 120
      ExplicitWidth = 309
      inherited btnOK: TUniButton
        Left = 105
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 105
      end
      inherited btnCancel: TUniButton
        Left = 206
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitLeft = 206
      end
      inherited BtnProp: TUniButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
    end
  end
  inherited wwQryLookup: TFDQuery
    SQL.Strings = (
      'select'
      '     id,'
      '     rfq,'
      '     project, '
      '     quote_date'
      'from'
      '     crm_quote'
      'where'
      '     misc.eplant_filter(eplant_id) = 1'
      'order by'
      '     rfq'
      '')
    object wwQryLookupRFQ: TStringField
      DisplayLabel = 'Quote #'
      DisplayWidth = 10
      FieldName = 'RFQ'
      Origin = 'IQ.CRM_QUOTE.RFQ'
      FixedChar = True
      Size = 10
    end
    object wwQryLookupPROJECT: TStringField
      DisplayLabel = 'Description'
      DisplayWidth = 25
      FieldName = 'PROJECT'
      Origin = 'IQ.CRM_QUOTE.PROJECT'
      Size = 35
    end
    object wwQryLookupQUOTE_DATE: TDateTimeField
      DisplayLabel = 'Quote Date'
      DisplayWidth = 18
      FieldName = 'QUOTE_DATE'
      Origin = 'IQ.CRM_QUOTE.QUOTE_DATE'
    end
    object wwQryLookupID: TBCDField
      Tag = 1
      FieldName = 'ID'
      Origin = 'IQ.CRM_QUOTE.ID'
      Visible = False
      Size = 0
    end
  end
  inherited QryMain: TFDQuery
    SQL.Strings = (
      'select id,'
      '       '#39' '#39' as mfg_type,'
      '       rfq,'
      '       print_count,'
      '       print_last_user,'
      '       print_last_date'
      '  from crm_quote'
      ' where RTrim(rfq) between :param1 and :param2'
      '    and misc.eplant_filter(eplant_id) = 1'
      ' order by rfq'
      '')
    ParamData = <
      item
        Name = 'param1'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'param2'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  inherited QryDocs: TFDQuery
    SQL.Strings = (
      'SELECT d.doc_blob,'
      '       d.descrip,'
      '       a.docseq'
      '  FROM crm_quote_docs a, iq_docs d'
      ' WHERE a.parent_id = :ID AND'
      '       a.iq_docs_id = d.id AND'
      '       NVL(RTRIM(a.TYPE), '#39'ALL'#39') IN ('#39'ALL'#39', '#39'CRM QUOTE'#39')'
      'UNION ALL'
      'SELECT c.doc_blob,'
      '       c.descrip,'
      '       b.docseq'
      '  FROM crm_quote_detail a, crm_quote_detail_doc b, iq_docs c '
      ' WHERE a.crm_quote_id = :ID AND'
      '       b.parent_id = a.id AND'
      '       c.id = b.iq_docs_id AND'
      '       NVL(RTRIM(b.TYPE), '#39'ALL'#39') IN ('#39'ALL'#39', '#39'CRM QUOTE'#39')'
      'UNION ALL'
      'SELECT d.doc_blob,'
      '       d.descrip,'
      '       a.docseq'
      '  FROM arinvt_docs a, iq_docs d,'
      '       (SELECT DISTINCT source_id'
      '                   FROM crm_quote_detail'
      '                  WHERE crm_quote_id = :id AND'
      '                        source = '#39'ARINVT'#39') x'
      ' WHERE a.arinvt_id = x.source_id AND'
      '       a.iq_docs_id = d.id AND'
      '       NVL(RTRIM(a.TYPE), '#39'ALL'#39') IN ('#39'ALL'#39', '#39'CRM QUOTE'#39')'
      'ORDER BY 3'
      '')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  inherited QryDocsExt: TFDQuery
    SQL.Strings = (
      'SELECT a.lib_path,'
      '       a.filename,'
      '       a.seq'
      '  FROM v_external_docs a'
      ' WHERE a.source = '#39'CRM_QUOTE'#39' AND'
      '       a.source_id = :id AND'
      '       NVL(RTRIM(a.print_with), '#39'ALL'#39') IN ('#39'ALL'#39', '#39'CRM QUOTE'#39')'
      'UNION'
      'SELECT a.lib_path,'
      '       a.filename,'
      '       a.seq'
      '  FROM v_external_docs a, crm_quote_detail b'
      ' WHERE b.crm_quote_id = :id AND'
      '       a.source = '#39'CRM_QUOTE_DETAIL'#39' AND'
      '       a.source_id = b.id AND'
      '       NVL(RTRIM(a.print_with), '#39'ALL'#39') IN ('#39'ALL'#39', '#39'CRM QUOTE'#39')'
      'UNION'
      'SELECT a.lib_path,'
      '       a.filename,'
      '       a.doc_used_id'
      '  FROM v_external_docs a, (SELECT DISTINCT source_id'
      '                             FROM crm_quote_detail'
      '                            WHERE crm_quote_id = :id AND'
      '                                  source = '#39'ARINVT'#39') x'
      ' WHERE a.source = '#39'ARINVT'#39' AND'
      '       a.source_id = x.source_id AND'
      '       NVL(RTRIM(a.print_with), '#39'ALL'#39') IN ('#39'ALL'#39', '#39'CRM QUOTE'#39')'
      'ORDER BY 3')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
end

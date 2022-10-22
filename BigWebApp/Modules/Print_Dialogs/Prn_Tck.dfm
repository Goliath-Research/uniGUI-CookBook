inherited FrmPrintDocsTicket: TFrmPrintDocsTicket
  Caption = 'Print Ticket'
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
    ActivePage = tabDestination
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
          KeyField = 'ID'
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
            KeyField = 'ID'
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
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited bvRightBuffer: TUniPanel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited bvBottomBuffer: TUniPanel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited lviewFaxRecipients: TListView
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
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      inherited btnOK: TUniButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
      end
      inherited btnCancel: TUniButton
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
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
    BeforeOpen = AssignLocalParams
    SQL.Strings = (
      'select id'
      '  from ps_ticket'
      ' where misc.eplant_filter(eplant_id) = 1'
      '   and (:division_id = 0'
      '        or'
      '        :division_id = -1 and division_id is null'
      '        or'
      '        :division_id > 0 and division_id = :division_id)'
      ' order by id'
      ' ')
    ParamData = <
      item
        Name = 'division_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'division_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'division_id'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'division_id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
  inherited QryMain: TFDQuery
    SQL.Strings = (
      'select p.id,'
      '       '#39' '#39' as mfg_type,'
      '       s.prime_contact as attn,'
      '       s.attn as company,'
      '       s.fax as fax_number,'
      '       p.print_count,'
      '       p.print_last_user,'
      '       p.print_last_date'
      '  from '
      '       ps_ticket p,'
      '       ship_to s'
      ' where '
      '       p.id between :param1 and :param2'
      '   and p.ship_to_id = s.id(+)'
      '   and misc.eplant_filter(p.eplant_id) = 1'
      '   and (:division_id = 0'
      '        or'
      '        :division_id = -1 and p.division_id is null'
      '        or'
      '        :division_id > 0 and p.division_id = :division_id)'
      ' order by p.id'
      ' '
      ' '
      ' ')
    ParamData = <
      item
        Name = 'param1'
        DataType = ftFloat
      end
      item
        Name = 'param2'
        DataType = ftFloat
      end
      item
        Name = 'division_id'
        DataType = ftFloat
      end
      item
        Name = 'division_id'
        DataType = ftFloat
      end
      item
        Name = 'division_id'
        DataType = ftFloat
      end
      item
        Name = 'division_id'
        DataType = ftFloat
      end>
  end
  inherited QryDocs: TFDQuery
    SQL.Strings = (
      'SELECT c.doc_blob,'
      '       c.descrip'
      '  FROM ps_ticket a,'
      '       arcusto_docs b,'
      '       iq_docs c'
      ' WHERE a.id = :ID AND'
      '       a.arcusto_id = b.arcusto_id AND'
      '       b.iq_docs_id = c.id AND'
      '       RTRIM(b.TYPE) = '#39'PICKTICKET'#39
      'UNION ALL'
      'SELECT e.doc_blob,'
      '       e.descrip'
      '  FROM ps_ticket a,'
      '       arcusto b,'
      '       ship_to c,'
      '       ship_to_docs d,'
      '       iq_docs e'
      ' WHERE a.id = :ID AND'
      '       b.id = a.arcusto_id AND'
      '       c.arcusto_id = b.id AND'
      '       d.ship_to_id = c.id AND'
      '       e.id = d.iq_docs_id AND'
      '       RTRIM(d.TYPE) = '#39'PICKTICKET'#39)
    ParamData = <
      item
        Name = 'ID'
        DataType = ftLargeint
        ParamType = ptInput
        Size = 8
      end>
  end
  inherited QryDocsExt: TFDQuery
    SQL.Strings = (
      'select lib_path,'
      '       filename,'
      '       seq'
      '  from v_external_docs'
      ' where'
      '       source = '#39'ARCUSTO'#39
      
        '   and source_id in (select arcusto_id from ps_ticket where id =' +
        ' :id)'
      '   and NVL(RTrim(print_with), '#39'ALL'#39') in ('#39'ALL'#39', '#39'PICKTICKET'#39')'
      '')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
        Size = 8
      end>
  end
  inherited dsQryLookup: TDataSource
    Left = 232
    Top = 216
  end
end

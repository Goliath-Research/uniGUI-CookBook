inherited FrmPrintDocsTooling: TFrmPrintDocsTooling
  Left = 328
  Top = 181
  ClientHeight = 295
  Caption = 'Print Tooling Project'
  Constraints.MinHeight = 276
  Constraints.MinWidth = 401
  ExplicitHeight = 334
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TUniSplitter
    Top = 257
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitTop = 257
  end
  inherited PageControl1: TUniPageControl
    Height = 257
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitHeight = 257
    inherited tabSelectionCriteria: TUniTabSheet
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 421
      ExplicitHeight = 229
      inherited pnlCriteriaBottom: TUniPanel
        Top = 156
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitTop = 156
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
        Height = 156
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitHeight = 156
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
          Height = 154
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitHeight = 154
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
      ExplicitHeight = 229
      inherited PnlDestinationPCCarrier: TUniPanel
        Height = 202
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ExplicitHeight = 202
        inherited pgctrDestination: TUniPageControl
          Height = 200
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          ExplicitHeight = 200
          inherited tabPrinter: TUniTabSheet
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 172
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
            ExplicitHeight = 172
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
            ExplicitHeight = 172
            inherited Splitter2: TUniSplitter
              Height = 172
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitHeight = 172
            end
            inherited pnlFileRight: TUniPanel
              Height = 172
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitHeight = 172
              inherited btnSaveFile: TUniSpeedButton
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited pnlFileClient: TUniPanel
              Height = 172
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitHeight = 172
              DesignSize = (
                300
                172)
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
              Height = 172
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitHeight = 172
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
            ExplicitLeft = 4
            ExplicitTop = 24
            ExplicitWidth = 411
            ExplicitHeight = 172
            inherited Splitter3: TUniSplitter
              Height = 172
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitHeight = 172
            end
            inherited pnlEmailRight: TUniPanel
              Height = 172
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitHeight = 172
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
              Height = 172
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitHeight = 172
              DesignSize = (
                252
                172)
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
                Height = 72
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 72
              end
              inherited cboxEMailFileType: TUniComboBox
                Top = 126
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitTop = 126
              end
              inherited EdAttachmentName: TUniEdit
                Top = 149
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitTop = 149
              end
              inherited edOtherAttachments: TUniEdit
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
            end
            inherited PnlDestEMailLeft01: TUniPanel
              Height = 172
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitHeight = 172
              DesignSize = (
                129
                172)
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
                Top = 131
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitTop = 131
              end
              inherited Label11: TUniLabel
                Top = 152
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitTop = 152
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
            ExplicitHeight = 172
            inherited pnlFaxRight: TUniPanel
              Height = 172
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitHeight = 172
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
              Height = 172
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              ExplicitHeight = 172
              inherited bvTopBuffer: TUniPanel
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
              end
              inherited bvLeftBuffer: TUniPanel
                Height = 163
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 163
              end
              inherited bvRightBuffer: TUniPanel
                Height = 163
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 163
              end
              inherited bvBottomBuffer: TUniPanel
                Top = 167
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitTop = 167
              end
              inherited lviewFaxRecipients: TListView
                Height = 163
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ExplicitHeight = 163
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
    Top = 260
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Constraints.MinHeight = 35
    ExplicitTop = 260
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
    SQL.Strings = (
      'select'
      '     id,'
      '     rfq,'
      '     project, '
      '     create_date'
      'from'
      '     tool_rfq'
      'where'
      '     misc.eplant_filter(eplant_id) = 1'
      'order by'
      '     rfq')
    Left = 213
    Top = 37
    object wwQryLookupRFQ: TStringField
      DisplayLabel = 'Project #'
      DisplayWidth = 20
      FieldName = 'RFQ'
      Origin = 'TOOL_RFQ.RFQ'
    end
    object wwQryLookupPROJECT: TStringField
      DisplayLabel = 'Project Name'
      DisplayWidth = 35
      FieldName = 'PROJECT'
      Origin = 'TOOL_RFQ.PROJECT'
      Size = 255
    end
    object wwQryLookupID: TBCDField
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'TOOL_RFQ.ID'
      Visible = False
      Size = 0
    end
    object wwQryLookupCREATE_DATE: TDateTimeField
      DisplayWidth = 18
      FieldName = 'CREATE_DATE'
      Origin = 'TOOL_RFQ.CREATE_DATE'
      Visible = False
    end
  end
  inherited QryMain: TFDQuery
    OnCalcFields = QryMainCalcFields
    SQL.Strings = (
      'select'
      '     id'
      'from '
      '     v_tool_rfq'
      'where '
      '     rfq between :param1 and :param2    '
      '     and misc.eplant_filter(eplant_id) = 1')
    Left = 31
    Top = 36
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
    object QryMainID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryMainmfg_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'mfg_type'
      Calculated = True
    end
    object QryMainprn_type: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'prn_type'
      Calculated = True
    end
  end
  inherited SrcMain: TDataSource
    Top = 8
  end
  inherited QryDocs: TFDQuery
    SQL.Strings = (
      'select'
      '     v.id as id,'
      '     v.docseq as docseq,'
      '     v.descrip as descrip,'
      '     iq_docs.doc_blob as doc_blob'
      'from iq_docs,     '
      '('
      'select'
      '     q.id,'
      '     q.descrip,'
      '     d.docseq as docseq'
      '     '
      'from'
      '     tool_docs d,'
      '     iq_docs q,'
      '     tool_rfq r'
      'where'
      '     r.id = :id and'
      '     d.tool_rfq_id = r.id'
      '     and d.iq_docs_id = q.id'
      '     and ('
      
        '          ( 1 = :prn_type ) and ( NVL( RTrim(d.type), '#39'-'#39' ) in (' +
        ' '#39'ALL'#39', '#39'PROJECT WORK ORDER'#39' ))'
      '          or'
      
        '          ( 0 = :prn_type ) and ( NVL( RTrim(d.type), '#39'-'#39' ) in (' +
        ' '#39'ALL'#39', '#39'PROJECT'#39' ))'
      '         )'
      ''
      'union'
      ''
      'select'
      '     q.id,'
      '     q.descrip,'
      '     d.docseq as docseq'
      'from'
      '     tool_task_docs d,'
      '     iq_docs q,'
      '     tool_task_information r'
      'where'
      '     r.tool_rfq_id = :id and'
      '     d.tool_task_info_id = r.id'
      '     and d.iq_docs_id = q.id'
      '     and ('
      
        '          ( 1 = :prn_type ) and ( NVL( RTrim(d.type), '#39'-'#39' ) in (' +
        ' '#39'ALL'#39', '#39'PROJECT WORK ORDER'#39' ))'
      '          or'
      
        '          ( 0 = :prn_type ) and ( NVL( RTrim(d.type), '#39'-'#39' ) in (' +
        ' '#39'ALL'#39', '#39'PROJECT'#39' ))          '
      '         )'
      '     ) v'
      'where iq_docs.id = v.id     '
      'order by v.docseq')
    Left = 79
    Top = 36
    ParamData = <
      item
        Name = 'id'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'prn_type'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryDocsID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryDocsDOCSEQ: TBCDField
      FieldName = 'DOCSEQ'
      Size = 0
    end
    object QryDocsDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Size = 30
    end
    object QryDocsDOC_BLOB: TBlobField
      FieldName = 'DOC_BLOB'
    end
  end
  inherited SrcDocs: TDataSource
    Left = 80
    Top = 8
  end
  inherited QryDocsExt: TFDQuery
    SQL.Strings = (
      '-- Tooling work orders'
      'select lib_path,'
      '       filename,'
      '       seq'
      '  from v_external_docs'
      ' where'
      '       source = '#39'TOOL_RFQ'#39' -- or TOOL'
      '   and source_id = :ID'
      
        '   and NVL(Trim(print_with), '#39'ALL'#39') in ('#39'ALL'#39', '#39'PROJECT WORK ORD' +
        'ER'#39')'
      '   and :prn_type = 1'
      ''
      'UNION'
      ''
      '-- Tooling quotes'
      'select lib_path,'
      '       filename,'
      '       seq'
      '  from v_external_docs'
      ' where'
      '       source = '#39'TOOL_RFQ'#39
      '   and source_id = :ID'
      '   and NVL(Trim(print_with), '#39'ALL'#39') in ('#39'ALL'#39', '#39'PROJECT'#39')'
      '   and :prn_type = 0'
      ''
      'UNION'
      ''
      '-- Tooling work order tasks'
      'select v_external_docs.lib_path,'
      '       v_external_docs.filename,'
      '       v_external_docs.seq'
      '  from v_external_docs, tool_task_information'
      ' where'
      
        '       v_external_docs.source = '#39'TOOL_TASK_INFORMATION'#39' -- or TO' +
        'OL_TASK'
      '   and tool_task_information.tool_rfq_id = :ID'
      '   and v_external_docs.source_id = tool_task_information.id'
      
        '   and NVL(Trim(v_external_docs.print_with), '#39'ALL'#39') in ('#39'ALL'#39', '#39 +
        'PROJECT WORK ORDER'#39')'
      '   and :prn_type = 1'
      ''
      'UNION'
      ''
      '-- Tooling quote tasks'
      'select v_external_docs.lib_path,'
      '       v_external_docs.filename,'
      '       v_external_docs.seq'
      '  from v_external_docs, tool_task_information'
      ' where'
      '       v_external_docs.source = '#39'TOOL_TASK_INFORMATION'#39
      '   and tool_task_information.tool_rfq_id = :ID'
      '   and v_external_docs.source_id = tool_task_information.id'
      
        '   and NVL(Trim(v_external_docs.print_with), '#39'ALL'#39') in ('#39'ALL'#39', '#39 +
        'PROJECT'#39')'
      '   and :prn_type = 0'
      ' '
      ' ')
    Left = 140
    Top = 35
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'prn_type'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QryDocsExtFILENAME: TStringField
      FieldName = 'FILENAME'
      Size = 255
    end
    object QryDocsExtLIB_PATH: TStringField
      FieldName = 'LIB_PATH'
      Size = 150
    end
    object QryDocsExtSEQ: TBCDField
      FieldName = 'SEQ'
      Size = 0
    end
  end
  inherited ImageList1: TUniImageList
    Bitmap = {
      494C010105000900240010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C1C1C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFACAA0092847D00695F5C00605E5C009292920000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBCBCB00A19F9F00827873009481
      7700D2B4A400FFE9DB00F1D5C500A08678006A64620081818100AFAAA900BEBA
      B700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007271710092796C00F9EEE800FFF9
      F400FFFDF800FFFFFC00FFFFFC00FFFBF400A78F7E004D484600655C56006154
      4D00B7B1AD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEBEBE00676563009E8A7E00F8F3
      F100FFFFFF00FFFFFF00FBFAFA00BDBCBC00878787004B3E3900E9D4CA00A890
      7F0076655E00B2A9A30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004C4C4C00737373005D5853006B5A
      540087827F006A615C00786C6300A28E8600C7B3A400F0D7C700FCDFCF00F9D5
      BC00C7A794007A6A620090868000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009D9D9D0076767600BEACA300AD9B
      9000DCC1B200FCE6DC00CFC1BA009BB3C600BEC5CB00D3B8A900C3A29100CBA7
      9200FFE6D100DAB9A20063585000B6AFA9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4B3B1006F605600AA94
      7F00FFF7F000F3E7E000D5D5D5009494940064646400B8A9A200C9A59400AE92
      8300D9BDAE00F9D4BC00D7B59F00B7AAA1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD9F900034302E005C51
      4800DBCEC200F5F0ED0094949400707070005454540062626100B8A79F00DDC2
      B600DCCAC000FFF6EE00EFD8C700D0CCCA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5BFBA003B353000332D
      290087776700FBF7F5008B8B8C00464648004E4E4E004F4F500078777800B2B0
      AF009794920066636300A48F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A49485004642
      3F00574E460076645900CEC4BB007E7A77007B79770070706F00525251004C4C
      4C004C4C4C004C4C4C00725B5000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A898
      8A006A625D006C615D009B8A7A00927869005757570057575700575757005757
      570057575700575757005E504600CAC9C8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C7C3C000C0B8B000CCCBCB00B8ABA200665C560066666600685E5800967D
      6E00665B54006666660066595300C6C1BE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C2BF00705C52007373730070645E00CBCA
      C900716158007373730070615A00C8C6C4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CBCAC900745E53007F7F7F007B716C00C6C1
      BE007D665A007F6C5F00A18A7C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A48B7A00927462008D705E00CAC9
      C800C8C5C4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CCCBCB00CDC5BE00C4BBAF00C2B9AD00C6C1
      B800CAC9C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CEA48300BB875D00BD987200BF9A7600B68B
      6300A87B4D00A57A4A00AB875B00B7A180000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6AFA600B87E
      6300C38F6E00C7A28900CEAA8F00E7997700E3B79B00F9F5F000F4EDE700EEE3
      DA00E8DACD00E0CDBB00D8BDA300B0885A000000000060483000604830006048
      3000604830006048300060483000604830006048300060483000604830006048
      300060483000604830000000000000000000000000000000000080808000E3D8
      CF00E5D9CE00E9DACD00ECDAC300EFDBC200F2DBC200F4DBC100F7D9C000FBDB
      BF009933000000000000000000000000000000000000C39D8900AE785C00C49D
      8000C8A38600C8A58900CAA68D00C9AA9500CAAE9D00CBB6AA00CBBFB800CCCA
      C9000000000000000000000000000000000000000000CCCBCB00B87C5C00C186
      6000E2925200D5834900D8926C00EDA88800EFD8C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFDFD00CBAD8A00CFA27E00C0A8A000FFF0F000FFF0E000FFF0
      E000FFE8E000FFE8E000FFE8E000FFE8E000FFE8D000FFE0D000FFE0D000FFE0
      D000FFE0D000FFE0D0006048300000000000000000000000000080808000F6F3
      ED00C8C8C800BABABA00B1B1B100ADADAD00A8A8A800A4A4A400A0A0A000F7D9
      C0009933000000000000000000000000000000000000C6A99A00BE9B7C00D2B3
      9E00EAD6C700DDCCB400DAC4AC00D9C2A700D8C1A500D6BFA300D5BA9C00D1B3
      9400D0B09500CEAF9500CFA890000000000000000000C4A89A00CB865400C8AD
      A600FFFDFD00C1A08E00C58E6900E6C1A300FDF9F400FDFDFA00FFFFFF00FFFF
      FF00FFFDFD00CFB29100D5967100D2BAA500C0A8A000FFF0F000D0988000E0A0
      8000F0A08000F0A07000F0987000E0906000E0886000E0805000E0804000E078
      4000E0805000FFE0D0006048300000000000000000000000000080808000F6F4
      F000F6F3ED00F7F1E900F7EFE500F8ECE000F8EADC00F9E8D600FAE5D100F4D8
      C1009933000000000000000000000000000000000000C8AB9B00CCB39500CFB3
      9600E1C6B500F3EAE300EEE1D600EDDED100ECDDCF00ECDCCD00E9DBCB00E9DA
      C800E9D9C900E7D6C400CAA283000000000000000000C18D7100E6B38700CBAF
      A300FFF6ED00AB705800AF6E3D009D6C4000AF7B4C00C8905D00D59F7200EDBB
      9400CBA37A00C89B7500D08D6000CCC6C100C0B0A000FFF8F000C0907000FFC0
      A000F0B09000F0A88000F0A07000F0987000E0906000E0806000D0785000D070
      5000E0704000FFE0D0006048300000000000000000000000000080808000F5F6
      F300C8C8C800BABABA00B1B1B100ADADAD00A8A8A800A4A4A400A0A0A000F2D6
      C2009933000000000000000000000000000000000000C9AC9B00E2CDBB00E3D1
      C000DFC9B400DFC3B100F4F0E700F5EEE500F5EDE300F5EDE400F5EDE600F6EF
      E700E7D2C100CDAF8D00C6A782000000000000000000C7947700EAD3BE00D3B1
      9F00FDECD500C8705500DA683C00E6774500D2744700BA6D4400A6633B009056
      2B00B1683B00F9F0E800DBAC8D00CCC1B900C0B0A000FFF8F000C0907000FFC8
      B000FFE8E000FFE8D000FFE0D000FFE0D000FFD8D000FFD8C000FFD0C000D078
      5000E0704000FFE0D0006048300000000000000000000000000080808000F5F7
      F600F5F6F300F6F4F000F6F3ED00F7F1E900F7EFE500F8ECE000F8EADC00EFD4
      C2009933000000000000000000000000000000000000CCAD9D00EBDCCE00EFE2
      D500EEE0D600EAD9CC00DCBEAC00F8F0EB00E2CAB600E0C7B200F7F0EC00E0C8
      B400DAC4A700D3BB9A00CBAB8E000000000000000000CB9F8400E0D3CF00EAC1
      9D00FDE0C100DA624000F4693C00FA724400FA704300FA6C3C00FA6E3F00F771
      4200E7744F00FBEDDD00D8A38000CCC6C100C0B0A000FFF8F000C0907000FFD0
      B000FFC8A000FFC0A000FFB09000F0A88000F0A08000F0987000E0906000E080
      6000E0704000FFE0D0006048300000000000000000000000000080808000F4F8
      F800C8C8C800BABABA00B1B1B100ADADAD00A8A8A800A4A4A400A0A0A000ECDA
      C3009933000000000000000000000000000000000000CCAE9D00F2E7DD00F4EB
      E300F5EDE400F4EAE000F0E4D900D0A38800D3AF8C00CEA98400D3B39700E6D6
      BF00E2D0B800DBC7AA00CEAD95000000000000000000CAAB9D00DAB6A300FFCB
      9200E0AA8E00C8593700E07B5600E78B6A00E78A6700E3774F00DF643700D55D
      3200E09B8100FDDBBA00D19A750000000000C0B0A000FFF8F000C0907000FFD0
      C000FFF0E000FFE8E000FFE8E000FFE8D000FFE0D000FFE0D000FFD8D000E090
      6000E0704000FFE8D0006048300000000000000000000000000080808000F3F9
      FA00F4F8F800F5F7F600F5F6F300F6F4F000F6F3ED00F7F1E900F7EFE500E9DA
      C3009933000000000000000000000000000000000000CFB1A200F6EDE600F8EF
      EA00F9F1ED00F6EFE800DFBDA600E2C6A900E6D2BE00E0CAB100D1B08D00DFC8
      B400EADBC600E1D2B900CCAE9C000000000000000000C6AA9E00D7A07900E8B1
      7F00C4765500C4785400BE775400BC7A5600B8795500B7744E00B1623B00A760
      4400F7D0A800F0BC8B00CBAC980000000000C0B0A000FFF8F000C0907000FFD8
      C000FFD0C000FFC8B000FFC8A000FFC0A000FFB89000F0A88000F0A07000F098
      7000E0704000FFE8E0006048300000000000000000000000000080808000F2FA
      FC00C8C8C800BABABA00B1B1B100ADADAD00A8A8A800A4A4A400A0A0A000E5D9
      CE009933000000000000000000000000000000000000D3B6A700F9F2ED00FBF5
      F100FBF6F300E4C8B400E8CFB400EDDDCD00EFE3D800EEE0D200DFC9AC00D3B3
      9100EEE4D500E9DBC800CBAE9E00000000000000000000000000CCC7C300CCAF
      9A00B97B5800BC715100C2745400C4735400BF6E5100B6634800AA604100F0C4
      9600E7AC7700CBAA94000000000000000000D0B0A000FFFFFF00C0907000FFE0
      D000FFF0F000FFF0E000FFF0E000FFC0A000FFC0A000FFB89000FFB09000F0A0
      7000E0784000FFE8E0006048300000000000000000000000000080808000F2FA
      FD00F2FAFC00F3F9FA00F4F8F800F5F7F600F5F6F300F6F4F000F6F3ED00E3D8
      CF009933000000000000000000000000000000000000D5BAAB00FDF8F300FAF5
      F100E9D0BF00EAD3BC00F3E6D800F5ECE300F5EDE400F5EDE400F1E6D800E2CA
      AE00DABFA300F1E8DA00CAB4A700000000000000000000000000000000000000
      0000CB987700E38C6F00D39E7D00CA8B6700CF835F00CEA58100CEB49E00C9A9
      9300CCC1BA00000000000000000000000000D0B0A000FFFFFF00C0907000FFE0
      D000FFD8D000FFD8C000FFD0B000FFC8B000FFC0A000FFC0A000FFB89000FFB0
      8000E0784000FFE8E0006048300000000000000000000000000080808000F1FB
      FE00C8C8C800BABABA00B1B1B100ADADAD00F5F7F60099330000993300009933
      00009933000000000000000000000000000000000000D5B6A600FAF3EF00E5C6
      B100F4E3D100F7F0E800FAF4EF00FAF4ED00FAF3ED00FAF3EC00FAF2EB00FAED
      E500F0D7C000DEC3B000CABFB900000000000000000000000000000000000000
      0000AE765600A3694E00B67D5B00B46A4C00CB835E00CDCAC700000000000000
      000000000000000000000000000000000000D0B8A000FFFFFF00D0A08000D090
      8000C0907000D0887000D0886000C0806000C0785000C0704000C0684000C068
      4000D0784000FFE8E0006048300000000000000000000000000080808000F0FB
      FE00F1FBFE00F2FAFD00F2FAFC00F3F9FA00F4F8F800CC660000C8C8C8009933
      00000000000000000000000000000000000000000000D5B5A500E7C1AE00FDE8
      D500FDF2EA00FDF3EB00FDF2EA00FDF0E900FDEFE500FDEBDB00EFD0C000E1BF
      AB00D6B09B00CBA69400CCCBCA00000000000000000000000000000000000000
      0000CFB19700B9886200B17C5800AB714C00CDAC900000000000000000000000
      000000000000000000000000000000000000D0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF8F000FFF8F000FFF8F000FFF8F000FFF8F000FFF0F000FFF0
      F000FFF0E000FFF0E0006048300000000000000000000000000080808000F0FB
      FF00F0FBFE00F1FBFE00F2FAFD00F2FAFC00F3F9FA00CC660000993300000000
      00000000000000000000000000000000000000000000BA866A00DDAF9800DCB7
      A200D3B19C00D1B0A000CBAB9A00C7ACA000CCBAB000C8B9B200CBC4C1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0B8A000D0B8A000D0B0
      A000D0B0A000C0B0A000C0B0A000C0B0A000C0B0A000C0B0A000C0A8A000C0A8
      A000C0A8A000C0A8A00000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FEFF000000000000F07F000000000000
      000F000000000000000700000000000000030000000000000001000000000000
      0000000000000000800000000000000080000000000000008001000000000000
      C001000000000000E000000000000000F000000000000000FE00000000000000
      FE01000000000000FF07000000000000FE07FFFFFFFFFFFFFE00FFFFC007FFFF
      C0008003C007800F80000001C007800180000001C007800180000001C0078001
      80000001C007800180000001C007800180010001C007800180010001C0078001
      C0030001C0078001F0070001C0078001F03F0001C00F8001F07F0001C01F801F
      FFFF8003C03FFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  inherited ImageList2: TUniImageList
    Bitmap = {
      494C010101000500240020001000FF00FF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000001000000001002000000000000020
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00C0704000B0583000B0583000A0502000A05020009048
      2000904820009040200080402000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00717171005C5C5C005C5C5C0053535300535353004A4A
      4A004A4A4A004545450042424200FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00C0785000F0D8D000F0D8C000F0D0C000F0D0B000F0D0
      B000F0D0B000F0D0B00090402000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0079797900D9D9D900D5D5D500D0D0D000CDCDCD00CDCD
      CD00CDCDCD00CDCDCD0045454500FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00D0886000FFF8F000FFF8F000FFF0E000FFF0E000FFE8
      E000FFE8E000F0D0B00090482000FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0088888800F7F7F700F7F7F700EEEEEE00EEEEEE00E9E9
      E900E9E9E900CDCDCD004A4A4A00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00C0704000B0583000B058
      3000A0502000A050200090482000904820009040200080402000FFF0F000FFE8
      E000FFE8E000F0D0B00090482000FF00FF00FF00FF00717171005C5C5C005C5C
      5C0053535300535353004A4A4A004A4A4A004545450042424200F2F2F200E9E9
      E900E9E9E900CDCDCD004A4A4A00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00C0785000F0D8D000F0D8
      C000F0D0C000F0D0B000F0D0B000F0D0B000F0D0B00090402000FFF8F000FFF0
      E000FFF0E000F0D0C000A0482000FF00FF00FF00FF0079797900D9D9D900D5D5
      D500D0D0D000CDCDCD00CDCDCD00CDCDCD00CDCDCD0045454500F7F7F700EEEE
      EE00EEEEEE00D0D0D0004D4D4D00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00D0886000FFF8F000E090
      6000D0805000D0805000D0805000D0805000F0D0B00090482000FFFFFF00FFF0
      F000FFF0F000F0D8D000A0502000FF00FF00FF00FF0088888800F7F7F7009090
      900080808000808080008080800080808000CDCDCD004A4A4A00FFFFFF00F2F2
      F200F2F2F200D9D9D90053535300FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00D0907000FFFFFF00FFFF
      FF00FFF0F000FFF0F000FFE8E000FFE8E000F0D0B00090482000FFFFFF00FFF8
      F000FFF8F000F0E0E000A0502000FF00FF00FF00FF0090909000FFFFFF00FFFF
      FF00F2F2F200F2F2F200E9E9E900E9E9E900CDCDCD004A4A4A00FFFFFF00F7F7
      F700F7F7F700E2E2E20053535300FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00E0A08000FFFFFF00F0A8
      8000E0987000E0906000D0805000D0805000F0D0C000A0482000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A0502000FF00FF00FF00FF00A0A0A000FFFFFF00A8A8
      A80098989800909090008080800080808000D0D0D0004D4D4D00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0053535300FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00E0A89000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF0F000FFF0F000F0D8D000A0502000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A0502000FF00FF00FF00FF00A9A9A900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F2F2F200F2F2F200D9D9D90053535300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0053535300FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00E0B8A000FFFFFF00FFB0
      9000F0B09000F0A88000F0987000E0906000F0E0E000A0502000E0A08000D090
      7000D0886000C0785000C0704000FF00FF00FF00FF00B7B7B700FFFFFF00B1B1
      B100B0B0B000A8A8A8009A9A9A0090909000E2E2E20053535300A0A0A0009090
      9000888888007979790071717100FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00F0C0A000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A0502000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BEBEBE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0053535300FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00F0C8B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A0502000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C7C7C700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0053535300FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00F0C8B000F0C0B000F0C0
      B000F0B8A000E0A08000D0907000D0886000C0785000C0704000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C7C7C700C1C1C100C1C1
      C100B8B8B800A0A0A00090909000888888007979790071717100FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000100000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000000000000000000000
      FFFFFFFF000000000000000000000000FC01FC01000000000000000000000000
      FC01FC01000000000000000000000000FC01FC01000000000000000000000000
      8001800100000000000000000000000080018001000000000000000000000000
      8001800100000000000000000000000080018001000000000000000000000000
      8001800100000000000000000000000080018001000000000000000000000000
      80018001000000000000000000000000803F803F000000000000000000000000
      803F803F000000000000000000000000803F803F000000000000000000000000
      FFFFFFFF00000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end

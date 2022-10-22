inherited FrmPrintDocsCRMService: TFrmPrintDocsCRMService
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited tabDestination: TUniTabSheet
      ExplicitWidth = 0
      ExplicitHeight = 0
      inherited PnlDestinationPCCarrier: TUniPanel
        inherited pgctrDestination: TUniPageControl
          inherited tabFile: TUniTabSheet
            ExplicitWidth = 0
            ExplicitHeight = 0
          end
        end
      end
    end
  end
  inherited wwQryLookup: TFDQuery
    Active = True
    SQL.Strings = (
      'select id from CRM_WARRANTY'
      'order by id')
    Left = 85
    object wwQryLookupID: TBCDField
      Tag = 1
      DisplayLabel = 'Warranty #'
      DisplayWidth = 10
      FieldName = 'ID'
      Origin = 'CRM_WARRANTY.ID'
      Size = 0
    end
  end
  inherited QryMain: TFDQuery
    SQL.Strings = (
      'select id,'
      '       '#39' '#39' as mfg_type'
      '  from CRM_WARRANTY'
      ' where id between :param1 and :param2')
    ParamData = <
      item
        Name = 'param1'
        DataType = ftBCD
        ParamType = ptInput
      end
      item
        Name = 'param2'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object QryMainID: TBCDField
      FieldName = 'ID'
      Size = 0
    end
    object QryMainMFG_TYPE: TStringField
      FieldName = 'MFG_TYPE'
      FixedChar = True
      Size = 1
    end
  end
  inherited SrcMain: TDataSource
    Left = 45
    Top = 141
  end
  inherited QryDocs: TFDQuery
    SQL.Strings = (
      'select iq_docs.doc_blob,'
      '       iq_docs.descrip,'
      '       CRM_WARRANTY_DOCS.docseq'
      '  from CRM_WARRANTY_DOCS,'
      '       iq_docs'
      ' where CRM_WARRANTY_DOCS.parent_id = :id'
      '   and CRM_WARRANTY_DOCS.iq_docs_id = iq_docs.id')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDocsDOC_BLOB: TBlobField
      FieldName = 'DOC_BLOB'
      Origin = 'IQ.IQ_DOCS.DOC_BLOB'
    end
    object QryDocsDESCRIP: TStringField
      FieldName = 'DESCRIP'
      Origin = 'IQ.IQ_DOCS.DESCRIP'
      FixedChar = True
      Size = 30
    end
    object QryDocsDOCSEQ: TBCDField
      FieldName = 'DOCSEQ'
      Origin = 'IQ.CRM_WARRANTY_DOCS.DOCSEQ'
      Size = 0
    end
  end
  inherited SrcDocs: TDataSource
    Left = 13
    Top = 141
  end
  inherited QryDocsExt: TFDQuery
    SQL.Strings = (
      'select lib_path,'
      '       filename,'
      '       seq'
      '  from v_external_docs'
      ' where '
      '       source = '#39'CRM_WARRANTY'#39
      '   and source_id = :ID')
    Left = 125
    ParamData = <
      item
        Name = 'ID'
        DataType = ftBCD
        ParamType = ptInput
        Size = 8
      end>
    object QryDocsExtLIB_PATH: TStringField
      FieldName = 'LIB_PATH'
      Origin = 'IQ.V_EXTERNAL_DOCS.LIB_PATH'
      Size = 150
    end
    object QryDocsExtFILENAME: TStringField
      FieldName = 'FILENAME'
      Origin = 'IQ.V_EXTERNAL_DOCS.FILENAME'
      Size = 255
    end
    object QryDocsExtSEQ: TBCDField
      FieldName = 'SEQ'
      Origin = 'IQ.V_EXTERNAL_DOCS.SEQ'
      Size = 0
    end
  end
end

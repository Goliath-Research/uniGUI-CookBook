inherited FrmPrintRR_WO: TFrmPrintRR_WO
  Caption = 'FrmPrintRR_WO'
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
    SQL.Strings = (
      'select workorderno'
      '  from rma_detail r, rma'
      ' where r.rma_id = rma.id'
      '    and misc.eplant_filter(rma.eplant_id) = 1'
      ' order by workorderno'
      ' ')
  end
  inherited QryMain: TFDQuery
    SQL.Strings = (
      'select d.id,'
      '       '#39' '#39' as mfg_type,'
      '       d.workorderno,'
      '       d.print_count,'
      '       d.print_last_user,'
      '       d.print_last_date'
      '  from rma_detail d, rma'
      ' where  '
      '       d.rma_id = rma.id'
      '   and RTrim(d.workorderno) between :param1 and :param2'
      '   and misc.eplant_filter(rma.eplant_id) = 1'
      ' order by d.workorderno'
      ' '
      ''
      ' ')
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
  inherited SrcMain: TDataSource
    Left = 38
    Top = 150
  end
  inherited QryDocs: TFDQuery
    SQL.Strings = (
      'select d.doc_blob,'
      '       d.descrip,'
      '       a.docseq'
      '  from prod_code_docs a,'
      '       iq_docs d,'
      '       rma_detail r,'
      '       arinvt'
      ' where'
      '       r.id = :ID'
      '   and r.arinvt_id = arinvt.id'
      '   and arinvt.prod_code_id = a.prod_code_id'
      '   and a.iq_docs_id = d.id'
      '   and NVL( RTrim(a.type), '#39'ALL'#39' ) in ( '#39'ALL'#39', '#39'WORK ORDER'#39' )'
      'order by 3'
      ''
      ' '
      ' ')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
      end>
  end
  inherited QryDocsExt: TFDQuery
    SQL.Strings = (
      'select a.lib_path,'
      '       a.filename,'
      '       a.seq'
      '  from v_external_docs a,'
      '       rma_detail r,'
      '       arinvt'
      ' where'
      '       r.id = :id'
      '   and r.arinvt_id = arinvt.id'
      '   and a.source_id = arinvt.prod_code_id'
      '   and a.source = '#39'PROD_CODE'#39
      
        '   and NVL( RTrim(a.print_with), '#39'ALL'#39' ) in ( '#39'ALL'#39', '#39'WORK ORDER' +
        #39' )'
      'order by 1,3'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ParamData = <
      item
        Name = 'ID'
        DataType = ftFloat
      end>
  end
end

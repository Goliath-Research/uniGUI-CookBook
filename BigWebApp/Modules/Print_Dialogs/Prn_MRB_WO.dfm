inherited FrmPrintMRB_WO: TFrmPrintMRB_WO
  Caption = 'Print MRB Workorder'
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
      'select mrb_workorderno'
      '  from wf_deviation_item d, wf_header h'
      ' where d.wf_header_id = h.id'
      '   and h.kind = '#39'MRB'#39
      '   and d.mrb_workorderno is not null'
      '   and misc.eplant_filter(h.eplant_id) = 1'
      ' order by mrb_workorderno'
      ' '
      '')
  end
  inherited QryMain: TFDQuery
    SQL.Strings = (
      'select d.id,'
      '       '#39' '#39' as mfg_type,'
      '       d.mrb_workorderno'
      '  from wf_deviation_item d, wf_header h'
      ' where  '
      '       d.wf_header_id = h.id'
      '   and RTrim(d.mrb_workorderno) between :param1 and :param2'
      '   and h.kind = '#39'MRB'#39
      '   and d.mrb_workorderno is not null'
      '   and misc.eplant_filter(h.eplant_id) = 1'
      ' order by d.mrb_workorderno'
      ' '
      ''
      ' '
      '')
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
      ''
      ''
      ''
      '')
  end
  inherited QryDocsExt: TFDQuery
    SQL.Strings = (
      'select 1'
      '  from dual'
      ' where 0 > 1'
      '-- this is just a stub'
      ''
      ''
      ''
      '')
  end
end

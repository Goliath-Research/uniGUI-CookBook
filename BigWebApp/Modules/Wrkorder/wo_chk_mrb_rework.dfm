inherited FrmMRBReworkException: TFrmMRBReworkException
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      inherited Label1: TUniLabel
        Width = 32
        Caption = 'MRB #'
        ExplicitWidth = 32
      end
      inherited Label3: TUniLabel
        Width = 33
        Caption = 'Item #'
        ExplicitWidth = 33
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'WORKFLOWNO'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'ITEMNO'
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select h.workflowno,'
      '       a.itemno,'
      '       '#39'Mfg Rework Order'#39' as status_id'
      '  from wf_deviation_item i, wf_header h, arinvt a'
      ' where i.mrb_rework_workorder_id = :id'
      '   and i.wf_header_id = h.id'
      '   and i.arinvt_id = a.id(+)'
      ''
      ''
      '')
  end
end

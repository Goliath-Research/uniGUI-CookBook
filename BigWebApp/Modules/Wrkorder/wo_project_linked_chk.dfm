inherited FrmWOLinkedToProjectException: TFrmWOLinkedToProjectException
  ExplicitWidth = 413
  ExplicitHeight = 191
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      inherited Label1: TUniLabel
        Width = 29
        Caption = 'WO #'
        ExplicitWidth = 29
      end
      inherited Label3: TUniLabel
        Caption = 'Project #'
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'WORKORDER_ID'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'TOOL_RFQ_ID'
      end
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      ' select w.id as workorder_id,'
      '       t.tool_rfq_id,'
      '       '#39'Work order is linked to project'#39' as status_id'
      '  from workorder w, tool_task_information t'
      ' where w.id = :id'
      '   and w.tool_task_information_id = t.id(+)'
      ''
      ' ')
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMWOLINKEDTOPROJECTEXCEPTION'
  end
end

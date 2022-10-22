inherited FrmStatusExceptionBillTo: TFrmStatusExceptionBillTo
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      inherited Label1: TUniLabel
        Top = 3
        TabOrder = 6
        ExplicitTop = 3
      end
      inherited Label3: TUniLabel
        Top = 26
        ExplicitTop = 26
      end
      inherited Label2: TUniLabel
        Top = 74
        ExplicitTop = 74
      end
      object Label7billto: TUniLabel [3]
        Left = 4
        Top = 50
        Width = 27
        Height = 13
        Hint = ''
        Caption = 'Bill To'
        TabOrder = 7
      end
      inherited DBEdit1: TUniDBEdit
        Top = 0
        ExplicitTop = 0
      end
      inherited DBEdit2: TUniDBEdit
        Top = 23
        ExplicitTop = 23
      end
      inherited DBEdit3: TUniDBEdit
        Top = 71
        ExplicitTop = 71
      end
      object DBEdit7billto: TUniDBEdit
        Left = 57
        Top = 47
        Width = 232
        Height = 19
        Hint = ''
        DataField = 'ATTN'
        DataSource = DataSource1
        TabOrder = 3
      end
    end
  end
  inherited Query1: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.custno, '
      '       a.company, '
      '       b.status_id,'
      '       b.id,'
      '       b.attn || '#39' (ID '#39' || b.id || '#39')'#39' as attn '
      '  from arcusto a,'
      '       bill_to b '
      ' where b.id = :id'
      '   and b.arcusto_id = a.id'
      '')
  end
  inherited QueryBillTo: TFDQuery
    Connection = UniMainModule.FDConnection1
    SQL.Strings = (
      'select a.custno, '
      '       a.company, '
      '       b.status_id,'
      '       b.id,'
      '       b.attn || '#39' (ID '#39' || b.id || '#39')'#39' as attn '
      '  from arcusto a,'
      '       bill_to b '
      ' where b.id = :id'
      '   and b.arcusto_id = a.id')
  end
end

inherited FrmAssyWorkorderPITPendingException: TFrmAssyWorkorderPITPendingException
  ExplicitWidth = 413
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 399
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 29
        Caption = 'WO #'
        ExplicitWidth = 29
      end
      inherited Label3: TUniLabel
        Width = 46
        Caption = 'Customer'
        ExplicitWidth = 46
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'ID'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'CUSTNO'
      end
    end
  end
  inherited Panel1: TUniPanel
    inherited Panel2: TUniPanel
      Left = 199
      ExplicitLeft = 199
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select w.id, '
      '       a.custno, '
      '       '#39'Unposted disposition transactions'#39' as status_id'
      '  from workorder w, arcusto a'
      ' where w.id = :id'
      '   and w.arcusto_id = a.id(+)'
      '')
  end
  inherited DataSource1: TDataSource
    Left = 272
  end
end

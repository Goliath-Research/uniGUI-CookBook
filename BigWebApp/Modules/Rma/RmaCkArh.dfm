inherited FrmRmaCheckArcive: TFrmRmaCheckArcive
  ClientWidth = 357
  Caption = 'Check RMA before Archive'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 357
    ExplicitWidth = 357
    inherited TabSheet1: TUniTabSheet
      ExplicitWidth = 349
      inherited Label1: TUniLabel
        Width = 30
        Caption = 'RMA#'
        ExplicitWidth = 30
      end
      inherited Label3: TUniLabel
        Width = 46
        Caption = 'Customer'
        ExplicitWidth = 46
      end
      inherited DBEdit1: TUniDBEdit
        Width = 289
        DataField = 'RMANO'
        ExplicitWidth = 289
      end
      inherited DBEdit2: TUniDBEdit
        Width = 289
        ExplicitWidth = 289
      end
      inherited DBEdit3: TUniDBEdit
        Width = 289
        ExplicitWidth = 289
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 357
    ExplicitWidth = 357
    inherited Panel2: TUniPanel
      Left = 149
      ExplicitLeft = 149
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select r.rmano,'
      '       a.company,'
      
        '       '#39'Received, Credited and To Return  Qtys do not match'#39' as ' +
        'status_id'
      '  from arcusto a,'
      '       rma r'
      ' where r.id = :id'
      '   and r.arcusto_id = a.id(+)'
      ' ')
  end
end

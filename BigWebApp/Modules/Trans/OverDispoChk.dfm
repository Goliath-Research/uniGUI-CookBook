inherited FrmOverDispoException: TFrmOverDispoException
  ClientWidth = 347
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 347
    ExplicitWidth = 347
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 339
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 71
        Caption = 'Dispo Quantity'
        ExplicitWidth = 71
      end
      inherited Label3: TUniLabel
        Left = 5
        Width = 86
        Caption = 'Left to Disposition'
        ExplicitLeft = 5
        ExplicitWidth = 86
      end
      inherited DBEdit1: TUniDBEdit
        Left = 102
        Width = 88
        DataField = 'DispoQty'
        ExplicitLeft = 102
        ExplicitWidth = 88
      end
      inherited DBEdit2: TUniDBEdit
        Left = 102
        Width = 88
        DataField = 'LeftDispo'
        ExplicitLeft = 102
        ExplicitWidth = 88
      end
      inherited DBEdit3: TUniDBEdit
        Left = 104
        Width = 225
        ExplicitLeft = 104
        ExplicitWidth = 225
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 347
    ExplicitWidth = 347
    inherited Panel2: TUniPanel
      Left = 140
      ExplicitLeft = 140
    end
  end
  inherited Query1: TFDQuery
    OnCalcFields = Query1CalcFields
    SQL.Strings = (
      'select '#39'Dispo Exceeds Production'#39' as status_id'
      '  from dual'
      'where :id = 1 ')
    object Query1DispoQty: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DispoQty'
      Calculated = True
    end
    object Query1LeftDispo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'LeftDispo'
      Calculated = True
    end
    object Query1STATUS_ID: TStringField
      FieldName = 'STATUS_ID'
      FixedChar = True
      Size = 24
    end
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FRMOVERDISPOEXCEPTION')
    SecurityCode = 'FRMOVERDISPOEXCEPTION'
  end
end

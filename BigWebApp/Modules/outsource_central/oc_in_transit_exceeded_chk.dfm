inherited FrmInTransitExceededException: TFrmInTransitExceededException
  ClientHeight = 174
  ClientWidth = 342
  ExplicitWidth = 348
  ExplicitHeight = 203
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 342
    Height = 131
    ExplicitWidth = 342
    ExplicitHeight = 131
    inherited TabSheet1: TUniTabSheet
      ExplicitWidth = 334
      ExplicitHeight = 103
      inherited Label1: TUniLabel
        Width = 67
        Caption = 'In Transit Qty'
        TabOrder = 6
        ExplicitWidth = 67
      end
      inherited Label3: TUniLabel
        Width = 48
        Caption = 'Trans Qty'
        ExplicitWidth = 48
      end
      inherited Label2: TUniLabel
        Top = 84
        ExplicitTop = 84
      end
      object Label4: TUniLabel [3]
        Left = 5
        Top = 59
        Width = 52
        Height = 13
        Hint = ''
        Caption = 'Reject Qty'
        TabOrder = 7
      end
      inherited DBEdit1: TUniDBEdit
        Left = 79
        Width = 251
        DataField = 'InTransitQty'
        ExplicitLeft = 79
        ExplicitWidth = 251
      end
      inherited DBEdit2: TUniDBEdit
        Left = 79
        Width = 251
        DataField = 'TransQty'
        ExplicitLeft = 79
        ExplicitWidth = 251
      end
      inherited DBEdit3: TUniDBEdit
        Left = 79
        Top = 81
        Width = 251
        ExplicitLeft = 79
        ExplicitTop = 81
        ExplicitWidth = 251
      end
      object DBEdit4: TUniDBEdit
        Left = 79
        Top = 56
        Width = 251
        Height = 19
        Hint = ''
        DataField = 'RejectQty'
        DataSource = DataSource1
        TabOrder = 3
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 131
    Width = 342
    ExplicitTop = 131
    ExplicitWidth = 342
    inherited Panel2: TUniPanel
      Left = 134
      ExplicitLeft = 134
    end
  end
  inherited Query1: TFDQuery
    OnCalcFields = Query1CalcFields
    SQL.Strings = (
      'select '#39'IN-TRANSIT Qty Exceeded'#39' as status_id'
      '  from dual'
      'where :id = 1')
    object Query1TransQty: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TransQty'
      Calculated = True
    end
    object Query1RejectQty: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RejectQty'
      Calculated = True
    end
    object Query1InTransitQty: TFloatField
      FieldKind = fkCalculated
      FieldName = 'InTransitQty'
      Calculated = True
    end
    object Query1STATUS_ID: TStringField
      FieldName = 'STATUS_ID'
      FixedChar = True
      Size = 23
    end
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMIN_TRANSIT_EXCEEDED_EXCEPTION'
  end
end

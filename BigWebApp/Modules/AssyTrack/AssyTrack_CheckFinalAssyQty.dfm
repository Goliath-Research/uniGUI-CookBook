inherited FrmAssyTrackFinalAssembyQtyCheck: TFrmAssyTrackFinalAssembyQtyCheck
  ClientWidth = 437
  ExplicitWidth = 443
  ExplicitHeight = 192
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 437
    ExplicitWidth = 437
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 429
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 29
        Caption = 'WO #'
        ExplicitWidth = 29
      end
      inherited Label3: TUniLabel
        Width = 48
        Caption = 'Process #'
        ExplicitWidth = 48
      end
      inherited DBEdit1: TUniDBEdit
        Left = 61
        Width = 359
        DataField = 'ID'
        ExplicitLeft = 61
        ExplicitWidth = 359
      end
      inherited DBEdit2: TUniDBEdit
        Left = 61
        Width = 359
        DataField = 'PROCESS'
        ExplicitLeft = 61
        ExplicitWidth = 359
      end
      inherited DBEdit3: TUniDBEdit
        Left = 61
        Width = 359
        ExplicitLeft = 61
        ExplicitWidth = 359
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 437
    ExplicitWidth = 437
    inherited Panel2: TUniPanel
      Left = 229
      ExplicitLeft = 229
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select id, '
      '       :opno as process,'
      
        '       '#39'Open processes, cannot complete. Costing will be out of ' +
        'balance.'#39' as status_id '
      '  from workorder'
      ' where id = :id')
    ParamData = <
      item
        Name = 'opno'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'id'
        DataType = ftFloat
        ParamType = ptInput
      end>
  end
end

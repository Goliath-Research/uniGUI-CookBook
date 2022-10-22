inherited FrmAssyTrackCheckBelowException: TFrmAssyTrackCheckBelowException
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
        Width = 48
        Caption = 'Process #'
        ExplicitWidth = 48
      end
      inherited DBEdit1: TUniDBEdit
        DataField = 'ID'
      end
      inherited DBEdit2: TUniDBEdit
        DataField = 'PROCESS'
      end
    end
  end
  inherited Panel1: TUniPanel
    inherited Panel2: TUniPanel
      Left = 199
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select id, '
      '       :opno as process,'
      '       '#39'Total Good Parts is less than WO Qty'#39' as status_id'
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
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMASSYTRACKCHECKBELOWEXCEPTION'
  end
end

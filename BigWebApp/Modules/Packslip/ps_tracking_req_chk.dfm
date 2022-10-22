inherited FrmTrackingRequiredException: TFrmTrackingRequiredException
  ClientWidth = 334
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 334
    ExplicitWidth = 334
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 326
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 66
        Caption = 'Packing Slip #'
        ExplicitWidth = 66
      end
      inherited Label3: TUniLabel
        Width = 33
        Caption = 'Cust #'
        ExplicitWidth = 33
      end
      inherited DBEdit1: TUniDBEdit
        Left = 84
        DataField = 'PACKSLIPNO'
        ExplicitLeft = 84
      end
      inherited DBEdit2: TUniDBEdit
        Left = 84
        DataField = 'CUSTNO'
        ExplicitLeft = 84
      end
      inherited DBEdit3: TUniDBEdit
        Left = 84
        ExplicitLeft = 84
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 334
    ExplicitWidth = 334
    inherited Panel2: TUniPanel
      Left = 127
      ExplicitLeft = 127
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select s.packslipno,'
      '       a.custno,'
      '       '#39'Tracking # Required'#39' as status_id'
      '  from shipments s,'
      '       arcusto a'
      ' where s.id = :id'
      '   and s.arcusto_id = a.id'
      '   and a.tracking_required = '#39'Y'#39
      '   and rtrim(s.tracking_num) is null')
  end
end

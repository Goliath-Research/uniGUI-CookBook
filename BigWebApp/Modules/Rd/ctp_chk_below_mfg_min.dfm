inherited FrmCTPBelowMfgMinQtyException: TFrmCTPBelowMfgMinQtyException
  Left = 343
  Top = 235
  ClientWidth = 345
  ExplicitWidth = 351
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 345
    ExplicitWidth = 345
    inherited TabSheet1: TUniTabSheet
      ExplicitWidth = 337
      inherited Label1: TUniLabel
        Width = 33
        Caption = 'Item #'
        ExplicitWidth = 33
      end
      inherited Label3: TUniLabel
        Width = 58
        Caption = 'Mfg Min Qty'
        ExplicitWidth = 58
      end
      inherited DBEdit1: TUniDBEdit
        Left = 77
        Width = 248
        DataField = 'ITEMNO'
        ExplicitLeft = 77
        ExplicitWidth = 248
      end
      inherited DBEdit2: TUniDBEdit
        Left = 77
        Width = 248
        DataField = 'MFG_MIN_QTY'
        ExplicitLeft = 77
        ExplicitWidth = 248
      end
      inherited DBEdit3: TUniDBEdit
        Left = 77
        Width = 248
        ExplicitLeft = 77
        ExplicitWidth = 248
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 345
    ExplicitWidth = 345
    inherited Panel2: TUniPanel
      Left = 138
      ExplicitLeft = 138
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select itemno,'
      '       Mfg_Min_Qty,'
      '       '#39'Requested qty is below mfg min quantity'#39' as status_id'
      '  from arinvt'
      ' where id = :id'
      '')
  end
end

inherited FrmProdRepTALaborException: TFrmProdRepTALaborException
  Left = 369
  Top = 126
  ClientWidth = 392
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 392
    ExplicitWidth = 392
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 384
      ExplicitHeight = 92
      inherited Label1: TUniLabel
        Width = 29
        Caption = 'WO# '
        ExplicitWidth = 29
      end
      inherited Label3: TUniLabel
        Width = 42
        Caption = 'MfgType'
        ExplicitWidth = 42
      end
      inherited Label2: TUniLabel
        Width = 28
        Caption = 'Setup'
        ExplicitWidth = 28
      end
      inherited DBEdit1: TUniDBEdit
        Left = 55
        Width = 325
        DataField = 'WORKORDER_ID'
        ExplicitLeft = 55
        ExplicitWidth = 325
      end
      inherited DBEdit2: TUniDBEdit
        Left = 55
        Width = 325
        DataField = 'MFG_TYPE'
        ExplicitLeft = 55
        ExplicitWidth = 325
      end
      inherited DBEdit3: TUniDBEdit
        Left = 55
        Width = 325
        ExplicitLeft = 55
        ExplicitWidth = 325
      end
    end
  end
  inherited Panel1: TUniPanel
    Width = 392
    ExplicitWidth = 392
    inherited Panel2: TUniPanel
      Left = 185
      ExplicitLeft = 185
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select h.workorder_id,'
      '       h.mfg_type,'
      
        '       '#39'MfgType is setup to have labor posted from Time & Attend' +
        'ance'#39' as status_id'
      '  from dayprod d, hist_illum_rt h, mfgtype m'
      ' where d.id = :id'
      '   and d.hist_illum_rt_id = h.id'
      '   and h.mfg_type = m.mfgtype'
      '')
  end
end

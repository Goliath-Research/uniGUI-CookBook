inherited FrmReleaseOnWaveException: TFrmReleaseOnWaveException
  ClientHeight = 156
  ClientWidth = 378
  ExplicitWidth = 384
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 378
    Height = 113
    ExplicitWidth = 378
    ExplicitHeight = 113
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 370
      ExplicitHeight = 85
      inherited Label1: TUniLabel
        Width = 60
        Caption = 'Pick Wave #'
        ExplicitWidth = 60
      end
      inherited Label3: TUniLabel
        Width = 49
        Caption = 'Ship Quan'
        ExplicitWidth = 49
      end
      inherited DBEdit1: TUniDBEdit
        Left = 83
        Width = 280
        DataField = 'WAVE_PICK_ID'
        ExplicitLeft = 83
        ExplicitWidth = 280
      end
      inherited DBEdit2: TUniDBEdit
        Left = 83
        Width = 280
        DataField = 'SHIP_QUAN'
        ExplicitLeft = 83
        ExplicitWidth = 280
      end
      inherited DBEdit3: TUniDBEdit
        Left = 83
        Width = 280
        ExplicitLeft = 83
        ExplicitWidth = 280
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 113
    Width = 378
    ExplicitTop = 113
    ExplicitWidth = 378
    inherited Panel2: TUniPanel
      Left = 171
      ExplicitLeft = 171
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select d.wave_pick_id,'
      '       d.ship_quan,'
      '       '#39'A wave exists for this release'#39' as status_id'
      '  from wave_pick_dtl d'
      ' where d.releases_id = :id'
      '')
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMRELEASEONWAVEEXCEPTION'
  end
end

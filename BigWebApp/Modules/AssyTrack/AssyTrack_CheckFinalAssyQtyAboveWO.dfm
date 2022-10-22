inherited FrmAssyTrackChkFinalAssyAbovWO: TFrmAssyTrackChkFinalAssyAbovWO
  ClientHeight = 141
  ClientWidth = 437
  Font.Name = 'Segoe UI'
  ExplicitWidth = 443
  ExplicitHeight = 170
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 437
    Height = 99
    ExplicitWidth = 437
    ExplicitHeight = 99
    inherited TabSheet1: TUniTabSheet
      Font.Charset = ANSI_CHARSET
      Font.Height = -13
      Font.Name = 'Segoe UI'
      ParentFont = False
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 429
      ExplicitHeight = 71
      inherited Label1: TUniLabel
        Left = 3
        Width = 34
        Height = 17
        Caption = 'WO #'
        ExplicitLeft = 3
        ExplicitWidth = 34
        ExplicitHeight = 17
      end
      inherited Label3: TUniLabel
        Top = 70
        Width = 23
        Height = 17
        Visible = False
        Caption = 'N/A'
        ExplicitTop = 70
        ExplicitWidth = 23
        ExplicitHeight = 17
      end
      inherited Label2: TUniLabel
        Top = 35
        Width = 35
        Height = 17
        ExplicitTop = 35
        ExplicitWidth = 35
        ExplicitHeight = 17
      end
      inherited DBEdit1: TUniDBEdit
        Top = 8
        Width = 363
        Height = 23
        DataField = 'ID'
        ExplicitTop = 8
        ExplicitWidth = 363
        ExplicitHeight = 23
      end
      inherited DBEdit2: TUniDBEdit
        Top = 68
        Width = 363
        Height = 23
        Visible = False
        DataField = ''
        ExplicitTop = 68
        ExplicitWidth = 363
        ExplicitHeight = 23
      end
      inherited DBEdit3: TUniDBEdit
        Top = 34
        Width = 363
        ExplicitTop = 34
        ExplicitWidth = 363
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 99
    Width = 437
    Height = 42
    ExplicitTop = 99
    ExplicitWidth = 437
    ExplicitHeight = 42
    inherited Panel2: TUniPanel
      Left = 229
      Height = 40
      ExplicitLeft = 229
      ExplicitHeight = 40
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select id, '
      '       '#39'Total Good Parts is greater than WO Qty'#39' as status_id'
      '  from workorder'
      ' where id = :id')
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmAssyTrackChkFinalAssyAbovWO')
    SecurityCode = 'FRMASSYTRACKCHKFINALASSYABOVWO'
  end
end

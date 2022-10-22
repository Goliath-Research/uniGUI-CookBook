inherited FrmAssyTrackChkFinalAssyZero: TFrmAssyTrackChkFinalAssyZero
  ClientHeight = 125
  ClientWidth = 353
  OnCreate = FormCreate
  ExplicitWidth = 359
  ExplicitHeight = 154
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TUniPageControl
    Width = 353
    Height = 82
    ExplicitWidth = 353
    ExplicitHeight = 82
    inherited TabSheet1: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 345
      ExplicitHeight = 54
      inherited Label1: TUniLabel
        Width = 29
        Caption = 'WO #'
        ExplicitWidth = 29
      end
      inherited Label3: TUniLabel
        Top = 60
        Width = 18
        Visible = False
        Caption = 'N/A'
        ExplicitTop = 60
        ExplicitWidth = 18
      end
      inherited Label2: TUniLabel
        Top = 33
        ExplicitTop = 33
      end
      inherited DBEdit1: TUniDBEdit
        Width = 282
        DataField = 'ID'
        ExplicitWidth = 282
      end
      inherited DBEdit2: TUniDBEdit
        Top = 57
        Width = 282
        Visible = False
        DataField = ''
        DataSource = nil
        ExplicitTop = 57
        ExplicitWidth = 282
      end
      inherited DBEdit3: TUniDBEdit
        Top = 30
        Width = 282
        ExplicitTop = 30
        ExplicitWidth = 282
      end
    end
  end
  inherited Panel1: TUniPanel
    Top = 82
    Width = 353
    ExplicitTop = 82
    ExplicitWidth = 353
    inherited Panel2: TUniPanel
      Left = 146
      ExplicitLeft = 146
    end
  end
  inherited Query1: TFDQuery
    SQL.Strings = (
      'select id, '
      
        '       '#39'Zero good parts have been entered. Continue?'#39' as status_' +
        'id'
      '  from workorder'
      ' where id = :id'
      '')
  end
  inherited SR: TIQWebSecurityRegister
    ForceAccessItems.Strings = (
      'FrmAssyTrackChkFinalAssyZero')
    SecurityCode = 'FRMASSYTRACKCHKFINALASSYZERO'
  end
end

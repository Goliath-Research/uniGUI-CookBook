inherited FrmOEWorkflowTeam: TFrmOEWorkflowTeam
  HelpContext = 22579
  Caption = 'Sales Order Approvers Team'
  ClientHeight = 308
  ClientWidth = 574
  ExplicitWidth = 590
  ExplicitHeight = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TUniPanel
    Width = 574
    ExplicitWidth = 574
    inherited DBNavigator1: TUniDBNavigator
      Left = 348
      ExplicitLeft = 348
    end
  end
  inherited Grid: TIQUniGridControl
    Width = 574
    Height = 281
  end
  inherited wwemail: TUniEdit
    Left = 50
    Top = 91
    Width = 76
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 50
    ExplicitTop = 91
    ExplicitWidth = 76
  end
  inherited wwUsers: TUniEdit
    Left = 50
    Top = 111
    Width = 76
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    ExplicitLeft = 50
    ExplicitTop = 111
    ExplicitWidth = 76
  end
  inherited SR: TIQWebSecurityRegister
    SecurityCode = 'FRMOEWORKFLOWTEAM'
  end
  inherited TblTeam: TFDTable
    object TblTeamUSED_OE: TStringField
      DisplayLabel = 'Used Sales Order'
      FieldName = 'USED_OE'
      Visible = False
      Size = 1
    end
  end
  inherited PkSearch: TIQWebHPick
    SQL.Strings = (
      'select id as id,  '
      '       name as name,'
      '       title as title,'
      '       email as email'
      '  from team_member'
      ' where used_oe = '#39'Y'#39
      '   and misc.eplant_filter_include_nulls( eplant_id ) = 1')
  end
end

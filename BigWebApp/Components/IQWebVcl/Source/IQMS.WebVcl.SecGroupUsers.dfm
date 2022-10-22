inherited TFrmSecGroupUsers: TTFrmSecGroupUsers
  ClientHeight = 410
  ClientWidth = 313
  Caption = 'Assigned Users'
  ExplicitWidth = 329
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TUniPanel
    Width = 313
    ExplicitWidth = 255
  end
  inherited Panel1: TUniPanel
    Width = 313
    ExplicitWidth = 255
    inherited DBNavigator1: TUniDBNavigator
      Left = 208
      ExplicitLeft = 150
    end
  end
  inherited wwDBGrid1: TIQUniGridControl
    Width = 313
    Height = 380
    IQComponents.Grid.Width = 96
    IQComponents.Grid.Height = 294
    IQComponents.HiddenPanel.Left = 96
    IQComponents.HiddenPanel.Height = 294
    IQComponents.HiddenPanel.ExplicitLeft = 38
    IQComponents.HiddenPanel.ExplicitHeight = 294
    IQComponents.FormTab.ExplicitLeft = 4
    IQComponents.FormTab.ExplicitTop = 24
    IQComponents.FormTab.ExplicitWidth = 247
    IQComponents.FormTab.ExplicitHeight = 323
    ExplicitWidth = 255
    ExplicitHeight = 380
    Marker = 0
  end
  inherited DataSource1: TDataSource
    Left = 115
    Top = 85
  end
  inherited Query1: TFDQuery
    BeforeOpen = Query1BeforeOpen
    SQL.Strings = (
      'select distinct(u.user_name) as user_name'
      '  from '
      '       s_users u, '
      '       (select grantee as user_name '
      '          from user_tab_privs '
      
        '         where table_name = '#39'IQORDER2'#39' and privilege = '#39'SELECT'#39' ' +
        'and grantee <> '#39'RTBOX'#39
      '        union'
      '         select '#39'IQMS'#39' from dual) x'
      ' where '
      
        '       u.user_name = x.user_name /* ensure only current users sh' +
        'ow up*/'
      '   and s_group_id in'
      '      ( select distinct x.s_group_id as id'
      '          from s_group_roles x'
      '         start with s_group_id = :group_id'
      '       connect by x.granted_s_group_id = prior x.s_group_id )'
      ''
      '')
    Left = 116
    Top = 116
    ParamData = <
      item
        Name = 'group_id'
        DataType = ftBCD
        ParamType = ptInput
      end>
    object Query1USER_NAME: TStringField
      DisplayLabel = 'User Name'
      FieldName = 'USER_NAME'
      Size = 35
    end
  end
  inherited PopupMenu1: TUniPopupMenu
    Left = 88
    Top = 211
  end
  inherited IQJump1: TIQWebJump
    Left = 12
    Top = 91
  end
end
